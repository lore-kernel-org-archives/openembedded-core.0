Return-Path: <prvs=1591333edf=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id BC893787DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 19:57:06 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w1MJuVgV031343 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 13:57:07 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2g6jswf19e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 13:57:07 -0600
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w1MJv6bf032182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 13:57:06 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 22 Feb 2018 13:57:06 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 22 Feb 2018 13:57:06 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 13:57:34 -0600
Message-ID: <20180222195736.21391-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=399 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1802220251
Subject: [PATCH 0/2] opkg & opkg-utils upgrade to 0.3.6
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

Alejandro del Castillo (2):
  opkg: upgrade to version 0.3.6
  opkg-utils: upgrade to version 0.3.6

 .../recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch | 8 ++++----
 .../opkg-utils/{opkg-utils_0.3.5.bb => opkg-utils_0.3.6.bb}       | 4 ++--
 meta/recipes-devtools/opkg/{opkg_0.3.5.bb => opkg_0.3.6.bb}       | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.3.5.bb => opkg-utils_0.3.6.bb} (94%)
 rename meta/recipes-devtools/opkg/{opkg_0.3.5.bb => opkg_0.3.6.bb} (95%)

-- 
2.16.1


