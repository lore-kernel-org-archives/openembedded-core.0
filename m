Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589E6C5AE49
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 06:00:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4684.1786255202811559772
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 23:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IfBCK0xA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FrETx7ul;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019fe51b5631-eebb4d55-b426-410b-89f0-eb303d6a6468-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786255202;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kks5SUhOporsii+pZBXgDIo+1mP3c2Hehxxuuy2K0mA=;
	b=IfBCK0xAfjDmTLVi7ymCqtb6GZh+eMweJkZ50hUCbwZ9wBGPy/tnBW5M1hMTPIDY
	HjC6/92xZpVUZ1WHzdA7utYre34EtbhS+pkY6i36nBr6rwdlfKCpvWBINDlFHbIM9WI
	6Ec/+TK8aDruJPC8XlQGRFa5hvmUEmHzzprrrm58=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786255202;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kks5SUhOporsii+pZBXgDIo+1mP3c2Hehxxuuy2K0mA=;
	b=FrETx7ul4ND2vmTBeVS3jNyMbbM0Xvm8aCLqelK1FdG6IN/9JviGNcH4BjNXsr8s
	O61ydl42nNlO5orSRtNnSR0zpvArisEgoDKzDk9NtesDpLgmKLm/LnoMRDisSWbmuey
	CLKDEs2g3CewsSlgu3SZSAVa4DekcOrj19R/Qvps=
Content-Type: multipart/mixed; boundary="===============4229197765023880331=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.20.2 FAILED
Message-ID: <0101019fe51b5631-eebb4d55-b426-410b-89f0-eb303d6a6468-000000@us-west-2.amazonses.com>
Date: Sun, 9 Aug 2026 06:00:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.09-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 06:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243062

--===============4229197765023880331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.20.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.20.0-4.20.2.patch
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
From 7175666b72570ca6bfd86758d193336e3cc9cf8b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 9 Aug 2026 05:39:14 +0000
Subject: [PATCH] shadow: upgrade 4.20.0 -> 4.20.2

---
 ...001-subid-Add-stdint.h-for-uintmax_t.patch | 43 -------------------
 .../shadow/files/notallylog.patch             | 18 +++++---
 .../{shadow_4.20.0.bb => shadow_4.20.2.bb}    |  4 +-
 3 files changed, 15 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for-uintmax_t.patch
 rename meta/recipes-extended/shadow/{shadow_4.20.0.bb => shadow_4.20.2.bb} (98%)

diff --git a/meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for-uintmax_t.patch b/meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for-uintmax_t.patch
deleted file mode 100644
index 5679be0e61..0000000000
--- a/meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for-uintmax_t.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ba4419c57b222b0d34a2b933e7ee92914a51b596 Mon Sep 17 00:00:00 2001
-From: ojab <ojab@ojab.ru>
-Date: Wed, 29 Jul 2026 15:07:43 +0000
-Subject: [PATCH] subid: Add `<stdint.h>` for `uintmax_t`
-
-```
-find_new_sub_uids.c:80:27: error: 'uintmax_t' undeclared (first use in this function)
-find_new_sub_gids.c:80:27: error: 'uintmax_t' undeclared (first use in this function)
-```
-
-Fixes: 4d800cf2eb9e (2026-04-09; "subid: Add deterministic subid ranges")
-
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/ba4419c57b222b0d34a2b933e7ee92914a51b596]
-Signed-off-by: ojab <ojab@ojab.ru>
----
- lib/find_new_sub_gids.c | 1 +
- lib/find_new_sub_uids.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/lib/find_new_sub_gids.c b/lib/find_new_sub_gids.c
-index 3971ce922e..de514d6b09 100644
---- a/lib/find_new_sub_gids.c
-+++ b/lib/find_new_sub_gids.c
-@@ -8,6 +8,7 @@
- 
- #ifdef ENABLE_SUBIDS
- 
-+#include <stdint.h>
- #include <stdio.h>
- #include <errno.h>
- 
-diff --git a/lib/find_new_sub_uids.c b/lib/find_new_sub_uids.c
-index 65f6815467..f0b4328387 100644
---- a/lib/find_new_sub_uids.c
-+++ b/lib/find_new_sub_uids.c
-@@ -8,6 +8,7 @@
- 
- #ifdef ENABLE_SUBIDS
- 
-+#include <stdint.h>
- #include <stdio.h>
- #include <errno.h>
- 
diff --git a/meta/recipes-extended/shadow/files/notallylog.patch b/meta/recipes-extended/shadow/files/notallylog.patch
index 94773ace2b..6d6957bbf8 100644
--- a/meta/recipes-extended/shadow/files/notallylog.patch
+++ b/meta/recipes-extended/shadow/files/notallylog.patch
@@ -1,13 +1,21 @@
+From 20dc49519cc177d4c829f4dd5cc277ada24376d7 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 21 Apr 2026 11:30:52 +0100
+Subject: [PATCH] shadow: Disable tallylog execution
+
 We don't want to call /sbin/pam_tally2 in the native tools case so
 disable this function.
 
 Upstream-Status: Inappropriate [OE cross configuration specific]
