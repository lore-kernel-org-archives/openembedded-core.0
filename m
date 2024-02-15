Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B36C54EE5
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.20159.1708018344653965605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bNdg6AQc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CdNsCTZB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd39fe0-04811a34-468c-4c99-a0c6-a1c43db3401f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PlYqW8knHdOOXhD5lQvFFp7swYgnE6AHV/KM31smlxU=;
	b=bNdg6AQc8TO0qbgQsSEFsNcdiI07apJoRJ/DskAeV2z2W/ju0FMk8/amXSnsD25R
	85m2cSX7vvGle5dm47F8PQltu0NHvo4QuS6XR4ihM1tcuRZDpYvZ1L5FsccSJZZ76Ni
	MLYjY0Yn4ryUzD6R+vYXfEC1gHfQWC9N2xpFjWbY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PlYqW8knHdOOXhD5lQvFFp7swYgnE6AHV/KM31smlxU=;
	b=CdNsCTZBhEJVwOsBTrw/PKM7Muayy3yR9S3iXNSNAMeNkTm6EtRa6ob1UxPNmdko
	mf9/tEXCOPuhgdXy1bx25u3G3rFdm7hv3GBapXelp049BCaPVl47BtTqegsEivqr+G+
	SlpcdmG3teGGLBsy//z383w0NW72gMGg8RdVqT68=
Content-Type: multipart/mixed; boundary="===============5372583830722320312=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.43.2 SUCCEEDED
Message-ID: <0101018dadd39fe0-04811a34-468c-4c99-a0c6-a1c43db3401f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195574

--===============5372583830722320312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.43.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.43.0-2.43.2.patch
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
From 49da048da4f631927be5d590b35dfad460c795c7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 07:32:58 +0000
Subject: [PATCH] git: upgrade 2.43.0 -> 2.43.2

