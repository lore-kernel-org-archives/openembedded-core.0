Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2305F79009
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 12:00:50 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id r69-v6so2087087oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 05:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7zdGfri/rAfOpjxqtlE7zlXtI2txKuhg/EMmBkSI2Z4=;
	b=uP1ag1RFkpwCbUTzYi+VCTiSHiu+FFtzvP9QjLvnxFCr80ff1bO6o7lnL95Rd/OHlg
	ZUVOEgxOZcno/df7PgLJERpT/m3ulA/6iTfxhH5KV7WEe9+vqU462zOpsC1KtEthBO0m
	YP7yvR25Wt2TV9DYYhZKbklZeikcgjpwLbFFrCX39rSDnGRLDecs9aTumnypYc/ZBwkj
	yudWQzdceAIElHFA11VR6cZ23ovxYSlrgNrfeC6VzAEjJuEiDUk6TCv5oI8LodJ7Alee
	IOBtGr3kh8wq4Wdg5msfFilplWcNQqfcVxYbGpi2IKcflkuEZGpMjIbb6jKeEwN9y+Ex
	qfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7zdGfri/rAfOpjxqtlE7zlXtI2txKuhg/EMmBkSI2Z4=;
	b=oTMaK2+0kJlSFqyMxtBXDw6MPath+LEHIbB8sXtLNyzDuha3bLeJfN8jlWbz05avMH
	J03PUjdwAx94KfhtGalx+bxEvCYPZuJGmn2ENJYrSxpHLNY8+hhJ+Yyu8/KVQYNi/GT8
	dXf7RVNAQ6rIQUMKv4Xxl6fq89NuOOxDDPHQp55iMlp79RTnJe3cnmAaa3gMdHATbuyO
	nAzMI6E+zrI1an4a3a6ptXqFunIecfpgObgOiGcy4pau85BjDxvWMw52uAbBd+OybyY/
	iYQu2rwbhlvmTEUGuIGGM0gew+pK64M671bRuM150UriHb/VZEmDMqb9yaxWIF7br9Ss
	bUYA==
X-Gm-Message-State: APzg51C8OWQzIFJIYxnkurOdPKZFKENobmUAXrhyyjLFmmZAbp/ozzai
	1Xwc3kCSFnlrZoSLYGxIVQd+cdqJ98Q=
X-Google-Smtp-Source: ANB0Vda0F09u7y4BGKhYz6gMVyKsFFqoTsKrAgLhUAW5/WrIEYHHDhfnQBlZKuv0sOeVSkzK0BTuRA==
X-Received: by 2002:aca:c00a:: with SMTP id q10-v6mr3412990oif.4.1534939251106;
	Wed, 22 Aug 2018 05:00:51 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3129596oib.55.2018.08.22.05.00.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 05:00:50 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:30:31 +0530
Message-Id: <1534939232-13249-3-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534939232-13249-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534939232-13249-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH V2 3/4] libarchive: CVE-2017-14503
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
X-List-Received-Date: Wed, 22 Aug 2018 12:00:50 -0000

Reject LHA archive entries with negative size.

Affects libarchive = 3.3.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libarchive/libarchive/CVE-2017-14503.patch     | 33 ++++++++++++++++++++++
 .../libarchive/libarchive_3.3.2.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch
new file mode 100644
index 0000000..3cb01db
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch
@@ -0,0 +1,33 @@
+From 2c8c83b9731ff822fad6cc8c670ea5519c366a14 Mon Sep 17 00:00:00 2001
+From: Joerg Sonnenberger <joerg@bec.de>
+Date: Thu, 19 Jul 2018 21:14:53 +0200
+Subject: [PATCH] Reject LHA archive entries with negative size.
+
+CVE: CVE-2017-14503
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/2c8c83b9731ff822fad6cc8c670ea5519c366a14]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com> 
+---
+ libarchive/archive_read_support_format_lha.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_lha.c b/libarchive/archive_read_support_format_lha.c
+index b8ef4ae1..95c99bb1 100644
+--- a/libarchive/archive_read_support_format_lha.c
++++ b/libarchive/archive_read_support_format_lha.c
+@@ -701,6 +701,12 @@ archive_read_format_lha_read_header(struct archive_read *a,
+ 	 * Prepare variables used to read a file content.
+ 	 */
+ 	lha->entry_bytes_remaining = lha->compsize;
++	if (lha->entry_bytes_remaining < 0) {
++		archive_set_error(&a->archive,
++		    ARCHIVE_ERRNO_FILE_FORMAT,
++		    "Invalid LHa entry size");
++		return (ARCHIVE_FATAL);
++	}
+ 	lha->entry_offset = 0;
+ 	lha->entry_crc_calculated = 0;
+ 
+-- 
+2.13.3
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
index 5daca27..3269716 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2017-14166.patch \
            file://CVE-2017-14502.patch \
            file://non-recursive-extract-and-list.patch \
+           file://CVE-2017-14503.patch \
           "
 
 SRC_URI[md5sum] = "4583bd6b2ebf7e0e8963d90879eb1b27"
-- 
2.7.4


