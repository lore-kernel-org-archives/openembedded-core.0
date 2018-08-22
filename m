Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 639B6794A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:50 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id c190-v6so3705300oig.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AaT5IXibWK0Tk0wT7Zu3kiSGrLKqXxXVQmrUs4QdADs=;
	b=VT6FZTze2KqDQx84gjVUtvaspHMr4xsq3F+G9ltPsoxIsNOsPpKOElvMAN3j2PGvFI
	DfdZg4QkZzaDqeyiA2TZzXJFWlJ/m3gGQMAxB+BLLnlHKZsbthoxu44gdZMBelT0ke9Q
	ohoLvGxnclXGbGGsRTbnjnddqMd8udI8CBqdLSgbS1wzWi/9tKJNQN3sie9vOlCU5CaU
	7qedta3jX16ma664KMG0RyGs1RhFcrV+gdO+wA8d4QxjhABUZCavVvgkhePssHiiAUGr
	RQzJ78Oyl7GAZAj59SILOlX/AIlIsww7y/7tEXC2KhL7si2aoSkmcQJmYfsJG5bZyKd1
	aQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AaT5IXibWK0Tk0wT7Zu3kiSGrLKqXxXVQmrUs4QdADs=;
	b=MGZNojR+ijrd+ko1aryw3o6pmxSmeRXu3jKSoc3ob9tmuorl2l0lje4WOcGnhaLe/T
	gw5N0wuyFpwqf5N9r7I6kkMQS/lB7RfTlw4F/+iEbb9TbuFuMhv2kq0DaYhlcPvyewQh
	jr+2vuqvIT3MGEp/SgM0W9fFH60GtnVQdk8H/SHq3onmx09DR+lL+2lmdHHE9BSENh0C
	9VHvXT2OknxAE6V/AJ8nUW5Ny0p+s34YngJB4VEu1iEkP4dm7H9DNUCdZwL9Itn2t4PB
	kfBlVA8xyi4Zc73VMAZEQqI14ijTlE9JB91BmkK6Dtc4jNyBCZT6z1L9RrkKl+ZZej31
	KzEQ==
X-Gm-Message-State: APzg51CEj/gurrzBAZUmzqut2iOp0QA+N73Oln5NYeApmFZtKy4yrtS1
	RwYQlrkM2NEQgj/dO9pR8WhY7w9/T4A=
X-Google-Smtp-Source: ANB0VdYt4I0JNq273snyy6csKNdOzu1NYdsX/1eTD3t/0caV1CGZz0UQqOgAV0nE78ckXhyBHJP+FQ==
X-Received: by 2002:aca:4aca:: with SMTP id
	x193-v6mr2325594oia.211.1534950591193; 
	Wed, 22 Aug 2018 08:09:51 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:50 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:40 +0530
Message-Id: <1534950532-23850-22-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 22/34] libarchive: CVE-2017-14503
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:50 -0000

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
index 0000000..cbce50c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch
@@ -0,0 +1,33 @@
+From 2c8c83b9731ff822fad6cc8c670ea5519c366a14 Mon Sep 17 00:00:00 2001
+From: Joerg Sonnenberger <joerg@bec.de>
+Date: Thu, 19 Jul 2018 21:14:53 +0200
+Subject: [PATCH] Reject LHA archive entries with negative size.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/2c8c83b9731ff822fad6cc8c670ea5519c366a14]
+CVE: CVE-2017-14503
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


