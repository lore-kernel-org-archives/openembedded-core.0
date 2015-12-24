Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ACD8460762
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 10:00:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBOA0t0j015628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 02:00:55 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 02:00:54 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Dec 2015 17:47:52 +0800
Message-ID: <cover.1450950403.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix buildpaths QA check failure
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
X-List-Received-Date: Thu, 24 Dec 2015 10:00:55 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit a6f8a3f12ef0a6f7fe4123b8854848a4c6cf94c7:

  toaster.bbclass: fix TypeError when parsing build stats (2015-12-22 16:15:36 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/buildpaths
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/buildpaths

Kai Kang (2):
  bash: fix buildpaths qa check error
  gccmakedep: fix buildpaths qa check

 meta/recipes-extended/bash/bash.inc                 | 6 ++++--
 meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb | 6 +++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.6.1


