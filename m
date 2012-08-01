Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SwVE0-0001u0-76
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 11:28:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q719GbWu002667
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 02:16:37 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 02:16:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 17:14:52 +0800
Message-ID: <cover.1343811985.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] createrepo 0.4.11: create wrapper for python script
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
X-List-Received-Date: Wed, 01 Aug 2012 09:28:38 -0000
Content-Type: text/plain

This is used for fixing the rpm-createsolvedb.py error:

'import site' failed; use -v for traceback
Traceback (most recent call last):
File "/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/build/scripts/rpm-createsolvedb.py", line 14, in 
import sys, os
ImportError: No module named os

// Robert

The following changes since commit 4f31d21bcb1c8c744e9abb33248715afe4a40af0:

  lib/oe/lsb.py: Map unknown distributions to 'Unknown' (2012-07-31 08:02:11 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/createrepo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/createrepo

Robert Yang (2):
  createrepo 0.4.11: add rpm-createsolvedb.py
  createrepo 0.4.11: create wrapper for python script

 meta/classes/rootfs_rpm.bbclass                    |    2 +-
 .../createrepo/createrepo}/rpm-createsolvedb.py    |    0
 .../createrepo/createrepo_0.4.11.bb                |   17 ++++++++++++++++-
 3 files changed, 17 insertions(+), 2 deletions(-)
 rename {scripts => meta/recipes-support/createrepo/createrepo}/rpm-createsolvedb.py (100%)



