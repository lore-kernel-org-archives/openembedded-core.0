Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A893C87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 08:09:31 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.35391.1753085360886037749
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 01:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TxjdxG6D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE12E1FD35;
	Mon, 21 Jul 2025 08:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753085359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UlVirpzkOHurPfPRhF27oS9PgopaZEaQ+1R2ROwsGMg=;
	b=TxjdxG6D5Laq7UVh5dJe+7QCPb4olgJNavOzZ1bQCxYY5iNsTc5dT9iOgCHfEm1dmDstKq
	Vx0086ecDmTJF2bc36vZJah8k68PbEGltoqfftH47SS1Aa97R11JIu3mkplSW5K9aoH1sP
	OchaP/5g3zauHuPjPrBZzzzyW5id3Ka3tgsPOWwifNP5ufiJTCi0lzE/x+OQGuDDcO33ei
	72JN+FEA2cuz0Rgctd4MC7XxsnRmNniJY4G0B09/yYzkydxM2PumPpgesFm9n1TVzPXpuU
	K9QqlMPKu/80EoPW2wrnOnBnewmKO3nFMGIm8bygykh8dbNX2mv7c7UM6s297Q==
Message-ID: <1728b300-fcaf-4969-8ea8-b41735242764@bootlin.com>
Date: Mon, 21 Jul 2025 10:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/4] babeltrace2: Enable python plugins
To: mingli.yu@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250720090010.3122861-1-mingli.yu@eng.windriver.com>
 <20250720090010.3122861-2-mingli.yu@eng.windriver.com>
Content-Language: en-US, fr
Cc: mathieu.dubois-briand@bootlin.com
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20250720090010.3122861-2-mingli.yu@eng.windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejudehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfuvfhfvefhohgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflohgrohcuofgrrhgtohhsucevohhsthgruceojhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeeuffekvedtffetueehgfevjefhhfeiueffjeelgeeguedtvdeigedujefgieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhlthhtnhhgrdhorhhgpdgvfhhfihgtihhoshdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemvdeifeefmegtieegvdemfhgrlegrmedvfegutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemvdeifeefmegtieegvdemfhgrlegrmedvfegutddphhgvlhhopeglkffrggeimedvrgdtudemtggsudegmeehheeimeejrgdttdemvdeifeefmegtieegvdemfhgrlegrmedvfegutdgnpdhmrghilhhfrhhomhepjhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepm
 hhinhhglhhirdihuhesvghnghdrfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 08:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220663

Hello Mingli,

On 7/20/25 11:00, Yu, Mingli via lists.openembedded.org wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> * The lttng-tools test fails as below as it needs bt2 module.
> ERROR: ust/high-throughput/test_high_throughput_snapshot.py
> ===========================================================
> 
> Traceback (most recent call last):
>    File "/usr/lib/lttng-tools/ptest/tests/regression/./ust/high-throughput/test_high_throughput_snapshot.py", line 26, in <module>
>      import bt2
> ModuleNotFoundError: No module named 'bt2'
> 
> Enable python plugins for babeltrace2 to provide the above support.
> 
> * Add swig-native to DEPENDS to fix the below configure error.
>   | configure: error: SWIG 2.0.0 or newer is required to build the python bindings
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
> index 8bab7f677a6..88f589eafbc 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
> @@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
>   LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
>   
> -DEPENDS = "glib-2.0 util-linux popt bison-native flex-native virtual/libiconv"
> +DEPENDS = "glib-2.0 util-linux popt bison-native flex-native virtual/libiconv swig-native"
>   
>   SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v${PV} \
>              file://run-ptest \
> @@ -19,13 +19,13 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
>   
>   inherit autotools pkgconfig ptest python3targetconfig
>   
> -EXTRA_OECONF = "--disable-debug-info --disable-Werror"
> +EXTRA_OECONF = "--disable-debug-info --disable-Werror --enable-python-plugins --enable-python-bindings"
>   
>   PACKAGECONFIG ??= "manpages"
>   PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native xmlto-native"
>   
>   FILES:${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
> -FILES:${PN} += "${libdir}/babeltrace2/plugins/*.so"
> +FILES:${PN} += "${libdir}/babeltrace2/plugins/*.so ${PYTHON_SITEPACKAGES_DIR}/*"
>   
>   ASNEEDED = ""
>   LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld=bfd ', '', d)}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220615): https://lists.openembedded.org/g/openembedded-core/message/220615
> Mute This Topic: https://lists.openembedded.org/mt/114249009/8026893
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [joaomarcos.costa@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

There are some ptest errors in the autobuilder:
- 
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/1923/steps/12/logs/stdio
- 
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/1931/steps/12/logs/stdio

Could you please take a look?

Thanks!

-- 
Best regards,
João Marcos Costa

