Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BD3CB719B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 23:07:05 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1cR5VR-0002mS-D7 from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2017 15:07:05 -0800
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 10 Jan 2017 15:07:03 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2017 17:06:55 -0600
Message-ID: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH 0/5] LTTng, Babeltrace updates
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
X-List-Received-Date: Tue, 10 Jan 2017 23:07:07 -0000
Content-Type: text/plain

Update LTTng components and Babeltrace to their latest available
tagged stable releases.

Nathan Lynch (5):
  lttng-ust: don't exclude manual pages from build
  lttng-ust: upgrade to 2.9.0
  lttng-modules: upgrade to 2.9.0
  lttng-tools: upgrade to 2.9.3
  babeltrace: upgrade to 1.5.1

 .../{babeltrace_1.5.0.bb => babeltrace_1.5.1.bb}   |   5 +-
 ...lttng-modules_git.bb => lttng-modules_2.9.0.bb} |  10 +-
 .../0001-Fix-error.h-common-error.h.patch          |  33 -----
 meta/recipes-kernel/lttng/lttng-tools/run-ptest    |   5 +-
 .../utils-remove-bogus-interpreter.patch           |  35 +++++
 .../{lttng-tools_git.bb => lttng-tools_2.9.3.bb}   | 142 +++++++++++----------
 .../lttng-ust/lttng-ust-doc-examples-disable.patch |   2 +-
 .../lttng/{lttng-ust_git.bb => lttng-ust_2.9.0.bb} |  13 +-
 8 files changed, 122 insertions(+), 123 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.0.bb => babeltrace_1.5.1.bb} (81%)
 rename meta/recipes-kernel/lttng/{lttng-modules_git.bb => lttng-modules_2.9.0.bb} (84%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-common-error.h.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-interpreter.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_git.bb => lttng-tools_2.9.3.bb} (39%)
 rename meta/recipes-kernel/lttng/{lttng-ust_git.bb => lttng-ust_2.9.0.bb} (84%)

-- 
2.7.4


