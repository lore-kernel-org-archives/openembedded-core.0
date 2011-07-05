Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qe73U-00070k-2t
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 16:56:52 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Tue, 5 Jul 2011
	16:53:01 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2011 16:52:56 +0200
Message-ID: <cover.1309877488.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/1] Remove exported KERNEL_SOURCE
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
X-List-Received-Date: Tue, 05 Jul 2011 14:56:52 -0000
Content-Type: text/plain


Remove KERNEL-SOURCE as an exported variable. 
When building an external module the 
STAGING_KERNEL_DIR variable can justbas well be used in
the module recipe.

The following changes since commit 2b3bf5350861f62435e2fdf1c56c8a02f4b1b4ac:

  xauth: upgrade from 1.05 to 1.06 (2011-07-04 12:45:01 +0100)

are available in the git repository at:
  git://github.com/darander/oe-core kernel-source
  https://github.com/darander/oe-core/tree/kernel-source

Anders Darander (1):
  module-base: remove KERNEL-SOURCE

 meta/classes/module-base.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

-- 
1.7.4.1



