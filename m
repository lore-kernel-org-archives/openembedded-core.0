Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD679C3ABA9
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:06 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20181.1744723983075023318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aiNhv58m;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=k5RQiQQk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019639a7434e-9afd60c8-2777-482b-86f8-67943da74447-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723985;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=swRPbe4jg5gxs+a2zgAb2w2LjxtOQHYxisLcai9kbtM=;
	b=aiNhv58mdVIrwHg2xUeChXvKV3OQGWkl9tov2CZebGqZjt8PRu6kuNl78D9jLGR6
	tnN1CI4SJecWb+waPjhYGux0hytVF3u6qQluBF7lIzcbVAGrSaq4h+Psq2RaoaGR9k+
	uO+L3tTDupfVqHnwQvdGmp4JbAGAlmP/lGanmo08=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723985;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=swRPbe4jg5gxs+a2zgAb2w2LjxtOQHYxisLcai9kbtM=;
	b=k5RQiQQkNzLeQNzBIhFb+UA5JsF5Vxcis8tSM7rQqqPMgYJqNDhhEIXMymHuUu9L
	0yQvBrn1pixKC45+O13qsp7QMTvgDgW8OFbSjfN4KBYm+C5KcM4GUyTAEFtqWZ/Y+2K
	UPD5H2WSk7Nh37FZdN5USF9aqQB1tPqTIL8aveo0=
Content-Type: multipart/mixed; boundary="===============3170947526998434138=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.17.4 FAILED
Message-ID: <0101019639a7434e-9afd60c8-2777-482b-86f8-67943da74447-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214908

--===============3170947526998434138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.17.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.17.3-4.17.4.patch
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
From 9402a9c7c774ff20cc3a234b26421b541c8f153c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 09:01:28 +0000
Subject: [PATCH] shadow: upgrade 4.17.3 -> 4.17.4

