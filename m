Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED3D46D561
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:53:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8P2rIHZ002484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 19:53:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 24 Sep 2019 19:53:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2019 11:07:48 +0800
Message-ID: <cover.1569380793.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: mark /etc as updated to avoid unnecessary services to run
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
X-List-Received-Date: Wed, 25 Sep 2019 02:53:18 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 81f9e815d36848761a9dfa94b00ad998bb39a4a6:

  build-appliance-image: Update to master head revision (2019-09-19 20:32:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/etc-updated
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/etc-updated

Chen Qi (1):
  systemd: mark /etc as updated to avoid unnecessary services to run

 meta/classes/rootfs-postcommands.bbclass | 6 ++++++
 meta/recipes-core/systemd/systemd_243.bb | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.9.1


