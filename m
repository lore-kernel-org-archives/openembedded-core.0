Return-Path: <Meng.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7487F2E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 09:58:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8B9vshw012073
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 02:58:04 -0700
Received: from pek-mli1-d1.wrs.com (128.224.162.173) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 11 Sep 2019 02:57:43 -0700
From: <Meng.Li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2019 17:59:46 +0800
Message-ID: <1568195987-11106-1-git-send-email-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [v2] [yocto] : tune-cortexa57-cortexa53: add tune file for ARM Cortex-A53-Cortex-A57
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
X-List-Received-Date: Wed, 11 Sep 2019 09:58:13 -0000
Content-Type: text/plain

From: Limeng <Meng.Li@windriver.com>

Recently, I am working on renesas-rcar platform based on yocto-2.7,
and I found there is no arm-cortexa57-cortexa53 tunes for Renesas H3/M3 SoC.
Therefore, add this kind of ARM-Cortex-Tune.

Detail patches as below:

0001-tune-cortexa57-cortexa53-add-tunes-for-ARM-Cortex-A5.patch

 tune-cortexa57-cortexa53.inc |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)


thanks,
Limeng


