Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23A9E65272
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29195.1769951570620232642
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0/QztY+Y;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NnGOdQnu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1955be97-9e873987-58ff-4280-a58a-de73e44a9168-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ReuiFT69FpRjb3gAN3sVQTHr+J6YcU6o0iL0ufCCPN0=;
	b=0/QztY+YLPfoM42FohV75MMjQQvFQQhORhsrJOdXPkXlTd2SvdvZ7BjHJPcWUreb
	qOKcdU1s7bimAeiBjdM7VxbYXUJowaZHpY94VH+14PpBfHT2CncCxjcsgN3fcec2eKX
	A3w7jQiFw8wTeRKB9H1K0+I3leYairWvqsXP5ogM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ReuiFT69FpRjb3gAN3sVQTHr+J6YcU6o0iL0ufCCPN0=;
	b=NnGOdQnuQ7mhkFC9rlpE0s6Jeug33b4ffaA/m58np0PttqJDcZLxC6uc9oUOWq7+
	y9lkplqxiQFMvICqV02l2fzIVy8QY6JA735UGbCxN4vP8Poveazeqox2lHAsI2LWfVy
	d/H+LkpODCTTHhlxs+UPUh0wEMk9LDjQyNGSdZVo=
Content-Type: multipart/mixed; boundary="===============1431794719928840306=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.19.2 FAILED
Message-ID: <0101019c1955be97-9e873987-58ff-4280-a58a-de73e44a9168-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230304

--===============1431794719928840306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.19.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.18.0-4.19.2.patch
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
From 20d47f7c74c802a1cfae8e035d2a2ddf6d78651e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 10:23:04 +0000
Subject: [PATCH] shadow: upgrade 4.18.0 -> 4.19.2

