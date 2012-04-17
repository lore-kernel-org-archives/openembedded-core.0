Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SK8FI-00022I-71
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 15:15:00 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 15:05:20 +0200
Message-Id: <1334667923-13908-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1334667923-13908-1-git-send-email-obi@opendreambox.org>
References: <1334667923-13908-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/5] mirrors: remove snapshot.debian.net
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
X-List-Received-Date: Tue, 17 Apr 2012 13:15:00 -0000

* snapshot.debian.net returns HTML pages for archives it doesn't
  contain, causing unpredictably broken downloads.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/mirrors.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index bf23e05..4196992 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -1,5 +1,4 @@
 MIRRORS += "\
-${DEBIAN_MIRROR}/main	http://snapshot.debian.net/archive/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.de.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.au.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.cl.debian.org/debian/pool \n \
-- 
1.7.5.4



