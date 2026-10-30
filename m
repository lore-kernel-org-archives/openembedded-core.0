Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13368.1793371960988723886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 07:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=guxMoSIa;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D9C831A13C7
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:52:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FA8E603C2;
	Fri, 30 Oct 2026 14:52:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2957C103290DC;
	Fri, 30 Oct 2026 15:52:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793371954; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=mUD56LMrBTdyCgGnGT7Lh5BofM1HXS5CoXmHl8WgYzI=;
	b=guxMoSIaN0ArxOtmxoaxEul5QOH4DHvdvuxW2NQtRrDeft0L6u8+F+IQnHH2QoHhq5OFy9
	7EuDn/0eamyk44JUkKBOFk2QmKX94PDyBqP0KuU05zaNoqlk+XXeluffl8cJMUC1J2yBBK
	ZrzdPcfKHd2iuoMyVR6nSjzbhmn4Yuf7LHbtF9F4VPvzonOpEy5ttASC6qfpD9PkUlmSZA
	hT7/e1LCfeMtN3/uhlHQUlJNJH0cfBB1Wy9TL6SKI0QnLoFWgyLTbOCYYNfeulY6FHZYN2
	CQue5TdUSPx0drY0Tgp+uKckAoj7lYFFjdkyWu3Om3rbHqxsqzcIJbRQFlWs5w==
Message-ID: <65be739f-3883-4bf3-a8d7-6e826b036394@bootlin.com>
Date: Fri, 30 Oct 2026 15:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] elfutils: skip run-stackprof-system.sh ptest
 under qemu
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
 openembedded-core@lists.openembedded.org
References: <20261030133350.20515-1-jaipaul.cheernam@est.tech>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20261030133350.20515-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249051

Hello, Jaipaul

On 10/30/26 2:33 PM, Jaipaul Cheernam wrote:
> Non-deterministic under qemu as needs userspace perf samples in a fixed=
 window
> Issue already reported upstream and updated ticket with details
>=20
> Reported upstream: https://sourceware.org/bugzilla/show_bug.cgi?id=3D34=
544
>=20
> Skip test case via ELFUTILS_PTEST_SKIP
>=20
> ptest results:
> Before:
> glibc: 263 PASSED, 45 SKIPPED, 0 FAILED
> musl: 255 PASSED, 44 SKIPPED, 0 FAILED
> clang: 263 PASSED, 45 SKIPPED, 0 FAILED
>=20
> with change:
> glibc: 262 PASSED, 46 SKIPPED, 0 FAILED
> musl: 254 PASSED, 45 SKIPPED, 0 FAILED,
> clang: 262 PASSED, 46 SKIPPED, 0 FAILED
>=20
> [YOCTO #16473]
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>   meta/recipes-devtools/elfutils/elfutils_0.197.bb | 10 ++++++++++
>   1 file changed, 10 insertions(+)
(...)

Thanks for the patch.

Out of curiosity, why using an :append (unconditional) for=20
do_install_ptest() instead of simply adding the chunk of code into the=20
task itself?

Reviewed-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
--=20
Best regards,
Jo=C3=A3o Marcos Costa

