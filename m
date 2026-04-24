Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4366CFB44C8
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:10:19 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16549.1777018211557747671
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 01:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yVGOb838;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so95594465e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 01:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777018210; x=1777623010; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRPHOONq+pIi4YcGDxFGqI0pYVKmGQ5dpF2ssOKnmrM=;
        b=yVGOb8389YAYklBU71JtN5pD8opJ4dUQTnf0qrdXZRiSx0RXfrP5jjfSiwD85sU1Uy
         F26glDD65P0QqnUj9y7p+WAhJVwxzoUWkBXdk8h8pdT6m8zGtFdiekZgm4EUS4ZPWZs/
         prwe7JzdFie2egL1UoYJdUHHkVNprbn7QHypM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018210; x=1777623010;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uRPHOONq+pIi4YcGDxFGqI0pYVKmGQ5dpF2ssOKnmrM=;
        b=YzNr9JFrS9AyzWQ9NjaeAN8xnPYPKmRaDrcspWNnk+gLroqjo+0nQOKzYOAD65Vv/o
         MgUK0GQe1otGndoPGDAvG7G6DylLM0dXNB6XflG+gjpjdj9mCubD21XDbWGThM5DuwGV
         yAWscgsiSdP0Mxwd0uztQ13rKOCtCQ3rVt2YikoOxtT3o8zRy0jt6b5Ghx8JRuTHKg+J
         MwQjCfnQDAyRjUsZKPSPbAex+6NEu+gt7pBbK22H9ohrWHZxwZRwrZVB2y87oXOQ8W35
         ibX4pDpbNBZ1eT9aBAFTxBPWMoHmER5bks5QDaUuGCOhYo+fg6XFis6ZSMO5p4fDdBQV
         Xmsg==
X-Forwarded-Encrypted: i=1; AFNElJ+8Oq6X4BJsAGQfYoMC8+p7XtGdv09XShf4EAnQj16tuGEkDr3SZkDImVLEjb0OgAYPiII2Cks0YoaTq0KuB657sQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzONq4M0xAPo1/tzHpGHZFQj202EfnnJQvHF/VekZ2xo7bjrZR/
	3hU29QsQhrURVVQhR6+KQwtcgWNEAHB4CrHusSphsEnG9JWSngUPPdlHPLVEgRPdKpwRRKI4tc9
	xSnR0R/UcnYOA
X-Gm-Gg: AeBDiet69C7+g9fkE+cJkfHbCobDbtx4JW9rcWbD9OVhXa/E5qJ1NB5vtRwFoKXYQO0
	Qrerbar8AQy3W0/KQoKWZ3IhqTmYPhdxmf9vfcJiJ/FMLd3vHCsOMYY+JniskCOTK8IPB/LmqDU
	TXVy/CqMHxIzWnVyp3crs4tyv2m8QKK4rSRLUMEE648RQC8TDNADb6wWSyJFuJUaoIVjin537mY
	7Pw1MD8guvnjRRGtJLJsGj3UXo0LVz3/FdKEH0N/xE7D9qUt+xSWVJHDEZDI6b1/orChZOqA3xU
	wAMjo+c3JfpPnIpMdVi0z4yUcpHYJd4BrX9QGT5gn1g1XoUMdZSKVZ8qIb3DN2gmpUAnwmUAeqk
	BQ7udaOGAlrUankEcCiSbxfAvESnvHuWg86Ok/dLa8//JK9/kfe2FhWvDCYH7LMtMcV1rnykfoE
	CwpOWtRFG6dzbNkYNFIIHSx5RQpZJayixN+jwmfC6pRLe+u8zvOcRVropvmTWGuMRsDSj88zPRo
	gz7q3Cgyt2dths686mn+b883Q==
X-Received: by 2002:a05:600c:8717:b0:48a:568f:ae6d with SMTP id 5b1f17b1804b1-48a568faffemr212454055e9.8.1777018209557;
        Fri, 24 Apr 2026 01:10:09 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891b46cffasm396103435e9.13.2026.04.24.01.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 01:10:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 10:10:08 +0200
Message-Id: <DI18DRADT7SL.3INF79V2ES995@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 11/12] zlib: upgrade 1.3.1 -> 1.3.2
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Jinfeng.Wang.CN@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
 <20260409061639.1688205-12-jinfeng.wang.cn@windriver.com>
In-Reply-To: <20260409061639.1688205-12-jinfeng.wang.cn@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 08:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235843

On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via lists.openembedded.org=
 Wang wrote:
