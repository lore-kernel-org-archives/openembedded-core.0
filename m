Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjdnC-0002lE-Ib
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 22:54:54 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6KKolMf030522
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:50:47 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 13:50:44 -0700
Message-Id: <cover.1311191810.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2 0/1] Resync siteinfo.bbclass with oe.dev
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
X-List-Received-Date: Wed, 20 Jul 2011 20:54:54 -0000

Hey all,

This is the second of two pull requests.  This doesn't depend on the first
request, it's just splitting changes up.  There's three changes here.  First,
site/ix86-common was setting the wrong value for unsigned int.  Second,
change perl to use SITEINFO variables rather than functions.  
We're down to one change now to re-sync siteinfo.bbclass with oe-core
and oe.dev.  This re-works the functions a bit inside siteinfo.bbclass
to be easier to add new platforms (and hopefully multilibs) to.

My next step is to work on merging and verifying as much as possible
the site files in oe-core and oe.dev.

v2: Rework based on Richard's comments to not be a generator and just
return a string list again.

The following changes since commit 0d03800caffc2341b74190d38f7a372223c89f4c:
  Mei Lei (1):
        lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib trini/update-siteinfo-bbclass-v2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-siteinfo-bbclass-v2

Tom Rini (1):
  siteinfo.bbclass: Port over oe.dev logic for site files

 meta/classes/siteinfo.bbclass |  203 ++++++++++++++++++++---------------------
 1 files changed, 98 insertions(+), 105 deletions(-)
 create mode 100644 meta/site/common-linux



