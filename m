Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61156609AC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 06:39:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s636drfj026727
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jul 2014 23:39:53 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Jul 2014 23:39:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jul 2014 14:54:36 +0800
Message-ID: <cover.1404370293.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] meta: fix no newline at end of file
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
X-List-Received-Date: Thu, 03 Jul 2014 06:39:58 -0000
Content-Type: text/plain

The following changes since commit c36d459f0d40bdbd3ba809835e0475e8992bc778:

  python3: fix builtins imports (2014-06-30 16:35:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/oe_noeol
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/oe_noeol

Robert Yang (1):
  meta: fix no newline at end of file

 meta/classes/meta.bbclass                                               | 2 +-
 meta/recipes-bsp/pointercal/pointercal_0.0.bb                           | 2 +-
 meta/recipes-connectivity/dhcp/files/default-relay                      | 2 +-
 meta/recipes-core/udev/udev/run-ptest                                   | 2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service             | 2 +-
 meta/recipes-extended/lighttpd/lighttpd/index.html.lighttpd             | 2 +-
 .../x11-common/x11-common/etc/X11/Xsession.d/89xdgautostart.sh          | 2 +-
 meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch                 | 2 +-
 meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch               | 2 +-
 meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop    | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.8.3.1