+---
+ src/useradd.c | 3 +++
+ 1 file changed, 3 insertions(+)
 
-Index: shadow-4.19.4/src/useradd.c
-===================================================================
---- shadow-4.19.4.orig/src/useradd.c
-+++ shadow-4.19.4/src/useradd.c
-@@ -2046,6 +2046,9 @@ static void tallylog_reset (const char *
+diff --git a/src/useradd.c b/src/useradd.c
+index 5404b46..78bb70a 100644
+--- a/src/useradd.c
++++ b/src/useradd.c
+@@ -2015,6 +2015,9 @@ static void tallylog_reset (const char *user_name)
  	int failed;
  	int status;
  
diff --git a/meta/recipes-extended/shadow/shadow_4.20.0.bb b/meta/recipes-extended/shadow/shadow_4.20.2.bb
similarity index 98%
rename from meta/recipes-extended/shadow/shadow_4.20.0.bb
rename to meta/recipes-extended/shadow/shadow_4.20.2.bb
index bb247cee9d..c54ed77a41 100644
--- a/meta/recipes-extended/shadow/shadow_4.20.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.20.2.bb
@@ -14,7 +14,7 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
-           file://0001-subid-Add-stdint.h-for-uintmax_t.patch \
+           file://login_defs_pam.sed \
            "
 
 SRC_URI:append:class-target = " \
@@ -24,7 +24,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://notallylog.patch \
            "
-SRC_URI[sha256sum] = "5e1eee2709a540ac07e4e5bb0d30f7b97d6ee1e3714ef527047fe2ffb5fdaa5c"
+SRC_URI[sha256sum] = "e5016b40541ee6fa02ea3d409547cef6e7eea9b31f0e3482e4874f87c1d0c7c5"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.47.1


--===============4229197765023880331==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.20.0-4.20.2.patch"

RnJvbSA3MTc1NjY2YjcyNTcwY2E2YmZkODY3NThkMTkzMzM2ZTNjYzljZjhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgOSBBdWcgMjAyNiAwNTozOToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRvdzogdXBncmFkZSA0LjIwLjAgLT4gNC4yMC4yCgotLS0KIC4uLjAwMS1zdWJpZC1BZGQtc3Rk
aW50LmgtZm9yLXVpbnRtYXhfdC5wYXRjaCB8IDQzIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9z
aGFkb3cvZmlsZXMvbm90YWxseWxvZy5wYXRjaCAgICAgICAgICAgICB8IDE4ICsrKysrLS0tCiAu
Li4ve3NoYWRvd180LjIwLjAuYmIgPT4gc2hhZG93XzQuMjAuMi5iYn0gICAgfCAgNCArLQogMyBm
aWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzLzAwMDEtc3ViaWQt
QWRkLXN0ZGludC5oLWZvci11aW50bWF4X3QucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvc2hhZG93L3tzaGFkb3dfNC4yMC4wLmJiID0+IHNoYWRvd180LjIwLjIuYmJ9ICg5OCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy8wMDAxLXN1
YmlkLUFkZC1zdGRpbnQuaC1mb3ItdWludG1heF90LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3NoYWRvdy9maWxlcy8wMDAxLXN1YmlkLUFkZC1zdGRpbnQuaC1mb3ItdWludG1heF90LnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA1Njc5YmUwZTYxLi4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvMDAwMS1zdWJpZC1BZGQt
c3RkaW50LmgtZm9yLXVpbnRtYXhfdC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQzICswLDAg
QEAKLUZyb20gYmE0NDE5YzU3YjIyMmIwZDM0YTJiOTMzZTdlZTkyOTE0YTUxYjU5NiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IG9qYWIgPG9qYWJAb2phYi5ydT4KLURhdGU6IFdlZCwg
MjkgSnVsIDIwMjYgMTU6MDc6NDMgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gc3ViaWQ6IEFkZCBg
PHN0ZGludC5oPmAgZm9yIGB1aW50bWF4X3RgCi0KLWBgYAotZmluZF9uZXdfc3ViX3VpZHMuYzo4
MDoyNzogZXJyb3I6ICd1aW50bWF4X3QnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1
bmN0aW9uKQotZmluZF9uZXdfc3ViX2dpZHMuYzo4MDoyNzogZXJyb3I6ICd1aW50bWF4X3QnIHVu
ZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQotYGBgCi0KLUZpeGVzOiA0ZDgw
MGNmMmViOWUgKDIwMjYtMDQtMDk7ICJzdWJpZDogQWRkIGRldGVybWluaXN0aWMgc3ViaWQgcmFu
Z2VzIikKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3No
YWRvdy1tYWludC9zaGFkb3cvY29tbWl0L2JhNDQxOWM1N2IyMjJiMGQzNGEyYjkzM2U3ZWU5Mjkx
NGE1MWI1OTZdCi1TaWduZWQtb2ZmLWJ5OiBvamFiIDxvamFiQG9qYWIucnU+Ci0tLS0KLSBsaWIv
ZmluZF9uZXdfc3ViX2dpZHMuYyB8IDEgKwotIGxpYi9maW5kX25ld19zdWJfdWlkcy5jIHwgMSAr
Ci0gMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL2xpYi9m
aW5kX25ld19zdWJfZ2lkcy5jIGIvbGliL2ZpbmRfbmV3X3N1Yl9naWRzLmMKLWluZGV4IDM5NzFj
ZTkyMmUuLmRlNTE0ZDZiMDkgMTAwNjQ0Ci0tLS0gYS9saWIvZmluZF9uZXdfc3ViX2dpZHMuYwot
KysrIGIvbGliL2ZpbmRfbmV3X3N1Yl9naWRzLmMKLUBAIC04LDYgKzgsNyBAQAotIAotICNpZmRl
ZiBFTkFCTEVfU1VCSURTCi0gCi0rI2luY2x1ZGUgPHN0ZGludC5oPgotICNpbmNsdWRlIDxzdGRp
by5oPgotICNpbmNsdWRlIDxlcnJuby5oPgotIAotZGlmZiAtLWdpdCBhL2xpYi9maW5kX25ld19z
dWJfdWlkcy5jIGIvbGliL2ZpbmRfbmV3X3N1Yl91aWRzLmMKLWluZGV4IDY1ZjY4MTU0NjcuLmYw
YjQzMjgzODcgMTAwNjQ0Ci0tLS0gYS9saWIvZmluZF9uZXdfc3ViX3VpZHMuYwotKysrIGIvbGli
L2ZpbmRfbmV3X3N1Yl91aWRzLmMKLUBAIC04LDYgKzgsNyBAQAotIAotICNpZmRlZiBFTkFCTEVf
U1VCSURTCi0gCi0rI2luY2x1ZGUgPHN0ZGludC5oPgotICNpbmNsdWRlIDxzdGRpby5oPgotICNp
bmNsdWRlIDxlcnJuby5oPgotIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3No
YWRvdy9maWxlcy9ub3RhbGx5bG9nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRv
dy9maWxlcy9ub3RhbGx5bG9nLnBhdGNoCmluZGV4IDk0NzczYWNlMmIuLjZkNjk1N2JiZjggMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvbm90YWxseWxvZy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL25vdGFsbHlsb2cu
cGF0Y2gKQEAgLTEsMTMgKzEsMjEgQEAKK0Zyb20gMjBkYzQ5NTE5Y2MxNzdkNGM4MjlmNGRkNWNj
Mjc3YWRhMjQzNzZkNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJpY2hhcmQgUHVy
ZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgorRGF0ZTogVHVlLCAyMSBB
cHIgMjAyNiAxMTozMDo1MiArMDEwMAorU3ViamVjdDogW1BBVENIXSBzaGFkb3c6IERpc2FibGUg
dGFsbHlsb2cgZXhlY3V0aW9uCisKIFdlIGRvbid0IHdhbnQgdG8gY2FsbCAvc2Jpbi9wYW1fdGFs
bHkyIGluIHRoZSBuYXRpdmUgdG9vbHMgY2FzZSBzbwogZGlzYWJsZSB0aGlzIGZ1bmN0aW9uLgog
CiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FIGNyb3NzIGNvbmZpZ3VyYXRpb24g
c3BlY2lmaWNdCistLS0KKyBzcmMvdXNlcmFkZC5jIHwgMyArKysKKyAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCiAKLUluZGV4OiBzaGFkb3ctNC4xOS40L3NyYy91c2VyYWRkLmMKLT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KLS0tLSBzaGFkb3ctNC4xOS40Lm9yaWcvc3JjL3VzZXJhZGQuYwotKysrIHNoYWRv
dy00LjE5LjQvc3JjL3VzZXJhZGQuYwotQEAgLTIwNDYsNiArMjA0Niw5IEBAIHN0YXRpYyB2b2lk
IHRhbGx5bG9nX3Jlc2V0IChjb25zdCBjaGFyICoKK2RpZmYgLS1naXQgYS9zcmMvdXNlcmFkZC5j
IGIvc3JjL3VzZXJhZGQuYworaW5kZXggNTQwNGI0Ni4uNzhiYjcwYSAxMDA2NDQKKy0tLSBhL3Ny
Yy91c2VyYWRkLmMKKysrKyBiL3NyYy91c2VyYWRkLmMKK0BAIC0yMDE1LDYgKzIwMTUsOSBAQCBz
dGF0aWMgdm9pZCB0YWxseWxvZ19yZXNldCAoY29uc3QgY2hhciAqdXNlcl9uYW1lKQogIAlpbnQg
ZmFpbGVkOwogIAlpbnQgc3RhdHVzOwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3NoYWRvdy9zaGFkb3dfNC4yMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRv
dy9zaGFkb3dfNC4yMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4yMC4yLmJiCmluZGV4IGJiMjQ3Y2VlOWQu
LmM1NGVkNzdhNDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hh
ZG93XzQuMjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180
LjIwLjIuYmIKQEAgLTE0LDcgKzE0LDcgQEAgR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9zaGFkb3ctbWFpbnQvc2hhZG93L3JlbGVhc2VzIgogU1JDX1VSSSA9ICIke0dJVEhV
Ql9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgJHtA
YmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAncGFtJywgJyR7UEFNX1NSQ19VUkl9
JywgJycsIGQpfSBcCiAgICAgICAgICAgIGZpbGU6Ly91c2VyYWRkIFwKLSAgICAgICAgICAgZmls
ZTovLzAwMDEtc3ViaWQtQWRkLXN0ZGludC5oLWZvci11aW50bWF4X3QucGF0Y2ggXAorICAgICAg
ICAgICBmaWxlOi8vbG9naW5fZGVmc19wYW0uc2VkIFwKICAgICAgICAgICAgIgogCiBTUkNfVVJJ
OmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiIFwKQEAgLTI0LDcgKzI0LDcgQEAgU1JDX1VSSTphcHBl
bmQ6Y2xhc3MtdGFyZ2V0ID0gIiBcCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIFwK
ICAgICAgICAgICAgZmlsZTovL25vdGFsbHlsb2cucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNWUxZWVlMjcwOWE1NDBhYzA3ZTRlNWJiMGQzMGY3Yjk3ZDZlZTFl
MzcxNGVmNTI3MDQ3ZmUyZmZiNWZkYWE1YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlNTAxNmI0
MDU0MWVlNmZhMDJlYTNkNDA5NTQ3Y2VmNmU3ZWVhOWIzMWYwZTM0ODJlNDg3NGY4N2MxZDBjN2M1
IgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvdGFnL3Y/KD9QPHB2ZXI+XGQrKFwu
XGQrKSspJCIKIAogIyBBZGRpdGlvbmFsIFBvbGljeSBmaWxlcyBmb3IgUEFNCi0tIAoyLjQ3LjEK
Cg==

--===============4229197765023880331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-561f61fbef377df1dc99b2336acdae81bd511fb5"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:561f61fbef377df1dc99b2336acdae81bd511fb5"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 399 Local 366 Mirrors 0 Missed 33 Current 504 (91% match, 96% complete)
done.
Removing 9 stale sstate objects for arch x86-64-v3...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 563 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 634 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 677 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 705 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 728 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_261.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-securetty-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-securetty-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_261.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe procps-4.0.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 756 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 757 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 758 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_261.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 759 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 763 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_261.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 764 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_package_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe systemd-1_261.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 768 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 773 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 796 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 801 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 802 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 803 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package_setscene)
NOTE: recipe systemd-1_261.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 825 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-protocols-1.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_recipe_qa_setscene)
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 837 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 854 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1192 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_recipe_qa)
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 855 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1237 of 2368 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_recipe_qa)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 860 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 863 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1280 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_261.2.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 867 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1294 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_fetch)
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa: Started
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 870 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.6-r0: task do_fetch: Started
NOTE: recipe systemd-1_261.2-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 877 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1452 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libtool-native-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1475 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_261.2.bb:do_warn_musl)
NOTE: Running task 1476 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_261.2.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-native-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 884 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-1_261.2-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_261.2-r0: task do_write_config: Started
NOTE: recipe systemd-1_261.2-r0: task do_warn_musl: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1622 of 2368 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_fetch)
NOTE: recipe automake-native-1.18.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe systemd-1_261.2-r0: task do_write_config: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe automake-native-1.18.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 885 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-native-4.20.2-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1640 of 2368 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_unpack)
NOTE: Running task 1641 of 2368 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe autoconf-native-2.73-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe autoconf-native-2.73-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-native-4.20.2-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1725 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_fetch)
NOTE: Running task 1757 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_recipe_spdx)
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Started
NOTE: recipe shadow-4.20.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: recipe shadow-4.20.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1761 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_unpack)
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1762 of 2368 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_patch)
NOTE: recipe shadow-native-4.20.2-r0: task do_patch: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1763 of 2368 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-native-4.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1764 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_patch)
NOTE: recipe shadow-native-4.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1765 of 2368 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_configure)
NOTE: recipe shadow-4.20.2-r0: task do_patch: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_configure: Started
NOTE: recipe shadow-4.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1766 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1767 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_populate_lic)
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.20.2-r0: task do_populate_lic: Started
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 890 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe qemu-native-11.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1773 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_unpack)
NOTE: recipe procps-4.0.6-r0: task do_unpack: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 891 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe procps-4.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1783 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_patch)
NOTE: recipe procps-4.0.6-r0: task do_patch: Started
NOTE: recipe procps-4.0.6-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 892 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 893 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 895 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 898 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 901 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 903 of 903 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2051 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2320 of 2368 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_configure)
NOTE: recipe shadow-4.20.2-r0: task do_configure: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_configure: Failed
NOTE: recipe shadow-4.20.2-r0: task do_configure: Failed
NOTE: recipe systemd-1_261.2-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 2320 tasks of which 2297 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260809053755.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260809053755.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.20.2/temp/log.do_configure.2005470
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/shadow/4.20.2/temp/log.do_configure.2008486
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: shadow-native-4.20.2-r0 do_configure: QA Issue: shadow-native: configure was passed unrecognised options: --with-attr [unknown-configure-option]
ERROR: shadow-native-4.20.2-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: shadow-4.20.2-r0 do_configure: QA Issue: shadow: configure was passed unrecognised options: --with-attr [unknown-configure-option]
ERROR: shadow-4.20.2-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.20.2/temp/log.do_configure.2005470
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_configure) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/shadow/4.20.2/temp/log.do_configure.2008486
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_configure) failed with exit code '1'

--===============4229197765023880331==--

