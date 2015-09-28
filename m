Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B196755FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 07:09:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8S79kaN021019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 00:09:47 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 28 Sep 2015 00:09:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Sep 2015 00:09:45 -0700
Message-ID: <cover.1443424138.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [yocto 2.1] [PATCH 0/1] toolchain-shar-relocate.sh: make it faster
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
X-List-Received-Date: Mon, 28 Sep 2015 07:09:50 -0000
Content-Type: text/plain

The following changes since commit d5cf21179d9f8d3c053316b0864d72fc609f5423:

  gdk-pixbuf: Avoid rebuild failures (2015-09-24 17:53:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sdk_time
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sdk_time

Robert Yang (1):
  toolchain-shar-relocate.sh: make it faster

 meta/files/toolchain-shar-relocate.sh |   24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

-- 
1.7.9.5