---
 ...unexpected-open-failure-in-chroot-env.patch |  6 +++---
 .../shadow/files/disable_syslog.patch          | 18 +++++++++++++-----
 .../shadow/files/shadow-update-pam-conf.patch  |  5 +----
 .../{shadow_4.18.0.bb => shadow_4.19.2.bb}     |  5 ++++-
 4 files changed, 21 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.18.0.bb => shadow_4.19.2.bb} (97%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 699269ed64..3278aa162d 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f7b765c022e4cad9140ac44712885c66e149abdc Mon Sep 17 00:00:00 2001
+From e50cad7da7908577b840972f802debe95e9288c1 Mon Sep 17 00:00:00 2001
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
index 7299a8e61c..5ac23ec1b6 100644
--- a/meta/recipes-extended/shadow/files/disable_syslog.patch
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -1,15 +1,23 @@
+From 7fdb2c73c1d31e94d18677d47f4db014527e7ac6 Mon Sep 17 00:00:00 2001
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
index 318e2665c2..c44ad46ecf 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From eb17cd91d8e4d76ee95de9c0c9f4938ba2e3e82a Mon Sep 17 00:00:00 2001
+From aa11c72c1cf35e641578bc388c8fd5464a02f302 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes-extended/shadow/shadow_4.19.2.bb
similarity index 97%
rename from meta/recipes-extended/shadow/shadow_4.18.0.bb
rename to meta/recipes-extended/shadow/shadow_4.19.2.bb
index d9a49d8ccf..f311272de3 100644
--- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.2.bb
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
+SRC_URI[sha256sum] = "6ba95207c979e7aae7ba695f8ba437d95db706d3f7650f09f6ceca527af836be"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.47.1


--===============1431794719928840306==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.18.0-4.19.2.patch"

RnJvbSAyMGQ0N2Y3Yzc0YzgwMmExY2ZhZThlMDM1ZDJhMmRkZjZkNzg2NTFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMDoyMzowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRvdzogdXBncmFkZSA0LjE4LjAgLT4gNC4xOS4yCgotLS0KIC4uLnVuZXhwZWN0ZWQtb3Blbi1m
YWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2ggfCAgNiArKystLS0KIC4uLi9zaGFkb3cvZmlsZXMv
ZGlzYWJsZV9zeXNsb2cucGF0Y2ggICAgICAgICAgfCAxOCArKysrKysrKysrKysrLS0tLS0KIC4u
Li9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaCAgfCAgNSArLS0tLQog
Li4uL3tzaGFkb3dfNC4xOC4wLmJiID0+IHNoYWRvd180LjE5LjIuYmJ9ICAgICB8ICA1ICsrKyst
CiA0IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cve3NoYWRvd180LjE4LjAuYmIgPT4gc2hh
ZG93XzQuMTkuMi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c2hhZG93L2ZpbGVzL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNo
cm9vdC1lbnYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2NvbW1v
bmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2gKaW5k
ZXggNjk5MjY5ZWQ2NC4uMzI3OGFhMTYyZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1p
bi1jaHJvb3QtZW52LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmls
ZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjdiNzY1YzAyMmU0Y2FkOTE0MGFjNDQ3MTI4ODVj
NjZlMTQ5YWJkYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTUwY2FkN2RhNzkwODU3
N2I4NDA5NzJmODAyZGViZTk1ZTkyODhjMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTcgSnVsIDIwMTQg
MTU6NTM6MzQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29tbW9uaW8uYy1maXgtdW5leHBlY3Rl
ZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudgpAQCAtMjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2xpYi9jb21t
b25pby5jIGIvbGliL2NvbW1vbmlvLmMKLWluZGV4IDRkODNlODMuLjllZTBlMTMgMTAwNjQ0Citp
bmRleCAyYzZhMWEyLi4wMWUyZmM3IDEwMDY0NAogLS0tIGEvbGliL2NvbW1vbmlvLmMKICsrKyBi
L2xpYi9jb21tb25pby5jCi1AQCAtNjA0LDEwICs2MDQsMTggQEAgaW50IGNvbW1vbmlvX29wZW4g
KHN0cnVjdCBjb21tb25pb19kYiAqZGIsIGludCBtb2RlKQorQEAgLTU5OCwxMCArNTk4LDE4IEBA
IGNvbW1vbmlvX29wZW4oc3RydWN0IGNvbW1vbmlvX2RiICpkYiwgaW50IG1vZGUpCiAgCWRiLT5j
dXJzb3IgPSBOVUxMOwogIAlkYi0+Y2hhbmdlZCA9IGZhbHNlOwogIApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9kaXNhYmxlX3N5c2xvZy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvZGlzYWJsZV9zeXNsb2cucGF0Y2gKaW5k
ZXggNzI5OWE4ZTYxYy4uNWFjMjNlYzFiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3NoYWRvdy9maWxlcy9kaXNhYmxlX3N5c2xvZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2Rpc2FibGVfc3lzbG9nLnBhdGNoCkBAIC0xLDE1ICsxLDIz
IEBACitGcm9tIDdmZGIyYzczYzFkMzFlOTRkMTg2NzdkNDdmNGRiMDE0NTI3ZTdhYzYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6IEZyaSwgMjggRmViIDIwMjUgMTA6MDk6NTYgKzAw
MDAKK1N1YmplY3Q6IFtQQVRDSF0gc2hhZG93LW5hdGl2ZTogRGlzYWJsZSBzeXNsb2cgdXNhZ2UK
KwogV2hlbiBidWlsZGluZyBpbWFnZXMgdXNpbmcgc2hhZG93LW5hdGl2ZSwgd2Ugc2hvdWxkbid0
IGJlIHNwYW1taW5nIHRoZSBob3N0J3MKIGxvZyB3aXRoIGxvdHMgb2Ygc3lzbG9nIG1lc3NhZ2Vz
IHdoaWNoIGFyZW4ndCByZWxhdmVudC4gRGlzYWJsZSBzeXNsb2cgdXNlCiBpbiB0aGUgbmF0aXZl
IGNhc2UuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbV291bGQgdXBzdHJlYW0g
YWNjZXB0IGEgY29uZmlndXJlIG9wdGlvbj9dCiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KKy0tLQorIGxpYi9kZWZpbmVz
LmggfCA0ICsrKy0KKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCiAKLUluZGV4OiBzaGFkb3ctNC4xNy4yL2xpYi9kZWZpbmVzLmgKLT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0t
LSBzaGFkb3ctNC4xNy4yLm9yaWcvbGliL2RlZmluZXMuaAotKysrIHNoYWRvdy00LjE3LjIvbGli
L2RlZmluZXMuaAotQEAgLTg4LDcgKzg4LDkgQEAKK2RpZmYgLS1naXQgYS9saWIvZGVmaW5lcy5o
IGIvbGliL2RlZmluZXMuaAoraW5kZXggMDljMDk2NS4uNWM3MGYzMiAxMDA2NDQKKy0tLSBhL2xp
Yi9kZWZpbmVzLmgKKysrKyBiL2xpYi9kZWZpbmVzLmgKK0BAIC03NSw3ICs3NSw5IEBACiAgCiAg
LyogY2xlYW5lciB0aGFuIGxvdHMgb2YgI2lmZGVmcyBldmVyeXdoZXJlIC0gdXNlIHRoaXMgYXMg
Zm9sbG93czoKICAgICBTWVNMT0coKExPR19DUklULCAidXNlciAlcyBjcmFja2VkIHJvb3QiLCB1
c2VyKSk7ICovCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVz
L3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hh
ZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2gKaW5kZXggMzE4ZTI2NjVjMi4u
YzQ0YWQ0NmVjZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxl
cy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZWIxN2NkOTFkOGU0ZDc2ZWU5NWRlOWMwYzlmNDkzOGJhMmUzZTgyYSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWExMWM3MmMxY2YzNWU2NDE1NzhiYzM4OGM4ZmQ1NDY0
YTAyZjMwMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEthbmcgS2FpIDxrYWkua2Fu
Z0B3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyMCBKdWwgMjAxMSAxOToxODoxNCArMDgwMAog
U3ViamVjdDogW1BBVENIXSBzaGFkb3c6IHVwZGF0ZSBwYW0gcmVsYXRlZCBjb25maWd1cmUgZmls
ZXMKQEAgLTEwNSw2ICsxMDUsMyBAQCBpbmRleCA4ZjQ5ZjVjLi5iMWYzNjVkIDEwMDY0NAogIGFj
Y291bnQJCXJlcXVpcmVkCXBhbV9wZXJtaXQuc28KIC1wYXNzd29yZAlpbmNsdWRlCQlzeXN0ZW0t
YXV0aAogK3Bhc3N3b3JkCWluY2x1ZGUJCWNvbW1vbi1wYXNzd29yZAotLS0gCi0yLjQzLjAKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4xOC4wLmJi
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4xOS4yLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hh
ZG93XzQuMTguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFk
b3dfNC4xOS4yLmJiCmluZGV4IGQ5YTQ5ZDhjY2YuLmYzMTEyNzJkZTMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTguMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE5LjIuYmIKQEAgLTE0LDYgKzE0LDkgQEAg
R0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9zaGFkb3ctbWFpbnQvc2hhZG93
L3JlbGVhc2VzIgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0v
JHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VD
T05GSUcnLCAncGFtJywgJyR7UEFNX1NSQ19VUkl9JywgJycsIGQpfSBcCiAgICAgICAgICAgIGZp
bGU6Ly91c2VyYWRkIFwKKyAgICAgICAgICAgZmlsZTovL2xvZ2luX2RlZnNfcGFtLnNlZCBcCisg
ICAgICAgICAgIGZpbGU6Ly9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1p
bi1jaHJvb3QtZW52LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL2Rpc2FibGVfc3lzbG9nLnBh
dGNoIFwKICAgICAgICAgICAgIgogCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiIFwK
QEAgLTI1LDcgKzI4LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBcCiAgICAg
ICAgICAgIGZpbGU6Ly9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1j
aHJvb3QtZW52LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc2FibGVfc3lzbG9nLnBhdGNo
IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFlNDg2Y2U0YzBiY2U1NWM0
MmQ3NmQ4NDc4ZTQyOGM0MTU4NmYxZGEyZjg5ZmJmNTIyODI0M2ZiNGQ4NDlkYjQiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNmJhOTUyMDdjOTc5ZTdhYWU3YmE2OTVmOGJhNDM3ZDk1ZGI3MDZkM2Y3
NjUwZjA5ZjZjZWNhNTI3YWY4MzZiZSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2Vz
L3RhZy92Pyg/UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAKICMgQWRkaXRpb25hbCBQb2xpY3kgZmls
ZXMgZm9yIFBBTQotLSAKMi40Ny4xCgo=

--===============1431794719928840306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.3.99+snapshot-d2ce655ec8f92c8c79c330542bfcc1a02d5db1eb"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:d2ce655ec8f92c8c79c330542bfcc1a02d5db1eb"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 210 Local 180 Mirrors 0 Missed 30 Current 648 (85% match, 96% complete)
done.
Removing 9 stale sstate objects for arch x86-64-v3...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 792 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package_setscene)
NOTE: Running setscene task 814 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_package_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_package_setscene: Started
NOTE: Running task 1581 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_recipe_qa)
NOTE: Running task 1703 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_recipe_qa)
NOTE: recipe shadow-4.19.2-r0: task do_recipe_qa: Started
NOTE: recipe shadow-native-4.19.2-r0: task do_recipe_qa: Started
NOTE: recipe shadow-4.19.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2259 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_fetch)
NOTE: recipe shadow-native-4.19.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2260 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_fetch)
NOTE: recipe shadow-4.19.2-r0: task do_fetch: Started
NOTE: recipe shadow-4.19.2-r0: task do_fetch: Succeeded
NOTE: Running task 2261 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_unpack)
NOTE: recipe shadow-native-4.19.2-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.19.2-r0: task do_fetch: Succeeded
NOTE: Running task 2262 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_unpack)
NOTE: Running task 2263 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.19.2-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.19.2-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.19.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-native-4.19.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.19.2-r0: task do_unpack: Succeeded
NOTE: Running task 2264 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_patch)
NOTE: recipe shadow-4.19.2-r0: task do_patch: Started
NOTE: recipe shadow-4.19.2-r0: task do_patch: Succeeded
NOTE: Running task 2265 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2266 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_populate_lic)
NOTE: recipe shadow-4.19.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.19.2-r0: task do_populate_lic: Started
NOTE: recipe shadow-native-4.19.2-r0: task do_unpack: Succeeded
NOTE: Running task 2267 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_patch)
NOTE: recipe shadow-native-4.19.2-r0: task do_patch: Started
NOTE: recipe shadow-4.19.2-r0: task do_populate_lic: Succeeded
NOTE: recipe shadow-4.19.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 858 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2305 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2335 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.19.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.19.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.19.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.19.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2336 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_configure)
NOTE: recipe shadow-4.19.2-r0: task do_configure: Started
NOTE: recipe util-linux-2.41.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-native-4.19.2-r0: task do_patch: Failed
NOTE: recipe shadow-4.19.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2385 tasks of which 2371 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201102242.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201102242.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.2/temp/log.do_patch.2231
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-native-4.19.2-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.2/sources/shadow-4.19.2'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.2/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.2/temp/log.do_patch.2231
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.2.bb:do_patch) failed with exit code '1'

--===============1431794719928840306==--

