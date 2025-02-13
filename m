Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC6BC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 20:32:34 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.4206.1739478746760600742
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 12:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c1nFT3gP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso9131865e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 12:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739478745; x=1740083545; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcHl2lyGdeuULGqfAcuuF9yRJOWMBR7rFwJnJAt+xyI=;
        b=c1nFT3gP1Z4osLBS01J3FgEoZKJMrKPfkq3uLFFhwvJKUpGKDk7AJXbmu3zyAJwyI5
         lujK6IQsgAdMJwJ2NDab/dcO6Etxq4rr3ZcMARBKM9df9wCWzh5TvtvGpsFAl9bOZkL2
         CNg9bmVmJp9T1sax73HaMbxPQXUZftl2rRP2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739478745; x=1740083545;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YcHl2lyGdeuULGqfAcuuF9yRJOWMBR7rFwJnJAt+xyI=;
        b=CMJuPhlncpcEKQWBGTrqF0mnCgs/LVJg0itDlCWw9RvgJcgRlSHMPk2Lvt69mJ3Bt1
         fjy2F4PbhhPvndFEfE9zz/o9XGbtfl5r02rqNRsASb5aJdJwxJE3949qhFqSjnp4IJhg
         Juei9xnlaVRSjhgXtDy+CIqH6bROC6P2X2fb4StZhdNSZVakT9tNYAKbsMRJirvfN748
         YpRY8r22yHM1KaLGgKRKtlP+ZezvONjAyvvJUpFKLOP3D00DjjAhcIO2iKY34UiOQwLN
         98OFihXluJSomzB6iGOP9Wr7AYWlpyRiwHG5AoKEqwnd0cVG/qlXpkqJvbGPfwzysli1
         GAVw==
X-Forwarded-Encrypted: i=1; AJvYcCUZOoD6v+zpACuLk4T7S1QlJPFKR6RFayWmWHfzHL2CRvKM2x1pKuXcoU+NrpzUlMHQu2rIMG9wh+KHkhnzR2y6qg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzwsud4a5unS5+lrisHUzoFrUBBcrxZSw36tXathG/CZZ4P2d4w
	zD8P2ce6/ZGDcFmZeEgFLxIw/4hXCFimBozPSKZYzjBaw3Z9et2MN+WOK5t9xaQ=
X-Gm-Gg: ASbGnctMAdLqSY79cTTfdEJjZ8JLVc8fTMOIXw1XajwiRwe9SRDeO9STKnD+ePosjJz
	FkmZ5t3iBrM892jGolZrLfmho+QXLj6CXt5XQ2cEVaHa0fLN85Kzvjqp8plM6VvemxDAkrqaYB5
	OOGTxwY1Ptx6e0iOra0GwAVgqx0Zw6yeb9ZChVD/EDn1mXTCaagzqSYymfS8tOTP1Dn2x+3FBi5
	tpy9bcJX0MUTR1dpaC5+KBxlr1NBKcl1ZioDQY2vYgQA7JLzFeyw5TddICqPteF4DnsffTYMfgL
	8unUF99SKHLfySx2IDlXk4XUD0aFAcAUXQg2EMDL6jFlz7Hdr+9ZeAsDEH3YwSbyLiVDyDNnkzv
	v67O9
