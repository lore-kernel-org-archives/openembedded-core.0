Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35D896CC79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 09:24:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA19OvaB009030
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2013 02:24:57 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 1 Nov 2013 02:24:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Nov 2013 01:26:37 +0800
Message-ID: <cover.1383326626.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/2] sanity.bbclass: check that TMPDIR is not located on nfs
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
X-List-Received-Date: Fri, 01 Nov 2013 09:24:56 -0000
Content-Type: text/plain

The following changes since commit 523f2a9ea970713fb775bc48f84b67420b1106a0:

  cross-canadian: Improve comment (2013-10-30 18:01:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbty/nfs_check
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbty/nfs_check

Robert Yang (2):
  sanity.bbclass: move check_path_length(TMPDIR) to
    check_sanity_everybuild
  sanity.bbclass: check that TMPDIR is not located on nfs

 meta/classes/sanity.bbclass | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

-- 
1.8.3.1


