Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7C3F3D619
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 17:52:48 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33818.1774806762098658044
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 10:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QJnCt5xs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 058821A3076
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 17:52:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFCB85FD24;
	Sun, 29 Mar 2026 17:52:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E7041045019D;
	Sun, 29 Mar 2026 19:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774806758; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+ePTogJpntmuhJ9/M5V0P8zUv0IMuSIQkru4szdPN2E=;
	b=QJnCt5xsUB/Xe2Tyia2B1zg5/VfDI09tBhErF7nMFeIT+QoK2RyvnzPy9L1orKUN/qPH9N
	Txgo5uxlKYq0ghWic/bTUU7IMujCsbf1DbV5p4TlZTwWVZOKEUZ3WgIQAUm8Z0TIJNRJ/9
	elODfFaBJ0tThgcQqHVa4kYF+dZsWAvW+MrAuq/zsKEuan5qvYm9/XDptlAJ7Cenz48GyD
	1yQ8Uy5UnczAZ79ZV0X9MumVLABtudCYGh2lw12H4R6PpWvRX33TPH1K/xq272WJ3s8KQZ
	RPEc1YkWrEF+Mp2Js9oT9YQRFN6TyGaqrLwSCpXewA2xbauWx0yRC8IUjTiwkA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Mar 2026 19:52:36 +0200
Message-Id: <DHFGHK0ZXB9J.3LEH33RUE02U6@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 09/12] lttng-tools: Stop using PYTHON_ABI
Cc: "Khem Raj" <raj.khem@gmail.com>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Trevor Gamblin" <tgamblin@baylibre.com>, "Alexander
 Kanavin" <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: =?utf-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi_Zolt=C3=A1n?= <zboszor@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
 <20260327083055.12571-9-zboszor@gmail.com>
 <DHE97CHEV2AH.1F608DBNYS3BA@bootlin.com>
 <cb2aef19-84ee-406d-ae1f-5bbf2ce2f9b9@gmail.com>
In-Reply-To: <cb2aef19-84ee-406d-ae1f-5bbf2ce2f9b9@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 17:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234154

On Sat Mar 28, 2026 at 9:56 AM CET, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n =
wrote:
> 2026. 03. 28. 8:57 keltez=C3=A9ssel, Mathieu Dubois-Briand =C3=ADrta:
>> On Fri Mar 27, 2026 at 9:30 AM CET, Zoltan Boszormenyi via lists.openemb=
edded.org wrote:
>>> PYTHON_DIR now contains PYTHON_ABI, use it.
>>>
>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.co=
m>
>>> ---
>> Hi Zolt=C3=A1n,
>>
>> Thanks for your patch. It looks like lttng-tools build is now failing:
>>
>> ERROR: lttng-tools-2.15.0-r0 do_configure: Execution of '/srv/pokybuild/=
yocto-worker/genericarm64-alt/build/build/tmp/work/armv8a-poky-linux/lttng-=
tools/2.15.0/temp/run.do_configure.1174739' failed with exit code 1
>> ...
>> | configure: error: Package requirements (lttng-ust >=3D 2.15 lttng-ust =
< 2.16) were not met:
>> |
>> | Package dependency requirement 'lttng-ust >=3D 2.15' could not be sati=
sfied.
>> | Package 'lttng-ust' has version '2.14.0', required version is '>=3D 2.=
15'
>> |
>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>> | installed software in a non-standard prefix.
>> |
>> | Alternatively, you may set the environment variables UST_CFLAGS
>> | and UST_LIBS to avoid the need to call pkg-config.
>> | See the pkg-config man page for more details.
>> | NOTE: The following config.log files may provide further information.
>> | NOTE: /srv/pokybuild/yocto-worker/genericarm64-alt/build/build/tmp/wor=
k/armv8a-poky-linux/lttng-tools/2.15.0/build/config.log
>> | ERROR: configure failed
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3489
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3454
>>
>> Can you have a look at the issue?
>
> I tested the build with my patches, there was no such issue.
>
> It's caused by another patch that updated lttng-tools without also updati=
ng lttng-ust.
>

Yes indeed, I confirm this errors does not come from your series.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


