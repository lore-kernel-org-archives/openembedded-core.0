Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5011D77D6E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 05:49:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3D5nbnr027244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 22:49:37 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 12 Apr 2017 22:49:36 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Apr 2017 13:48:11 +0800
Message-ID: <1492062493-31757-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH v2 0/2] bind: 2 CVE fixes
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
X-List-Received-Date: Thu, 13 Apr 2017 05:49:36 -0000
Content-Type: text/plain

Fix CVE-2016-8864, CVE-2016-6170

Changes from V1:
Add CVE tag in patch file

Yi Zhao (2):
  bind: Security fix CVE-2016-8864
  bind: Security fix CVE-2016-6170

 .../bind/bind/CVE-2016-6170.patch                  | 1090 ++++++++++++++++++++
 .../bind/bind/CVE-2016-8864.patch                  |  219 ++++
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |    2 +
 3 files changed, 1311 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-6170.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch

-- 
2.7.4


