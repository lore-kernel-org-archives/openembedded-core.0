Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlpdD-0007sj-8c
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:57:39 +0200
Received: by rex (Postfix, from userid 1000)
	id A25A620D86; Tue, 26 Jul 2011 22:53:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 22:53:12 +0100
Message-Id: <43dd4a73eb628b27bd17708840b3092ee416747d.1311716946.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
References: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
References: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/8] cmake.bbclass: add ${libdir}} for multilib case
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
X-List-Received-Date: Tue, 26 Jul 2011 21:57:39 -0000

From: Yu Ke <ke.yu@intel.com>

    Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/classes/cmake.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 5ac540c..89a154f 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -57,7 +57,7 @@ set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
 set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake/Modules/ )
 
 # add for non /usr/lib libdir, e.g. /usr/lib64
-LIST(APPEND CMAKE_SYSTEM_LIBRARY_PATH ${libdir})
+set( CMAKE_LIBRARY_PATH ${libdir} )
 
 EOF
 }
-- 
1.7.4.1



