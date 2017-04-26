Return-Path: <gernot.hillier@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 629B277CC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 10:57:53 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id v3QAvr9M002374
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 26 Apr 2017 12:57:54 +0200
Received: from linux-mf4q.internal.hillier.net (md1jennc.ww002.siemens.net
	[139.25.68.7] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id v3QAvrTS026631;
	Wed, 26 Apr 2017 12:57:53 +0200
From: Gernot Hillier <gernot.hillier@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Apr 2017 12:57:43 +0200
Message-Id: <20170426105745.8551-1-gernot.hillier@siemens.com>
X-Mailer: git-send-email 2.12.0
Cc: eugene.tarassov@xilinx.com
Subject: [PATCH v4 0/2] tcf-agent: fix target debugging with Eclipse CDT
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
X-List-Received-Date: Wed, 26 Apr 2017 10:57:56 -0000

Default recipe for tcf-agent disabled a number of features because of
historic build problems on ARM dating back to tcf-agent 0.0+svnr1855
(from 2011). We re-enable them for all archs besides mips and libc-musl.
For arm64, we additionally need to fix MACHINE setting to make those
features compile again.

Without those features, target debugging using Eclipse Neon and CDT
with TCF 1.4 plugin didn't work in our tests. This is the default
debugging mode in the Xilinx Vivado SDK.

Thanks to Eugene, main TCF developer, for reviewing the patches!

Series history:
v1: enable default tcf-agent features on all archs, sent to Poky ML
v2: address build break on mips and arm64, thx to Richard Purdie for 
    pointing me to this!
v3: Sent using git-send-email to fix line wrapping (sorry!)
v4: address build break on libc-musl, thx to Ross Burton for the hint

--
Gernot Hillier
Siemens AG, Corporate Competence Center Embedded Linux


Gernot Hillier (2):
  tcf-agent: fix machine setting for arm64 build
  tcf-agent: enable default target debugging features

 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

-- 
2.12.0


