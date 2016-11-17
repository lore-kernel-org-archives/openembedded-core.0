Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E3F9F6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 08:08:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAH88Ceq029250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 00:08:12 -0800 (PST)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 17 Nov 2016 00:08:12 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2016 16:08:08 +0800
Message-ID: <1479370090-26155-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 0/2] tiff: 2 CVE fixes
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
X-List-Received-Date: Thu, 17 Nov 2016 08:08:14 -0000
Content-Type: text/plain



Yi Zhao (2):
  tiff: Security fix CVE-2016-3658
  tiff: Security fix CVE-2016-3632

 .../libtiff/files/CVE-2016-3632.patch              |  34 ++++++
 .../libtiff/files/CVE-2016-3658.patch              | 120 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   2 +
 3 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3632.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch

-- 
2.7.4


