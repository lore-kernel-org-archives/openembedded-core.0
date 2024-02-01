Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB821C54790
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2119.1706810407098789642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a55T2f1w;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Lq5Mjt4e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d65d3f672-f79b8d99-d45d-482c-884a-5e90246447e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PiO5harSY9ky74nigazOey/XLNH8RLspKuwymoBarZg=;
	b=a55T2f1wLqrz6pmZpWcNdwrjeBqb3+E5geNuIWTh2ekbnY6H2z3LBccXv7fzvzxB
	dALCi0NhBE8axcDIBr9DGiBvyfA2jpznX2Pd23Kguj46L39FrPYChfCR5WlPTv2/vNy
	0a0MXUC3yHzANpOt3UGAQ2AXDWlqFTGACTBG9QVY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PiO5harSY9ky74nigazOey/XLNH8RLspKuwymoBarZg=;
	b=Lq5Mjt4eng/23DGk07f3EAKkNidk7mhtnck9jl0ennn924ER2RtKUik/Xeu06O9Z
	73erPAJ2I1RbJHMq0c3BP5l64KZt+p40yCuR6kiicYmSgVw3RLym9lPugeOhB11/FtA
	Xxr4qzTPm8XaxCDNl1s5MyT1+eqTBWDPAMqF+vkQ=
Content-Type: multipart/mixed; boundary="===============6467908688009958572=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.14.3 FAILED
Message-ID: <0101018d65d3f672-f79b8d99-d45d-482c-884a-5e90246447e5-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194669

--===============6467908688009958572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.14.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.14.2-4.14.3.patch
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
From 7cbb0bf31ef5643a531733475e5d9acd18e8f8b1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 11:38:14 +0000
Subject: [PATCH] shadow: upgrade 4.14.2 -> 4.14.3

---
 ...nexpected-open-failure-in-chroot-env.patch |  6 +-
 .../shadow/files/shadow-update-pam-conf.patch | 80 ++++++++++++-------
 meta/recipes-extended/shadow/shadow.inc       |  4 +-
 .../{shadow_4.14.2.bb => shadow_4.14.3.bb}    |  0
 4 files changed, 58 insertions(+), 32 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.14.2.bb => shadow_4.14.3.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 4a932d2dbb..97c449dfc8 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From a773c6b240d27e23d6be41decef0edf24fcee523 Mon Sep 17 00:00:00 2001
+From 9c00d5e2256cfab28335ded3bbf11af48e1335dd Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -15,6 +15,7 @@ Note that this patch doesn't change the logic in the code, it just expands
 the codes.
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  lib/commonio.c | 16 ++++++++++++----
  1 file changed, 12 insertions(+), 4 deletions(-)