---
 ...-do-not-force-RHEL-7-specific-build-.patch |  4 ++--
 meta/recipes-devtools/git/git/fixsort.patch   | 23 ++++++++++++-------
 .../git/{git_2.43.0.bb => git_2.43.2.bb}      |  2 +-
 3 files changed, 18 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/git/{git_2.43.0.bb => git_2.43.2.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index d80d082ba3..59526f1bcd 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From c0c5241abdc113acbe6bcd960686cea414bce357 Mon Sep 17 00:00:00 2001
+From ac7e40abdbe61d5b0ccf960ecc282d1a92306619 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index 259d151..136ae3b 100644
+index 3bb03f4..b5ed7d6 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
 @@ -64,10 +64,6 @@ ifeq ($(uname_S),Linux)
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 07a487e8ca..d395f7d5d0 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,13 +1,16 @@
-[PATCH] generate-configlist.sh: Fix determinism issue
+From 3e4877a529f0aa0667a5fd2d4a48f3826da9f78e Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 17 Feb 2021 17:57:13 +0000
+Subject: [PATCH] [PATCH] generate-configlist.sh: Fix determinism issue
 
-Currently git binaries are not entirely reproducible, at least partly 
+Currently git binaries are not entirely reproducible, at least partly
 due to config-list.h differing in order depending on the system's
 locale settings. Under different locales, the entries:
 
 "sendemail.identity",
 "sendemail.<identity>.*",
 
-would differ in order for example and this leads to differences in 
+would differ in order for example and this leads to differences in
 the debug symbols for the binaries.
 
 This can be fixed by specifying the C locale for the sort in the
@@ -16,11 +19,15 @@ shell script generating the header.
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd37d8e454524987842f.camel@linuxfoundation.org/T/#u]
 
-Index: git-2.30.0/generate-configlist.sh
-===================================================================
---- git-2.30.0.orig/generate-configlist.sh
-+++ git-2.30.0/generate-configlist.sh
-@@ -9,7 +9,7 @@ static const char *config_name_list[] =
+---
+ generate-configlist.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/generate-configlist.sh b/generate-configlist.sh
+index 8692fe5..e67ccac 100755
+--- a/generate-configlist.sh
++++ b/generate-configlist.sh
+@@ -9,7 +9,7 @@ static const char *config_name_list[] = {
  EOF
  	grep -h '^[a-zA-Z].*\..*::$' Documentation/*config.txt Documentation/config/*.txt |
  	sed '/deprecated/d; s/::$//; s/,  */\n/g' |
diff --git a/meta/recipes-devtools/git/git_2.43.0.bb b/meta/recipes-devtools/git/git_2.43.2.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.43.0.bb
rename to meta/recipes-devtools/git/git_2.43.2.bb
index f913290081..74c9a514e4 100644
--- a/meta/recipes-devtools/git/git_2.43.0.bb
+++ b/meta/recipes-devtools/git/git_2.43.2.bb
@@ -160,4 +160,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "ed238f5c72a014f238cc49fe7df4c6883732a3881111b381c105e2c5be77302f"
+SRC_URI[tarball.sha256sum] = "0dde66dc6a0ef5ae41f550052e5574a01b5378bf2b396497070fc4913c749f75"
-- 
2.42.0


--===============5372583830722320312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/git/git-bash-completion: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git/git-bash-completion: PKGSIZE changed from 82511 to 83459 (+1%)
packages/core2-64-poky-linux/git/git-bash-completion: PV changed from "2.43.0" to "2.43.2"
packages/core2-64-poky-linux/git/git-dbg: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git/git-dbg: PKGSIZE changed from 91182536 to 91072440 (-0%)
packages/core2-64-poky-linux/git/git-dbg: PV changed from "2.43.0" to "2.43.2"
packages/core2-64-poky-linux/git/git-dev: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git/git-dev: PV changed from "2.43.0" to "2.43.2"
packages/core2-64-poky-linux/git/git-doc: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git/git-doc: PV changed from "2.43.0" to "2.43.2"
packages/core2-64-poky-linux/git/git-locale: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git/git-locale: PV changed from "2.43.0" to "2.43.2"
packages/core2-64-poky-linux/git/git-perltools: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git/git-perltools: PKGSIZE changed from 272534 to 272167 (-0%)
packages/core2-64-poky-linux/git/git-perltools: PV changed from "2.43.0" to "2.43.2"
packages/core2-64-poky-linux/git/git-src: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git/git-src: PKGSIZE changed from 9182608 to 9182513 (-0%)
packages/core2-64-poky-linux/git/git-src: PV changed from "2.43.0" to "2.43.2"
packages/core2-64-poky-linux/git/git-staticdev: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git/git-staticdev: PV changed from "2.43.0" to "2.43.2"
packages/core2-64-poky-linux/git/git-tk: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git/git-tk: PV changed from "2.43.0" to "2.43.2"
packages/core2-64-poky-linux/git/git: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git/git: PKGSIZE changed from 23452470 to 23456572 (+0%)
packages/core2-64-poky-linux/git/git: PV changed from "2.43.0" to "2.43.2"
packages/core2-64-poky-linux/git/gitweb: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git/gitweb: PKGSIZE changed from 313639 to 313763 (+0%)
packages/core2-64-poky-linux/git/gitweb: PV changed from "2.43.0" to "2.43.2"
packages/core2-64-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.43.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.43.2.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-64-poky-linux/git: PKGV changed from 2.43.0 [default] to 2.43.2 [default]
packages/core2-64-poky-linux/git: PV changed from "2.43.0" to "2.43.2"

--===============5372583830722320312==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.43.0-2.43.2.patch"

RnJvbSA0OWRhMDQ4ZGE0ZjYzMTkyN2JlNWQ1OTBiMzVkZmFkNDYwYzc5NWM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDc6MzI6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi40My4wIC0+IDIuNDMuMgoKLS0tCiAuLi4tZG8tbm90LWZvcmNlLVJIRUwt
Ny1zcGVjaWZpYy1idWlsZC0ucGF0Y2ggfCAgNCArKy0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2l0L2dpdC9maXhzb3J0LnBhdGNoICAgfCAyMyArKysrKysrKysrKystLS0tLS0tCiAuLi4vZ2l0
L3tnaXRfMi40My4wLmJiID0+IGdpdF8yLjQzLjIuYmJ9ICAgICAgfCAgMiArLQogMyBmaWxlcyBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2l0L3tnaXRfMi40My4wLmJiID0+IGdpdF8yLjQzLjIuYmJ9ICg5OCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvMDAwMS1jb25maWcu
bWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvMDAwMS1jb25maWcubWFrLnVuYW1lLWRvLW5vdC1m
b3JjZS1SSEVMLTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoCmluZGV4IGQ4MGQwODJiYTMuLjU5NTI2
ZjFiY2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0LzAwMDEtY29u
ZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1aWxkLS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC8wMDAxLWNvbmZpZy5tYWsudW5hbWUt
ZG8tbm90LWZvcmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGMwYzUyNDFhYmRjMTEzYWNiZTZiY2Q5NjA2ODZjZWE0MTRiY2UzNTcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGFjN2U0MGFiZGJlNjFkNWIwY2NmOTYwZWNjMjgyZDFhOTIz
MDY2MTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogTW9uLCA3IEZlYiAyMDIyIDEwOjEzOjE1ICswMTAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZy5tYWsudW5hbWU6IGRvIG5vdCBmb3JjZSBSSEVMLTcg
c3BlY2lmaWMgYnVpbGQgc2V0dGluZ3MKQEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hhbmdlZCwg
NCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZy5tYWsudW5hbWUgYi9jb25maWcu
bWFrLnVuYW1lCi1pbmRleCAyNTlkMTUxLi4xMzZhZTNiIDEwMDY0NAoraW5kZXggM2JiMDNmNC4u
YjVlZDdkNiAxMDA2NDQKIC0tLSBhL2NvbmZpZy5tYWsudW5hbWUKICsrKyBiL2NvbmZpZy5tYWsu
dW5hbWUKIEBAIC02NCwxMCArNjQsNiBAQCBpZmVxICgkKHVuYW1lX1MpLExpbnV4KQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4c29ydC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0Y2gKaW5kZXggMDdhNDg3ZThjYS4u
ZDM5NWY3ZDVkMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4
c29ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBh
dGNoCkBAIC0xLDEzICsxLDE2IEBACi1bUEFUQ0hdIGdlbmVyYXRlLWNvbmZpZ2xpc3Quc2g6IEZp
eCBkZXRlcm1pbmlzbSBpc3N1ZQorRnJvbSAzZTQ4NzdhNTI5ZjBhYTA2NjdhNWZkMmQ0YTQ4ZjM4
MjZkYTlmNzhlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CitEYXRlOiBXZWQsIDE3IEZlYiAy
MDIxIDE3OjU3OjEzICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIFtQQVRDSF0gZ2VuZXJhdGUtY29u
ZmlnbGlzdC5zaDogRml4IGRldGVybWluaXNtIGlzc3VlCiAKLUN1cnJlbnRseSBnaXQgYmluYXJp
ZXMgYXJlIG5vdCBlbnRpcmVseSByZXByb2R1Y2libGUsIGF0IGxlYXN0IHBhcnRseSAKK0N1cnJl
bnRseSBnaXQgYmluYXJpZXMgYXJlIG5vdCBlbnRpcmVseSByZXByb2R1Y2libGUsIGF0IGxlYXN0
IHBhcnRseQogZHVlIHRvIGNvbmZpZy1saXN0LmggZGlmZmVyaW5nIGluIG9yZGVyIGRlcGVuZGlu
ZyBvbiB0aGUgc3lzdGVtJ3MKIGxvY2FsZSBzZXR0aW5ncy4gVW5kZXIgZGlmZmVyZW50IGxvY2Fs
ZXMsIHRoZSBlbnRyaWVzOgogCiAic2VuZGVtYWlsLmlkZW50aXR5IiwKICJzZW5kZW1haWwuPGlk
ZW50aXR5Pi4qIiwKIAotd291bGQgZGlmZmVyIGluIG9yZGVyIGZvciBleGFtcGxlIGFuZCB0aGlz
IGxlYWRzIHRvIGRpZmZlcmVuY2VzIGluIAord291bGQgZGlmZmVyIGluIG9yZGVyIGZvciBleGFt
cGxlIGFuZCB0aGlzIGxlYWRzIHRvIGRpZmZlcmVuY2VzIGluCiB0aGUgZGVidWcgc3ltYm9scyBm
b3IgdGhlIGJpbmFyaWVzLgogCiBUaGlzIGNhbiBiZSBmaXhlZCBieSBzcGVjaWZ5aW5nIHRoZSBD
IGxvY2FsZSBmb3IgdGhlIHNvcnQgaW4gdGhlCkBAIC0xNiwxMSArMTksMTUgQEAgc2hlbGwgc2Ny
aXB0IGdlbmVyYXRpbmcgdGhlIGhlYWRlci4KIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGll
IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogVXBzdHJlYW0tU3RhdHVzOiBT
dWJtaXR0ZWQgW2h0dHBzOi8vcHVibGljLWluYm94Lm9yZy9naXQvZjAyOWE5NDJkZDNkNTBkODVl
NjBiZDM3ZDhlNDU0NTI0OTg3ODQyZi5jYW1lbEBsaW51eGZvdW5kYXRpb24ub3JnL1QvI3VdCiAK
LUluZGV4OiBnaXQtMi4zMC4wL2dlbmVyYXRlLWNvbmZpZ2xpc3Quc2gKLT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0t
LSBnaXQtMi4zMC4wLm9yaWcvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaAotKysrIGdpdC0yLjMwLjAv
Z2VuZXJhdGUtY29uZmlnbGlzdC5zaAotQEAgLTksNyArOSw3IEBAIHN0YXRpYyBjb25zdCBjaGFy
ICpjb25maWdfbmFtZV9saXN0W10gPQorLS0tCisgZ2VuZXJhdGUtY29uZmlnbGlzdC5zaCB8IDIg
Ky0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKKworZGlm
ZiAtLWdpdCBhL2dlbmVyYXRlLWNvbmZpZ2xpc3Quc2ggYi9nZW5lcmF0ZS1jb25maWdsaXN0LnNo
CitpbmRleCA4NjkyZmU1Li5lNjdjY2FjIDEwMDc1NQorLS0tIGEvZ2VuZXJhdGUtY29uZmlnbGlz
dC5zaAorKysrIGIvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaAorQEAgLTksNyArOSw3IEBAIHN0YXRp
YyBjb25zdCBjaGFyICpjb25maWdfbmFtZV9saXN0W10gPSB7CiAgRU9GCiAgCWdyZXAgLWggJ15b
YS16QS1aXS4qXC4uKjo6JCcgRG9jdW1lbnRhdGlvbi8qY29uZmlnLnR4dCBEb2N1bWVudGF0aW9u
L2NvbmZpZy8qLnR4dCB8CiAgCXNlZCAnL2RlcHJlY2F0ZWQvZDsgcy86OiQvLzsgcy8sICAqL1xu
L2cnIHwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDMuMC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDMuMi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjQzLjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDMuMi5iYgppbmRl
eCBmOTEzMjkwMDgxLi43NGM5YTUxNGU0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2l0L2dpdF8yLjQzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRf
Mi40My4yLmJiCkBAIC0xNjAsNCArMTYwLDQgQEAgRVhUUkFfT0VDT05GICs9ICJhY19jdl9zbnBy
aW50Zl9yZXR1cm5zX2JvZ3VzPW5vIFwKICAgICAgICAgICAgICAgICAgIgogRVhUUkFfT0VNQUtF
ICs9ICJOT19HRVRURVhUPTEiCiAKLVNSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gImVkMjM4
ZjVjNzJhMDE0ZjIzOGNjNDlmZTdkZjRjNjg4MzczMmEzODgxMTExYjM4MWMxMDVlMmM1YmU3NzMw
MmYiCitTUkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICIwZGRlNjZkYzZhMGVmNWFlNDFmNTUw
MDUyZTU1NzRhMDFiNTM3OGJmMmIzOTY0OTcwNzBmYzQ5MTNjNzQ5Zjc1IgotLSAKMi40Mi4wCgo=

--===============5372583830722320312==--

