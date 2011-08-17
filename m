Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtgGr-0000Pf-MG
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 15:35:01 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	15:30:20 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2011 15:30:28 +0200
Message-ID: <504d88a25e251e3422d4b07600b26f96e6d60653.1313587776.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313587776.git.anders@chargestorm.se>
References: <cover.1313587776.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH 2/2] scripts/runqemu: modify search paths for libgl
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
X-List-Received-Date: Wed, 17 Aug 2011 13:35:01 -0000
Content-Type: text/plain

On e.g. Debian libql is found under /usr/lib/x86_64-linux-gnu/libGL.so.
Use a wildcard to match different locations, as uname -i only return unknown on Debian.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 scripts/runqemu |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2b8e88a..ed8c05b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -388,7 +388,7 @@ libgl='no'
 
 test -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so && libgl='yes'
 test -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so && libgl='yes'
-test -e /usr/lib/`uname -i`-linux-gnu/libGL.so -a -e /usr/lib/`uname -i`-linux-gnu/libGLU.so && libgl='yes'
+test -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so && libgl='yes'
 
 if [ "$libgl" != 'yes' ]; then
     echo "You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.
-- 
1.7.5.4



