Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CB77C6D159
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 12:34:41 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Vgw8B-0006hv-Ht from Paul_Woegerer@mentor.com ;
	Thu, 14 Nov 2013 04:34:43 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 14 Nov 2013 04:34:43 -0800
Received: from atv-pwoegere-l3.atv.mentorg.com ([172.30.72.59]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 14 Nov 2013 04:34:42 -0800
From: Paul Woegerer <paul_woegerer@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2013 13:34:31 +0100
Message-Id: <1384432474-20764-1-git-send-email-paul_woegerer@mentor.com>
X-Mailer: git-send-email 1.8.4.2
X-OriginalArrivalTime: 14 Nov 2013 12:34:42.0872 (UTC)
	FILETIME=[E4D0AB80:01CEE135]
Cc: otavio@ossystems.com.br
Subject: [PATCH 0/3] lttng: Update to lttng 2.3.1 (for userspace)
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
X-List-Received-Date: Thu, 14 Nov 2013 12:34:41 -0000

This patch series provides minor version updates for the userspace components
of lttng 2.3. The corresponding update for the kernel side (lttng-modules
update to 2.3.3) will be provided by Otavio Salvador.

Paul Woegerer (3):
  liburcu: Update to version 0.7.9
  lttng-ust: Update to version 2.3.1
  lttng-tools: Update to version 2.3.1

 .../lttng/{lttng-tools_2.3.0.bb => lttng-tools_2.3.1.bb}          | 4 ++--
 .../lttng/{lttng-ust_2.3.0.bb => lttng-ust_2.3.1.bb}              | 8 ++++----
 .../liburcu/{liburcu_0.7.7.bb => liburcu_0.7.9.bb}                | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.3.0.bb => lttng-tools_2.3.1.bb} (96%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.3.0.bb => lttng-ust_2.3.1.bb} (80%)
 rename meta/recipes-support/liburcu/{liburcu_0.7.7.bb => liburcu_0.7.9.bb} (81%)

-- 
1.8.4.2


