Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAF2C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 01:50:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.4010.1681177812248238368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 18:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fuPOqFD1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 83BEB1C0006;
	Tue, 11 Apr 2023 01:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681177809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KErM0YJboNRp5Yb1RdnsSBJTHfmVRH0X19QrXJ76FAc=;
	b=fuPOqFD1uCbCHfJTCtQEjw9p6MfAfVZApW87ll4rPyLfsbX1aF0s91Y/Ib70eyvucYrzXL
	Rf87dYg058BHeO93viHjXZJ0I0BG7+8JG7F5zT6FLbtIlem03NwpsaAs+bICTAZPLleu1G
	GsJU/vCPAkLNxevFBCgg3qilFqDk2j1w6il+EqPzoI/VNDgKHRKuXoRSAl/W3+iOYWfV56
	Xb7r/ldFiK2eLGbaeGMrZPAiC/wj+3b6Bxp+QFrkG5Nw1SyTJx1JJuF0z8wNGb/M7ky/Eq
	Z2igqkj0I1w5V3HUED5KmYtzW/S1fKkreY3d5fgIlIyowQbnExNezy7AF6sasg==
Date: Tue, 11 Apr 2023 03:50:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] dnf: upgrade 4.14.0 -> 4.15.0
Message-ID: <20230411015008b7b5fe2a@mail.local>
References: <1681116997-24685-1-git-send-email-wangmy@fujitsu.com>
 <1681116997-24685-5-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681116997-24685-5-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 01:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179905


https://autobuilder.yoctoproject.org/typhoon/#builders/79/builds/5049/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/86/builds/5040/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/80/builds/4998/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/87/builds/5079/steps/14/logs/stdio

NOTE: Running task 1159 of 1159 (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-extended/images/core-image-full-cmdline.bb:do_testimage)
NOTE: recipe core-image-full-cmdline-1.0-r0: task do_testimage: Started
ERROR: core-image-full-cmdline-1.0-r0 do_testimage: dnf could not find package socat in repository: DNF version: 4.15.0
cachedir: /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-76472/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0-r0/testimage/install_tmp/socat/var/tmp/dnf-pokybuild-15ye4wja
Added oe-repo repo from /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-76472/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0-r0/oe-rootfs-repo
Last metadata expiration check: 0:00:01 ago on Mon 10 Apr 2023 03:21:57 PM UTC.
%{location}
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-76472/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0-r0/temp/log.do_testimage.3539185
NOTE: recipe core-image-full-cmdline-1.0-r0: task do_testimage: Failed
ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-extended/images/core-image-full-cmdline.bb:do_testimage) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1159 tasks of which 1158 didn't need to be rerun and 1 failed.
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-76472/tmp/log/error-report/error_report_20230410152148.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-76472/tmp/log/error-report/error_report_20230410152148.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.
Summary: 1 task failed:
  /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-extended/images/core-image-full-cmdline.bb:do_testimage
Summary: There was 1 ERROR message, returning a non-zero exit code.

On 10/04/2023 16:56:37+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-devtools/dnf/{dnf_4.14.0.bb => dnf_4.15.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/dnf/{dnf_4.14.0.bb => dnf_4.15.0.bb} (98%)
> 
> diff --git a/meta/recipes-devtools/dnf/dnf_4.14.0.bb b/meta/recipes-devtools/dnf/dnf_4.15.0.bb
> similarity index 98%
> rename from meta/recipes-devtools/dnf/dnf_4.14.0.bb
> rename to meta/recipes-devtools/dnf/dnf_4.15.0.bb
> index 62df8c4ace..7bf9547424 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.14.0.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.15.0.bb
> @@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
>             file://0001-dnf-write-the-log-lock-to-root.patch \
>             "
>  
> -SRCREV = "e50875b3f5790f70720bdb670e1dd2bf4d828744"
> +SRCREV = "5306910d06631bc93fa3ece0e70ed27ee592b0aa"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179847): https://lists.openembedded.org/g/openembedded-core/message/179847
> Mute This Topic: https://lists.openembedded.org/mt/98171942/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

