Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7F13787E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 06:46:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBE6ksZs017665
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 22:46:54 -0800
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 13 Dec 2017 22:46:53 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Dec 2017 14:45:02 +0800
Message-ID: <1513233904-17502-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [PATCH 0/2] ltp: fix two cases failure
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
X-List-Received-Date: Thu, 14 Dec 2017 06:46:54 -0000
Content-Type: text/plain



Yi Zhao (2):
  ltp: add tar as runtime dependency
  ltp: fix ar01 case failure

 ...s-ar01-Fix-for-test-in-deterministic-mode.patch | 252 +++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20170929.bb          |   2 +
 2 files changed, 254 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch

-- 
2.7.4


