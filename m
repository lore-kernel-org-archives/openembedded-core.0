Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 938BA79000
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:15:30 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id y207-v6so2426582oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tlPMpFQ/jWy9w3l6onaeFsNKK+8dxwgnUVzkpdvKMqA=;
	b=0l4Gybp31Ld5IkEabGBrP3bar4o52G9Kew2t0K06Oy5yNDCRTN8fT1/84je7pBVRh9
	yUs0zA4UjTInq3w32KhXhTK89Ws7G1B/lnWaQeCo8+emWIbtadu8w6pqSXX11zZXhWPL
	fe/sh0SzgZXCev7wdKW0QYiEsYv2EQ0YoYcwpEGW3SXGgX/eI8zEJsxhc3ArQ15Fj8Ae
	yB4Q4xqbsRkczCnBd4Q92OWO6wTd2T8HA/kwXt7SPBViC2hIOo6NQwZ2s04lTVtSMSMo
	T80AVN2QBZmbDd0wt7R9LJQbw0Km8eJObrc4kQ5jNmfGolucKC/dqJkitzrz7zrz5vO2
	x5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tlPMpFQ/jWy9w3l6onaeFsNKK+8dxwgnUVzkpdvKMqA=;
	b=M8EdttlAJvT49hyBIAKrp2FHushBcq1Rvq0YCS3HH15wvwto6VTV+DPfNZtcz3SkU5
	79ke81+yJTjsIN3t5WSKboyiuVlGvMa/ca/2Mf/Lf9p+YFWUK8LOYH4OiAaDC8EGORhv
	lXWAcEBdNJHjMEArOQ+y4B18DmTFB3u+DbptYOaBoEjUWnsKbQvVBuPCsIJ8rfC2PNUh
	Rj2lw/RXjgfaLmfoEp4scC6cSHFCzSILmaGJcIN/+fliMGlYQPag2oopRTp+godIeiqK
	BWoVIUg6YiB1Jrm9NMQFMnVslWoZtIBv/qT4YPgiH5VxhCkkfyOXfBawsVGSsFKn1Itb
	UJ8w==
X-Gm-Message-State: APzg51BtQ+5x6aCfT3VwBrtVqZ+DFTP4ABFoYNKxx6T0utUK47Db/dDm
	T/k8o1CRBxggL0M1ei4L5xymSJcXLec=
X-Google-Smtp-Source: ANB0VdYCPgsZu/Hv2/w2uvU0skfzIXkwgDPXttveq9QyF2jWnEL/xKL2QDhi5Ok6CWkdQP6c1WgY8Q==
X-Received: by 2002:aca:f0d7:: with SMTP id
	o206-v6mr3282128oih.200.1534936531559; 
	Wed, 22 Aug 2018 04:15:31 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	e205-v6sm1656620oia.9.2018.08.22.04.15.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:15:31 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:44:59 +0530
Message-Id: <1534936500-11509-3-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936500-11509-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936500-11509-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH 3/4] libarchive: CVE-2017-14503
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
X-List-Received-Date: Wed, 22 Aug 2018 11:15:30 -0000

Reject LHA archive entries with negative size.

Affects libarchive = 3.3.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libarchive/libarchive/CVE-2017-14503.patch     | 29 ++++++++++++++++++++++
 .../libarchive/libarchive_3.3.2.bb                 |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch
new file mode 100644
index 0000000..f82b096
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch
@@ -0,0 +1,29 @@
+From 2c8c83b9731ff822fad6cc8c670ea5519c366a14 Mon Sep 17 00:00:00 2001
+From: Joerg Sonnenberger <joerg@bec.de>
+Date: Thu, 19 Jul 2018 21:14:53 +0200
+Subject: [PATCH] Reject LHA archive entries with negative size.
+
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


