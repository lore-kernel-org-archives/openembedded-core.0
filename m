Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4A57D772E6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:53 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n128so6925994pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=/7i/WspSOXlKSRUTVh5lnxLy3gsxivpYPhKtnp0XdAw=;
	b=Y+s9sRPh3wYF7Gg7uu9kxNKUKJ0d7zN3R8l5+CSF89lRhH8Poo24IWOrQWZb/GYiMA
	Gz6BzEMegA461DsQtehM0PkBo7u/Zpm2ICrDXtFEQf5GY0qIZtrCW6NgEUHQcoeUD39q
	pOpashtDeSj5W+TLLIYwldj4kEth0sBUrZ+PE/9r+PGS7CY0hbSPFrrMOjdTQBqLwRdo
	ZgOk1xwdssiVLKMVLgy9/8R9VsfGLwM/vmFU/e6xS/uRtqvvNHMHVwaPaha0x39jyqZf
	zZzk7LzquDTbk2I6PkYSpZbf2mgn9dkOV2jDgPVTrnmb6LNrPikKv+R5zYQuE2/dusDc
	iD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=/7i/WspSOXlKSRUTVh5lnxLy3gsxivpYPhKtnp0XdAw=;
	b=Wyg5Y6feZ102W1tXIq03xp5rj4o4BY2YA8YM3ZJefXqGK/a4vAqolM0hTyiIjRru51
	QCaC1qzMwr9m/fSp8ghao0l8hdiu6j/TVsm4gd9Rqtw4iQ5E9CME6sLTEDq0Q87GSj3G
	UTRNlBtrnbRvhv7B8uUT+Y/vyIL6HgqMjPGRll5y8/EGzYO1Xk0ZKJf9PMUM5kbxXILG
	W4ZWz6jkjNIexoPDI1Gcp72jv/e+zvZubw46wV5XSVUVyvnVhROzxM2/kkw0lruBBdX1
	yXy7vTu+AkDTlqB+D4nP1xdbAKpN5ryPIiRM0ROtnB6Zwrw2H2lSWhdVnlcOdPcPbuSA
	KH8g==
X-Gm-Message-State: AG10YORgDE/kGDcoPOSH2aYum82fizoqhpeZ8G0pCJcDuVbYPyxlGHSAsogG7Tvg35DNzw==
X-Received: by 10.98.68.212 with SMTP id m81mr30732527pfi.135.1454800554207;
	Sat, 06 Feb 2016 15:15:54 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:15:02 -0800
Message-Id: <2efbdc8489e5270b9b300dac1b60424c4a393efb.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 21/21] bind: Security fix CVE-2015-8704
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:53 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8704 bind: specific APL data could trigger an INSIST in apl_42.c

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../bind/bind/CVE-2015-8704.patch                  | 29 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch b/meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch
new file mode 100644
index 0000000..7f28e44
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2015-8704.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Backport
+
+https://bugzilla.redhat.com/attachment.cgi?id=1115781
+
+CVE: CVE-2015-8704
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: bind-9.9.5/lib/dns/rdata/in_1/apl_42.c
+===================================================================
+--- bind-9.9.5.orig/lib/dns/rdata/in_1/apl_42.c
++++ bind-9.9.5/lib/dns/rdata/in_1/apl_42.c
+@@ -116,7 +116,7 @@ totext_in_apl(ARGS_TOTEXT) {
+ 	isc_uint8_t len;
+ 	isc_boolean_t neg;
+ 	unsigned char buf[16];
+-	char txt[sizeof(" !64000")];
++	char txt[sizeof(" !64000:")];
+ 	const char *sep = "";
+ 	int n;
+ 
+@@ -140,7 +140,7 @@ totext_in_apl(ARGS_TOTEXT) {
+ 		isc_region_consume(&sr, 1);
+ 		INSIST(len <= sr.length);
+ 		n = snprintf(txt, sizeof(txt), "%s%s%u:", sep,
+-			     neg ? "!": "", afi);
++			     neg ? "!" : "", afi);
+ 		INSIST(n < (int)sizeof(txt));
+ 		RETERR(str_totext(txt, target));
+ 		switch (afi) {
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index 79b0397..a904d6e 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -26,6 +26,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://CVE-2015-4620.patch \
            file://CVE-2015-5722.patch \
            file://CVE-2015-8000.patch \
+           file://CVE-2015-8704.patch \
 	   "
 
 SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
-- 
2.3.5


