Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449F1C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 15:45:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.12855.1686239095884207234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 08:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=E5JLCKVG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30ad99fa586so769334f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 08:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686239094; x=1688831094;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EVXpETEHLul/eY3ZKMa6rVpcgGqKprs6vKKVrZtPdtw=;
        b=E5JLCKVGLkzofUMtYBjCFbKmpU3ff33ChtV3hZ7XvMwC9fp8mNE03FDXvDmtgak46E
         j2VZphKMhWfiK9L6ao9Zha8RtgCXy+sZRdQXjmuzQfJScPNgym16pAUU7Mf+Twj/DKwg
         //2kpHJ2jU3ZyWVln1SNI1F285WZ5JRXU24k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686239094; x=1688831094;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EVXpETEHLul/eY3ZKMa6rVpcgGqKprs6vKKVrZtPdtw=;
        b=X67Ov65VoOO1pxKUNpfboLkSSKvw0klpFWHvtu129nsAsrs0sGrUUzCa9XAnqjTUTf
         UUoQGhp6jyn06aX6ebxjlzJNeBjvntedF88RVmq6L3Q+nZEe9ZH5J7iw1KjLE2DMZPo9
         Td2pSYRS4bkRBIwoa8eQcgLe9OV0hebRqbBR6OCaut+HkCu1ZEbDQLPhKHHRtZ11e6qU
         tV29lm5gXqK+/HKNQwxOg9ipb/SWVbVP2FdKZ0GGYOiQprA7T6Ly+y1mIjDpgFWo1xdq
         pYsSbzFESaboQjUscVZ3F1V8tNqhO5WjNDxG/DtrqMjeqLY85V67cZDgCd4sCqb2DInc
         ZNLw==
X-Gm-Message-State: AC+VfDzmi4Ns9VyTGVsHBJrISK51Uc/gTrqD0GqYxYcsrzjU/+HMLyx/
	20J8GRopHrsgyYXpqUicLOB+dQ==
X-Google-Smtp-Source: ACHHUZ5poWoiDrnkl8xbuvpWDEn2486CQ9Rm/glfmNmxup9eUj3faof6FWIBHJ9bl5pRHUMQHZU/jg==
X-Received: by 2002:adf:f810:0:b0:309:54b6:33b0 with SMTP id s16-20020adff810000000b0030954b633b0mr7217726wrp.44.1686239094002;
        Thu, 08 Jun 2023 08:44:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:316b:ce77:4e88:2f02? ([2001:8b0:aba:5f3c:316b:ce77:4e88:2f02])
        by smtp.gmail.com with ESMTPSA id o7-20020adfeac7000000b002fed865c55esm1939193wrn.56.2023.06.08.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 08:44:53 -0700 (PDT)
Message-ID: <ab9c352c2fe8518b6886fe1eaaf926512a314bdc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5] qemu: Split the qemu package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Jun 2023 16:44:52 +0100
In-Reply-To: <CADkTA4O5=PNOmmKtJPE8YYJfiynMQXA1hyjaX=wuW2ydw6evbA@mail.gmail.com>
References: <20230607205347759a5df5@mail.local>
	 <20230608054525.3293334-1-mingli.yu@eng.windriver.com>
	 <CADkTA4Mj2WdncdduX+P6fT8HU0KjkS6+vjTePbhPc0FXL2d_CA@mail.gmail.com>
	 <7326285b062d6b494d9933270bb5811b83e81e82.camel@linuxfoundation.org>
	 <CADkTA4O5=PNOmmKtJPE8YYJfiynMQXA1hyjaX=wuW2ydw6evbA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 15:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182512

On Thu, 2023-06-08 at 11:03 -0400, Bruce Ashfield wrote:
>=20
>=20
> On Thu, Jun 8, 2023 at 9:55=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2023-06-08 at 09:33 -0400, Bruce Ashfield wrote:
> > > At this point, you can probably see why I ended up using the
> > > explicit
> > > variables and overrides versus python when doing the
> > > meta-virtualization splits. :)
> > >=20
> > > I have a few more comments that I made in v1, that I haven't seen
> > > directly handled or replied to.
> > >=20
> > > My only remaining concern (and it may just be my own concern), is
> > > that
> > > there's no way to change this packaging split. Either you take
> > > the
> > > programatic split, or you take the -all packages.
> > >=20
> > > Other packages (glibc, kernel-modules) have a variable that
> > > controls
> > > whether the split happens or not, I'd like to see something
> > > similar
> > > here .. but I do realize that it makes test complexity more, and
> > > that
> > > Richard normally doesn't like conditionals like that.
> >=20
> > I only "like" conditionals if it is a code path that will be well
> > travelled, otherwise we tend to find one of the paths is broken. I
> > don't think we need to make this conditional.
> >=20
> > > Alternatively, did we rule out using PACKAGESPLITFUNCS to add the
> > > splitting routine ? With that, we could remove the processing in
> > > places we don't want it, in particular for the native/sdk builds,
> > > as I
> > > found that we really don't want the splitting of qemu in those
> > > scenarios.
> >=20
>=20
>=20
> Can you think of a problem with the PACKAGESPLITFUNCS=C2=A0method for thi=
s
> packaging split ?
>=20
> At least that way I could inhibit it from my other layers, versus
> with this prepend, I don't see any options to have my own package
> splitting.

We can do this in a PACKAGESPLITFUNCS function. I guess I'm just
nervous of having too many different ways of packaging qemu as I was
hoping we could get something which would work for all users.

Cheers,

Richard

