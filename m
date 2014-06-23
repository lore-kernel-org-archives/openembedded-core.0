Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB9F6B7D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 02:33:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5N2X3U3027113
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jun 2014 19:33:03 -0700 (PDT)
Received: from pek-kkang-d1.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 22 Jun 2014 19:33:02 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jun 2014 10:32:47 +0800
Message-ID: <cover.1403490121.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 0/5] Update iptables runtime recommends and add default init scripts and configs
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
X-List-Received-Date: Mon, 23 Jun 2014 02:33:04 -0000
Content-Type: text/plain

Update iptables runtime recommends and add default init scripts and configs from redhat. That gives users rudimental configures and users only need to update their own iptables rules.

The following changes since commit 7c1a975a1c2fd884aa9f6f4736656d854a6c5edb:

  bitbake: toaster: Fix spacing and layout in no image files notification (2014-06-20 14:03:58 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/iptables
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/iptables

Kai Kang (5):
  iptables: update RRECOMMENDS
  iptables: add init script and configure file
  iptables: add default rules
  iptables: update rules for ip6tables
  iptables: update init script and bb file

 .../iptables/iptables/ip6tables.rules              |  31 ++
 .../iptables/iptables/iptables-config              |  54 +++
 .../iptables/iptables/iptables.init                | 445 +++++++++++++++++++++
 .../iptables/iptables/iptables.rules               |  30 ++
 meta/recipes-extended/iptables/iptables_1.4.21.bb  |  27 +-
 5 files changed, 586 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/ip6tables.rules
 create mode 100644 meta/recipes-extended/iptables/iptables/iptables-config
 create mode 100755 meta/recipes-extended/iptables/iptables/iptables.init
 create mode 100644 meta/recipes-extended/iptables/iptables/iptables.rules

-- 
1.9.1


