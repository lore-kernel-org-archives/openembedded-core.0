Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7E06B873
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 07:38:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0D7cFIj021994
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2014 23:38:15 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 12 Jan 2014 23:38:14 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jan 2014 15:38:44 +0800
Message-ID: <cover.1389598673.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Fixes for run-postinsts in sysvinit and systemd
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
X-List-Received-Date: Mon, 13 Jan 2014 07:38:14 -0000
Content-Type: text/plain

The following changes since commit 1b636173ca88e5ccca1992f9a12367a1189fa674:

  bitbake: toaster: Toaster GUI, generic search, filter and order (2014-01-10 15:20:26 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/run-postinsts-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/run-postinsts-fixes

Chen Qi (2):
  run-postinsts: remove the init script after a clean start-up
  systemd-compat-units: make run-postinsts.service work correctly on
    target

 meta/recipes-core/systemd/systemd-compat-units.bb  |    8 --------
 .../systemd-compat-units/run-postinsts.service     |    4 ++--
 .../run-postinsts/run-postinsts/run-postinsts      |   15 +++++++++++----
 3 files changed, 13 insertions(+), 14 deletions(-)

-- 
1.7.9.5


