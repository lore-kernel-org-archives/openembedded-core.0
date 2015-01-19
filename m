Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1F8272C3C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 07:11:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0J7BWWr002734
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 23:11:32 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 23:11:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 23:11:27 -0800
Message-ID: <cover.1421651378.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] meta: 4 fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Jan 2015 07:11:35 -0000
Content-Type: text/plain

Hello,

I had sent the patch "cpan-base.bbclass: avoid using xxx" before, now
send it again. The other 3 are new.

// Robert

The following changes since commit eaea05c88661a88a89fa6b139f7e6b243155d492:

  depmodwrapper-cross: Update to use STAGING_KERNEL_BUILDDIR (2015-01-17 17:05:25 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/4fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/4fixes

Robert Yang (4):
  cpan-base.bbclass: avoid using immmediate assignment for PERLLIBDIRS
  python3: fix for cross compiling
  gnutls: fix sed command
  perf: fix for rebuilding

 meta/classes/cpan-base.bbclass                     |    4 +-
 .../python/python3-native_3.3.3.bb                 |    2 +
 ...p.py-check-cross_compiling-when-get-FLAGS.patch |   50 ++++++++++++++++++
 .../sysconfig.py-add-_PYTHON_PROJECT_SRC.patch     |   54 ++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.3.3.bb      |   10 ++--
 meta/recipes-kernel/perf/perf.bb                   |    3 ++
 .../gnutls/configure.ac-fix-sed-command.patch      |   31 +++++++++++
 meta/recipes-support/gnutls/gnutls_3.3.11.bb       |    1 +
 8 files changed, 149 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/setup.py-check-cross_compiling-when-get-FLAGS.patch
 create mode 100644 meta/recipes-devtools/python/python3/sysconfig.py-add-_PYTHON_PROJECT_SRC.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch

-- 
1.7.9.5


