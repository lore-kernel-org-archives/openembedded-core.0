Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC0AC021BD
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42718.1738416051425296114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LcNKcEpF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=a9+HjVyn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194c1abd0c1-4f4cefed-e5b9-4546-acd7-1cba5efb4d16-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uWkAoLGuAmRCCx7Z73Qrkp86GhSuI6eX9NOucifxnoA=;
	b=LcNKcEpFADhNHVHmw6LHxubTMZSlqE5S+kRGtPbJLTWcYPmWXUWkiAYISZhbpMCN
	+d6ufaTVUajm3E03xJ1qrPv+f0T20ZUuZwPUy0fwWXzHqBh4czUCoTbEPlU4xZZa0N1
	VnEBk39lWyt+OzneV+AGfNXnst75DrPN/kreo5g8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uWkAoLGuAmRCCx7Z73Qrkp86GhSuI6eX9NOucifxnoA=;
	b=a9+HjVynJAv6CIToga7uj+vk/OsBBbUZZXOnEVXJDE3HHrpsb0JzHiRijLwD1Q7t
	JVydfj3B3buHM/JhdLku5Uza/sdzYGRVJqHUXHwyr8ZFiYZVtTF+o0XZVeCTlohICuM
	C0QcU60qxrSvGXOL+LjYaGjK4lcl4fdW9XBwcIj0=
Content-Type: multipart/mixed; boundary="===============2531688135537647671=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.47 SUCCEEDED
Message-ID: <01010194c1abd0c1-4f4cefed-e5b9-4546-acd7-1cba5efb4d16-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210531

--===============2531688135537647671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mtools* to *4.0.47* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.46-4.0.47.patch
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
From 07f17b8c9007c273a1228085ea02784164fffdde Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 07:57:17 +0000
Subject: [PATCH] mtools: upgrade 4.0.46 -> 4.0.47

---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch      | 2 +-
 .../mtools/mtools/disable-hardcoded-configs.patch           | 4 ++--
 meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch   | 6 +++---
 .../mtools/{mtools_4.0.46.bb => mtools_4.0.47.bb}           | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.46.bb => mtools_4.0.47.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 1420d84b86..2f3c452420 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From 6654edfb1eee416b58bcb6490658f80071a353c2 Mon Sep 17 00:00:00 2001
+From d8e9cf472f49c8dbb3b0855145974d199a83e8a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 1bed4e7614..1b3c3e003d 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 0953b744b0257e26c170fb6d6b4c0f6210e4ae43 Mon Sep 17 00:00:00 2001
+From 4e51cf33fc34e8e82661b9bc3ab13858a2ffe43d Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -11,7 +11,7 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 358282b..8ebafb4 100644
+index 436c94b..794f098 100644
 --- a/config.c
 +++ b/config.c
 @@ -868,14 +868,6 @@ void read_config(void)
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 8c80040f91..fb7ba56eec 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From fd1e84c66852c2c906ee292aad942b4bfbd9e306 Mon Sep 17 00:00:00 2001
+From b517158e8ffc6a665506007b20708d6c2589cec1 Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
@@ -39,10 +39,10 @@ index 7b305b0..70c8c74 100644
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
 diff --git a/configure.ac b/configure.ac
-index de108a8..0fd9ef0 100644
+index 37f0d00..c93cfb5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -33,6 +33,33 @@ AC_CANONICAL_TARGET
+@@ -36,6 +36,33 @@ AC_PATH_PROG(INSTALL_INFO, install-info, "")
  AC_C_CONST
  AC_C_INLINE
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.46.bb b/meta/recipes-devtools/mtools/mtools_4.0.47.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.46.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.47.bb
index 1173718662..70d6579621 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.46.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.47.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "9aad8dd859f88fb7787924ec47590192d3abf7bad6c840509c854290d6bc16c0"
+SRC_URI[sha256sum] = "31aa06078cc3f50591b95e71a909c56dd179d87e9cbdc07bf435e595bd7cc7ff"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.44.1


--===============2531688135537647671==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.46-4.0.47.patch"

