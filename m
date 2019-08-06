Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0DCA7F35E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 11:06:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x76B5C40008214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Aug 2019 04:06:03 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 6 Aug 2019 04:05:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Aug 2019 19:31:02 +0800
Message-ID: <cover.1565090985.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2 0/1] stress-ng: Add bash to RDEPENDS_stress-ng-bash-completion
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
X-List-Received-Date: Tue, 06 Aug 2019 11:06:17 -0000
Content-Type: text/plain

* V2
  - Fix RDEPENDS as RP suggested

* V1
  - Initial version

The following changes since commit 88c6be81a5fbed098999fbef5576c5e0bb90cc21:

  opensbi: handle deploy task under sstate (2019-08-06 11:24:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/stress-ng
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/stress-ng

Robert Yang (1):
  stress-ng: Add bash to RDEPENDS_stress-ng-bash-completion

 meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.7.4


