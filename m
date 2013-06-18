Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A2F55607BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 04:48:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5I4mDID000371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 21:48:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 21:48:11 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 12:48:16 +0800
Message-ID: <cover.1371530846.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/1] udev-cache: fix to use udev-cache correctly
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
X-List-Received-Date: Tue, 18 Jun 2013 04:48:12 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 7abcaf14ec9cd760fe94c777f0cd8426163de2c5:

  oe-buildenv-internal: Fix exit verses return (2013-06-17 10:41:01 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/udev-cache-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/udev-cache-fix

Chen Qi (1):
  udev-cache: fix to use udev-cache correctly

 meta/recipes-core/systemd/systemd/init |    6 +++++-
 meta/recipes-core/udev/udev/init       |    6 +++++-
 meta/recipes-core/udev/udev/udev-cache |    4 +---
 3 files changed, 11 insertions(+), 5 deletions(-)

-- 
1.7.9.5


