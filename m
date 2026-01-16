Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C900D48996
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1430.1768526746331128762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RpJse/D1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XTGfbV2E;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019bc468aa2d-160c4ca6-91a3-4084-9dd1-04de9f698b8b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pL/ehGOnrv47ml3/eHoxYCNvxWzxCZo0aI2qNgOixNo=;
	b=RpJse/D1Cdjzaf6EVfnn92KgbBoexolNdj3WkQJrhBtpBmDp8KX/H8z1YpibWQ8J
	7tJruST6hftsLLa0E2wF2x6rrQXAS0vOor0nLDrvdk+I/HgsHpo+K3nhKhr5x+7hhkR
	S9iPpXfS8pCuXSzV3iiCdC0r4oB/oH912CvihzlA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pL/ehGOnrv47ml3/eHoxYCNvxWzxCZo0aI2qNgOixNo=;
	b=XTGfbV2E59uKac0M10kEs7h/DoCb8xe24xrJV7gXZ1KjFuIbDJ7o6OxaVqAu8TGm
	LWEDf5ivoyxerrVXqVWsLeQUcktAQ0I6ajgTgndJ7oG4yfsAmyFgyjxj/wJsie81LQq
	E/V+sKrYHr4lKS4hGpf5IuLxWODlzK/0wu096hJg=
Content-Type: multipart/mixed; boundary="===============9042050748373668347=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.19.0 FAILED
Message-ID: <0101019bc468aa2d-160c4ca6-91a3-4084-9dd1-04de9f698b8b-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229482

--===============9042050748373668347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.19.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.18.0-4.19.0.patch
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
From 2519d9e137dd4cbd13ee5aeb36524d3d17589e37 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 22:37:09 +0000
Subject: [PATCH] shadow: upgrade 4.18.0 -> 4.19.0

