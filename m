Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13020.1794901141594453194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 23:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gECWBp7R;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ragaprasanth@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso1723022a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 23:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794901141; x=1795505941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQzTkPiueYxy/MlduLnSKcN/JQszm4W0BUb4mmUBkDY=;
        b=gECWBp7RyCG5bUjU3JO1beSZnw2OVQ/CJsOtrlPmMIZ12E+R5Y6gLA9cyTk5yByW2Q
         N82luNzwl+VgfLg5e/WapHspH9A5eQMcx0JOYA8lLc87hqAMTfu9mRCc8vLDRTU2tnF2
         z0+TJ/7c+hm9/T6qbOqhI0DzKwykDz+7NPle2ZxrPm4F0UB0Mj5XEk0cKzW81EebRTyN
         u5u9ADd4s/mw9fYwAxJDJKRryrNHRbi5RpJyt8hZx7Bl1nboTgOyodOFJjYVKAxaz2nd
         f80pATGWcNWzs/gF82QVOtnkGgMlzTWUYNfK5H0j+qAdP/DEfpZWcXqhuAIrwiHiqoBu
         WKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901141; x=1795505941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQzTkPiueYxy/MlduLnSKcN/JQszm4W0BUb4mmUBkDY=;
        b=RDDms5c7K0VayQuYUXzbfMdWHVa9TSpSNf3lN/YWmxS8qIVpi1h+gYil1ydDNmrmDA
         Vf448eu58sowdFvxeH0B8a21QA0cJR3OAvqllO1v7c4rZJThv5oINUSXnCFRgTe+CscZ
         Dh7bEPHydQaOJamjefYylvShSr4IQBE11s81AGsLPhed8HfmhAXXzv8zU2/XUAfPAkkB
         i6OJaPTErkx0o8VMSM9q0qkoSXDKPrCNuTQz/cViZ01guZTbtfwZwYC0SoPNu964PR5M
         tFu7kaleDv8dXJWAygQW8l0tF5gTqPb1re21fJ86jyfkOn7ZOy4nmbcJYnAFK5iqQPls
         joTg==
X-Gm-Message-State: APuU4Z8AoRykWIR/dQn/z2VobG7hC4VtSqg8AwOMtLKX90DRFBDSjMrw
	PMC7bVS5QdHqjsBkX/p2yD12tRCEKOoxMuqNTQhAu8ftXtqkcmzcf+iktQLBeM5V
X-Gm-Gg: AZFdTZck/1v1e8EoVyrMJralcprL79KiwVZ70jPeR1ykCgVsbjsmXUbU+O+LOBTgjtT
	5HqVI7EVS7k11/2rAByg/JMu2jvI8hb1PAEG4Hz8gCK+wRujRzUtJJxc+zJMIcj/fwUxNHSsn5j
	aXliq3yV/5CneV5pip/zIYiHRKjyh1MXs5AUMa4OKwKR6JEtgdNj3u3ntrxum+BRmwJntAIRvQV
	Ah/mykjW5mpDLnb0WQd6iBpFmCBbFh7wWK7F3CRjYIIGdBBWnD39VqQxQIiUXVEI6eDSEeXZGdQ
	G4RbcXJfN+Unk86SAg/vOzHUn2RbXVsoqcc9uR3jtwpY3nOk8k//AqSM7emCznh2qN/+w6YSyis
	kAT5Fo4JjVANUY9baYn5Mft1OsJgdQABKFYilFXg5lgILRSgYr2vRiXm7nFtg9fMh8vYSNjYNg5
	EPXxA16phxuDZIKUSGoOZ9nVzxzK2nDUUQUVMiLUonBekHz4LTAuetKH93b/756kiUAUGmak9A2
	T1z1jNnUQ+6HtD7TwKrz5evwX7N8b6w8haKLy3KwHRNNR/9MTO2YpZB93nshfHVcEvam38e3GEc
	P+HJaCjcTsiHA1YNdmdwe6/LYWwdguiIbqZxSqds3c9m5k/KfPAzJ7Ri24SttibWCA==
X-Received: by 2002:a17:90b:3c04:b0:3ac:b6eb:e0dd with SMTP id 98e67ed59e1d1-3b1b0b8e3abmr10487230a91.50.1794901140795;
        Mon, 16 Nov 2026 23:39:00 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4cff6fsm2750297a91.12.2026.11.16.23.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:39:00 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [scarthgap][PATCH 1/2] u-boot: fix CVE-2026-29009
Date: Tue, 17 Nov 2026 16:38:48 +0900
Message-Id: <20261117073849.3089566-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 07:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250409
Content-Type: text/plain; charset="utf-8"

A malicious NFS server can overflow nfs_path_buff with READLINK
replies. Backport the upstream fix, as done for wrynose. It applies
to 2024.01 unchanged.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
Tested: built with CONFIG_CMD_NFS=y for qemux86-64. Also ran
nfs_readlink_reply() from the unpatched and patched 2024.01 source
under AddressSanitizer with two 1100-byte READLINK replies: without
this patch it overflows nfs_path_buff, with it the second reply is
dropped.

 .../u-boot/files/CVE-2026-29009.patch         | 53 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
new file mode 100644
index 0000000000..35f168005e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
@@ -0,0 +1,53 @@
+From d6694018eaddefac6aae974f9cec72fd6e58f1bc Mon Sep 17 00:00:00 2001
+From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
+Date: Thu, 9 Apr 2026 10:44:40 -0600
+Subject: [PATCH] net: nfs: fix buffer overflow in nfs_readlink_reply()
+
+nfs_readlink_reply() validates rlen only against the incoming packet
+length (inherited from CVE-2019-14195), but not against the destination
+buffer nfs_path_buff[2048]. A malicious NFS server can send a valid
+READLINK reply where pathlen + rlen exceeds sizeof(nfs_path_buff),
+overflowing the BSS buffer into adjacent memory.
+
+The recent fix in fd6e3d34097f addressed the same overflow class in
+net/lwip/nfs.c but left the legacy path in net/nfs-common.c unpatched.
+
+Add bounds checks before both memcpy calls in nfs_readlink_reply():
+- relative path branch: reject if pathlen + rlen >=
+  sizeof(nfs_path_buff)
+- absolute path branch: reject if rlen >= sizeof(nfs_path_buff)
+
+Fixes: cf3a4f1e86 ("net: nfs: Fix CVE-2019-14195")
+
+CVE: CVE-2026-29009
+
+Upstream-Status: Backport [https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc]
+
+Cc: stable@vger.kernel.org
+Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
+Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+---
+ net/nfs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index 537d4c62..9b628ecf 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -698,11 +698,15 @@ static int nfs_readlink_reply(uchar *pkt, unsigned len)
+ 
+ 		strcat(nfs_path, "/");
+ 		pathlen = strlen(nfs_path);
++		if (pathlen + rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path + pathlen,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
+ 		nfs_path[pathlen + rlen] = 0;
+ 	} else {
++		if (rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
index 7eaeed1004..6aa98e1740 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
@@ -13,4 +13,5 @@ SRC_URI += "file://CVE-2024-57254.patch \
             file://CVE-2024-57259.patch \
             file://CVE-2024-42040.patch \
             file://CVE-2026-46728.patch \
+            file://CVE-2026-29009.patch \
 "
-- 
2.34.1

