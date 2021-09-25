Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65613C433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 09:18:39 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.5220.1632561517983461900
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 02:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XTRJih+1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t8so34780374wrq.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=m2C3cVRteHA7DaWJVZCGpJIXmkdl20A+O3grseOvuJ8=;
        b=XTRJih+1caLscgwpi4MwMptWh2+izziVjZr+haWmXOm9HlxAt7uhErMiUstsE05Z2k
         DnAMTpYipsleV0TJoSf4ao6DS3E3+ifZriK/YmnbVWap6YvnTdnIfiUq0R6c/sPypVO3
         B70DA6fEaj0ETB5Fr1CN0vcxhXv2L8rKahq2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=m2C3cVRteHA7DaWJVZCGpJIXmkdl20A+O3grseOvuJ8=;
        b=RZX+QFGjSXO8YG9lClmRMZpepyt4zI14xaHvHdvoPWkRtyHsoWmfbB5OZ5yI1IBfN7
         IHqIjPeD9yxJGiWBNrdtC2ZBh6pXnpCED4yuAeMn4OMLAaqgOFTzNQUW7qXKEjYARIoR
         JFVxYN0W+pwI2tjq9qSLGpeza3krB3YhEtN7QoJy3g6vTMcwK8yJn9mjVuE6Kz789Y7X
         IeHfavjfTDTfo1Eln5CVrzuz9RS9NhdmySv9RIud94wjzkEchLgjP+Us+sUz4gQrGzlh
         PY4DqW7w8UWHlz1lANmIrNadqKB3/2AX2DIYtcsp118/pVdLsnqGkbRu3xhEOLLVNhC2
         FzoA==
X-Gm-Message-State: AOAM532XvgKpxqPao5u5GuG8SepPR5Qk9jAEzcaVGbrmGVSneR1Qn2Xc
	+3rJDtJQyVKC6S1GFgwjUM/n3g==
X-Google-Smtp-Source: 
 ABdhPJyMDQqxsJCx6wAfxb/vcricbnUmMb0YSU/dx5+FelDp6kF102tKMUb1lc/eM0NJaoVGrikhPA==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr6436394wmc.108.1632561516065;
        Sat, 25 Sep 2021 02:18:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2185:dd9d:1e31:557d?
 ([2001:8b0:aba:5f3c:2185:dd9d:1e31:557d])
        by smtp.gmail.com with ESMTPSA id 8sm3688072wmj.18.2021.09.25.02.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 02:18:35 -0700 (PDT)
Message-ID: 
 <f819c66c154fda5ab2bb91702ed8fb1d14bfa20f.camel@linuxfoundation.org>
Subject: Re: [OE-core] user/group XXX does not exist, using root with
 RPM/DNF packaging in Hardknott and Honister
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zboszor@pr.hu, Mark Hatle <mark.hatle@kernel.crashing.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 25 Sep 2021 10:18:35 +0100
In-Reply-To: <77b48aa1-3f41-3185-d820-9f956ce48a2a@pr.hu>
References: <dc967621-9759-1ab4-e526-36f9010ae3c0@pr.hu>
	 <c1c5df22-9bed-6d90-6d04-aec9e44a4efd@kernel.crashing.org>
	 <77b48aa1-3f41-3185-d820-9f956ce48a2a@pr.hu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 09:18:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156342

On Sat, 2021-09-25 at 10:48 +0200, Zoltan Boszormenyi via lists.openembedded.org
wrote:
> On 2021. 09. 24. 19:17, Mark Hatle wrote:
> > 
> > 
> > On 9/24/21 9:02 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
> > > Hi,
> > > 
> > > I have a special package that creates users and groups
> > > via inherit useradd. This package doesn't depend on any
> > > others but it is depended on, both via DEPENDS and RDEPENDS
> > > by packages using those users/groups in their do_install
> > > scripts.
> > > 
> > > This works for packaging becase these ownerships
> > > are encoded in the packages, confirmed by rpm -qp --dump ...
> > 
> > Does it show the useradd in the _PREINSTALL_ (you can use --scriptlets in the
> > rpm -qp)?
> 
> For the package that adds the users, yes.
> 
> > 
> > > However, during do_rootfs, a couple of
> > > "user/group XXX does not exist, using root"
> > > messages appear for the packages depending on others
> > > creating these users/groups.
> > 
> > Do the using packages contain RDEPENDS on the package that adds the user/group
> > to the system?
> 
> My bad. One of my custom packages did not and the
> warnings were printed by that single package.
> 
> On the other hand, clamav-freshclam (both in meta-security
> and my layer where I forked an older version of the recipe)
> do not have an RDEPENDS on clamav. Instead, it's the other
> way around.
> 
> There the problem is that clamav-freshclam is shipping
> /var/lib/clamav that should be owned by clamav:clamav.
> meta-security works this around badly by using chown in its
> pkg_postinst which is NOT marked as "ontarget" so if clamav
> is included in an image, then that chown doesn't take effect
> and e.g. freshclamd (running under the clamav user) cannot
> populate /var/lib/clamav with the current virus database.
> 
> 

That sounds like a bug in clamav-freshclam which needs a dependency adding?

Cheers,

Richard


