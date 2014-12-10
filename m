Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BFB6D601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:44:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2014 21:44:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,550,1413270000"; d="scan'208";a="645258201"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2014 21:44:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 21:44:45 -0800
Message-Id: <cover.1418190099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/4] Import Python Modules for Toaster
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
X-List-Received-Date: Wed, 10 Dec 2014 05:44:57 -0000

These 4 python modules are needed by toaster, since we want to have a 
complete environment, we need add these python modules to oe-core so
that toaster can run.

Sau!

The following changes since commit 219e793907406eabf632e784e3a11ab9acb77cfb:

  qemu/libc-package: Fix qemu option handling (2014-12-05 17:59:42 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/pymodules
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/pymodules

Saul Wold (4):
  python-pip: Add version 1.5.6
  python-wsgiref: Add new Version 0.1.2
  python-south: Add new version 1.0.1
  python-django: Add new version 1.7.1

 .../recipes-devtools/python/python-django_1.7.1.bb | 21 ++++++++++++++++++
 meta/recipes-devtools/python/python-pip_1.5.6.bb   | 15 +++++++++++++
 meta/recipes-devtools/python/python-south_1.0.1.bb | 19 ++++++++++++++++
 .../python/python-wsgiref_0.1.2.bb                 | 25 ++++++++++++++++++++++
 4 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-django_1.7.1.bb
 create mode 100644 meta/recipes-devtools/python/python-pip_1.5.6.bb
 create mode 100644 meta/recipes-devtools/python/python-south_1.0.1.bb
 create mode 100644 meta/recipes-devtools/python/python-wsgiref_0.1.2.bb

-- 
1.8.3.1


