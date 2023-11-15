Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC704C54F94
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.14615.1700059029410658477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GuGjPRtg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AYb6lauT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018bd36a25e5-82320ee9-3f1f-4341-98c1-f8da3effd66f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=e36GWUlF4oV2TQ92PTA7ypkKLhGxL5/6Pdejx3Lu0TQ=;
	b=GuGjPRtghQmtw1+Poqu11+6J1WombGtGnnKpaW3WhE29CPE3G4nOpss8cz+JH3QP
	ACDrDTC4BoIhxb4rg4sX9uU5+18K/b8RkH4z3eFEJhZFLjY2rPsUDebL92jmcrlil0D
	UxKm7uhjmdH/77JX0Ix5BkxkKCpwtlWnGgEKXZNs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=e36GWUlF4oV2TQ92PTA7ypkKLhGxL5/6Pdejx3Lu0TQ=;
	b=AYb6lauTGUMLvcCbjqrvP/ZsImDZQi9BZcmoHMR7B+w8rpJO9TXVfDEqb4NvAKW3
	8TRvbN05sUIwvVkx1/VBschVSPtZSNPXcAk1aNcoL/Y20nkpe0FXcuWv7At8XhAnN1k
	6GTOB2U6yojf6JxXZYt3+iacrJadCol2hi01tuxA=
Content-Type: multipart/mixed; boundary="===============0575458457581877167=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.7 FAILED
Message-ID: <0101018bd36a25e5-82320ee9-3f1f-4341-98c1-f8da3effd66f-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190656

--===============0575458457581877167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cups* to *2.4.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cups-upgrade-2.4.6-2.4.7.patch
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
From 90aa724363750ccf8f5b803c98b625cd62600394 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 08:55:37 +0000
Subject: [PATCH] cups: upgrade 2.4.6 -> 2.4.7

---
 meta/recipes-extended/cups/cups.inc           |  1 -
 .../cups/cups/CVE-2023-4504.patch             | 42 -------------------
 .../cups/{cups_2.4.6.bb => cups_2.4.7.bb}     |  2 +-
 3 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch
 rename meta/recipes-extended/cups/{cups_2.4.6.bb => cups_2.4.7.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index fa32c38549..36feaddcf8 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,7 +15,6 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
-           file://CVE-2023-4504.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
deleted file mode 100644
index e52e43a209..0000000000
--- a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-CVE: CVE-2023-4504
-Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31 ]
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
-
-From 2431caddb7e6a87f04ac90b5c6366ad268b6ff31 Mon Sep 17 00:00:00 2001
-From: Zdenek Dohnal <zdohnal@redhat.com>
-Date: Wed, 20 Sep 2023 14:45:17 +0200
-Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
-
-We didn't check for end of buffer if it looks there is an escaped
-character - check for NULL terminator there and if found, return NULL
-as return value and in `ptr`, because a lone backslash is not
-a valid PostScript character.
----
- cups/raster-interpret.c | 14 +++++++++++++-
- 1 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/cups/raster-interpret.c b/cups/raster-interpret.c
-index 6fcf731b5..b8655c8c6 100644
---- a/cups/raster-interpret.c
-+++ b/cups/raster-interpret.c
-@@ -1116,7 +1116,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - Stack */
- 
- 	    cur ++;
- 
--            if (*cur == 'b')
-+	   /*
-+	    * Return NULL if we reached NULL terminator, a lone backslash
-+	    * is not a valid character in PostScript.
-+	    */
-+
-+	    if (!*cur)
-+	    {
-+	      *ptr = NULL;
-+
-+	      return (NULL);
-+	    }
-+
-+	    if (*cur == 'b')
- 	      *valptr++ = '\b';
- 	    else if (*cur == 'f')
- 	      *valptr++ = '\f';
diff --git a/meta/recipes-extended/cups/cups_2.4.6.bb b/meta/recipes-extended/cups/cups_2.4.7.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.6.bb
rename to meta/recipes-extended/cups/cups_2.4.7.bb
index 58029fdbd4..f4b0282e4c 100644
--- a/meta/recipes-extended/cups/cups_2.4.6.bb
+++ b/meta/recipes-extended/cups/cups_2.4.7.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "58e970cf1955e1cc87d0847c32526d9c2ccee335e5f0e3882b283138ba0e7262"
+SRC_URI[sha256sum] = "dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c"
-- 
2.39.2


