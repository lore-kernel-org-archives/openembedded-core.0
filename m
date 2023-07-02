Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE434EB64D9
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 21:44:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.14985.1688334276752468539
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 14:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GFr8c0YJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688334275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JV0c0qrAF42HqRWPXhulP7SR9pPR/IQIe71lIdEZcvY=;
	b=GFr8c0YJ7bmbl7tEfI3cvVITqnzzpyKd0VT/qstkdE93B7/zYfFxul43AE2yj0UEdFDuwu
	JZQCZyVMDonhuZkh2OoG+1Oq9/SHL3d7da+3Ji3tZ9ffc6zHuE4fYioEy/ukqosJsqbF0d
	Ei3s4OmPzoDw/CqiF8/gRQJllPpZwz0vLFhmtVwa8yxt0I9AR6YMToiOZuy9JhqM2OvhZh
	BJmFLVoRAjgLPTLX04dqpHJ2mLqC6NKRtT9vkOgBFtUMvTQacNikbTZvieB8XwUCozlcmB
	3exgN2IJihNVNvA8jMV1p2MZ0ntG38J2saR492z1yjFN4enGx3evpcGX9FKKNA==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77FFDFF802;
	Sun,  2 Jul 2023 21:44:34 +0000 (UTC)
Date: Sun, 2 Jul 2023 23:44:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ovidiu.panait@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/4] mdadm: fix util-linux-lsblk ptest
 dependency
Message-ID: <202307022144331949919e@mail.local>
References: <20230629141836.3431391-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629141836.3431391-1-ovidiu.panait@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 21:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183784

Hello,

I had those failures on the AB:

{'mdadm': ['/usr/lib/mdadm/ptest/tests/10ddf-createFAILED_-_see_/mdadm-testing-dir/10ddf-create.log_and_/mdadm-testing-dir/fail10ddf-create.log_for_details',
           '/usr/lib/mdadm/ptest/tests/10ddf-create-fail-rebuildFAILED_-_see_/mdadm-testing-dir/10ddf-create-fail-rebuild.log_and_/mdadm-testing-dir/fail10ddf-create-fail-rebuild.log_for_details',
           '/usr/lib/mdadm/ptest/tests/10ddf-fail-readdFAILED_-_see_/mdadm-testing-dir/10ddf-fail-readd.log_and_/mdadm-testing-dir/fail10ddf-fail-readd.log_for_details',
           '/usr/lib/mdadm/ptest/tests/10ddf-fail-readd-readonlyFAILED_-_see_/mdadm-testing-dir/10ddf-fail-readd-readonly.log_and_/mdadm-testing-dir/fail10ddf-fail-readd-readonly.log_for_details',
           '/usr/lib/mdadm/ptest/tests/10ddf-fail-spareFAILED_-_see_/mdadm-testing-dir/10ddf-fail-spare.log_and_/mdadm-testing-dir/fail10ddf-fail-spare.log_for_details',
           '/usr/lib/mdadm/ptest/tests/10ddf-fail-stop-readdFAILED_-_see_/mdadm-testing-dir/10ddf-fail-stop-readd.log_and_/mdadm-testing-dir/fail10ddf-fail-stop-readd.log_for_details',
           '/usr/lib/mdadm/ptest/tests/10ddf-fail-twiceFAILED_-_see_/mdadm-testing-dir/10ddf-fail-twice.log_and_/mdadm-testing-dir/fail10ddf-fail-twice.log_for_details',
           '/usr/lib/mdadm/ptest/tests/10ddf-sudden-degradedFAILED_-_see_/mdadm-testing-dir/10ddf-sudden-degraded.log_and_/mdadm-testing-dir/fail10ddf-sudden-degraded.log_for_details',
           '/usr/lib/mdadm/ptest/tests/21raid5cacheFAILED_-_see_/mdadm-testing-dir/21raid5cache.log_and_/mdadm-testing-dir/fail21raid5cache.log_for_details']}


https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5106/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5292/steps/13/logs/stdio

On 29/06/2023 17:18:33+0300, Ovidiu Panait via lists.openembedded.org wrote:
> From: Ovidiu Panait <ovidiu.panait@windriver.com>
> 
> Trying to run mdadm-ptest in a core-image-minimal build will result in:
> root@qemux86-64:~# ptest-runner mdadm
> START: ptest-runner
> BEGIN: /usr/lib/mdadm/ptest
> which: no lsblk in (/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin)
> lsblk command not found!
> DURATION: 0
> END: /usr/lib/mdadm/ptest
> 2023-06-28T10:14
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
> 
> To fix this, add util-linux-lsblk to RDEPENDS and remove util-linux from
> RRECOMMENDS.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta/recipes-extended/mdadm/mdadm_4.2.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> index 14de9d88c2..0a122b0b01 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> @@ -101,10 +101,9 @@ do_install_ptest() {
>  }
>  
>  RDEPENDS:${PN} += "bash"
> -RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
> +RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk"
>  RRECOMMENDS:${PN}-ptest += " \
>      coreutils \
> -    util-linux \
>      kernel-module-loop \
>      kernel-module-linear \
>      kernel-module-raid0 \
> -- 
> 2.39.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183631): https://lists.openembedded.org/g/openembedded-core/message/183631
> Mute This Topic: https://lists.openembedded.org/mt/99851482/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

