Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9C8q-0001oS-9k
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 11:43:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q859V0Mm029821
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2012 02:31:00 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 02:31:00 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2012 17:31:05 +0800
Message-ID: <8f0fe3a17bb2b5d846af8c0ddb513bdbe28bb4a1.1346837304.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346837304.git.kai.kang@windriver.com>
References: <cover.1346837304.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/3] upstream_tracking: update lsb and ltp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 09:43:24 -0000
Content-Type: text/plain

Update version information of packages lsb and ltp.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/upstream_tracking.inc      |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-yocto/conf/distro/include/upstream_tracking.inc
index b27b8e6..3b415b3 100644
--- a/meta-yocto/conf/distro/include/upstream_tracking.inc
+++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
@@ -662,18 +662,18 @@ RECIPE_UPSTREAM_VERSION_pn-loudmouth = "check"
 RECIPE_UPSTREAM_VERSION_pn-lrzsz="0.12.20"
 RECIPE_UPSTREAM_DATE_pn-lrzsz="Dec 31, 1998"
 CHECK_DATE_pn-lrzsz = "Jan 30, 2011"
-RECIPE_UPSTREAM_VERSION_pn-lsb = "1.4"
-RECIPE_NO_UPDATE_REASON_pn-lsb = "1.4 is fixed version of LSB Test"
-CHECK_DATE_pn-lsb = "Apr 18, 2012"
+RECIPE_UPSTREAM_VERSION_pn-lsb = "4.1"
+RECIPE_NO_UPDATE_REASON_pn-lsb = ""
+CHECK_DATE_pn-lsb = "Sep 5, 2012"
 RECIPE_UPSTREAM_DATE_pn-lsb = "Jan 04, 2001"
 RECIPE_UPSTREAM_VERSION_pn-lsbsetup = "0.9"
 CHECK_DATE_pn-lsbsetup = "Nov 28, 2011"
 RECIPE_UPSTREAM_VERSION_pn-lsbtest = "1.0"
 RECIPE_UPSTREAM_VERSION_pn-lsof="4.84"
 CHECK_DATE_pn-lsof = "Jul 06, 2011"
-RECIPE_UPSTREAM_VERSION_pn-ltp = "20120614"
-RECIPE_UPSTREAM_DATE_pn-ltp = "Jun 14, 2012"
-CHECK_DATE_pn-ltp = "Jul 25, 2012"
+RECIPE_UPSTREAM_VERSION_pn-ltp = "20120903"
+RECIPE_UPSTREAM_DATE_pn-ltp = "Sep 3, 2012"
+CHECK_DATE_pn-ltp = "Sep 5, 2012"
 RECIPE_UPSTREAM_DATE_pn-lttng-ust = "Dec 15, 2011"
 RECIPE_UPSTREAM_VERSION_pn-lzo = "2.06"
 RECIPE_UPSTREAM_DATE_pn-lzo = "Aug 12, 2011"
-- 
1.7.5.4



