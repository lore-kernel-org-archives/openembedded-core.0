Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6D110BA45E
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 07:57:45 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7195.1774684659717781815
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 00:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Iwqqhh89;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 818D71A303F;
	Sat, 28 Mar 2026 07:57:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DFFE6026B;
	Sat, 28 Mar 2026 07:57:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B03A910450E8F;
	Sat, 28 Mar 2026 08:57:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774684656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ChTyJvoCBY/PcvbuUqE4iwQ6gvTU+3JuLMPPY8OQzQA=;
	b=Iwqqhh8926c5VXFtv/5/tNthER0MdzTVWtSV9TK9W6HrPiC4n1FCreQUPceadG4HEtH4HK
	sqtgLyL7PhILmyneXPjXRi05HDMkUsL7O80H5F2k7ObFpExE6zIMlNbCgf6wqgVlSV7DLu
	ZcLfIiTVUJkIcR+exqkiJnlMaMjtpfIgI1N4svF19AYrYL2qu34tAasMB5GBHpL8kPpc8p
	jLUgClVRX+/IFUZHTfS1WxqnVyeInAKax6xPfH024Vpkph1MJjJTs8h4CnOiiFNNvq1KGg
	PgR+XfcgjAIj1rstvU+eb1hRunRBwHsqbm5hRTee9jgDLqAgPHYygfUIFVqz3Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 08:57:28 +0100
Message-Id: <DHE97CHEV2AH.1F608DBNYS3BA@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 09/12] lttng-tools: Stop using PYTHON_ABI
Cc: "Khem Raj" <raj.khem@gmail.com>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Trevor Gamblin" <tgamblin@baylibre.com>, "Alexander
 Kanavin" <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <zboszor@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
 <20260327083055.12571-9-zboszor@gmail.com>
In-Reply-To: <20260327083055.12571-9-zboszor@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 07:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234118

On Fri Mar 27, 2026 at 9:30 AM CET, Zoltan Boszormenyi via lists.openembedd=
ed.org wrote:
> PYTHON_DIR now contains PYTHON_ABI, use it.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---

Hi Zolt=C3=A1n,

Thanks for your patch. It looks like lttng-tools build is now failing:

ERROR: lttng-tools-2.15.0-r0 do_configure: Execution of '/srv/pokybuild/yoc=
to-worker/genericarm64-alt/build/build/tmp/work/armv8a-poky-linux/lttng-too=
ls/2.15.0/temp/run.do_configure.1174739' failed with exit code 1
...
| configure: error: Package requirements (lttng-ust >=3D 2.15 lttng-ust < 2=
.16) were not met:
|
| Package dependency requirement 'lttng-ust >=3D 2.15' could not be satisfi=
ed.
| Package 'lttng-ust' has version '2.14.0', required version is '>=3D 2.15'
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables UST_CFLAGS
| and UST_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/genericarm64-alt/build/build/tmp/work/a=
rmv8a-poky-linux/lttng-tools/2.15.0/build/config.log
| ERROR: configure failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3489
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3454

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


