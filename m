Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236FEC38A2C
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.7892.1649248502036739129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 05:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BWAdNUQf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7D38924000D;
	Wed,  6 Apr 2022 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649248499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zq9HGqfAiEgHK6BFtvIBrwlH56B+CKSgNS5jD4XiuNc=;
	b=BWAdNUQfT69OYqvSIBINKptXQlLHXpKkWTNW5kqKOO+bNXOOsFRc8tHuLfsahbSaYdp5Ul
	e3ViEFKnlGtNGSFSsHoRII7IntWEkCUzzgh1D9BTBcEA85irHt7AyLx480XOOFAFH2Ab76
	4Oo7slWeRdDrpNRe7pXqr8zlYBD+TEIvzwgs/ThLxTvWyi1c7zV9LUQo1bYq5TLKRM1Wnv
	9sh7vZIPE5v6fWeN3dk7SBEKO6gPnLLVq2SmBocOk7MAIpnorP3oEpx9VD8uOLYNspBnFz
	EHa0gxKOZc/puAoTnzy7ndQzDOXMdSWXVeKRtjnJ0eqjkM2vOJMib7Do+KtgZA==
Date: Wed, 6 Apr 2022 14:34:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lttng-tools: upgrade 2.13.4 -> 2.13.6
Message-ID: <Yk2I88BgEuWXpapX@mail.local>
References: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
 <1649011392-28818-5-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649011392-28818-5-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164080

Hello,

Last time I tried that, we got new ptest failures:

{'lttng-tools': ['kernel/test_callstack_11_-_Validate_userspace_callstack',
                 'kernel/test_userspace_probe_94_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_function',
                 'kernel/test_userspace_probe_95_-_Start_tracing_for_session_test_userprobe_elf_cxx_function',
                 'kernel/test_userspace_probe_96_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_function',
                 'kernel/test_userspace_probe_97_-_Validate_trace_for_event_userspace_probe_test_event',
                 'kernel/test_userspace_probe_100_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_method',
                 'kernel/test_userspace_probe_101_-_Start_tracing_for_session_test_userprobe_elf_cxx_method',
                 'kernel/test_userspace_probe_102_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_method',
                 'kernel/test_userspace_probe_103_-_Validate_trace_for_event_userspace_probe_test_event']}

Did you have a look at and fix those?

On 04/04/2022 02:43:12+0800, wangmy wrote:
> Changelog:
> =========
> Fix: hide symbols erroneously exported in 2.13.5
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.6.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.6.bb} (98%)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
> similarity index 98%
> rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> rename to meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
> index 0ea4da05ce..d40d0a2dd0 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
> @@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>             file://disable-tests.patch \
>             "
>  
> -SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
> +SRC_URI[sha256sum] = "1d52d249437b3f7ba23a45a22c3e26dde006a5da10e96753952084a98e0523e3"
>  
>  inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164067): https://lists.openembedded.org/g/openembedded-core/message/164067
> Mute This Topic: https://lists.openembedded.org/mt/90287422/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

