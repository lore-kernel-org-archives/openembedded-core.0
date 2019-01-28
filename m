Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 675A76D545
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 09:00:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0S90p41023003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 01:00:51 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Mon, 28 Jan 2019 01:00:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jan 2019 17:19:22 +0800
Message-ID: <cover.1548667130.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] base.bbclass: Use bb.event.ParseStarted for HOSTTOOLS
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
X-List-Received-Date: Mon, 28 Jan 2019 09:00:51 -0000
Content-Type: text/plain

The following changes since commit ebc96f2f612ebc1b7aefb06935bb308fc2e40cfd:

  libtool: Fix ignoring compiler-rt libs (2019-01-26 23:11:39 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ht
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ht

Robert Yang (1):
  base.bbclass: Use bb.event.ParseStarted for HOSTTOOLS

 meta/classes/base.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.7.4


