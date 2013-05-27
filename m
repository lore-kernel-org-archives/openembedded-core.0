Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 239F16A491
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 23:23:10 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc17so7184822pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 16:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=ObGcObocTAoQRrMaZvAEwkzNw2TOELy51DvVVRZMRVE=;
	b=AUW2hczVaaKxV4HPps5nkhTaA40QY/NvG23NOenLVKan1ZBag4zAsXSuhuBqPfWRCa
	1ro+HLRg9LhtlRMN1zgijxCCqH/KOf3820nYVpe6NrulLgjaFISPAUoUSEZB3GDlU1pH
	FK1LPcpB87xQJJl4NZ+WxG80Ui4dpY/7hU27cHgxu+fes0KRhuop/k/5kF6SGvh7gd2U
	CyK15pZlfIrUzpgPuESm3MGLsuak/MGVHL+8CK61Q2NUXtdANBs8/3BohRXvS249PIfs
	kwGTlBN66PrLNqhUf8pHg0Fb7DHfXuF3oNmaH/dnI7Hc1YA/ZDabGI3XdNfdFZKcEbfm
	UKgw==
X-Received: by 10.66.67.11 with SMTP id j11mr31644698pat.220.1369696991008;
	Mon, 27 May 2013 16:23:11 -0700 (PDT)
Received: from [192.168.1.91] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPSA id 10sm30166929pbr.45.2013.05.27.16.23.09
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 May 2013 16:23:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1369665656-20275-1-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Mon, 27 May 2013 16:23:09 -0700
Message-Id: <CCC27A1E-27F7-4D70-B7A5-30F2118D3D0C@gmail.com>
References: <1369665656-20275-1-git-send-email-marcin.juszkiewicz@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc 4.8: use /lib/ for AArch64
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
X-List-Received-Date: Mon, 27 May 2013 23:23:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 27, 2013, at 7:40 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
> .../gcc/gcc-4.8/use-lib-for-aarch64.patch          | 23 =
++++++++++++++++++++++
> 2 files changed, 24 insertions(+)
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc =
b/meta/recipes-devtools/gcc/gcc-4.8.inc
> index a9786da..5142c0f 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -66,6 +66,7 @@ SRC_URI =3D =
"${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> 	   =
file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
> 	   file://0035-wcast-qual-PR-55383.patch \
> 	   file://gcc-4.8-PR56797.patch \
> +	   file://use-lib-for-aarch64.patch \
> 	  "
> SRC_URI[md5sum] =3D "e6040024eb9e761c3bea348d1fa5abb0"
> SRC_URI[sha256sum] =3D =
"b037fe5132b71ecad2ea7141ec92292b5d32427bf90fd90cde432b1d5abacc2c"
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch
> new file mode 100644
> index 0000000..a647e93
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch
> @@ -0,0 +1,23 @@
> +From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +
> +AArch64 is built with /lib/ as prefix but GCC 4.8 tries to use =
/lib64/
> +path so build fails.
> +
> +It may affect builds when /lib64/ will be used but so far it is not
> +default.
> +

Marcin,

what is the multilib strategy for aarch64? i think using lib64 for 64bit =
and keep /lib for 32bit apps
would be ideal so you can keep the existing apps running. In OE we have =
convoluted x86_64 where
when not using mutlilib it uses /lib for 64bit apps and when doing =
multilib it does /lib64 for default 64bit apps and /lib
for 32bit apps its quite confusing. For arm lets not follow those =
footsteps and use /lib64 for 64bit from
the onset and then multilib can come later and will fit in nicely.


> +Upstream-status: Inappropriate [OE specific]
> +---
> + gcc/config/aarch64/t-aarch64-linux |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- gcc-linaro-4.8-2013.04.orig/gcc/config/aarch64/t-aarch64-linux
> ++++ gcc-linaro-4.8-2013.04/gcc/config/aarch64/t-aarch64-linux
> +@@ -20,6 +20,6 @@
> +=20
> + LIB1ASMSRC   =3D aarch64/lib1funcs.asm
> + LIB1ASMFUNCS =3D _aarch64_sync_cache_range
> +=20
> + AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, =
$(tm_defines)),_be)
> +-MULTILIB_OSDIRNAMES =3D .=3D../lib64$(call =
if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
> ++MULTILIB_OSDIRNAMES =3D .=3D../lib$(call =
if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