--===============0575458457581877167==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.6-2.4.7.patch"

RnJvbSA5MGFhNzI0MzYzNzUwY2NmOGY1YjgwM2M5OGI2MjVjZDYyNjAwMzk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDg6NTU6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXBzOiB1cGdyYWRlIDIuNC42IC0+IDIuNC43CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9j
dXBzL2N1cHMuaW5jICAgICAgICAgICB8ICAxIC0KIC4uLi9jdXBzL2N1cHMvQ1ZFLTIwMjMtNDUw
NC5wYXRjaCAgICAgICAgICAgICB8IDQyIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9jdXBzL3tj
dXBzXzIuNC42LmJiID0+IGN1cHNfMi40LjcuYmJ9ICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA0NCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL0NWRS0yMDIzLTQ1MDQucGF0Y2gKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy97Y3Vwc18yLjQuNi5iYiA9PiBjdXBzXzIuNC43
LmJifSAoNTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMu
aW5jIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy5pbmMKaW5kZXggZmEzMmMzODU0
OS4uMzZmZWFkZGNmOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vw
cy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy5pbmMKQEAgLTE1LDcg
KzE1LDYgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L2N1
cHMtJHtQVn0tc291cmNlLnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA0LWN1cHMtZml4
LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2ggXAogICAgICAgICAgICBmaWxl
Oi8vdm9sYXRpbGVzLjk5X2N1cHMgXAogICAgICAgICAgICBmaWxlOi8vY3Vwcy12b2xhdGlsZXMu
Y29uZiBcCi0gICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMy00NTA0LnBhdGNoIFwKICAgICAgICAg
ICAgIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL09wZW5QcmludGlu
Zy9jdXBzL3JlbGVhc2VzIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMv
Y3Vwcy9DVkUtMjAyMy00NTA0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vw
cy9DVkUtMjAyMy00NTA0LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlNTJl
NDNhMjA5Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMv
Q1ZFLTIwMjMtNDUwNC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQyICswLDAgQEAKLUNWRTog
Q1ZFLTIwMjMtNDUwNAotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIu
Y29tL09wZW5QcmludGluZy9jdXBzL2NvbW1pdC8yNDMxY2FkZGI3ZTZhODdmMDRhYzkwYjVjNjM2
NmFkMjY4YjZmZjMxIF0KLVNpZ25lZC1vZmYtYnk6IExlZSBDaGVlIFlhbmcgPGNoZWUueWFuZy5s
ZWVAaW50ZWwuY29tPgotCi1Gcm9tIDI0MzFjYWRkYjdlNmE4N2YwNGFjOTBiNWM2MzY2YWQyNjhi
NmZmMzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBaZGVuZWsgRG9obmFsIDx6ZG9o
bmFsQHJlZGhhdC5jb20+Ci1EYXRlOiBXZWQsIDIwIFNlcCAyMDIzIDE0OjQ1OjE3ICswMjAwCi1T
dWJqZWN0OiBbUEFUQ0hdIHJhc3Rlci1pbnRlcnByZXQuYzogRml4IENWRS0yMDIzLTQ1MDQKLQot
V2UgZGlkbid0IGNoZWNrIGZvciBlbmQgb2YgYnVmZmVyIGlmIGl0IGxvb2tzIHRoZXJlIGlzIGFu
IGVzY2FwZWQKLWNoYXJhY3RlciAtIGNoZWNrIGZvciBOVUxMIHRlcm1pbmF0b3IgdGhlcmUgYW5k
IGlmIGZvdW5kLCByZXR1cm4gTlVMTAotYXMgcmV0dXJuIHZhbHVlIGFuZCBpbiBgcHRyYCwgYmVj
YXVzZSBhIGxvbmUgYmFja3NsYXNoIGlzIG5vdAotYSB2YWxpZCBQb3N0U2NyaXB0IGNoYXJhY3Rl
ci4KLS0tLQotIGN1cHMvcmFzdGVyLWludGVycHJldC5jIHwgMTQgKysrKysrKysrKysrKy0KLSAx
IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAt
LWdpdCBhL2N1cHMvcmFzdGVyLWludGVycHJldC5jIGIvY3Vwcy9yYXN0ZXItaW50ZXJwcmV0LmMK
LWluZGV4IDZmY2Y3MzFiNS4uYjg2NTVjOGM2IDEwMDY0NAotLS0tIGEvY3Vwcy9yYXN0ZXItaW50
ZXJwcmV0LmMKLSsrKyBiL2N1cHMvcmFzdGVyLWludGVycHJldC5jCi1AQCAtMTExNiw3ICsxMTE2
LDE5IEBAIHNjYW5fcHMoX2N1cHNfcHNfc3RhY2tfdCAqc3QsCQkvKiBJICAtIFN0YWNrICovCi0g
Ci0gCSAgICBjdXIgKys7Ci0gCi0tICAgICAgICAgICAgaWYgKCpjdXIgPT0gJ2InKQotKwkgICAv
KgotKwkgICAgKiBSZXR1cm4gTlVMTCBpZiB3ZSByZWFjaGVkIE5VTEwgdGVybWluYXRvciwgYSBs
b25lIGJhY2tzbGFzaAotKwkgICAgKiBpcyBub3QgYSB2YWxpZCBjaGFyYWN0ZXIgaW4gUG9zdFNj
cmlwdC4KLSsJICAgICovCi0rCi0rCSAgICBpZiAoISpjdXIpCi0rCSAgICB7Ci0rCSAgICAgICpw
dHIgPSBOVUxMOwotKwotKwkgICAgICByZXR1cm4gKE5VTEwpOwotKwkgICAgfQotKwotKwkgICAg
aWYgKCpjdXIgPT0gJ2InKQotIAkgICAgICAqdmFscHRyKysgPSAnXGInOwotIAkgICAgZWxzZSBp
ZiAoKmN1ciA9PSAnZicpCi0gCSAgICAgICp2YWxwdHIrKyA9ICdcZic7CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC42LmJiIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2N1cHMvY3Vwc18yLjQuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDUxJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC42LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC43LmJiCmluZGV4IDU4MDI5ZmRiZDQuLmY0
YjAyODJlNGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40
LjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuNy5iYgpAQCAt
Miw0ICsyLDQgQEAgcmVxdWlyZSBjdXBzLmluYwogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjU4ZTk3MGNmMTk1NWUxY2M4N2QwODQ3YzMyNTI2ZDljMmNjZWUzMzVl
NWYwZTM4ODJiMjgzMTM4YmEwZTcyNjIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGQ1NDIyOGRk
OTAzNTI2NDI4Y2U3ZTM3OTYxYWZhZWQyMzBhZDMxMDc4ODE0MWRhNzVjZWJhYTA4MzYyY2Y2YyIK
LS0gCjIuMzkuMgoK

