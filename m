Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42F40746BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 08:58:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3K8w65T029600
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 01:58:07 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 20 Apr 2018 01:58:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Apr 2018 16:59:28 +0800
Message-ID: <cover.1524211328.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] multilib/bitbake.conf: default to contain MLPREFIX in RECIPE_SYSROOT
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
X-List-Received-Date: Fri, 20 Apr 2018 08:58:06 -0000
Content-Type: text/plain

The following changes since commit 71b4ae25612d6dd3687fdd583ed0077e744899cb:

  glib-2.0/glib.inc: fix broken mingw build (2018-04-20 08:19:46 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/recipe-sysroot-mlprefix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/recipe-sysroot-mlprefix

Chen Qi (1):
  multilib/bitbake.conf: default to contain MLPREFIX in RECIPE_SYSROOT

 meta/conf/bitbake.conf  | 2 +-
 meta/conf/multilib.conf | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

-- 
1.9.1


