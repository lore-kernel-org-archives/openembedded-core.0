Return-Path: <gernot.hillier@siemens.com>
X-Greylist: delayed 548 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Apr 2017 08:15:58 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 969A173081
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 08:15:57 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v3K86mil016480
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 10:06:48 +0200
Received: from linux-mf4q.internal.hillier.de ([146.254.78.32])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id v3K86l2Z023143
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 10:06:47 +0200
From: Gernot Hillier <gernot.hillier@siemens.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <c2cca2c5-c122-e738-0008-4ff3119259bb@siemens.com>
Date: Thu, 20 Apr 2017 10:06:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
Subject: [PATCH v2 0/2] tcf-agent: fix CDT target debugging
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
X-List-Received-Date: Thu, 20 Apr 2017 08:15:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Default recipe for tcf-agent disabled a number of features because of
historic build problems on ARM dating back to tcf-agent 0.0+svnr1855
(from 2011). We re-enable them for all archs besides mips. For arm64,
we additionally need to fix MACHINE setting to make those features
compile again.

Without those features, target debugging using Eclipse Neon and CDT
with TCF 1.4 plugin didn't work in our tests. This is the default
debugging mode in the Xilinx Vivado SDK.

This series contains updated version of patch to address mips and arm64
issues, thx to Richard Purdie for pointing me to this! Patch v1 was
sent to poky ML in error.

--
Gernot Hillier
Siemens AG, Corporate Competence Center Embedded Linux

