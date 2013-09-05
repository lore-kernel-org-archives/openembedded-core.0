Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 496AF61617
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:01:03 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VHVR2-0004l7-SH from Paul_Woegerer@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Sep 2013 02:01:04 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 5 Sep 2013 02:01:04 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com.com ([172.30.72.2]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 5 Sep 2013 02:01:03 -0700
From: Paul Woegerer <paul_woegerer@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 11:00:57 +0200
Message-Id: <1378371660-5061-1-git-send-email-paul_woegerer@mentor.com>
X-Mailer: git-send-email 1.8.4
X-OriginalArrivalTime: 05 Sep 2013 09:01:04.0227 (UTC)
	FILETIME=[73642B30:01CEAA16]
Subject: [PATCH 0/3] lttng: update to lttng 2.3.0
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
X-List-Received-Date: Thu, 05 Sep 2013 09:01:04 -0000

Resending patch series (now with --signoff -M):

Since lttng 2.3.0 (Dominus Vobiscum) was released today I have updated the respective recipes.

Tested kernel and userspace tracing with TARGET qemux86 as described by:
http://www.yoctoproject.org/docs/latest/profile-manual/profile-manual.html#lttng-linux-trace-toolkit-next-generation

Noteworthy changes:
http://lttng.org/lttng-toolchain-230-out

Paul Woegerer (3):
  lttng-ust: Update to version 2.3.0
  lttng-tools: Update to version 2.3.0
  lttng-modules: Update to version 2.3.0

 meta/recipes-kernel/lttng/lttng-modules_git.bb                        | 4 ++--
 .../lttng/{lttng-tools_2.2.3.bb => lttng-tools_2.3.0.bb}              | 4 ++--
 meta/recipes-kernel/lttng/{lttng-ust_2.2.1.bb => lttng-ust_2.3.0.bb}  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.2.3.bb => lttng-tools_2.3.0.bb} (93%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.2.1.bb => lttng-ust_2.3.0.bb} (93%)

-- 
1.8.4


