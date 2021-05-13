Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.2112.1620936744484904350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 13:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DbFwKwhH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id u133so3733784wmg.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 13:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=r1zOGpj5l0u38e1Puq9p35fjL2hRMju7dDI7hTcw6zg=;
        b=DbFwKwhHjnfV2kwhXvDvQrZVLL0BVsJ9+AnL3UIjfP8jFd8mzvSTbkmWuPVOcoV5Q+
         +KzOyIiBeQQtX/IKqqxjvi1QwEXYRO37HCK3fQzyiTOmHcNn7kYVbijLpvz1lggkqZdR
         +J6KYjoSqBglYMRKqE/vYdxZQK23cIkZ+N4Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=r1zOGpj5l0u38e1Puq9p35fjL2hRMju7dDI7hTcw6zg=;
        b=ngC+27aS8Eiu3MDyMfQNkAIO9ZSh/Lmum6xya874V2St6LdOVG6pqM8U4Ul3ZQ6oUw
         gsLb7is85FSqVVeClV3NomUXt9K2RJ/MyqE10ummLyxXNCpRCfGevPU8KgpO48Gj1QFI
         qaPQu8XTCwMTaYbJUUymnE/C4r1rD736kolEu7E+ynTzbtluinDxgOG5+UWLlJzBl+hw
         2/Lv79hT3hRfoeyWR8kJkTUa2MxpVBsmolo/3lknALv5dDprYSEecgAbveV3HvZtTafs
         wue03a5wGA5nvDPnWpOm6Xw+zgPxHz6FmuBJCpESY513DPzGlSDo+jNnaQZhjQx6Pbws
         QVbw==
X-Gm-Message-State: AOAM532nc2FFtxmAUnOOdSMwnZLHvP4D6ztQuoN3i2e9RopA+7gvfu50
	XgnV3oC4bAYshrIDq7t8hwzcUg==
X-Google-Smtp-Source: ABdhPJwQ0VmjA90A3BrTqPVa8/GeA2wiXUrj4InxNfoWHly7PdTatKoErOvWaa8/1a5S2Th6fIXJSQ==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr5576728wmh.102.1620936742975;
        Thu, 13 May 2021 13:12:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f649:3481:d239:bb03? ([2001:8b0:aba:5f3c:f649:3481:d239:bb03])
        by smtp.gmail.com with ESMTPSA id c194sm7173292wme.46.2021.05.13.13.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 13:12:22 -0700 (PDT)
Message-ID: <666de7863911bf856d4d9ef8bf939a24813ee913.camel@linuxfoundation.org>
Subject: Re: [OE-core] master/main branch renaming and bitbake
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Andre McCurdy
	 <armccurdy@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Colin Walters <walters@verbum.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 13 May 2021 21:12:21 +0100
In-Reply-To: <a1351cd03b2f45c6930ec9e7ef0f7d35@XBOX03.axis.com>
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
	 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
	 <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com>
	 <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
	 <CANNYZj8yZ5Ays2dsPV5jkptLea0faY2uqd5_n6SeOFZdoqV8Gw@mail.gmail.com>
	 <CAJ86T=UjJ8J3aUL7YX03oa1fy7zAwPk9vp+=yYxGNfEKsNt6oQ@mail.gmail.com>
	 <5ceca668cfce15ebd8874fdaa9c01949fe1d95fc.camel@linuxfoundation.org>
	 <a1351cd03b2f45c6930ec9e7ef0f7d35@XBOX03.axis.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-13 at 14:25 +0000, Peter Kjellerstedt wrote:
> > Another reason we have the branch name is so that we can ls-remote the
> > repo
> > when using AUTOREV for SRCREV. We've tried to make it so that once a url
> > is established in SRC_URI, you can make it use AUTOREV without changes to
> > the url itself. The AUTOREV code path is in parsing which does mean we
> > need to be efficient about the revision resolution.
> 
> Wouldn't using "HEAD" instead still maintain the same properties as using 
> "master", but with the added benefit that it just works for repositories 
> that decide to use some other branch than "master" as their main branch?
> E.g., using `git clone --single-branch` (without -b) fetches HEAD and 
> whatever branch it references, which is what we want, is it not?
> > 

See the ;usehead=1 uri option.

> > 
> One problem I have with the way the branch is specified is that it is a 
> URL parameter. This means that when I want to add a bbappend to specify 
> another SRCREV, it becomes problematic if that SRCREV is on a different 
> branch than what the base recipe uses. It basically means one has to 
> use SRC_URI_remove to remove the original URL for the repository, and 
> then add a new version of the URL with SRC_URI_prepend. This obviously 
> is unrelated to the discussion about main vs. master, but I would very 
> much like to see a new variable, e.g., SRC_BRANCH, being added to 
> complement SRCREV. There is an edge case for recipes that use multiple 
> Git URLs in the SRC_URI, but they are rare, so having to specify the 
> branch using the branch= parameter in the unlikely event that those 
> repositories need different branches should be acceptable.

This is getting a little sidetracked from the original discussion. I believe
anyone changing branch urls like that can probably parameterise the url
themselves and there isn't generic demand to add more complexity...

What I do suspect we need is the ability to change url parameters in 
mirroring url mappings, which could possibly help for a few of these 
cases too. There is an open bug for that, I keep meaning to try and sort
it out.

Cheers,

Richard



