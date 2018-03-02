Return-Path: <prvs=2599704a79=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id CA62E78960
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 17:47:00 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w22Hjo7J011947 for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2018 11:47:01 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2gdqj08ws7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 11:47:01 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w22Hl0l1030131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2018 11:47:00 -0600
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 2 Mar 2018 11:47:00 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 2 Mar 2018 11:46:59 -0600
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 2 Mar 2018 11:46:59 -0600
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Mar 2018 19:46:57 +0200
Message-ID: <20180302174657.32731-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-03-02_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=842 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1803020210
Subject: [PATCH] Add support for pyiface
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
X-List-Received-Date: Fri, 02 Mar 2018 17:47:00 -0000
Content-Type: text/plain

Pyiface is a package that exposes the network interfaces of the
operating system in a easy to use and transparent way.

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 meta/recipes-support/pyiface/pyiface_0.0.2.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/recipes-support/pyiface/pyiface_0.0.2.bb

diff --git a/meta/recipes-support/pyiface/pyiface_0.0.2.bb b/meta/recipes-support/pyiface/pyiface_0.0.2.bb
new file mode 100644
index 0000000000..fad75af06d
--- /dev/null
+++ b/meta/recipes-support/pyiface/pyiface_0.0.2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Pyiface Recipe - Adds Pyiface library for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
+LICENSE = "GPLv3+"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
+
+SRC_URI[md5sum] = "8ced1d8ef89376a5aed97a59f11ae683"
+SRC_URI[sha256sum] = "bf5b1ff115344d388b0f9409a440ee06f67478b6c63bc8d8ce8f843f2652a8d3"
+
+inherit pypi setuptools
-- 
2.16.2


