Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsguE-00052Z-76
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 21:35:50 +0100
Received: by yenr5 with SMTP id r5so750117yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 12:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=oUZTUcgzZiOyTd2ItxcT7hE+vVSUkoBfqL7z4U46q1A=;
	b=jbDn+E3abmY+5mAx6TFROZM4I+4qIVFXfAaIhvOlK3So747T+lILLhFqZ/DEFekgFg
	gRBqzZiMcDekQJEbGQMVAoUKRj3qgeShBSpwQ7LOCaHcl0xMtDLj9Omwycx5l1toZ/CD
	eHaQ7kZk4pSMDuOe2tgtlQRl0sBLrOGY6/m2k=
Received: by 10.236.175.164 with SMTP id z24mr31214123yhl.84.1328128074366;
	Wed, 01 Feb 2012 12:27:54 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id a39sm120200yhk.15.2012.02.01.12.27.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 12:27:53 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 20:27:42 +0000
Message-Id: <cover.1328127940.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/3] Pending patches in O.S. Systems tree
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
X-List-Received-Date: Wed, 01 Feb 2012 20:35:50 -0000

We changed the udev patch taking in account the suggestions done by
Richard and also made a cuple of more fixes in meanwhile. The
gitpkgv.bbclass patch has been dropped for now as it is in discussion
on mailing list.

The following changes since commit d7b13cd42ab8d5f44f97e119b73ec2e363677d26:

  useradd.bbclass: Fix missing quote (2012-01-27 23:57:33 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (3):
  udev: improve udev-cache robustness
  dhcp: move dhcp leases files handling to postinst/postrm
  rootfs_ipk.bbclass: fix detection of script runtime requirement

 meta/classes/rootfs_ipk.bbclass                |   10 ++++++-
 meta/recipes-connectivity/dhcp/dhcp.inc        |   19 +++++++++++++-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb   |    2 +-
 meta/recipes-core/udev/udev.inc                |    8 +++++-
 meta/recipes-core/udev/udev/init               |   33 +++++++++++++++++++++--
 meta/recipes-core/udev/udev/udev-cache         |   14 ++++++++--
 meta/recipes-core/udev/udev/udev-cache.default |    4 +++
 7 files changed, 79 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/udev-cache.default

-- 
1.7.2.5



