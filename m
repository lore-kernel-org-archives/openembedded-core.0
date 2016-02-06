Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE8677277
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:40 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id pv5so4054925pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=FRMb9vcxtopfxf0rnd03zI9RlZGrvie7pZl9ptqyg9A=;
	b=BL9q66RB2oZ2nU9pdwHrYtnlNX6970Fmoa7h035brdlbaxa23KSdlObtSe+qze5cO1
	DmIhwPTQxYeCwSg0AeKEXjRVYKONQBdZb0r+Z5WPoVK9tbFc4A+SMhNoG00uL1Yt/V80
	zEwYlYrpGkJ8toUH/HYIxxRpyqBhsEF3zrwpCNn7YuUrfRa8k0ASvECCulX6sZI7HZV2
	ZaB2O3lSwtkEobNOVPUHXqlGdisoEiao+YLXFZGYbhL1b3821oO4A4QnfBV2YkcQ1epP
	8CytrWSA0G9To4N+UDPnjPPKZvcah1w8lILSSMNg+759i7WBOg2eb6obA9Xj+4BuYtX8
	wAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=FRMb9vcxtopfxf0rnd03zI9RlZGrvie7pZl9ptqyg9A=;
	b=azBkA+ee8jcm2zsQwp9fvD/5TMtHXozjb03zllN0g/KHIaL8dyx5Ek2t1Hy+bX+hNb
	71CUMfN4JZU1ApF057L8Rdf1OMhfjjTYYUdV2m0lawz7fbKsc16/+KzK9vf6Paq2h/dG
	knNsGThUm6z3p9xEr+8rvENBP5smdPUeCp20LUAm/fBhXsUZMg27IJkuR6XiXUIEctBF
	wwduHlRNJgmKrnUW6Szlt4imAVWnMUZBDE0mHqXDARrH5et1zujCDIXE2KtD0GqFPPUu
	slujPrbXqzKCOIAA8DZ6+CcskzByh+SuqFgWV/4n3VG2xcRJmJHb42AbzAya1p6o8OFn
	NSTg==
X-Gm-Message-State: AG10YORO81MRiYN6WktH8Fs/hdBzoxM2ypyMLXMjrwE38VI97QOJscjcGP9Amy4ZL9OZ0g==
X-Received: by 10.67.22.166 with SMTP id ht6mr31135878pad.9.1454800541570;
	Sat, 06 Feb 2016 15:15:41 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:56 -0800
Message-Id: <b6eec74ebee79552850024d65527cced0f7d93f2.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 15/21] tzcode: update to 2016a
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:41 -0000

From: Armin Kuster <akuster@mvista.com>

Change LIC_CHKSUM_FILES to License. Some files are BSD clause 3

Changes affecting build procedure

An installer can now combine leap seconds with use of the backzone file,
e.g., with 'make PACKRATDATA=backzone REDO=posix_right zones'.
The old 'make posix_packrat' rule is now marked as obsolescent.
(Thanks to Ian Abbott for an initial implementation.)

Changes affecting documentation and commentary

A new file LICENSE makes it easier to see that the code and data
are mostly public-domain.  (Thanks to James Knight.) The three
non-public-domain files now use the current (3-clause) BSD license
instead of older versions of that license.

tz-link.htm mentions the BDE library (thanks to Andrew Paprocki),
CCTZ (thanks to Tim Parenti), TimeJones.com, and has a new section
on editing tz source files (with a mention of Sublime zoneinfo,
thanks to Gilmore Davidson).

The Theory and asia files now mention the 2015 book "The Global
Transformation of Time, 1870-1950", and cite a couple of reviews.

The America/Chicago entry now documents the informal use of US
central time in Fort Pierre, South Dakota.  (Thanks to Rick
McDermid, Matt Johnson, and Steve Jones.)

(From OE-Core rev: 1ee9072e16d96f95d07ec5a1f63888ce4730d60e)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b7f292b84eea202fb13730c11452ac1957e41cf0)
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{tzcode-native_2015g.bb => tzcode-native_2016a.bb}   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2015g.bb => tzcode-native_2016a.bb} (40%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015g.bb b/meta/recipes-extended/tzcode/tzcode-native_2016a.bb
similarity index 40%
rename from meta/recipes-extended/tzcode/tzcode-native_2015g.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2016a.bb
index 989e24b..76f97f0 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2015g.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016a.bb
@@ -1,17 +1,17 @@
 # note that we allow for us to use data later than our code version
 #
-DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-LICENSE = "PD & BSD"
+SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+LICENSE = "PD & BSD & BSD-3-Clause"
 
-LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
 
 SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2015g.tar.gz;name=tzdata"
+           ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzcode.md5sum] = "a2c47d908a6426f530efb1393cf1cd06"
-SRC_URI[tzcode.sha256sum] = "18e402ef24bfad2ded38643c9a7a9a580f940a729cb47d983052fc28ff0c7ec4"
-SRC_URI[tzdata.md5sum] = "8d46e8b225b9a04c75f5c39636435ad6"
-SRC_URI[tzdata.sha256sum] = "b923cdbf078491696b17bc8d069c74bce73fabc5774629da2f410c9b31576161"
+SRC_URI[tzcode.md5sum] = "f5e0299925631da7cf82d8ce1205111d"
+SRC_URI[tzcode.sha256sum] = "11ae66d59b844e8c6c81914c9dd73b666627bd7792855ba9de195eee4520c28d"
+SRC_URI[tzdata.md5sum] = "0d3123eb1b453ec0620822bd65be4c42"
+SRC_URI[tzdata.sha256sum] = "5efa6b324e64ef921ef700ac3273a51895f672684a30e342f68e47871c6a8cd1"
 
 S = "${WORKDIR}"
 
-- 
2.3.5


