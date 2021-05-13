Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.1543.1620946107864369500
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 15:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MOyhbw4C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id v12so28282364wrq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 15:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=MBFy0q/xtf78EQW1tQo4TtjZZeIOBX50MY5WxuQ5Dws=;
        b=MOyhbw4ClNyuEOH7waYkOqYsL19QOP4gm+vFP/zP1xVfzWvomboJZGsAaPldAOSTkJ
         0hR6haNfGcjpZgPiHmE7acBDY2kcISsGZNQrS5/OkpXI8wIg6hY6cj0HdCLonPEE0ETk
         i3N83pcnwR62Jnmc0WdAc3Bu30MpeO0G+U4UU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MBFy0q/xtf78EQW1tQo4TtjZZeIOBX50MY5WxuQ5Dws=;
        b=D6Y5uKbP/aP8jcjQ51YgUU2mlpgcHxxtqxZWh15y3SlFEKSJshgy78Qp0JHOm5VfLb
         5PwEw5uSPjI40bhyJbZ6Ud6Vy1q2dGul8IzpEmgUziRxsDjn7k5/OIyja2VesZyBPibe
         Em6gnlg1zrH3L4INQB4MFSaGUBHzargykP7aIK2oL5QuX2lGDazBB2qOEs+4OYJozQWW
         z9C39Tu3GaxvaaqslSHTfIbt1iHdimtw6zPQn6t7d3OzzUqA4wW7zMA7pnHSYCDebM5E
         fipmNVMsfJvwcnrUhafwa/I+ynlMm0bCpnMgjcw6H5/q2f6rb8uuHt1WdJcc9L8MWLGY
         NI9w==
X-Gm-Message-State: AOAM530TKn5GyegSDGepli5IPqoXJIS1jidCvUdZrB6yia9i/3J0bIgA
	ZNGpnRaSx7Quq3ei/ZpZHHqo8g==
X-Google-Smtp-Source: ABdhPJxU2bbczSUJo9GZbGNfnoSrLFhp20WPnHABcj/XLn+rtiRczWBsssMmGcFTQX9VnVIfE4rVEg==
X-Received: by 2002:adf:e0c6:: with SMTP id m6mr56576258wri.66.1620946106332;
        Thu, 13 May 2021 15:48:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:87b3:98a4:71f:63a5? ([2001:8b0:aba:5f3c:87b3:98a4:71f:63a5])
        by smtp.gmail.com with ESMTPSA id r7sm3240320wmq.18.2021.05.13.15.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 15:48:25 -0700 (PDT)
Message-ID: <8b4047d54cf840b1b7ed06758c18ffcb725d151d.camel@linuxfoundation.org>
Subject: Re: [OE-core] master/main branch renaming and bitbake
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: colin walters <walters@verbum.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 13 May 2021 23:48:24 +0100
In-Reply-To: <720f0aff-891d-4186-b637-4b5e2ba0a598@www.fastmail.com>
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
	 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
	 <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com>
	 <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
	 <CANNYZj8yZ5Ays2dsPV5jkptLea0faY2uqd5_n6SeOFZdoqV8Gw@mail.gmail.com>
	 <CAJ86T=UjJ8J3aUL7YX03oa1fy7zAwPk9vp+=yYxGNfEKsNt6oQ@mail.gmail.com>
	 <5ceca668cfce15ebd8874fdaa9c01949fe1d95fc.camel@linuxfoundation.org>
	 <d1c5ed38-605f-4fa8-8ece-09a9dcc43890@www.fastmail.com>
	 <7ebd5f52982311726a6aebd89eba9cae07bdf999.camel@linuxfoundation.org>
	 <720f0aff-891d-4186-b637-4b5e2ba0a598@www.fastmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-13 at 17:33 -0400, colin walters wrote:
> 
> On Thu, May 13, 2021, at 4:08 PM, Richard Purdie wrote:
> > 
> > The advice to anyone hitting this issue is to add in the correct branch
> > to the SRC_URI. It is simple and easy to do, can be in bbappends 
> > or even changed via anonymous python and similar if necessary. We've already
> > found the issue with several core recipes, we simply updated them and most 
> > users didn't notice. I would even likely take that kind of change into older
> > otherwise unmaintained branches and I think I did so in at least one case in
> > the past.
> 
> What I am uncertain about is: how quickly does that translate into us being 
> able to remove the old branch?

My personal opinion is see the patches updating the SRC_URIs make the branches
given we know about this one and then do it.

> We're not the first project to do this and we won't be the last, so having a 
> solution here will be good.

I'm suggesting people update the recipes.

> Hmm actually I notice systemd upstream did the rename a while ago and they're 
> not carrying a `master` branch.  What's the difference between systemd and ostree here?
> 
> Is it the use of `SRCREV`?  Or no, in the systemd case is it because it's set to a tag?
> https://github.com/openembedded/openembedded-core/blob/2621dbbc1181808f18ca4ae79408d0d5b557670f/meta/recipes-core/systemd/systemd.inc#L18
> ostree is also using tags, is the recipe just broken in not using tags?

No:

SRCBRANCH = "v247-stable"
SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}

i.e. there is a specific branch specified.

> > I appreciate the tooling could do all kinds of magic things. I have a strong
> > preference for not adding magic into it, or over complicating it, it is already
> > horrendously complicated and a nightmare to test. I appreciate nobody believes
> > me, I only do my best to maintain it. The code is here for anyone interested:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/fetch2/git.py
> 
> Yeah, understood.
> 
> > I'd also note you can add ;nobranch=1 to the urls or ;usehead=1. Those do
> > have side effects, I will not recommend them, or accept them for general use
> > in layers I maintain, they're considered developer options. I was reminded
> > recently that we have seen bugs the branch parameter has caught where a 
> > revision was not where we thought it was so these do catch real world issues.
> 
> Well I hope the result of this discussion is a recommended best practice at least.
> If recommending using a tag works, that seems good to me.

People should add/update the branch in SRC_URI.

Cheers,

Richard


