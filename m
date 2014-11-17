Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id B68A3714D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 15:32:32 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id r10so21372327pdi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 07:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=TOs+JbVeNzQzY8795Z+jgmc4bk5eoeF9Ju8caVwpF+w=;
	b=owusOkHb2v1Mg5NPWjNxORLcqyHT6PJ7j4OTmFUecc4AwzlDaXbS5qHZVr51LZYCO0
	uRZd1hccNvhsvounYTQsTTe7thm6v561VPt31j0BFq7Yfp7Mp7dbcdFNHNgb/CK4xsp/
	v6BrtHXhYBBJjP1kzddU0MNjRKMvF86O016CBMYLWiycBKetXod4jDV9s2ncL8hpDM6u
	vN/DwHV1E0KwvjaeBQutfVljhbOXt5jiDYdC82rfFuxRafm5LuEyY0V7+ppvvf2nDAXb
	TShk76IfHRCFxi91ZKhW2D27HiBApyw9GzIBtTzh3S7v8oWd7FD5wXqK/4bBHRjyJRyt
	B3rw==
X-Received: by 10.66.90.201 with SMTP id by9mr3475474pab.148.1416238352500;
	Mon, 17 Nov 2014 07:32:32 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id tm3sm6364638pac.12.2014.11.17.07.32.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Nov 2014 07:32:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Nov 2014 07:32:28 -0800
Message-Id: <1416238348-13496-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] serf: update to 1.3.8 including CVE-2014-3504
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
X-List-Received-Date: Mon, 17 Nov 2014 15:32:33 -0000

Serf 1.3.8 [2014-10-20, from /tags/1.3.8, rxxxx]
Fix issue #152: CRC calculation error for gzipped http reponses > 4GB.
Fix issue #153: SSPI CredHandle not freed when APR pool is destroyed.
Fix issue #154: Disable SSLv2 and SSLv3 as both or broken.

Serf 1.3.7 [2014-08-11, from /tags/1.3.7, r2411]
Includes security fix:
Handle NUL bytes in fields of an X.509 certificate. (r2393, r2399)
- CVE-2014-3504: (Closes: #757965)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/serf/{serf_1.3.6.bb => serf_1.3.8.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/serf/{serf_1.3.6.bb => serf_1.3.8.bb} (74%)

diff --git a/meta/recipes-support/serf/serf_1.3.6.bb b/meta/recipes-support/serf/serf_1.3.8.bb
similarity index 74%
rename from meta/recipes-support/serf/serf_1.3.6.bb
rename to meta/recipes-support/serf/serf_1.3.8.bb
index 08b04d3..10db122 100644
--- a/meta/recipes-support/serf/serf_1.3.6.bb
+++ b/meta/recipes-support/serf/serf_1.3.8.bb
@@ -1,8 +1,8 @@
 
-SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-1.3.6.tar.bz2 \
+SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-${PV}.tar.bz2 \
            file://norpath.patch"
-SRC_URI[md5sum] = "7fe38fa6eab078e0beabf291d8e4995d"
-SRC_URI[sha256sum] = "ca637beb0399797d4fc7ffa85e801733cd9c876997fac4a4fd12e9afe86563f2"
+SRC_URI[md5sum] = "2e4efe57ff28cb3202a112e90f0c2889"
+SRC_URI[sha256sum] = "e0500be065dbbce490449837bb2ab624e46d64fc0b090474d9acaa87c82b2590"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-- 
1.9.1


