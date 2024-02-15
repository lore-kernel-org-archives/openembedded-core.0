Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668EEC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20318.1708018343323299541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GgapB6S+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IsGVfjrt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd39a4e-4d9f1f85-e949-4c09-9242-8a3482fe5b2f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Wh8/vCO5mDZLkQCBB5dNcEkstgqUmqRjZwvkokCqRyM=;
	b=GgapB6S+C1t2KS0oM1onru9FRtJGHV1fjejXIR1y+kfo46QfXj7kSDXXsNaYV36W
	F/V/3xb6E3XrTwSzt7vZt2cKBKXakYiFQaCWs3VQ1ru/0N7VNehxXwZ8lciASOvsV8P
	5+xlOok6ujUkUVH30KQ/YyuVNnWUFiF2RKG35hZs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Wh8/vCO5mDZLkQCBB5dNcEkstgqUmqRjZwvkokCqRyM=;
	b=IsGVfjrt0s3g2y5Lkoi9aqwc0Rr0zN75tFvn6xZNwIxPMEaO9biylaE3IHb4rAgx
	aFszGda4tGA9c9tYdbfW8I5YvMaD23pCUmvj/PsY60Bppql30NE7DNyPQdeajxwbujH
	q+7slqfINYGrTjd2BgS5baND9RBthQFkK9XtPako=
Content-Type: multipart/mixed; boundary="===============6119917042226099233=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] efivar: upgrading to 39 SUCCEEDED
Message-ID: <0101018dadd39a4e-4d9f1f85-e949-4c09-9242-8a3482fe5b2f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195556

--===============6119917042226099233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *efivar* to *39* has Succeeded.

Next steps:
    - apply the patch: git am 0001-efivar-upgrade-38-39.patch
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
From 1d7faf19be309858a8ab481285f1810fdb1775a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 05:07:14 +0000
Subject: [PATCH] efivar: upgrade 38 -> 39

---
 .../efivar/0001-docs-do-not-build-efisecdb-manpage.patch      | 3 ++-
 meta/recipes-bsp/efivar/efivar_38.bb                          | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch b/meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch
index cb30d3c430..af82513b21 100644
--- a/meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch
+++ b/meta/recipes-bsp/efivar/efivar/0001-docs-do-not-build-efisecdb-manpage.patch
@@ -1,4 +1,4 @@
-From f39a1481a9e465387901d52b07ae56dedcc3838b Mon Sep 17 00:00:00 2001
+From f81093c62b76b1626fc09a858964b72cb6404fc1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 16 Jan 2022 18:25:33 +0100
 Subject: [PATCH] docs: do not build efisecdb manpage
@@ -7,6 +7,7 @@ It requires mandoc, which oe-core does not have.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  docs/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index d88eb3fef5..3500acf88b 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -10,7 +10,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            "
-SRCREV = "90e88b221e8bc60dc50f3246051369b8f580c0d0"
+SRCREV = "c47820c37ac26286559ec004de07d48d05f3308c"
 PV .= "+39+git"
 
 S = "${WORKDIR}/git"
@@ -32,3 +32,5 @@ BBCLASSEXTEND = "native"
 RRECOMMENDS:${PN}:class-target = "kernel-module-efivarfs"
 
 CLEANBROKEN = "1"
+
+PV = "39"
-- 
2.42.0


--===============6119917042226099233==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-efivar-upgrade-38-39.patch"

