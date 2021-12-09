Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26CDC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:29:03 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web09.14865.1639070942908076552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ByAQk1Gw;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id m17so5713646qvx.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CRiddxaEw8fW9SLpYpOYQUnJ1fDXf7OlfOjKfKFVZ9k=;
        b=ByAQk1GwSw6Fh0db/y4JCKStaSkao6KNtkF2QbWX6ganhTCRlBnoR7z9hOU94z3dh6
         GkkxJDUTwW6aUHkYVJmoiFJzTrx9m5VjNNSH6JvCkgPJrWrK55xNZV4LXcrF2iWzEa0b
         GLAEzR/iZZUEKIE8X1i9APd8f1kb9tEXlE2062Y2oOTBlss72G4tqRBnTXM9Qc7lmty7
         JUMUuk0+OXYZqs1ZRFB7AZSSLWxB6QzuHqELNxR2lSDhliovKxLFIEf0iO7etj9F8wUX
         /j/OWH8MlGsUi3hwcWWctGOf1Vy4ieQgXCSW3w6/89HcBSPf/N7isXEJXL5cu6OYZyCj
         q1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CRiddxaEw8fW9SLpYpOYQUnJ1fDXf7OlfOjKfKFVZ9k=;
        b=rqXHfG/8CqA0wcIgNcOM5Rwv6I+5wNjLnVAnc1RXe6gJgixffmDjMstGiW7Kv7NtkS
         FRFAMb5BLQrxAQ6HBQIJArpMD9NSsEGpHPYCD5mbEI5CZ3wuaB4QYRYn7ZSZUPVEeIqN
         jbxJBv+9Q+uP7uStZxWDGDqR9XOAnVtcjdqg6bU1C+0Utx8j2a8rwBxaN1aafDo7IRGG
         +6/aNPp06y4ulHe4qaRBjyBff2XHJkEfKYR1xnJ3xr69hU16eNHc1P9L1sJ1tAnB/nnL
         /XARmwOM381hUHQbWPWI7ZwleM9bzmM5R9fXFPompPu7SWHyzQcf8mAzo9iPRcQTwR8D
         eiuA==
X-Gm-Message-State: AOAM5303GOEm5NN4CORVxNUiBs2jY3lwKmcy/dXdi6eO7kaDgcIZHa/9
	CrrrBzoBD9OWhpIPGC/3ME6FNfSPMHigkvqYiHaWRa4Wa5w=
X-Google-Smtp-Source: 
 ABdhPJzWzl1LJAlUgPpScbqZFO5Uh3YkzBqUOAR+SMQsKyjLc3c3M94CY1wrOU6oBSdH5teGPVzmKsyC+VZnJfdaqSU=
X-Received: by 2002:a05:6214:c28:: with SMTP id
 a8mr19025270qvd.24.1639070941989;
 Thu, 09 Dec 2021 09:29:01 -0800 (PST)
MIME-Version: 1.0
References: <20211209172537.641755-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211209172537.641755-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2021 09:28:35 -0800
Message-ID: 
 <CAMKF1spEExuE879U_zghhDWY1gXF+JeTUpT8ftL1kg6sDATaow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] binutils: Drop mips gold patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 17:29:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159470

looks good.

On Thu, Dec 9, 2021 at 9:25 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> As mentioned in a followup to the patch upstream:
>
> https://sourceware.org/legacy-ml/binutils/2016-08/msg00215.html
>
> "With 2.16.1, --enable-gold is just ignored when building on mips"
>
> so we don't need the patch since 2.16.1.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../binutils/binutils-2.37.inc                |  1 -
>  .../0012-Detect-64-bit-MIPS-targets.patch     | 47 -------------------
>  2 files changed, 48 deletions(-)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
> index 8f91c6460d7..a3e0fbc769d 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.37.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
> @@ -29,7 +29,6 @@ SRC_URI = "\
>       file://0009-Change-default-emulation-for-mips64-linux.patch \
>       file://0010-Add-support-for-Netlogic-XLP.patch \
>       file://0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
> -     file://0012-Detect-64-bit-MIPS-targets.patch \
>       file://0013-Use-libtool-2.4.patch \
>       file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
>       file://0015-sync-with-OE-libtool-changes.patch \
> diff --git a/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
> deleted file mode 100644
> index 04f81c66718..00000000000
> --- a/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 02374940dd34fddd2b04624af3f23e01f9cb81cd Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 31 Mar 2017 11:42:03 -0700
> -Subject: [PATCH] Detect 64-bit MIPS targets
> -
> -Add mips64 target triplets and default to N64
> -
> -Upstream-Status: Submitted
> -https://sourceware.org/ml/binutils/2016-08/msg00048.html
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gold/configure.tgt | 14 ++++++++++++++
> - 1 file changed, 14 insertions(+)
> -
> -diff --git a/gold/configure.tgt b/gold/configure.tgt
> -index cac0866e628..24fbf641456 100644
> ---- a/gold/configure.tgt
> -+++ b/gold/configure.tgt
> -@@ -153,6 +153,13 @@ aarch64*-*)
> -  targ_big_endian=false
> -  targ_extra_big_endian=true
> -  ;;
> -+mips*64*el*-*-*|mips*64*le*-*-*)
> -+ targ_obj=mips
> -+ targ_machine=EM_MIPS_RS3_LE
> -+ targ_size=64
> -+ targ_big_endian=false
> -+ targ_extra_big_endian=true
> -+ ;;
> - mips*el*-*-*|mips*le*-*-*)
> -  targ_obj=mips
> -  targ_machine=EM_MIPS_RS3_LE
> -@@ -160,6 +167,13 @@ mips*el*-*-*|mips*le*-*-*)
> -  targ_big_endian=false
> -  targ_extra_big_endian=true
> -  ;;
> -+mips*64*-*-*)
> -+ targ_obj=mips
> -+ targ_machine=EM_MIPS
> -+ targ_size=64
> -+ targ_big_endian=true
> -+ targ_extra_big_endian=false
> -+ ;;
> - mips*-*-*)
> -  targ_obj=mips
> -  targ_machine=EM_MIPS
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159464): https://lists.openembedded.org/g/openembedded-core/message/159464
> Mute This Topic: https://lists.openembedded.org/mt/87616747/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

