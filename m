Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C58C473779
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 07:33:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97252732"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2015 15:37:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5I7Vt7a013184
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 15:31:55 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 18 Jun 2015 15:33:45 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jun 2015 15:24:44 +0800
Message-ID: <1434612286-52367-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 0/2] libmpc: add a GPLv2 recipe
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
X-List-Received-Date: Thu, 18 Jun 2015 07:33:47 -0000
Content-Type: text/plain

Same as other recipe such as bash, we should provide both GPLv3 and !GPLv3 recipe

Bian Naimeng (2):
  libmpc: move 'LICENSE' into version specified recipe
  libmpc: add a GPLv2 recipe

 .../libmpc-0.9/libmpc_fix_for_automake-1.12.patch  | 26 ++++++++++++++++++++++
 meta/recipes-support/libmpc/libmpc.inc             |  1 -
 meta/recipes-support/libmpc/libmpc_0.9.bb          | 16 +++++++++++++
 meta/recipes-support/libmpc/libmpc_1.0.2.bb        |  1 +
 4 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libmpc/libmpc-0.9/libmpc_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libmpc/libmpc_0.9.bb

-- 
1.9.1


