Return-Path: <akuster808@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id EBFEF771F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 23:08:44 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id z11so25267579qtm.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 15:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TtwbzGXAvBUU1KDYB/s9Fj/Tr3IJVcLeaHH1dwIQEc4=;
	b=rrTPsw/D/8ceXCo/oaRT1Fl2gJT3A5P45EgtmLPKioVVlhj+s653OLH+2KLkv0uwJS
	I5p8MYUK6wOF0+c0YJgdcVq1ejBzISMBUtzKUjNOj7bPQnHclIyK2jYoLZBy4wAIhpLc
	heFPLqSXXhil7DOKCLwUywgvrM7mliEjh8xsTlFJf/U+xi9ZaUWD1WUSs7Jx3BWkpyL4
	3S6jKoopkJmLO7x4qlHJm+w0QwPgmAkn3TeYuX/s5ZF2JY/pnFCLnFl6DYrSISRYLhFt
	bFA+vNMK+B7ehUMDMKOIffr4b6VL25/3DyVIkqnmZ4zVnz7XaBLzK8hSGUISjM+74Th+
	1dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TtwbzGXAvBUU1KDYB/s9Fj/Tr3IJVcLeaHH1dwIQEc4=;
	b=bVm2iBuOakxYbdgN/MsepIki34Uz+2yPBnQ8gwzSoZz7WsutiGVqPary/x0WhYkbyO
	7LCKzN3FXGIK2qn014EYA2WT53KRfINXFQ86GM9P1AHN047nz4+MWA8rFRjb1lO8fd53
	Ly1Uw2A7RfsO7QYkTLdJlRDAyphN7QuWnbjU6mJX4l/KDRPWjBrfZmqHMsA4Kt7FOWZO
	5Nj6W7rU5ZNS+48OjcWUeFDH+0F2OaeEewN5P8GlJT12c99umj2ywnfMumKAyomNBWY9
	yUQPHrmfR44J1EozKIG5Su5e6XPlXCrYac3MJNNyNDUJPn5ifk9nyVkua4Gv4h2N7FnY
	YmfQ==
X-Gm-Message-State: AKwxyte3Mc6VsVmbHIwrZqkcdIMl0q6YSJsMAmVUYns0gFoyw9QZQXqX
	icC7rBJbhfMH85R8hPxN9C0COA==
X-Google-Smtp-Source: AH8x227dYSVI4I+B7UCHcvkm/rtx/FdL/iqYU9SSVhOTkjr6KpLkkRnqCBW27NTi/equX99PJf0zXg==
X-Received: by 10.237.44.231 with SMTP id g94mr788770qtd.108.1516662525916;
	Mon, 22 Jan 2018 15:08:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:c85d:e2c0:793e:901c])
	by smtp.gmail.com with ESMTPSA id
	a27sm11212357qkj.94.2018.01.22.15.08.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Jan 2018 15:08:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 15:08:40 -0800
Message-Id: <1516662521-18942-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516662521-18942-1-git-send-email-akuster808@gmail.com>
References: <1516662521-18942-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] tzdata: update to 2018b
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
X-List-Received-Date: Mon, 22 Jan 2018 23:08:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release 2018b - 2018-01-17 23:24:48 -0800

  Briefly:
  Fix a packaging problem in tz2018a, which was missing 'pacificnew'.

  Changes to build procedure

     The distribution now contains the file 'pacificnew' again.
     This file was inadvertantly omitted in the 2018a distribution.
     (Problem reported by Matias Fonzo.)

Release 2018a - 2018-01-12 22:29:21 -0800

  Briefly:
  São Tomé and Príncipe switched from +00 to +01.
  Brazil's DST will now start on November's first Sunday.
  Ireland's standard time is now in the summer, not the winter.
  Use Debian-style installation locations, instead of 4.3BSD-style.
  New zic option -t.

  Changes to past and future time stamps

    São Tomé and Príncipe switched from +00 to +01 on 2018-01-01 at
    01:00.  (Thanks to Steffen Thorsen and Michael Deckers.)

  Changes to future time stamps

    Starting in 2018 southern Brazil will begin DST on November's
    first Sunday instead of October's third Sunday.  (Thanks to
    Steffen Thorsen.)

  Changes to past time stamps

    A discrepancy of 4 s in timestamps before 1931 in South Sudan has
    been corrected.  The 'backzone' and 'zone.tab' files did not agree
    with the 'africa' and 'zone1970.tab' files.  (Problem reported by
    Michael Deckers.)

    The abbreviation invented for Bolivia Summer Time (1931-2) is now
    BST instead of BOST, to be more consistent with the convention
    used for Latvian Summer Time (1918-9) and for British Summer Time.

  Changes to tm_isdst

    Change Europe/Dublin so that it observes Irish Standard Time (UT
    +01) in summer and GMT (as negative daylight-saving) in winter,
    instead of observing standard time (GMT) in winter and Irish
    Summer Time (UT +01) in summer.  This change does not affect UT
    offsets or abbreviations; it affects only whether timestamps are
    considered to be standard time or daylight-saving time, as
    expressed in the tm_isdst flag of C's struct tm type.
    (Discrepancy noted by Derick Rethans.)

  Changes to build procedure

    The default installation locations have been changed to mostly
    match Debian circa 2017, instead of being designed as an add-on to
    4.3BSD circa 1986.  This affects the Makefile macros TOPDIR,
    TZDIR, MANDIR, and LIBDIR.  New Makefile macros TZDEFAULT, USRDIR,
    USRSHAREDIR, BINDIR, ZDUMPDIR, and ZICDIR let installers tailor
    locations more precisely.  (This responds to suggestions from
    Brian Inglis and from Steve Summit.)

    The default installation procedure no longer creates the
    backward-compatibility link US/Pacific-New, which causes
    confusion during user setup (e.g., see Debian bug 815200).
    Use 'make BACKWARD="backward pacificnew"' to create the link
    anyway, for now.  Eventually we plan to remove the link entirely.

    tzdata.zi now contains a version-number comment.
    (Suggested by Tom Lane.)

    The Makefile now quotes values like BACKWARD more carefully when
    passing them to the shell.  (Problem reported by Zefram.)

    Builders no longer need to specify -DHAVE_SNPRINTF on platforms
    that have snprintf and use pre-C99 compilers.  (Problem reported
    by Jon Skeet.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2017c.bb => tzdata_2018b.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2017c.bb => tzdata_2018b.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2017c.bb b/meta/recipes-extended/tzdata/tzdata_2018b.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2017c.bb
rename to meta/recipes-extended/tzdata/tzdata_2018b.bb
index 9e5b929..055fa00 100644
--- a/meta/recipes-extended/tzdata/tzdata_2017c.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2018b.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "1e751e7e08f8b68530674f04619d894d"
-SRC_URI[tzdata.sha256sum] = "d6543f92a929826318e2f44ff3a7611ce5f565a43e10250b42599d0ba4cbd90b"
+SRC_URI[tzdata.md5sum] = "967c216d9b5e5f07880187e09d7fd329"
+SRC_URI[tzdata.sha256sum] = "f87540b9050e1b0d772d19058fcb62f54baa505ecebf392ea825713c33bd9848"
 
 inherit allarch
 
-- 
2.7.4


