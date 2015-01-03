Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B39D7275B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Jan 2015 14:39:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t03EdNVP002638
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Jan 2015 06:39:24 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 3 Jan 2015 06:39:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 3 Jan 2015 06:39:19 -0800
Message-ID: <cover.1420295873.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: 3 fixes
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
X-List-Received-Date: Sat, 03 Jan 2015 14:39:25 -0000
Content-Type: text/plain

Hello,
For the first patch:
cpan-base.bbclass: avoid using immmediate assignment for PERLLIBDIRS

I'm not sure what changes recently cause I meet the error, does anyone
have any idea, please ?

// Robert

The following changes since commit 24f19fedb40d0af84beb8e9a6595ea06f09d4615:

  gstreamer1.0-omx: use mulitple SCMs to fetch submodules (2014-12-31 08:22:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/3fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rtb/3fixes

Robert Yang (3):
  cpan-base.bbclass: avoid using immmediate assignment for PERLLIBDIRS
  cups: check avahi before use it
  cogl: enable egl-x11 when build with x11

 meta/classes/cpan-base.bbclass                     |    4 +--
 meta/recipes-extended/cups/cups.inc                |    1 +
 ...1-test-ippserver.c-check-avahi-before-use.patch |   34 ++++++++++++++++++++
 meta/recipes-graphics/cogl/cogl-1.0.inc            |    6 ++--
 4 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/cups/cups/0001-test-ippserver.c-check-avahi-before-use.patch

-- 
1.7.9.5


