Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1691CCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:41:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.6.1761928893968860808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 09:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vq26Gj/3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3D08A1A17B8;
	Fri, 31 Oct 2025 16:41:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1052960704;
	Fri, 31 Oct 2025 16:41:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 242DF11818086;
	Fri, 31 Oct 2025 17:41:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761928891; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cxJZcM0oazBoMoNdKDZ9wx945soa+FkKOYLRVyPI3yc=;
	b=vq26Gj/37w6G7JKpk0amZphByWEC0B2yZ97q3AtC30ai89p0VYgy8TIGlMnUobKCLarYi8
	EfVeoG8vKLVRDFe+slMLyobZextYNfcmT2y2uVQLkuMiJSlLqqwsmzkH49priAVMEBDdQQ
	Ltdv57+9wfbc1QzjdYsIkwEERzYPzIqElq348iA/wgoWHYHZemEA8/QWcy45YNeXugRmBA
	FN2erZWTyRD1ionDBCUpQ4IvoU6u8JZbfmNV7vVooaqgycud2/R/kR+WVCmiDv0KS/Dw3P
	dZecHIxZFtDkhuQk9MrqPKErVftY4ZzmnHdxwoJecwc+1zeI53YNcLC9RWLN5w==
Message-ID: <64d62995-6c65-4cf1-9293-9c5ac364dfef@bootlin.com>
Date: Fri, 31 Oct 2025 17:41:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 00/14] kernel-yocto: consolidated pull request
To: bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 16:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225550

Hello, Bruce (and Richard)

I hope this email finds you well.

On 10/30/25 18:12, Bruce Ashfield via lists.openembedded.org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Richard,
>=20
> I've put all of the patches I've sent for 6.17 into this series. The
> only new ones are a bump to 6.17.5 (Which also contains some configurat=
ion
> changes to fix audit warnings for genericarm64) and t he addition of
> genericarm64 SRCREVs to the 6.16 and 6.17 appends.
>=20
> These are against master, I can rebase to master-next as needed (if
> some of the older ones merged there that I didn't notice).
>=20
> If this series works out, we'll remove 6.16 from the tree.
>=20
> Cheers,
>=20
> Bruce

I spotted this ptest failure likely related to this update:
Failed ptests:
{'lttng-tools':=20
["tests.serial_3_-_Test_script_'tools/channel/test_cli_legacy_channel_buf=
fering_policies.py'_returned_code_1._4_passed,_0_failed,_0_skipped,_6_pla=
nned_[total:_4]",=20
=20
"tests.serial_6_-_Test_script_'tools/filtering/test_valid_filter[_0.00000=
0]_Linux_version_6.17.6-yocto-standard"]}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2561/s=
teps/13/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2520/s=
teps/13/logs/stdio

Could you please take a look?

Have a nice weekend!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

