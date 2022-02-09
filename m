Return-Path: <yoctoproject@neumann-web.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D5BC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 11:02:26 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.web12.25141.1644404545100333125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 03:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: neumann-web.eu, ip: 80.241.56.172,
 mailfrom: yoctoproject@neumann-web.eu)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4JtxmF57gcz9snN;
	Wed,  9 Feb 2022 12:02:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Date: Wed, 9 Feb 2022 12:02:17 +0100 (CET)
From: yoctoproject@neumann-web.eu
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"uvv.mail@gmail.com" <uvv.mail@gmail.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Message-ID: <914805773.15925.1644404537217@office.mailbox.org>
In-Reply-To: 
 <f59870ac746e69df1b05ac00c9db0025561e473b.camel@linuxfoundation.org>
References: <1540523266.294149.1643372553712@office.mailbox.org>
 <0c0df739719f528922ef60b1f6e553e3a1d114cf.camel@linuxfoundation.org>
 <1170434594.46461.1644247802042@office.mailbox.org>
 <f59870ac746e69df1b05ac00c9db0025561e473b.camel@linuxfoundation.org>
Subject: Re: [RFC] support for multi project toolchain-cmake
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 11:02:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161552

Hello Vyacheslav and Richard,

thank you both for your feedback,

On Mon, 2022-02-08 at 10:44, Vyacheslav Yurkov wrote:
> Any reason you set SDK to be read-only? Perhaps your use case can be covered
> by extensible SDK? I mean if you have some shared libraries between project,
> isn't that enough to extend your SDK to solve the original problem?

While we indeed do have shared libraries between projects, they are not
necessary of the same version. In general we don't want to enforce restrictions
on shared code between the projects (e.g. hinder different patch sets or
enforce specific versions), appart from the base distribution that is generated
with OpenEmbedded. If libraries mature enough that they can be considered to be
(mostly) stable, we have different processes to share it between projects.

On Mon, 2022-02-08 at 14:22, Richard Purdie wrote:
> We definitely don't support that usage scenario since it would be highly build
> system specific and would work in some cases but not others. I do have a
> suggestion of a different approach though.

After your first reply, I've expected this. The Bug report #14703 can then also
be closed, however I can only set it to RESOLVED and not something like
REJECTED, hence I would asked somebody else to reject the report.

> Have you considered creating a sysroot per project with a copy of the sysroot
> files?
> 
> This sounds like a crazy idea at first but with hardlinks for the files it is
> fast and efficient to create these sysroot file trees. This is exactly what
> OpenEmbedded does internally and how we handle this in our builds.

That sounds like an interesting alternative solution. We haven't thought about
it yet, but it will be something we're going to look into.

best regards
Tobias

