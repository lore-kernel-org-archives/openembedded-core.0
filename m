Return-Path: <Lu.Jiang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40729792BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 10:03:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7UA3JZa010466
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:03:19 -0700 (PDT)
Received: from pek-ljiang0-d1.wrs.com (128.224.162.214) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 03:03:18 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2018 18:01:15 +0800
Message-ID: <1535623282-13919-1-git-send-email-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/7] wic:allow wic compile as an individual package
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
X-List-Received-Date: Thu, 30 Aug 2018 10:03:18 -0000
Content-Type: text/plain


This patch set intend to allow wic compile as an individual package, then it can run both on host & target side.

On host, it invoke by image_type_wic.bbclass to as a native tool to generate wic image.

Patch 1-4 make wic compile as a native tool.

On trarget, it parse wks file, and use current rootfs & /boot folder to generated a new wic image on target.

Patch 5-6 fix a few minor issue on target. 

The patch is validate with mkefidisk.wks from oe-core layer on intel x86 platform.

Assume /dev/sda2 is root device, then with following command, use could generate a new wic image

	$mount /dev/sda2 /tmp/sda
	$wic create /root/mkefidisk.wks  -k /boot -r /tmp/sda -o /tmp/ 

The generated image is under /tmp with name mkefidisk-xxx-sda.direct. Then user may dump this file into another booting deivce.


Thanks
Jiang Lu

