Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12761E92729
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 18:49:42 +0000 (UTC)
Received: from smarthost01b.sbp.mail.zen.net.uk (smarthost01b.sbp.mail.zen.net.uk [212.23.1.3])
 by mx.groups.io with SMTP id smtpd.web10.23904.1696531779081379323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 11:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=l9KLCp40;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.3, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01b.sbp.mail.zen.net.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <mac@mcrowe.com>)
	id 1qoTPk-0001DK-Lq; Thu, 05 Oct 2023 18:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=JCtV07nT8EE4ul5Vz2brs6O+WskSARl54l4dNmCrBgE=; b=l9KLC
	p40zlJgHDMcoWsuWpBD2cqiUzKp74RCwLGW5vuKQxZlImPYChixRoFRsSMpv+DV7UM+lavkGLDxnO
	kVfMgHeLdlq5OovwsM0T82uygJsIN+l4ksissqnnSKdf37rpzXR3Uwlqj/YTMOqTDSMxismrFWPjY
	MRmSJE8M3Ob2z85YvttsbntyGJ89edEnb+Cp72ZuYp7NrlBQoVfuJ60V+baewzNY+qE6B8SGiTPQG
	A/u4/I9rRvZldviBbJ2KWCgR1hXi3OoKs4poh7Tmlk5xSxYqNTYm7z12YukDwvpAVAZuB3WsklKlV
	4rL1k1l5MPNTMHdpH3icXJtuv4BvA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1qoTPj-009xjN-0Z;
	Thu, 05 Oct 2023 19:49:35 +0100
Date: Thu, 5 Oct 2023 19:49:35 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Scott Murray <scott.murray@konsulko.com>
Cc: Steve Sakoman <steve@sakoman.com>, mac@mcrowe.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [dunfell][PATCH] glibc: Fix CVE-2023-4911 "Looney
 Tunables"
Message-ID: <ZR8FP8EoxdiM8RHQ@mcrowe.com>
References: <20231005085407.2200644-1-mac@mcrowe.com>
 <CAOSpxdb-qBLkj8D9afpucuB5AYqB+xjcP18HpSrUCG2AQcvEQw@mail.gmail.com>
 <b98ca516-ff3d-48fa-bb5b-15fe93db14b0@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b98ca516-ff3d-48fa-bb5b-15fe93db14b0@konsulko.com>
X-Originating-smarthost01b-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 18:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188728

On Thursday 05 October 2023 at 11:16:29 -0400, Scott Murray wrote:
> Debian's page at https://security-tracker.debian.org/tracker/CVE-2023-4911
> indicates at the bottom that they're only vulnerable on their 2.31 based
> versions because they backported the change that introduced the
> vulnerability, which I don't believe has been done in oe-core...

It has.

The openembedded-core dunfell branch is using glibc
2d4f26e5cfda682f9ce61444b81533b83f6381af. This commit is a successor of
8e88c0d8885f68d22f47b22969c273004c6e719f, which is the backport of
2ed18c5b534d9e92fc006202a5af0df6b72e7aca (as mentioned in the Qualsys
advisory) that introduced the vulnerability.

Mike.

