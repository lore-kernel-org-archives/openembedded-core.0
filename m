Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web08.4580.1603922223944303409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z7TIYyZ3;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id h19so673485qtq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5JzFLFVcXnX/Tm5Bk/LWJ4CH84XHCD6uByN5YSvruLI=;
        b=Z7TIYyZ3Mc1UsqvNb99azOCc/gVB8lAUPxTj7K/rnPBek8NW/POJfVlb9cF7nQaF0B
         gwdqFzCthJASlL2xuOxPAPZSf8+yqD2jYI8dYQLthpt80PHNEl+M/9k2Xc/azkLCw1S3
         Unp9/x39U/FJZJkGMt3k7EbulS8S2fpBb8bzq2b4pv/Swmna9bo/cokqKfzj54rjl4T3
         t65HZz6iyYgWKtcuub1fjP1sl8HA94vGWSjsjKOmuQAikbHNT21UcVKmJeLeBsKTjlS+
         a5Nlq6eINkWqVc4mg02Mn6d3LnFdZXGx27Ld+z0D3fgfAizpE3C+4skasb6qslhG67OW
         GLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5JzFLFVcXnX/Tm5Bk/LWJ4CH84XHCD6uByN5YSvruLI=;
        b=nLhe2vAJosJ/Eg9vd/BKbPtfZM26TZZEbKy1hbn5mvLwXeNxc915fFjMgxIu0t+ElX
         Rrk8OLtuoxFDH6uawQohA/ymgnnuJTFD0y0qnTkRr3UZOxq0yXAsiCbpr8P26okSCX6j
         ZJXUcnfufZDLuZ2/z3302fZTn7sBKZyPdtdUmSWsrDXGd2k2rex4f8K2l0xK/LLdGLXx
         ktDwACfiP4pGeDufkv2tjMOZhBfzcj3bqOuBgj8qGT9HgePstGJvoR3/+IO5CsdPhr4N
         CxTUSbgYz4JtsBFlbeWbgccpKhuygQh8Hkm+pg7HVvtifO/Jf9QLTixTP+3Cg3Jv1mAO
         dgdg==
X-Gm-Message-State: AOAM533hGIAAwEU+Y5XDWA4c2D8SacLIAb7S9U0KHgWD6LFMKSV6S1VT
	XBOPSrlWihAO5i93gzFMn8xOYv3XvL1deTXYWm4=
X-Google-Smtp-Source: ABdhPJybVDS0OvGCloLk5es7XoO/DZhCWCcKCWAZaGZ3VbYkW5HnaLPhPY9XPNXVReDgIP7ZxN5521YIbv3uYmob9XI=
X-Received: by 2002:ac8:5985:: with SMTP id e5mr1005280qte.88.1603922222992;
 Wed, 28 Oct 2020 14:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201028210558.21070-1-alex.kanavin@gmail.com> <20201028210558.21070-4-alex.kanavin@gmail.com>
In-Reply-To: <20201028210558.21070-4-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 28 Oct 2020 14:56:37 -0700
Message-ID: <CAMKF1sr1mHEyzgDaYGYK8Hk56ALN0HMqoPWu3KhKibe6UVAYuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/33] python3-pygobject: upgrade 3.36.1 -> 3.38.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 28, 2020 at 2:06 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...thon3-pygobject_3.36.1.bb => python3-pygobject_3.38.0.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pygobject_3.36.1.bb => python3-pygobject_3.38.0.bb} (78%)
>
> diff --git a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
> similarity index 78%
> rename from meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
> rename to meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
> index 0a34d4373f..b4427050f5 100644
> --- a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
> +++ b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
> @@ -14,8 +14,7 @@ SRC_URI = " \
>      http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
>      file://0001-Do-not-build-tests.patch \
>  "
> -SRC_URI[md5sum] = "ebfebc4533856572281add29f08412bf"
> -SRC_URI[sha256sum] = "d1bf42802d1cec113b5adaa0e7bf7f3745b44521dc2163588d276d5cd61d718f"
> +SRC_URI[sha256sum] = "0372d1bb9122fc19f500a249b1f38c2bb67485000f5887497b4b205b3e7084d5"
>
>  UNKNOWN_CONFIGURE_WHITELIST = "introspection"
>
> @@ -27,7 +26,7 @@ RDEPENDS_${PN} += "python3-pkgutil"
>
>  # python3-pycairo is checked on configuration -> DEPENDS
>  # we don't link against python3-pycairo -> RDEPENDS
> -PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python3-pycairo, python3-pycairo"
> +PACKAGECONFIG[cairo] = "-Dpycairo=enabled,-Dpycairo=disabled, cairo python3-pycairo, python3-pycairo"
>

is this a bug fix ? or a new change

>  BBCLASSEXTEND = "native"
>  PACKAGECONFIG_class-native = ""
> --
> 2.29.0
>
>
> 
>
