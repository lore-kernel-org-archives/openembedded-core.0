Return-Path: <prvs=3935b39a64=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 7747F7C53E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 17:07:01 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x11H1tt0007615 for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Feb 2019 11:07:02 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2qc1m64ntg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 11:07:02 -0600
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x11H71KK029377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Feb 2019 11:07:01 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 1 Feb 2019 11:07:01 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Fri, 1 Feb 2019 11:07:01 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2019 11:06:55 -0600
Message-ID: <20190201170655.23813-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-02-01_12:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH] libsolv: upgrade 0.7.2 -> 0.7.3
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
X-List-Received-Date: Fri, 01 Feb 2019 17:07:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

from NEWS:

- selected bug fixes:
  * fixed a couple of null pointer derefs and potential memory
    leaks
  * made disfavoring recommended packages work if strong recommends
    is enabled
  * no longer disable infarch rules when they don't conflict with
    the job
- new features:
  * do favor evaluation before pruning allowing to (dis)favor
    specific package versions

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 .../libsolv/{libsolv_0.7.2.bb => libsolv_0.7.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.2.bb => libsolv_0.7.3.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.2.bb b/meta/recipes-extended/libsolv/libsolv_0.7.3.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.2.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.3.bb
index 6e3993b05e..7321d63374 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.2.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.3.bb
@@ -12,7 +12,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
 
-SRCREV = "1c0141962a9eef7f4bc1fdcac7099f3f6a95ec23"
+SRCREV = "dc7d0f1c3113f2c8217563166906bef3eb5d1ee1"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


