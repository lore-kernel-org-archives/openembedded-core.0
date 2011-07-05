Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qe4VB-0000MZ-CI
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 14:13:17 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Tue, 5 Jul 2011
	14:01:47 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2011 14:01:38 +0200
Message-ID: <cover.1309867242.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/1] Fix external module compilations
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
X-List-Received-Date: Tue, 05 Jul 2011 12:13:17 -0000
Content-Type: text/plain


When compiling an external module, the compilation errors out, when
scripts/basic/fixdep and later on scripts/mod/modpost is being requested. The
removal of 'make -C $kerneldir _mrproper_scripts' fixes these problems.

The following changes since commit 69eeb3d2276e5b10d084b47d308ecfc8daf8b467:

  qt4: ensure target packages don't include host binaries (2011-07-05 11:28:59 +0100)

are available in the git repository at:
  git://github.com/darander/oe-core fixdep
  https://github.com/darander/oe-core/tree/fixdep

Anders Darander (1):
  kernel.bbclass: make external module compile

 meta/classes/kernel.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

-- 
1.7.4.1



