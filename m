Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (unknown [209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 29A4561F16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 08:41:20 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id c1so495752igq.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 01:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kLJK2ftTClNmNu6YyFqq8CmR5i/0Kx+keGYOkmkejZk=;
	b=HWy7qfxuUepRL3eOOnUnEIIqB+RxIQKWVLPn6WOzDi9IALTLFIuqKOTwHVrA5hoGcK
	LWyYPZTGG5vJj+DeTT6+RdjE7+HJuRni780j7ZF5vYAG7SeTYeNCbbsaM/DiP+Qi9oGk
	jLWyeLVgpEkLtinFmmNGMrbFilrVoS31LaFSqqVUphvP99IrK2tSIrxkYhPCtZ3JrZTd
	yS2zxf+OSDp2CATeMQz8OV5jgdPNB8ExJ72FawkbXvhpNNudrWyWeTQEZVApDFP1Vgk8
	2hAyCGcewntOjkuWBbNbH6Nmit8Ir2diqAkCW+JDKlGXzI4wPBZT0B+DtSTFS1MKboRp
	ZWyA==
X-Received: by 10.51.17.99 with SMTP id gd3mr31229956igd.2.1400229681569; Fri,
	16 May 2014 01:41:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Fri, 16 May 2014 01:40:51 -0700 (PDT)
In-Reply-To: <1400226305-5166-1-git-send-email-b40527@freescale.com>
References: <1400226305-5166-1-git-send-email-b40527@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 May 2014 01:40:51 -0700
Message-ID: <CAMKF1spxe7wAPvbGHB94n3bvHjNO5K+jnnrXHMzpDaYMtfqntg@mail.gmail.com>
To: Zongchun YU <b40527@freescale.com>
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] doxygen: add recipe
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
X-List-Received-Date: Fri, 16 May 2014 08:41:25 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 16, 2014 at 12:45 AM,  <b40527@freescale.com> wrote:
> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>
> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> ---
>  .../doxygen/doxygen-native_1.8.6.bb                |   23 ++++++++++++++++++++

Commit message should say that its adding recipe for doxygen-native
and not oxygen

>  1 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
>
> diff --git a/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb b/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
> new file mode 100644
> index 0000000..eac4c9b
> --- /dev/null
> +++ b/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "Utilities for generating documentation from source code"
> +HOMEPAGE = "http://www.stack.nl/~dimitri/doxygen/index.html"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b380c86cea229fa42b9e543fc491f5eb"
> +DEPENDS = "flex-native bison-native"
> +
> +SRC_URI = "http://ftp.stack.nl/pub/users/dimitri/doxygen-${PV}.src.tar.gz"
> +
> +SRC_URI[md5sum] = "9385dc52f0627875f8fa758e754ec674"
> +SRC_URI[sha256sum] = "6a718625f0c0c1eb3dee78ec1f83409b49e790f4c6c47fd44cd51cb92695535f"
> +
> +inherit native
> +
> +EXTRA_OECONF = "--prefix ${prefix}"
> +
> +do_configure () {
> +    ./configure ${EXTRA_OECONF}
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=${D} MAN1DIR=share/man/man1
> +}
> --
> 1.7.0.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

