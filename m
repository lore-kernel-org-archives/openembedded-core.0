Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1359B7E1CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 04:02:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4S4270E024706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 21:02:18 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 27 May 2019 21:01:57 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2019 12:01:51 +0800
Message-ID: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/5] add rconflicts for serval packages
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
X-List-Received-Date: Tue, 28 May 2019 04:02:27 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Changqing Li (5):
  connman: add networkmanager as rconflict
  dropbear: add openssh/openssh-sshd as rconflict
  bootchart2: add initscripts-functions as rconflict
  lsb: add initscripts-functions as rconflict
  lsbtest: add initscripts-functions as rconflict

 meta/recipes-connectivity/connman/connman_1.37.bb     | 1 +
 meta/recipes-core/dropbear/dropbear.inc               | 1 +
 meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb | 1 +
 meta/recipes-extended/lsb/lsb_5.0.bb                  | 1 +
 meta/recipes-extended/lsb/lsbtest_1.0.bb              | 1 +
 5 files changed, 5 insertions(+)

-- 
2.7.4


