Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA247E7E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 13:30:16 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id p144so1857609qke.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dK7+DNjWygzeCC6BgB7Ws7NhHJqmh7+H2+IBgtDpSIU=;
	b=VQ7fQgLeqMa0B3T8tAAGScsGnRXoJSIw8mfJv14B70rhTYEibHH0aAZhX+ETDo2who
	UFIPEmDlMdQSA7tcXt07MPxYWPjwrtzy+/9wBqMccY8qqVXXKFNAch0YOGL8TWVgN6EJ
	UHydaMZ/kJ9Mxv3d3gmZDAc1c7MTIU9XCHaEhMkER7fUtDIMr8A9VkBTejKrCh+/kG9a
	Ifw+XklbFAuyWqArbN/apF44vHPl8cpJNgkkaTL+QDinkUrt3QJUWyM17dzm7bZSXCZy
	8SrqKowqS+cx2UT7/7uCP7xgiEqnTRng5xibkJrMg8hiLFdyWVnVeMkxrbPf7OBBgJw8
	QAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dK7+DNjWygzeCC6BgB7Ws7NhHJqmh7+H2+IBgtDpSIU=;
	b=JBbv/72IS0d7KBxNp87o6uKfLa+bD7SO0ERzLC6IUMvcy6atr7VZ2lg9ZxPTPXeUDq
	3SlN2u5ba72ha4IvMPzS0CSXdBcdvYaELE0rneQ58Xgx+7Yk7Aj3hi0UfB5HZq6G4nCa
	S1Hkacs5+SpR8du0F0vjjEbrz7o8bn1Tg04XXVrGjvjY642aUlMhd/ugCxnNGPkYCW44
	4sEUyXYG3/iLcxaetNUSpHD+vg2+DV3QtPWkWXGe6923YWJXnsSyHmQdWKNNHYiBobwX
	Sr1vXR70EIAdeYCa3LB5F8jVL0n5S/qtjzbkbHEd6nTj5BmkELndUMRAzNIylGbwp4O3
	YPpA==
X-Gm-Message-State: APjAAAUOKte5Da9FtCVBFf32pLmFxbyc1rye7pI8JFhMOYuUufhL9dtM
	59JQROBxSDWyJ2Y5sP5lljczugWCC0XALFPkmU8=
X-Google-Smtp-Source: APXvYqwwfkvvNbmO5KlWTm2NV9WOCqe3LYwx0/whqCDIX3ND8YLwAo5PsGUO+Shvv3RsDwuXkWKoFpG4Z1hz+jQReZ8=
X-Received: by 2002:a37:c81:: with SMTP id 123mr839684qkm.474.1561037417008;
	Thu, 20 Jun 2019 06:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190612203536.32162-1-ross.burton@intel.com>
	<20190612203536.32162-2-ross.burton@intel.com>
In-Reply-To: <20190612203536.32162-2-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jun 2019 07:29:50 -0600
Message-ID: <CAMKF1spcPpD1KokGLBrFLj+1pxWbTgq=OpYwSPozaqsJ8tQ_7Q@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] efibootmgr: add
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
X-List-Received-Date: Thu, 20 Jun 2019 13:30:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 12, 2019 at 2:36 PM Ross Burton <ross.burton@intel.com> wrote:
>
> This was in meta-oe but EFI is sufficiently widespread now that we need it in
> core.
>
> The recipe is based on the one in meta-oe but with several updates.
>

now there is a patch to meta-oe to remove it and I see built failure
with clang/musl on x86_64

make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.

see
https://errors.yoctoproject.org/Errors/Details/249267/

meta-oe one did not have this error.

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../efibootmgr/0001-remove-extra-decl.patch        | 31 ++++++++++++++++++++
>  meta/recipes-bsp/efibootmgr/efibootmgr_17.bb       | 34 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
>  create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
>
> diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
> new file mode 100644
> index 00000000000..42f3a8182df
> --- /dev/null
> +++ b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-remove-extra-decl.patch
> @@ -0,0 +1,31 @@
> +From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
> +From: Peter Jones <pjones@redhat.com>
> +Date: Wed, 13 Jun 2018 09:41:01 -0400
> +Subject: [PATCH] remove extra decl
> +
> +Signed-off-by: Peter Jones <pjones@redhat.com>
> +
> +Upstream-Status: Backport [git://github.com/rhinstaller/efibootmgr.git]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
> +---
> + src/efibootmgr.c | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/src/efibootmgr.c b/src/efibootmgr.c
> +index de38f01..4e1a680 100644
> +--- a/src/efibootmgr.c
> ++++ b/src/efibootmgr.c
> +@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
> +                                              "invalid numeric value %s\n",
> +                                              optarg);
> +                       }
> +-                        /* XXX efivar-36 accidentally doesn't have a public
> +-                         * header for this */
> +-                      extern int efi_set_verbose(int verbosity, FILE *errlog);
> +                       efi_set_verbose(opts.verbose - 2, stderr);
> +                       break;
> +               case 'V':
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> new file mode 100644
> index 00000000000..0e5a81e3166
> --- /dev/null
> +++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION = "Linux user-space application to modify the EFI Boot Manager."
> +SUMMARY = "EFI Boot Manager"
> +HOMEPAGE = "https://github.com/rhboot/efibootmgr"
> +SECTION = "base"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
> +
> +DEPENDS = "efivar popt"
> +
> +COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
> +
> +SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
> +           file://0001-remove-extra-decl.patch \
> +          "
> +SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig
> +
> +# The directory under the ESP that the default bootloader is found in.  When
> +# wic uses a subdirectory, this should use the same one too.
> +EFIDIR ?= "/"
> +
> +EXTRA_OEMAKE += "'EFIDIR=${EFIDIR}'"
> +
> +CFLAGS += " -Wno-error"
> +
> +do_install () {
> +       oe_runmake install DESTDIR="${D}"
> +}
> +
> +CLEANBROKEN = "1"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

