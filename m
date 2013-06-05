Return-Path: <andy.voltz@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8476A598
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 15:53:20 +0000 (UTC)
Received: from bob-linux.timesys.com (192.168.3.27) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0;
	Wed, 5 Jun 2013 11:53:20 -0400
From: Andy Voltz <andy.voltz@timesys.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 5 Jun 2013 11:52:28 -0400
Message-ID: <1370447550-23693-1-git-send-email-andy.voltz@timesys.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Simplify tune-cortexa*.inc, and add cortex-a5 tuning
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
X-List-Received-Date: Wed, 05 Jun 2013 15:53:20 -0000
Content-Type: text/plain

This series puts the common tuning setup in an include and reworks the
tuning files for each cortex-a* series to use that include. A new variable,
CORTEX_ID is used to specify which processor is used.

Add a tuning file for the cortex-a5 using this include.

This was tested on a vybrid twr_vf600 build which uses cortex-a5.


