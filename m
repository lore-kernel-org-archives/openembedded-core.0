Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB0B75843
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 20:00:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jun 2015 13:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,667,1427785200"; d="scan'208";a="749087922"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.55])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2015 13:00:48 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 15:02:40 -0500
Message-Id: <1435089761-27337-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] classes/sstate.bbclass: Improve checkstatus using connection cache.
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
X-List-Received-Date: Tue, 23 Jun 2015 20:00:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch depends on changes did in bitbake [1] and oe/utils.py [2], don't merge
before it.

For complete review exist an integration branch at,

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=alimon/fetch2-wget-checkstatus

[1] http://lists.openembedded.org/pipermail/bitbake-devel/2015-June/005912.html
[2] http://lists.openembedded.org/pipermail/openembedded-core/2015-June/106430.html

Aníbal Limón (1):
  classes/sstate.bbclass: Improve checkstatus using connection cache.

 meta/classes/sstate.bbclass | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

-- 
1.9.1


