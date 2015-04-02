Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id E78B56AC56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 22:15:49 +0000 (UTC)
Received: by paboj16 with SMTP id oj16so15791141pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Apr 2015 15:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=CJgyCCTsgBu8i3lXWF5ogBUcy+udgDRptBZJ+iMEMTU=;
	b=LcjBiv2w+qT+omr/jnVKlXiXqeokHFihiDcD2p8r2uTxM687ORWqBT0SEc4nOjC1Lt
	hvwOLTGtV0VRLCk+hXRovirnL+idbbZhWxJrAo6TK9ocLgxOSQKwHHBjyQbWIG6Ygbi1
	n7RTFF0H8TrIYPxdUBmyfYfdfB01wo4Uu4/TW0VHTwwygeKEc86fu4rs/OEtiqPLOTOf
	ccGrSi9RPFlCHYgEZLQFv+6bZD0dv2Kic8DsqVdCTWMFu7Mgh0tGpvV75W/6Y2OjmrQd
	ZZQ3k/fujFruoor5njvZREvjoHnWj5ggOqh6fqAlMz/KhkdSTaT5NWwwe/o8twlxuEz3
	2kSQ==
X-Received: by 10.70.35.193 with SMTP id k1mr91041318pdj.46.1428012950771;
	Thu, 02 Apr 2015 15:15:50 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:fc0f:299c:df20:874a?
	([2601:9:500:ece:fc0f:299c:df20:874a])
	by mx.google.com with ESMTPSA id fg2sm6180079pbc.45.2015.04.02.15.15.49
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 Apr 2015 15:15:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <711934cddbc4f8c699487c16e33715cd9a6d5a57.1427874748.git.liezhi.yang@windriver.com>
Date: Thu, 2 Apr 2015 15:15:49 -0700
Message-Id: <787EF217-A307-4291-A825-2678CF8D9691@gmail.com>
References: <cover.1427874748.git.liezhi.yang@windriver.com>
	<711934cddbc4f8c699487c16e33715cd9a6d5a57.1427874748.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] glibc: fix a tpo
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
X-List-Received-Date: Thu, 02 Apr 2015 22:15:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 1, 2015, at 12:53 AM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
> Fixed a typo:
> name-target-directory -> make-target-directory
>=20
> There is no name-target-directory, it should be make-target-directory,
> this fixed the error:
> /bin/bash: /path/to/elf/runtime-linker.T: No such file or directory
> Makefile:361: recipe for target '/path/to/elf/runtime-linker.st' =
failed
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> .../glibc/glibc/elf-Makefile-fix-a-typo.patch      |   36 =
++++++++++++++++++++
> meta/recipes-core/glibc/glibc_2.21.bb              |    1 +
> 2 files changed, 37 insertions(+)
> create mode 100644 =
meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
>=20
> diff --git =
a/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch =
b/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
> new file mode 100644
> index 0000000..ec48006
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
> @@ -0,0 +1,36 @@
> +=46rom 6207fb45553ee98f2f326883b7c21b76c8267343 Mon Sep 17 00:00:00 =
2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Tue, 31 Mar 2015 02:31:25 -0700
> +Subject: [PATCH] elf/Makefile: fix a typo
> +
> +Fixed a typo:
> +name-target-directory -> make-target-directory
> +
> +There is no name-target-directory, it should be =
make-target-directory,
> +this fixed the error:
> +/bin/bash: /path/to/elf/runtime-linker.T: No such file or directory
> +Makefile:361: recipe for target '/path/to/elf/runtime-linker.st' =
failed
> +
> +Upstream-Status: Pending


This is already fixed upstream so please mark it appropriately.

commit e8b6be0016f131c2ac72bf3213eabdb59800e63b
Author: Andreas Schwab <schwab@suse.de>
Date:   Mon Mar 2 15:47:56 2015 +0100

    Fix parallel build error

> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + elf/Makefile |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/elf/Makefile b/elf/Makefile
> +index e5b142c..62fe245 100644
> +--- a/elf/Makefile
> ++++ b/elf/Makefile
> +@@ -358,7 +358,7 @@ $(objpfx)interp.os: $(elf-objpfx)runtime-linker.h
> +=20
> + $(elf-objpfx)runtime-linker.h: $(elf-objpfx)runtime-linker.st; @:
> + $(elf-objpfx)runtime-linker.st: $(common-objpfx)config.make
> +-	$(name-target-directory)
> ++	$(make-target-directory)
> + 	echo '#define RUNTIME_LINKER =
"$(rtlddir)/$(rtld-installed-name)"' \
> + 		> ${@:st=3DT}
> + 	$(move-if-change) ${@:st=3DT} ${@:st=3Dh}
> +--=20
> +1.7.9.5
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb =
b/meta/recipes-core/glibc/glibc_2.21.bb
> index 91feff5..fcef4ff 100644
> --- a/meta/recipes-core/glibc/glibc_2.21.bb
> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> @@ -25,6 +25,7 @@ SRC_URI =3D =
"git://sourceware.org/git/glibc.git;branch=3D${BRANCH} \
>            file://0001-Add-unused-attribute.patch \
>            =
file://0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch \
>            =
file://0001-yes-within-the-path-sets-wrong-config-variables.patch \
> +           file://elf-Makefile-fix-a-typo.patch \
>            ${EGLIBCPATCHES} \
>           "
> EGLIBCPATCHES =3D "\
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


