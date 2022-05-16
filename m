Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B549C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 08:45:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.26493.1652690710331442406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 01:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J3lToS/o;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 20181E0009;
	Mon, 16 May 2022 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652690708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwDRMqeAFLD5w/wynnb8tcRN+4N5cZXkmxkGAL3QebQ=;
	b=J3lToS/oSdZPvK5Spy3KhisJ0693Dwbi/BE9NjllZWxWSRv2U+dd6Qn0Z/NqXxk+LaJev9
	+5cZynYU/JL57X3J57vx64sfX1FPWcj3XwG7ljluH9FjLTmEfS1l1/KkxzT+4i/3jjh3iZ
	z7ycM8YGm6CliqSUMibRFTVbtIKMhEdKe2ffxy//GvhlTLy2mZVNRUYOEyCILWXoOb5i3F
	/wLObgzD4LBy3ruGgQMVMfOvuS1ZXnZuq/fgr0256pRBadn0YyRXNsk+vzF4lOZzAqfRGo
	7mY9UFd/OFJ58sC+5J2o1euc8KjV2TLx210SSaJNW/KfFQmyzmoDYbooy2CgyQ==
Date: Mon, 16 May 2022 10:45:06 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-cryptography: add
 python3-pytest-benchmark rdepends
Message-ID: <20220516104506.3d383183@melee>
In-Reply-To: <20220514021315.308344-1-mingli.yu@windriver.com>
References: <20220514021315.308344-1-mingli.yu@windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 08:45:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165668

Hi Yu,

Il giorno Sat, 14 May 2022 10:13:15 +0800
"Yu, Mingli" <mingli.yu@windriver.com> ha scritto:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The new version introduced below change, so add
> python3-pytest-benchmark to rdepends to fix the gap.
> 496703c8 Refs #7079 -- added basic scaffholding for benchmarks (#7087)
> 
> Fixes:
>   # ./run-ptest
>   Free memory: 31.283 GB
>   ERROR: usage: pytest [options] [file_or_dir] [file_or_dir] [...]
>   pytest: error: unrecognized arguments: --benchmark-disable
>   inifile: /usr/lib/python3-cryptography/ptest/pyproject.toml
>   rootdir: /usr/lib/python3-cryptography/ptest
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>

This patch is introducing build failures on the autobuilders:

ERROR: Nothing RPROVIDES 'python3-pytest-benchmark' (but
/home/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
RDEPENDS on or otherwise requires it)

Here are a few logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3260/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3260/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5253/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5227/steps/11/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

