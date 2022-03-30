Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108B2C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 02:59:29 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.2997.1648609167415721824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Qq0ecYYP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 25A35FF802;
	Wed, 30 Mar 2022 02:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648609164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JkVlr1kXYlGBZKiTPEXnee+IU08OqEVEBFZJ/vVEt5g=;
	b=Qq0ecYYP5Hb9ytBwp+NoKIfewEkNnIO3S6roWiNKmqOH2RYLL+o3RBdg1ahxD3QAgq8w7l
	nJESbDB39S+DPJKn6xchM2SZvI+GBJmERSbMRIfYEvB8aI1kLGhz3Vle9coY+usNOVLtmN
	3F22eLdoe/UZd/08PCH5YuljMps0N7LCjaAXeZqmg7Jpwkpc9JyMvtNvacqVb5tsok2ICS
	HqYFSkC/cDRXKPR60AePrYGkE1aP5S6QF0W55L3LFAYyv62lMnJJp+7TkSo63MFby/xeLJ
	dsyUQb9nY1oT4Z6JYvx41M3vTstM6cqN0Om1GqSCa2tmnnkwz5PQv/Q18KlYOQ==
Date: Wed, 30 Mar 2022 04:59:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lttng-tools: Update to 2.13.6
Message-ID: <YkPHi2n+8UPuFXK2@piout.net>
References: <20220329163814.7905-1-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329163814.7905-1-pkj@axis.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 02:59:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163771

Hello,

New ptest failures after this:

{'lttng-tools': ['kernel/test_callstack_11_-_Validate_userspace_callstack',
                 'kernel/test_userspace_probe_94_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_function',
                 'kernel/test_userspace_probe_95_-_Start_tracing_for_session_test_userprobe_elf_cxx_function',
                 'kernel/test_userspace_probe_96_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_function',
                 'kernel/test_userspace_probe_97_-_Validate_trace_for_event_userspace_probe_test_event',
                 'kernel/test_userspace_probe_100_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_method',
                 'kernel/test_userspace_probe_101_-_Start_tracing_for_session_test_userprobe_elf_cxx_method',
                 'kernel/test_userspace_probe_102_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_method',
                 'kernel/test_userspace_probe_103_-_Validate_trace_for_event_userspace_probe_test_event']}


https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3050/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3306/steps/12/logs/stdio

On 29/03/2022 18:38:14+0200, Peter Kjellerstedt wrote:
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
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

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163755): https://lists.openembedded.org/g/openembedded-core/message/163755
> Mute This Topic: https://lists.openembedded.org/mt/90112478/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

