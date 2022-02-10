Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2344C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 11:45:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.9008.1644493501689918338
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:45:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LqNY5On4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id r131so3280292wma.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=hmShjgFUHIneWlGhO7cVBJ1zcYGVMmyEWOgHcPn7PaM=;
        b=LqNY5On4cvPlkVS900MuKFhUB7EqGJk6oCntzMumycKbQTNyu23d/UVCwDpHQD7n+q
         vOynU+xGMUQnctprCuHXqG+jd/yDmIydWLO4N5wPyfwHzZZxAMW0OiKPTH6BQXYzxkdu
         jMZ0kKddWqKTvl1g3ctlw5Ra8wCYi6724Q7bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hmShjgFUHIneWlGhO7cVBJ1zcYGVMmyEWOgHcPn7PaM=;
        b=nt0Kl8yvxvT6zrfqiOnIQPQsfqLrYbh6GEBncp8KGbDxRyGdL6Eg6SAsH0a4I7BzOX
         CQqzCnzJh2p7LoPJJL0lQd/UvdkE92uj2fuugm6NUefMiAs2ZTzG3oBU/Yc+IuJmihfA
         Xq/TeuxJhN3+tLxQ0Ut3ItM9hXMNCS2X1anBQh82CUMohNZT9eHYyHdalELaQyvSAPs2
         D6H8qEBNupHG9JOl/F1Uhd5JMib6LqFc2j9iGD9g0zvf0IuscTFwcuKQnEPt8p086bnO
         vMqyc6WGHI9b+U01oomaxOOTWQOUt0qFyHeZqjBfY6vtujsUa6VWV7BOpuJEUfNcrXdB
         stmA==
X-Gm-Message-State: AOAM533HPg9Sc+rCwOs5LUQPAn/RQTjBe3fBBFTVYBMP7eL1ijcM9pJS
	/zdVp7L2UcW9/rJr1ve9c2cQqQ==
X-Google-Smtp-Source: 
 ABdhPJwCH1Ji7Ncm2retDyXpNH+sAjZ1cJR1uaYfVGHZ8nnhPRsy1DfVXs/GMb0RqnlUMyMJntgiKg==
X-Received: by 2002:a1c:a550:: with SMTP id o77mr1796653wme.121.1644493500178;
        Thu, 10 Feb 2022 03:45:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7dcb:9837:5409:449e?
 ([2001:8b0:aba:5f3c:7dcb:9837:5409:449e])
        by smtp.gmail.com with ESMTPSA id
 a13sm1148078wmq.28.2022.02.10.03.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 03:44:59 -0800 (PST)
Message-ID: 
 <07741fd637b02441dc5f8a5e61913d2c388513ad.camel@linuxfoundation.org>
Subject: Re: [RFC] support for multi project toolchain-cmake
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yoctoproject@neumann-web.eu, "uvv.mail@gmail.com" <uvv.mail@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Feb 2022 11:44:58 +0000
In-Reply-To: <914805773.15925.1644404537217@office.mailbox.org>
References: <1540523266.294149.1643372553712@office.mailbox.org>
	 <0c0df739719f528922ef60b1f6e553e3a1d114cf.camel@linuxfoundation.org>
	 <1170434594.46461.1644247802042@office.mailbox.org>
	 <f59870ac746e69df1b05ac00c9db0025561e473b.camel@linuxfoundation.org>
	 <914805773.15925.1644404537217@office.mailbox.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 11:45:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161609

On Wed, 2022-02-09 at 12:02 +0100, yoctoproject@neumann-web.eu wrote:
> Hello Vyacheslav and Richard,
> 
> thank you both for your feedback,
> 
> On Mon, 2022-02-08 at 10:44, Vyacheslav Yurkov wrote:
> > Any reason you set SDK to be read-only? Perhaps your use case can be covered
> > by extensible SDK? I mean if you have some shared libraries between project,
> > isn't that enough to extend your SDK to solve the original problem?
> 
> While we indeed do have shared libraries between projects, they are not
> necessary of the same version. In general we don't want to enforce restrictions
> on shared code between the projects (e.g. hinder different patch sets or
> enforce specific versions), appart from the base distribution that is generated
> with OpenEmbedded. If libraries mature enough that they can be considered to be
> (mostly) stable, we have different processes to share it between projects.
> 
> On Mon, 2022-02-08 at 14:22, Richard Purdie wrote:
> > We definitely don't support that usage scenario since it would be highly build
> > system specific and would work in some cases but not others. I do have a
> > suggestion of a different approach though.
> 
> After your first reply, I've expected this. The Bug report #14703 can then also
> be closed, however I can only set it to RESOLVED and not something like
> REJECTED, hence I would asked somebody else to reject the report.

I've marked it as "resolved WONTFIX" and added a comment summarising the
discussion here.

> 
> > Have you considered creating a sysroot per project with a copy of the sysroot
> > files?
> > 
> > This sounds like a crazy idea at first but with hardlinks for the files it is
> > fast and efficient to create these sysroot file trees. This is exactly what
> > OpenEmbedded does internally and how we handle this in our builds.
> 
> That sounds like an interesting alternative solution. We haven't thought about
> it yet, but it will be something we're going to look into.

I think/hope it should solve your probably and give you a relatively powerful
solution that isn't cmake specific.

Cheers,

Richard


