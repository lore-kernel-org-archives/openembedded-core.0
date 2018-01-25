Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id C6217787DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 16:33:43 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id r19so5382410pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 08:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=so1KR6KVMUchrX9LmFEX+Bky17V7OuDrIrYoLs8Axi8=;
	b=XMX3R9Upehdj5IK/e0Ps9PKeC56XSUt6IT71DBdZFyYPz75WLC6szpnUwPpG/jnY8P
	q9s+bZBeu3U8HDQVtx/uvFl4RxNxlMaIHGiI6Uv3nW3bb+VOpgwySp/NpRu4OXFexOhb
	wD8OygzBnbjHjmBcGOuKA2F72c4mROH7lfZ8PTyuH3n3TR2RGiwRHHQn3uYMJM/jnAAa
	uAGK4owR3+8RGJUYcVFL4yBeJpXOQ5Q6/ww+f+qQld5+byTdyRFHxpH4ZicGnsLfOxwu
	WD8plKII1E5cilR+zufwIoWAbVFnmeX2bM2NI7fT4YWKxhIFvgmfl7j5deo7SguqJRPx
	M5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=so1KR6KVMUchrX9LmFEX+Bky17V7OuDrIrYoLs8Axi8=;
	b=fc0ByTDXxrhu4zpwli0JA8K5Yqxojy3aBdDWLk35hQyuG96YfTL4+ICwStWRw0lHA2
	wOiaXS+qlB1W6Eql0NirAo4pmXCwn7FrKiWBg9RQOx8jEXuhSP1QspE820zgeZmaGoru
	OuHS4wU1uisFbSZ/1dirDswIoT4SEmYeJsOwAE2oBYbVaHssjPrBes0hZiipojGMLdKO
	ZFCTxYYaBjx+CCaBwdzU4kQoJGA0lIl3kBQIefOJIiSZHf2n3v9Hp7+Ywbiv8mvokwwV
	CWogG8DZtCpmNfKI7aRZLnLc5kN8+XZEQnsKjFis5s4aZTYiCE92yHqfaDkl7kT7knxR
	ZGhQ==
X-Gm-Message-State: AKwxytd3revs0agk+uO3w16DESLx6eN+CuDlV2maY3KclSkFPZPz7fYe
	8mhA6PVh5Tst3dUKimBL3Oc=
X-Google-Smtp-Source: AH8x224lWNtHsxK52iMCwtNbsW4jkohs2ncX0uWhdAaGxkjBDKG+YP90EMn30kdLS0ffFA1TkFbzDA==
X-Received: by 2002:a17:902:68c5:: with SMTP id
	x5-v6mr11900013plm.80.1516898025151; 
	Thu, 25 Jan 2018 08:33:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:e8f5:e813:6261:124d])
	by smtp.gmail.com with ESMTPSA id
	g2sm7738478pfh.134.2018.01.25.08.33.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jan 2018 08:33:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Jan 2018 08:33:42 -0800
Message-Id: <1516898023-1986-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] tzcode: update to 2018c
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
X-List-Received-Date: Thu, 25 Jan 2018 16:33:43 -0000

removed patches now included in update.

The 2018a through 2018c releases reflect the following changes, which were either circulated on the tz mailing list or are relatively minor technical or administrative changes. This announcement has merged the set of changes made by the three releases, to make it easier to see the difference between 2017c and 2018c; please see the 2018c NEWS file for more details about intermediate versions.

Release 2018c - 2018-01-22 23:00:44 -0800
Release 2018b - 2018-01-17 23:24:48 -0800
Release 2018a - 2018-01-12 22:29:21 -0800

Changes to code

    zic has a new option -t FILE that specifies the location of the
    file that determines local time when TZ is unset. The default for
    this location can be configured via the new TZDEFAULT makefile
    macro, which defaults to /etc/localtime.

    Diagnostics and commentary now distinguish UT from UTC more
    carefully; see theory.html for more information about UT vs UTC.

    zic has been ported to GCC 8's -Wstringop-truncation option.
    (Problem reported by Martin Sebor.)

  Changes to documentation and commentary

    The zic man page now documents the longstanding behavior that
    times and years can be out of the usual range, with negative times
    counting backwards from midnight and with year 0 preceding year 1.
    (Problem reported by Michael Deckers.)

    The theory.html file now mentions the POSIX limit of six chars
    per abbreviation, and lists alphabetic abbreviations used.

    The files tz-art.htm and tz-link.htm have been renamed to
    tz-art.html and tz-link.html, respectively, for consistency with
    other file names and to simplify web server configuration.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tzcode/{tzcode-native_2017c.bb => tzcode-native_2018c.bb} | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2017c.bb => tzcode-native_2018c.bb} (63%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017c.bb b/meta/recipes-extended/tzcode/tzcode-native_2018c.bb
similarity index 63%
rename from meta/recipes-extended/tzcode/tzcode-native_2017c.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2018c.bb
index aeaef72..85e9b70 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2017c.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2018c.bb
@@ -7,15 +7,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
-           file://0001-Fix-Makefile-quoting-bug.patch \
-           file://0002-Port-zdump-to-C90-snprintf.patch"
+           "
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "2fe6986231db5182c61d565021a0cd7b"
-SRC_URI[tzcode.sha256sum] = "81e8b4bc23e60906640c266bbff3789661e22f0fa29fe61b96ec7c2816c079b7"
-SRC_URI[tzdata.md5sum] = "1e751e7e08f8b68530674f04619d894d"
-SRC_URI[tzdata.sha256sum] = "d6543f92a929826318e2f44ff3a7611ce5f565a43e10250b42599d0ba4cbd90b"
+SRC_URI[tzcode.md5sum] = "e6e0d4b2ce3fa6906f303157bed2612e"
+SRC_URI[tzcode.sha256sum] = "31fa7fc0f94a6ff2d6bc878c0a35e8ab8b5aa0e8b01445a1d4a8f14777d0e665"
+SRC_URI[tzdata.md5sum] = "c412b1531adef1be7a645ab734f86acc"
+SRC_URI[tzdata.sha256sum] = "2825c3e4b7ef520f24d393bcc02942f9762ffd3e7fc9b23850789ed8f22933f6"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