---
 ...unexpected-open-failure-in-chroot-env.patch |  6 +++---
 .../shadow/files/disable_syslog.patch          | 18 +++++++++++++-----
 .../shadow/files/shadow-update-pam-conf.patch  |  5 +----
 .../{shadow_4.17.3.bb => shadow_4.17.4.bb}     |  5 ++++-
 4 files changed, 21 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.17.3.bb => shadow_4.17.4.bb} (97%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 699269ed64..e365310995 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f7b765c022e4cad9140ac44712885c66e149abdc Mon Sep 17 00:00:00 2001
+From f91da762ff2dd393ea93f067c9efb1f5d10c6fda Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 4d83e83..9ee0e13 100644
+index fc8ad7a..86fc0e5 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -604,10 +604,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -595,10 +595,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta/recipes-extended/shadow/files/disable_syslog.patch
index 7299a8e61c..a8020239fa 100644
--- a/meta/recipes-extended/shadow/files/disable_syslog.patch
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -1,15 +1,23 @@
+From 129fb1682561c9adf33676586b31793d64878046 Mon Sep 17 00:00:00 2001
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
+index 89300c9..88b190b 100644
+--- a/lib/defines.h
++++ b/lib/defines.h
+@@ -83,7 +83,9 @@
  
  /* cleaner than lots of #ifdefs everywhere - use this as follows:
     SYSLOG((LOG_CRIT, "user %s cracked root", user)); */
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 318e2665c2..4eafb38973 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From eb17cd91d8e4d76ee95de9c0c9f4938ba2e3e82a Mon Sep 17 00:00:00 2001
+From fc4d28bab82669c146951b727e6477d83c682637 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-extended/shadow/shadow_4.17.3.bb b/meta/recipes-extended/shadow/shadow_4.17.4.bb
similarity index 97%
rename from meta/recipes-extended/shadow/shadow_4.17.3.bb
rename to meta/recipes-extended/shadow/shadow_4.17.4.bb
index 3d07aec3d6..2ef73a0192 100644
--- a/meta/recipes-extended/shadow/shadow_4.17.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.17.4.bb
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
-SRC_URI[sha256sum] = "2a029091d2c2f116f51b3a817ec16e7da22310a6c8116394457483c668c84b36"
+SRC_URI[sha256sum] = "0a288c251f339846af6bdfd4447b196153204deba42407bce5b0917998322e9b"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.47.1


--===============3170947526998434138==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.17.3-4.17.4.patch"

RnJvbSA5NDAyYTljN2M3NzRmZjIwY2MzYTIzNGIyNjQyMWI1NDFjOGYxNTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDk6MDE6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkb3c6IHVwZ3JhZGUgNC4xNy4zIC0+IDQuMTcuNAoKLS0tCiAuLi51bmV4cGVjdGVkLW9wZW4t
ZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIHwgIDYgKysrLS0tCiAuLi4vc2hhZG93L2ZpbGVz
L2Rpc2FibGVfc3lzbG9nLnBhdGNoICAgICAgICAgIHwgMTggKysrKysrKysrKysrKy0tLS0tCiAu
Li4vc2hhZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2ggIHwgIDUgKy0tLS0K
IC4uLi97c2hhZG93XzQuMTcuMy5iYiA9PiBzaGFkb3dfNC4xNy40LmJifSAgICAgfCAgNSArKysr
LQogNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3tzaGFkb3dfNC4xNy4zLmJiID0+IHNo
YWRvd180LjE3LjQuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1j
aHJvb3QtZW52LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9jb21t
b25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoCmlu
ZGV4IDY5OTI2OWVkNjQuLmUzNjUzMTA5OTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUt
aW4tY2hyb290LWVudi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2Zp
bGVzL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY3Yjc2NWMwMjJlNGNhZDkxNDBhYzQ0NzEyODg1
YzY2ZTE0OWFiZGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY5MWRhNzYyZmYyZGQz
OTNlYTkzZjA2N2M5ZWZiMWY1ZDEwYzZmZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDE3IEp1bCAyMDE0
IDE1OjUzOjM0ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbW1vbmlvLmMtZml4LXVuZXhwZWN0
ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYKQEAgLTIwLDEwICsyMCwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvY29t
bW9uaW8uYyBiL2xpYi9jb21tb25pby5jCi1pbmRleCA0ZDgzZTgzLi45ZWUwZTEzIDEwMDY0NAor
aW5kZXggZmM4YWQ3YS4uODZmYzBlNSAxMDA2NDQKIC0tLSBhL2xpYi9jb21tb25pby5jCiArKysg
Yi9saWIvY29tbW9uaW8uYwotQEAgLTYwNCwxMCArNjA0LDE4IEBAIGludCBjb21tb25pb19vcGVu
IChzdHJ1Y3QgY29tbW9uaW9fZGIgKmRiLCBpbnQgbW9kZSkKK0BAIC01OTUsMTAgKzU5NSwxOCBA
QCBpbnQgY29tbW9uaW9fb3BlbiAoc3RydWN0IGNvbW1vbmlvX2RiICpkYiwgaW50IG1vZGUpCiAg
CWRiLT5jdXJzb3IgPSBOVUxMOwogIAlkYi0+Y2hhbmdlZCA9IGZhbHNlOwogIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9kaXNhYmxlX3N5c2xvZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvZGlzYWJsZV9zeXNsb2cucGF0
Y2gKaW5kZXggNzI5OWE4ZTYxYy4uYTgwMjAyMzlmYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3NoYWRvdy9maWxlcy9kaXNhYmxlX3N5c2xvZy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2Rpc2FibGVfc3lzbG9nLnBhdGNoCkBAIC0xLDE1
ICsxLDIzIEBACitGcm9tIDEyOWZiMTY4MjU2MWM5YWRmMzM2NzY1ODZiMzE3OTNkNjQ4NzgwNDYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6IEZyaSwgMjggRmViIDIwMjUgMTA6MDk6
NTYgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gc2hhZG93LW5hdGl2ZTogRGlzYWJsZSBzeXNsb2cg
dXNhZ2UKKwogV2hlbiBidWlsZGluZyBpbWFnZXMgdXNpbmcgc2hhZG93LW5hdGl2ZSwgd2Ugc2hv
dWxkbid0IGJlIHNwYW1taW5nIHRoZSBob3N0J3MKIGxvZyB3aXRoIGxvdHMgb2Ygc3lzbG9nIG1l
c3NhZ2VzIHdoaWNoIGFyZW4ndCByZWxhdmVudC4gRGlzYWJsZSBzeXNsb2cgdXNlCiBpbiB0aGUg
bmF0aXZlIGNhc2UuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbV291bGQgdXBz
dHJlYW0gYWNjZXB0IGEgY29uZmlndXJlIG9wdGlvbj9dCiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KKy0tLQorIGxpYi9k
ZWZpbmVzLmggfCA0ICsrKy0KKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCiAKLUluZGV4OiBzaGFkb3ctNC4xNy4yL2xpYi9kZWZpbmVzLmgKLT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KLS0tLSBzaGFkb3ctNC4xNy4yLm9yaWcvbGliL2RlZmluZXMuaAotKysrIHNoYWRvdy00LjE3
LjIvbGliL2RlZmluZXMuaAotQEAgLTg4LDcgKzg4LDkgQEAKK2RpZmYgLS1naXQgYS9saWIvZGVm
aW5lcy5oIGIvbGliL2RlZmluZXMuaAoraW5kZXggODkzMDBjOS4uODhiMTkwYiAxMDA2NDQKKy0t
LSBhL2xpYi9kZWZpbmVzLmgKKysrKyBiL2xpYi9kZWZpbmVzLmgKK0BAIC04Myw3ICs4Myw5IEBA
CiAgCiAgLyogY2xlYW5lciB0aGFuIGxvdHMgb2YgI2lmZGVmcyBldmVyeXdoZXJlIC0gdXNlIHRo
aXMgYXMgZm9sbG93czoKICAgICBTWVNMT0coKExPR19DUklULCAidXNlciAlcyBjcmFja2VkIHJv
b3QiLCB1c2VyKSk7ICovCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93
L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc2hhZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2gKaW5kZXggMzE4ZTI2
NjVjMi4uNGVhZmIzODk3MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRv
dy9maWxlcy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gZWIxN2NkOTFkOGU0ZDc2ZWU5NWRlOWMwYzlmNDkzOGJhMmUzZTgyYSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmM0ZDI4YmFiODI2NjljMTQ2OTUxYjcyN2U2
NDc3ZDgzYzY4MjYzNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEthbmcgS2FpIDxr
YWkua2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyMCBKdWwgMjAxMSAxOToxODoxNCAr
MDgwMAogU3ViamVjdDogW1BBVENIXSBzaGFkb3c6IHVwZGF0ZSBwYW0gcmVsYXRlZCBjb25maWd1
cmUgZmlsZXMKQEAgLTEwNSw2ICsxMDUsMyBAQCBpbmRleCA4ZjQ5ZjVjLi5iMWYzNjVkIDEwMDY0
NAogIGFjY291bnQJCXJlcXVpcmVkCXBhbV9wZXJtaXQuc28KIC1wYXNzd29yZAlpbmNsdWRlCQlz
eXN0ZW0tYXV0aAogK3Bhc3N3b3JkCWluY2x1ZGUJCWNvbW1vbi1wYXNzd29yZAotLS0gCi0yLjQz
LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4x
Ny4zLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4xNy40LmJiCnNp
bWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFk
b3cvc2hhZG93XzQuMTcuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRv
dy9zaGFkb3dfNC4xNy40LmJiCmluZGV4IDNkMDdhZWMzZDYuLjJlZjczYTAxOTIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTcuMy5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE3LjQuYmIKQEAgLTE0LDYgKzE0
LDkgQEAgR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9zaGFkb3ctbWFpbnQv
c2hhZG93L3JlbGVhc2VzIgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
JHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BB
Q0tBR0VDT05GSUcnLCAncGFtJywgJyR7UEFNX1NSQ19VUkl9JywgJycsIGQpfSBcCiAgICAgICAg
ICAgIGZpbGU6Ly91c2VyYWRkIFwKKyAgICAgICAgICAgZmlsZTovL2xvZ2luX2RlZnNfcGFtLnNl
ZCBcCisgICAgICAgICAgIGZpbGU6Ly9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFp
bHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL2Rpc2FibGVfc3lz
bG9nLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQg
PSAiIFwKQEAgLTI1LDcgKzI4LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBc
CiAgICAgICAgICAgIGZpbGU6Ly9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVy
ZS1pbi1jaHJvb3QtZW52LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc2FibGVfc3lzbG9n
LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJhMDI5MDkxZDJj
MmYxMTZmNTFiM2E4MTdlYzE2ZTdkYTIyMzEwYTZjODExNjM5NDQ1NzQ4M2M2NjhjODRiMzYiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMGEyODhjMjUxZjMzOTg0NmFmNmJkZmQ0NDQ3YjE5NjE1MzIw
NGRlYmE0MjQwN2JjZTViMDkxNzk5ODMyMmU5YiIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJl
bGVhc2VzL3RhZy92Pyg/UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAKICMgQWRkaXRpb25hbCBQb2xp
Y3kgZmlsZXMgZm9yIFBBTQotLSAKMi40Ny4xCgo=

--===============3170947526998434138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1899 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (927 cached, 1 parsed). 1897 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e838861f693f022bfa430088082cdd1583e61e02"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 462 Local 431 Mirrors 0 Missed 31 Current 405 (93% match, 96% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 8 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 577 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package_setscene)
NOTE: Running setscene task 589 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package_setscene)
NOTE: Running setscene task 615 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 620 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 628 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 639 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 655 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 684 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 693 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 696 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 707 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 709 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 713 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 719 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 724 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 725 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 731 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 735 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 752 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 755 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 762 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 767 of 867 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 775 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 779 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gperf-native-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 793 of 867 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1174 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_recipe_qa)
NOTE: Running task 1237 of 2463 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_recipe_qa)
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa: Started
NOTE: Running task 1324 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_fetch)
NOTE: Running task 1335 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-native-4.17.4-r0: task do_recipe_qa: Started
NOTE: Running setscene task 811 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_recipe_qa unihash changed to 7886640c4dcd8f972169493c32f4eca029149dc52b147ada00cdf8b12f3b63a3
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-native-4.17.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1371 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_fetch)
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_recipe_qa unihash changed to 5e6c5257d0f50fa419f82278108e3b337f6b3af11cb4757e721f635211043adc
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_fetch: Started
NOTE: recipe systemd-1_257.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 809 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 819 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 820 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 822 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 824 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1380 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_unpack)
NOTE: Running task 1381 of 2463 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_fetch)
NOTE: Running task 1382 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_unpack)
NOTE: Running task 1383 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1416 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.17.4-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-native-4.17.4-r0: task do_fetch: Started
NOTE: recipe systemd-1_257.5-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 836 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running task 1470 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_warn_musl)
NOTE: Running task 1471 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_write_config)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_257.5-r0: task do_write_config: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_warn_musl: Succeeded
NOTE: Running task 1531 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: recipe systemd-1_257.5-r0: task do_write_config: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1532 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe shadow-native-4.17.4-r0: task do_fetch: Succeeded
NOTE: Running task 1534 of 2463 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_unpack)
NOTE: Running task 1535 of 2463 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-native-4.17.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-native-4.17.4-r0: task do_unpack: Started
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1536 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: recipe shadow-4.17.4-r0: task do_unpack: Succeeded
NOTE: Running task 1537 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_patch)
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: recipe shadow-native-4.17.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_patch: Started
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_unpack: Succeeded
NOTE: Running task 1539 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_package_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 837 of 867 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1565 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1573 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_populate_lic)
NOTE: recipe systemd-1_257.5-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.17.4-r0: task do_populate_lic: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-native-4.17.4-r0: task do_unpack: Succeeded
NOTE: Running task 1578 of 2463 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_patch)
NOTE: recipe meson-native-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_populate_lic unihash changed to adaaaec1461402b6a8e207fc3318dd56986cc700b1f49bdf6ed74c5a9a502685
NOTE: recipe shadow-4.17.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_deploy_source_date_epoch unihash changed to 7e5c72e95e81e2d9b0101c7a2016216dc911112ec2ff8bc56caab49632ad0180
NOTE: recipe shadow-native-4.17.4-r0: task do_patch: Started
NOTE: recipe systemd-1_257.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 840 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 846 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 852 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 854 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 867 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2103 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.17.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2392 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.17.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.17.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2419 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_configure)
NOTE: recipe shadow-4.17.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_configure: Started
NOTE: recipe shadow-native-4.17.4-r0: task do_patch: Failed
NOTE: recipe shadow-4.17.4-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2419 tasks of which 2394 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415090103.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415090103.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.17.4/temp/log.do_patch.527433
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-native-4.17.4-r0 do_patch: Applying patch 'commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.17.4/shadow-4.17.4'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.17.4/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.17.4/temp/log.do_patch.527433
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_patch) failed with exit code '1'

--===============3170947526998434138==--

