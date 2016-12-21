Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 82250772C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 14:11:23 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g23so149529502wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bc4QwLY+hLbPK+6qWJot0SY1YLTLoIVAz+/2KRpZKCQ=;
	b=gLZzK6d0yQfiv3Nlnv6OFFipoM5oKWTGGTdfBh0a1KlMlUH9FYe4sva/wPYGexAO/3
	MLAtaUPREZkAyO6Q+PIbbo0lSB6AsihuLmPcfsMibt4Dc7ZBjHzTiSJ77FQSrrbprEKN
	mUPR2O7IDGu1gGYx8yVmB1Oe+5EFV2N1mIM6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bc4QwLY+hLbPK+6qWJot0SY1YLTLoIVAz+/2KRpZKCQ=;
	b=NXL6mC1HK6WOUqTyfuHhV1PexPUMhRsUPYdhenXHnNE3fejmsu7bqHG7tL53N3ZLIa
	JdBqR0o3XxXuUr2T+4EwNuBoaLn62DhBGIax2jJNZt7HhN7LQduttW6kGxAyUQumbrR5
	V4eG4nEuRY0AvADJB8p8i1jmjFN7ItK3BmXjhwI6B+k7Tet2CJLQ0pt1JYCBX9lFjZiO
	wtgfL8J/Wm9biXsAHDabvIB3+zT0JDTk94z3lOlAvOVIpPkd2OooXBzsnQrdYjgXXZkg
	kNuDucF+x23qyyyuaHCniPN76nr8svXEMWRunJpZoXas2KN/gYXwmjDIqWv0GioTGQ1A
	mgLw==
X-Gm-Message-State: AIkVDXJWlFzfq1EdCmrwqhyH3UgBg/3k13m+lEyFpzeBE6LtVOxkdUGqR/jTlNKtcF+G1W40Fdus2PjhqRr2ksl0
X-Received: by 10.28.15.138 with SMTP id 132mr4835325wmp.41.1482329484175;
	Wed, 21 Dec 2016 06:11:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.19.69 with HTTP; Wed, 21 Dec 2016 06:11:23 -0800 (PST)
In-Reply-To: <374bb6a728f368a801f961fb524290f205bb4625.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<374bb6a728f368a801f961fb524290f205bb4625.1482324587.git.patrick.ohly@intel.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Wed, 21 Dec 2016 16:11:23 +0200
Message-ID: <CAGNsrLBx=+yvgDAsaqz8mYm30WG0TVEV3eR2PNMj+VHK4ceSOw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: meta-luv <luv@lists.01.org>, "Neri, Ricardo" <ricardo.neri@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] iasl: move from meta-luv to OE-core
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
X-List-Received-Date: Wed, 21 Dec 2016 14:11:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi Patrick,

On 21 December 2016 at 15:11, Patrick Ohly <patrick.ohly@intel.com> wrote:
> From: meta-luv <luv@lists.01.org>
>
> This is an unmodified copy of
> github.com/01org/luv-yocto/meta-luv/recipes-extended/iasl revision
> 4be4329.
>
> iasl is also provided by the meta-oe layer's acpica recipe. iasl is a
> bit simpler and thus seems more suitable for OE-core.

Simpler in what sense? acpica recipe is trivial and provide fully acpica tools.
Would you mind to import meta-oe acpica recipe instead of providing a
reduced set of acpica for not much benefit?

