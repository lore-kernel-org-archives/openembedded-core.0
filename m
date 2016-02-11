Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E4DFF731A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 02:59:30 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c10so1860662pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 18:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eFi1shdvOtvN2SBsFKd0OHVX+NeSnI8S9WnedHOIM40=;
	b=HLfhAzmhlqZx8BBOm2J0SuN1ogUSHbR0PDzV1h1rfHA1WRAL3By05Ynbzy51rDPDr7
	4Y3ogoGV1iNIJpk+BzzwBjrfrSTTXXj2ls1GcAtdr3UvzFBuIyH3x6Pgi8BA4JuncMgC
	CqL3+5/QsKrA84JjskOLDG7+wCgn2HgbQbXgsTxbV9VtMneG4oBgqyR0PFK5iBTWRO2a
	mQPIOPkZHN6oY5N76ofe2Upaq/z4pimSaAM21O0fLRPHs1j1XJCVUW/Nb/YStqibcZ4U
	59wAS4IWo42UFq1w1fgIl2b7BCzBdNFMegnzqw4NGg6a7UU0hMMDN9ldI7XBeEGTPLuO
	G98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eFi1shdvOtvN2SBsFKd0OHVX+NeSnI8S9WnedHOIM40=;
	b=K7JUXlkK3c4M47eGgtphGqJS0lFulsgZlXpRdrQu83XztB4CI5WY916BH7Xf/JbDqk
	5cy9hUSYELPwxnYSgv8Rh6C9pBaq8Lqf2FSZKpgsnfkVYZDslMRdCE3mgAyLNDITe/yo
	M+ekXC6Xv920ApPXZBlg6Qqo80XD68qphFEnokKKfXnYIHxof64bytoKYX+O9aGbdcRp
	6cyr6COMIYAgL+YDr33StV1CscStU76Ff7xfmxMaMpwnT+oYD/ntXqenKQ42+/DnQajD
	hZ5YxLm14BmzaKr1MEMQnzvj4HBKw91x9Jx5Z3y1fKeWonxtlSCH3AOAcLLLDnhA2PEY
	w5vg==
X-Gm-Message-State: AG10YOTPKujM7jjdJHgo9R5Fq6qWkxpQBGvrgKhXLJ6pFfjLpBVgq2UOJQlf0v+85DRTPQ==
X-Received: by 10.98.89.139 with SMTP id k11mr63348230pfj.56.1455159571590;
	Wed, 10 Feb 2016 18:59:31 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id 69sm8134166pfj.20.2016.02.10.18.59.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 18:59:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 18:59:26 -0800
Message-Id: <1455159566-903-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1455159566-903-1-git-send-email-akuster808@gmail.com>
References: <1455159566-903-1-git-send-email-akuster808@gmail.com>
Subject: [Jethro][PATCH 2/2] uclibc: Security fix CVE-2016-2225
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
X-List-Received-Date: Thu, 11 Feb 2016 02:59:31 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-2225 Make sure to always terminate decoded string

This change is being provide to comply to Yocto compatiblility.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
 .../uclibc/uclibc-git/CVE-2016-2225.patch          | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/CVE-2016-2225.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index d3fb2a8..b718479 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -20,5 +20,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
         file://0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch \
         file://0001-wire-in-syncfs.patch \
         file://CVE-2016-2224.patch \
+        file://CVE-2016-2225.patch \
 "
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/CVE-2016-2225.patch b/meta/recipes-core/uclibc/uclibc-git/CVE-2016-2225.patch
new file mode 100644
index 0000000..0217e4b
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/CVE-2016-2225.patch
@@ -0,0 +1,32 @@
+From bb01edff0377f2585ce304ecbadcb7b6cde372ac Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jan 2016 21:11:34 +0100
+Subject: [PATCH] Make sure to always terminate decoded string
+
+Write a terminating '\0' to dest when the first byte of the encoded data
+is 0. This corner case was previously missed.
+
+Signed-off-by: Daniel Fahlgren <daniel@fahlgren.se>
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+
+Upstream-Status: Backport
+http://repo.or.cz/uclibc-ng.git/commit/bb01edff0377f2585ce304ecbadcb7b6cde372ac
+CVE: CVE-2016-2225
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ libc/inet/resolv.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+Index: git/libc/inet/resolv.c
+===================================================================
+--- git.orig/libc/inet/resolv.c
++++ git/libc/inet/resolv.c
+@@ -671,6 +671,7 @@ int __decode_dotted(const unsigned char
+ 	if (!packet)
+ 		return -1;
+ 
++	dest[0] = '\0';
+ 	while (--maxiter) {
+ 		if (offset >= packet_len)
+ 			return -1;
-- 
2.3.5


