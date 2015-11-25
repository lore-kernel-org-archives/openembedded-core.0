Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1765A6057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 20:44:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAPKiVrj016360
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 12:44:31 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 Nov 2015 12:44:30 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Nov 2015 14:44:26 -0600
Message-ID: <1448484269-132667-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 0/3] [jethro/master] Misc fixes
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
X-List-Received-Date: Wed, 25 Nov 2015 20:44:33 -0000
Content-Type: text/plain

The following fixes have been tested on Jethro, I believe they are 
also applicable on master.

Note that the python change fixes an illegal instruction problem -- but in
some of my testing has exposed a second issue where 'unsafe' include/lib 
dir warnings are present.  I'm still working with others for a solution
to that.

Mark Hatle (3):
  allarch.bbclass: allarch packages are having their hashes altered by
    baselib
  python: Fix cross compiling x86->x86
  package_manager.py: Avoid installing an empty package list

 meta/classes/allarch.bbclass                       |  5 +++++
 meta/lib/oe/package_manager.py                     |  3 +++
 .../use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch | 23 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.9.bb       |  4 ++--
 4 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch

-- 
1.9.3