> When the meta-oe layer is active, PREFERRED_PROVIDER_iasl-native must
> be set to avoid a warning. It can be set to "acpica-native" when
> something from acpica besides just iasl is needed.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-extended/iasl/iasl_20120215.bb | 27 +++++++++++++++++++++++++++
>  meta/recipes-extended/iasl/iasl_20150410.bb | 27 +++++++++++++++++++++++++++
>  meta/recipes-extended/iasl/iasl_20150515.bb | 27 +++++++++++++++++++++++++++
>  3 files changed, 81 insertions(+)
>  create mode 100644 meta/recipes-extended/iasl/iasl_20120215.bb
>  create mode 100644 meta/recipes-extended/iasl/iasl_20150410.bb
>  create mode 100644 meta/recipes-extended/iasl/iasl_20150515.bb
>
> diff --git a/meta/recipes-extended/iasl/iasl_20120215.bb b/meta/recipes-extended/iasl/iasl_20120215.bb
> new file mode 100644
> index 0000000..a14d2ec
> --- /dev/null
> +++ b/meta/recipes-extended/iasl/iasl_20120215.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "This is a cross development C compiler, assembler and linker environment for the production of 8086 executables (Optionally MSDOS COM)"
> +HOMEPAGE = "http://www.acpica.org/"
> +LICENSE = "Intel-ACPI"
> +LIC_FILES_CHKSUM = "file://asldefine.h;endline=115;md5=d4d7cf809b8b5e03131327b3f718e8f0"
> +SECTION = "console/tools"
> +PR="r1"
> +
> +DEPENDS="flex-native bison-native"
> +
> +SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "324c89e5bb9002e2711e0494290ceacc"
> +SRC_URI[sha256sum] = "b2b497415f29ddbefe7be8b9429b62c1f1f6e1ec11456928e4e7da86578e5b8d"
> +
> +S="${WORKDIR}/acpica-unix-${PV}/source/compiler"
> +
> +NATIVE_INSTALL_WORKS = "1"
> +BBCLASSEXTEND = "native"
> +
> +do_compile() {
> +       CFLAGS="-Wno-error=redundant-decls" $MAKE
> +}
> +
> +do_install() {
> +       mkdir -p ${D}${prefix}/bin
> +       cp ${S}/iasl ${D}${prefix}/bin
> +}
> diff --git a/meta/recipes-extended/iasl/iasl_20150410.bb b/meta/recipes-extended/iasl/iasl_20150410.bb
> new file mode 100644
> index 0000000..4e44817
> --- /dev/null
> +++ b/meta/recipes-extended/iasl/iasl_20150410.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "This is a cross development C compiler, assembler and linker environment for the production of 8086 executables (Optionally MSDOS COM)"
> +HOMEPAGE = "http://www.acpica.org/"
> +LICENSE = "Intel-ACPI"
> +LIC_FILES_CHKSUM = "file://Makefile;endline=22;md5=b15414d545d190713f1bab9023dba3be"
> +SECTION = "console/tools"
> +PR="r1"
> +
> +DEPENDS="flex-native bison-native"
> +
> +SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "7b49c79728dde65ab1ba4edbee6f0b22"
> +SRC_URI[sha256sum] = "1dce8d9edeb234fd553806987471f6206f429c2aab45556f62a5b2bfe2464875"
> +
> +S="${WORKDIR}/acpica-unix-${PV}"
> +
> +NATIVE_INSTALL_WORKS = "1"
> +BBCLASSEXTEND = "native"
> +
> +do_compile() {
> +       make iasl
> +}
> +
> +do_install() {
> +       mkdir -p ${D}${prefix}/bin
> +       cp ${S}/generate/unix/bin/iasl ${D}${prefix}/bin
> +}
> diff --git a/meta/recipes-extended/iasl/iasl_20150515.bb b/meta/recipes-extended/iasl/iasl_20150515.bb
> new file mode 100644
> index 0000000..c7e1cd5
> --- /dev/null
> +++ b/meta/recipes-extended/iasl/iasl_20150515.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "This is a cross development C compiler, assembler and linker environment for the production of 8086 executables (Optionally MSDOS COM)"
> +HOMEPAGE = "http://www.acpica.org/"
> +LICENSE = "Intel-ACPI"
> +LIC_FILES_CHKSUM = "file://Makefile;endline=22;md5=b15414d545d190713f1bab9023dba3be"
> +SECTION = "console/tools"
> +PR="r1"
> +
> +DEPENDS="flex-native bison-native"
> +
> +SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "c8c128b2d4859b52bc9c802faba2e908"
> +SRC_URI[sha256sum] = "bfa1f296a3cc13421331dbaad3b62e0184678cc312104c3e8ac799ead0742c45"
> +
> +S="${WORKDIR}/acpica-unix-${PV}"
> +
> +NATIVE_INSTALL_WORKS = "1"
> +BBCLASSEXTEND = "native"
> +
> +do_compile() {
> +       make iasl
> +}
> +
> +do_install() {
> +       mkdir -p ${D}${prefix}/bin
> +       cp ${S}/generate/unix/bin/iasl ${D}${prefix}/bin
> +}
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Cheers,
-- 
Fathi

