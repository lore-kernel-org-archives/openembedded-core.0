Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87AC76BDAA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 06:56:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r846uixL007106
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2013 23:56:44 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 3 Sep 2013 23:56:42 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2013 14:56:39 +0800
Message-ID: <cover.1378276893.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2] make runlevel to return correct value
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
X-List-Received-Date: Wed, 04 Sep 2013 06:56:42 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 8c272641ef3e8410f331ca4133d28dea8f36e4f4:

  lib/oeqa/runtime: smart: serve repo on host ip only and increase timeout (2013-09-03 19:57:31 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/systemd-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/systemd-1

Roy.Li (2):
  systemd-compat-units: do not create runlevel command
  systemd: link runlevel from systemctl

 meta/recipes-core/systemd/systemd-compat-units.bb |    5 -----
 meta/recipes-core/systemd/systemd_206.bb          |    6 +++++-
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
1.7.10.4


