Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 68D84771AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 07:34:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAC7YfCN017633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 23:34:42 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 11 Nov 2015 23:34:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Nov 2015 23:34:38 -0800
Message-ID: <cover.1447313581.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2 V2] fixes for prserver
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
X-List-Received-Date: Thu, 12 Nov 2015 07:34:43 -0000
Content-Type: text/plain

* V2:
  - Let bitbake-prserv-tool check filename for both .inc and .conf

// Robert

The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:02:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib oe_contrib/rbt/prserv
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/prserv

Robert Yang (2):
  prexport.bbclass: avoid export for native and crosssdk
  bitbake-prserv-tool: check file name

 meta/classes/prexport.bbclass |    5 +++--
 scripts/bitbake-prserv-tool   |    9 +++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
1.7.9.5


