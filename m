Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8714C786D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 04:41:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBL4fpMC020184
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 20:41:51 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 20 Dec 2017 20:41:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Dec 2017 12:41:44 +0800
Message-ID: <cover.1513831180.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: fix PACKAGECONFIG for lz4
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
X-List-Received-Date: Thu, 21 Dec 2017 04:41:49 -0000
Content-Type: text/plain

The following changes since commit 978472c58629d1448399207873bbead96b27102e:

  image.bbclass: Add additional bb.debug to help track 12304 (2017-12-18 18:02:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/systemd_lz4
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/systemd_lz4

Robert Yang (1):
  systemd: fix PACKAGECONFIG for lz4

 meta/recipes-core/systemd/systemd_234.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


