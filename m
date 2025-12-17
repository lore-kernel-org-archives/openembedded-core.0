Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06312D65C72
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:49:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18165.1765986565971194398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CpZzcE+R;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 28659C1A5A0;
	Wed, 17 Dec 2025 15:48:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD5B96072F;
	Wed, 17 Dec 2025 15:49:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79AA3102F0AD5;
	Wed, 17 Dec 2025 16:49:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765986559; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fAz2FN8xlEKGYDxsco8x7IJzXTWk30e/kXoHprYax5o=;
	b=CpZzcE+R0lXi7J5g5PZJbgTjL/p4osLi/4YxAngjTqejjiSCFrAc0M7EQyopMf5JmSz70J
	uZym5a5iDDiPs0lro5psY4DfSFdpo9kfrWvUSY12/Wdb8npglCKXmQnBDDyKSVGBmwGfu7
	nvYdnSMlYK4NhP5YW1hk/ExWDtzLwR8xHIFFf8Fh2vOhWbR7M/fQkxxK+0LOS/HOrOSrTC
	ziH59kpaLI/525Nwz/AdM1RWnuy97GzIdMrnGkuV/q8NLfoeQLGB5gKr3tygh/4fsxxS74
	HJwrJWjzSlofwM2dxo2w/TiLy1AazETKJ/oXIY5ck+9NVPn+jGuR/75NCkz+pg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 16:49:17 +0100
Message-Id: <DF0LZKG2H116.1SNE235TEG058@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/2] python3-pyzstd: import 0.17.0 from
 meta-python
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Koen Kooi" <koen.kooi@oss.qualcomm.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251217093409.914045-1-koen.kooi@oss.qualcomm.com>
 <20251217093409.914045-2-koen.kooi@oss.qualcomm.com>
 <DF0KOAGYU1ZY.399MUHSJMJ1BP@bootlin.com>
 <F86DDF1B-F439-4E6C-9335-8C8EA388F862@oss.qualcomm.com>
In-Reply-To: <F86DDF1B-F439-4E6C-9335-8C8EA388F862@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228063

On Wed Dec 17, 2025 at 4:09 PM CET, Koen Kooi wrote:
>
>
>> Op 17 dec 2025, om 15:47 heeft Mathieu Dubois-Briand <mathieu.dubois-bri=
and@bootlin.com> het volgende geschreven:
>>=20
>> On Wed Dec 17, 2025 at 10:34 AM CET, Koen Kooi via lists.openembedded.or=
g wrote:
>>> From the upstream website:
>>> Pyzstd module provides classes and functions for compressing and
>>> decompressing data, using Facebook's Zstandard (or zstd as short name)
>>> algorithm.
>>>=20
>>> This recipe is being moved over for systemd 258.x, the 'ukify' tool
>>> depends on this.
>>>=20
>>> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
>>> ---
>>=20
>> Hi Koen,
>>=20
>> Thanks for your patch.
>>=20
>> It look like this is failing on the autobuilder in various
>> configurations, probably only with poky-altcfg:
>>=20
>> ERROR: python3-pyzstd-0.17.0-r0 do_package_qa: Fatal QA errors were foun=
d, failing task.
>> ...
>> ERROR: python3-pyzstd-0.17.0-r0 do_package_qa: QA Issue: supports ptests=
 but is not included in oe-core's ptest-packagelists.inc [missing-ptest]
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2848
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2837
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2894
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2848
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/2829
>>=20
>> Can you have a look at this issue?
>
> Sure, but I have no way of testing that patch :) V3 is on its way.
>

This is a build-time issue, so I suspect you should be able to reproduce
it with:
DISTRO=3Dpoky-altcfg bitbake python3-pyzstd

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


