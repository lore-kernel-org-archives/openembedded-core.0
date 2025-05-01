Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1247C54757
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1774.1746113609447995714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Xn5BdwBy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kAt0cqZz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7ba38b-6712261c-413c-4481-bdb0-cc33fb2c4175-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5V5V/40zUZr3fWS3zplJx1TkFyWg9g/P15TJ+DFU0vk=;
	b=Xn5BdwByIZXhosRD/zDjwSIrbF/nYmPo4/IqYvbUPEB9Hji4AEiAr/5t4lAGtzhj
	1UCY3dqD0zGOuJHp+xt7u7XVoV5VBJq7mnNFEzIJ8zqiA4WvMyQK1L2iTR9v9gXkcDa
	iXmFAP8Gfs6JHrkTycb9fd5mSdkBnMp8rGeFx534=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5V5V/40zUZr3fWS3zplJx1TkFyWg9g/P15TJ+DFU0vk=;
	b=kAt0cqZzunZ+38TfwQYZ2ncy+Hb1L7zmx0hv0TAyEa6wriHmxCKPopexYwLn6FZC
	5ouxXVajF0S40FMPD99hFammBuUfWwP+UxptzzFZRsB1xOFPzL530EpxtU69ims+pDi
	bBptBNVTOY6UI01GEnZf+wo1sZSVTNwv0aZNyMtQ=
Content-Type: multipart/mixed; boundary="===============8956081906812191495=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kexec-tools: upgrading to 2.0.31 SUCCEEDED
Message-ID: <010101968c7ba38b-6712261c-413c-4481-bdb0-cc33fb2c4175-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215873

--===============8956081906812191495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kexec-tools* to *2.0.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kexec-tools-upgrade-2.0.30-2.0.31.patch
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
From 63a29b6dc647b17c9fb65688f759f21abfdbda88 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 13:11:50 +0000
Subject: [PATCH] kexec-tools: upgrade 2.0.30 -> 2.0.31

---
 ...4-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch | 2 +-
 ...0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 8 ++++----
 .../0001-powerpc-change-the-memory-size-limit.patch       | 2 +-
 .../0002-purgatory-Pass-r-directly-to-linker.patch        | 3 +--
 .../kexec/kexec-tools/0005-Disable-PIE-during-link.patch  | 3 +--
 .../{kexec-tools_2.0.30.bb => kexec-tools_2.0.31.bb}      | 2 +-
 6 files changed, 9 insertions(+), 11 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.30.bb => kexec-tools_2.0.31.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
index ee731cea4b..1e7cdd4a2e 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
@@ -1,4 +1,4 @@
-From 9e95f8933bded10fdd664fc95492825347ec59a7 Mon Sep 17 00:00:00 2001
+From 67cdc1166e4b448721460e64192230def44ecd06 Mon Sep 17 00:00:00 2001
 From: Alexander Kamensky <alexander.kamensky42@gmail.com>
 Date: Thu, 12 Nov 2020 12:56:46 -0800
 Subject: [PATCH] arm64: kexec: disabled check if kaslr-seed dtb property was
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
index 8dc5fed765..0c1d95edc5 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
@@ -1,4 +1,4 @@
-From 1a09bf71c2f541c2cfb44a00661051597bbd0b76 Mon Sep 17 00:00:00 2001
+From a077f3ac486b0d2598d1d491bbfca31271cd8171 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 6 Aug 2024 21:42:43 -0700
 Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly
@@ -18,10 +18,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/kexec/kexec.c b/kexec/kexec.c
-index 4f51987..8f02595 100644
+index 6bf12d7..2f8e7cc 100644
 --- a/kexec/kexec.c
 +++ b/kexec/kexec.c
-@@ -60,6 +60,10 @@
+@@ -61,6 +61,10 @@
  #define KEXEC_LOADED_PATH "/sys/kernel/kexec_loaded"
  #define KEXEC_CRASH_LOADED_PATH "/sys/kernel/kexec_crash_loaded"
  
@@ -32,7 +32,7 @@ index 4f51987..8f02595 100644
  unsigned long long mem_min = 0;
  unsigned long long mem_max = ULONG_MAX;
  unsigned long elfcorehdrsz = 0;
