Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7478C6B1EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:23:05 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i7so4175062oag.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=hn6+uC8ZYUdwO63kzSYNLe830fIlrvcUz9pJzYrd1MQ=;
	b=K/2wMRFsD0p1Z2xcM0Gqe671M2qbXZW30g9JHSHM1PZVzCsd586Y7Pz9Q6PXGqW5v0
	CgM28P2GlWYGOdNPH4qvOrsSh0C5fXS6T0vSJORgc65htxz0orRJGwXY7tLAJvfsaDV6
	+9ACKCzLM9ecFUNdjLPCu/HaChqb1AVzOGFEtAE4t2ZKKqHdoV2ZOI8FlSvGl8cv1fkG
	uHHKsWws5/Ri3iITBZYrOT+O1t0xBA41lsMs5mouziGzYhvpf0LRFl4BXsnGFdNAuC6z
	69xxptuEECmTt3Lz0hdN8YAOLs2S8pFcMQMXNtPswZ8tGqjMqCkGwtgNPAniBUV26gvS
	6TmA==
MIME-Version: 1.0
X-Received: by 10.182.232.225 with SMTP id tr1mr7756718obc.69.1374157385518;
	Thu, 18 Jul 2013 07:23:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Thu, 18 Jul 2013 07:23:05 -0700 (PDT)
In-Reply-To: <1374157082-20897-1-git-send-email-net147@gmail.com>
References: <1374157082-20897-1-git-send-email-net147@gmail.com>
Date: Thu, 18 Jul 2013 11:23:05 -0300
X-Google-Sender-Auth: kcngnlxfVGVaYyZ-CkbSY7ITDq0
Message-ID: <CAP9ODKrhA+0F5ALnbHG-2YAWWKYbjnmKpFSAOnmgpndtr=ftew@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade to 9.1.5
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
X-List-Received-Date: Thu, 18 Jul 2013 14:23:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 18, 2013 at 11:18 AM, Jonathan Liu <net147@gmail.com> wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  .../0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch       | 0
>  .../0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch   | 0
>  meta/recipes-graphics/mesa/mesa.inc                                   | 2 +-
>  meta/recipes-graphics/mesa/{mesa_9.1.3.bb => mesa_9.1.5.bb}           | 4 ++--
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-9.1.3 => mesa-9.1.5}/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch (100%)
>  rename meta/recipes-graphics/mesa/{mesa-9.1.3 => mesa-9.1.5}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
>  rename meta/recipes-graphics/mesa/{mesa_9.1.3.bb => mesa_9.1.5.bb} (79%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa-9.1.5/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> rename to meta/recipes-graphics/mesa/mesa-9.1.5/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> diff --git a/meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch b/meta/recipes-graphics/mesa/mesa-9.1.5/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
> rename to meta/recipes-graphics/mesa/mesa-9.1.5/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index ada1170..4f93b90 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -87,7 +87,7 @@ do_install_append () {
>      rm -f ${D}${libdir}/gallium-pipe/*.la
>      rm -f ${D}${libdir}/gbm/*.la
>
> -    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
> +    # it was packaged in libdricore and preventing upgrades when debian.bbclass was used
>      rm -f ${D}${sysconfdir}/drirc
>  }

This seem not related to the upgrade patch.

> diff --git a/meta/recipes-graphics/mesa/mesa_9.1.3.bb b/meta/recipes-graphics/mesa/mesa_9.1.5.bb
> similarity index 79%
> rename from meta/recipes-graphics/mesa/mesa_9.1.3.bb
> rename to meta/recipes-graphics/mesa/mesa_9.1.5.bb
> index a7ccbe6..49fa5dd 100644
> --- a/meta/recipes-graphics/mesa/mesa_9.1.3.bb
> +++ b/meta/recipes-graphics/mesa/mesa_9.1.5.bb
> @@ -8,7 +8,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
>             file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
>             "
>
> -SRC_URI[md5sum] = "952ccd03547ed72333b64e1746cf8ada"
> -SRC_URI[sha256sum] = "8d5dac2202d0355bff5cfd183582ec8167d1d1227b7bb7a669acecbeaa52d766"
> +SRC_URI[md5sum] = "4ed2af5943141a85a21869053a2fc2eb"
> +SRC_URI[sha256sum] = "89ea0d1afd90a87dab253777bfe414820c4aa3890add1487ca2b49f6b3e194fd"
>
>  S = "${WORKDIR}/Mesa-${PV}"
> --
> 1.8.3.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

