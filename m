Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id E1FD97C97B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 23:02:23 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id w18so9039695itj.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 15:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XMiEjHpd0EAApdHcXsmWUN7XhiWE65bfd0N8qH0oYew=;
	b=hh0hX1XbhLkLGdh4Z1m4WixwzzwKI1oCOUDTTNpAIAIxFE3tDk5gQtYK3QOrWUPqAL
	KXIvWFP9GLbZr4EqmkkflR0fyLTdo9i6uYkkjaOp+fY71ESCeY17OAARw9STF7RetJ9B
	rzRIR71nrtWPRi0qLehwhu43uQMjiFOpsKyZof98eJXXlEexsGfTvOuykQ0KA56FT60u
	WbZf4CTfidmrtyrbGWw3Gh7s4PZGyIlKRqogB6ec1LTLPiME8pH8Id2OXol+pLxR+DZJ
	N87sNVRfvJHpZf0rj5g+rgSRn1s0ULupPXrCABxv/hakuEliTtfvQUjktz/T0uPYjx+L
	PKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XMiEjHpd0EAApdHcXsmWUN7XhiWE65bfd0N8qH0oYew=;
	b=lklrAvGaRJjnt9BinqxvPiFyKBo9NHV/IwizRpAYKSGrGKZAoOuLhOw8XLrg9IWCAT
	22p+LoJq6tt2oWch5u8koLkz9/JCaX2BrbdwHDwvZv9BCdIZzJOY4s+XMWHkIg0aj57o
	A1tERIxa486Z4470nktlc9U0YIS4CHKI//TlLQxuePWEqGC9O/1B4faXZW44hXhWJr+n
	VwNuDsKWcoFyhrCElyZbFN6shVDAp4yU8cKEAt8lz7O9uxnUM5Umo/hCYKobvhFJ4OVE
	Fmx7tfPGj22Ib1LwYyShx0uYHPSEgtMexaXQJ/Uih7AvWsFKy7Wt1S+ENq5CJh7Lsg3M
	YaSA==
X-Gm-Message-State: AHQUAub3hZiV+dhLUhc/6sPbtLCPHxiKtxBtYH30Q/y6NHh0l6B6TjNy
	e+7QrjZVaYV1GBZAhQwAC5rZHo8xeE6RZVOZcWDrkg==
X-Google-Smtp-Source: AHgI3IbdvJQkvMtiVl/uwisuecFM3XTypyj0fDz9jp9yjL8GsaDPpUI2yHD/r3pEReSz063jYHXBvmnDLAAP+grZLME=
X-Received: by 2002:a24:2ec2:: with SMTP id i185mr7478253ita.62.1551049344721; 
	Sun, 24 Feb 2019 15:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20190221221834.37807-1-raj.khem@gmail.com>
In-Reply-To: <20190221221834.37807-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 24 Feb 2019 23:02:13 +0000
Message-ID: <CAJTo0Lb_aF90SE4Exc80P5SH31u1SErPSsvsWtkfYiPz6xHVpQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: Fix build failure with gold linker
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Feb 2019 23:02:24 -0000
Content-Type: text/plain; charset="UTF-8"

Have you sent this upstream?

Ross

On Thu, 21 Feb 2019 at 22:19, Khem Raj <raj.khem@gmail.com> wrote:
>
> Explicitly link in libfribidi
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gtk+/gtk+3/link_fribidi.patch             | 19 +++++++++++++++++++
>  meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb       |  1 +
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch b/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
> new file mode 100644
> index 0000000000..e4bbd799f1
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
> @@ -0,0 +1,19 @@
> +Link with libfribidi, this is to avoid under linking where these functions are
> +used but the library is not linked in, and they are marked undefined by BFD linker
> +but gold linker refuses to link
> +
> +| ./.libs/libgdk-3.so: error: undefined reference to 'fribidi_get_bidi_type'
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +
> +--- a/gdk/Makefile.am
> ++++ b/gdk/Makefile.am
> +@@ -55,6 +55,7 @@ LDADD =                                      \
> +       -version-info $(LT_VERSION_INFO)        \
> +       -export-dynamic                         \
> +       -rpath $(libdir)                        \
> ++      -lfribidi                               \
> +       $(no_undefined)
> +
> + #
> diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> index 799cbd4707..92c9a3ebfb 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> @@ -6,6 +6,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
>             file://0001-Hardcoded-libtool.patch \
>             file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
>             file://0003-Add-disable-opengl-configure-option.patch \
> +           file://link_fribidi.patch \
>            "
>  SRC_URI[md5sum] = "32862355c08f6af3e7848c695cd4081b"
>  SRC_URI[sha256sum] = "0be5fb0d302bc3de26ab58c32990d895831e2b7c7418d0ffea1206d6a3ddb02f"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