-@@ -657,7 +661,7 @@ static int copybuf_memfd(const char *kernel_buf, size_t size)
+@@ -661,7 +665,7 @@ static int copybuf_memfd(const char *kernel_buf, size_t size)
  {
  	int fd, count;
  
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
index 029650f35c..a60d3d0063 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
@@ -1,4 +1,4 @@
-From 211cae4b6a02a4d9d37bfcd76f3702696e095fc3 Mon Sep 17 00:00:00 2001
+From 08065799232f4ba226096bc80a7b14fe696e70f1 Mon Sep 17 00:00:00 2001
 From: Quanyang Wang <quanyang.wang@windriver.com>
 Date: Tue, 16 Jun 2015 12:59:57 +0800
 Subject: [PATCH] powerpc: change the memory size limit
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
index a537ac2f0b..71ae062f10 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
@@ -1,4 +1,4 @@
-From e5bc9fbd6029057a4e3815a5326af5bd83a450e6 Mon Sep 17 00:00:00 2001
+From 268fd1dfa7abc69cde7a553325a89f0cbeabe199 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Sep 2015 07:59:45 +0000
 Subject: [PATCH] purgatory: Pass -r directly to linker
@@ -10,7 +10,6 @@ unfiltered
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
-
 ---
  purgatory/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
index 6a21744ac1..e70493a9d2 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
@@ -1,4 +1,4 @@
-From 494888bcc3bbf070dfce1b2686ee34c8619aa33d Mon Sep 17 00:00:00 2001
+From b5563c1d17de150bff6a259c933cf7daab4c449d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 11:18:49 -0700
 Subject: [PATCH] Disable PIE during link
@@ -9,7 +9,6 @@ just need to match it with linker flags
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  purgatory/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.30.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.30.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
index 6a67427888..d824859686 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.30.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "bb6b39bbe00099219e95ab34b25ea4348e1a95964eefc45c1e6fe32362ac9021"
+SRC_URI[sha256sum] = "ddaaa65b02b4f8aa9222586b1f26565b93a4baeffd35bcbd523f15fae7aa4897"
 
 inherit autotools update-rc.d systemd
 
-- 
2.47.1


--===============8956081906812191495==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kexec-tools-upgrade-2.0.30-2.0.31.patch"

RnJvbSA2M2EyOWI2ZGM2NDdiMTdjOWZiNjU2ODhmNzU5ZjIxYWJmZGJkYTg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMzoxMTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
eGVjLXRvb2xzOiB1cGdyYWRlIDIuMC4zMCAtPiAyLjAuMzEKCi0tLQogLi4uNC1rZXhlYy1kaXNh
YmxlZC1jaGVjay1pZi1rYXNsci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoIHwgMiArLQogLi4uMDAw
MS1rZXhlYy5jLWFkZC1NRkRfTk9FWEVDX1NFQUwtZmxhZy1leHBsaWNpdGx5LnBhdGNoIHwgOCAr
KysrLS0tLQogLi4uLzAwMDEtcG93ZXJwYy1jaGFuZ2UtdGhlLW1lbW9yeS1zaXplLWxpbWl0LnBh
dGNoICAgICAgIHwgMiArLQogLi4uLzAwMDItcHVyZ2F0b3J5LVBhc3Mtci1kaXJlY3RseS10by1s
aW5rZXIucGF0Y2ggICAgICAgIHwgMyArLS0KIC4uLi9rZXhlYy9rZXhlYy10b29scy8wMDA1LURp
c2FibGUtUElFLWR1cmluZy1saW5rLnBhdGNoICB8IDMgKy0tCiAuLi4ve2tleGVjLXRvb2xzXzIu
MC4zMC5iYiA9PiBrZXhlYy10b29sc18yLjAuMzEuYmJ9ICAgICAgfCAyICstCiA2IGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWtlcm5lbC9rZXhlYy97a2V4ZWMtdG9vbHNfMi4wLjMwLmJiID0+IGtleGVjLXRvb2xzXzIu
MC4zMS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tl
eGVjLXRvb2xzLzAwMDEtYXJtNjQta2V4ZWMtZGlzYWJsZWQtY2hlY2staWYta2FzbHItc2VlZC1k
dGItcHJvcGVydC5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMv
MDAwMS1hcm02NC1rZXhlYy1kaXNhYmxlZC1jaGVjay1pZi1rYXNsci1zZWVkLWR0Yi1wcm9wZXJ0
LnBhdGNoCmluZGV4IGVlNzMxY2VhNGIuLjFlN2NkZDRhMmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1hcm02NC1rZXhlYy1kaXNhYmxlZC1j
aGVjay1pZi1rYXNsci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1r
ZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1hcm02NC1rZXhlYy1kaXNhYmxlZC1jaGVjay1p
Zi1rYXNsci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ZTk1
Zjg5MzNiZGVkMTBmZGQ2NjRmYzk1NDkyODI1MzQ3ZWM1OWE3IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA2N2NkYzExNjZlNGI0NDg3MjE0NjBlNjQxOTIyMzBkZWY0NGVjZDA2IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbWVuc2t5IDxhbGV4YW5kZXIu
a2FtZW5za3k0MkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDEyIE5vdiAyMDIwIDEyOjU2OjQ2IC0w
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFybTY0OiBrZXhlYzogZGlzYWJsZWQgY2hlY2sgaWYga2Fz
bHItc2VlZCBkdGIgcHJvcGVydHkgd2FzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVs
L2tleGVjL2tleGVjLXRvb2xzLzAwMDEta2V4ZWMuYy1hZGQtTUZEX05PRVhFQ19TRUFMLWZsYWct
ZXhwbGljaXRseS5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMv
MDAwMS1rZXhlYy5jLWFkZC1NRkRfTk9FWEVDX1NFQUwtZmxhZy1leHBsaWNpdGx5LnBhdGNoCmlu
ZGV4IDhkYzVmZWQ3NjUuLjBjMWQ5NWVkYzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1rZXhlYy5jLWFkZC1NRkRfTk9FWEVDX1NFQUwtZmxh
Zy1leHBsaWNpdGx5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMt
dG9vbHMvMDAwMS1rZXhlYy5jLWFkZC1NRkRfTk9FWEVDX1NFQUwtZmxhZy1leHBsaWNpdGx5LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxYTA5YmY3MWMyZjU0MWMyY2ZiNDRhMDA2NjEwNTE1
OTdiYmQwYjc2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMDc3ZjNhYzQ4NmIwZDI1
OThkMWQ0OTFiYmZjYTMxMjcxY2Q4MTcxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Q2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCA2IEF1ZyAyMDI0IDIx
OjQyOjQzIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGtleGVjLmM6IGFkZCBNRkRfTk9FWEVDX1NF
QUwgZmxhZyBleHBsaWNpdGx5CkBAIC0xOCwxMCArMTgsMTAgQEAgU2lnbmVkLW9mZi1ieTogQ2hl
biBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2tleGVjL2tleGVjLmMgYi9rZXhl
Yy9rZXhlYy5jCi1pbmRleCA0ZjUxOTg3Li44ZjAyNTk1IDEwMDY0NAoraW5kZXggNmJmMTJkNy4u
MmY4ZTdjYyAxMDA2NDQKIC0tLSBhL2tleGVjL2tleGVjLmMKICsrKyBiL2tleGVjL2tleGVjLmMK
LUBAIC02MCw2ICs2MCwxMCBAQAorQEAgLTYxLDYgKzYxLDEwIEBACiAgI2RlZmluZSBLRVhFQ19M
T0FERURfUEFUSCAiL3N5cy9rZXJuZWwva2V4ZWNfbG9hZGVkIgogICNkZWZpbmUgS0VYRUNfQ1JB
U0hfTE9BREVEX1BBVEggIi9zeXMva2VybmVsL2tleGVjX2NyYXNoX2xvYWRlZCIKICAKQEAgLTMy
LDcgKzMyLDcgQEAgaW5kZXggNGY1MTk4Ny4uOGYwMjU5NSAxMDA2NDQKICB1bnNpZ25lZCBsb25n
IGxvbmcgbWVtX21pbiA9IDA7CiAgdW5zaWduZWQgbG9uZyBsb25nIG1lbV9tYXggPSBVTE9OR19N
QVg7CiAgdW5zaWduZWQgbG9uZyBlbGZjb3JlaGRyc3ogPSAwOwotQEAgLTY1Nyw3ICs2NjEsNyBA
QCBzdGF0aWMgaW50IGNvcHlidWZfbWVtZmQoY29uc3QgY2hhciAqa2VybmVsX2J1Ziwgc2l6ZV90
IHNpemUpCitAQCAtNjYxLDcgKzY2NSw3IEBAIHN0YXRpYyBpbnQgY29weWJ1Zl9tZW1mZChjb25z
dCBjaGFyICprZXJuZWxfYnVmLCBzaXplX3Qgc2l6ZSkKICB7CiAgCWludCBmZCwgY291bnQ7CiAg
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEt
cG93ZXJwYy1jaGFuZ2UtdGhlLW1lbW9yeS1zaXplLWxpbWl0LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLXBvd2VycGMtY2hhbmdlLXRoZS1tZW1vcnkt
c2l6ZS1saW1pdC5wYXRjaAppbmRleCAwMjk2NTBmMzVjLi5hNjBkM2QwMDYzIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEtcG93ZXJwYy1jaGFu
Z2UtdGhlLW1lbW9yeS1zaXplLWxpbWl0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwv
a2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1wb3dlcnBjLWNoYW5nZS10aGUtbWVtb3J5LXNpemUtbGlt
aXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDIxMWNhZTRiNmEwMmE0ZDlkMzdiZmNkNzZm
MzcwMjY5NmUwOTVmYzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA4MDY1Nzk5MjMy
ZjRiYTIyNjA5NmJjODBhN2IxNGZlNjk2ZTcwZjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBRdWFueWFuZyBXYW5nIDxxdWFueWFuZy53YW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBU
dWUsIDE2IEp1biAyMDE1IDEyOjU5OjU3ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBvd2VycGM6
IGNoYW5nZSB0aGUgbWVtb3J5IHNpemUgbGltaXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1r
ZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMi1wdXJnYXRvcnktUGFzcy1yLWRpcmVjdGx5LXRv
LWxpbmtlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAw
Mi1wdXJnYXRvcnktUGFzcy1yLWRpcmVjdGx5LXRvLWxpbmtlci5wYXRjaAppbmRleCBhNTM3YWMy
ZjBiLi43MWFlMDYyZjEwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tl
eGVjLXRvb2xzLzAwMDItcHVyZ2F0b3J5LVBhc3Mtci1kaXJlY3RseS10by1saW5rZXIucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAyLXB1cmdhdG9y
eS1QYXNzLXItZGlyZWN0bHktdG8tbGlua2VyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBl
NWJjOWZiZDYwMjkwNTdhNGUzODE1YTUzMjZhZjViZDgzYTQ1MGU2IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAyNjhmZDFkZmE3YWJjNjljZGU3YTU1MzMyNWE4OWYwY2JlYWJlMTk5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIERhdGU6IE1vbiwgNyBTZXAgMjAxNSAwNzo1OTo0NSArMDAwMAogU3ViamVjdDogW1BBVENI
XSBwdXJnYXRvcnk6IFBhc3MgLXIgZGlyZWN0bHkgdG8gbGlua2VyCkBAIC0xMCw3ICsxMCw2IEBA
IHVuZmlsdGVyZWQKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+
CiAKIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwotCiAtLS0KICBwdXJnYXRvcnkvTWFrZWZpbGUg
fCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDUtRGlz
YWJsZS1QSUUtZHVyaW5nLWxpbmsucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tl
eGVjLXRvb2xzLzAwMDUtRGlzYWJsZS1QSUUtZHVyaW5nLWxpbmsucGF0Y2gKaW5kZXggNmEyMTc0
NGFjMS4uZTcwNDkzYTlkMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9r
ZXhlYy10b29scy8wMDA1LURpc2FibGUtUElFLWR1cmluZy1saW5rLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwNS1EaXNhYmxlLVBJRS1kdXJpbmct
bGluay5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDk0ODg4YmNjM2JiZjA3MGRmY2UxYjI2
ODZlZTM0Yzg2MTlhYTMzZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjU1NjNjMWQx
N2RlMTUwYmZmNmEyNTljOTMzY2Y3ZGFhYjRjNDQ5ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEwIEp1biAy
MDE3IDExOjE4OjQ5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgUElFIGR1cmluZyBs
aW5rCkBAIC05LDcgKzksNiBAQCBqdXN0IG5lZWQgdG8gbWF0Y2ggaXQgd2l0aCBsaW5rZXIgZmxh
Z3MKIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgotCiAtLS0KICBwdXJnYXRvcnkvTWFrZWZpbGUgfCAyICstCiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzXzIuMC4zMC5iYiBiL21ldGEv
cmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHNfMi4wLjMxLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHNf
Mi4wLjMwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xz
XzIuMC4zMS5iYgppbmRleCA2YTY3NDI3ODg4Li5kODI0ODU5Njg2IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzXzIuMC4zMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzXzIuMC4zMS5iYgpAQCAtMjAsNyArMjAsNyBA
QCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMva2VybmVsL2tleGVj
L2tleGVjLXRvb2xzLSR7UFZ9LnRhci5negogICAgICAgICAgICBmaWxlOi8vMDAwMS1rZXhlYy5j
LWFkZC1NRkRfTk9FWEVDX1NFQUwtZmxhZy1leHBsaWNpdGx5LnBhdGNoIFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmI2YjM5YmJlMDAwOTkyMTllOTVhYjM0YjI1ZWE0
MzQ4ZTFhOTU5NjRlZWZjNDVjMWU2ZmUzMjM2MmFjOTAyMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJkZGFhYTY1YjAyYjRmOGFhOTIyMjU4NmIxZjI2NTY1YjkzYTRiYWVmZmQzNWJjYmQ1MjNmMTVm
YWU3YWE0ODk3IgogCiBpbmhlcml0IGF1dG90b29scyB1cGRhdGUtcmMuZCBzeXN0ZW1kCiAKLS0g
CjIuNDcuMQoK

--===============8956081906812191495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kexec-tools/kdump: PKGV changed from 2.0.30 [default] to 2.0.31 [default]
packages/core2-64-poky-linux/kexec-tools/kdump: PV changed from "2.0.30" to "2.0.31"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dbg: PKGV changed from 2.0.30 [default] to 2.0.31 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dbg: PV changed from "2.0.30" to "2.0.31"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dbg: PKGSIZE changed from 630144 to 633656 (+1%)
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dev: PKGV changed from 2.0.30 [default] to 2.0.31 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dev: PV changed from "2.0.30" to "2.0.31"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-doc: PKGV changed from 2.0.30 [default] to 2.0.31 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-doc: PV changed from "2.0.30" to "2.0.31"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-locale: PKGV changed from 2.0.30 [default] to 2.0.31 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-locale: PV changed from "2.0.30" to "2.0.31"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-src: PKGV changed from 2.0.30 [default] to 2.0.31 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-src: PV changed from "2.0.30" to "2.0.31"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-staticdev: PKGV changed from 2.0.30 [default] to 2.0.31 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-staticdev: PV changed from "2.0.30" to "2.0.31"
packages/core2-64-poky-linux/kexec-tools/kexec-tools: PKGV changed from 2.0.30 [default] to 2.0.31 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools: PV changed from "2.0.30" to "2.0.31"
packages/core2-64-poky-linux/kexec-tools/kexec: PKGV changed from 2.0.30 [default] to 2.0.31 [default]
packages/core2-64-poky-linux/kexec-tools/kexec: PV changed from "2.0.30" to "2.0.31"
packages/core2-64-poky-linux/kexec-tools/kexec: PKGSIZE changed from 200136 to 200200 (+0%)
packages/core2-64-poky-linux/kexec-tools: PKGV changed from 2.0.30 [default] to 2.0.31 [default]
packages/core2-64-poky-linux/kexec-tools: PV changed from "2.0.30" to "2.0.31"
packages/core2-64-poky-linux/kexec-tools: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.30.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch" to "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.31.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch"
packages/core2-64-poky-linux/kexec-tools/vmcore-dmesg: PKGV changed from 2.0.30 [default] to 2.0.31 [default]
packages/core2-64-poky-linux/kexec-tools/vmcore-dmesg: PV changed from "2.0.30" to "2.0.31"

--===============8956081906812191495==--

