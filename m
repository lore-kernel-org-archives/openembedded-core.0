Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9A8C36008
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.10357.1742048292608056005
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L3dsJVyc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YfKoI3Qp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101959a2b6ef9-d5ad9879-2b6d-4603-bbd6-650166218b61-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qQlLEvQwri+4pPjbmMdlBPoFj5uYUq2uCKU+bM4wC1M=;
	b=L3dsJVyclIxks+pxyCXiwYsuWVfWj1WamuYx2TL43Epplr8zfo0oOP3+2GS8mQxD
	CG6O0HIZbCpZJayL2ozZOQXwhGqRXyRlXLSvrj00Wchsi/a8PXg2Sqx7CaRnxf2q2vd
	1fH0bdMPSrDonIEZonMyCxdyBjHYDfqv7eFWUW3g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qQlLEvQwri+4pPjbmMdlBPoFj5uYUq2uCKU+bM4wC1M=;
	b=YfKoI3Qpp1I7z/35DFrnUQH4lltw+3oK6X+JAMsYjEcHBk2FzR/osAfP0g1r0zK2
	lFl+ai6wqiJGc+DGz3eIs95mMaGWBY4Nog6dMIf9RF22+vovWIAjY8ODTZBv8sjDvQ5
	58uG6DZNuLBlS2Unv7zo3p5DSsCbQtWyX/CoDWiQ=
Content-Type: multipart/mixed; boundary="===============5170017741971501579=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysvinit: upgrading to 3.14 SUCCEEDED
Message-ID: <010101959a2b6ef9-d5ad9879-2b6d-4603-bbd6-650166218b61-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212887

--===============5170017741971501579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysvinit* to *3.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysvinit-upgrade-3.13-3.14.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From f3273e6ee655ba945c24767390c16fce6aab743f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 07:47:43 +0000
Subject: [PATCH] sysvinit: upgrade 3.13 -> 3.14

