Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4B4872D2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:48:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4B6mFTW012022
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:48:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 10 May 2015 23:48:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 23:48:12 -0700
Message-ID: <cover.1431326848.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] Package Upgrades
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
X-List-Received-Date: Mon, 11 May 2015 06:48:16 -0000
Content-Type: text/plain

The following changes since commit 7ffe10df73cc20d10fcd41b121074445273bd60e:

  license_class: license_create_manifest improvment (2015-05-09 22:26:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (3):
  libpcre: 8.36 -> 8.37
  apr: 1.5.1 -> 1.5.2
  ghostscript: 9.15 -> 9.16

 .../ghostscript-9.02-parallel-make.patch           |  932 --------------------
 .../ghostscript-9.02-prevent_recompiling.patch     |   20 +-
 .../ghostscript-9.16-Werror-return-type.patch      |   30 +
 .../{ghostscript_9.15.bb => ghostscript_9.16.bb}   |   15 +-
 .../apr/apr/upgrade-and-fix-1.5.1.patch            |   11 +-
 .../apr/{apr_1.5.1.bb => apr_1.5.2.bb}             |    4 +-
 .../libpcre/{libpcre_8.36.bb => libpcre_8.37.bb}   |    6 +-
 7 files changed, 58 insertions(+), 960 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.15.bb => ghostscript_9.16.bb} (90%)
 rename meta/recipes-support/apr/{apr_1.5.1.bb => apr_1.5.2.bb} (95%)
 rename meta/recipes-support/libpcre/{libpcre_8.36.bb => libpcre_8.37.bb} (91%)

-- 
1.7.9.5


