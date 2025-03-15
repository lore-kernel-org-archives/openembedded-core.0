Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E797AC35FFB
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.10327.1742048290534946626
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VgHO+hGu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MZu3ksXm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101959a2b631b-01e8346b-aca5-46d0-8094-b97f874af9f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048289;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3wEcMk3tf8rirxJEGognS3jabwWGrCoegCTjjOuxCtA=;
	b=VgHO+hGuejIz0cV1/nYW6l3d1TU+LtdgU9n9hUuYA/Dh60/g+kyuWuWBA4C+mXSo
	GiZ1UcZgjS2m8wTue7k5IQQaCEcd5tPWTcNHqi3V1M/au5KpVoFbYY7/79V31lC0mYn
	xb01bcXxOIL40NIe1fdX5FxXqCPC0NxiVjNqJb4s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048289;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3wEcMk3tf8rirxJEGognS3jabwWGrCoegCTjjOuxCtA=;
	b=MZu3ksXmMh/R4inGIizrze0jMKWvJeXp3iwxH4qwo/K5Qx71ZxJPnWfTRdphMQxO
	FH1zWUwwXbnFJYHNKJ1tbxC8x1D5Q1i/IKL7VhZ2RaXSDmqibQsAIEiWxFBt3GuuS6K
	iX5f8nGx7bJ5oROYRR52VqZmRi6aDV/xiCpuKVUU=
Content-Type: multipart/mixed; boundary="===============2311186962529797054=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xinit,xauth: upgrading to 1.4.4,1.1.4 SUCCEEDED
Message-ID: <010101959a2b631b-01e8346b-aca5-46d0-8094-b97f874af9f0-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212883

--===============2311186962529797054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xinit,xauth* to *1.4.4,1.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xinit-xauth-upgrade-1.4.3-1.4.4-1.1.3-1.1.4.patch
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
From 787cf165a02ccd1eb19b76bfe33942218eab81d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 06:41:15 +0000
Subject: [PATCH] xinit,xauth: upgrade 1.4.3 -> 1.4.4,1.1.3 -> 1.1.4

