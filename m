Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id C07B26E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 23:42:35 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id cd13so785944pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 16:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=UaTDnTb4NwSWof+r0s9cLk+xgzL6xh1mSaMFXWajnvQ=;
	b=AWQVdnMyxfyjh2GTkuZrG4+Bxy6s7mzWBLHVuckuQBHuggIN1lXHVocXmCz45zebhZ
	4maR4q53sKtJRXxn5j3wNkCaYyjr1FBB9u1yMUuOLlBPJ/AdF38CGY82jP+YxHGdjYGW
	IrvV87cyXhUEevyHAbm/k5LnZNZks2WWSK2VXppL1IxTRrutODRcoPmkFSqev3tqZSS/
	ncXgz207hgXyGRtzXor0Dzt6UGqQJsf2NXXFtCFGA0W5CoZgwnGvnIkvd6R1jBdTTH0g
	k6mZHdiHPpLph/dCS6gCQpeu28Q5QFctWyMXhR438XQAo4C7pcBD5SibEZt6OxLNOIk6
	FQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UaTDnTb4NwSWof+r0s9cLk+xgzL6xh1mSaMFXWajnvQ=;
	b=CehZcarsA4GU5ChRopvdU3qDIZHQY27A+LZosCBI6q0qZPJVSRkUiigXe1EDrJF41x
	2NAz/2+F46rLd15CY5wUjOlYvgkZ4SZ/W1l2v7REgsjkTbnjFUS34kdYL35wL67RZnLd
	QGg75nnWGmk1nYHFL6vBcqOq4FuIq47S0gQb+6KfxdU9KHH/lAzXWfdhImOaISGilcCO
	OPekw9eYvf/pALn+fXUmw5SpvNeceOgcV3huLohCv1kHZDk1slvpmFZ5DO1MmqYi9szF
	54uXwIzhQSfe5PcBMjNszdV06KTKuzvKsBzUi0W3Nq4dLMwk6KpOfxfKdavw6n7pfyuW
	thKw==
X-Gm-Message-State: AA6/9RmGRIg0pREhZHAe2uWZTtmUoUV6ZkLbseItVPdTRx8OiUR8Ihn9y93fvgcl7JlkPg==
X-Received: by 10.67.5.6 with SMTP id ci6mr15434268pad.73.1475106156876;
	Wed, 28 Sep 2016 16:42:36 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	b125sm14979340pfg.36.2016.09.28.16.42.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Sep 2016 16:42:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 16:42:34 -0700
Message-Id: <1475106155-18988-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Master][Krogoth][Jethro][PATCH 1/2] tzcode-native: Update to 2016g
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
X-List-Received-Date: Wed, 28 Sep 2016 23:42:35 -0000

From: Armin Kuster <akuster@mvista.com>

LICENSE file checksum changed do to a verbage change.

  Changes to code

    zic no longer generates binary files containing POSIX TZ-like
    strings that disagree with the local time type after the last
    explicit transition in the data.  This fixes a bug with
    Africa/Casablanca and Africa/El_Aaiun in some year-2037 time
    stamps on the reference platform.  (Thanks to Alexander Belopolsky
    for reporting the bug and suggesting a way forward.)

    If the installed localtime and/or posixrules files are symbolic
    links, zic now keeps them symbolic links when updating them, for
    compatibility with platforms like OpenSUSE where other programs
    configure these files as symlinks.

    zic now avoids hard linking to symbolic links, avoids some
    unnecessary mkdir and stat system calls, and uses shorter file
    names internally.

    zdump has a new -i option to generate transitions in a
    more-compact but still human-readable format.  This option is
    experimental, and the output format may change in future versions.
    (Thanks to Jon Skeet for suggesting that an option was needed,
    and thanks to Tim Parenti and Chris Rovick for further comments.)

  Changes to build procedure

    An experimental distribution format is available, in addition
    to the traditional format which will continue to be distributed.
    The new format is a tarball tzdb-VERSION.tar.lz with signature
    file tzdb-VERSION.tar.lz.asc.  It unpacks to a top-level directory
    tzdb-VERSION containing the code and data of the traditional
    two-tarball format, along with extra data that may be useful.
    (Thanks to Antonio Diaz Diaz, Oscar van Vlijmen, and many others
    for comments about the experimental format.)

    The release version number is now more accurate in the usual case
    where releases are built from a Git repository.  For example, if
    23 commits and some working-file changes have been made since
    release 2016g, the version number is now something like
    '2016g-23-g50556e3-dirty' instead of the misleading '2016g'.
    Official releases uses the same version number format as before,
    e.g., '2016g'.  To support the more-accurate version number, its
    specification has moved from a line in the Makefile to a new
    source file 'version'.

    The experimental distribution contains a file to2050.tzs that
    contains what should be the output of 'zdump -i -c 2050' on
    primary zones.  If this file is available, 'make check' now checks
    that zdump generates this output.

    'make check_web' now works on Fedora-like distributions.

  Changes to documentation and commentary

    tzfile.5 now documents the new restriction on POSIX TZ-like
    strings that is now implemented by zic.

    Comments now cite URLs for some 1917-1921 Russian DST decrees.
    (Thanks to Alexander Belopolsky.)

    tz-link.htm mentions JuliaTime (thanks to Curtis Vogt) and Time4J
    (thanks to Meno Hochschild) and ThreeTen-Extra, and its
    description of Java 8 has been brought up to date (thanks to
    Stephen Colebourne).  Its description of local time on Mars has
    been updated to match current practice, and URLs have been updated
    and some obsolete ones removed.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../tzcode/{tzcode-native_2016f.bb => tzcode-native_2016g.bb} | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016f.bb => tzcode-native_2016g.bb} (62%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016f.bb b/meta/recipes-extended/tzcode/tzcode-native_2016g.bb
similarity index 62%
rename from meta/recipes-extended/tzcode/tzcode-native_2016f.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2016g.bb
index bdf47d2..a2e6217 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2016f.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016g.bb
@@ -3,17 +3,16 @@
 SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 LICENSE = "PD & BSD & BSD-3-Clause"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ef1a352b901ee7b75a75df8171d6aca7"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "b93618bb84e38dee102e0e41ec9d13e2"
-SRC_URI[tzcode.sha256sum] = "72325f384490a310eeb2ea0fab7e6f011a5be19adab2ff9d83bf9d1993b066ed"
-
-SRC_URI[tzdata.md5sum] = "b20b3c1618db1984aac685e763de001d"
-SRC_URI[tzdata.sha256sum] = "ed8c951008d12f1db55a11e96fc055718c6571233327d9de16a7f8475e2502b0"
+SRC_URI[tzcode.md5sum] = "f89867013676e3cb9544be2df7d36a91"
+SRC_URI[tzcode.sha256sum] = "1ff90b47ad7986140a513b5287b1851c40f80fd44fd636db5cc5b46d06f9fa2b"
+SRC_URI[tzdata.md5sum] = "3c7e97ec8527211104d27cc1d97a23de"
+SRC_URI[tzdata.sha256sum] = "3c7137b2bc47323b0de47b77786bacf81ed503d4b2c693ff8ada2fbd1281ebd1"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