@@ -46,6 +47,3 @@ index 73fdb3a..d1231e9 100644
  	db->fp = NULL;
  	if (fd >= 0) {
  #ifdef WITH_TCB
--- 
-2.30.2
-
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 3b61b75e5b..feacf76ff2 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,3 +1,8 @@
+From 61c4557ecdc8511f7cdbe1ed338c9857b7988569 Mon Sep 17 00:00:00 2001
+From: Kang Kai <kai.kang@windriver.com>
+Date: Wed, 20 Jul 2011 19:18:14 +0800
+Subject: [PATCH] shadow: update pam related configure files
+
 The system-auth in the configure files is from Fedora which put all the 4 pam type rules
 in one file.
 In yocto it obey the way with Debian/Ubuntu, and the names are common-auth, common-account,
@@ -10,81 +15,102 @@ Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
 
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/chage shadow-4.1.4.3/etc/pam.d/chage
---- shadow-4.1.4.3/etc/pam.d.orig/chage	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/chage	2011-07-20 19:03:08.964844958 +0800
+---
+ etc/pam.d/chage     | 2 +-
+ etc/pam.d/chgpasswd | 2 +-
+ etc/pam.d/groupadd  | 2 +-
+ etc/pam.d/groupdel  | 2 +-
+ etc/pam.d/groupmems | 2 +-
+ etc/pam.d/groupmod  | 2 +-
+ etc/pam.d/useradd   | 2 +-
+ etc/pam.d/userdel   | 2 +-
+ etc/pam.d/usermod   | 2 +-
+ 9 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/etc/pam.d/chage b/etc/pam.d/chage
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/chage
++++ b/etc/pam.d/chage
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/chgpasswd shadow-4.1.4.3/etc/pam.d/chgpasswd
---- shadow-4.1.4.3/etc/pam.d.orig/chgpasswd	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/chgpasswd	2011-07-20 19:03:26.544844958 +0800
+diff --git a/etc/pam.d/chgpasswd b/etc/pam.d/chgpasswd
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/chgpasswd
++++ b/etc/pam.d/chgpasswd
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupadd shadow-4.1.4.3/etc/pam.d/groupadd
---- shadow-4.1.4.3/etc/pam.d.orig/groupadd	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupadd	2011-07-20 19:04:08.124844958 +0800
+diff --git a/etc/pam.d/groupadd b/etc/pam.d/groupadd
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupadd
++++ b/etc/pam.d/groupadd
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupdel shadow-4.1.4.3/etc/pam.d/groupdel
---- shadow-4.1.4.3/etc/pam.d.orig/groupdel	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupdel	2011-07-20 19:04:26.114844958 +0800
+diff --git a/etc/pam.d/groupdel b/etc/pam.d/groupdel
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupdel
++++ b/etc/pam.d/groupdel
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupmems shadow-4.1.4.3/etc/pam.d/groupmems
---- shadow-4.1.4.3/etc/pam.d.orig/groupmems	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupmems	2011-07-20 19:04:35.074844958 +0800
+diff --git a/etc/pam.d/groupmems b/etc/pam.d/groupmems
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupmems
++++ b/etc/pam.d/groupmems
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupmod shadow-4.1.4.3/etc/pam.d/groupmod
---- shadow-4.1.4.3/etc/pam.d.orig/groupmod	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/groupmod	2011-07-20 19:04:44.864844958 +0800
+diff --git a/etc/pam.d/groupmod b/etc/pam.d/groupmod
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/groupmod
++++ b/etc/pam.d/groupmod
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/useradd shadow-4.1.4.3/etc/pam.d/useradd
---- shadow-4.1.4.3/etc/pam.d.orig/useradd	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/useradd	2011-07-20 19:07:26.244844958 +0800
+diff --git a/etc/pam.d/useradd b/etc/pam.d/useradd
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/useradd
++++ b/etc/pam.d/useradd
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/userdel shadow-4.1.4.3/etc/pam.d/userdel
---- shadow-4.1.4.3/etc/pam.d.orig/userdel	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/userdel	2011-07-20 19:07:35.734844958 +0800
+diff --git a/etc/pam.d/userdel b/etc/pam.d/userdel
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/userdel
++++ b/etc/pam.d/userdel
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
-diff -Nur shadow-4.1.4.3/etc/pam.d.orig/usermod shadow-4.1.4.3/etc/pam.d/usermod
---- shadow-4.1.4.3/etc/pam.d.orig/usermod	2011-07-20 19:02:27.384844958 +0800
-+++ shadow-4.1.4.3/etc/pam.d/usermod	2011-07-20 19:07:42.024844958 +0800
+diff --git a/etc/pam.d/usermod b/etc/pam.d/usermod
+index 8f49f5c..b1f365d 100644
+--- a/etc/pam.d/usermod
++++ b/etc/pam.d/usermod
 @@ -1,4 +1,4 @@
  #%PAM-1.0
  auth		sufficient	pam_rootok.so
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index b8e5e285c4..cec5523f03 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -14,6 +14,8 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+           file://login_defs_pam.sed \
+           file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -24,7 +26,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI[sha256sum] = "a305edf5d19bddbdf5e836d2d609fa8bff2d35458819de4d9f06306a1cf24342"
+SRC_URI[sha256sum] = "a12d8394be8840816d10155d5325d1e23278f7ff13da49ad915e044b435359d0"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.14.2.bb b/meta/recipes-extended/shadow/shadow_4.14.3.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.14.2.bb
rename to meta/recipes-extended/shadow/shadow_4.14.3.bb
-- 
2.42.0


--===============6467908688009958572==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.14.2-4.14.3.patch"

RnJvbSA3Y2JiMGJmMzFlZjU2NDNhNTMxNzMzNDc1ZTVkOWFjZDE4ZThmOGIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxMTozODoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRvdzogdXBncmFkZSA0LjE0LjIgLT4gNC4xNC4zCgotLS0KIC4uLm5leHBlY3RlZC1vcGVuLWZh
aWx1cmUtaW4tY2hyb290LWVudi5wYXRjaCB8ICA2ICstCiAuLi4vc2hhZG93L2ZpbGVzL3NoYWRv
dy11cGRhdGUtcGFtLWNvbmYucGF0Y2ggfCA4MCArKysrKysrKysrKystLS0tLS0tCiBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvdy5pbmMgICAgICAgfCAgNCArLQogLi4uL3tzaGFk
b3dfNC4xNC4yLmJiID0+IHNoYWRvd180LjE0LjMuYmJ9ICAgIHwgIDAKIDQgZmlsZXMgY2hhbmdl
ZCwgNTggaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3NoYWRvdy97c2hhZG93XzQuMTQuMi5iYiA9PiBzaGFkb3dfNC4xNC4zLmJifSAo
MTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2Nv
bW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2NvbW1vbmlvLmMtZml4LXVuZXhw
ZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2gKaW5kZXggNGE5MzJkMmRiYi4u
OTdjNDQ5ZGZjOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxl
cy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1m
aXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gYTc3M2M2YjI0MGQyN2UyM2Q2YmU0MWRlY2VmMGVkZjI0ZmNlZTUyMyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWMwMGQ1ZTIyNTZjZmFiMjgzMzVkZWQzYmJmMTFh
ZjQ4ZTEzMzVkZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNo
ZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTcgSnVsIDIwMTQgMTU6NTM6MzQgKzA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUt
aW4tY2hyb290LWVudgpAQCAtMTUsNiArMTUsNyBAQCBOb3RlIHRoYXQgdGhpcyBwYXRjaCBkb2Vz
bid0IGNoYW5nZSB0aGUgbG9naWMgaW4gdGhlIGNvZGUsIGl0IGp1c3QgZXhwYW5kcwogdGhlIGNv
ZGVzLgogCiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CisK
IC0tLQogIGxpYi9jb21tb25pby5jIHwgMTYgKysrKysrKysrKysrLS0tLQogIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQpAQCAtNDYsNiArNDcsMyBAQCBp
bmRleCA3M2ZkYjNhLi5kMTIzMWU5IDEwMDY0NAogIAlkYi0+ZnAgPSBOVUxMOwogIAlpZiAoZmQg
Pj0gMCkgewogICNpZmRlZiBXSVRIX1RDQgotLS0gCi0yLjMwLjIKLQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9zaGFkb3ctdXBkYXRlLXBh
bS1jb25mLnBhdGNoCmluZGV4IDNiNjFiNzVlNWIuLmZlYWNmNzZmZjIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL3NoYWRvdy11cGRh
dGUtcGFtLWNvbmYucGF0Y2gKQEAgLTEsMyArMSw4IEBACitGcm9tIDYxYzQ1NTdlY2RjODUxMWY3
Y2RiZTFlZDMzOGM5ODU3Yjc5ODg1NjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBL
YW5nIEthaSA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4KK0RhdGU6IFdlZCwgMjAgSnVsIDIwMTEg
MTk6MTg6MTQgKzA4MDAKK1N1YmplY3Q6IFtQQVRDSF0gc2hhZG93OiB1cGRhdGUgcGFtIHJlbGF0
ZWQgY29uZmlndXJlIGZpbGVzCisKIFRoZSBzeXN0ZW0tYXV0aCBpbiB0aGUgY29uZmlndXJlIGZp
bGVzIGlzIGZyb20gRmVkb3JhIHdoaWNoIHB1dCBhbGwgdGhlIDQgcGFtIHR5cGUgcnVsZXMKIGlu
IG9uZSBmaWxlLgogSW4geW9jdG8gaXQgb2JleSB0aGUgd2F5IHdpdGggRGViaWFuL1VidW50dSwg
YW5kIHRoZSBuYW1lcyBhcmUgY29tbW9uLWF1dGgsIGNvbW1vbi1hY2NvdW50LApAQCAtMTAsODEg
KzE1LDEwMiBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lm
aWNdCiAKIFNpZ25lZC1vZmYtYnk6IEthbmcgS2FpIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgog
Ci1kaWZmIC1OdXIgc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kLm9yaWcvY2hhZ2Ugc2hhZG93LTQu
MS40LjMvZXRjL3BhbS5kL2NoYWdlCi0tLS0gc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kLm9yaWcv
Y2hhZ2UJMjAxMS0wNy0yMCAxOTowMjoyNy4zODQ4NDQ5NTggKzA4MDAKLSsrKyBzaGFkb3ctNC4x
LjQuMy9ldGMvcGFtLmQvY2hhZ2UJMjAxMS0wNy0yMCAxOTowMzowOC45NjQ4NDQ5NTggKzA4MDAK
Ky0tLQorIGV0Yy9wYW0uZC9jaGFnZSAgICAgfCAyICstCisgZXRjL3BhbS5kL2NoZ3Bhc3N3ZCB8
IDIgKy0KKyBldGMvcGFtLmQvZ3JvdXBhZGQgIHwgMiArLQorIGV0Yy9wYW0uZC9ncm91cGRlbCAg
fCAyICstCisgZXRjL3BhbS5kL2dyb3VwbWVtcyB8IDIgKy0KKyBldGMvcGFtLmQvZ3JvdXBtb2Qg
IHwgMiArLQorIGV0Yy9wYW0uZC91c2VyYWRkICAgfCAyICstCisgZXRjL3BhbS5kL3VzZXJkZWwg
ICB8IDIgKy0KKyBldGMvcGFtLmQvdXNlcm1vZCAgIHwgMiArLQorIDkgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvZXRjL3BhbS5k
L2NoYWdlIGIvZXRjL3BhbS5kL2NoYWdlCitpbmRleCA4ZjQ5ZjVjLi5iMWYzNjVkIDEwMDY0NAor
LS0tIGEvZXRjL3BhbS5kL2NoYWdlCisrKysgYi9ldGMvcGFtLmQvY2hhZ2UKIEBAIC0xLDQgKzEs
NCBAQAogICMlUEFNLTEuMAogIGF1dGgJCXN1ZmZpY2llbnQJcGFtX3Jvb3Rvay5zbwogIGFjY291
bnQJCXJlcXVpcmVkCXBhbV9wZXJtaXQuc28KIC1wYXNzd29yZAlpbmNsdWRlCQlzeXN0ZW0tYXV0
aAogK3Bhc3N3b3JkCWluY2x1ZGUJCWNvbW1vbi1wYXNzd29yZAotZGlmZiAtTnVyIHNoYWRvdy00
LjEuNC4zL2V0Yy9wYW0uZC5vcmlnL2NoZ3Bhc3N3ZCBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQv
Y2hncGFzc3dkCi0tLS0gc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kLm9yaWcvY2hncGFzc3dkCTIw
MTEtMDctMjAgMTk6MDI6MjcuMzg0ODQ0OTU4ICswODAwCi0rKysgc2hhZG93LTQuMS40LjMvZXRj
L3BhbS5kL2NoZ3Bhc3N3ZAkyMDExLTA3LTIwIDE5OjAzOjI2LjU0NDg0NDk1OCArMDgwMAorZGlm
ZiAtLWdpdCBhL2V0Yy9wYW0uZC9jaGdwYXNzd2QgYi9ldGMvcGFtLmQvY2hncGFzc3dkCitpbmRl
eCA4ZjQ5ZjVjLi5iMWYzNjVkIDEwMDY0NAorLS0tIGEvZXRjL3BhbS5kL2NoZ3Bhc3N3ZAorKysr
IGIvZXRjL3BhbS5kL2NoZ3Bhc3N3ZAogQEAgLTEsNCArMSw0IEBACiAgIyVQQU0tMS4wCiAgYXV0
aAkJc3VmZmljaWVudAlwYW1fcm9vdG9rLnNvCiAgYWNjb3VudAkJcmVxdWlyZWQJcGFtX3Blcm1p
dC5zbwogLXBhc3N3b3JkCWluY2x1ZGUJCXN5c3RlbS1hdXRoCiArcGFzc3dvcmQJaW5jbHVkZQkJ
Y29tbW9uLXBhc3N3b3JkCi1kaWZmIC1OdXIgc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kLm9yaWcv
Z3JvdXBhZGQgc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kL2dyb3VwYWRkCi0tLS0gc2hhZG93LTQu
MS40LjMvZXRjL3BhbS5kLm9yaWcvZ3JvdXBhZGQJMjAxMS0wNy0yMCAxOTowMjoyNy4zODQ4NDQ5
NTggKzA4MDAKLSsrKyBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQvZ3JvdXBhZGQJMjAxMS0wNy0y
MCAxOTowNDowOC4xMjQ4NDQ5NTggKzA4MDAKK2RpZmYgLS1naXQgYS9ldGMvcGFtLmQvZ3JvdXBh
ZGQgYi9ldGMvcGFtLmQvZ3JvdXBhZGQKK2luZGV4IDhmNDlmNWMuLmIxZjM2NWQgMTAwNjQ0Cist
LS0gYS9ldGMvcGFtLmQvZ3JvdXBhZGQKKysrKyBiL2V0Yy9wYW0uZC9ncm91cGFkZAogQEAgLTEs
NCArMSw0IEBACiAgIyVQQU0tMS4wCiAgYXV0aAkJc3VmZmljaWVudAlwYW1fcm9vdG9rLnNvCiAg
YWNjb3VudAkJcmVxdWlyZWQJcGFtX3Blcm1pdC5zbwogLXBhc3N3b3JkCWluY2x1ZGUJCXN5c3Rl
bS1hdXRoCiArcGFzc3dvcmQJaW5jbHVkZQkJY29tbW9uLXBhc3N3b3JkCi1kaWZmIC1OdXIgc2hh
ZG93LTQuMS40LjMvZXRjL3BhbS5kLm9yaWcvZ3JvdXBkZWwgc2hhZG93LTQuMS40LjMvZXRjL3Bh
bS5kL2dyb3VwZGVsCi0tLS0gc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kLm9yaWcvZ3JvdXBkZWwJ
MjAxMS0wNy0yMCAxOTowMjoyNy4zODQ4NDQ5NTggKzA4MDAKLSsrKyBzaGFkb3ctNC4xLjQuMy9l
dGMvcGFtLmQvZ3JvdXBkZWwJMjAxMS0wNy0yMCAxOTowNDoyNi4xMTQ4NDQ5NTggKzA4MDAKK2Rp
ZmYgLS1naXQgYS9ldGMvcGFtLmQvZ3JvdXBkZWwgYi9ldGMvcGFtLmQvZ3JvdXBkZWwKK2luZGV4
IDhmNDlmNWMuLmIxZjM2NWQgMTAwNjQ0CistLS0gYS9ldGMvcGFtLmQvZ3JvdXBkZWwKKysrKyBi
L2V0Yy9wYW0uZC9ncm91cGRlbAogQEAgLTEsNCArMSw0IEBACiAgIyVQQU0tMS4wCiAgYXV0aAkJ
c3VmZmljaWVudAlwYW1fcm9vdG9rLnNvCiAgYWNjb3VudAkJcmVxdWlyZWQJcGFtX3Blcm1pdC5z
bwogLXBhc3N3b3JkCWluY2x1ZGUJCXN5c3RlbS1hdXRoCiArcGFzc3dvcmQJaW5jbHVkZQkJY29t
bW9uLXBhc3N3b3JkCi1kaWZmIC1OdXIgc2hhZG93LTQuMS40LjMvZXRjL3BhbS5kLm9yaWcvZ3Jv
dXBtZW1zIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC9ncm91cG1lbXMKLS0tLSBzaGFkb3ctNC4x
LjQuMy9ldGMvcGFtLmQub3JpZy9ncm91cG1lbXMJMjAxMS0wNy0yMCAxOTowMjoyNy4zODQ4NDQ5
NTggKzA4MDAKLSsrKyBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQvZ3JvdXBtZW1zCTIwMTEtMDct
MjAgMTk6MDQ6MzUuMDc0ODQ0OTU4ICswODAwCitkaWZmIC0tZ2l0IGEvZXRjL3BhbS5kL2dyb3Vw
bWVtcyBiL2V0Yy9wYW0uZC9ncm91cG1lbXMKK2luZGV4IDhmNDlmNWMuLmIxZjM2NWQgMTAwNjQ0
CistLS0gYS9ldGMvcGFtLmQvZ3JvdXBtZW1zCisrKysgYi9ldGMvcGFtLmQvZ3JvdXBtZW1zCiBA
QCAtMSw0ICsxLDQgQEAKICAjJVBBTS0xLjAKICBhdXRoCQlzdWZmaWNpZW50CXBhbV9yb290b2su
c28KICBhY2NvdW50CQlyZXF1aXJlZAlwYW1fcGVybWl0LnNvCiAtcGFzc3dvcmQJaW5jbHVkZQkJ
c3lzdGVtLWF1dGgKICtwYXNzd29yZAlpbmNsdWRlCQljb21tb24tcGFzc3dvcmQKLWRpZmYgLU51
ciBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQub3JpZy9ncm91cG1vZCBzaGFkb3ctNC4xLjQuMy9l
dGMvcGFtLmQvZ3JvdXBtb2QKLS0tLSBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQub3JpZy9ncm91
cG1vZAkyMDExLTA3LTIwIDE5OjAyOjI3LjM4NDg0NDk1OCArMDgwMAotKysrIHNoYWRvdy00LjEu
NC4zL2V0Yy9wYW0uZC9ncm91cG1vZAkyMDExLTA3LTIwIDE5OjA0OjQ0Ljg2NDg0NDk1OCArMDgw
MAorZGlmZiAtLWdpdCBhL2V0Yy9wYW0uZC9ncm91cG1vZCBiL2V0Yy9wYW0uZC9ncm91cG1vZAor
aW5kZXggOGY0OWY1Yy4uYjFmMzY1ZCAxMDA2NDQKKy0tLSBhL2V0Yy9wYW0uZC9ncm91cG1vZAor
KysrIGIvZXRjL3BhbS5kL2dyb3VwbW9kCiBAQCAtMSw0ICsxLDQgQEAKICAjJVBBTS0xLjAKICBh
dXRoCQlzdWZmaWNpZW50CXBhbV9yb290b2suc28KICBhY2NvdW50CQlyZXF1aXJlZAlwYW1fcGVy
bWl0LnNvCiAtcGFzc3dvcmQJaW5jbHVkZQkJc3lzdGVtLWF1dGgKICtwYXNzd29yZAlpbmNsdWRl
CQljb21tb24tcGFzc3dvcmQKLWRpZmYgLU51ciBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQub3Jp
Zy91c2VyYWRkIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC91c2VyYWRkCi0tLS0gc2hhZG93LTQu
MS40LjMvZXRjL3BhbS5kLm9yaWcvdXNlcmFkZAkyMDExLTA3LTIwIDE5OjAyOjI3LjM4NDg0NDk1
OCArMDgwMAotKysrIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC91c2VyYWRkCTIwMTEtMDctMjAg
MTk6MDc6MjYuMjQ0ODQ0OTU4ICswODAwCitkaWZmIC0tZ2l0IGEvZXRjL3BhbS5kL3VzZXJhZGQg
Yi9ldGMvcGFtLmQvdXNlcmFkZAoraW5kZXggOGY0OWY1Yy4uYjFmMzY1ZCAxMDA2NDQKKy0tLSBh
L2V0Yy9wYW0uZC91c2VyYWRkCisrKysgYi9ldGMvcGFtLmQvdXNlcmFkZAogQEAgLTEsNCArMSw0
IEBACiAgIyVQQU0tMS4wCiAgYXV0aAkJc3VmZmljaWVudAlwYW1fcm9vdG9rLnNvCiAgYWNjb3Vu
dAkJcmVxdWlyZWQJcGFtX3Blcm1pdC5zbwogLXBhc3N3b3JkCWluY2x1ZGUJCXN5c3RlbS1hdXRo
CiArcGFzc3dvcmQJaW5jbHVkZQkJY29tbW9uLXBhc3N3b3JkCi1kaWZmIC1OdXIgc2hhZG93LTQu
MS40LjMvZXRjL3BhbS5kLm9yaWcvdXNlcmRlbCBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQvdXNl
cmRlbAotLS0tIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC5vcmlnL3VzZXJkZWwJMjAxMS0wNy0y
MCAxOTowMjoyNy4zODQ4NDQ5NTggKzA4MDAKLSsrKyBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQv
dXNlcmRlbAkyMDExLTA3LTIwIDE5OjA3OjM1LjczNDg0NDk1OCArMDgwMAorZGlmZiAtLWdpdCBh
L2V0Yy9wYW0uZC91c2VyZGVsIGIvZXRjL3BhbS5kL3VzZXJkZWwKK2luZGV4IDhmNDlmNWMuLmIx
ZjM2NWQgMTAwNjQ0CistLS0gYS9ldGMvcGFtLmQvdXNlcmRlbAorKysrIGIvZXRjL3BhbS5kL3Vz
ZXJkZWwKIEBAIC0xLDQgKzEsNCBAQAogICMlUEFNLTEuMAogIGF1dGgJCXN1ZmZpY2llbnQJcGFt
X3Jvb3Rvay5zbwogIGFjY291bnQJCXJlcXVpcmVkCXBhbV9wZXJtaXQuc28KIC1wYXNzd29yZAlp
bmNsdWRlCQlzeXN0ZW0tYXV0aAogK3Bhc3N3b3JkCWluY2x1ZGUJCWNvbW1vbi1wYXNzd29yZAot
ZGlmZiAtTnVyIHNoYWRvdy00LjEuNC4zL2V0Yy9wYW0uZC5vcmlnL3VzZXJtb2Qgc2hhZG93LTQu
MS40LjMvZXRjL3BhbS5kL3VzZXJtb2QKLS0tLSBzaGFkb3ctNC4xLjQuMy9ldGMvcGFtLmQub3Jp
Zy91c2VybW9kCTIwMTEtMDctMjAgMTk6MDI6MjcuMzg0ODQ0OTU4ICswODAwCi0rKysgc2hhZG93
LTQuMS40LjMvZXRjL3BhbS5kL3VzZXJtb2QJMjAxMS0wNy0yMCAxOTowNzo0Mi4wMjQ4NDQ5NTgg
KzA4MDAKK2RpZmYgLS1naXQgYS9ldGMvcGFtLmQvdXNlcm1vZCBiL2V0Yy9wYW0uZC91c2VybW9k
CitpbmRleCA4ZjQ5ZjVjLi5iMWYzNjVkIDEwMDY0NAorLS0tIGEvZXRjL3BhbS5kL3VzZXJtb2QK
KysrKyBiL2V0Yy9wYW0uZC91c2VybW9kCiBAQCAtMSw0ICsxLDQgQEAKICAjJVBBTS0xLjAKICBh
dXRoCQlzdWZmaWNpZW50CXBhbV9yb290b2suc28KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cv
c2hhZG93LmluYwppbmRleCBiOGU1ZTI4NWM0Li5jZWM1NTIzZjAzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvdy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5jCkBAIC0xNCw2ICsxNCw4IEBAIEdJVEhVQl9CQVNFX1VS
SSA9ICJodHRwczovL2dpdGh1Yi5jb20vc2hhZG93LW1haW50L3NoYWRvdy9yZWxlYXNlcyIKIFNS
Q19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9LyR7QlB9LnRhci5neiBc
CiAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ3BhbScs
ICcke1BBTV9TUkNfVVJJfScsICcnLCBkKX0gXAogICAgICAgICAgICBmaWxlOi8vdXNlcmFkZCBc
CisgICAgICAgICAgIGZpbGU6Ly9sb2dpbl9kZWZzX3BhbS5zZWQgXAorICAgICAgICAgICBmaWxl
Oi8vY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5w
YXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBc
CkBAIC0yNCw3ICsyNiw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICIgXAogU1JD
X1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly9jb21tb25p
by5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIFwKICAg
ICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImEzMDVlZGY1ZDE5YmRkYmRmNWU4MzZk
MmQ2MDlmYThiZmYyZDM1NDU4ODE5ZGU0ZDlmMDYzMDZhMWNmMjQzNDIiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYTEyZDgzOTRiZTg4NDA4MTZkMTAxNTVkNTMyNWQxZTIzMjc4ZjdmZjEzZGE0OWFk
OTE1ZTA0NGI0MzUzNTlkMCIKIAogIyBBZGRpdGlvbmFsIFBvbGljeSBmaWxlcyBmb3IgUEFNCiBQ
QU1fU1JDX1VSSSA9ICJmaWxlOi8vcGFtLmQvY2hmbiBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE0LjIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc2hhZG93L3NoYWRvd180LjE0LjMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTQuMi5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4xNC4zLmJiCi0tIAoyLjQy
LjAKCg==

--===============6467908688009958572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1853 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1849 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4783259bd1c25f61db00d4436cb81ba7fe09a29e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4783259bd1c25f61db00d4436cb81ba7fe09a29e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 426 Local 396 Mirrors 0 Missed 30 Current 375 (92% match, 96% complete)
Removing 6 stale sstate objects for arch core2-64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 402 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package_setscene)
NOTE: Running setscene task 460 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package_setscene)
NOTE: Running setscene task 464 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 514 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 620 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 622 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_255.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 637 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 638 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 639 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 643 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_255.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 648 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 654 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 660 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 661 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 663 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_package_setscene: Started
NOTE: Running setscene task 664 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Started
NOTE: recipe systemd-1_255.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 667 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 699 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 716 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 719 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 725 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 730 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 961 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_recipe_qa)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1010 of 2275 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_recipe_qa)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1116 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_fetch)
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1138 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.14.3-r0: task do_recipe_qa: Started
NOTE: Running setscene task 742 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1283 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe shadow-native-4.14.3-r0: task do_recipe_qa: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Started
NOTE: Running task 1326 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: Running task 1356 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_warn_musl)
NOTE: Running task 1357 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_write_config)
NOTE: recipe qemu-native-8.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_255.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Succeeded
NOTE: Running setscene task 746 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1444 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe shadow-4.14.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1445 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.14.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1451 of 2275 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_fetch)
NOTE: recipe systemd-1_255.1-r0: task do_fetch: Succeeded
NOTE: Running task 1457 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_unpack)
NOTE: recipe systemd-1_255.1-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_255.1-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_write_config: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1458 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: recipe shadow-4.14.3-r0: task do_fetch: Started
NOTE: recipe systemd-1_255.1-r0: task do_write_config: Succeeded
NOTE: recipe shadow-4.14.3-r0: task do_fetch: Succeeded
NOTE: Running task 1459 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_unpack)
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-native-4.14.3-r0: task do_fetch: Started
NOTE: Running setscene task 747 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-native-4.14.3-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_unpack: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: Running setscene task 755 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.14.3-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e455ceb04bee1ac2b6b79e3200c1dee8107e4af3ab4bac932d9e8577748d08ab
NOTE: Running setscene task 757 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 763 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 770 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 772 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running task 1469 of 2275 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_unpack)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.14.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 774 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1470 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.14.3-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-native-4.14.3-r0: task do_unpack: Started
NOTE: Running task 1487 of 2275 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1493 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1494 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_patch: Started
NOTE: recipe shadow-native-4.14.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe shadow-native-4.14.3-r0: task do_unpack: Succeeded
NOTE: Running task 1515 of 2275 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_patch: Succeeded
NOTE: recipe qemu-native-8.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.14.3-r0: task do_patch: Succeeded
NOTE: Running task 1526 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1534 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_populate_lic)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-native-4.14.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-native-4.14.3-r0: task do_patch: Started
NOTE: recipe shadow-4.14.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.14.3-r0: task do_populate_lic: Started
NOTE: recipe shadow-4.14.3-r0: task do_populate_lic: Succeeded
NOTE: recipe shadow-4.14.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_unpack: Succeeded
NOTE: Running task 1546 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_patch)
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 780 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 783 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_255.1-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 785 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_255.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 791 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 801 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1935 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2214 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.14.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.14.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.14.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2233 of 2275 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_configure)
NOTE: recipe shadow-4.14.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.14.3-r0: task do_configure: Started
NOTE: recipe shadow-native-4.14.3-r0: task do_patch: Failed
NOTE: recipe shadow-4.14.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2233 tasks of which 2207 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201113743.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201113743.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-native-4.14.3-r0 do_patch: Applying patch 'commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.14.3/shadow-4.14.3'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.14.3/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.14.3/temp/log.do_patch.3067790
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.3.bb:do_patch) failed with exit code '1'

--===============6467908688009958572==--

