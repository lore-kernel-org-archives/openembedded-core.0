Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B835C6C49B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 09:30:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAT9USKv008633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 01:30:28 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 29 Nov 2018 01:30:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Nov 2018 17:37:23 +0800
Message-ID: <cover.1543484174.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] netbase: add entry to /etc/hosts according to /etc/hostname
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
X-List-Received-Date: Thu, 29 Nov 2018 09:30:27 -0000
Content-Type: text/plain

Changes in V2:
* use ${sysconfdir} instead of /etc
* check the existence of entry before adding it

The following changes since commit 41d89552620bfbc94031d314e6b3d0324f7a330e:

  bitbake: fetch2: Avoid warning about incorrect character escaping in regex (2018-11-27 22:15:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/netbase-hosts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/netbase-hosts

Chen Qi (1):
  netbase: add entry to /etc/hosts according to /etc/hostname

 meta/recipes-core/netbase/netbase_5.4.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
1.9.1


