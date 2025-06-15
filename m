Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D43C7EE33
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:52 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.8886.1749993279766792752
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NyjHK/42;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rfUxMRfr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019773ba6451-4737c8af-c508-4bb5-80cd-940bc9c939e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mVDCaRcndVU6GkEG3h3YYrNyShg8/GFXV2uhcogdUdI=;
	b=NyjHK/42Oz1WXCLnkwQgUuO/yz01DVxg15Y2AIPk76qb+XVQSnWktt2h4kZ9gYQn
	5cIOoGPFrHfKLrqbDcl2/3pcuYoVUWKe5CrK3zxPI7nHY64zhpPjR+V3jAj6/yt6xGC
	XhXuLeeszL01trLk7M30r+/egzPphHCjdG9P2ADg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mVDCaRcndVU6GkEG3h3YYrNyShg8/GFXV2uhcogdUdI=;
	b=rfUxMRfrkpv0VNrB+RJZ9BLt85xhH/wFSnRnWNBR0EK2qco5f7wSjly1NZAXNIR1
	cFWFkqrOl44R0a92510Jl0gwdz/2y5BPXc9JsvEqxSCqA1LGHqXkgT4WKuMDiifd+v3
	SYWAKR27zqa+v23bmgMmbVZQx76LWziKA6Hr4LGs=
Content-Type: multipart/mixed; boundary="===============3362210949510001048=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.49 SUCCEEDED
Message-ID: <0101019773ba6451-4737c8af-c508-4bb5-80cd-940bc9c939e3-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218670

--===============3362210949510001048==
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
From 735a94819f7dbebac74551498493753497519d6e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 08:02:04 +0000
Subject: [PATCH] mtools: upgrade 4.0.48 -> 4.0.49

---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch      | 2 +-
 .../mtools/mtools/disable-hardcoded-configs.patch           | 2 +-
 meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch   | 6 +++---
 .../mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb}           | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index ddf3706f51..aa6432a948 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From 6914c6e15cd15daf1dae81458e5346958c9d5449 Mon Sep 17 00:00:00 2001
+From 6fc27e354741ce0c3c2002cb1e1a37b9e4124bbc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 63992ac547..2e2ad1e525 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 16969d42ec6514883bcee87cc89b3e7864481d7e Mon Sep 17 00:00:00 2001
+From 7d4f439f475d0922f05012456b53748da3959cce Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index fb7ba56eec..57135c91dc 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From b517158e8ffc6a665506007b20708d6c2589cec1 Mon Sep 17 00:00:00 2001
+From e962dae4cc06b349d9b25eed9323dbfc05c08ce3 Mon Sep 17 00:00:00 2001
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


--===============3362210949510001048==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.48-4.0.49.patch"

