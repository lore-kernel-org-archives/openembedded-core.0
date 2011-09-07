Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1ATD-0005a8-Su
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 07:14:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Sep 2011 22:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="45746971"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.148])
	by orsmga002.jf.intel.com with ESMTP; 06 Sep 2011 22:09:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 22:09:24 -0700
Message-Id: <ce89d4cce119831c52599e4edef125bc3c586348.1315371835.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315371835.git.sgw@linux.intel.com>
References: <cover.1315371835.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315371835.git.sgw@linux.intel.com>
References: <cover.1315371835.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] cpan.bbclass: fix native perl issue
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
X-List-Received-Date: Wed, 07 Sep 2011 05:14:44 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/cpan.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index cb1c2f4..587e688 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -24,7 +24,8 @@ cpan_do_configure () {
 		for f in `find -name Makefile.PL`; do
 			f2=`echo $f | sed -e 's/.PL//'`
 			sed -i -e "s:\(PERL_ARCHLIB = \).*:\1${PERL_ARCHLIB}:" \
-			$f2
+				-e 's/perl.real/perl/' \
+				$f2
 		done
 	fi
 }
-- 
1.7.6



