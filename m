Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SaeBb-0000HF-Cb
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 04:35:27 +0200
Received: by dalh21 with SMTP id h21so3630210dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 19:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=0M5Y9Nl9e3NFPJIQNVmsVV2DjPwF5uEBrqEojfJuTIw=;
	b=msJel3MKi1JpM+DZmaLVVeGARUwhXBOLG5Ef+aSAisFJHYi2NrifSzTfaBrCx6h3Mz
	42LF77bQ/ZDiJmZrR+mXDDrg7ZLv605dbWnPSXD4b1VEF8Gpbed9PZlez2VkgVdt7FsE
	54IVnK5LkmeRxyFwMoWHeTzIkgh/8ItbGYUdXBfhE2G1LgTNLpcEIGIGDo8g67UHQCdq
	ioUAegMEn3D6E5MIUJrWFlM1raTST4ut6bYtRvzeDvIStU9iewhDcBWJo3Vq10MN2jJF
	FB1hUdzCoqScaOAS1+8nQo7p461O3Qq9XYrEasAIpcUmpVRnuWp7LOAjLV0BlywZYFzz
	RXPw==
Received: by 10.68.241.228 with SMTP id wl4mr16661917pbc.51.1338603904866;
	Fri, 01 Jun 2012 19:25:04 -0700 (PDT)
Received: from localhost.localdomain (ip68-110-79-242.ph.ph.cox.net.
	[68.110.79.242])
	by mx.google.com with ESMTPS id jv6sm4679509pbc.40.2012.06.01.19.25.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 19:25:03 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2012 19:24:52 -0700
Message-Id: <cover.1338603853.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.10.3
Subject: [PATCH 0/2] First pass of rpcbind improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Jun 2012 02:35:27 -0000

The following changes since commit e3113827810e98eb1b012f0b280fb917199704c1:

  webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-05-30 17:37:58 +0100)

are available in the git repository at:

  git://github.com/kergoth/oe-core rpcbind-1

for you to fetch changes up to acae76c50ae66d8167038782cc623f5de64e1365:

  task-core-basic: drop portmap (2012-06-01 22:02:50 -0400)

----------------------------------------------------------------
Christopher Larson (2):
      rpcbind: add and use startup script, move binaries
      task-core-basic: drop portmap

 meta/recipes-extended/rpcbind/rpcbind/init.d   |   85 ++++++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb |   18 ++++-
 meta/recipes-extended/tasks/task-core-basic.bb |    1 -
 3 files changed, 101 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/init.d

-- 
1.7.10.3



