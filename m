Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454E2C369BD
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.18048.1743511394239408831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=N/Gh8V3J;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=myBNyUWa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195f1609507-e98ac444-25ad-41de-b42d-091f7c69b4c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gp58PKzf+EeKPU7s/AAT/JOJDV3JKXgacpjUlPbHjng=;
	b=N/Gh8V3JzUHtg3JYSYPbZnUC2ZtaVs6K/vtFXEG53GLilFWWrf5PmBC7FY2G0mzH
	yWZ2IzkoEIFoAkrlSJF4mTZFsgOMiboXuKaNfHXumpvIX+OEGlNY1ZH5IXaHKTWGrS2
	+gMO/2U2AwVW4vvKL0ZeIA3dDtVV5Baqdo0GqOL0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gp58PKzf+EeKPU7s/AAT/JOJDV3JKXgacpjUlPbHjng=;
	b=myBNyUWakeiJKERVSuZ4+4WPbBGcsznZi9uPxtVem0KDrbfSqsVSm51voveUi4ZO
	2kHN03qOarcBmfGjVv/gY/S/Tu+vv7JqZZgw+Dr1ctwrOveKhShrePDF7hQckef6HDx
	yCCcS93Y7F3VvWzWid/N/zMjStzorpU4XDkZKsfk=
Content-Type: multipart/mixed; boundary="===============4160726979350891442=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.14 SUCCEEDED
Message-ID: <01010195f1609507-e98ac444-25ad-41de-b42d-091f7c69b4c7-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214049

--===============4160726979350891442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.13-6.14.patch
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
From 8a02289fdca3a76bd6adcacd694ec158e496bbf0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 07:39:56 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.13 -> 6.14

---
 ...y-to-specify-where-python-modules-ar.patch |  6 +--
 ...dd-break-to-case-BTRFS_COMPRESS_NONE.patch | 40 -------------------
 ...trfs-tools_6.13.bb => btrfs-tools_6.14.bb} |  3 +-
 3 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.13.bb => btrfs-tools_6.14.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 59ea5a66da..2cd66d2722 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 76e635a56c5973671da3a8a2fd4fc32e823bf8c9 Mon Sep 17 00:00:00 2001
