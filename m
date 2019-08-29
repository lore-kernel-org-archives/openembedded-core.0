Return-Path: <Meng.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0017F307
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 02:02:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7T22PmN013601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:02:35 -0700
Received: from pek-mli1-d1.wrs.com (128.224.162.173) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 28 Aug 2019 19:02:15 -0700
From: <Meng.Li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Aug 2019 10:03:49 +0800
Message-ID: <1567044231-27951-1-git-send-email-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [yocto] : ARM-Cortex-Tune: Add 2 kinds of ARM-Cortex-Tune
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
X-List-Received-Date: Thu, 29 Aug 2019 02:02:45 -0000
Content-Type: text/plain

From: Limeng <Meng.Li@windriver.com>


Recently, I am working on renesas-rcar platform based on yocto-2.7,
and I found there are no arm-cortexa57 and arm-cortexa57-cortexa53
tunes for some Renesas SoC.
Therefore, add 2 kinds of ARM-Cortex-Tune.

Detail patches as below:

0001-tune-cortexa57-cortexa53-add-tunes-for-ARM-Cortex-A5.patch
0002-tune-cortexa57-add-tunes-for-ARM-Cortex-A57.patch

 tune-cortexa57-cortexa53.inc |   18 ++++++++++++++++++
 tune-cortexa57.inc           |   18 ++++++++++++++++++
 2 files changed, 36 insertions(+)


thanks,
Limeng


