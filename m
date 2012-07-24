Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1StcPS-0006xK-Qo
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 12:32:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6OAKgcx001870
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 03:20:42 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 24 Jul 2012 03:20:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jul 2012 18:19:57 +0800
Message-ID: <cover.1343124846.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] package-index: inherit pythonnative
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
X-List-Received-Date: Tue, 24 Jul 2012 10:32:11 -0000
Content-Type: text/plain

This is used for fixing the rpm-createsolvedb.py error:

'import site' failed; use -v for traceback
Traceback (most recent call last):
File "/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/build/scripts/rpm-createsolvedb.py", line 14, in 
import sys, os
ImportError: No module named os

// Robert

The following changes since commit 0ffb02eec2beaea27ff0ec9d3d31b0a09e675a4c:

  documentation: Updated the h6 style to use a larger font (2012-07-24 10:35:34 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/package_index
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/package_index

Robert Yang (1):
  package-index: inherit pythonnative

 meta/recipes-core/meta/package-index.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)