RnJvbSAxZDdmYWYxOWJlMzA5ODU4YThhYjQ4MTI4NWYxODEwZmRiMTc3NWE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDU6MDc6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
Zml2YXI6IHVwZ3JhZGUgMzggLT4gMzkKCi0tLQogLi4uL2VmaXZhci8wMDAxLWRvY3MtZG8tbm90
LWJ1aWxkLWVmaXNlY2RiLW1hbnBhZ2UucGF0Y2ggICAgICB8IDMgKystCiBtZXRhL3JlY2lwZXMt
YnNwL2VmaXZhci9lZml2YXJfMzguYmIgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKyst
CiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL2VmaXZhci9lZml2YXIvMDAwMS1kb2NzLWRvLW5vdC1i
dWlsZC1lZmlzZWNkYi1tYW5wYWdlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWJzcC9lZml2YXIvZWZp
dmFyLzAwMDEtZG9jcy1kby1ub3QtYnVpbGQtZWZpc2VjZGItbWFucGFnZS5wYXRjaAppbmRleCBj
YjMwZDNjNDMwLi5hZjgyNTEzYjIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2VmaXZh
ci9lZml2YXIvMDAwMS1kb2NzLWRvLW5vdC1idWlsZC1lZmlzZWNkYi1tYW5wYWdlLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1ic3AvZWZpdmFyL2VmaXZhci8wMDAxLWRvY3MtZG8tbm90LWJ1aWxk
LWVmaXNlY2RiLW1hbnBhZ2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGYzOWExNDgxYTll
NDY1Mzg3OTAxZDUyYjA3YWU1NmRlZGNjMzgzOGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGY4MTA5M2M2MmI3NmIxNjI2ZmMwOWE4NTg5NjRiNzJjYjY0MDRmYzEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRl
PgogRGF0ZTogU3VuLCAxNiBKYW4gMjAyMiAxODoyNTozMyArMDEwMAogU3ViamVjdDogW1BBVENI
XSBkb2NzOiBkbyBub3QgYnVpbGQgZWZpc2VjZGIgbWFucGFnZQpAQCAtNyw2ICs3LDcgQEAgSXQg
cmVxdWlyZXMgbWFuZG9jLCB3aGljaCBvZS1jb3JlIGRvZXMgbm90IGhhdmUuCiAKIFVwc3RyZWFt
LVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CisKIC0tLQogIGRvY3MvTWFr
ZWZpbGUgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL2VmaXZhci9lZml2YXJfMzguYmIgYi9t
ZXRhL3JlY2lwZXMtYnNwL2VmaXZhci9lZml2YXJfMzguYmIKaW5kZXggZDg4ZWIzZmVmNS4uMzUw
MGFjZjg4YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC9lZml2YXIvZWZpdmFyXzM4LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1ic3AvZWZpdmFyL2VmaXZhcl8zOC5iYgpAQCAtMTAsNyArMTAs
NyBAQCBDT01QQVRJQkxFX0hPU1QgPSAiKGkuODZ8eDg2XzY0fGFybXxhYXJjaDY0KS4qLWxpbnV4
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3JoaW5zdGFsbGVyL2VmaXZhci5naXQ7YnJh
bmNoPW1haW47cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1kb2NzLWRv
LW5vdC1idWlsZC1lZmlzZWNkYi1tYW5wYWdlLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVW
ID0gIjkwZTg4YjIyMWU4YmM2MGRjNTBmMzI0NjA1MTM2OWI4ZjU4MGMwZDAiCitTUkNSRVYgPSAi
YzQ3ODIwYzM3YWMyNjI4NjU1OWVjMDA0ZGUwN2Q0OGQwNWYzMzA4YyIKIFBWIC49ICIrMzkrZ2l0
IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgpAQCAtMzIsMyArMzIsNSBAQCBCQkNMQVNTRVhURU5E
ID0gIm5hdGl2ZSIKIFJSRUNPTU1FTkRTOiR7UE59OmNsYXNzLXRhcmdldCA9ICJrZXJuZWwtbW9k
dWxlLWVmaXZhcmZzIgogCiBDTEVBTkJST0tFTiA9ICIxIgorCitQViA9ICIzOSIKLS0gCjIuNDIu
MAoK

