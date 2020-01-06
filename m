Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 288887F95B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 10:29:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 006ATBVk017085
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jan 2020 02:29:11 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 6 Jan 2020 02:29:10 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jan 2020 18:30:31 +0800
Message-ID: <cover.1578306533.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2 0/1] gnupg: Read GNUPG_BINDIR from environment variables for nativesdk
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
X-List-Received-Date: Mon, 06 Jan 2020 10:29:13 -0000
Content-Type: text/plain

* V2
  - Only enable for native and nativesdk, don't enable for target

* V1
  - Initial version

// Robert

The following changes since commit 53cf1241fa4721ba89955146099749d05c5d7171:

  musl: Ensure that B is clean before configure task is run (2020-01-06 00:24:16 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/gnupg
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/gnupg

Robert Yang (1):
  gnupg: Read GNUPG_BINDIR from environment variables for nativesdk

 meta/recipes-support/gnupg/gnupg_2.2.17.bb | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.7.4