---
 ...unexpected-open-failure-in-chroot-env.patch |  6 +++---
 .../shadow/files/disable_syslog.patch          | 18 +++++++++++++-----
 .../shadow/files/shadow-update-pam-conf.patch  |  5 +----
 .../{shadow_4.18.0.bb => shadow_4.19.0.bb}     |  5 ++++-
 4 files changed, 21 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.18.0.bb => shadow_4.19.0.bb} (97%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 699269ed64..e604420415 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f7b765c022e4cad9140ac44712885c66e149abdc Mon Sep 17 00:00:00 2001
+From 2c17f5142316a36c11a0c6f74f510c218929a477 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 4d83e83..9ee0e13 100644
+index 2c6a1a2..01e2fc7 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -604,10 +604,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -598,10 +598,18 @@ commonio_open(struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta/recipes-extended/shadow/files/disable_syslog.patch
index 7299a8e61c..f2a42605e8 100644
--- a/meta/recipes-extended/shadow/files/disable_syslog.patch
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -1,15 +1,23 @@
+From 8e9d6b2f28b0db2bc90cb53b87668ea810ace9d3 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 28 Feb 2025 10:09:56 +0000
+Subject: [PATCH] shadow-native: Disable syslog usage
+
 When building images using shadow-native, we shouldn't be spamming the host's
 log with lots of syslog messages which aren't relavent. Disable syslog use
 in the native case.
 
 Upstream-Status: Inappropriate [Would upstream accept a configure option?]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ lib/defines.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
-Index: shadow-4.17.2/lib/defines.h
-===================================================================
---- shadow-4.17.2.orig/lib/defines.h
-+++ shadow-4.17.2/lib/defines.h
-@@ -88,7 +88,9 @@
+diff --git a/lib/defines.h b/lib/defines.h
+index 09c0965..5c70f32 100644
+--- a/lib/defines.h
++++ b/lib/defines.h
+@@ -75,7 +75,9 @@
  
  /* cleaner than lots of #ifdefs everywhere - use this as follows:
     SYSLOG((LOG_CRIT, "user %s cracked root", user)); */
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 318e2665c2..c19bbabc91 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From eb17cd91d8e4d76ee95de9c0c9f4938ba2e3e82a Mon Sep 17 00:00:00 2001
+From ec928cbc4a13a26fda6d4578560c95e2efe82791 Mon Sep 17 00:00:00 2001
 From: Kang Kai <kai.kang@windriver.com>
 Date: Wed, 20 Jul 2011 19:18:14 +0800
 Subject: [PATCH] shadow: update pam related configure files
@@ -105,6 +105,3 @@ index 8f49f5c..b1f365d 100644
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
--- 
-2.43.0
-
diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes-extended/shadow/shadow_4.19.0.bb
similarity index 97%
rename from meta/recipes-extended/shadow/shadow_4.18.0.bb
rename to meta/recipes-extended/shadow/shadow_4.19.0.bb
index d9a49d8ccf..621fdfb53b 100644
--- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.0.bb
@@ -14,6 +14,9 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+           file://login_defs_pam.sed \
+           file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
+           file://disable_syslog.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -25,7 +28,7 @@ SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://disable_syslog.patch \
            "
-SRC_URI[sha256sum] = "ae486ce4c0bce55c42d76d8478e428c41586f1da2f89fbf5228243fb4d849db4"
+SRC_URI[sha256sum] = "684da1612f46b2c2da6a4f220a801bcd5e28e0715a620d663c393df5b4c4333f"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.47.1


--===============9042050748373668347==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.18.0-4.19.0.patch"

RnJvbSAyNTE5ZDllMTM3ZGQ0Y2JkMTNlZTVhZWIzNjUyNGQzZDE3NTg5ZTM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjI6Mzc6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkb3c6IHVwZ3JhZGUgNC4xOC4wIC0+IDQuMTkuMAoKLS0tCiAuLi51bmV4cGVjdGVkLW9wZW4t
ZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIHwgIDYgKysrLS0tCiAuLi4vc2hhZG93L2ZpbGVz
L2Rpc2FibGVfc3lzbG9nLnBhdGNoICAgICAgICAgIHwgMTggKysrKysrKysrKysrKy0tLS0tCiAu
Li4vc2hhZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2ggIHwgIDUgKy0tLS0K
IC4uLi97c2hhZG93XzQuMTguMC5iYiA9PiBzaGFkb3dfNC4xOS4wLmJifSAgICAgfCAgNSArKysr
LQogNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3tzaGFkb3dfNC4xOC4wLmJiID0+IHNo
YWRvd180LjE5LjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1j
aHJvb3QtZW52LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9jb21t
b25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoCmlu
ZGV4IDY5OTI2OWVkNjQuLmU2MDQ0MjA0MTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUt
aW4tY2hyb290LWVudi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2Zp
bGVzL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY3Yjc2NWMwMjJlNGNhZDkxNDBhYzQ0NzEyODg1
YzY2ZTE0OWFiZGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJjMTdmNTE0MjMxNmEz
NmMxMWEwYzZmNzRmNTEwYzIxODkyOWE0NzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDE3IEp1bCAyMDE0
IDE1OjUzOjM0ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbW1vbmlvLmMtZml4LXVuZXhwZWN0
ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYKQEAgLTIwLDEwICsyMCwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvY29t
bW9uaW8uYyBiL2xpYi9jb21tb25pby5jCi1pbmRleCA0ZDgzZTgzLi45ZWUwZTEzIDEwMDY0NAor
aW5kZXggMmM2YTFhMi4uMDFlMmZjNyAxMDA2NDQKIC0tLSBhL2xpYi9jb21tb25pby5jCiArKysg
Yi9saWIvY29tbW9uaW8uYwotQEAgLTYwNCwxMCArNjA0LDE4IEBAIGludCBjb21tb25pb19vcGVu
IChzdHJ1Y3QgY29tbW9uaW9fZGIgKmRiLCBpbnQgbW9kZSkKK0BAIC01OTgsMTAgKzU5OCwxOCBA
QCBjb21tb25pb19vcGVuKHN0cnVjdCBjb21tb25pb19kYiAqZGIsIGludCBtb2RlKQogIAlkYi0+
Y3Vyc29yID0gTlVMTDsKICAJZGItPmNoYW5nZWQgPSBmYWxzZTsKICAKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvZGlzYWJsZV9zeXNsb2cucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2Rpc2FibGVfc3lzbG9nLnBhdGNoCmlu
ZGV4IDcyOTlhOGU2MWMuLmYyYTQyNjA1ZTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9zaGFkb3cvZmlsZXMvZGlzYWJsZV9zeXNsb2cucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3NoYWRvdy9maWxlcy9kaXNhYmxlX3N5c2xvZy5wYXRjaApAQCAtMSwxNSArMSwy
MyBAQAorRnJvbSA4ZTlkNmIyZjI4YjBkYjJiYzkwY2I1M2I4NzY2OGVhODEwYWNlOWQzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CitEYXRlOiBGcmksIDI4IEZlYiAyMDI1IDEwOjA5OjU2ICsw
MDAwCitTdWJqZWN0OiBbUEFUQ0hdIHNoYWRvdy1uYXRpdmU6IERpc2FibGUgc3lzbG9nIHVzYWdl
CisKIFdoZW4gYnVpbGRpbmcgaW1hZ2VzIHVzaW5nIHNoYWRvdy1uYXRpdmUsIHdlIHNob3VsZG4n
dCBiZSBzcGFtbWluZyB0aGUgaG9zdCdzCiBsb2cgd2l0aCBsb3RzIG9mIHN5c2xvZyBtZXNzYWdl
cyB3aGljaCBhcmVuJ3QgcmVsYXZlbnQuIERpc2FibGUgc3lzbG9nIHVzZQogaW4gdGhlIG5hdGl2
ZSBjYXNlLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW1dvdWxkIHVwc3RyZWFt
IGFjY2VwdCBhIGNvbmZpZ3VyZSBvcHRpb24/XQogU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CistLS0KKyBsaWIvZGVmaW5l
cy5oIHwgNCArKystCisgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQogCi1JbmRleDogc2hhZG93LTQuMTcuMi9saWIvZGVmaW5lcy5oCi09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0t
LS0gc2hhZG93LTQuMTcuMi5vcmlnL2xpYi9kZWZpbmVzLmgKLSsrKyBzaGFkb3ctNC4xNy4yL2xp
Yi9kZWZpbmVzLmgKLUBAIC04OCw3ICs4OCw5IEBACitkaWZmIC0tZ2l0IGEvbGliL2RlZmluZXMu
aCBiL2xpYi9kZWZpbmVzLmgKK2luZGV4IDA5YzA5NjUuLjVjNzBmMzIgMTAwNjQ0CistLS0gYS9s
aWIvZGVmaW5lcy5oCisrKysgYi9saWIvZGVmaW5lcy5oCitAQCAtNzUsNyArNzUsOSBAQAogIAog
IC8qIGNsZWFuZXIgdGhhbiBsb3RzIG9mICNpZmRlZnMgZXZlcnl3aGVyZSAtIHVzZSB0aGlzIGFz
IGZvbGxvd3M6CiAgICAgU1lTTE9HKChMT0dfQ1JJVCwgInVzZXIgJXMgY3JhY2tlZCByb290Iiwg
dXNlcikpOyAqLwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxl
cy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3No
YWRvdy9maWxlcy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoCmluZGV4IDMxOGUyNjY1YzIu
LmMxOWJiYWJjOTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmls
ZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc2hhZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGViMTdjZDkxZDhlNGQ3NmVlOTVkZTljMGM5ZjQ5MzhiYTJlM2U4MmEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGVjOTI4Y2JjNGExM2EyNmZkYTZkNDU3ODU2MGM5NWUy
ZWZlODI3OTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYW5nIEthaSA8a2FpLmth
bmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjAgSnVsIDIwMTEgMTk6MTg6MTQgKzA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gc2hhZG93OiB1cGRhdGUgcGFtIHJlbGF0ZWQgY29uZmlndXJlIGZp
bGVzCkBAIC0xMDUsNiArMTA1LDMgQEAgaW5kZXggOGY0OWY1Yy4uYjFmMzY1ZCAxMDA2NDQKICBh
Y2NvdW50CQlyZXF1aXJlZAlwYW1fcGVybWl0LnNvCiAtcGFzc3dvcmQJaW5jbHVkZQkJc3lzdGVt
LWF1dGgKICtwYXNzd29yZAlpbmNsdWRlCQljb21tb24tcGFzc3dvcmQKLS0tIAotMi40My4wCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTguMC5i
YiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTkuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3No
YWRvd180LjE4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hh
ZG93XzQuMTkuMC5iYgppbmRleCBkOWE0OWQ4Y2NmLi42MjFmZGZiNTNiIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE4LjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4xOS4wLmJiCkBAIC0xNCw2ICsxNCw5IEBA
IEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vc2hhZG93LW1haW50L3NoYWRv
dy9yZWxlYXNlcyIKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9
LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdF
Q09ORklHJywgJ3BhbScsICcke1BBTV9TUkNfVVJJfScsICcnLCBkKX0gXAogICAgICAgICAgICBm
aWxlOi8vdXNlcmFkZCBcCisgICAgICAgICAgIGZpbGU6Ly9sb2dpbl9kZWZzX3BhbS5zZWQgXAor
ICAgICAgICAgICBmaWxlOi8vY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUt
aW4tY2hyb290LWVudi5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9kaXNhYmxlX3N5c2xvZy5w
YXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBc
CkBAIC0yNSw3ICsyOCw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgXAogICAg
ICAgICAgICBmaWxlOi8vY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4t
Y2hyb290LWVudi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9kaXNhYmxlX3N5c2xvZy5wYXRj
aCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhZTQ4NmNlNGMwYmNlNTVj
NDJkNzZkODQ3OGU0MjhjNDE1ODZmMWRhMmY4OWZiZjUyMjgyNDNmYjRkODQ5ZGI0IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjY4NGRhMTYxMmY0NmIyYzJkYTZhNGYyMjBhODAxYmNkNWUyOGUwNzE1
YTYyMGQ2NjNjMzkzZGY1YjRjNDMzM2YiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNl
cy90YWcvdj8oP1A8cHZlcj5cZCsoXC5cZCspKykkIgogCiAjIEFkZGl0aW9uYWwgUG9saWN5IGZp
bGVzIGZvciBQQU0KLS0gCjIuNDcuMQoK

--===============9042050748373668347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-c980a0a873d9f458d98d8e9aabd9044e0b159a9a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:c980a0a873d9f458d98d8e9aabd9044e0b159a9a"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 232 Local 203 Mirrors 0 Missed 29 Current 626 (87% match, 96% complete)
done.
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 9 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 782 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_package_setscene)
NOTE: Running setscene task 795 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package_setscene)
NOTE: Running setscene task 812 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 831 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 840 of 858 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-native-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_package_setscene: Started
NOTE: Running task 1582 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_fetch)
NOTE: Running task 1705 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_fetch)
NOTE: recipe shadow-4.19.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1891 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_unpack)
NOTE: recipe shadow-native-4.19.0-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 2048 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_unpack)
NOTE: Running task 2049 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.19.0-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 2264 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_patch)
NOTE: recipe shadow-4.19.0-r0: task do_patch: Started
NOTE: recipe shadow-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 2265 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2266 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_populate_lic)
NOTE: recipe shadow-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.19.0-r0: task do_populate_lic: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 2267 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_patch)
NOTE: recipe shadow-native-4.19.0-r0: task do_patch: Started
NOTE: recipe shadow-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.19.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_deploy_source_date_epoch unihash changed to ca8e6bca1f5b5e46bdd010fd649c9c31e14dc5376fded553f95aa4fbc229eb38
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_populate_lic unihash changed to 11c028270de1265099cf37bd455125973fb9b12ad1f9cb50b5f7e9b37836f13f
NOTE: recipe libpam-1.7.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 2305 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2335 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2336 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_configure)
NOTE: recipe shadow-4.19.0-r0: task do_configure: Started
NOTE: recipe util-linux-2.41.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-native-4.19.0-r0: task do_patch: Failed
NOTE: recipe shadow-4.19.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2385 tasks of which 2373 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260115223647.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260115223647.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.0/temp/log.do_patch.1977247
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-native-4.19.0-r0 do_patch: Applying patch 'commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.0/sources/shadow-4.19.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.0/temp/log.do_patch.1977247
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_patch) failed with exit code '1'

--===============9042050748373668347==--

