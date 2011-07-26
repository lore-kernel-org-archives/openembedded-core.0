Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlqWV-0001Cv-FQ
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 00:54:47 +0200
Received: by rex (Postfix, from userid 1000)
	id B3207201DD; Tue, 26 Jul 2011 23:50:25 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 23:50:24 +0100
Message-Id: <cover.1311720062.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] Multilib image/package backend enablement
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
X-List-Received-Date: Tue, 26 Jul 2011 22:54:47 -0000

The following three patches enable very basic multilib support for 
the opkg and rpm backends.

They are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rpurdie/ml5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/ml5

Lianhao Lu (2):
  package(rootfs)_ipk.bbclass: support multilib in opkg backend.
  image.bbclass: Added variables for multilib support.

Mark Hatle (1):
  package/rootfs_rpm: Implement RPM multilib package handling

 meta/classes/image.bbclass       |   54 +++++++++-
 meta/classes/package_ipk.bbclass |   51 +++++++++
 meta/classes/package_rpm.bbclass |  229 ++++++++++++++++++++++++--------------
 meta/classes/rootfs_ipk.bbclass  |    2 +
 meta/classes/rootfs_rpm.bbclass  |   17 +++-
 5 files changed, 266 insertions(+), 87 deletions(-)

-- 
1.7.4.1



