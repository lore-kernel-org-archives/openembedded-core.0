Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EBAC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 11:06:40 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web11.14096.1704798393079647716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 03:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=Cl4C5Q83;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: yang.xu@mediatek.com)
X-UUID: 2146defeaedf11ee9e680517dc993faa-20240109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Cmia4ZM6YmWV/93klBgH+ggF194jU3uCzgZe50OwGxI=;
	b=Cl4C5Q83TnHZGS4DS+BplrHyGWs+tYDdmtp/iewdUsDpH/oVXsc/iRbFGlKe5I4PjhxE0WW4/FWi5deuWLy4f17/aNrWhgTTxzpqfboq7WfD50VkaKt9//8u6NC/obhwLo6bivuUQ7KW83ZPUU7v85hli0qFct0+9GWt6cG9iZk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:e3dbaaaf-3874-457f-a4e1-5701c54d55c0,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:5d391d7,CLOUDID:5f01f92e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:N
	O,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2146defeaedf11ee9e680517dc993faa-20240109
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 594339419; Tue, 09 Jan 2024 19:06:25 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 Jan 2024 19:06:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 Jan 2024 19:06:23 +0800
From: <yang.xu@mediatek.com>
To: <openembedded-core@lists.openembedded.org>
CC: Yang Xu <yang.xu@mediatek.com>
Subject: [PATCH] rootfs.py: check depmodwrapper execution result
Date: Tue, 9 Jan 2024 11:05:15 +0000
Message-ID: <20240109110515.7556-1-yang.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.388200-8.000000
X-TMASE-MatchedRID: kdBxcRXBgPWROBVNmXUDuBz2MDiYujy5Ql/FdRYkUZLfUZT83lbkED28
	dBzwO9dQEnlWPkCdw9pa/T+YR97BocescYlXVRmyngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPI34T
	9cYMsdwwjCGGWEJ1nU6mBp/F5rpk1FnMLGqniqkrUL+2pBMCEB1jZ1y9395HzUnzUWk/JYFM+Dq
	ZeO4k8AGxqHqH5qN1zsVEVTCPphHdtUY6LqdlQnFr3vnlc+D6eVZObrZkNVZRlRd/nfa56MaSPB
	BRGVW4o
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.388200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 
	77339FE77E77496272DF72D3EB5B6327ACAD5954CF6FDF63F3F6BCED67F01BBC2000:8
X-MTK: N
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 11:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193451

From: Yang Xu <yang.xu@mediatek.com>

The execution result of depmodwrapper is not checked which makes depmod
generation failed sliently and hard to detect.

So check exection result and stop building if depmodwrapper failed.

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
---
 meta/lib/oe/rootfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 1a48ed10b3..3f27164536 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -349,7 +349,8 @@ class Rootfs(object, metaclass=ABCMeta):
             bb.utils.mkdirhier(versioned_modules_dir)
 
             bb.note("Running depmodwrapper for %s ..." % versioned_modules_dir)
-            self._exec_shell_cmd(['depmodwrapper', '-a', '-b', self.image_rootfs, kernel_ver, kernel_package_name])
+            if self._exec_shell_cmd(['depmodwrapper', '-a', '-b', self.image_rootfs, kernel_ver, kernel_package_name]):
+                bb.fatal("Kernel modules dependency generation failed")
 
     """
     Create devfs:
-- 
2.25.1


