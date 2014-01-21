Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 85F5F6A463
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 10:22:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0LAM7Ng017645
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 02:22:07 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 21 Jan 2014 02:22:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jan 2014 18:22:20 +0800
Message-ID: <cover.1390298848.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] guile: don't use the identifier 'noreturn'
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
X-List-Received-Date: Tue, 21 Jan 2014 10:22:07 -0000
Content-Type: text/plain

The following changes since commit eb0dc3fca77d82c21ad05330b006258ef363dba2:

  e2fsprogs/populate-extfs.sh: fix a problem on dash (2014-01-20 17:25:58 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/ag
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/ag

Robert Yang (1):
  guile: don't use the identifier 'noreturn'

 .../guile/files/guile_2.0.9_fix_noreturn.patch     | 65 ++++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.9.bb         |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/guile_2.0.9_fix_noreturn.patch

-- 
1.8.3.1


