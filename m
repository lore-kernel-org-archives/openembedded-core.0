Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F0CF3799B9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 09:34:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T9YQ6q004548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 02:34:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 02:34:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 17:39:54 +0800
Message-ID: <cover.1538212391.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix to build webkitgtk without opengl
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
X-List-Received-Date: Sat, 29 Sep 2018 09:34:25 -0000
Content-Type: text/plain

The following changes since commit 3bbbe25ae74e120f7d3452685f0cae2245d7b14d:

  glibc-package.inc: correct intention for deleting /usr/lib as needed (2018-09-27 23:41:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/webkitgtk-opengl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/webkitgtk-opengl

Chen Qi (2):
  libepoxy: fix PACKAGECONFIG to get rid of required opengl distro
    feature
  webkitgtk: fix to build without opengl

 meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb   |  9 +++---
 .../0001-fix-to-build-with-libepoxy.patch          | 35 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.20.5.bb       |  4 ++-
 3 files changed, 42 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-fix-to-build-with-libepoxy.patch

-- 
1.9.1


