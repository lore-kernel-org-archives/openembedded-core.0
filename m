Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 702B37884B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:29:21 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id d189-v6so22504815oib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hCgE6x1XpLokbAzA55Syf/HalOR+bYun27UKMW8tQ58=;
	b=cvWHqWYf5PZ4dBTgeFlT8wLbO62xOMCuw020XQC0Bb6ubsqcGH1kiixoUPEoITKWmC
	oKKCezxJISo8tCFNON4+AF5YlFg51AFmcL0AAULs603WTzl8KDFwwd5jZtihXdNiMVks
	uY/OKo6GZxrTCjz6LAKlBojcusV7rFbcnVc+grVEt+JUFUucrZ1wyZg3eGrvYN93cUvr
	FqCEtqRCl6PnVe8eBdSzipc6sNG3qTMayc/JYFCOJGfhx7BBCNIOQy1ILEMTBIHdfZIO
	zd6D9iAqNegkzny2W+18xTRd8QtpkdDk6dXcJsRdik6Ev+e7GwH0gF6X8kqfaoqmZl/9
	t4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hCgE6x1XpLokbAzA55Syf/HalOR+bYun27UKMW8tQ58=;
	b=E4h9I/0Hj0pPq8tEssPf+50cr3TQwL9hg7wUnLYTDi0R8++pHXvyUrMXAu8AFaosJE
	+1BRWVVP2tPrktWGwpDpl7aHNHliczGL6C/exjTGidEIHyIFCENA6CE9AoWGJ0+1iwTW
	Dzj5jpSrzJewgW/mgMuxLMBAFG/w0K2fSU82YXsKm/sz4wxHmBYoIpvtfQnKHchQiE4F
	FeboieH158kx6+IPC35fLbzS/Cvm55BWZC8+3Xrz/dFbt9sZJXbsoNCY4Qh3RZmMropQ
	uyFHu6I1d3mR9qy3GdAvJjIBgYTeo/DJLNG93cb7V42oBtlLY/U2hrLt4+Dws8G9DXYw
	w0Vw==
X-Gm-Message-State: AOUpUlFdY/C5oqaJ0woLWKePVS7ACvpxTaVfG9MsHD5X5qSrhFVP2y6C
	udk3m2FYC5ZNJjOC3ysFS+c=
X-Google-Smtp-Source: AAOMgpdWA+MmV2zwS0VAPNsidgQwGMLXmyX0Pilt6FSCU6eatLg8ltDOyH6O3ASF6IzBPr2PsvXAOw==
X-Received: by 2002:aca:a6d4:: with SMTP id
	t81-v6mr10839907oij.113.1533565762495; 
	Mon, 06 Aug 2018 07:29:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	j193-v6sm13645810oih.55.2018.08.06.07.29.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:29:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 07:29:09 -0700
Message-Id: <1533565758-2467-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
References: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
Subject: [SUMO][PATCH 03/12] binutls: Security fix CVE-2018-6872
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2018 14:29:21 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.30.inc   |  1 +
 .../binutils/binutils/CVE-2018-6872.patch          | 50 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-6872.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
index 1952d46..23625d1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -37,6 +37,7 @@ SRC_URI = "\
      file://0015-sync-with-OE-libtool-changes.patch \
      file://CVE-2018-8945.patch \
      file://CVE-2018-7643.patch \
+     file://CVE-2018-6872.patch \ 
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-6872.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-6872.patch
new file mode 100644
index 0000000..2ef36c2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-6872.patch
@@ -0,0 +1,50 @@
+From d895ef77ffc94e02e748856c2ab54f5bb8cc867e Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 9 Feb 2018 09:28:45 +0000
+Subject: [PATCH] Import patch from mainline to fix possible seg-fault whilst
+ parsing corrupt ELF notes with extravagent alignments.
+
+	PR 22788
+	* elf.c (elf_parse_notes): Reject notes with excessuively large
+	alignments.
+
+Upstream-Status: Backport
+Affects: Binutils <= 2.30
+CVE: CVE-2018-6872
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 9 +++++++++
+ bfd/elf.c     | 2 ++
+ 2 files changed, 11 insertions(+)
+
+Index: git/bfd/elf.c
+===================================================================
+--- git.orig/bfd/elf.c
++++ git/bfd/elf.c
+@@ -11020,6 +11020,8 @@ elf_parse_notes (bfd *abfd, char *buf, s
+      align is less than 4, we use 4 byte alignment.   */
+   if (align < 4)
+     align = 4;
++  if (align != 4 && align != 8)
++    return FALSE;
+ 
+   p = buf;
+   while (p < buf + size)
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,12 @@
++2018-02-09  Nick Clifton  <nickc@redhat.com>
++
++       Import patch from mainline:
++       2018-02-08  Nick Clifton  <nickc@redhat.com>
++
++       PR 22788
++       * elf.c (elf_parse_notes): Reject notes with excessuively large
++       alignments.
++
+ 2018-03-01  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 22905
-- 
2.7.4


