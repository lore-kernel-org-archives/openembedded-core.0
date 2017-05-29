Return-Path: <erik.boto@pelagicore.com>
Received: from ORO-EDGE-01.luxoft.com (oro-edge-01.luxoft.com [109.166.244.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1B93E73068
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 06:09:47 +0000 (UTC)
Received: from ORO-HUBT-03.luxoft.com (172.30.115.38) by
	oro-edge-01.luxoft.com (172.30.19.21) with Microsoft SMTP Server (TLS)
	id 14.3.319.2; Mon, 29 May 2017 09:09:46 +0300
Received: from debbie.luxoft.com (172.31.240.101) by ORO-HUBT-03.luxoft.com
	(172.30.115.101) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Mon, 29 May 2017 09:09:46 +0300
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@pelagicore.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 May 2017 08:09:31 +0200
Message-ID: <20170529060935.8093-1-erik.boto@pelagicore.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [172.31.240.101]
Subject: [PATCH v2 0/4] oeqa: fix runtime testing using systemd-boot target
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
X-List-Received-Date: Mon, 29 May 2017 06:09:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When I was setting up automated runtime testing using the systemd-boot
target I hit a couple of bugs that I addressed. There is an open bug
on this in Yocto Bugzilla #11524.

Changes since v1: Added cover letter and references bug from commit msgs

Cheers,
Erik

 meta/lib/oeqa/controllers/masterimage.py | 6 +++---
 meta/lib/oeqa/utils/sshcontrol.py        | 9 +++------
 2 files changed, 6 insertions(+), 9 deletions(-)


