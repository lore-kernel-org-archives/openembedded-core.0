Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RY4Xo-0007bf-Gu
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 00:35:28 +0100
Received: from mizar.localdomain (87.14.251.117) by smtp205.alice.it
	(8.6.023.02) id 4ECA5FDA02EDBAD9; Wed, 7 Dec 2011 00:23:18 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 00:23:05 +0100
Message-Id: <cover.1323212403.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/2] rework jffs2 images creation, add jffs2 summary
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
X-List-Received-Date: Tue, 06 Dec 2011 23:35:28 -0000

* The first patch adds support for the creation of
* jffs2 summary images for a faster mount.
* The second patch forces the --no-cleanmarkers option
* to further improve boot time.

Andrea Adami (2):
  image_types.bbclass: implement jffs2 summary images (sum.jffs2)
  image_types.bbclass: disable cleanmarkers for jffs2 images

 meta/classes/image_types.bbclass |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

-- 
1.7.3.4