X-Google-Smtp-Source: AGHT+IGx7MQ3/RRWew/QLaMDBPEuVSAvTkrTwVtEvQeZagg1X2n88RQITr/7RntOAIokxunwvPeAuQ==
X-Received: by 2002:a05:600c:a4a:b0:439:57b5:f8a0 with SMTP id 5b1f17b1804b1-439601ab838mr59792765e9.24.1739478744945;
        Thu, 13 Feb 2025 12:32:24 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4bd7:b79c:cc4d:93dd? ([2001:8b0:aba:5f3c:4bd7:b79c:cc4d:93dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43961884f88sm26446955e9.28.2025.02.13.12.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 12:32:23 -0800 (PST)
Message-ID: <977d6eb4f27c47c19a7a9852fe61bea9e5af0968.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] 'vendor' fetching discussion cont.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>, 
	openembedded-core@lists.openembedded.org, Bruce Ashfield	
 <bruce.ashfield@gmail.com>, bitbake-devel
 <bitbake-devel@lists.openembedded.org>
Date: Thu, 13 Feb 2025 20:32:21 +0000
In-Reply-To: <f0f37aa4-8a69-4340-87ad-18f39bb4f43d@weidmueller.com>
References: 
	<4cea4488ef3181471373f3dca26ac390203a90cb.camel@linuxfoundation.org>
	 <f0f37aa4-8a69-4340-87ad-18f39bb4f43d@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 20:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211369

On Thu, 2025-02-13 at 17:33 +0100, Stefan Herbrechtsmeier wrote:
> =C2=A0Am 13.02.2025 um 11:43 schrieb Richard Purdie via lists.openembedde=
d.org:
>=20
> > Most of the concerns I've seen are about how easy it is to understand
> > what is going on behind the scenes. The move of code to OE and
> > splitting everything into multiple tasks/stages does do that to some
> > extent but it does it in a way which I think is going to create a new
> > and different set of problems.
> > =C2=A0
> >=20
> >=20
> >=20
> =C2=A0Okay, but please keep in mind that some of my oe patches are
> reasonable independent of the native bitbake fetcher and it is
> possible to integrate the steps from the early class into the fetch
> task.

I appreciate that and I appreciate the desire to push things into OE as
it appears easier. It can lead to much looser APIs and less structured
code and I'm wary of it here as we create a two layered system which I
think will be harder to understand (and hence harder to debug and use).

=C2=A0=C2=A0
> > I'm therefore wondering if there is a different way. The changes
> > I'm
> > wondering about would be to:
> >=20
> > a) embrace the single SRC_URI entry
> >=20
> > b) require a checksum of the internal "URL list" that is included
> > in=C2=A0SRC_URI, much in the same way that we have checksums of
> > tarballs.
> > =C2=A0
> =C2=A0The list isn't fix because it depends on the configured package
> manager proxy or registry. We have to remove this feature. But the
> user could use a PREMIRROR to redirect the upstream proxy to its
> private proxy.

If that is true we have a huge problem.

By list I mean a list of something like (component, version) pairs
where component uniquely identifies the component and version is a
specific verifiable version of that component. If we can create that
list, we can checksum it and use it as above. If we can't create that
list, we have no idea what is in our builds and we may as well give up
as it isn't reproducible.

> > For better or worse, we have low trust in the underlying tools to
> > get this right (they are getting better).
> > =C2=A0
> =C2=A0
> We don't need to trust the tools. We parse the lock file and enrich
> it with fix values. The resolve is deterministic. The output only
> depends on the resolve function, variable values and lock file
> content.

This assumes the "resolve" always does the same thing. I'm afraid
experience shows these can have issues. I'd much rather we have some
kind of backup in the system which tells whether we did get the same
resolution which is what this checksum represents.

> > c) if the checksum doesn't match, we know something went wrong and
> > error
> > =C2=A0
> Can you please elaborate this point. We already check the integrity
> of the lock file and we have deterministically resolve the SRC_URIs.

See above. I'd like to know that the list of components and versions we
resolve everything to matches what we expect it to look like.

> > d) require the new modules to write the URL list into a known
> > location as part of unpack
> >=20
> =C2=A0Why is this needed? The generated SRC_URIs could be resolved via
> fetcher.expanded_urldata().

If someone is trying to debug what the code did or resolved things too,
suggesting they run python functions to work it out will be a poor user
experience. If on the other hand they know the result is always stored
in WORKDIR/xyz/ABC, the know where and what to look at.

The user experience of using this code will make or break it's
adoption.

> > e) add the ability to add custom hooks in the fetch process to
> > handle
> > the cases of needing to alter the flow for patching the components
> > list
> > =C2=A0
> =C2=A0I'm afraid this will be complicated since PATCH is applied in S and
> not in UNPACKDIR.

Then we should work out how to handle that. We could allow the recipes
to specify the top level dir to apply patches from for example?


> > f) create new tools that allow the fetcher to be stepped through
> > and
> > for example partially run, or run with clear debug output showing
> > what
> > was happening at each stage (show the list of components?). This
> > may be
> > standalone tools, maybe a devtool module, I don't know. We may want
> > to
> > make the fetch/unpack logs more useful in general as right now you
> > don't get much useful data about what it is doing.
> >=20
> >=20
> > If we do those things, where does that get us? How much buy in do
> > our
> > different stakeholders have?
> >=20
> > FWIW I am leaning towards having this code in the bitbake fetcher
> > as a
> > first class citizen as to do otherwise is going to create layers of
> > abstraction and we probably have enough of those already.
> > =C2=A0
> =C2=A0
> The advantage is that the SRC_URI still contains the dependencies if
> you expand the urldata. On the other side the integration of the
> patches in the fetcher sounds complicated.

Patches would stay where they are in the system in do_patch and use the
code in OE-Core. I'm just thinking we could add some hooks in the fetch
process to allow adjustment of things like the resolved component list.
It doesn't have to be a patch, it could be a function passed data.

Cheers,

Richard


