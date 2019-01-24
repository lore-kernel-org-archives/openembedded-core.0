Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A61060116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:53:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O6rDse009440
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:53:13 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 22:53:12 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2019 22:53:10 -0800
Message-ID: <cover.1548312757.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/2] Fixes for DEBUG_BUILD
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
X-List-Received-Date: Thu, 24 Jan 2019 06:53:12 -0000
Content-Type: text/plain

The following changes since commit a4edfa4cf451bf412525887b5b24b9db6486ae97:

  remove unused distutils-tools.bbclass (2019-01-23 07:57:02 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/debug
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/debug

Robert Yang (2):
  native.bbclass/cross.bbclass: No strip sysroot when DEBUG_BUILD
  bitbake.conf: Add DEBUG_BUILD to vardeps

 meta/classes/cross.bbclass  | 3 +++
 meta/classes/native.bbclass | 3 +++
 meta/conf/bitbake.conf      | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.10.2


