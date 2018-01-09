Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD9C57896E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 01:37:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w091budH008399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jan 2018 17:37:58 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 8 Jan 2018 17:37:54 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jan 2018 09:40:08 +0800
Message-ID: <cover.1515461823.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] coreutils: upgrade to 8.29
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
X-List-Received-Date: Tue, 09 Jan 2018 01:37:58 -0000
Content-Type: text/plain

Changes in V2:
* Drop the backported patch 0001-doc-fix-Up-field-of-realpath-usage-examples.
  This fixes do_compile failure on opensuse.

The following changes since commit 205cfd702190026e64eed9cae27c05ff62d1637e:

  bitbake: fetch2/__init__: Disable pseudo in runfetchcmd() (2018-01-08 08:48:54 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/coreutils-8.29
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/coreutils-8.29

Chen Qi (1):
  coreutils: upgrade to 8.29

 ...c-fix-Up-field-of-realpath-usage-examples.patch | 40 ----------------------
 .../man-decouple-manpages-from-build.patch         | 27 ---------------
 .../{coreutils_8.28.bb => coreutils_8.29.bb}       | 25 ++++----------
 3 files changed, 6 insertions(+), 86 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-doc-fix-Up-field-of-realpath-usage-examples.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/man-decouple-manpages-from-build.patch
 rename meta/recipes-core/coreutils/{coreutils_8.28.bb => coreutils_8.29.bb} (79%)

-- 
1.9.1


