Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id C1AC065DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 15:10:46 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id r10so10236982pdi.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 07:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1/eMklMBH1ws1iO5ni94HMqhfigZs9CRZVqM+AgKeV4=;
	b=V0/YmpkAb/rIvhco05lhMu2Fq65Fy2wMxfrC4gFezpdUIPUyk8i7EB5NkB9niL0Rtt
	29+UmkPie5ysco3hZIBBrCDAzvprx5fCtFoT130d5Nys+dCbDtnywkNrUAODvyPAORJD
	39N2z47bvI6NqJzrZfDoGNx/Fhwqrsjb+nmnLK/ohD3n4QGgT4vlnLXgGcsAMRiCeCKi
	C39yQg92Nqu3F6PyVZIA2iRkiuICCcW6MaNMI0+rmRuXULKWWb7tZXOtjU7bXBtdSj8Z
	tyJe0cjGGuh+VDj4brEcK4BVQGMJwxvtCHz2I2zqPD9dZpkMPdK9iMAK5lHulumeSHKH
	ICxw==
X-Received: by 10.68.136.195 with SMTP id qc3mr41037268pbb.40.1415718647024;
	Tue, 11 Nov 2014 07:10:47 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	mi8sm19562178pdb.91.2014.11.11.07.10.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Nov 2014 07:10:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 07:10:35 -0800
Message-Id: <1415718635-25408-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415718635-25408-1-git-send-email-akuster808@gmail.com>
References: <1415718635-25408-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] tzdata: update to 2014j
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
X-List-Received-Date: Tue, 11 Nov 2014 15:10:51 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2014i.bb | 6 ------
 meta/recipes-extended/tzdata/tzdata_2014j.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014i.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014j.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2014i.bb b/meta/recipes-extended/tzdata/tzdata_2014i.bb
deleted file mode 100644
index cab9b84..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2014i.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "00adeb62a0897aac5ba67da838351adb"
-SRC_URI[tzdata.sha256sum] = "2af331bdd2b794ec59b8ded7300fb29dc3573a009ec14183f5c9ad38e3886153"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2014j.bb b/meta/recipes-extended/tzdata/tzdata_2014j.bb
new file mode 100644
index 0000000..f0388c2
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2014j.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "2d7ea9c309f0d4e162e426e568290ca3"
+SRC_URI[tzdata.sha256sum] = "a2d870320694d40535df822ac8074dc629a90e92abafa5d3373314f78ddc0e0d"
+
+require tzdata.inc
-- 
1.9.1