--===============0575458457581877167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d20386e19b4a120842eeccc645bafda635888869"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d20386e19b4a120842eeccc645bafda635888869"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 265 Local 256 Mirrors 0 Missed 9 Current 509 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 566 of 774 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_populate_lic_setscene)
NOTE: Running setscene task 568 of 774 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cups-2.4.7-r0: task do_populate_lic_setscene: Started
NOTE: recipe cups-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cups-2.4.7-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe cups-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 774 of 774 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe cups-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cups-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1892 of 2133 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_fetch)
NOTE: recipe cups-2.4.7-r0: task do_fetch: Started
NOTE: recipe cups-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 2115 of 2133 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_unpack)
NOTE: Running task 2116 of 2133 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe cups-2.4.7-r0: task do_unpack: Started
NOTE: recipe cups-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cups-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2117 of 2133 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_patch)
NOTE: Running task 2118 of 2133 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_collect_spdx_deps)
NOTE: recipe cups-2.4.7-r0: task do_patch: Started
NOTE: recipe cups-2.4.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe cups-2.4.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cups-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cups-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2120 of 2133 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_configure)
NOTE: recipe cups-2.4.7-r0: task do_configure: Started
NOTE: recipe cups-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2122 of 2133 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_compile)
NOTE: recipe cups-2.4.7-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52
| Using ARCHFLAGS=
| Using ALL_CFLAGS=-I.. -D_CUPS_SOURCE -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/
 core2-64-poky-linux/cups/2.4.7/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/libusb-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/lib/dbus-1.0/include -DDBUS_API_SUBJECT_TO_CHANGE -D_FORTIFY_SOURCE=3 -D_REENTRANT  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_THREAD_SAFE -D_REENTRANT  -Wall -Wunused
