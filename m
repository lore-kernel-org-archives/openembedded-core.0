Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qbjqk-00082g-GV
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 03:45:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5T1gBes024913
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 18:42:11 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 28 Jun 2011 18:42:10 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 20:42:33 -0500
Message-ID: <cover.1309311666.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] Fix prelink to avoid first boot script
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
X-List-Received-Date: Wed, 29 Jun 2011 01:45:54 -0000
Content-Type: text/plain

In most cases the user will have the image-prelink enabled, which will
prelink the target image at image creation time.  If this is enabled
we want to avoid prelinking at first boot.  We do this by setting the
script exit status to '0' if we detect we're on the host.

Also fixes a small bug found in sstate.bbclass: do_cleansstate

The following changes since commit 8a5c20417d4d6bee6dd0bcdbeb8d4f9e0696a216:

  [PATCH] u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:12 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/prelink
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/prelink

Mark Hatle (2):
  sstate.bbclass: Fix an issue if the config changes
  prelink_git.bb: Only block the postinst script when no image-prelink

 meta/classes/sstate.bbclass                  |    2 ++
 meta/recipes-devtools/prelink/prelink_git.bb |    6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.3.4



