Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9300B7927A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:34 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id z185-v6so2041824oia.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tlPMpFQ/jWy9w3l6onaeFsNKK+8dxwgnUVzkpdvKMqA=;
	b=peY77Leq0Tvuk+vYIKIeu8MLsRjIb2Qns18ljXIvH9E+QlAMc9hAH8HPYxsZvIlMwl
	mzJx7mgP+a3AkYBkKppUmh7h/apkG2Snl8fciSD1Wdmc4rdqr47+lxJ2urX1koW9PNwl
	0WqIEixKwyYrndk5pkHH6q7g3CqEA3LeUTo7MaJLY/DwMCVXEdSX22PtE2x38PZPUaZ3
	Yxcp0Df0D5tdN4CVlx6nhXB7z1428E5mkCvlr02jYoS2kVywj38uKbnF3W1q3a4XiacD
	hJGjGUnShsZa2rXMEKbjeLtCJU/hWyMMe8eDioujL0vBgYT+OLkkMPD1Nk3yLIEWB8T4
	hqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tlPMpFQ/jWy9w3l6onaeFsNKK+8dxwgnUVzkpdvKMqA=;
	b=r4HdugDY6TXwdoQ+WKQfxAssbl1acsoys9MRQUhm6xSIHH/e/k9Xi+Wkqml4q41PKn
	4EiAHvaHU1I+FRkFaKGz+/lk+SOzNnz34TA0yMk92NU1Dy4Kf38I/JvBAOYlRc5e9L1I
	FryKNn4lrM5bE4SBIvdP1pCQyR//bOqU0a4dLrjIBbBhoP3SpU/suA6BR36AlYfDeQbG
	jFX/ELPQcFj3SOXlBbItlyxoBcHzVkUB4aQ9uOLwR12Pa+clI9UJnG0FGx6bkK7YTGWW
	LgXgFiXzxDjYa0QjMruOxmBIe7RxqHVYgJglVlqUr9/CMKwhjpRXFSiieEkCrPX8zTC3
	0X0A==
X-Gm-Message-State: APzg51Cb+Kb3Q3qg2SLOwydF5y4dnSXAOuPHyeF1ITkU6k/yJFiRF2hl
	tublmYI0gTtkhuturJFsKnkiygMNivc=
X-Google-Smtp-Source: ANB0VdZXYbEg91UoCqW9IVZPhEQGRanGkTmxxknZAZHIDo0yjR7Wr1/cgIJXn7kP1I7uaqTknSnB/Q==
X-Received: by 2002:aca:e6d4:: with SMTP id
	d203-v6mr3605766oih.311.1534936655328; 
	Wed, 22 Aug 2018 04:17:35 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:34 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:45 +0530
Message-Id: <1534936615-11658-9-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH 09/19] libarchive: CVE-2017-14503
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:34 -0000

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


