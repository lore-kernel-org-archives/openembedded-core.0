Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23D8C83F21
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1428.1751386807920747292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XLWu0sSi;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mtLAblUI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010197c6c9eaec-139fed2d-025d-4a5e-b52a-3fd35336b14b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386811;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QpWcbuSMjltqQdweq/qY6wWxNRSB382DHD19M8p6JsM=;
	b=XLWu0sSiuZHkjPqRWlnoIgWz6eFaW+DL9Axj1GXVhCvMbfv9rXBC53C4JGWK/Pue
	fLaYyOM8CbHWP9pZJCJRWKvDMcugSRgxrKa0QIDy6hizmsHXoH3juopRND37rqtE0AZ
	xnXlGrzvmy7XwgzV3grjFIsF6i1tdWkMoaCWwV10=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386811;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QpWcbuSMjltqQdweq/qY6wWxNRSB382DHD19M8p6JsM=;
	b=mtLAblUI9bJ/8p3HC8hbhAj9wDt6w/igB0/PjumrfC9DENUwBY3wFyQjOySd5vE+
	Vo/cJFOzvNC7Q7cdXGUkvDjNF+Ui2jGpoh8HKokV3KJDjetBR4Nk10nORg3qtI5LSNI
	DaXq1O8UNSiE7RMNnbmFncHwrVnlB3tQ7cA7uA4Y=
Content-Type: multipart/mixed; boundary="===============7350286288614590335=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.49 SUCCEEDED
Message-ID: <01010197c6c9eaec-139fed2d-025d-4a5e-b52a-3fd35336b14b-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219628

--===============7350286288614590335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mtools* to *4.0.49* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.48-4.0.49.patch
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
From a7f8a055756e39ac3bb9a2211f33a1ef5ff0a4a9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:35:19 +0000
Subject: [PATCH] mtools: upgrade 4.0.48 -> 4.0.49

---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch      | 2 +-
 .../mtools/mtools/disable-hardcoded-configs.patch           | 2 +-
 meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch   | 6 +++---
 .../mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb}           | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index ddf3706f51..cc86c31986 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From 6914c6e15cd15daf1dae81458e5346958c9d5449 Mon Sep 17 00:00:00 2001
+From 6419143354781db8359e30bec7942774a1405ba3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 63992ac547..91ffc8a42d 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 16969d42ec6514883bcee87cc89b3e7864481d7e Mon Sep 17 00:00:00 2001
+From c7a43cde57c9651d72543e78ad8e90dcc053dc44 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index fb7ba56eec..cd6c1edddc 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From b517158e8ffc6a665506007b20708d6c2589cec1 Mon Sep 17 00:00:00 2001
+From 354064a066c2cdc36def94061c97a41355042c10 Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
@@ -10,7 +10,7 @@ Upstream-Status: Inappropriate [licensing]
  2 files changed, 33 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 7b305b0..70c8c74 100644
+index d9cc6e3..1f8d93f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -26,10 +26,11 @@ USERCFLAGS =
@@ -39,7 +39,7 @@ index 7b305b0..70c8c74 100644
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
 diff --git a/configure.ac b/configure.ac
-index 37f0d00..c93cfb5 100644
+index fa73f7b..c42a232 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -36,6 +36,33 @@ AC_PATH_PROG(INSTALL_INFO, install-info, "")
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.48.bb b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.48.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.49.bb
index 646735f3b3..294b2f37b2 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.48.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "03c29aac8735dd7154a989fbc29eaf2b506121ae1c3a35cd0bf2a02e94d271a9"
+SRC_URI[sha256sum] = "6fe5193583d6e7c59da75e63d7234f76c0b07caf33b103894f46f66a871ffc9f"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.47.1


--===============7350286288614590335==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.48-4.0.49.patch"