---
 .../xorg-app/{xauth_1.1.3.bb => xauth_1.1.4.bb}            | 2 +-
 .../xinit/0001-Make-manpage-multilib-identical.patch       | 7 ++-----
 .../xorg-app/{xinit_1.4.3.bb => xinit_1.4.4.bb}            | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.1.3.bb => xauth_1.1.4.bb} (83%)
 rename meta/recipes-graphics/xorg-app/{xinit_1.4.3.bb => xinit_1.4.4.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.1.3.bb b/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xauth_1.1.3.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
index b0ca33bf4b..919457bca6 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
@@ -9,7 +9,7 @@ DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "e7075498bae332f917f01d660f9b940c0752b2556a8da61ccb62a44d0ffe9d33"
+SRC_URI[sha256sum] = "e9318141464ad7b4dc0f8564a580f0d20f977c85a388cc40d5a766206151c690"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch b/meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch
index 649905574c..05cca7804d 100644
--- a/meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch
+++ b/meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch
@@ -1,4 +1,4 @@
-From d642e60d8963f1b90569cd0ab5c29ac2c9bfe939 Mon Sep 17 00:00:00 2001
+From e193ebf82819a24f067a559b42a81bf380d12ab8 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Fri, 6 Mar 2020 22:28:14 +0000
 Subject: [PATCH] Make manpage multilib identical
@@ -11,7 +11,7 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/man/Makefile.am b/man/Makefile.am
-index 9c6569f..608e933 100644
+index 9c6569f..e88c4ae 100644
 --- a/man/Makefile.am
 +++ b/man/Makefile.am
 @@ -12,7 +12,7 @@ MAN_SUBSTS+=	-e 's|__XSERVERNAME__|$(XSERVERNAME)|g' \
@@ -23,6 +23,3 @@ index 9c6569f..608e933 100644
  		-e 's|__configdir__|$(XINITDIR)|g'
  
  
--- 
-2.23.0
-
diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.3.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-app/xinit_1.4.3.bb
rename to meta/recipes-graphics/xorg-app/xinit_1.4.4.bb
index 519a9fc4ef..b646ac667c 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.4.3.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb
@@ -16,7 +16,7 @@ SRC_URI += "file://0001-Make-manpage-multilib-identical.patch"
 
 SRC_URI_EXT = "xz"
 
-SRC_URI[sha256sum] = "86409f21a6a31148d2c1c17bf5f2d904eb5ef455f9dc67c49fbd0c10ab18fd5a"
+SRC_URI[sha256sum] = "40a47c7a164c7f981ce3787b4b37f7e411fb43231dcde543d70094075dacfef9"
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie \
                 --with-xterm=x-terminal-emulator"
-- 
2.44.1


--===============2311186962529797054==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xinit-xauth-upgrade-1.4.3-1.4.4-1.1.3-1.1.4.patch"

RnJvbSA3ODdjZjE2NWEwMmNjZDFlYjE5Yjc2YmZlMzM5NDIyMThlYWI4MWQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDY6NDE6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
aW5pdCx4YXV0aDogdXBncmFkZSAxLjQuMyAtPiAxLjQuNCwxLjEuMyAtPiAxLjEuNAoKLS0tCiAu
Li4veG9yZy1hcHAve3hhdXRoXzEuMS4zLmJiID0+IHhhdXRoXzEuMS40LmJifSAgICAgICAgICAg
IHwgMiArLQogLi4uL3hpbml0LzAwMDEtTWFrZS1tYW5wYWdlLW11bHRpbGliLWlkZW50aWNhbC5w
YXRjaCAgICAgICB8IDcgKystLS0tLQogLi4uL3hvcmctYXBwL3t4aW5pdF8xLjQuMy5iYiA9PiB4
aW5pdF8xLjQuNC5iYn0gICAgICAgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWFwcC97eGF1dGhfMS4xLjMuYmIgPT4geGF1dGhfMS4xLjQuYmJ9ICg4MyUpCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3t4aW5pdF8xLjQuMy5iYiA9PiB4aW5pdF8x
LjQuNC5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1h
cHAveGF1dGhfMS4xLjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGF1dGhf
MS4xLjQuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctYXBwL3hhdXRoXzEuMS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy1hcHAveGF1dGhfMS4xLjQuYmIKaW5kZXggYjBjYTMzYmY0Yi4uOTE5NDU3YmNh
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hhdXRoXzEuMS4z
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94YXV0aF8xLjEuNC5iYgpA
QCAtOSw3ICs5LDcgQEAgREVQRU5EUyArPSAibGlieGF1IGxpYnhleHQgbGlieG11IgogUEUgPSAi
MSIKIAogU1JDX1VSSV9FWFQgPSAieHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTcwNzU0OThi
YWUzMzJmOTE3ZjAxZDY2MGY5Yjk0MGMwNzUyYjI1NTZhOGRhNjFjY2I2MmE0NGQwZmZlOWQzMyIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlOTMxODE0MTQ2NGFkN2I0ZGMwZjg1NjRhNTgwZjBkMjBm
OTc3Yzg1YTM4OGNjNDBkNWE3NjYyMDYxNTFjNjkwIgogCiBQQUNLQUdFQ09ORklHID8/PSAiJHtA
YmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnaXB2NicsIGQpfSIKIFBBQ0tBR0VD
T05GSUdbaXB2Nl0gPSAiLS1lbmFibGUtaXB2NiwtLWRpc2FibGUtaXB2NiwiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGluaXQvMDAwMS1NYWtlLW1hbnBhZ2Ut
bXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBw
L3hpbml0LzAwMDEtTWFrZS1tYW5wYWdlLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaAppbmRleCA2
NDk5MDU1NzRjLi4wNWNjYTc4MDRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy1hcHAveGluaXQvMDAwMS1NYWtlLW1hbnBhZ2UtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94aW5pdC8wMDAxLU1ha2UtbWFu
cGFnZS1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ2NDJl
NjBkODk2M2YxYjkwNTY5Y2QwYWI1YzI5YWMyYzliZmU5MzkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGUxOTNlYmY4MjgxOWEyNGYwNjdhNTU5YjQyYTgxYmYzODBkMTJhYjggTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJlbXkgUHVobG1hbiA8anB1aGxtYW5AbXZpc3Rh
LmNvbT4KIERhdGU6IEZyaSwgNiBNYXIgMjAyMCAyMjoyODoxNCArMDAwMAogU3ViamVjdDogW1BB
VENIXSBNYWtlIG1hbnBhZ2UgbXVsdGlsaWIgaWRlbnRpY2FsCkBAIC0xMSw3ICsxMSw3IEBAIFNp
Z25lZC1vZmYtYnk6IEplcmVteSBQdWhsbWFuIDxqcHVobG1hbkBtdmlzdGEuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
bWFuL01ha2VmaWxlLmFtIGIvbWFuL01ha2VmaWxlLmFtCi1pbmRleCA5YzY1NjlmLi42MDhlOTMz
IDEwMDY0NAoraW5kZXggOWM2NTY5Zi4uZTg4YzRhZSAxMDA2NDQKIC0tLSBhL21hbi9NYWtlZmls
ZS5hbQogKysrIGIvbWFuL01ha2VmaWxlLmFtCiBAQCAtMTIsNyArMTIsNyBAQCBNQU5fU1VCU1RT
Kz0JLWUgJ3N8X19YU0VSVkVSTkFNRV9ffCQoWFNFUlZFUk5BTUUpfGcnIFwKQEAgLTIzLDYgKzIz
LDMgQEAgaW5kZXggOWM2NTY5Zi4uNjA4ZTkzMyAxMDA2NDQKICAJCS1lICdzfF9fY29uZmlnZGly
X198JChYSU5JVERJUil8ZycKICAKICAKLS0tIAotMi4yMy4wCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94aW5pdF8xLjQuMy5iYiBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWFwcC94aW5pdF8xLjQuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGluaXRfMS40LjMuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94aW5pdF8xLjQuNC5iYgppbmRl
eCA1MTlhOWZjNGVmLi5iNjQ2YWM2NjdjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1hcHAveGluaXRfMS40LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctYXBwL3hpbml0XzEuNC40LmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgKz0gImZpbGU6
Ly8wMDAxLU1ha2UtbWFucGFnZS1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2giCiAKIFNSQ19VUklf
RVhUID0gInh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODY0MDlmMjFhNmEzMTE0OGQyYzFj
MTdiZjVmMmQ5MDRlYjVlZjQ1NWY5ZGM2N2M0OWZiZDBjMTBhYjE4ZmQ1YSIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI0MGE0N2M3YTE2NGM3Zjk4MWNlMzc4N2I0YjM3ZjdlNDExZmI0MzIzMWRjZGU1
NDNkNzAwOTQwNzVkYWNmZWY5IgogCiBFWFRSQV9PRUNPTkYgPSAiYWNfY3ZfcGF0aF9NQ09PS0lF
PSR7YmluZGlyfS9tY29va2llIFwKICAgICAgICAgICAgICAgICAtLXdpdGgteHRlcm09eC10ZXJt
aW5hbC1lbXVsYXRvciIKLS0gCjIuNDQuMQoK

--===============2311186962529797054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (0 cached, 923 parsed). 1885 targets, 50 skipped, 0 masked, 0 errors.
Removing 83 recipes from the core2-64 sysroot...done.
Removing 112 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ab1d69f89006b3a721cef452a46b7fddce543512"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 712 Local 643 Mirrors 0 Missed 69 Current 270 (90% match, 92% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 292 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_deploy_setscene)
NOTE: Running setscene task 309 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 328 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 365 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/libptytty/libptytty_2.0.bb:do_create_spdx_setscene)
NOTE: recipe xauth-1_1.1.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.8.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.08.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libptytty-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_deploy_setscene: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 400 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libptytty-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 405 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.8.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/libptytty/libptytty_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bc-1.08.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 418 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe btrfs-tools-6.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libptytty-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-6.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: recipe btrfs-tools-6.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 425 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/libptytty/libptytty_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 436 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 440 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 442 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 443 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libptytty-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libptytty-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe rxvt-unicode-9.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 452 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 458 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 461 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe rxvt-unicode-9.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 464 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb:do_recipe_qa_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libptytty-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 466 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 470 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe btrfs-tools-6.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rxvt-unicode-9.31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 472 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 475 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_deploy_setscene: Succeeded
NOTE: recipe rxvt-unicode-9.31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 506 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 511 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 514 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 517 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 520 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 528 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 538 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_create_spdx_setscene)
NOTE: recipe libxmu-1_1.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmu-1_1.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 540 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 543 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 547 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 552 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 553 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 559 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 563 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 570 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 573 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 576 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 577 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 581 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 591 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmu-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 600 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_package_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 616 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 620 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/libptytty/libptytty_2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 624 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 631 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 634 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libptytty-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libptytty-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 640 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 654 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 657 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 658 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 667 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 672 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 675 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_package_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 679 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 680 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 681 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 682 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 683 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 684 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 685 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 689 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 690 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-75.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 691 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 692 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 700 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 703 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 705 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 710 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 713 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 720 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 725 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 727 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 729 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 736 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 738 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.74-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 740 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.74-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 742 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-75.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 747 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 749 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 753 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.74-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.74-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 757 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 758 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 759 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 760 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 766 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 767 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 769 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 775 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 782 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 785 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.74.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 802 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 806 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 807 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 811 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.74-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 812 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.74-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 814 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 816 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 821 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 826 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 827 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 830 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 834 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 836 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 837 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 846 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 854 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 857 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 858 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 864 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 869 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 874 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 875 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 886 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 895 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 896 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 898 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 983 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_fetch)
NOTE: Running task 1037 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_fetch: Succeeded
NOTE: Running task 1138 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_write_config: Started
NOTE: Running task 1181 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1186 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_write_config: Succeeded
NOTE: Running task 1245 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 1282 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1284 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: Running task 1289 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: Running task 1299 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_fetch)
NOTE: Running task 1302 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1318 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_unpack)
NOTE: Running task 1319 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1365 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 1373 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Started
NOTE: Running task 1383 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1397 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_unpack)
NOTE: Running task 1420 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_recipe_qa)
NOTE: Running task 1421 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_recipe_qa)
NOTE: Running task 1425 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb:do_fetch)
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe libxmu-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 1437 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_fetch: Succeeded
NOTE: Running task 1468 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_unpack)
NOTE: recipe xauth-1_1.1.4-r0: task do_recipe_qa: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_recipe_qa: Started
NOTE: recipe rxvt-unicode-9.31-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe rxvt-unicode-9.31-r0: task do_fetch: Succeeded
NOTE: Running task 1488 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_patch)
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: Running task 1492 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb:do_unpack)
NOTE: Running task 1499 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_fetch)
NOTE: Running task 1505 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_fetch)
NOTE: recipe libxmu-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1513 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_patch)
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Started
NOTE: recipe rxvt-unicode-9.31-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.13-r0: task do_fetch: Started
NOTE: Running task 1551 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_patch)
NOTE: recipe iproute2-6.13.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1565 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_patch)
NOTE: recipe libxmu-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 1566 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe iproute2-6.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 1571 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_unpack)
NOTE: recipe libxmu-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Succeeded
NOTE: recipe xinit-1_1.4.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_patch: Started
NOTE: Running task 1624 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_fetch)
NOTE: Running task 1628 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_fetch)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Started
NOTE: recipe iproute2-6.13.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.13-r0: task do_fetch: Succeeded
NOTE: recipe rxvt-unicode-9.31-r0: task do_unpack: Succeeded
NOTE: Running task 1639 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_unpack)
NOTE: Running task 1640 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb:do_patch)
NOTE: recipe xinit-1_1.4.4-r0: task do_fetch: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_fetch: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1641 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_unpack)
NOTE: Running task 1642 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_unpack)
NOTE: recipe btrfs-tools-6.13-r0: task do_unpack: Started
NOTE: recipe rxvt-unicode-9.31-r0: task do_patch: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_unpack: Started
NOTE: recipe iproute2-6.13.0-r0: task do_unpack: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Succeeded
NOTE: Running task 1643 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1645 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe iproute2-6.13.0-r0: task do_patch: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe xinit-1_1.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1646 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_patch)
NOTE: Running task 1647 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_patch)
NOTE: recipe rxvt-unicode-9.31-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_patch: Started
NOTE: recipe iproute2-6.13.0-r0: task do_patch: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1650 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xinit-1_1.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1652 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_patch: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_unpack: Succeeded
NOTE: Running task 1655 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: recipe xinit-1_1.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.13-r0: task do_unpack: Succeeded
NOTE: Running task 1657 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_patch)
NOTE: recipe btrfs-tools-6.13-r0: task do_patch: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xinit-1_1.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.13-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 899 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 905 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 907 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 909 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 910 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 913 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 914 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 927 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 928 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 929 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 931 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 932 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 933 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 935 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1683 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 940 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 1692 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 941 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 942 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 943 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 944 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 945 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1707 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 952 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1708 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 955 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 956 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 958 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 963 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 965 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 973 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 974 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 980 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1987 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2206 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2224 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2309 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2389 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2413 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2514 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2584 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2596 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xinit-1_1.4.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2597 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2598 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_configure)
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2599 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xinit-1_1.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2600 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_configure)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2601 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure: Started
NOTE: recipe iproute2-6.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2602 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure: Started
NOTE: recipe iproute2-6.13.0-r0: task do_configure: Started
NOTE: recipe iproute2-6.13.0-r0: task do_configure: Succeeded
NOTE: Running task 2603 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_compile)
NOTE: recipe iproute2-6.13.0-r0: task do_compile: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2604 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.40.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.40.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2605 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx)
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2606 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_collect_spdx_deps)
NOTE: Running task 2607 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_collect_spdx_deps)
NOTE: Running task 2608 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2609 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2610 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xinit-1_1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2611 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_compile)
NOTE: recipe xinit-1_1.4.4-r0: task do_compile: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2612 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_install)
NOTE: recipe xinit-1_1.4.4-r0: task do_install: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_install: Succeeded
NOTE: Running task 2613 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_package)
NOTE: Running task 2614 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_populate_sysroot)
NOTE: recipe xinit-1_1.4.4-r0: task do_package: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 2615 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2616 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_compile)
NOTE: recipe xinit-1_1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2617 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_packagedata)
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.13.0-r0: task do_compile: Succeeded
NOTE: Running task 2618 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_install)
NOTE: recipe iproute2-6.13.0-r0: task do_install: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2619 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb:do_create_spdx)
NOTE: recipe xinit-1_1.4.4-r0: task do_create_spdx: Started
NOTE: recipe xinit-1_1.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 2620 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: recipe iproute2-6.13.0-r0: task do_install: Succeeded
NOTE: Running task 2621 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe iproute2-6.13.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: Running task 2622 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: Running task 2623 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure: Succeeded
NOTE: Running task 2624 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_configure_ptest_base)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2625 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2626 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_install)
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Succeeded
NOTE: Running task 2627 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 2628 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_package)
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2629 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2630 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_configure)
NOTE: recipe libxmu-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: Running task 2631 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata unihash changed to 56a7733b45d116cc86f1a7a18132778493f0c7ec1dad670231d41e0e8a857944
NOTE: Setscene tasks completed
NOTE: Running task 2632 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe iproute2-6.13.0-r0: task do_package: Succeeded
NOTE: Running task 2633 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_packagedata)
NOTE: recipe iproute2-6.13.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.13.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb:do_packagedata unihash changed to 0bcb8a83f0dbdc697a347326194df1ba8ad724d62d690e6d40a0427ce74a9cb9
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure: Succeeded
NOTE: Running task 2634 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2635 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_compile)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Succeeded
NOTE: Running task 2636 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata unihash changed to fdc6f034532c52910da1f24e67e1ffb1f2d9bfe4cafd25bcb77ad512d7ecb9d1
NOTE: Setscene tasks completed
NOTE: Running task 2637 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2638 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libxmu-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile: Succeeded
NOTE: Running task 2639 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2640 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_install)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2641 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_compile)
NOTE: recipe libxmu-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2642 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_install)
NOTE: recipe libxmu-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2643 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_package)
NOTE: Running task 2644 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxmu-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2645 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xauth-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2646 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_configure)
NOTE: recipe xauth-1_1.1.4-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install: Succeeded
NOTE: Running task 2647 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install_ptest_base: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2648 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_packagedata)
NOTE: recipe libxmu-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2649 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package)
NOTE: Running task 2650 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot)
NOTE: recipe libxmu-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_packagedata unihash changed to 14c1a5c60de69562c55d51149d25327b7709c98918b537d000f6520124f7901c
NOTE: recipe e2fsprogs-1.47.1-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 2651 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb:do_create_spdx)
NOTE: recipe libxmu-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libxmu-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2652 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_collect_spdx_deps)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot unihash changed to 71b70298629d24a0f0d0e741feee16b770c9a0b0d63a776156d6971882bd8527
NOTE: Setscene tasks completed
NOTE: Running task 2653 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe xauth-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe btrfs-tools-6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe btrfs-tools-6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2654 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_configure)
NOTE: recipe btrfs-tools-6.13-r0: task do_configure: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2655 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_compile)
NOTE: recipe xauth-1_1.1.4-r0: task do_compile: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2656 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_install)
NOTE: recipe xauth-1_1.1.4-r0: task do_install: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2657 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_package)
NOTE: Running task 2658 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_populate_sysroot)
NOTE: recipe xauth-1_1.1.4-r0: task do_package: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2659 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_packagedata)
NOTE: recipe xauth-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2660 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_create_spdx)
NOTE: Running task 2661 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_package_write_ipk)
NOTE: Running task 2662 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_package_write_deb)
NOTE: Running task 2663 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_package_write_rpm)
NOTE: Running task 2664 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_package_qa)
NOTE: recipe xauth-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_package_write_ipk: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: Running task 2665 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_compile_ptest_base)
NOTE: recipe xauth-1_1.1.4-r0: task do_package_qa: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2666 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_install)
NOTE: recipe xauth-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2667 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_create_package_spdx)
NOTE: recipe xauth-1_1.1.4-r0: task do_create_package_spdx: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install: Started
NOTE: recipe xauth-1_1.1.4-r0: task do_create_package_spdx: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_package_qa: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe xauth-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2668 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb:do_build)
NOTE: recipe btrfs-tools-6.13-r0: task do_configure: Succeeded
NOTE: Running task 2669 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_compile)
NOTE: recipe btrfs-tools-6.13-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package: Succeeded
NOTE: Running task 2670 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install: Succeeded
NOTE: Running task 2671 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_packagedata unihash changed to 301b64874371c2070ab0a76b066b62d4015e123f847db68192c5054c3c90772a
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2672 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot)
NOTE: Running task 2673 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2674 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2675 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.13-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2676 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_install)
NOTE: recipe btrfs-tools-6.13-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 2677 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe btrfs-tools-6.13-r0: task do_install: Succeeded
NOTE: Running task 2678 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.13-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 2679 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.13-r0: task do_package: Succeeded
NOTE: Running task 2680 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.13-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.13-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb:do_packagedata unihash changed to 8d05870552eb696ddedb3605f6b3c9302bb6b3314c2e640756c158470a1fedbb
NOTE: Setscene tasks completed
NOTE: Running task 2681 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package_write_ipk)
NOTE: Running task 2682 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package_write_deb)
NOTE: Running task 2683 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package_write_rpm)
NOTE: Running task 2684 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package_qa)
NOTE: recipe util-linux-2.40.4-r0: task do_package_write_ipk: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package_write_deb: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package_qa: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 2685 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2686 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2687 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Succeeded
NOTE: Running task 2688 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2689 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package_qa unihash changed to 856e2f7f152d0fbcbbc5426bc0d47f9af8c91239314debc8368a21f2798f9bf4
NOTE: recipe util-linux-2.40.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package: Succeeded
NOTE: Running task 2690 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Succeeded
NOTE: Running task 2691 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2692 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Succeeded
NOTE: Running task 2693 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2694 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2695 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe rxvt-unicode-9.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rxvt-unicode-9.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2696 of 2722 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb:do_configure)
NOTE: recipe rxvt-unicode-9.31-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata: Failed
NOTE: recipe rxvt-unicode-9.31-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2696 tasks of which 2538 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315063959.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315063959.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.82.4/temp/log.do_packagedata.8550
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kab went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.84.0-r0 to 1:2.82.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.82.4/temp/log.do_packagedata.8550
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata) failed with exit code '1'

