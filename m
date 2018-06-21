Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14BD56FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 05:57:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5L5vZox010436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 22:57:50 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 20 Jun 2018 22:57:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2018 14:00:21 +0800
Message-ID: <cover.1529478911.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] avahi: reorder codes and fix error
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
X-List-Received-Date: Thu, 21 Jun 2018 05:58:00 -0000
Content-Type: text/plain

The following changes since commit 53dfa673d78216f852a47bdb48392ee213e3e1cd:

  musl: Upgrade to latest (2018-06-18 11:07:58 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/avahi-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/avahi-fix

Chen Qi (2):
  avahi: reorganize codes
  avahi: fix error at boot time for avahi-daemon.service

 meta/recipes-connectivity/avahi/avahi-ui_0.7.bb    | 16 +----
 meta/recipes-connectivity/avahi/avahi.inc          | 84 +++-------------------
 meta/recipes-connectivity/avahi/avahi_0.7.bb       | 84 ++++++++++++++++++----
 .../0001-Fix-opening-etc-resolv.conf-error.patch   | 40 +++++++++++
 4 files changed, 124 insertions(+), 100 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-error.patch

-- 
1.9.1


