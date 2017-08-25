Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C7869783DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:36:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7P9atfr008507
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 02:37:00 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 24 Aug 2017 23:14:29 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Aug 2017 02:14:27 -0400
Message-ID: <cover.1503641622.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] rng-tools: add systemd service file
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
X-List-Received-Date: Fri, 25 Aug 2017 09:36:58 -0000
Content-Type: text/plain

The following changes since commit a087e0bc765ade6386720f22d842e2fc0bd5f128:

  maintainers.inc: assign newly added recipes (2017-08-24 16:49:57 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/rng-tools-add-systemd-service-file
  https://github.com//tree/dengke/rng-tools-add-systemd-service-file

Dengke Du (1):
  rng-tools: add systemd service file

 meta/recipes-support/rng-tools/rng-tools/rngd.service |  9 +++++++++
 meta/recipes-support/rng-tools/rng-tools_5.bb         | 14 ++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/rngd.service

-- 
2.8.1