--===============2311186962529797054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xauth: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/xauth: SRC_URI changed from "https://www.x.org/releases//individual/app/xauth-1.1.3.tar.xz" to "https://www.x.org/releases//individual/app/xauth-1.1.4.tar.xz"
packages/core2-64-poky-linux/xauth: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/xauth/xauth-dbg: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/xauth/xauth-dbg: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/xauth/xauth-dbg: PKGSIZE changed from 118560 to 118704 (+0%)
packages/core2-64-poky-linux/xauth/xauth-dev: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/xauth/xauth-dev: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/xauth/xauth-doc: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/xauth/xauth-doc: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/xauth/xauth-locale: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/xauth/xauth-locale: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/xauth/xauth-src: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/xauth/xauth-src: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/xauth/xauth-src: PKGSIZE changed from 75716 to 76373 (+1%)
packages/core2-64-poky-linux/xauth/xauth-staticdev: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/xauth/xauth-staticdev: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/xauth/xauth: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/xauth/xauth: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/xinit: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/xinit: SRC_URI changed from "https://www.x.org/releases//individual/app/xinit-1.4.3.tar.xz file://0001-Make-manpage-multilib-identical.patch" to "https://www.x.org/releases//individual/app/xinit-1.4.4.tar.xz file://0001-Make-manpage-multilib-identical.patch"
packages/core2-64-poky-linux/xinit: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/xinit/xinit-dbg: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/xinit/xinit-dbg: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/xinit/xinit-dev: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/xinit/xinit-dev: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/xinit/xinit-doc: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/xinit/xinit-doc: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/xinit/xinit-locale: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/xinit/xinit-locale: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/xinit/xinit-src: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/xinit/xinit-src: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/xinit/xinit-staticdev: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/xinit/xinit-staticdev: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/xinit/xinit: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/xinit/xinit: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/xinit/xinit: PKGSIZE changed from 33450 to 33663 (+1%)

--===============2311186962529797054==--

