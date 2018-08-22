Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 382AF7934E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:12 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id 13-v6so2534321ois.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tlPMpFQ/jWy9w3l6onaeFsNKK+8dxwgnUVzkpdvKMqA=;
	b=MNKfkwp3TkmlYclYfcQSUn3W2mbCmFHJPBWu/3+3Xzte/wp+pEJ5g86QDCa/5ZQ3ht
	k3xWxcVep8S8uOtBaqdsjEjDSz1PDMllFhR3BqyD/RkETSR2YXGVEmVcnOtQaYAcfca6
	zIxbN737OinFg+Nr+9zLlZrM7g1MDsDkYLxWzqibQmK/CFu1eOw3DN5HHMnpREtHEHcR
	z3y7WiGSJ/BNsWtLsqe3UfJXKJd1UUZ24bFgvPdzyIuWZNx6BIBZU+B7b1dXecYoFvb+
	/Bcdcp0M7ZSJ5Ea+YP3B5h0Gb8N0OMKGxmdXE7+i3mVm2/SFLEqZlUcMeLmPw+duqK54
	lfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tlPMpFQ/jWy9w3l6onaeFsNKK+8dxwgnUVzkpdvKMqA=;
	b=az45Hagqo2cA2NZ+uYck4cdY0rf8rDTOWvyLzsyyFAHI67a6Dp6QQTvXQt+ZNmu0ab
	AQ9IZGMFvNdDThfN0z7uQFLvP7Lx956EIWu2RR0q5NQMvR1y++lS9vEb4yaY6MHOtQoh
	TWcVqLUUUf39YVt6vFyqadMbWW5mbeV81Te+DKJtkERIiUtmZmpImqFKPMcbwzBvN3GW
	y3dziPF2wtcdwrLHBiOQARHscC1s4NYGOZ7brIM1mNT5KIJ4Xx97ecRUsyYHN0+KviK6
	pZKj5c4QRAcA4oXJKyTh0633Lz9S9isUVzfrFOW0fQnoPTHRcvlqqz34fNjd0TadvcgX
	E0Uw==
X-Gm-Message-State: APzg51Bvg1pgsZmcuujHGsG2/L7JpM8aOPf77MRbRrRvLKpWvvJKw+DN
	Us3Iah+Af4s3Qjtwq5LfVaihzwKeNeI=
X-Google-Smtp-Source: ANB0VdYtDnPQMDNQU/U+plLsCoox/EU4ifmEX0mh4To+JKLFwtzUJTd+V4zcYDjpCogVGkpryQuLjA==
X-Received: by 2002:aca:45d6:: with SMTP id
	s205-v6mr3601951oia.147.1534936753273; 
	Wed, 22 Aug 2018 04:19:13 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:12 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:48:00 +0530
Message-Id: <1534936692-11736-22-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 22/34] libarchive: CVE-2017-14503
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:12 -0000

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


