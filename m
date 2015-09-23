Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44BE376E04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 09:11:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8N9B3D1017881
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 02:11:03 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 23 Sep 2015 02:11:03 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Sep 2015 17:04:36 +0800
Message-ID: <cover.1442999001.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.0.rc2.10.gf4d9753
MIME-Version: 1.0
Subject: [PATCH 0/1] Configure p11-kit without trust-paths
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
X-List-Received-Date: Wed, 23 Sep 2015 09:11:04 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 7b86c771c80d0759c2ca0e57c46c4c966f89c49e:

  bitbake: bitbake: bb.fetch2.git: Import errno module (2015-09-19 22:38:44 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/p11
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/p11

Kai Kang (1):
  p11-kit: configure without trust-paths

 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.6.0.rc2.10.gf4d9753


