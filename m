Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web12.27067.1620615220295982106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 19:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vlGO9TyI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620615218; i=@fujitsu.com;
	bh=nrSnYHQ+9991LjAL2GRKyI0nL8wfaudFBnr4FiwyJ28=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vlGO9TyIs6xI2wz25/LvQOZAARO+r1fU1yHNgZDve67uzqjm5nTX87EPn6MyXcSlH
	 6rkNYM5ItOFyfw+2glfxsP53/Nrxlt5gfLW3yfLOejsIES3nBT83KZwfIdp4GFGtYH
	 Qcljdt4V/sww7XkI4CBiO3hhiGZvNNx1tsEyFqlHYyWhSArNoUE4/rifYnWVvI44J7
	 /6655Gkqt9fnNrgHa5weWGwORjx1J+7qQFreDmdg7Iygcw+eozH81Nji6mMJoizzRY
	 2uN4MpQWykz2tslkgk6EbKAo7DrTvTvZiJSiLLdPB8I6yfpG0wHwebVS2z07X2ZH9r
	 xrKpoB2Itqjqg==
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id DB/99-42359-130A8906; Mon, 10 May 2021 02:53:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0TVcMCP
  BoPWluMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnF25naWgucKFZ/fT2FtYDwv08XIxSEkMItJ
  4vPquSwQzm5GieWbjjF2MXJysAnoSpx7vJa9i5GDQ0RAT+LqP1GQsLCAjcSy9TvASlgEVCUe7
  N/NBGLzCnhIXD86FSwuIaAgMeXhe2aIuKDEyZlPWEBsZgEJiYMvXjCDjJQQUJSYPV0eorxCYs
  aMbWwTGHlmIemYhaRjASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0NjXUNdU0O9xCrdRL3UUt3k1Ly
  SokSgpF5iebFecWVuck6KXl5qySZGYBClFDIa72A8+PqD3iFGSQ4mJVHe36HTE4T4kvJTKjMS
  izPii0pzUosPMcpwcChJ8F6ZNyNBSLAoNT21Ii0zBxjQMGkJDh4lEd4ukDRvcUFibnFmOkTqF
  KOilDjvx7lACQGQREZpHlwbLIouMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnQQyniczrw
  Ru+iugxUxAix8smgayuCQRISXVwJS9t+FG4MYHBWpmH/apPumY/XrzvXClV46t67d3auvv//l
  ui9ltZeX34hH+vW+mlDx2X8Hxqva2Y0f9++bsRS8/vBJkSOG0YUtzZfiwr2LnZFm+hRVfZkql
  8+w9vOF85szQC6cF/i3MK1tWu/HK+pp5ukrcrwQSVr6yLTu0e/P2V5US8oFnryizuYmynwmRd
  5SYPN3/rrJHgdxW/SfKiyL/33/gE3/cd32J5nqJkoYZx46sdtCykD718P1En8I/1nbCdw+cWC
  KpuH+2wsekn3aLFv+a9ZBhdaqQNFNrs+rUhJ/GGyLz5t2IrPY7dfnt85yLUYUFDU9nq739Fyh
  a2Phved6fBJ4TFgKf0o4rzBNVYinOSDTUYi4qTgQACoGRWR0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-228.messagelabs.com!1620615216!173370!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30897 invoked from network); 10 May 2021 02:53:37 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-6.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 May 2021 02:53:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14A2rVZL016771
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 03:53:36 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 10 May 2021 03:53:29 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] busybox: upgrade 1.33.0 -> 1.33.1
Date: Mon, 10 May 2021 10:53:06 +0800
Message-ID: <1620615186-72748-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
removed since it is included in 1.33.1

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch | 58 -------------------
 .../{busybox_1.33.0.bb => busybox_1.33.1.bb}  |  3 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
 rename meta/recipes-core/busybox/{busybox_1.33.0.bb => busybox_1.33.1.bb} (92%)

diff --git a/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
deleted file mode 100644
index 67c9f189cc..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From fe791386ebc270219ca00406c9fdadc5130b64ee Mon Sep 17 00:00:00 2001
-From: Samuel Sapalski <samuel.sapalski@nokia.com>
-Date: Wed, 3 Mar 2021 16:31:22 +0100
-Subject: [PATCH] decompress_gunzip: Fix DoS if gzip is corrupt
-
-On certain corrupt gzip files, huft_build will set the error bit on
-the result pointer. If afterwards abort_unzip is called huft_free
-might run into a segmentation fault or an invalid pointer to
-free(p).
-
-In order to mitigate this, we check in huft_free if the error bit
-is set and clear it before the linked list is freed.
-
-Signed-off-by: Samuel Sapalski <samuel.sapalski@nokia.com>
-Signed-off-by: Peter Kaestle <peter.kaestle@nokia.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-Upstream-Status: Backport
-CVE: CVE-2021-28831
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- archival/libarchive/decompress_gunzip.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
-index eb3b64930..e93cd5005 100644
---- a/archival/libarchive/decompress_gunzip.c
-+++ b/archival/libarchive/decompress_gunzip.c
-@@ -220,10 +220,20 @@ static const uint8_t border[] ALIGN1 = {
-  * each table.
-  * t: table to free
-  */
-+#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
-+#define ERR_RET     ((huft_t*)(uintptr_t)1)
- static void huft_free(huft_t *p)
- {
- 	huft_t *q;
- 
-+	/*
-+	 * If 'p' has the error bit set we have to clear it, otherwise we might run
-+	 * into a segmentation fault or an invalid pointer to free(p)
-+	 */
-+	if (BAD_HUFT(p)) {
-+		p = (huft_t*)((uintptr_t)(p) ^ (uintptr_t)(ERR_RET));
-+	}
-+
- 	/* Go through linked list, freeing from the malloced (t[-1]) address. */
- 	while (p) {
- 		q = (--p)->v.t;
-@@ -289,8 +299,6 @@ static unsigned fill_bitbuffer(STATE_PARAM unsigned bitbuffer, unsigned *current
-  * or a valid pointer to a Huffman table, ORed with 0x1 if incompete table
-  * is given: "fixed inflate" decoder feeds us such data.
-  */
--#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
--#define ERR_RET     ((huft_t*)(uintptr_t)1)
- static huft_t* huft_build(const unsigned *b, const unsigned n,
- 			const unsigned s, const struct cp_ext *cp_ext,
- 			unsigned *m)
diff --git a/meta/recipes-core/busybox/busybox_1.33.0.bb b/meta/recipes-core/busybox/busybox_1.33.1.bb
similarity index 92%
rename from meta/recipes-core/busybox/busybox_1.33.0.bb
rename to meta/recipes-core/busybox/busybox_1.33.1.bb
index c334c42000..a71ff530cb 100644
--- a/meta/recipes-core/busybox/busybox_1.33.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.1.bb
@@ -47,9 +47,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://rev.cfg \
            file://pgrep.cfg \
-           file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
            file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.sha256sum] = "d568681c91a85edc6710770cebc1e80e042ad74d305b5c2e6d57a5f3de3b8fbd"
+SRC_URI[tarball.sha256sum] = "12cec6bd2b16d8a9446dd16130f2b92982f1819f6e1c5f5887b6db03f5660d28"
-- 
2.25.1

