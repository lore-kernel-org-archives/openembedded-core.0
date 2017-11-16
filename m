Return-Path: <vlsireddy@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id B3679787C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:45:59 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id 8so13690qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kEygUDM+tHxLEChzJ8sr208ltG/zYb3qkwlBPAOnyDM=;
	b=oAT8c9BDz4tREZPNbxoCP1ZqIhkDATaiIxlrzE2MKwTC9JbQxcCPP2ddu/N20eKj8R
	mfmuy6gdvcv/gp6EbJhjbnB52usFEkq0CiP0WYGfD3ap7WZN/rYr7DCX6wdYJAx3f8lK
	Qd+75P9SEy3+cuoNCH4bImEM56nl5KqYtDWv++GIlpYo/m5lv/qS9hQCgOD0h1L6zNYO
	N3HXtuu5j20UJcxWD3ylKD0JQj8wrx5MmcqLCzwry5XJSI9YQOIjyLrl9G5JNuXXlrvJ
	6XNaZiMvr8dD7BF/CfoHD3mooTaYIdiz5xmlgVYFQdjM7vkYFQ1qenhSc2TQAxip8U5A
	+ISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kEygUDM+tHxLEChzJ8sr208ltG/zYb3qkwlBPAOnyDM=;
	b=ovgrViOYHcf2MDpSaTC6HIfKbMdM8M/cWnaY47PaPNTveweXa3DZ8MX3ec1aJ/Cu3x
	0Y7r3OEhU1qwPgJ9mYapfof7ZAWybaZuka+KoQWH1tFphn8LyO9nAPa2MTJut81z+ETL
	hq490EsQbCLtw6ic3Q5PAHDfLMPbPqQK9NtwX/VCM1xs5+aO5Zx5GIaAjTsCAS1/td7O
	BK0vJ5MjKilJ/4fp+1YcHeBkHchJdpDFpQLf9PfP67EofMPqadqkOB+U1xb5rimZzxar
	obWQb/9v0/HpJg6sR13GhdH1FVjIuEpXDm5qXIQBYDmAeQM8EDQusOCMUNqHP1tBwnj2
	U8Iw==
X-Gm-Message-State: AJaThX7GJWEtqkIfQL3V0eg4czg/vh9xrkbHf605EFotm4eQad0ARW0o
	CgQHaoASyQhIXP4s5hsfHdJexg==
X-Google-Smtp-Source: AGs4zMbDRln/0HxijhRIj7ChuhbVocrl3CVE4Qn8GvEauda8SCfnIWiwT/xqtPXt4+ho2rJ5T0zH0A==
X-Received: by 10.200.18.9 with SMTP id x9mr3084638qti.211.1510857960164;
	Thu, 16 Nov 2017 10:46:00 -0800 (PST)
Received: from airvana.wirelessworld.airvananet.com
	(host-131-239-32-100.customer.veroxity.net. [131.239.32.100])
	by smtp.gmail.com with ESMTPSA id y58sm1304937qtb.9.2017.11.16.10.45.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Nov 2017 10:45:59 -0800 (PST)
From: RC Reddy <vlsireddy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 13:46:38 -0500
Message-Id: <1510857998-15877-1-git-send-email-vlsireddy@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: RC Reddy <vlsireddy@gmail.com>
Subject: [meta-oe][PATCH V2]ethtool updated to 4.13] ethtool bb: upgraded the .bb to pick latest ethtool-4.13.tar.xz
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
X-List-Received-Date: Thu, 16 Nov 2017 18:45:59 -0000

4.13 Release notes :

	* Fix: Do not return error code if no changes were attempted.
	* Fix: Fix formatting of advertise bitmask
	* Feature: Document 56000 advertise link modes
	* Fix: fix the rx vs tx mixup in set channel message
	* Feature: add support for HWTSTAMP_FILTER_NTP_ALL
	* Feature: Add DMA Coalescing support
	* Feature: Remove UDP Fragmentation Offload error prints
	* Feature: stmmac: Add macros for number of registers
	* Feature: stmmac: Add DMA HW Feature Register

John W. Linville

more info at this link

https://marc.info/?l=linux-netdev&m=150912901726399&w=2

Tests : - Compiled and tested the ethtool 4.13 package from
https://www.kernel.org/pub/software/network/ethtool/ethtool-4.13.tar.xz
using AARCH64 compiler [compilation succeed and also the binary works]

Signed-off-by: RC Reddy <vlsireddy@gmail.com>
---
 meta/recipes-extended/ethtool/{ethtool_4.11.bb => ethtool_4.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.11.bb => ethtool_4.13.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.11.bb b/meta/recipes-extended/ethtool/ethtool_4.13.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.11.bb
rename to meta/recipes-extended/ethtool/ethtool_4.13.bb
index befe9b9..c862a57 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.11.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.13.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "8f1072679888c9335e49b17efb798b4c"
-SRC_URI[sha256sum] = "af2fd9692f3159d3ab1e41e6f9b7d8db2a4693f1cb22348c88ba89f70f0e6503"
+SRC_URI[md5sum] = "2ba44eb0ca96752392e9bf8dc83ba302"
+SRC_URI[sha256sum] = "d311c4b557c44c5248ac5436b9e19c391a60d8e4830b6a7f41be16d89c0556de"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
1.9.1


