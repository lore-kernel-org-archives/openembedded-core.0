Return-Path: <gernot.hillier@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 2F86672001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 19:06:53 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v3KJ6rkX018701
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 21:06:53 +0200
Received: from linux-mf4q.internal.hillier.de.hillier.de ([146.254.78.32])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id v3KJ6rCC003654;
	Thu, 20 Apr 2017 21:06:53 +0200
From: Gernot Hillier <gernot.hillier@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 21:06:40 +0200
Message-Id: <20170420190642.14868-1-gernot.hillier@siemens.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH v3 0/2] tcf-agent: fix CDT target debugging
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
X-List-Received-Date: Thu, 20 Apr 2017 19:06:54 -0000

Default recipe for tcf-agent disabled a number of features because of
historic build problems on ARM dating back to tcf-agent 0.0+svnr1855
(from 2011). We re-enable them for all archs besides mips. For arm64,
we additionally need to fix MACHINE setting to make those features
compile again.

Without those features, target debugging using Eclipse Neon and CDT
with TCF 1.4 plugin didn't work in our tests. This is the default
debugging mode in the Xilinx Vivado SDK.

Series history:
v1: enable default tcf-agent features on all archs, sent to Poky ML
v2: address build break on mips and arm64, thx to Richard Purdie for 
    pointing me to this!
v3: Sent using git-send-email to fix line wrapping (sorry!)

--
Gernot Hillier
Siemens AG, Corporate Competence Center Embedded Linux

Gernot Hillier (2):
  tcf-agent: fix machine setting for arm64 build
  tcf-agent: enable default target debugging features

 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.12.0


