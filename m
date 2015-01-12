Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 389BC72498
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 23:35:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0CNZlWd000169
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 15:35:47 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 12 Jan 2015 15:35:46 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Jan 2015 15:35:42 -0800
Message-ID: <cover.1421105154.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] meta: 4 fixes
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
X-List-Received-Date: Mon, 12 Jan 2015 23:35:57 -0000
Content-Type: text/plain

The following changes since commit b61a2acc321489c3427f0afa3059486dc144a13b:

  bind: Update libxml2 check to make it deterministic. (2015-01-08 09:21:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/4fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/4fixes

Robert Yang (4):
  libical: use BPN in SRC_URI
  cups: remove fakeroot from do_install()
  man: remove fakeroot from do_install()
  portmap: remove obsolete lines

 meta/recipes-connectivity/portmap/portmap.inc      |   19 +------------------
 .../destdir-no-strip.patch                         |    0
 .../{portmap-6.0 => portmap}/tcpd-config.patch     |    0
 meta/recipes-connectivity/portmap/portmap_6.0.bb   |    2 +-
 meta/recipes-extended/cups/cups.inc                |    2 +-
 meta/recipes-extended/man/man_1.6g.bb              |    2 +-
 meta/recipes-support/libical/libical_1.0.0.bb      |    2 +-
 7 files changed, 5 insertions(+), 22 deletions(-)
 rename meta/recipes-connectivity/portmap/{portmap-6.0 => portmap}/destdir-no-strip.patch (100%)
 rename meta/recipes-connectivity/portmap/{portmap-6.0 => portmap}/tcpd-config.patch (100%)

-- 
1.7.9.5


