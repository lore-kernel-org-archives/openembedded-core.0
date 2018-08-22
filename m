Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id B8134793C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:20:42 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id s198-v6so3025473oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K6VS950HBEOeTutWVxB6jXnJIIgS0DFqol2ls2wvKSk=;
	b=kbKJLxJTMU19iYAx2aO5CrJtsz0zjxIPIWYIzKgHl6RWB0A5/CA/loX7Kv5IopPkoE
	Rtj1VwKk6kNESsDPSHhMUUJDj9Sbxw+mGak38P1tCnwLxT9bMyLiPZ5DfYU8UOeUJSL0
	NrWPQ3nb+m6E3QhhCEJrKX4liOgGX8NHmwWzwmzU/iUg3X1PQbc3+jdB0MDtuZuKGwu6
	/6yvMjZCJ7YjqLnWl0a5EhfRQDqFkivZxCf65TFplwHtsFsJBIzxoAGywbsbAJcc5Kjb
	pTEEHgZrIViGvAP4lWFEQMyxRiOjSSP7Uqd9RKoOQuTa2oNrj1oq9z43elMhej8zBIJN
	BHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K6VS950HBEOeTutWVxB6jXnJIIgS0DFqol2ls2wvKSk=;
	b=aKkMaJssjj5ncFUsn1re99TRWg1IMiJ41Oke7ch3oL1UXbpNT3Q0sFUP31VuE4QRlC
	FoKixt72Bm62Fjdn0+iIdesfGdbBu6i7O5/SqnY1oDwb4czZKmK77ADiJJV2YaDK1Ad0
	bfHCzMkxNEppw9VgyTre0KXvv2UwlpogBdeiktP7oAOhFr75DXp6nuJIVaxkAbrgE3PG
	P04qW4nsGfSJCp4NW7Ij/HfMdVWiFeZliWvDChIOFM3yvxukDI6oHGkx97pFPnHcYSlu
	GVwkdn8TirQrsS3qiRWSJ5tZK3Mu3WvLNJmP3bEV1p/ZYME6YgLkS5qUw6bs2rppLbfa
	97tQ==
X-Gm-Message-State: APzg51CxzpNIFFXspftMdJ5Ym8v5obB8XaE9YX4jjNN1rxAU/KtY1Sxd
	TerCvqtUuLFaLAfirGQ1cEncDUYdrhQ=
X-Google-Smtp-Source: ANB0Vda4Pt/N3JKNal0Jt1KUzeeejJcmDPcAm3HmzWaoTGJGlYWPZZ0/+KY3Aj42oNaJmxEBLVS9NQ==
X-Received: by 2002:aca:2215:: with SMTP id
	b21-v6mr3535219oic.241.1534944043523; 
	Wed, 22 Aug 2018 06:20:43 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	t141-v6sm2354715oif.18.2018.08.22.06.20.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:20:43 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:49:59 +0530
Message-Id: <1534944009-21362-9-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 13:20:43 -0000

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
index 0000000..42fa68c
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


