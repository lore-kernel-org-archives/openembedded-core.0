Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id CC1356ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 05:03:00 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so131337450pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 22:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hjgSLjeN5nt6uRRScM7ZPMB3HolKnwPNuDjnJon4/Sc=;
	b=Gyx2FPzwx5dQnln8pJplv7O9X/rab4dCsNn78Syjt11QXyM993WFhIonylVqklxWDQ
	x915oiJ+k4ZiPBU0b04u5B7KBbn/xv3zS15a8qSkbpmRkdO6hsSaItobuH636bDV36Fc
	eqDbkx0mB08KxghQ8XW1VnXg6fEsLGKVhx61eRTeNakb9smb2ln/0W9IFNvBaCgfAq0J
	GE04t4jvx3F2Fa0j04BIVGn3I+x14R6+zzCUqbKyYQ0H9xMTcaXdSOPQz8C8xv1nSigk
	17u9czQE5+EVphLw3+9QntJFvxzbHVlS2VTbkRZOBVBGiH2W5bKlb+4uedB76x28WtmI
	4z/Q==
X-Received: by 10.70.103.200 with SMTP id fy8mr32509600pdb.136.1428987781673; 
	Mon, 13 Apr 2015 22:03:01 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id x1sm8893948pdp.1.2015.04.13.22.02.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 22:03:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Apr 2015 22:02:47 -0700
Message-Id: <1428987767-763-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1428987767-763-1-git-send-email-akuster808@gmail.com>
References: <1428987767-763-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] txdata: update to 2015c
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
X-List-Received-Date: Tue, 14 Apr 2015 05:03:00 -0000

Changes affecting future time stamps

Egypt's spring-forward transition is at 24:00 on April's last Thursday,
not 00:00 on April's last Friday.  2015's transition will therefore be on
Thursday, April 30 at 24:00, not Friday, April 24 at 00:00.  Similar fixes
apply to 2026, 2037, 2043, etc.  (Thanks to Steffen Thorsen.)

Changes affecting past time stamps

The following changes affect some pre-1991 Chile-related time stamps
in America/Santiago, Antarctica/Palmer, and Pacific/Easter.

The 1910 transition was January 10, not January 1.

The 1918 transition was September 10, not September 1.

The UTC-4 time observed from 1932 to 1942 is now considered to be
standard time, not year-round DST.

Santiago observed DST (UTC-3) from 1946-07-15 through 1946-08-31,
then reverted to standard time, then switched its time zone to
UTC-5 on 1947-04-01.

Assume transitions before 1968 were at 00:00, since we have no data
saying otherwise.

The spring 1988 transition was 1988-10-09, not 1988-10-02.
The fall 1990 transition was 1990-03-11, not 1990-03-18.

Assume no UTC offset change for Pacific/Easter on 1890-01-01,
and omit all transitions on Pacific/Easter from 1942 through 1946
since we have no data suggesting that they existed.

One more zone has been turned into a link, as it differed
from an existing zone only for older time stamps.  As usual,
this change affects UTC offsets in pre-1970 time stamps only.
The zone's old contents have been moved to the 'backzone' file.
The affected zone is America/Montreal.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2015b.bb | 6 ------
 meta/recipes-extended/tzdata/tzdata_2015c.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2015b.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2015c.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2015b.bb b/meta/recipes-extended/tzdata/tzdata_2015b.bb
deleted file mode 100644
index df97d6d..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2015b.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "75571bb17c7b6be88a9f8872e45bc726"
-SRC_URI[tzdata.sha256sum] = "556ac1a5b3a371adc1ad4e77138f78ddd7f8ddd7bc2b52545924598c7dc8ad62"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2015c.bb b/meta/recipes-extended/tzdata/tzdata_2015c.bb
new file mode 100644
index 0000000..9e20f91
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2015c.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "4b4a3e344786198c46909e5afde08788"
+SRC_URI[tzdata.sha256sum] = "860fac5f5f57f7a2dfc1ba682dbd1f5c0f0b597f761571277b6ed6561e22365a"
+
+require tzdata.inc
-- 
2.3.5