RnJvbSBhN2Y4YTA1NTc1NmUzOWFjM2JiOWEyMjExZjMzYTFlZjVmZjBhNGE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODozNToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG10
b29sczogdXBncmFkZSA0LjAuNDggLT4gNC4wLjQ5CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaCAgICAgIHwgMiArLQogLi4uL210b29s
cy9tdG9vbHMvZGlzYWJsZS1oYXJkY29kZWQtY29uZmlncy5wYXRjaCAgICAgICAgICAgfCAyICst
CiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9tdG9vbHMtbWFrZWluZm8ucGF0
Y2ggICB8IDYgKysrLS0tCiAuLi4vbXRvb2xzL3ttdG9vbHNfNC4wLjQ4LmJiID0+IG10b29sc180
LjAuNDkuYmJ9ICAgICAgICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMv
e210b29sc180LjAuNDguYmIgPT4gbXRvb2xzXzQuMC40OS5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9jbGFuZ19VTlVTRUQucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9jbGFuZ19VTlVTRUQucGF0Y2gK
aW5kZXggZGRmMzcwNmY1MS4uY2M4NmMzMTk4NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL210b29scy9tdG9vbHMvY2xhbmdfVU5VU0VELnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNjkxNGM2ZTE1Y2QxNWRhZjFkYWU4MTQ1OGU1MzQ2OTU4YzlkNTQ0OSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjQxOTE0MzM1NDc4MWRiODM1OWUzMGJlYzc5NDI3NzRh
MTQwNWJhMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDE5IFNlcCAyMDE4IDExOjU1OjQxIC0wNzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIFVuZGVmaW5lIFVOVVNFRCBtYWNyb3Mgd2l0aCBjbGFuZwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvZGlzYWJsZS1oYXJkY29kZWQt
Y29uZmlncy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2Fi
bGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2gKaW5kZXggNjM5OTJhYzU0Ny4uOTFmZmM4YTQyZCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvZGlzYWJsZS1o
YXJkY29kZWQtY29uZmlncy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xz
L210b29scy9kaXNhYmxlLWhhcmRjb2RlZC1jb25maWdzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAxNjk2OWQ0MmVjNjUxNDg4M2JjZWU4N2NjODliM2U3ODY0NDgxZDdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBjN2E0M2NkZTU3Yzk2NTFkNzI1NDNlNzhhZDhlOTBkY2MwNTNk
YzQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRWQgQmFydG9zaCA8ZWQuYmFydG9z
aEBsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBUdWUsIDEzIEp1biAyMDE3IDE0OjU1OjUyICswMzAw
CiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGVkIHJlYWRpbmcgaG9zdCBjb25maWdzLgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvbXRvb2xzLW1ha2VpbmZv
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvbXRvb2xzLW1ha2Vp
bmZvLnBhdGNoCmluZGV4IGZiN2JhNTZlZWMuLmNkNmMxZWRkZGMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL210b29scy1tYWtlaW5mby5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9tdG9vbHMtbWFrZWluZm8ucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI1MTcxNThlOGZmYzZhNjY1NTA2MDA3YjIwNzA4ZDZj
MjU4OWNlYzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDM1NDA2NGEwNjZjMmNkYzM2
ZGVmOTQwNjFjOTdhNDEzNTUwNDJjMTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBN
YXJjaW4gSnVzemtpZXdpY3ogPGhyd0BvcGVuZWRoYW5kLmNvbT4KIERhdGU6IEZyaSwgOCBKdW4g
MjAwNyAwODozNToxMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBtdG9vbHM6IGltcG9ydGVkIGZy
b20gT0UKQEAgLTEwLDcgKzEwLDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFts
aWNlbnNpbmddCiAgMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuaW4gYi9NYWtlZmlsZS5pbgotaW5kZXggN2Iz
MDViMC4uNzBjOGM3NCAxMDA2NDQKK2luZGV4IGQ5Y2M2ZTMuLjFmOGQ5M2YgMTAwNjQ0CiAtLS0g
YS9NYWtlZmlsZS5pbgogKysrIGIvTWFrZWZpbGUuaW4KIEBAIC0yNiwxMCArMjYsMTEgQEAgVVNF
UkNGTEFHUyA9CkBAIC0zOSw3ICszOSw3IEBAIGluZGV4IDdiMzA1YjAuLjcwYzhjNzQgMTAwNjQ0
CiAgcGRmOiBtdG9vbHMucGRmCiAgJS5wZGY6ICUudGV4aSBzeXNjb25mZGlyLnRleGkKIGRpZmYg
LS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDM3ZjBkMDAuLmM5M2Nm
YjUgMTAwNjQ0CitpbmRleCBmYTczZjdiLi5jNDJhMjMyIDEwMDY0NAogLS0tIGEvY29uZmlndXJl
LmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0zNiw2ICszNiwzMyBAQCBBQ19QQVRIX1BST0co
SU5TVEFMTF9JTkZPLCBpbnN0YWxsLWluZm8sICIiKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQ4LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L210b29scy9tdG9vbHNfNC4wLjQ5LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40OC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQ5LmJiCmluZGV4IDY0Njcz
NWYzYjMuLjI5NGIyZjM3YjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9v
bHMvbXRvb2xzXzQuMC40OC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210
b29sc180LjAuNDkuYmIKQEAgLTI0LDcgKzI0LDcgQEAgUlJFQ09NTUVORFM6JHtQTn06bGliYy1n
bGliYyA9ICJcCiAJZ2xpYmMtZ2NvbnYtaWJtODY2IFwKIAlnbGliYy1nY29udi1pYm04NjkgXAog
CSIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwM2MyOWFhYzg3MzVkZDcxNTRhOTg5ZmJjMjllYWYy
YjUwNjEyMWFlMWMzYTM1Y2QwYmYyYTAyZTk0ZDI3MWE5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjZmZTUxOTM1ODNkNmU3YzU5ZGE3NWU2M2Q3MjM0Zjc2YzBiMDdjYWYzM2IxMDM4OTRmNDZmNjZh
ODcxZmZjOWYiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9tdG9vbHMvbXRvb2xzLSR7UFZ9
LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vbXRvb2xzLW1ha2VpbmZvLnBhdGNoIFwKLS0g
CjIuNDcuMQoK

--===============7350286288614590335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mtools: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/mtools/mtools-4.0.48.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftpmirror.gnu.org/gnu/mtools/mtools-4.0.49.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-64-poky-linux/mtools/mtools-dbg: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 879528 to 880088 (+0%)
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools-dev: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools-doc: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-doc: PKGSIZE changed from 210237 to 210229 (-0%)
packages/core2-64-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools-locale: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools-src: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-src: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools: PKGSIZE changed from 223244 to 227340 (+2%)
packages/core2-64-poky-linux/mtools/mtools: PKGV changed from 4.0.48 [default] to 4.0.49 [default]

--===============7350286288614590335==--

