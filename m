Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D9D8273E36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:08:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B98hV3013229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:08:44 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 11 Jun 2015 02:08:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 02:08:40 -0700
Message-ID: <cover.1434013682.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] Fixes for PACKAGECONFIG
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
X-List-Received-Date: Thu, 11 Jun 2015 09:08:43 -0000
Content-Type: text/plain

The following changes since commit 7f85e74d5c53b34e5f470967fdbdbd19fed1929a:

  sysvinit: Only enable recipe in builds where its applicable (2015-06-10 12:03:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pkgconfig
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pkgconfig

Robert Yang (3):
  base.class: warn for invalid PACKAGECONFIG
  bluez5: remove alsa from PACKAGECONFIG
  libpcap: fix PACKAGECONFIG

 meta/classes/base.bbclass                     |    5 +++++
 meta/recipes-connectivity/bluez5/bluez5.inc   |    2 +-
 meta/recipes-connectivity/libpcap/libpcap.inc |    2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.7.9.5


