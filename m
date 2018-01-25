Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16DAB6FF0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 03:15:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0P3Fpuk013637
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 19:15:52 -0800 (PST)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 24 Jan 2018 19:15:51 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jan 2018 11:14:02 +0800
Message-ID: <1516850044-30860-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 0/2] lsb test related fixes
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
X-List-Received-Date: Thu, 25 Jan 2018 03:15:51 -0000
Content-Type: text/plain



Yi Zhao (2):
  lsb: update to 5.0
  lsbtest: minor fixes for LSB 5.0

 meta/recipes-extended/lsb/{lsb_4.1.bb => lsb_5.0.bb} |  7 +++----
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh        |  4 ++--
 meta/recipes-extended/lsb/lsbtest/session            | 11 +----------
 meta/recipes-extended/lsb/lsbtest_1.0.bb             |  5 ++---
 4 files changed, 8 insertions(+), 19 deletions(-)
 rename meta/recipes-extended/lsb/{lsb_4.1.bb => lsb_5.0.bb} (96%)

-- 
2.7.4