RnJvbSAwN2YxN2I4YzkwMDdjMjczYTEyMjgwODVlYTAyNzg0MTY0ZmZmZGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNzo1NzoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG10
b29sczogdXBncmFkZSA0LjAuNDYgLT4gNC4wLjQ3CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaCAgICAgIHwgMiArLQogLi4uL210b29s
cy9tdG9vbHMvZGlzYWJsZS1oYXJkY29kZWQtY29uZmlncy5wYXRjaCAgICAgICAgICAgfCA0ICsr
LS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL210b29scy1tYWtlaW5mby5w
YXRjaCAgIHwgNiArKystLS0KIC4uLi9tdG9vbHMve210b29sc180LjAuNDYuYmIgPT4gbXRvb2xz
XzQuMC40Ny5iYn0gICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29s
cy97bXRvb2xzXzQuMC40Ni5iYiA9PiBtdG9vbHNfNC4wLjQ3LmJifSAoOTMlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRj
aAppbmRleCAxNDIwZDg0Yjg2Li4yZjNjNDUyNDIwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbXRvb2xzL210b29scy9jbGFuZ19VTlVTRUQucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvY2xhbmdfVU5VU0VELnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA2NjU0ZWRmYjFlZWU0MTZiNThiY2I2NDkwNjU4ZjgwMDcxYTM1M2MyIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkOGU5Y2Y0NzJmNDljOGRiYjNiMDg1NTE0NTk3NGQx
OTlhODNlOGE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMTkgU2VwIDIwMTggMTE6NTU6NDEgLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0gVW5kZWZpbmUgVU5VU0VEIG1hY3JvcyB3aXRoIGNsYW5nCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxlLWhhcmRjb2Rl
ZC1jb25maWdzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvZGlz
YWJsZS1oYXJkY29kZWQtY29uZmlncy5wYXRjaAppbmRleCAxYmVkNGU3NjE0Li4xYjNjM2UwMDNk
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxl
LWhhcmRjb2RlZC1jb25maWdzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9v
bHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDA5NTNiNzQ0YjAyNTdlMjZjMTcwZmI2ZDZiNGMwZjYyMTBlNGFlNDMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDRlNTFjZjMzZmMzNGU4ZTgyNjYxYjliYzNhYjEzODU4YTJm
ZmU0M2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBFZCBCYXJ0b3NoIDxlZC5iYXJ0
b3NoQGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFR1ZSwgMTMgSnVuIDIwMTcgMTQ6NTU6NTIgKzAz
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRGlzYWJsZWQgcmVhZGluZyBob3N0IGNvbmZpZ3MuCkBAIC0x
MSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEVkIEJhcnRvc2ggPGVkLmJhcnRvc2hAbGludXgu
aW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0
IGEvY29uZmlnLmMgYi9jb25maWcuYwotaW5kZXggMzU4MjgyYi4uOGViYWZiNCAxMDA2NDQKK2lu
ZGV4IDQzNmM5NGIuLjc5NGYwOTggMTAwNjQ0CiAtLS0gYS9jb25maWcuYwogKysrIGIvY29uZmln
LmMKIEBAIC04NjgsMTQgKzg2OCw2IEBAIHZvaWQgcmVhZF9jb25maWcodm9pZCkKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL210b29scy1tYWtlaW5mby5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL210b29scy1tYWtlaW5m
by5wYXRjaAppbmRleCA4YzgwMDQwZjkxLi5mYjdiYTU2ZWVjIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9tdG9vbHMtbWFrZWluZm8ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvbXRvb2xzLW1ha2VpbmZvLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmZDFlODRjNjY4NTJjMmM5MDZlZTI5MmFhZDk0MmI0YmZi
ZDllMzA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiNTE3MTU4ZThmZmM2YTY2NTUw
NjAwN2IyMDcwOGQ2YzI1ODljZWMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFy
Y2luIEp1c3praWV3aWN6IDxocndAb3BlbmVkaGFuZC5jb20+CiBEYXRlOiBGcmksIDggSnVuIDIw
MDcgMDg6MzU6MTIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbXRvb2xzOiBpbXBvcnRlZCBmcm9t
IE9FCkBAIC0zOSwxMCArMzksMTAgQEAgaW5kZXggN2IzMDViMC4uNzBjOGM3NCAxMDA2NDQKICBw
ZGY6IG10b29scy5wZGYKICAlLnBkZjogJS50ZXhpIHN5c2NvbmZkaXIudGV4aQogZGlmZiAtLWdp
dCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggZGUxMDhhOC4uMGZkOWVmMCAx
MDA2NDQKK2luZGV4IDM3ZjBkMDAuLmM5M2NmYjUgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMK
ICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTMzLDYgKzMzLDMzIEBAIEFDX0NBTk9OSUNBTF9UQVJH
RVQKK0BAIC0zNiw2ICszNiwzMyBAQCBBQ19QQVRIX1BST0coSU5TVEFMTF9JTkZPLCBpbnN0YWxs
LWluZm8sICIiKQogIEFDX0NfQ09OU1QKICBBQ19DX0lOTElORQogIApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQ2LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQ3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40Ni5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQ3LmJiCmlu
ZGV4IDExNzM3MTg2NjIuLjcwZDY1Nzk2MjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tdG9vbHMvbXRvb2xzXzQuMC40Ni5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bXRvb2xzL210b29sc180LjAuNDcuYmIKQEAgLTI0LDcgKzI0LDcgQEAgUlJFQ09NTUVORFM6JHtQ
Tn06bGliYy1nbGliYyA9ICJcCiAJZ2xpYmMtZ2NvbnYtaWJtODY2IFwKIAlnbGliYy1nY29udi1p
Ym04NjkgXAogCSIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5YWFkOGRkODU5Zjg4ZmI3Nzg3OTI0
ZWM0NzU5MDE5MmQzYWJmN2JhZDZjODQwNTA5Yzg1NDI5MGQ2YmMxNmMwIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjMxYWEwNjA3OGNjM2Y1MDU5MWI5NWU3MWE5MDljNTZkZDE3OWQ4N2U5Y2JkYzA3
YmY0MzVlNTk1YmQ3Y2M3ZmYiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9tdG9vbHMvbXRv
b2xzLSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vbXRvb2xzLW1ha2VpbmZvLnBh
dGNoIFwKLS0gCjIuNDQuMQoK

