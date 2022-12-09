Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7FFC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 17:03:24 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.7061.1670605400847240888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 09:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oYpNPSGn;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1433ef3b61fso427723fac.10
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 09:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7IdEwGEb9AW/F+m1qaRS+3IPOeuuHu4dHKx6JaTz0EA=;
        b=oYpNPSGnq8WNjjg1WZaz1H/mWB9JVZ7UG35QdmSyzow+7JD4pndomzcOcLIj/SE7v/
         xX+CKGAgtbNSXyCzI1KJk6kWwFzsGakWb27uQOgZlMKCJHRDRsRNlHluqtZ+mQllygpl
         XFXlKOqXdBtwT+zX/cyF4hSka3G02Uzv+nZINSNhbv3vsBiRKIX+lzXrq4vSMgSSma4Z
         NBAlP+ryTnHmSKnxEU81a1xJ86TDqmUQsA5q8fcef/jygNqO4BhL7WRi890aFcnjS7G/
         eCv9guw5auIWYswzCuBPaW1zsDI45qKId/gtcAE1/C//JVl6/ZxAHXXAPLUzsTuVcO7e
         IKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IdEwGEb9AW/F+m1qaRS+3IPOeuuHu4dHKx6JaTz0EA=;
        b=Xvz6r+f/Pxh48KlITWVXl1h0q6gXsnvj/7zve33EzNSzOy/PGkyjhNt7i8X+PRKdML
         LAIYRYMeA2bE/zNRFro5rOKvVSPdO6FZVtxto95Q2ZL17S/gj2QV3CtvTxspzrEKo1b+
         2dk0Dle7BZNXsjiDKbhrP8pd80dBAoVlXX82gOclCIvX+Dwr1gqcJnVMmRAYYUsN4sva
         K3tjp0b8c/vYaob6WgrvEsRiEp6gvQuMU5Ws1FqXVMmvCfR3t3KbGlYtzDKfiVeGVBac
         71Fsiw7UBDB3Mv0UO/FJIvA//4t6fOCNNuMqN97EqVAIW5nTVb743sq+xz/1XqBSZQ8m
         GOCw==
X-Gm-Message-State: ANoB5pkqICfpMajh0F8Kgq/SlG/197w18Tj/MctNFnEj6WBOq5cxBQf+
	XVwWwD5Q+QbrIxLWhBGe133ZVXv5NhAWL+ia3Y6VLrwN
X-Google-Smtp-Source: AA0mqf7n0nk1llqbe+N+x4BUMxnUl0ulnuNbJ073/P6CECeWO+LSEqIqIIvnS2ExkipukE12A1kK9zwxdTJ5RoT4wIw=
X-Received: by 2002:a05:6870:1784:b0:13b:1e05:a73d with SMTP id
 r4-20020a056870178400b0013b1e05a73dmr54853374oae.55.1670605399904; Fri, 09
 Dec 2022 09:03:19 -0800 (PST)
MIME-Version: 1.0
References: <20221209070538.72901-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20221209070538.72901-1-xiangyu.chen@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2022 09:02:53 -0800
Message-ID: <CAMKF1sokegC9mr0VkmdEqW2WqRxBdc0fVYS39Pp8FFFzj6jc-Q@mail.gmail.com>
Subject: Re: [OE-Core][master][PATCH] openssh: remove RRECOMMENDS to rng-tools
 for sshd package
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 17:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174469

would be good to know some numbers on non-arm/non-x86 systems too.

On Thu, Dec 8, 2022 at 11:05 PM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> It appears that rngd is not needed as of linux-5.6 and later[1]
> and should not be installed by default since the purpose of rngd
> is to provide additional trusted sources of entropy.
>
> We did some testing on real hardware, the result seems to support that
> we no longer need rngd by default on kernel v5.6 and later.
>
> Testing result as below:
>
> 1. observing the crng init stage.
>  the "random: crng init done" always available before fs being mounted.
>
> 2. generating random number without rngd.
>  testing command: dd if=/dev/random of=/dev/null status=progress
>    on Marvell CN96xx RDB board, speed almost 20.4 MB/s without block
>    on NXP i.mx6q board, speed almost 31.9 MB/s without block
>    on qemu x86-64, speed almost 2.6MB/s without block
>
> 3. using rngtest command without rngd
>  testing command: rngtest -c 1000 </dev/random
>    on Marvell CN96xx RDB board:
>       rngtest: input channel speed: (min=4.340; avg=135.364; max=146.719)Mibits/s
>       rngtest: FIPS tests speed: (min=8.197; avg=69.020; max=72.800)Mibits/s
>       rngtest: Program run time: 418771 microseconds
>
>    on NXP i.mx6q board:
>       rngtest: input channel speed: (min=96.820; avg=326.769; max=340.598)Mibits/s
>       rngtest: FIPS tests speed: (min=15.090; avg=37.543; max=40.324)Mibits/s
>       rngtest: Program run time: 570229 microseconds
>
>    on qemu x86-64:
>       rngtest: input channel speed: (min=37.769; avg=101.136; max=136.239)Mibits/s
>       rngtest: FIPS tests speed: (min=10.288; avg=30.682; max=40.155)Mibits/s
>       rngtest: Program run time: 836800 microseconds
>
> 4. observing sshd service.
>   using "systemctl disable rng-tools" disable service and reboot system.
>   system boot up normal, sshd service also start in normal time without
>   block.
>
> Reference:
> [1] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_9.1p1.bb | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
> index 85f97b1bbb..23ae8d5b0c 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
> @@ -52,15 +52,12 @@ SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket"
>
>  inherit autotools-brokensep ptest
>
> -PACKAGECONFIG ??= "rng-tools"
> +PACKAGECONFIG ??= ""
>  PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
>  PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
>  PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
>
> -# Add RRECOMMENDS to rng-tools for sshd package
> -PACKAGECONFIG[rng-tools] = ""
> -
>  EXTRA_AUTORECONF += "--exclude=aclocal"
>
>  # login path is hardcoded in sshd
> @@ -160,10 +157,6 @@ FILES:${PN}-keygen = "${bindir}/ssh-keygen"
>
>  RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen ${PN}-sftp-server"
>  RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> -RRECOMMENDS:${PN}-sshd:append:class-target = "\
> -    ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
> -"
> -
>  # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
>  RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174434): https://lists.openembedded.org/g/openembedded-core/message/174434
> Mute This Topic: https://lists.openembedded.org/mt/95556189/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

