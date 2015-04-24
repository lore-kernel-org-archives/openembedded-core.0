Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 50F8C605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 21:38:43 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so59488148pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 14:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=slW8F1fqs/qKWLLPp6X9NYmIhysj7rQ1eMF4YBi6Efw=;
	b=RVR1JmqQFpXqap7KRsE9k7BJQKAXvWmiBnaoEQLPrF7gwJT7nnljYz1xtHiqYdUy4R
	WbUh/gJzlM5dbGr0gMytt5Qoi3l3XWFh9dpGtLh6RVLkvncKMRHf2bEvsEjiiqE8vmfk
	vv0U13WUaEW22oSGLx5frgVNvRDJWaXDujUJ3QUyjVkve45CHs9LS37UYPu5t6NOQ0Xi
	AI24zqv1+vN1/WLLKKKr5ohYWvj1esg5NOhu4JoGSzCKms1/odsxzvNz+TLv6755k6iq
	5XRkvAbLoJvOUgF0lQa4Jef8pMRc3GDMx9+iVyJ6fZg4ztiNdiylFWix6giNTVyBQk1J
	jcFQ==
X-Received: by 10.70.125.129 with SMTP id mq1mr725443pdb.19.1429911525275;
	Fri, 24 Apr 2015 14:38:45 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id m4sm12027022pdo.78.2015.04.24.14.38.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Apr 2015 14:38:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Apr 2015 14:38:39 -0700
Message-Id: <1429911519-26068-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1429911519-26068-1-git-send-email-akuster808@gmail.com>
References: <1429911519-26068-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] tzdata: update to 2015d
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
X-List-Received-Date: Fri, 24 Apr 2015 21:38:44 -0000

Changes affecting future time stamps

Egypt will not observe DST in 2015 and will consider canceling it
permanently.  For now, assume no DST indefinitely.
(Thanks to Ahmed Nazmy and Tim Parenti.)

Changes affecting past time stamps
America/Whitehorse switched from UTC-9 to UTC-8 on 1967-05-28, not
1966-07-01.  Also, Yukon's time zone history is documented better.
(Thanks to Brian Inglis and Dennis Ferguson.)

Change affecting past and future time zone abbreviations
The abbreviations for Hawaii-Aleutian standard and daylight times
have been changed from HAST/HADT to HST/HDT, as per US Government
Printing Office style.  This affects only America/Adak since 1983,
as America/Honolulu was already using the new style.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2015c.bb | 6 ------
 meta/recipes-extended/tzdata/tzdata_2015d.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2015c.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2015d.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2015c.bb b/meta/recipes-extended/tzdata/tzdata_2015c.bb
deleted file mode 100644
index 9e20f91..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2015c.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "4b4a3e344786198c46909e5afde08788"
-SRC_URI[tzdata.sha256sum] = "860fac5f5f57f7a2dfc1ba682dbd1f5c0f0b597f761571277b6ed6561e22365a"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2015d.bb b/meta/recipes-extended/tzdata/tzdata_2015d.bb
new file mode 100644
index 0000000..d8e5f24
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2015d.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "b595bdc4474b8fc1a15cffc67c66025b"
+SRC_URI[tzdata.sha256sum] = "8b9f5008277f09e251e97dba7813f56168d691115bda90ade4638d72f296d531"
+
+require tzdata.inc
-- 
2.3.5


