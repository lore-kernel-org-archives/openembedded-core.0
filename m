Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2F8C35294
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.2628.1650364304763358063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 03:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uJwfCskg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650364303; i=@fujitsu.com;
	bh=7hA0T55k8kat3JfcCLjRK1wBRnv4L6L0oy6oTmy74iY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uJwfCskgFPUJdwCdfui5JRU61+5PPDMVYCKeym+ajrs/1L+9gWOiPAKTSakExpiA4
	 jLUBvOb/Pi/wjocfFkw6G70NKfkV9jTKtUBJHFwdhTNTSNtrPCTfOhbBcgDyEKBwDF
	 icgx9AZrbCvMsu/rhCaSqSmI/Ib3lbDJiim2HCc/Lat2NQXjUZMUD7+MznV5DU7A9Z
	 qdDUrqfBrEAOUkQacCfz7FxSOcovZ8Mzmrx0vgSSBo7eCId7M3Y36bv8FjoR/vqFeo
	 HDfTfXg6KMitIxsMs+RCNEklS8Ue1LwzjZz/hEjwlKYzKdHf4T5VvRzjop1BoAX+CV
	 54zX4D3R6obeQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MxRbevPy7
  JYFaLpsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtG75D9jwUfxit2btzI2MO4V7WLk4hASmMUk
  8eH3PxYIZw+jxNsf91m7GDk52ATUJKbfugFkc3CICOhJXP0nChJmFlCRePG7hx3EFhZwkJh+/
  BALiM0ioCrx4M9UMJtXwEni0pMVbCC2hICCxJSH75lBbE4BZ4nDPU1gvUJANZu/97JC1AtKnJ
  z5hAVivoTEwRcvmCF6FSVmX25mgbArJGbNamOawMg/C0nLLCQtCxiZVjFaJRVlpmeU5CZm5ug
  aGhjoGhqa6hrrGlpa6iVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZkSjHz
  8R2MU/p+6h1ilORgUhLlrY+KSxLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwRvaCZQTLEpNT61Iy
  8wBxgdMWoKDR0mE91EXUJq3uCAxtzgzHSJ1ilGXY+eWy3uZhVjy8vNSpcR5xVqAigRAijJK8+
  BGwGL1EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3oO9QFN4MvNK4Da9AjqCCeiI6imxIEe
  UJCKkpBqYdJ59XBhb/qbSIvp9ZTQnzxfblnaZ+c7fG+bOMWpYXJypq/ykJ0TC/kzV5S08H57d
  8OP8LDLl4sNE9z3+FTIFlnv42fmy9tX5b5oV1lL3c/3TNV6Kx65e28Yh/UXj0+S0uSZSWy4qB
  /xW+Tvh8OuX2noVCzjY/p7ifGM6L3ZftaHPLoGnNZ85JvBleuzIN7jyf53z9Hrfqs2bH65W4l
  wi3fVmdfSabwmBS069zs8S2qF36fw3k6Oth8XmhuhoPdv3LNkyTOn7pHWLjn5IWPvETSvcU8j
  9We/jBRuuVLBdUjlzSlSPkWnBnRjznQfNe8x2yDhJzf7xbJbAZdG21Wy/vgUUHP3t26Vr9/Ki
  Jo/8EyWW4oxEQy3mouJEAHfK8/JQAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1650364302!407497!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17390 invoked from network); 19 Apr 2022 10:31:42 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 10:31:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23JAVYC8029655
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 11:31:42 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 11:31:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kexec-tools: upgrade 2.0.23 -> 2.0.24
Date: Tue, 19 Apr 2022 18:31:20 +0800
Message-ID: <1650364280-23104-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650364280-23104-1-git-send-email-wangmy@fujitsu.com>
References: <1650364280-23104-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164622

refresh 0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...bled-check-if-kaslr-seed-dtb-propert.patch | 19 +++++++++++--------
 ...-tools_2.0.23.bb => kexec-tools_2.0.24.bb} |  2 +-
 2 files changed, 12 insertions(+), 9 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.23.bb => kexec-tools_2.0.24.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
index c2301e711d..ddc1519126 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
@@ -33,20 +33,20 @@ Upstream-Status: Submitted [http://lists.infradead.org/pipermail/kexec/2020-Nove
  kexec/arch/arm64/kexec-arm64.c | 14 +-------------
  1 file changed, 1 insertion(+), 13 deletions(-)
 
-Index: kexec-tools-2.0.20/kexec/arch/arm64/kexec-arm64.c
-===================================================================
---- kexec-tools-2.0.20.orig/kexec/arch/arm64/kexec-arm64.c
-+++ kexec-tools-2.0.20/kexec/arch/arm64/kexec-arm64.c
-@@ -428,7 +428,7 @@ static int setup_2nd_dtb(struct dtb *dtb
+diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
+index ec6df4b..10238d9 100644
+--- a/kexec/arch/arm64/kexec-arm64.c
++++ b/kexec/arch/arm64/kexec-arm64.c
+@@ -503,7 +503,7 @@ static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_crash)
  	int len, range_len;
  	int nodeoffset;
  	int new_size;
--	int result, kaslr_seed;
-+	int result;
+-	int i, result, kaslr_seed;
++	int i, result;
  
  	result = fdt_check_header(dtb->buf);
  
-@@ -499,18 +499,6 @@ static int setup_2nd_dtb(struct dtb *dtb
+@@ -576,18 +576,6 @@ static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_crash)
  			return result;
  		}
  	} else {
@@ -65,3 +65,6 @@ Index: kexec-tools-2.0.20/kexec/arch/arm64/kexec-arm64.c
  		/*
  		 * Invoke the getrandom system call with
  		 * GRND_NONBLOCK, to make sure we
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.24.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.24.bb
index 4e58a5acbd..fdad40ed6a 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.24.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            "
 
-SRC_URI[sha256sum] = "c7dcc59f5b66004d9d91264324e20e0387ea263dbb449708fbf84a4e5ff7decc"
+SRC_URI[sha256sum] = "1ff9137327aeac3b2ab922a71bc6eb4655571a0ff77c071cb92783a9a59d4d26"
 
 inherit autotools update-rc.d systemd
 
-- 
2.25.1


