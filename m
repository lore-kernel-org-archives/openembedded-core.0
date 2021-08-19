Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.72123.1629391243996970072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 09:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZBHWdffw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id u1so4240853wmm.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 09:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=HpupNfQxZwcanHB6mxS06WatBN3wYM3LjTR75JVRH1U=;
        b=ZBHWdffwQAYFovtoNglvJ7QNZeSPnIC18RH9xz25+ijkAScthbWgiG+2gpJTBuGEBN
         ZYtzHaiT/oiVFPJUQBz9drAL1+Iy9czE/H08pInwQcCETosr4GMcr9sv7cPJ5mJB4JFc
         7ZcTIb/7L+4wFt7zrIq2EizUWkth5VJkp+hDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HpupNfQxZwcanHB6mxS06WatBN3wYM3LjTR75JVRH1U=;
        b=IfErhjqvpfflXhJ9BgK1Wh2o7JeYj09Kh2XbhKZdF35vSj5Yd+Dg2aumwFJnZD5jUr
         aUlwvXJRtoA5DsGd/wINFTAv51yQva1I+DA8WA0EifpTToK+1XnkK0xl2wIbttGNEpM9
         V1/XxD2+67ZB22g+vKgIXZzaC040Q2jB/G5QPpwuDFIr9+vqIGC+5Bn8OluHPtVhppOF
         iAxitENNZq0p/5XUWTx2kH7lgiKrho5kHDEqP7VmSdVQhz/XNX8BVdSpyShKde/vwI4N
         p2CSJnYi/GmHjnVJ+67ue8Pceud5/Akmm+L5+sHnnqydYgml2UNH8ZFvqWyOOvqYrauH
         +BMQ==
X-Gm-Message-State: AOAM533FfLoBNNTzleiEiOZ9wOatuV3ljVCEaJ9jCTD+3qvLyAXyTB+p
	MtfRAe6HKzSoO8Xhd5Z/Imv04w==
X-Google-Smtp-Source: ABdhPJylcvS9R0MI3sETvWnZ9qRL00hnbdMgh24sfCH89CRzhVYSSxS6nL6LYaltOP7/VV5UZi4pjw==
X-Received: by 2002:a05:600c:511c:: with SMTP id o28mr9047488wms.135.1629391242319;
        Thu, 19 Aug 2021 09:40:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:893b:b0d7:8112:9a58? ([2001:8b0:aba:5f3c:893b:b0d7:8112:9a58])
        by smtp.gmail.com with ESMTPSA id c9sm3486789wrm.43.2021.08.19.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 09:40:42 -0700 (PDT)
Message-ID: <1793456cc0c08f82792d0862942d6c7b2bb3af22.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 19 Aug 2021 17:40:41 +0100
In-Reply-To: <AM9PR09MB464268B7229085D9F34B7E15A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20210714134248.21366-1-JPEWhacker@gmail.com>
	 <CAMKF1sqy4JmetZ43q7Nq0EFN1ooRBdR8uutxZxzi2QvuvU1SpA@mail.gmail.com>
	 <2ec0fd8d-a20f-c64c-b5c0-0c86b3a682a7@windriver.com>
	 <AM9PR09MB4642908F79699D4DD2839AF2A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <ba3db5ea7343701e5a78c5b55704bcedfb2106b5.camel@linuxfoundation.org>
	 <AM9PR09MB464268B7229085D9F34B7E15A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-08-19 at 18:31 +0200, Konrad Weihmann wrote:
> 
> On 19.08.21 18:06, Richard Purdie wrote:
> > On Thu, 2021-08-19 at 16:50 +0200, Konrad Weihmann wrote:
> > > I kind of missed out on this change... but I got caught up by reality
> > > hard this morning :-(.
> > > 
> > > I currently don't see a reason why zstd is required on the host - only
> > > systemd is having a hard dependency against zstd atm, while the other
> > > lately added references are just optional PACKAGECONFIGs (and there are
> > > plenty of them which have loose ends - in poky and meta-oe)
> > > 
> > > So the question I want to raise: why a hard dependency? wouldn't have
> > > been HOSTTOOLS_NONFATAL enough?
> > > 
> > > I mean this is the second hard cut in the project within just weeks and
> > > this time it was host related, which is even harder to fix in a timely
> > > manner in a corporate environment (basically rolling out changes to all
> > > dev installations isn't something I fancy on a Wednesday morning :-( )
> > > 
> > > None of the commit messages somehow mentions, why we all of a sudden
> > > need that on the host, instead of building it from sources (which should
> > > be possible judging from the latest master sources).
> > > 
> > > And on that note: that the documentation wasn't updated in the same
> > > changeset is very unfortunate (not even the crops container where updated)
> > 
> > Sorry the change is a bit of a pain. It has been in master-next for a while
> > and we did have to jump through a number of hoops as a project to enable this
> > (e.g. adding to buildtools and our autobuilder infrastructure).
> > 
> > The reason we're doing this is that we need to use compression within bitbake
> > itself for some of our output files. We've not done this in the past as it is
> > a pain to have the host prerequisites however there are multiple places we can
> > potentially benefit, such as compressed pkgdata and compressed siginfo files.
> > It is also possible we may be able to store a compressed parsed datastore.
> > 
> 
> Thanks Richard, that's explains why it's needed
> 
> > The siginfo files and datastore could mean we can improve debugging of a
> > number of currently hard to solve problems our users face.
> > 
> > Without this we're unlikely to be able to move forward in these areas. If we
> > do it, we open up new development opportunities and potentially improved
> > usability. We can't "just build it" as that would mean we can't use it within
> > bitbake itself.
> > 
> > Sorry this isn't well described anywhere, it is mainly as we can't yet
> > "guarantee" that this will do these things. We do know it won't happen
> > unless we try though.
> 
> Agree - btw maybe a good opportunity to insist on better commit messages 
> ;-)- just out of interest: is there any guideline, maybe it's worth to 
> at least link to a commit message guide at 
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded 
> or here https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines.
> And slightly off-topic, but maybe also worth to do some automation, as 
> I've seen multiple patches lately, that don't 100% follow the patch 
> guideline in place.

We had automation to test some of these things. It broke and we simply don't
have the maintainers to look after it and keep it working, it is simply too much
for Michael and I to manage to hold together.

I'm doing the best I can but I can't do this alone. Until we get more people
stepping up to help with things like the automated tests, we'll have to manage
with what I can do.

FWIW I had to spend a ton of time fixing buildtools, getting the workers to have
the right binaries and so on to merge this change. I tried to get the docs
updated but I didn't micromanage it and it didn't happen as yet. I'm aware of
it, I don't know if I'll just have to go and fix that next too.

So yes, I agree nice commit messages would be nice. Please feel free to help
review patches.

Cheers,

Richard