RnJvbSA3MzVhOTQ4MTlmN2RiZWJhYzc0NTUxNDk4NDkzNzUzNDk3NTE5ZDZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDg6MDI6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
dG9vbHM6IHVwZ3JhZGUgNC4wLjQ4IC0+IDQuMC40OQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbXRvb2xzL210b29scy9jbGFuZ19VTlVTRUQucGF0Y2ggICAgICB8IDIgKy0KIC4uLi9tdG9v
bHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2ggICAgICAgICAgIHwgMiAr
LQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvbXRvb2xzLW1ha2VpbmZvLnBh
dGNoICAgfCA2ICsrKy0tLQogLi4uL210b29scy97bXRvb2xzXzQuMC40OC5iYiA9PiBtdG9vbHNf
NC4wLjQ5LmJifSAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xz
L3ttdG9vbHNfNC4wLjQ4LmJiID0+IG10b29sc180LjAuNDkuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvY2xhbmdfVU5VU0VELnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvY2xhbmdfVU5VU0VELnBhdGNo
CmluZGV4IGRkZjM3MDZmNTEuLmFhNjQzMmE5NDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9jbGFuZ19VTlVTRUQucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDY5MTRjNmUxNWNkMTVkYWYxZGFlODE0NThlNTM0Njk1OGM5ZDU0NDkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZmYzI3ZTM1NDc0MWNlMGMzYzIwMDJjYjFlMWEzN2I5
ZTQxMjRiYmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgogRGF0ZTogV2VkLCAxOSBTZXAgMjAxOCAxMTo1NTo0MSAtMDcwMAogU3Vi
amVjdDogW1BBVENIXSBVbmRlZmluZSBVTlVTRUQgbWFjcm9zIHdpdGggY2xhbmcKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVk
LWNvbmZpZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNh
YmxlLWhhcmRjb2RlZC1jb25maWdzLnBhdGNoCmluZGV4IDYzOTkyYWM1NDcuLjJlMmFkMWU1MjUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUt
aGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29s
cy9tdG9vbHMvZGlzYWJsZS1oYXJkY29kZWQtY29uZmlncy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMTY5NjlkNDJlYzY1MTQ4ODNiY2VlODdjYzg5YjNlNzg2NDQ4MWQ3ZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2Q0ZjQzOWY0NzVkMDkyMmYwNTAxMjQ1NmI1Mzc0OGRhMzk1
OWNjZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEVkIEJhcnRvc2ggPGVkLmJhcnRv
c2hAbGludXguaW50ZWwuY29tPgogRGF0ZTogVHVlLCAxMyBKdW4gMjAxNyAxNDo1NTo1MiArMDMw
MAogU3ViamVjdDogW1BBVENIXSBEaXNhYmxlZCByZWFkaW5nIGhvc3QgY29uZmlncy4KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL210b29scy1tYWtlaW5m
by5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL210b29scy1tYWtl
aW5mby5wYXRjaAppbmRleCBmYjdiYTU2ZWVjLi41NzEzNWM5MWRjIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9tdG9vbHMtbWFrZWluZm8ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvbXRvb2xzLW1ha2VpbmZvLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiNTE3MTU4ZThmZmM2YTY2NTUwNjAwN2IyMDcwOGQ2
YzI1ODljZWMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlOTYyZGFlNGNjMDZiMzQ5
ZDliMjVlZWQ5MzIzZGJmYzA1YzA4Y2UzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
TWFyY2luIEp1c3praWV3aWN6IDxocndAb3BlbmVkaGFuZC5jb20+CiBEYXRlOiBGcmksIDggSnVu
IDIwMDcgMDg6MzU6MTIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbXRvb2xzOiBpbXBvcnRlZCBm
cm9tIE9FCkBAIC0xMCw3ICsxMCw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBb
bGljZW5zaW5nXQogIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLWluZGV4IDdi
MzA1YjAuLjcwYzhjNzQgMTAwNjQ0CitpbmRleCBkOWNjNmUzLi4xZjhkOTNmIDEwMDY0NAogLS0t
IGEvTWFrZWZpbGUuaW4KICsrKyBiL01ha2VmaWxlLmluCiBAQCAtMjYsMTAgKzI2LDExIEBAIFVT
RVJDRkxBR1MgPQpAQCAtMzksNyArMzksNyBAQCBpbmRleCA3YjMwNWIwLi43MGM4Yzc0IDEwMDY0
NAogIHBkZjogbXRvb2xzLnBkZgogICUucGRmOiAlLnRleGkgc3lzY29uZmRpci50ZXhpCiBkaWZm
IC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAzN2YwZDAwLi5jOTNj
ZmI1IDEwMDY0NAoraW5kZXggZmE3M2Y3Yi4uYzQyYTIzMiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3Vy
ZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMzYsNiArMzYsMzMgQEAgQUNfUEFUSF9QUk9H
KElOU1RBTExfSU5GTywgaW5zdGFsbC1pbmZvLCAiIikKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40OC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tdG9vbHMvbXRvb2xzXzQuMC40OS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29sc180LjAuNDguYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40OS5iYgppbmRleCA2NDY3
MzVmM2IzLi4yOTRiMmYzN2IyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRv
b2xzL210b29sc180LjAuNDguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9t
dG9vbHNfNC4wLjQ5LmJiCkBAIC0yNCw3ICsyNCw3IEBAIFJSRUNPTU1FTkRTOiR7UE59OmxpYmMt
Z2xpYmMgPSAiXAogCWdsaWJjLWdjb252LWlibTg2NiBcCiAJZ2xpYmMtZ2NvbnYtaWJtODY5IFwK
IAkiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDNjMjlhYWM4NzM1ZGQ3MTU0YTk4OWZiYzI5ZWFm
MmI1MDYxMjFhZTFjM2EzNWNkMGJmMmEwMmU5NGQyNzFhOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI2ZmU1MTkzNTgzZDZlN2M1OWRhNzVlNjNkNzIzNGY3NmMwYjA3Y2FmMzNiMTAzODk0ZjQ2ZjY2
YTg3MWZmYzlmIgogCiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vbXRvb2xzL210b29scy0ke1BW
fS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovL210b29scy1tYWtlaW5mby5wYXRjaCBcCi0t
IAoyLjQ3LjEKCg==

--===============3362210949510001048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mtools: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/mtools/mtools-4.0.48.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftpmirror.gnu.org/gnu/mtools/mtools-4.0.49.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-64-poky-linux/mtools: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 878880 to 879472 (+0%)
packages/core2-64-poky-linux/mtools/mtools-dbg: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools-dev: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools-doc: PKGSIZE changed from 210237 to 210229 (-0%)
packages/core2-64-poky-linux/mtools/mtools-doc: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools-locale: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-src: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools-src: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.48" to "4.0.49"
packages/core2-64-poky-linux/mtools/mtools: PKGV changed from 4.0.48 [default] to 4.0.49 [default]
packages/core2-64-poky-linux/mtools/mtools: PKGSIZE changed from 223244 to 227340 (+2%)
packages/core2-64-poky-linux/mtools/mtools: PV changed from "4.0.48" to "4.0.49"

--===============3362210949510001048==--

