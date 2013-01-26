Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TzAcl-0003oE-5z
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 19:37:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0QILTve006393
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2013 10:21:30 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Sat, 26 Jan 2013 10:21:29 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Jan 2013 12:21:27 -0600
Message-ID: <cover.1359224379.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] skip filedeps per-package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Jan 2013 18:37:09 -0000
Content-Type: text/plain

The existing checks for SKIP_FILEDEPS allow it to be turned on and
off per recipe, but provide no way to turn it on and off per package,
except by giving packages particular magic names like *-locale-*. Add
a check against SKIP_FILEDEPS_pkg, parallel to FILES_pkg.

The following changes since commit cc490d76aba0a778409ca1a3d0e1f2c308684c9b:
  Paul Eggleton (1):
        valgrind: explicitly disable MPI2 support

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/skip_filedeps
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/skip_filedeps

Peter Seebach (1):
  package.bbclass: Allow per-package SKIP_FILEDEPS

 meta/classes/package.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)