+From 030ec81c0dac1e067faf49924d5631bb22ccc90d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 2f8d2fa0..c760e5ae 100644
+index 7e36aa42..edff7d5b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -985,7 +985,7 @@ endif
+@@ -996,7 +996,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
deleted file mode 100644
index 750ba83074..0000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ae0743dea3498429fce144e75c8b5b6eeed6f490 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Tue, 11 Mar 2025 05:24:54 +0000
-Subject: [PATCH] mkfs: add break to case BTRFS_COMPRESS_NONE
-
-when compression null, always through error "lzo support not compiled in"
-
-This bug was imported by following commit:
-----------------------------------------------------
-commit c6d24a363daed6501d13d9125c560387e2d755ca
-Author: Mark Harmstone <maharmstone@fb.com>
-Date:   Thu Dec 12 20:36:55 2024 +0000
-
-     btrfs-progs: mkfs: add lzo to --compress option
-
-     Allow --compress to work with lzo.
-----------------------------------------------------
-
-Upstream-Status: Submitted [https://github.com/kdave/btrfs-progs/pull/967]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- mkfs/rootdir.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/mkfs/rootdir.c b/mkfs/rootdir.c
-index 1927394..5f4cfb9 100644
---- a/mkfs/rootdir.c
-+++ b/mkfs/rootdir.c
-@@ -1654,6 +1654,7 @@ int btrfs_mkfs_fill_dir(struct btrfs_trans_handle *trans, const char *source_dir
- 
- 	switch (compression) {
- 	case BTRFS_COMPRESS_NONE:
-+                break;
- 	case BTRFS_COMPRESS_LZO:
- #if !COMPRESSION_LZO
- 		error("lzo support not compiled in");
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
index d73d86ba8a..f3de28910c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
@@ -17,9 +17,8 @@ DEPENDS = "util-linux zlib"
 
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch \
            "
-SRCREV = "26e4d9174c70aac0e53c3b5de55cf159f8d9397f"
+SRCREV = "5ad147c9ec00e657393c85b195c9bcc0f4c35a54"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.47.1


--===============4160726979350891442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.13-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.14-py3.13.egg-info

--===============4160726979350891442==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.13-6.14.patch"

RnJvbSA4YTAyMjg5ZmRjYTNhNzZiZDZhZGNhY2Q2OTRlYzE1OGU0OTZiYmYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNzozOTo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMTMgLT4gNi4xNAoKLS0tCiAuLi55LXRvLXNwZWNpZnktd2hl
cmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggfCAgNiArLS0KIC4uLmRkLWJyZWFrLXRvLWNhc2Ut
QlRSRlNfQ09NUFJFU1NfTk9ORS5wYXRjaCB8IDQwIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLnRy
ZnMtdG9vbHNfNi4xMy5iYiA9PiBidHJmcy10b29sc182LjE0LmJifSB8ICAzICstCiAzIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEt
bWtmcy1hZGQtYnJlYWstdG8tY2FzZS1CVFJGU19DT01QUkVTU19OT05FLnBhdGNoCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29sc182LjEzLmJiID0+
IGJ0cmZzLXRvb2xzXzYuMTQuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8t
c3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNw
ZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKaW5kZXggNTllYTVhNjZkYS4uMmNk
NjZkMjcyMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0
cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24t
bW9kdWxlcy1hci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMv
YnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhv
bi1tb2R1bGVzLWFyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3NmU2MzVhNTZjNTk3MzY3
MWRhM2E4YTJmZDRmYzMyZTgyM2JmOGM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAw
MzBlYzgxYzBkYWMxZTA2N2ZhZjQ5OTI0ZDU2MzFiYjIyY2NjOTBkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CiBEYXRlOiBXZWQsIDIzIE1heSAyMDE4IDIxOjIwOjM1ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hd
IEFkZCBhIHBvc3NpYmlsaXR5IHRvIHNwZWNpZnkgd2hlcmUgcHl0aG9uIG1vZHVsZXMgYXJlCkBA
IC0xMSwxMCArMTEsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCi1pbmRleCAyZjhk
MmZhMC4uYzc2MGU1YWUgMTAwNjQ0CitpbmRleCA3ZTM2YWE0Mi4uZWRmZjdkNWIgMTAwNjQ0CiAt
LS0gYS9NYWtlZmlsZQogKysrIGIvTWFrZWZpbGUKLUBAIC05ODUsNyArOTg1LDcgQEAgZW5kaWYK
K0BAIC05OTYsNyArOTk2LDcgQEAgZW5kaWYKICBpZmVxICgkKFBZVEhPTl9CSU5ESU5HUyksMSkK
ICBpbnN0YWxsX3B5dGhvbjogbGliYnRyZnN1dGlsX3B5dGhvbgogIAkkKFEpY2QgbGliYnRyZnN1
dGlsL3B5dGhvbjsgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRv
b2xzL2J0cmZzLXRvb2xzLzAwMDEtbWtmcy1hZGQtYnJlYWstdG8tY2FzZS1CVFJGU19DT01QUkVT
U19OT05FLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRv
b2xzLzAwMDEtbWtmcy1hZGQtYnJlYWstdG8tY2FzZS1CVFJGU19DT01QUkVTU19OT05FLnBhdGNo
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA3NTBiYTgzMDc0Li4wMDAwMDAwMDAwCi0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLW1r
ZnMtYWRkLWJyZWFrLXRvLWNhc2UtQlRSRlNfQ09NUFJFU1NfTk9ORS5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDQwICswLDAgQEAKLUZyb20gYWUwNzQzZGVhMzQ5ODQyOWZjZTE0NGU3NWM4YjVi
NmVlZWQ2ZjQ5MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFdhbmcgTWluZ3l1IDx3
YW5nbXlAZnVqaXRzdS5jb20+Ci1EYXRlOiBUdWUsIDExIE1hciAyMDI1IDA1OjI0OjU0ICswMDAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIG1rZnM6IGFkZCBicmVhayB0byBjYXNlIEJUUkZTX0NPTVBSRVNT
X05PTkUKLQotd2hlbiBjb21wcmVzc2lvbiBudWxsLCBhbHdheXMgdGhyb3VnaCBlcnJvciAibHpv
IHN1cHBvcnQgbm90IGNvbXBpbGVkIGluIgotCi1UaGlzIGJ1ZyB3YXMgaW1wb3J0ZWQgYnkgZm9s
bG93aW5nIGNvbW1pdDoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KLWNvbW1pdCBjNmQyNGEzNjNkYWVkNjUwMWQxM2Q5MTI1YzU2MDM4N2UyZDc1
NWNhCi1BdXRob3I6IE1hcmsgSGFybXN0b25lIDxtYWhhcm1zdG9uZUBmYi5jb20+Ci1EYXRlOiAg
IFRodSBEZWMgMTIgMjA6MzY6NTUgMjAyNCArMDAwMAotCi0gICAgIGJ0cmZzLXByb2dzOiBta2Zz
OiBhZGQgbHpvIHRvIC0tY29tcHJlc3Mgb3B0aW9uCi0KLSAgICAgQWxsb3cgLS1jb21wcmVzcyB0
byB3b3JrIHdpdGggbHpvLgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRo
dWIuY29tL2tkYXZlL2J0cmZzLXByb2dzL3B1bGwvOTY3XQotCi1TaWduZWQtb2ZmLWJ5OiBXYW5n
IE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPgotLS0tCi0gbWtmcy9yb290ZGlyLmMgfCAxICsK
LSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKLQotZGlmZiAtLWdpdCBhL21rZnMvcm9v
dGRpci5jIGIvbWtmcy9yb290ZGlyLmMKLWluZGV4IDE5MjczOTQuLjVmNGNmYjkgMTAwNjQ0Ci0t
LS0gYS9ta2ZzL3Jvb3RkaXIuYwotKysrIGIvbWtmcy9yb290ZGlyLmMKLUBAIC0xNjU0LDYgKzE2
NTQsNyBAQCBpbnQgYnRyZnNfbWtmc19maWxsX2RpcihzdHJ1Y3QgYnRyZnNfdHJhbnNfaGFuZGxl
ICp0cmFucywgY29uc3QgY2hhciAqc291cmNlX2RpcgotIAotIAlzd2l0Y2ggKGNvbXByZXNzaW9u
KSB7Ci0gCWNhc2UgQlRSRlNfQ09NUFJFU1NfTk9ORToKLSsgICAgICAgICAgICAgICAgYnJlYWs7
Ci0gCWNhc2UgQlRSRlNfQ09NUFJFU1NfTFpPOgotICNpZiAhQ09NUFJFU1NJT05fTFpPCi0gCQll
cnJvcigibHpvIHN1cHBvcnQgbm90IGNvbXBpbGVkIGluIik7Ci0tLSAKLTIuNDMuMAotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4x
My5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjE0
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9idHJmcy10b29scy9idHJmcy10b29sc182LjEzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xNC5iYgppbmRleCBkNzNkODZiYThh
Li5mM2RlMjg5MTBjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9v
bHMvYnRyZnMtdG9vbHNfNi4xMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMt
dG9vbHMvYnRyZnMtdG9vbHNfNi4xNC5iYgpAQCAtMTcsOSArMTcsOCBAQCBERVBFTkRTID0gInV0
aWwtbGludXggemxpYiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2tkYXZlL2J0cmZz
LXByb2dzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxl
cy1hci5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLW1rZnMtYWRkLWJyZWFrLXRvLWNh
c2UtQlRSRlNfQ09NUFJFU1NfTk9ORS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICIy
NmU0ZDkxNzRjNzBhYWMwZTUzYzNiNWRlNTVjZjE1OWY4ZDkzOTdmIgorU1JDUkVWID0gIjVhZDE0
N2M5ZWMwMGU2NTczOTNjODViMTk1YzliY2MwZjRjMzVhNTQiCiBTID0gIiR7V09SS0RJUn0vZ2l0
IgogCiBQQUNLQUdFQ09ORklHID8/PSAiIFwKLS0gCjIuNDcuMQoK

--===============4160726979350891442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.13" to "6.14"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 26978584 to 27003976 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.13 [default] to 6.14 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.13" to "6.14"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 166883 to 166886 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.13 [default] to 6.14 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.13" to "6.14"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.13 [default] to 6.14 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.13" to "6.14"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.13 [default] to 6.14 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.13" to "6.14"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4215079 to 4229319 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.13 [default] to 6.14 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.13" to "6.14"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.13 [default] to 6.14 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.13" to "6.14"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5860772 to 5869039 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.13 [default] to 6.14 [default]
packages/core2-64-poky-linux/btrfs-tools: SRC_URI changed from "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch file://0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch" to "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.13" to "6.14"
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.13 [default] to 6.14 [default]
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.13-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.14-py3.13.egg-info

--===============4160726979350891442==--

