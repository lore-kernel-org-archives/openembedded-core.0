Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0CE6A362
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 05:39:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4S5dLQo007147
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 22:39:21 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 27 May 2013 22:39:21 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2013 13:39:37 +0800
Message-ID: <cover.1369719531.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/2] switch to using busybox instead of tinylogin
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
X-List-Received-Date: Tue, 28 May 2013 05:39:21 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 21089515bd18ba18e86ec8f72ff8141b9fb1dea8:

  ref-manual: Added xmlto and dblatex packages for docs (2013-05-22 17:23:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/tinylogin-busybox
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/tinylogin-busybox

Chen Qi (2):
  packagegroup-core-boot: use busybox as the default login manager
  busybox: enable login/password commands by default

 meta/recipes-core/busybox/busybox-1.20.2/defconfig |   26 ++++++++++----------
 .../packagegroups/packagegroup-core-boot.bb        |    2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

-- 
1.7.9.5