> From: Liyin Zhang <liyin.zhang.cn@windriver.com>
>
> Upgrade zlib from 1.3.1 to 1.3.2 to fix CVE-2026-27171.
> And delete patches included in this version.
>
> Reference:
> [https://nvd.nist.gov/vuln/detail/CVE-2026-27171]
> [https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/=
zlib?id=3Daf357536104e918aefbb2a2cb835c45eed690e88]
>
> Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---

Please add the changelog (either by URL or spelt out) to commit message
when sending an upgrade: I need to review it for stability.
If this is a cherry-pick from master, keep the original commit message
and add the backporting comments at the end.

In this case, there are changes in this upgrade that do not look
compatible with our stable policy:
* Complete rewrite of cmake support.
* Remove untgz from contrib.
* Add zipAlreadyThere() to minizip zip.c to help avoid duplicates.
* Add deflateUsed() function to get the used bits in the last byte.
* Add a "G" option to force gzip, disabling transparency in gzread().
* Return all available uncompressed data on error in gzread.c.
* Support non-blocking devices in the gz* routines.

Either justify that none of the upgrade changes break anything or only
backport the CVE patches.

Regards,

>  ...configure-Pass-LDFLAGS-to-link-tests.patch | 78 -------------------
>  .../zlib/zlib/CVE-2026-27171.patch            | 63 ---------------
>  .../zlib/{zlib_1.3.1.bb =3D> zlib_1.3.2.bb}     |  4 +-
>  3 files changed, 1 insertion(+), 144 deletions(-)
>  delete mode 100644 meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLA=
GS-to-link-tests.patch
>  delete mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
>  rename meta/recipes-core/zlib/{zlib_1.3.1.bb =3D> zlib_1.3.2.bb} (87%)
>
> diff --git a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-l=
ink-tests.patch b/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-t=
o-link-tests.patch
> deleted file mode 100644
> index 07b2cd3879..0000000000
> --- a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tes=
ts.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -Upstream-Status: Submitted [https://github.com/madler/zlib/pull/599]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From ea77f1f003a4d18b23cca703f3c824942863a1b4 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 8 Mar 2022 22:38:47 -0800
> -Subject: [PATCH] configure: Pass LDFLAGS to link tests
> -
> -LDFLAGS can contain critical flags without which linking wont succeed
> -therefore ensure that all configure tests involving link time checks are
> -using LDFLAGS on compiler commandline along with CFLAGS to ensure the
> -tests perform correctly. Without this some tests may fail resulting in
> -wrong confgure result, ending in miscompiling the package
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - configure | 12 ++++++------
> - 1 file changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/configure b/configure
> -index c55098a..a7c6d72 100755
> ---- a/configure
> -+++ b/configure
> -@@ -443,7 +443,7 @@ if test $shared -eq 1; then
> -   echo Checking for shared library support... | tee -a configure.log
> -   # we must test in two steps (cc then ld), required at least on SunOS =
4.x
> -   if try $CC -c $SFLAGS $test.c &&
> --     try $LDSHARED $SFLAGS -o $test$shared_ext $test.o; then
> -+     try $LDSHARED $SFLAGS $LDFLAGS -o $test$shared_ext $test.o; then
> -     echo Building shared library $SHAREDLIBV with $CC. | tee -a configu=
re.log
> -   elif test -z "$old_cc" -a -z "$old_cflags"; then
> -     echo No shared library support. | tee -a configure.log
> -@@ -505,7 +505,7 @@ int main(void) {
> - }
> - EOF
> -   fi
> --  if try $CC $CFLAGS -o $test $test.c; then
> -+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
> -     sizet=3D`./$test`
> -     echo "Checking for a pointer-size integer type..." $sizet"." | tee =
-a configure.log
> -     CFLAGS=3D"${CFLAGS} -DNO_SIZE_T=3D${sizet}"
> -@@ -539,7 +539,7 @@ int main(void) {
> -   return 0;
> - }
> - EOF
> --  if try $CC $CFLAGS -o $test $test.c; then
> -+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
> -     echo "Checking for fseeko... Yes." | tee -a configure.log
> -   else
> -     CFLAGS=3D"${CFLAGS} -DNO_FSEEKO"
> -@@ -556,7 +556,7 @@ cat > $test.c <<EOF
> - #include <errno.h>
> - int main() { return strlen(strerror(errno)); }
> - EOF
> --if try $CC $CFLAGS -o $test $test.c; then
> -+if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
> -   echo "Checking for strerror... Yes." | tee -a configure.log
> - else
> -   CFLAGS=3D"${CFLAGS} -DNO_STRERROR"
> -@@ -663,7 +663,7 @@ int main()
> -   return (mytest("Hello%d\n", 1));
> - }
> - EOF
> --  if try $CC $CFLAGS -o $test $test.c; then
> -+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
> -     echo "Checking for vsnprintf() in stdio.h... Yes." | tee -a configu=
re.log
> -=20
> -     echo >> configure.log
> -@@ -753,7 +753,7 @@ int main()
> - }
> - EOF
> -=20
> --  if try $CC $CFLAGS -o $test $test.c; then
> -+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
> -     echo "Checking for snprintf() in stdio.h... Yes." | tee -a configur=
e.log
> -=20
> -     echo >> configure.log
> diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch b/meta/reci=
pes-core/zlib/zlib/CVE-2026-27171.patch
> deleted file mode 100644
> index e6a8a3eac5..0000000000
> --- a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From f234bdf5c0f94b681312452fcd5e36968221fa04 Mon Sep 17 00:00:00 2001
> -From: Mark Adler <git@madler.net>
> -Date: Sun, 21 Dec 2025 18:17:56 -0800
> -Subject: [PATCH] Check for negative lengths in crc32_combine functions.
> -
> -Though zlib.h says that len2 must be non-negative, this avoids the
> -possibility of an accidental infinite loop.
> -
> -Upstream-Status: Backport [https://github.com/madler/zlib/commit/ba829a4=
58576d1ff0f26fc7230c6de816d1f6a77]
> -CVE: CVE-2026-27171
> -
> -Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> ----
> - crc32.c | 4 ++++
> - zlib.h  | 4 ++--
> - 2 files changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/crc32.c b/crc32.c
> -index 6c38f5c..33d8c79 100644
> ---- a/crc32.c
> -+++ b/crc32.c
> -@@ -1019,6 +1019,8 @@ unsigned long ZEXPORT crc32(unsigned long crc, con=
st unsigned char FAR *buf,
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D */
> - uLong ZEXPORT crc32_combine64(uLong crc1, uLong crc2, z_off64_t len2) {
> -+    if (len2 < 0)
> -+        return 0;
> - #ifdef DYNAMIC_CRC_TABLE
> -     once(&made, make_crc_table);
> - #endif /* DYNAMIC_CRC_TABLE */
> -@@ -1032,6 +1034,8 @@ uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2=
, z_off_t len2) {
> -=20
> - /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D */
> - uLong ZEXPORT crc32_combine_gen64(z_off64_t len2) {
> -+    if (len2 < 0)
> -+        return 0;
> - #ifdef DYNAMIC_CRC_TABLE
> -     once(&made, make_crc_table);
> - #endif /* DYNAMIC_CRC_TABLE */
> -diff --git a/zlib.h b/zlib.h
> -index 8d4b932..8c7f8ac 100644
> ---- a/zlib.h
> -+++ b/zlib.h
> -@@ -1758,14 +1758,14 @@ ZEXTERN uLong ZEXPORT crc32_combine(uLong crc1, =
uLong crc2, z_off_t len2);
> -    seq1 and seq2 with lengths len1 and len2, CRC-32 check values were
> -    calculated for each, crc1 and crc2.  crc32_combine() returns the CRC=
-32
> -    check value of seq1 and seq2 concatenated, requiring only crc1, crc2=
, and
> --   len2. len2 must be non-negative.
> -+   len2. len2 must be non-negative, otherwise zero is returned.
> - */
> -=20
> - /*
> - ZEXTERN uLong ZEXPORT crc32_combine_gen(z_off_t len2);
> -=20
> -      Return the operator corresponding to length len2, to be used with
> --   crc32_combine_op(). len2 must be non-negative.
> -+   crc32_combine_op(). len2 must be non-negative, otherwise zero is ret=
urned.
> - */
> -=20
> - ZEXTERN uLong ZEXPORT crc32_combine_op(uLong crc1, uLong crc2, uLong op=
);
> ---=20
> -2.43.0
> -
> diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zli=
b/zlib_1.3.2.bb
> similarity index 87%
> rename from meta/recipes-core/zlib/zlib_1.3.1.bb
> rename to meta/recipes-core/zlib/zlib_1.3.2.bb
> index e42578fd7e..c7d59fdf78 100644
> --- a/meta/recipes-core/zlib/zlib_1.3.1.bb
> +++ b/meta/recipes-core/zlib/zlib_1.3.2.bb
> @@ -8,13 +8,11 @@ LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D6;endli=
ne=3D23;md5=3D5377232268e952e9ef6
> =20
>  # The source tarball needs to be .gz as only the .gz ends up in fossils/
>  SRC_URI =3D "https://zlib.net/${BP}.tar.gz \
> -           file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
>             file://run-ptest \
> -           file://CVE-2026-27171.patch \
>             "
>  UPSTREAM_CHECK_URI =3D "http://zlib.net/"
> =20
> -SRC_URI[sha256sum] =3D "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91=
eefb60f03b72df23"
> +SRC_URI[sha256sum] =3D "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2=
dfa8de64f0119d16"
> =20
>  # When a new release is made the previous release is moved to fossils/, =
so add this
>  # to PREMIRRORS so it is also searched automatically.


--=20
Yoann Congal
Smile ECS


