Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D99B67F266
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 08:24:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0068Oumn027061
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jan 2020 00:24:57 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 6 Jan 2020 00:24:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jan 2020 16:26:16 +0800
Message-ID: <cover.1578299099.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] gnupg: Read GNUPG_BINDIR from environment variables for nativesdk
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
X-List-Received-Date: Mon, 06 Jan 2020 08:24:57 -0000
Content-Type: text/plain

The following changes since commit 53cf1241fa4721ba89955146099749d05c5d7171:

  musl: Ensure that B is clean before configure task is run (2020-01-06 00:24:16 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/gnupg
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/gnupg

Robert Yang (1):
  gnupg: Read GNUPG_BINDIR from environment variables for nativesdk

 meta/recipes-support/gnupg/gnupg_2.2.17.bb | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

-- 
2.7.4


