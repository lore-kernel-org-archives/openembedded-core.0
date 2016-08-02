Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE2C6E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 08:51:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u728pU2C000402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2016 01:51:30 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 2 Aug 2016 01:51:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Aug 2016 01:51:26 -0700
Message-ID: <cover.1470127858.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/3] Packages upgrade
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
X-List-Received-Date: Tue, 02 Aug 2016 08:51:31 -0000
Content-Type: text/plain

The following changes since commit 986f7fbe37a48d050611f08f7160ed96755ac3dc:

  foomatic-filters: Security fixes CVE-2015-8327 (2016-08-01 12:11:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (3):
  libcap-ng: 0.7.7 -> 0.7.8
  strace: 4.12 -> 4.13
  tcl: 8.6.5 -> 8.6.6

 .../strace/strace/Makefile-ptest.patch               | 12 ++++--------
 .../strace/{strace_4.12.bb => strace_4.13.bb}        |  4 ++--
 meta/recipes-devtools/tcltk/tcl/no_packages.patch    | 20 ++++++++++----------
 .../tcltk/{tcl_8.6.5.bb => tcl_8.6.6.bb}             |  4 ++--
 .../{libcap-ng_0.7.7.bb => libcap-ng_0.7.8.bb}       |  4 ++--
 5 files changed, 20 insertions(+), 24 deletions(-)
 rename meta/recipes-devtools/strace/{strace_4.12.bb => strace_4.13.bb} (91%)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.5.bb => tcl_8.6.6.bb} (95%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.7.7.bb => libcap-ng_0.7.8.bb} (89%)

-- 
2.9.0