---
 meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch           | 4 ++--
 .../sysvinit/{sysvinit_3.13.bb => sysvinit_3.14.bb}           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/sysvinit/{sysvinit_3.13.bb => sysvinit_3.14.bb} (98%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
index ece870c269..1ac54fb667 100644
--- a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
@@ -1,4 +1,4 @@
-From 19a8777c81bc451d65a4071528e4715e19941e0a Mon Sep 17 00:00:00 2001
+From f040b04c50d13755b2063c4db0e0be0647cf5d14 Mon Sep 17 00:00:00 2001
 From: Jeff Dike <jdike@x86_64.user-mode-linux.org>
 Date: Wed, 14 Jul 2010 14:35:52 -0400
 Subject: [PATCH] sysvinit - Remove sulogin dependency on /usr/lib*/libcrypt.a
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 2 insertions(+), 10 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 4ce4889..1611c1c 100644
+index 6d9f01c..b12a233 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -97,16 +97,8 @@ else
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.13.bb b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
similarity index 98%
rename from meta/recipes-core/sysvinit/sysvinit_3.13.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.14.bb
index d935b0edfd..521eda0bfb 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.13.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "cbaeabddc35a6511b87c87452ee5e87c678a26329c7d7d17fb69a2b42a314d86"
+SRC_URI[sha256sum] = "c90874b8c054a35991fb8c4d30c443ed1e9b1815ff6165c7b483f558be4e4b53"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.44.1


--===============5170017741971501579==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysvinit-upgrade-3.13-3.14.patch"

RnJvbSBmMzI3M2U2ZWU2NTViYTk0NWMyNDc2NzM5MGMxNmZjZTZhYWI3NDNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDc6NDc6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN2aW5pdDogdXBncmFkZSAzLjEzIC0+IDMuMTQKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvc3lz
dmluaXQvc3lzdmluaXQvY3J5cHQtbGliLnBhdGNoICAgICAgICAgICB8IDQgKystLQogLi4uL3N5
c3Zpbml0L3tzeXN2aW5pdF8zLjEzLmJiID0+IHN5c3Zpbml0XzMuMTQuYmJ9ICAgICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3tzeXN2aW5pdF8zLjEzLmJiID0+IHN5
c3Zpbml0XzMuMTQuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lz
dmluaXQvc3lzdmluaXQvY3J5cHQtbGliLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdmlu
aXQvc3lzdmluaXQvY3J5cHQtbGliLnBhdGNoCmluZGV4IGVjZTg3MGMyNjkuLjFhYzU0ZmI2Njcg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0L2NyeXB0LWxp
Yi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN2aW5pdC9zeXN2aW5pdC9jcnlwdC1s
aWIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE5YTg3NzdjODFiYzQ1MWQ2NWE0MDcxNTI4
ZTQ3MTVlMTk5NDFlMGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGYwNDBiMDRjNTBk
MTM3NTViMjA2M2M0ZGIwZTBiZTA2NDdjZjVkMTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBKZWZmIERpa2UgPGpkaWtlQHg4Nl82NC51c2VyLW1vZGUtbGludXgub3JnPgogRGF0ZTog
V2VkLCAxNCBKdWwgMjAxMCAxNDozNTo1MiAtMDQwMAogU3ViamVjdDogW1BBVENIXSBzeXN2aW5p
dCAtIFJlbW92ZSBzdWxvZ2luIGRlcGVuZGVuY3kgb24gL3Vzci9saWIqL2xpYmNyeXB0LmEKQEAg
LTE0LDcgKzE0LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0
aW9uXQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQog
CiBkaWZmIC0tZ2l0IGEvc3JjL01ha2VmaWxlIGIvc3JjL01ha2VmaWxlCi1pbmRleCA0Y2U0ODg5
Li4xNjExYzFjIDEwMDY0NAoraW5kZXggNmQ5ZjAxYy4uYjEyYTIzMyAxMDA2NDQKIC0tLSBhL3Ny
Yy9NYWtlZmlsZQogKysrIGIvc3JjL01ha2VmaWxlCiBAQCAtOTcsMTYgKzk3LDggQEAgZWxzZQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXRfMy4xMy5iYiBi
L21ldGEvcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0XzMuMTQuYmIKc2ltaWxhcml0eSBp
bmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXRf
My4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXRfMy4x
NC5iYgppbmRleCBkOTM1YjBlZGZkLi41MjFlZGEwYmZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9zeXN2aW5pdC9zeXN2aW5pdF8zLjEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3Jl
L3N5c3Zpbml0L3N5c3Zpbml0XzMuMTQuYmIKQEAgLTE4LDcgKzE4LDcgQEAgU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUH0udGFyLnh6IFwKICAgICAgICAg
ICAgZmlsZTovL2Jvb3Rsb2dkLmluaXQgXAogICAgICAgICAgICBmaWxlOi8vMDFfYm9vdGxvZ2Qg
XAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2JhZWFiZGRjMzVhNjUxMWI4
N2M4NzQ1MmVlNWU4N2M2NzhhMjYzMjljN2Q3ZDE3ZmI2OWEyYjQyYTMxNGQ4NiIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJjOTA4NzRiOGMwNTRhMzU5OTFmYjhjNGQzMGM0NDNlZDFlOWIxODE1ZmY2
MTY1YzdiNDgzZjU1OGJlNGU0YjUzIgogCiBTID0gIiR7V09SS0RJUn0vc3lzdmluaXQtJHtQVn0i
CiAKLS0gCjIuNDQuMQoK

--===============5170017741971501579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sysvinit: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit: SRC_URI changed from "https://github.com/slicer69/sysvinit/releases//download/3.13/sysvinit-3.13.tar.xz file://crypt-lib.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd" to "https://github.com/slicer69/sysvinit/releases//download/3.14/sysvinit-3.14.tar.xz file://crypt-lib.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd"
packages/core2-64-poky-linux/sysvinit: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-dbg: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-dbg: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-dbg: PKGSIZE changed from 627632 to 630016 (+0%)
packages/core2-64-poky-linux/sysvinit/sysvinit-dev: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-dev: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-doc: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-doc: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-doc: PKGSIZE changed from 78276 to 78372 (+0%)
packages/core2-64-poky-linux/sysvinit/sysvinit-locale: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-locale: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-pidof: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-pidof: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-src: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-src: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-src: PKGSIZE changed from 270597 to 272613 (+1%)
packages/core2-64-poky-linux/sysvinit/sysvinit-staticdev: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-staticdev: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit-sulogin: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit-sulogin: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit: PV changed from "3.13" to "3.14"
packages/core2-64-poky-linux/sysvinit/sysvinit: PKGV changed from 3.13 [default] to 3.14 [default]
packages/core2-64-poky-linux/sysvinit/sysvinit: PKGSIZE changed from 264487 to 265255 (+0%)

--===============5170017741971501579==--

