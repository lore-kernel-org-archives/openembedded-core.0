Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 369077BF7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 06:33:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBJ6XYNO017462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 22:33:44 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 18 Dec 2018 22:33:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2018 14:51:09 +0800
Message-ID: <cover.1545202218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] cmake-native: Set --parallel for configure
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
X-List-Received-Date: Wed, 19 Dec 2018 06:33:54 -0000
Content-Type: text/plain

The following changes since commit 14c291e1fb6324da46885b69fbd7f01b3c6b053e:

  gcc-runtime: Add missing libc dependency (2018-12-18 16:19:30 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/cmake
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/cmake

Robert Yang (1):
  cmake-native: Set --parallel for configure

 meta/recipes-devtools/cmake/cmake-native_3.12.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.7.4


