Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F35D770F9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 01:44:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7K1ivSk005171
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 18:44:57 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Aug 2016 18:44:57 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 20:44:53 -0500
Message-ID: <cover.1471657381.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 0/2] prelink changes
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
X-List-Received-Date: Sat, 20 Aug 2016 01:44:57 -0000
Content-Type: text/plain

Re-enable prelink on ARM and PPC.  The detected failures are not related to
anything inside of prelink, the binaries failed to execute before prelinking.

The other patch fixes the IFUNC resolution problem inside of glibc itself.
The scope was being resolved depth first, not breadth first as indicated in
the ELF specification.

The following changes since commit d3e5c1d17f80b3dd7a6d85e07b5c0c516f09ae93:

  local.conf.sample: Disable ARM and PPC due to prelink test case failures (2016-08-19 10:23:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib mhatle/prelink
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=mhatle/prelink

Mark Hatle (2):
  glibc: Fix scope resolution in glibc to be breadth first.
  Revert "local.conf.sample: Disable ARM and PPC due to prelink test
    case failures"

 meta/conf/local.conf.sample                        |  9 ----
 .../glibc/glibc/0026-build_local_scope.patch       | 56 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb              |  1 +
 3 files changed, 57 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-build_local_scope.patch

-- 
2.5.5


