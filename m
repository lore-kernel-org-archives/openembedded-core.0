Return-Path: <prvs=1591333edf=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id BD68978815
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 19:57:06 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w1MJuUps031304 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 13:57:08 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2g6jswf19f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 13:57:07 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w1MJv6WY026763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 13:57:06 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 22 Feb 2018 13:57:06 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 22 Feb 2018 13:57:06 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 13:57:35 -0600
Message-ID: <20180222195736.21391-2-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180222195736.21391-1-alejandro.delcastillo@ni.com>
References: <20180222195736.21391-1-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=886 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1802220251
Subject: [PATCH 1/2] opkg: upgrade to version 0.3.6
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
X-List-Received-Date: Thu, 22 Feb 2018 19:57:07 -0000
Content-Type: text/plain

0.3.5 -> 0.3.6

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/recipes-devtools/opkg/{opkg_0.3.5.bb => opkg_0.3.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.3.5.bb => opkg_0.3.6.bb} (95%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.3.5.bb b/meta/recipes-devtools/opkg/opkg_0.3.6.bb
similarity index 95%
rename from meta/recipes-devtools/opkg/opkg_0.3.5.bb
rename to meta/recipes-devtools/opkg/opkg_0.3.6.bb
index 3e511b6bb6..70f20af739 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.5.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.6.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
 "
 
-SRC_URI[md5sum] = "d202d09ea0932943071b842626cab13c"
-SRC_URI[sha256sum] = "734bc21dea11262113fa86b928d09812618b3966f352350cf916a6ae0d343f32"
+SRC_URI[md5sum] = "79e04307f6f54db431c251772d7d987c"
+SRC_URI[sha256sum] = "f607f0e61be8cf8a3bbd0d2dccd9ec9e9b6c21dd4307b671c600d6eeaf84d30b"
 
 inherit autotools pkgconfig systemd
 
-- 
2.16.1


