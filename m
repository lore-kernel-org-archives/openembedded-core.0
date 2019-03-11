Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B37F66BE26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 09:58:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2B9vlmL020278
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 02:57:58 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Mon, 11 Mar 2019 02:57:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2019 18:16:54 +0800
Message-ID: <cover.1552299354.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] oe-init-build-env: Error out when failed to locate cwd
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
X-List-Received-Date: Mon, 11 Mar 2019 09:58:07 -0000
Content-Type: text/plain

The following changes since commit 28e631d6dbc0a126253c0a072b8f39ff683bfa3a:

  python: time.tzset missing (2019-03-09 14:41:20 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/init
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/init

Robert Yang (1):
  oe-init-build-env: Error out when failed to locate cwd

 oe-init-build-env | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.7.4


