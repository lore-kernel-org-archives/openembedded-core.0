Return-Path: <rich.tollerton@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 133BE77DB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 18:03:08 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vATI2YLE003154; Wed, 29 Nov 2017 12:03:09 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2egpecqrkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 29 Nov 2017 12:03:09 -0600
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	vATI37pU017590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2017 12:03:07 -0600
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 29 Nov 2017 12:03:07 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 29 Nov 2017 12:03:07 -0600
Received: from weregild.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 29 Nov 2017 12:03:07 -0600
From: Richard Tollerton <rich.tollerton@ni.com>
To: <seebs@seebs.net>, <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Nov 2017 12:02:41 -0600
Message-ID: <20171129180242.29308-4-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171129180242.29308-1-rich.tollerton@ni.com>
References: <20171129180242.29308-1-rich.tollerton@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-11-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1709140000 definitions=main-1711290233
Subject: [PATCH][PSEUDO 3/4] test-tclsh-fork.sh: fix permissions
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
X-List-Received-Date: Wed, 29 Nov 2017 18:03:08 -0000
Content-Type: text/plain

This was mode 644, needs to be mode 755.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 test/test-tclsh-fork.sh | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 test/test-tclsh-fork.sh

diff --git a/test/test-tclsh-fork.sh b/test/test-tclsh-fork.sh
old mode 100644
new mode 100755
-- 
2.14.1


