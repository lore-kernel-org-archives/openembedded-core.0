Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.4270.1612322830058264845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 19:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=luqLzrsl;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id l23so16615881qtq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 19:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fDkmKStEaehr5Dj9xC3Nh97PweP/bh8SCWGGOdZOUbA=;
        b=luqLzrslnBsgAzoe7OoLBKbCI1C0u/o7GbWK0VRUnOs3xoeIUnn1uyguD5s55ErBoq
         M/JHGkrdLYBgi9ZSYcctFjfygGwvcavKTFZk7gDBpTw859kswF03+AxFceDPRs0tGn2i
         1zzC6JU9INaXIKcuVC5Lewf8W3TZGGW2WcqVKSODqWvxfFZdtO3gZJQeHf4Iwi6El7+/
         2GIIt3wU1zwtmQc5y6JeHtaI5rHKZh2JwzrN0DjUdU8q2Ezrs+oqOhNR1mrYsDrVS9J6
         +IuhNsZE8swp3uR/f/6cr0Gd6j/lK7XgaDfr6rXFv7Xcp3fOSty/fKzerA92LA+Lh+wr
         9juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fDkmKStEaehr5Dj9xC3Nh97PweP/bh8SCWGGOdZOUbA=;
        b=UJDpQIxMgkFIg1IVK7EKH8IjnPKJTVnBkrGkqJbdNPJiAx8eyHAmMVEFgCkiP0khIA
         Hlr1PD2HpirGFR5Pc+xjg7zmujx0u5MRH2yWyEdvqKU9yFUZDPAkULt/L4SBJW5vFsvq
         ulC2+EAWX8wVbxxpqriqIj0aIWQX2V3ApRLdRBmidp0tvejsXOo2yvSSMrv8VJEURYgu
         Sj9A1CQFvCH0LVpb7FHI9lD873oj8lDKwenXyqNZtVX0nb1nS1S7WCO/vLv2eZxTzBFa
         cITAvS2n0nQhqWhwBCFXuFMcP3VjysjzJExpKRPjHs4an/Gv1cyc8yyFu3EDpF+tpvit
         EH3g==
X-Gm-Message-State: AOAM531BEMwcJDD0hfY+s1lz8vjoGluyyFwOnvi+Az4zYJwveeHb+QIJ
	Fv9cFw+4lrKU1EuRnlKJt/j3opIg0Gy23dyKVI8NEe/k8Uw=
X-Google-Smtp-Source: ABdhPJwllF8IY9/KWEhi1paDvBAvFJxIdUQtpZA78DBSqge11S94ux1oxoJA9vTpYsQzR07/eYhjZdtEkSKyhh5mmYo=
X-Received: by 2002:ac8:6f06:: with SMTP id g6mr945553qtv.80.1612322829167;
 Tue, 02 Feb 2021 19:27:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612322536.git.bruce.ashfield@gmail.com> <9da75cbd42a281f7c06bda22c3765966fe9a9ca3.1612322536.git.bruce.ashfield@gmail.com>
In-Reply-To: <9da75cbd42a281f7c06bda22c3765966fe9a9ca3.1612322536.git.bruce.ashfield@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 2 Feb 2021 19:26:43 -0800
Message-ID: <CAMKF1spF6reoG4kdfPRzf=g1hcLAw5KVL5CwLZ3hmJKT_=DwPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/8] linux-yocto/5.10: binutils 2.36 fixues
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Cool thanks for taking care of this.

On Tue, Feb 2, 2021 at 7:24 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Integrating the following commit(s) to linux-yocto/5.10:
>
>     cdca78778415 objtool: Fix seg fault with Clang non-section symbols
>     d3287798bd88 x86/entry: Emit a symbol for register restoring thunk
>
> With these, build issues with binutils 2.36 are resolved
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.10.bb               |  2 +-
>  .../linux/linux-yocto-tiny_5.10.bb             |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb  | 18 +++++++++---------
>  3 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> index 2c8cbeef87..1f1745c636 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> @@ -11,7 +11,7 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?= "d77b720057d0d014fcbf41746377fd3ce44f487b"
> +SRCREV_machine ?= "1033d642fd93675a91beae3c594d1e1078191ece"
>  SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> index 9fef2a8bdc..9c0ac98a94 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> @@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine_qemuarm ?= "ca3786c50e12f8ef14c41ea956ff1dbd66297a55"
> -SRCREV_machine ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
> +SRCREV_machine_qemuarm ?= "acfa890cd51fe66cdcee10c0eb031a07da423a3c"
> +SRCREV_machine ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
>  SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> index 72d811b3d6..b56dadea69 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> @@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
>  KBRANCH_qemux86-64 ?= "v5.10/standard/base"
>  KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "4fe9a8ec66463c630ae10795450e48198eea6bc6"
> -SRCREV_machine_qemuarm64 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
> -SRCREV_machine_qemumips ?= "80096aba0f08a7501b16d923190b87cf3addea05"
> -SRCREV_machine_qemuppc ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
> -SRCREV_machine_qemuriscv64 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
> -SRCREV_machine_qemux86 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
> -SRCREV_machine_qemux86-64 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
> -SRCREV_machine_qemumips64 ?= "c8a4e780d5f2dc7ebfb01ab78601ef7e23fb4fe9"
> -SRCREV_machine ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
> +SRCREV_machine_qemuarm ?= "3ea1273f3112f558eb8176bfc67b8dd65a3b16ac"
> +SRCREV_machine_qemuarm64 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
> +SRCREV_machine_qemumips ?= "9685593f232f431e8fc3a756d4fcb50ee3c6dea1"
> +SRCREV_machine_qemuppc ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
> +SRCREV_machine_qemuriscv64 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
> +SRCREV_machine_qemux86 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
> +SRCREV_machine_qemux86-64 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
> +SRCREV_machine_qemumips64 ?= "3bf957724edd501fbb634e271224b49aaf186bba"
> +SRCREV_machine ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
>  SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
>
>  # remap qemuarm to qemuarma15 for the 5.8 kernel
> --
> 2.19.1
>
>
> 
>
