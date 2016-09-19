Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 491C0601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 09:18:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8J9IxIM007453
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 02:19:00 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 02:18:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Sep 2016 02:18:57 -0700
Message-ID: <cover.1474276405.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] runqemu-gen-tapdevs: remove /etc/runqemu-nosudo when remove taps
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
X-List-Received-Date: Mon, 19 Sep 2016 09:19:02 -0000
Content-Type: text/plain

The following changes since commit 5ac0604fdc7d5b783011c43d476210b427b5dae0:

  build-appliance-image: Create image in correct location (2016-09-19 08:58:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rq-gen-tap
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rq-gen-tap

Robert Yang (1):
  runqemu-gen-tapdevs: remove /etc/runqemu-nosudo when remove taps

 scripts/runqemu-gen-tapdevs | 46 +++++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

-- 
2.9.0


