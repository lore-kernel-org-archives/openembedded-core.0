Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3D473D91
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 07:29:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T7TuY9027166
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 00:29:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 00:29:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 00:29:52 -0700
Message-ID: <cover.1430292533.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] Package upgrade
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
X-List-Received-Date: Wed, 29 Apr 2015 07:29:57 -0000
Content-Type: text/plain

The following changes since commit 4dd4b96b6d60246338bb30ede9f3ab1b2e757be9:

  libxfont: Security Advisory - libxfont - CVE-2015-1804 (2015-04-28 07:56:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (4):
  man-pages: 3.82 -> 3.83
  git: 2.3.5 -> 2.3.7
  ltp: 20150119 -> 20150420
  rpcbind: 0.2.2 -> 0.2.3

 .../git/{git_2.3.5.bb => git_2.3.7.bb}             |    8 +-
 .../ltp/{ltp_20150119.bb => ltp_20150420.bb}       |    4 +-
 .../{man-pages_3.82.bb => man-pages_3.83.bb}       |    4 +-
 ...001-Avoid-use-of-glibc-sys-cdefs.h-header.patch |  109 ++++++++++----------
 .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |   60 -----------
 .../rpcbind/{rpcbind_0.2.2.bb => rpcbind_0.2.3.bb} |   10 +-
 6 files changed, 65 insertions(+), 130 deletions(-)
 rename meta/recipes-devtools/git/{git_2.3.5.bb => git_2.3.7.bb} (41%)
 rename meta/recipes-extended/ltp/{ltp_20150119.bb => ltp_20150420.bb} (97%)
 rename meta/recipes-extended/man-pages/{man-pages_3.82.bb => man-pages_3.83.bb} (86%)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.2.bb => rpcbind_0.2.3.bb} (87%)

-- 
1.7.9.5


