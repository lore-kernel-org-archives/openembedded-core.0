Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC325FD8FF2
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 18:15:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76673.1772129699183912406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 10:15:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I7KGuKkQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7DA624E4123C;
	Thu, 26 Feb 2026 18:14:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B3165FDE9;
	Thu, 26 Feb 2026 18:14:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C6EB103686E1;
	Thu, 26 Feb 2026 19:14:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772129696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hVaCCahjWBL/+r4Abn9Slt5yoWeQQ7czUUJvndRXztA=;
	b=I7KGuKkQu+ZPwrmCXmozV7RojGhrag4oRbbDQIwJRjJAlMG4fIafTvZ/wmBJS/VAVXMnot
	q3kMhKBgjTmhK495RFja8egT0iUL2B/hNDsEMGgCpMa1DrXNi/RyzHy573MqKmNQwES3m3
	pX1dXo1/NdWkrIRuzj6f1a+5lHLCSJZVw/ijrvQ+b/i8+Ubdu/uZznQOyw0qg4CGZBwS8X
	WpT7jGC7BSKZyLOn2OXwlxvvId0CJzw1h2YQuB+PiRrSlneIS595g6Pn+a2AXkYcmxMo1k
	LD/kHgtpmmMYh0IhaZv2uLOAFRNXdLwvvD6y/tABs30T5FpzCWYMI/U82ZmA4Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 19:14:51 +0100
Message-Id: <DGP3JP9X4ICJ.CFLI2RD62CME@bootlin.com>
To: "Randolph Sapp" <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
 <alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
Subject: Re: [oe-core][PATCHv15 1/6] emptty: add version 0.15.0
Cc: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260203012028.4008229-1-rs@ti.com>
 <20260203012028.4008229-2-rs@ti.com>
 <DGD4VEZTM65I.2V08DA6RR8L95@bootlin.com> <DGP3FIMYUJ4C.GDARTKLCQ59E@ti.com>
In-Reply-To: <DGP3FIMYUJ4C.GDARTKLCQ59E@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 18:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232059

On Thu Feb 26, 2026 at 7:09 PM CET, Randolph Sapp wrote:
> On Thu Feb 12, 2026 at 10:45 AM CST, Mathieu Dubois-Briand wrote:
>> On Tue Feb 3, 2026 at 2:20 AM CET, Randolph Sapp via lists.openembedded.=
org wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
>>> relatively lightweight display manager that supports x11 as well as
>>> wayland through both a CLI and an automatic login mechanism.
>>>
>>> This can effectively replace the custom init scripts for both x11
>>> (xserver-nodm-init) and wayland (weston-init) with a single tool with
>>> more verbose logging capabilities.
>>>
>>> This is split into two recipes. The emptty package provides the binary
>>> and various agnostic configs while the emptty-conf package provides the
>>> default configuration for the application itself. This RPROVIDES
>>> virtual-emptty-conf, allowing other recipes to provide their own
>>> configurations to override the default behavior.
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>
>> Hi Randolph,
>>
>> This patch has been in my branch for a week now, but we are seeing some
>> intermittent reproducibility issues.
>>
>> I opened a bugzilla entry by error, as for a second I thought this patch
>> was merged, so details can be found here:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16171
>>
>> Diffoscope output is here:
>> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260212-ssslvz=
6_/packages/diff-html/
>>
>> Can you have a look at what is going wrong please?
>>
>> Thanks,
>> Mathieu
>
> Now that the source epoch has been addressed [1] should I resubmit this v=
ersion
> of the series? I won't be changing anything since the RFC [2] for the oth=
er
> issue reported on this series didn't get any comments.
>
> [1] https://git.openembedded.org/openembedded-core/commit/meta?id=3D70a74=
fa2bd9c374bd07b89b426a86991b1d93a5f
> [2] https://lists.openembedded.org/g/openembedded-core/topic/117730556
>
> - Randolph

Hi Randolph,

No the action is on my side, I just forgot to take back your series when
I took the source epoch fix.

It will be part of my next build, thanks for the ping.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