--===============2531688135537647671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mtools: PKGV changed from 4.0.46 [default] to 4.0.47 [default]
packages/core2-64-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.46.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.47.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-64-poky-linux/mtools: PV changed from "4.0.46" to "4.0.47"
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.46 [default] to 4.0.47 [default]
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 820048 to 820040 (-0%)
packages/core2-64-poky-linux/mtools/mtools-dbg: PV changed from "4.0.46" to "4.0.47"
packages/core2-64-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.46 [default] to 4.0.47 [default]
packages/core2-64-poky-linux/mtools/mtools-dev: PV changed from "4.0.46" to "4.0.47"
packages/core2-64-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.46 [default] to 4.0.47 [default]
packages/core2-64-poky-linux/mtools/mtools-doc: PKGSIZE changed from 248861 to 249195 (+0%)
packages/core2-64-poky-linux/mtools/mtools-doc: PV changed from "4.0.46" to "4.0.47"
packages/core2-64-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.46 [default] to 4.0.47 [default]
packages/core2-64-poky-linux/mtools/mtools-locale: PV changed from "4.0.46" to "4.0.47"
packages/core2-64-poky-linux/mtools/mtools-src: PKGV changed from 4.0.46 [default] to 4.0.47 [default]
packages/core2-64-poky-linux/mtools/mtools-src: PKGSIZE changed from 598691 to 598928 (+0%)
packages/core2-64-poky-linux/mtools/mtools-src: PV changed from "4.0.46" to "4.0.47"
packages/core2-64-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.46 [default] to 4.0.47 [default]
packages/core2-64-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.46" to "4.0.47"
packages/core2-64-poky-linux/mtools/mtools: PKGV changed from 4.0.46 [default] to 4.0.47 [default]
packages/core2-64-poky-linux/mtools/mtools: PV changed from "4.0.46" to "4.0.47"

--===============2531688135537647671==--

