Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F854776A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:21:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u879Lvu2031587
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2016 02:21:57 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 02:21:56 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Sep 2016 17:22:35 +0800
Message-ID: <cover.1473240119.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] systemd: add support to manage user units
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
X-List-Received-Date: Wed, 07 Sep 2016 09:21:57 -0000
Content-Type: text/plain

The following changes since commit 55bb6816aca39bfa25d4f7e2158a57a5f0ac1cca:

  oeqa.buildperf: correct globalres time format (2016-09-06 10:24:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-user-units
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-user-units

Chen Qi (3):
  systemd-systemctl: add option to manage user services
  systemd.bbclass: add support to manage user services
  pulseaudio: fix to manage user services corretly

 meta/classes/systemd.bbclass                       | 17 ++++++--
 .../systemd/systemd-systemctl/systemctl            | 45 ++++++++++++++--------
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  4 +-
 3 files changed, 43 insertions(+), 23 deletions(-)

-- 
1.9.1


