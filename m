Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 378DA719B7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 14:54:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB5Esfbw006281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Dec 2016 06:54:41 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Dec 2016 06:54:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Dec 2016 06:54:38 -0800
Message-ID: <cover.1480949616.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Fixes for diffutils and u-boot
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
X-List-Received-Date: Mon, 05 Dec 2016 14:54:41 -0000
Content-Type: text/plain

The following changes since commit 11063a01d4511b2688ea7ba2d7359e4e07328c66:

  ruby: upgrade to 2.3.1 (2016-11-30 15:47:17 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/2fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/2fixes

Robert Yang (2):
  diffutils: do_configure: fix "Argument list too long"
  image.bbclass: inherit image_types_uboot when needed

 meta/classes/image.bbclass                       | 9 +++++++++
 meta/recipes-extended/diffutils/diffutils_3.4.bb | 3 +++
 2 files changed, 12 insertions(+)

-- 
2.9.0


