Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 533437C85D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 08:50:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9F8osZi014993
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 01:50:54 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 15 Oct 2019 01:50:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Oct 2019 16:51:10 +0800
Message-ID: <cover.1571129436.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] weston: Fix PACKAGECONFIG for remoting
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
X-List-Received-Date: Tue, 15 Oct 2019 08:50:53 -0000
Content-Type: text/plain

The following changes since commit 59938780e7e776d87146002ea939b185f8704408:

  build-appliance-image: Update to master head revision (2019-10-09 22:28:44 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/weston
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/weston

Robert Yang (1):
  weston: Fix PACKAGECONFIG for remoting

 meta/recipes-graphics/wayland/weston_7.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


