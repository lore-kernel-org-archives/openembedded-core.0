Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1StlyN-0003er-AD
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 22:44:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6OKXLIo028695
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 13:33:21 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 24 Jul 2012 13:33:21 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jul 2012 15:46:00 -0500
Message-ID: <cover.1343162715.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Add missing Upstream-Status entries.
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
X-List-Received-Date: Tue, 24 Jul 2012 20:44:56 -0000
Content-Type: text/plain

Add missing Upstream-Status entries, no code changes.

The following changes since commit 4148bc80c008d25c8a536c7c7dfdeac1669a6662:

  libgcc: Add missing dependency on libc:do_package (2012-07-24 10:12:08 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/status
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/status

Mark Hatle (1):
  Add missing Upstream-Status to various patches.

 .../binutils/binutils/binutils-armv5e.patch        |    4 ++++
 .../ossp-uuid/0001-Change-library-name.patch       |    7 +++++++
 ...erve-m-option-status-in-v-option-handling.patch |    7 +++++++
 .../ossp-uuid/0003-Fix-whatis-entries.patch        |    7 +++++++
 .../ossp-uuid/0004-fix-data-uuid-from-string.patch |    7 +++++++
 .../ossp-uuid/ossp-uuid/uuid-libtool.patch         |    3 +++
 .../ossp-uuid/ossp-uuid/uuid-nostrip.patch         |    3 +++
 meta/recipes-devtools/rpm/rpm/rpm-lua.patch        |    2 ++
 meta/recipes-devtools/rpm/rpm/rpm-macros.patch     |    2 ++
 .../rpm/rpm/rpm-no-perl-urpm.patch                 |    2 ++
 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch  |    2 ++
 .../rpm/rpm/rpm-packageorigin.patch                |    2 ++
 .../rpm/rpm/rpm-pkgconfigdeps.patch                |    2 ++
 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |    2 ++
 .../libzypp/libzypp/libzypp-rpm549.patch           |    4 ++++
 .../createrepo/createrepo/createrepo-rpm549.patch  |    3 +++
 16 files changed, 59 insertions(+), 0 deletions(-)

-- 
1.7.3.4