--===============6119917042226099233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/efivar/efivar-dbg: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-dbg: PKGSIZE changed from 1144568 to 1141256 (-0%)
packages/core2-64-poky-linux/efivar/efivar-dbg: FILELIST: removed "/usr/lib/.debug/libefisec.so.1.38 /usr/lib/.debug/libefiboot.so.1.38 /usr/lib/.debug/libefivar.so.1.38", added "/usr/lib/.debug/libefisec.so.1.39 /usr/lib/.debug/libefiboot.so.1.39 /usr/lib/.debug/libefivar.so.1.39"
packages/core2-64-poky-linux/efivar/efivar-dbg: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-dev: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-dev: PKGSIZE changed from 67885 to 67853 (-0%)
packages/core2-64-poky-linux/efivar/efivar-dev: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-doc: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-doc: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-locale: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-locale: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-src: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-src: PKGSIZE changed from 490931 to 490953 (+0%)
packages/core2-64-poky-linux/efivar/efivar-src: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-staticdev: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar-staticdev: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar/efivar: FILELIST: removed "/usr/lib/libefisec.so.1.38 /usr/lib/libefiboot.so.1.38 /usr/lib/libefivar.so.1.38", added "/usr/lib/libefisec.so.1.39 /usr/lib/libefiboot.so.1.39 /usr/lib/libefivar.so.1.39"
packages/core2-64-poky-linux/efivar/efivar: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar: PV changed from "38+39+git" to "39"
packages/core2-64-poky-linux/efivar: PKGV changed from 38+39+git [default] to 39 [default]
Changes to packages/core2-64-poky-linux/efivar (sysroot):
  /usr/lib/libefiboot.so.1 changed symlink target from libefiboot.so.1.38 to libefiboot.so.1.39
  /usr/lib/libefiboot.so changed symlink target from libefiboot.so.1.38 to libefiboot.so.1.39
  /usr/lib/libefisec.so.1 changed symlink target from libefisec.so.1.38 to libefisec.so.1.39
  /usr/lib/libefisec.so changed symlink target from libefisec.so.1.38 to libefisec.so.1.39
  /usr/lib/libefivar.so.1 changed symlink target from libefivar.so.1.38 to libefivar.so.1.39
  /usr/lib/libefivar.so changed symlink target from libefivar.so.1.38 to libefivar.so.1.39
  /usr/lib/libefiboot.so.1.38 moved to /usr/lib/libefiboot.so.1.39
  /usr/lib/libefisec.so.1.38 moved to /usr/lib/libefisec.so.1.39
  /usr/lib/libefivar.so.1.38 moved to /usr/lib/libefivar.so.1.39

--===============6119917042226099233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/efivar/efivar-dbg: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-dev: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-doc: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-locale: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-src: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar-staticdev: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
packages/core2-64-poky-linux/efivar/efivar: FILELIST: removed "/usr/lib/libefiboot.so.1.38 /usr/lib/libefisec.so.1.38 /usr/lib/libefivar.so.1.38", added "/usr/lib/libefiboot.so.1.39 /usr/lib/libefisec.so.1.39 /usr/lib/libefivar.so.1.39"
packages/core2-64-poky-linux/efivar/efivar: PKGV changed from 38+39+git0+90e88b221e to 39 [default]
Changes to packages/core2-64-poky-linux/efivar (sysroot):
  /usr/lib/libefiboot.so.1 changed symlink target from libefiboot.so.1.38 to libefiboot.so.1.39
  /usr/lib/libefiboot.so changed symlink target from libefiboot.so.1.38 to libefiboot.so.1.39
  /usr/lib/libefisec.so.1 changed symlink target from libefisec.so.1.38 to libefisec.so.1.39
  /usr/lib/libefisec.so changed symlink target from libefisec.so.1.38 to libefisec.so.1.39
  /usr/lib/libefivar.so.1 changed symlink target from libefivar.so.1.38 to libefivar.so.1.39
  /usr/lib/libefivar.so changed symlink target from libefivar.so.1.38 to libefivar.so.1.39
  /usr/lib/libefiboot.so.1.38 moved to /usr/lib/libefiboot.so.1.39
  /usr/lib/libefisec.so.1.38 moved to /usr/lib/libefisec.so.1.39
  /usr/lib/libefivar.so.1.38 moved to /usr/lib/libefivar.so.1.39

--===============6119917042226099233==--

