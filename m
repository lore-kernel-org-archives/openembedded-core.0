Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3BB37089F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 08:33:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s778XtGK021270
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Aug 2014 01:33:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 7 Aug 2014 01:33:54 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Aug 2014 16:34:00 +0800
Message-ID: <cover.1407400378.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Two fixes about systemd
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
X-List-Received-Date: Thu, 07 Aug 2014 08:34:05 -0000
Content-Type: text/plain

The following changes since commit 1fafe7ccc563d5ac9e41f5c1de93d2736745b512:

  ghostscript: Remove bogus gsfonts reference from DESCRIPTION (2014-08-06 11:14:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd_alsa-state_v86d
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd_alsa-state_v86d

Chen Qi (2):
  alsa-state: install init script only when 'sysvinit' is in
    DISTRO_FEATURES
  v86d: fix for systemd to load uvesafb module correctly

 meta/recipes-bsp/alsa-state/alsa-state.bb |   10 +++++++---
 meta/recipes-bsp/v86d/v86d/uvesafb.conf   |    2 ++
 meta/recipes-bsp/v86d/v86d_0.1.10.bb      |   14 ++++++++++++--
 3 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/v86d/v86d/uvesafb.conf

-- 
1.7.9.5


