Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF1A6AC3A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Mar 2015 14:42:15 +0000 (UTC)
Received: by pdbcz9 with SMTP id cz9so137285121pdb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Mar 2015 07:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=g6ljQwsdCp0xVV7Mz4YXgDpJ0rFJw8LyGrd5YEeFp0E=;
	b=W4cL0J5/MNAk2R3/cdTLYvfMKNA5BbA5oHd8TXOJW/kBlNcbMyHCL6K9q3TqDYFi4I
	8YXiyZ6zaq5dMwLHV0bOb0NkQnikXIbQTQW0bT57Xt7/kZ9Wq2I0LX/EFbXZO7LOmLvr
	OBOlIUFuaTKqtxNbfD2XXABF7Tky1bW+pFt/9mH0LcikitKHVAgAD9nN7B5hIFa8/25U
	mW9zAzcYLYyqaszQmXa4S+Lndy5DpIKw5o5xetRYwBGae7eMIUu7MJuQbiG71rqzFWHq
	IpuX4NXPc3phC60Sfkf7j9r3q4dfrmTXHNzbIMh+AnpAesaKMocYePf7M7VuwWM7fTUo
	+IIQ==
X-Received: by 10.66.141.165 with SMTP id rp5mr155152042pab.93.1426948936535; 
	Sat, 21 Mar 2015 07:42:16 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id q4sm11846901pdj.2.2015.03.21.07.42.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 Mar 2015 07:42:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Mar 2015 07:42:09 -0700
Message-Id: <1426948929-10625-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1426948929-10625-1-git-send-email-akuster808@gmail.com>
References: <1426948929-10625-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] tzdata: update to 2015b
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
X-List-Received-Date: Sat, 21 Mar 2015 14:42:15 -0000

Changes affecting future time stamps

Mongolia will start observing DST again this year, from the last
Saturday in March at 02:00 to the last Saturday in September at 00:00.
(Thanks to Ganbold Tsagaankhuu.)

Palestine will start DST on March 28, not March 27.  Also,
correct the fall 2014 transition from September 26 to October 24.
Adjust future predictions accordingly.  (Thanks to Steffen Thorsen.)

Changes affecting past time stamps

The 1982 zone shift in Pacific/Easter has been corrected, fixing a 2015a
regression.  (Thanks to Stuart Bishop for reporting the problem.)

Some more zones have been turned into links, when they differed
from existing zones only for older time stamps.  As usual,
these changes affect UTC offsets in pre-1970 time stamps only.
Their old contents have been moved to the 'backzone' file.
The affected zones are: America/Antigua, America/Cayman,
Pacific/Midway, and Pacific/Saipan.

Changes affecting time zone abbreviations

Correct the 1992-2010 DST abbreviation in Volgograd from "MSK" to "MSD".
(Thanks to Hank W.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2015a.bb | 6 ------
 meta/recipes-extended/tzdata/tzdata_2015b.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2015a.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2015b.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2015a.bb b/meta/recipes-extended/tzdata/tzdata_2015a.bb
deleted file mode 100644
index 6151aee..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2015a.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "4ed11c894a74a5ea64201b1c6dbb8831"
-SRC_URI[tzdata.sha256sum] = "c52490917d00a8e7fc9b5f0b1b65ef6ec76d612b5b20c81bf86a04147af18e4c"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2015b.bb b/meta/recipes-extended/tzdata/tzdata_2015b.bb
new file mode 100644
index 0000000..df97d6d
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2015b.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "75571bb17c7b6be88a9f8872e45bc726"
+SRC_URI[tzdata.sha256sum] = "556ac1a5b3a371adc1ad4e77138f78ddd7f8ddd7bc2b52545924598c7dc8ad62"
+
+require tzdata.inc
-- 
1.9.1