| Using ALL_CXXFLAGS=-I.. -D_CUPS_SOURCE -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/wor
 k/core2-64-poky-linux/cups/2.4.7/recipe-sysroot-native=  -fvisibility-inlines-hidden -D_FORTIFY_SOURCE=3  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_THREAD_SAFE -D_REENTRANT  -Wall -Wunused
| Using CC=x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot
| Using CXX=x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot
| Using DSOFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/c
 ups/2.4.7/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-soname,all -shared
| Using LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cu
 ps/2.4.7/recipe-sysroot-native=  -Wl,-z,relro,-z,now
| Using LIBS= -lavahi-common -lavahi-client  -lz -lpthread -lm -lcrypt   -lz
| Making all in cups...
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7/cups'
| make[1]: warning: -j16 forced in submake: resetting jobserver mode.
| Compiling raster-interstub.c...
| Compiling raster-stubs.c...
| Compiling array.c...
| Compiling auth.c...
| Compiling debug.c...
| Compiling dest.c...
| Compiling dest-job.c...
| Compiling dest-localization.c...
| Compiling dest-options.c...
| Compiling dir.c...
| Compiling encode.c...
| Compiling file.c...
| Compiling getputfile.c...
| Compiling globals.c...
| Compiling hash.c...
| Compiling http.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| dir.c: In function 'cupsDirRead':
| dir.c:391:46: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 1023 [-Wformat-truncation=]
|   391 |     snprintf(filename, sizeof(filename), "%s/%s", dp->directory, entry->d_name);
|       |                                              ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/stdio.h:964,
|                  from string-private.h:19,
|                  from dir.c:18:
| In function 'snprintf',
|     inlined from 'cupsDirRead' at dir.c:391:5:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 2 and 1280 bytes into a destination of size 1024
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| Compiling http-addr.c...
| Compiling http-addrlist.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| hash.c:16:12: fatal error: gnutls/crypto.h: No such file or directory
|    16 | #  include <gnutls/crypto.h>
|       |            ^~~~~~~~~~~~~~~~~
| compilation terminated.
| make[1]: *** [../Makedefs:271: hash.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| getputfile.c: In function 'cupsGetFd':
| getputfile.c:194:7: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   194 |       write(fd, buffer, (size_t)bytes);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| file.c: In function 'cupsFileOpen':
| file.c:1120:11: warning: ignoring return value of 'ftruncate' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1120 |           ftruncate(fd, 0);
|       |           ^~~~~~~~~~~~~~~~
| dest.c: In function 'cupsGetDestWithURI':
| dest.c:1292:42: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 9 and 1021 [-Wformat-truncation=]
|  1292 |       snprintf(temp, sizeof(temp), "%s @ %s", resource + 11, hostname);
|       |                                          ^~                  ~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/stdio.h:964,
|                  from string-private.h:19,
|                  from cups-private.h:19,
|                  from dest.c:16:
| In function 'snprintf',
|     inlined from 'cupsGetDestWithURI' at dest.c:1292:7:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 4 and 1271 bytes into a destination of size 1024
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| dest.c: In function 'cupsGetDestWithURI':
| dest.c:1286:42: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 8 and 1021 [-Wformat-truncation=]
|  1286 |       snprintf(temp, sizeof(temp), "%s @ %s", resource + 10, hostname);
|       |                                          ^~                  ~~~~~~~~
| In function 'snprintf',
|     inlined from 'cupsGetDestWithURI' at dest.c:1286:7:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 4 and 1272 bytes into a destination of size 1024
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| dest.c: In function 'cupsGetDestWithURI':
| dest.c:1280:42: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 7 and 1021 [-Wformat-truncation=]
|  1280 |       snprintf(temp, sizeof(temp), "%s @ %s", resource + 9, hostname);
|       |                                          ^~                 ~~~~~~~~
| In function 'snprintf',
|     inlined from 'cupsGetDestWithURI' at dest.c:1280:7:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 4 and 1273 bytes into a destination of size 1024
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7/cups'
| make: *** [Makefile:43: all] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.2250665:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.2250665, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.2250665, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.2250665, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.2250665, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.2250665, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.2250665, line 195
NOTE: recipe cups-2.4.7-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2122 tasks of which 2115 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115085511.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115085511.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cups-2.4.7-r0 do_compile: oe_runmake failed
ERROR: cups-2.4.7-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.2250665', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/log.do_compile.2250665
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.7.bb:do_compile) failed with exit code '1'

--===============0575458457581877167==--

