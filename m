Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9561E7894A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 03:13:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w763DHDq010523
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Aug 2018 20:13:17 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Sun, 5 Aug 2018 20:13:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Aug 2018 11:17:24 +0800
Message-ID: <cover.1533524621.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] oe_syslog.py: fix for syslog-ng
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
X-List-Received-Date: Mon, 06 Aug 2018 03:13:16 -0000
Content-Type: text/plain

Changes in V2:
* Run 'ps' only once, get rid of grep command and use python to check the existence of syslog daemon.

The following changes since commit da24071e92071ecbefe51314d82bf40f85172485:

  bitbake: toaster/orm/management/commands/lsupdates.py: Use new layerindexlib module (2018-08-02 10:18:27 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/oe_syslog
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/oe_syslog

Chen Qi (1):
  oe_syslog.py: fix for syslog-ng

 meta/lib/oeqa/runtime/cases/oe_syslog.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
1.9.1


