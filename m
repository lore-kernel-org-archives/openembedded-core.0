Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9950A78459
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 21:39:55 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1dLyyC-0001o1-31 from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Jun 2017 14:39:56 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 16 Jun 2017 14:39:53 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jun 2017 16:39:49 -0500
Message-ID: <20170616213952.35679-1-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.9.4
MIME-Version: 1.0
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH 0/3] LTTng updates
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
X-List-Received-Date: Fri, 16 Jun 2017 21:39:55 -0000
Content-Type: text/plain

Minor version updates; lttng-modules gains support for 4.12-rc kernels.

Nathan Lynch (3):
  lttng-ust: update to 2.9.1
  lttng-tools: update to 2.9.5
  lttng-modules: update to 2.9.3

 .../lttng/{lttng-modules_2.9.2.bb => lttng-modules_2.9.3.bb}          | 4 ++--
 .../lttng/{lttng-tools_2.9.4.bb => lttng-tools_2.9.5.bb}              | 4 ++--
 meta/recipes-kernel/lttng/{lttng-ust_2.9.0.bb => lttng-ust_2.9.1.bb}  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.9.2.bb => lttng-modules_2.9.3.bb} (89%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.9.4.bb => lttng-tools_2.9.5.bb} (97%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.9.0.bb => lttng-ust_2.9.1.bb} (90%)

-- 
2.9.4


