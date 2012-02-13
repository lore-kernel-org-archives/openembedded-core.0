Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rx5OW-0006t9-3K
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 00:33:16 +0100
Received: by eekd41 with SMTP id d41so1695113eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 15:25:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.213.29.205 with SMTP id r13mr18272ebc.5.1329175505738;
	Mon, 13 Feb 2012 15:25:05 -0800 (PST)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id a58sm66210352eeb.8.2012.02.13.15.25.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 15:25:05 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 01:24:56 +0200
Message-Id: <cover.1329175337.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQnnwXTrikBEItI4wA8ThvOsq36anpl3Lmefb+L09N46GWXoNSn4dzhUNwVEvPcqMgHagHk7
Subject: [PATCH v2 0/2] NSPR with tests and patch for RPATH
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
X-List-Received-Date: Mon, 13 Feb 2012 23:33:16 -0000

1. Create a separate commit for removing RPATH from binaries
2. Add QA warning in patch
3. Minor tweaks in bbfile
4. Install tests in ${libdir}/nspr/tests

The following changes since commit 7d0fc3b5ffc2806d921567dbdad3de056069896a:

  nspr: Integrate version 4.8.9 (2012-02-13 22:49:19 +0200)

are available in the git repository at:
  git@git.gherzan.ro:agherzan/yocto-dev devel

Andrei Gherzan (2):
  nspr: Compile nspr with tests
  nspr: Add patch in order to remove rpath from binaries

 .../nspr/files/remove-rpath-from-tests.patch       |   26 ++++
 meta/recipes-support/nspr/nspr_4.8.9.bb            |  136 +++++++++++++++++++-
 2 files changed, 158 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/nspr/files/remove-rpath-from-tests.patch

-- 
1.7.5.4



