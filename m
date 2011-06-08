Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QUNho-00040p-Of
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 20:42:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p58IctSk025366
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jun 2011 11:38:56 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 8 Jun 2011 11:38:55 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jun 2011 13:48:55 -0500
Message-ID: <cover.1307558785.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] pseudo: Update pseudo to 1.1.1 version V3
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
X-List-Received-Date: Wed, 08 Jun 2011 18:42:17 -0000
Content-Type: text/plain

Hopefully third and final version.  The patch that is part of this has been
contribed to and reviewed upstream.  (Not yet accepted upstream)

V3 fixes an issue with building on a 32-bit host.

The following changes since commit 30101d4153aa8e116892063933b868d325bdd79c:

  distro tracking: Manual Updates (2011-06-06 23:51:26 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/pseudo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/pseudo

Mark Hatle (2):
  pseudo: Update pseudo to 1.1.1 version
  distro_tracking_fields.inc: add pseudo

 .../conf/distro/include/distro_tracking_fields.inc |    6 ++
 meta/recipes-devtools/pseudo/pseudo.inc            |   20 +++++--
 .../recipes-devtools/pseudo/pseudo/oe-config.patch |   58 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.0.bb         |    9 ---
 meta/recipes-devtools/pseudo/pseudo_1.1.1.bb       |   10 ++++
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    7 ++-
 6 files changed, 92 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/oe-config.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.0.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.1.1.bb

-- 
1.7.3.4



