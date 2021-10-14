Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3B8C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:46:44 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.9745.1634219202946046807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mxOiLOMz;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id i20so23975069edj.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YTvzPYRmytrW+kquZ7yLkQUYcemXUYOk6uva8vz2nrU=;
        b=mxOiLOMzOO/bRbd1U9zJ5pzqOj3khnNxkRHNzUhBeAcXVcpxXckK0+xk3G1u4sGg7Y
         lqYkeEZWhC9mFX1LiqalC5rs+eAHOPSrGMhCZBfKj9xkpH5gIWyI9VJif9e6823jZvUn
         vF2+gkY3YW9lAdBTP8gnZ1SPo2uwjmGKxW4Ub1cYBnJh+p64lem7MyVBv6w00Ob39ptM
         OagszkyPsDNz+aPlEwQLa9q8MIHgqzo1/YGLQlS9ZR+sjV2ymJMkidrW2LgTYH+YHHYj
         7A3dDKB0WMaQr0zhZzFP4gDGbpTbqLcfB+8FNJxqWeO6D1KiTv5onWPxHzv61buqCY9g
         v1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YTvzPYRmytrW+kquZ7yLkQUYcemXUYOk6uva8vz2nrU=;
        b=QUooUN7UDC94NnqcP4c7+ZlFsUgjAZgswwFe07TP+ZR4+Sd+PQdaQlgv741g/o/vuX
         1hcyn162xM/+Ml8V6LVl8UMBmUrwpdO9Ibtc+6PoEbFIP8Uuay4bGFRGyRIwjDNUtXmt
         qtDIeKTiUWATOKqCXPMnhJMgrTlkHHHzwcq93yI5fL8VChOshnNtBXD2pGhE358V/oSD
         Yp2FymXBZkv6kla4lc//mGRrPMF0Maiis8Loit0x8dRvk2I7kWaf4T5jbFuNYZLS6SGC
         YCN9IQphRcxdIXAnmHnQJwYxklgqmBuQrmWBzsO+KT+961TOBjI6mXi/47EoRK3zqYHL
         +/+w==
X-Gm-Message-State: AOAM532mQzSMDXzvoVLDFJ/2Qoc0NYL+rLLp3mdfFApYR4HyE0sTZ1gK
	Z+WkyMqc1bUdmzMl9p/Tt8jGAwKA+g2lLSGhNGY=
X-Google-Smtp-Source: 
 ABdhPJy/5PaM5E7CPady0RURfIpPMIltKniZ7IHsCrXsdd6vGd/A/E99UlE5HuhD98II4TPwX5607ZeD/vbJUPO3VCM=
X-Received: by 2002:a17:906:d541:: with SMTP id
 cr1mr4131028ejc.81.1634219188984;
 Thu, 14 Oct 2021 06:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211014134049.2917058-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211014134049.2917058-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Oct 2021 09:46:17 -0400
Message-ID: 
 <CADkTA4Ny-DEEsUGkLZ8FwidPjYEeTd01L_TZC6H0-eK=jd34+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2 v2] kernel: Add KERNEL_DEBUG_TIMESTAMPS
 variable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 13:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156958

On Thu, Oct 14, 2021 at 9:40 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Change the "binary reproducibility" configuration within the kernel to
> work off a separate variable, defaulting to reproducible builds.
>
> This allows kernel developers wanting timestamps in their images to enable
> it easily and clearly without changing the rest of the reproduciblity
> code which they likely don't need to change anyway.

Looks good to me!  Thanks for the tweak.

Bruce


>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/kernel.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4acec1877e0..c1cea177b62 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -322,9 +322,11 @@ python do_devshell:prepend () {
>
>  addtask bundle_initramfs after do_install before do_deploy
>
> +KERNEL_DEBUG_TIMESTAMPS ??= "0"
> +
>  kernel_do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> -       if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> +       if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
>                 # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
>                 # be set....
>                 if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> @@ -364,7 +366,7 @@ kernel_do_compile() {
>
>  do_compile_kernelmodules() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> -       if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> +       if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "0" ]; then
>                 # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
>                 # be set....
>                 if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156955): https://lists.openembedded.org/g/openembedded-core/message/156955
> Mute This Topic: https://lists.openembedded.org/mt/86312624/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

