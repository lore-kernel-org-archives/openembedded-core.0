Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id A636B7D209
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 20:52:18 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id k64so6663127itb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=KoIG07fgh2Fg3p5LbOcJHV6ujeawkd4eiu6+ew+aB1w=;
	b=WdOOEw0UfdboAAGRRQuPyom/ZQY3KJfLvydEfghLzO4M+sbPdZuFY6fcqMoEFPIFdw
	IizeIq2NVs/oTaJki2pn8XFPNAMyhnQS0c+PHXji2Y2VQGS/w9bM/itPG/RWsIZkAIrR
	oEuqx/cJVQmNsuIC3cWCeuqFTdYmu0EQK2sWGBeRqZfsceGqHFzWk1YNXs2ZuNEhJxwP
	RoEnWWqTTbb16p2jBxAV4kNEfXhu23BM3ypIueo80PhamYB5byCUEhEEEFKEbJt0rjTA
	vW7l+YeMbrq1PqGaCdk1Gs54uf4r6t42cnZ3bnFzn+HExKo6tO0QEB/+uIW3Ku9I4vjs
	DopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=KoIG07fgh2Fg3p5LbOcJHV6ujeawkd4eiu6+ew+aB1w=;
	b=mbqAuUYTbWcyDCdtsZ4OpQzJw/w0MTh2vyMyMuEGuKGh/ddWTiRptFGnEh78TGI6Km
	8ZGPm9P8aJ/ynrC2Sdvtm8dCKaTheitFQcHpd1Wkvf9mVj/KzcYIjOI3QMLBL6C1F5Yg
	PL2dTEWVopkxEkOubMGm9vj+QbIs8zyJDgmQeAKDaDp8LtMJDXadgu4EMYd6fag0gmTf
	i2gETg1qlNbNyi28lbZFQlr8MZisIuCnLhivCAUEHEdbdV44jYXB1vXVslRmPbnoILA5
	dXqDcR7xx27857y3+Eg7V8iKnfbTqCHFYUAjOAnGoCw/MI9s3WFwIaUcz7Scs1WsmHye
	0r4Q==
X-Gm-Message-State: APjAAAW8w/pD8sFjlac2qxW0WZzqjy49bv/JoWqeP7Uc34q5FkgjujbL
	JjX6MLVTtuIBQOluSxHk6vjggVGCSFc=
X-Google-Smtp-Source: APXvYqyGGboIdHsg6+m6uLIV7wx1GDbRjPFLpbfjIuNHc9xEJSxRQhDb91kPIYnkAnG1NelQ9KHfyA==
X-Received: by 2002:a24:33d3:: with SMTP id k202mr455452itk.129.1555534339601; 
	Wed, 17 Apr 2019 13:52:19 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	a16sm31005itc.36.2019.04.17.13.52.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Apr 2019 13:52:18 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <17d9700be97553b4c807a33242914fafbfc058db.camel@gmail.com>
To: Alistair Francis <alistair@alistair23.me>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2019 15:52:17 -0500
In-Reply-To: <PSXP216MB0277954FFCBA2B28C7A2C6EEDD250@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
References: <PSXP216MB0277954FFCBA2B28C7A2C6EEDD250@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Subject: Re: [PATCH] u-boot: Fix missing Python.h build failure
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
X-List-Received-Date: Wed, 17 Apr 2019 20:52:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The PYTHON variable is already being passed to u-boot in EXTRA_OEMAKE
("PYTHON=nativepython"), perhaps is should be changed to pass PYTHON2
instead of patching u-boot?

On Wed, 2019-04-17 at 04:56 +0000, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  ...rt-pylibfdt-Use-Python-2-in-Makefile.patch | 37
> +++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
>  2 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-bsp/u-boot/files/0001-Revert-
> pylibfdt-Use-Python-2-in-Makefile.patch
> 
> diff --git a/meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-
> Python-2-in-Makefile.patch b/meta/recipes-bsp/u-boot/files/0001-
> Revert-pylibfdt-Use-Python-2-in-Makefile.patch
> new file mode 100644
> index 0000000000..a7c934d49e
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-Python-
> 2-in-Makefile.patch
> @@ -0,0 +1,37 @@
> +From 30f41eae3d7a3d07e1d62b98d11430d5b2d24513 Mon Sep 17 00:00:00
> 2001
> +From: Alistair Francis <alistair@alistair23.me>
> +Date: Sat, 13 Apr 2019 13:41:58 -0700
> +Subject: [PATCH] Revert "pylibfdt: Use Python 2 in Makefile"
> +
> +This reverts commit 03e6151d5bb42fd055e9c1e571440359bd5b5282.
> +
> +Revert the patch to avoid:
> +| scripts/dtc/pylibfdt/libfdt_wrap.c:149:11: fatal error: Python.h:
> No such file or directory
> +|  # include <Python.h>
> +|            ^~~~~~~~~~
> +| compilation terminated.
> +
> +errors when buildling u-boot in OE.
> +
> +Signed-off-by: Alistair Francis <alistair@alistair23.me>
> +Upstream-Status: Inappropriate [configuration]
> +---
> + scripts/dtc/pylibfdt/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/scripts/dtc/pylibfdt/Makefile
> b/scripts/dtc/pylibfdt/Makefile
> +index 15e66ad44d..c769d7db06 100644
> +--- a/scripts/dtc/pylibfdt/Makefile
> ++++ b/scripts/dtc/pylibfdt/Makefile
> +@@ -21,7 +21,7 @@ quiet_cmd_pymod = PYMOD   $@
> + 		CPPFLAGS="$(HOSTCFLAGS) -I$(LIBFDT_srcdir)"
> OBJDIR=$(obj) \
> + 		SOURCES="$(PYLIBFDT_srcs)" \
> + 		SWIG_OPTS="-I$(LIBFDT_srcdir) -I$(LIBFDT_srcdir)/.." \
> +-		$(PYTHON2) $< --quiet build_ext --inplace
> ++		$(PYTHON) $< --quiet build_ext --inplace
> + 
> + $(obj)/_libfdt.so: $(src)/setup.py $(PYLIBFDT_srcs) FORCE
> + 	$(call if_changed,pymod)
> +-- 
> +2.20.1
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc
> b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index a0212e1b6b..5e81cabdbd 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -10,6 +10,8 @@ PE = "1"
>  # repo during parse
>  SRCREV = "3c99166441bf3ea325af2da83cfe65430b49c066"
>  
> -SRC_URI = "git://git.denx.de/u-boot.git"
> +SRC_URI = "git://git.denx.de/u-boot.git \
> +           file://0001-Revert-pylibfdt-Use-Python-2-in-
> Makefile.patch \
> +          "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.20.1
> 
-- 
Joshua Watt <JPEWhacker@gmail.com>


