Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABED745AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 02:37:41 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id c190-v6so6740644oig.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 19:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Crpeaidlaet/GtPFdrbyOAyQ+gCMOWh6CIc80SMzblk=;
	b=bEssCvVhvgm9BjWWusCnFtXei/qmhf35vBk4gD/chL3R7BEooSBF/FRBsvcXVt63Bs
	ek+RZHA4o0btHfN0eGq0/6jrbHFiDeMr9C3TlJobEcClGPQHejRbu0+O6S+2G2dXcvhd
	rC5weTcAkPp5Gcy2yXFURTG3BkS367EQRfH6Ic+0GQpZpojdjvaP28DFA6d1FxGnpv5Q
	rhPZY+rMWYip++wC0EmcZDEN10Nc0TTZq4a9wcXe55ADgMhBJe/dBlU49IWdCx5IthkM
	hw7Z0ACgU5FIJc3OtfGBUMdd6bUTkZWsGI54ce3q7ttrOUFwiaEjkOgvo7TldFvhm72I
	AUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Crpeaidlaet/GtPFdrbyOAyQ+gCMOWh6CIc80SMzblk=;
	b=ZFkY8eY+viqSRdYawyCWm16ei9zkYsm9xh6X3Cjd+OwJxEgB0JNcd2vciOWqvTBh09
	spH1a2gOnSGCpwyzWRThy30ahnl/2x1b4w4/OY19qWkBBiZonEHYlPEEa+NiKvkmNycw
	jo+w1d2mV9l5M4AgeVq+saZBgVupY1YHxNnsWR48drTj46D9apkajz4H5SpUtzDsAj+v
	Lpr5nOFAEc4T42JV4In2x6hIVrfZow3Q3rqcCfnqqgoY/ctM3YIZnTV9N3pDPcdswTsw
	ce0HEAFya3km0N+6xjC1l5+s9Qr8zq5JEWvKxOT9NARZL376Qb+s1CfKVsL7ZiWoPnGA
	5sHw==
X-Gm-Message-State: APzg51BID5XJMHZmHebnGe8geiP6UXXfkF5ST6wfiRLtyhamcmwPY8IH
	7sarN7pPf3t2Jl9YzCgmZrIkeAu0wW4=
X-Google-Smtp-Source: ANB0VdapcQyYCBKqXZkgMqIJT7bLp0ExEEvfrCxOTs87zaUZzI3tLz8RXHgI3CAryohEn4YXsVESgg==
X-Received: by 2002:aca:e0c2:: with SMTP id
	x185-v6mr6975321oig.220.1534991862959; 
	Wed, 22 Aug 2018 19:37:42 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.119.250])
	by smtp.gmail.com with ESMTPSA id
	n84-v6sm1844493oif.23.2018.08.22.19.37.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 19:37:42 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 08:07:29 +0530
Message-Id: <1534991850-3341-3-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534991850-3341-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534991850-3341-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH resend V2 3/4] libarchive: CVE-2017-14503
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
X-List-Received-Date: Thu, 23 Aug 2018 02:37:42 -0000

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


