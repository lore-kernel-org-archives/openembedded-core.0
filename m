Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.11579.1608821311086861853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 06:48:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YnlCBJXL;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id r5so2279708eda.12
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 06:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+70Xl5vIFNgJ3d4TAgAbZr05ocRDZ33I9Fcpda9PMY4=;
        b=YnlCBJXL8LUuFClIh7d0xAblh9NKpdSHPRKqmIbYv6U9D3U/mJUuXkgAAcrNxjQhEO
         PGAbq0PCIhI6Md17Aip46zb10x6zWUOUOmPGyE6/9sungIlnPvO4DeRmrdikKiY7WrlG
         j7Vdcac9LVp+w47hhAaEmOZrcIvr2v2tLFZfIS97DhTYvvWrXY37XTn6R9gW17YxVr83
         slkcyzRoNgZu6F0lMjNgPD4+ZTSQh8ChT8lYlX457m6ZDpVSrkFdAyl0AS1j3y7oT+/r
         JKDpoHA5O3JWQb1ysT1xngv0VRBp9QU3Fy9NUp8ok+b5LzUEIl6QLgGkbn4DVdtLh74p
         2ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+70Xl5vIFNgJ3d4TAgAbZr05ocRDZ33I9Fcpda9PMY4=;
        b=ZsSBfk+BvBJQma1VRqNqyMg4CT2riSkHZjyX3BTxjsn7ANDY6YIMeXSDUQicAJwAQu
         4ucgg/Hhx13jMf2yJODVx3QV4+py90OxCEBNICdSDCAtU0R2DRfRMLxn6+jpLiMmJAt9
         jNAj/PudqjO/zKiVGfr9cpcB1mBXWmFG8+hoEZjIZNBjNTPRDsU7w3EQbOvWUZ7aVTNp
         tBKMHNO+A3UqDF6JI5KPiWWJjfjCnpuKJwpb13WEqUErd5xqnjFxNo+GtYb6AItd6qws
         oD/jZiT84mLVO94ghaU+YMdCEv6CYerHsA3GaEkhoc81cEbHC1EaRD3lG5GUcSgYvbpJ
         fPLw==
X-Gm-Message-State: AOAM532mVacwyXf5ard/X38T0doHWN0foJQ3K3Bp0057/1DGGCIa+5qi
	axtC96um0WihIU6OzIB0GIydn4jfCfGxEOreHDFQeg==
X-Google-Smtp-Source: ABdhPJypEU0oUV/UnLdXyJz5Cl6JXRYfHCGjZWq4a78zX5oF0U5Ty5kO3Se4EcAjCxhXvp8Y+i/7Io8ffhNqpI1Rcdw=
X-Received: by 2002:a50:d60f:: with SMTP id x15mr28456882edi.224.1608821309489;
 Thu, 24 Dec 2020 06:48:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608646697.git.bruce.ashfield@gmail.com> <dc87d7fa7cb4fb8870daf5277aa9b993e371f9d6.1608646697.git.bruce.ashfield@gmail.com>
In-Reply-To: <dc87d7fa7cb4fb8870daf5277aa9b993e371f9d6.1608646697.git.bruce.ashfield@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 24 Dec 2020 04:48:18 -1000
Message-ID: <CAOSpxdbZ766i_xyxwCAGwr3H8Zfahcjtrwoj-CsnLPWuDq=8RQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/9] linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 22, 2020 at 4:28 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Integrating the following configuration commit(s):
>
>     72a1fe336d7 qemuppc: configure the CONFIG_SCSI to '=y'

What is the reason behind this change?  Trying to decide if it is
something I should take for dunfell (minus the 5.8 changes of course)

Thanks!

Steve

>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> index d415c3c63a..8bc93bf438 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> @@ -12,7 +12,7 @@ python () {
>  }
>
>  SRCREV_machine ?= "1ab0814d41526c27888888188d884884c8b4a52d"
> -SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
> +SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
> index 033dfc76a2..f5f7c87a31 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
> @@ -12,7 +12,7 @@ python () {
>  }
>
>  SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> -SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
> +SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> index 33ca5856a3..3b462d5872 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> @@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>
>  SRCREV_machine_qemuarm ?= "9a4d015ce467549f5f587a5001cd333ea7182aa2"
>  SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
> -SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
> +SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
> index 50cee07620..4afddae092 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
> @@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>
>  SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
>  SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> -SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
> +SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> index 1a14c8bdb5..456875a7b5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> @@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
>  SRCREV_machine_qemux86-64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
>  SRCREV_machine_qemumips64 ?= "f8d0d215cf1a02a1e2915b8d57fb8f9f29e5dc49"
>  SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
> -SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
> +SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
>
>  # remap qemuarm to qemuarma15 for the 5.4 kernel
>  # KMACHINE_qemuarm ?= "qemuarma15"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
> index af576891e2..3f94d22654 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
> @@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
>  SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
>  SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
>  SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> -SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
> +SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
>
>  # remap qemuarm to qemuarma15 for the 5.8 kernel
>  # KMACHINE_qemuarm ?= "qemuarma15"
> --
> 2.19.1
>
>
> 
>
