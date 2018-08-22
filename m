Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id EBF7578F94
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:53 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id c190-v6so3145945oig.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AaT5IXibWK0Tk0wT7Zu3kiSGrLKqXxXVQmrUs4QdADs=;
	b=qYtxi2Tjn/Xt+y95hksKQovtz8XGjt5QXeJxJOofjDDBVzlfG+M+BRG6U3G/js8ZuT
	DBQF701kB21aCuRulUk6uKqfby14BXb/Ri7vBtVis7VTe3wWOGGyCgUsfaCTxll1tj+4
	OFiEvsiepxclmppKwbhwY0Mauio1gKDf4XYuZktj9MP+zDnXHLITFV8GWpVFTyQL1I50
	v3pw7dpicNAVq0VhyzzLIl08tMqKuPiN5PeaGVBJHZ0WJTocxde7HIzgmh8Gm/lzs9hB
	yMWf7FfvxX356Va5LnmPoSYwEh/HU7qGLXADFajM2L6yNJuY3FhVUi6IQIeZ6++sA2AG
	qqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AaT5IXibWK0Tk0wT7Zu3kiSGrLKqXxXVQmrUs4QdADs=;
	b=MVL0cYKoygV4S3b25WzkNqy8LyOYtTLwMPvjJx49OjwjKsTr6UCXb+zj+xTwzWB4Hc
	8P82b97dKbQJLETok7Xo6qszlFgFWQ9whPPoLsv5ahVS7XHQTqSKmaH3Bh2dTyCtgxOC
	CvnrYs31ggqx4JefJ9lmwaZByTFVH76Cr/Xy26taO8yBN60Su8k035V/Ima0zcNWxoHf
	yKoGXf2GviUFYRlO7RwiOPkqmbUV7xrdrYAzdn/dMJmP4bVhOi2XRmtVSo0MZjpA/tIE
	5jMTF9Eq0tF7yc3V3Qm0GLCV336JhhqpxIVJWmgd6N9JfIxr9TedtEaejkWol0M9jF23
	bDhQ==
X-Gm-Message-State: APzg51Dad/0Ojm/W9qQRfYjHliOAUEvK8el4auheOXxFd4A44i5nCA3F
	px9J201mLWdYAluB7N5mc2qPSIrjaV8=
X-Google-Smtp-Source: ANB0VdYbM2wcoFdAYUDOiUdawqtGUhISAEL/K5YorhJp2aBv1d34dej/EAg6U6F3e0BXmVW0INSAKQ==
X-Received: by 2002:aca:cd41:: with SMTP id
	d62-v6mr4182132oig.207.1534945014838; 
	Wed, 22 Aug 2018 06:36:54 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:54 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:28 +0530
Message-Id: <1534944940-21566-22-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 22/34] libarchive: CVE-2017-14503
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:54 -0000

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


