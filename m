Return-Path: <alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 060397854D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:48:29 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5GJkPTH025919 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 14:48:31 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2b4nsh008f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 14:48:30 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v5GJmUKB011353
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 14:48:30 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 16 Jun 2017 14:48:29 -0500
Received: from delcastillo2.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 16 Jun 2017 14:48:29 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jun 2017 14:48:27 -0500
Message-ID: <1497642507-23287-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0Lab=4CGgXFoH3BNdXo12WdobaZ_MBb8NaWAhA7Cfm-6OA@mail.gmail.com>
References: <CAJTo0Lab=4CGgXFoH3BNdXo12WdobaZ_MBb8NaWAhA7Cfm-6OA@mail.gmail.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-16_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706160331
Subject: [PATCH v2] opkg-utils: rename recipe to follow versioned releases
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
X-List-Received-Date: Fri, 16 Jun 2017 19:48:30 -0000
Content-Type: text/plain

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 .../opkg-utils/{opkg-utils_git.bb => opkg-utils_0.3.5.bb}         | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_git.bb => opkg-utils_0.3.5.bb} (91%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
similarity index 91%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
index ed5980b..646cc8f 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
@@ -7,15 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=2;endline=18;md5=63ce9e6bcc445181cd9e4baf4b4ccc35"
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
-SRCREV = "1a708fd73d10c2b7677dd4cc4e017746ebbb9166"
-PV = "0.3.4+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/opkg-utils \
+SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
 "
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "a19e09c79bf1152aac62e8a120d679ff"
+SRC_URI[sha256sum] = "7f4b08912e26a3f4f6f423f3b4e7157a73b1f3a7483fc59b216d1a80b50b0c38"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.7.4


