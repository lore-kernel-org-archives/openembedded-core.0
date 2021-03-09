Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [])
 by mx.groups.io with SMTP id smtpd.web09.11299.1615306213740675164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 08:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=hyF9eUth;
 spf=fail (domain: wdc.com, ip: <nil>, mailfrom: prvs=695091433=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1615306214; x=1646842214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8bb8RXYRJu6kS7UPx2j5pyYJE9+3ZFAE5BoKlWdzStg=;
  b=hyF9eUthyeNKIJjbIUuI7K/mPrR1NuOL3JYIfD5Q6B/Za7i4B+cR3ptd
   1c11lbnz8o1a37rzGFfvQBvyKZFUR/FjZXLgLoPQSw3W8aew0d3iRWPSz
   CdCZgUWfaAomnE+4ld7vIRjzzWaeqzpMA/uWhqG0pEc+WTO6az4gsrknp
   FTTOzYYEyBczUwZAhVW/4K0z/VDeOmKnO0WgSCpgTKMWdG3KCYm1OVHYD
   9qz2M7MAcCF7sEVze64CWPIFWyCVR4u7LSautnk8rpBDu3BBa0iyPM9hB
   BNqlmdRpMpGNlN/qe4dGPds3b83Qmkd9sn6m7K3PKYw/g118pUONKOEpP
   w==;
IronPort-SDR: 36bDlgYYTfMbcwFIAa2GCalrz7tW8IscQO5jQ2poA3wie/zK3uqZkqdiNDnLvkMKqslrydGvuf
 Jn/PZjQKBwlNIppBRGsGNjVH4Q18JVLVtfP73IV/QswFdLBs/vm/nuZekm7TJmq8ZiW3i7JC+d
 rgicFG5JShjEKGi2zsYsvQDBSlt/zW5bp8kt5NeKz3Op9R801ldIDJPeBpVMhbCtPBAf5jhnkI
 GRW038+3A1Sj8N7VT+rZORdD6kupRmTwVq+Dt34vdcRFME0jESDdoeZ2vgjnKYqdRvaP+I2CjW
 ADk=
X-IronPort-AV: E=Sophos;i="5.81,234,1610380800"; 
   d="scan'208";a="161720433"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 10 Mar 2021 00:10:12 +0800
IronPort-SDR: 7+hZXJBP0d+ih23IAx2RmS8MPQzJbEHKl15horihq0z0Y1k6YbG7JUp6sIat3c6fsp3pdBSpI0
 bkkCzzTI6yWZmPwm3ZAKnlmC/liRM8nKyOPV6oapJ04xjitp75ugr2FH9t7beNx8FnKzc2oOVs
 p9hAe7LmApfnwAybirkOjYQd/CoReQMad4BWZJ7VDIQ6omnPq3T7nbZmVdMsMttTlUhyw/Rev4
 Uw2b78O2+hqTNk43qPVp135CiI6/LKAovrNHWQd6ECJ1ei9aukawPhVnFLrEoxI31OId1QJlTY
 8swiMhz/W9/iOkJa/MemNvBZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 07:52:51 -0800
IronPort-SDR: n4kJpHuxpaApKfcDjm4u3pVaO4g51Tk6OxjUd8O3gcW373yYQWEkmMeeuUYuL6hMUeDdeGyQ1a
 hqhVMAKkSYfWPJH9oLb3WO6DKkuEMKY4Bwpc5zJSk+nbengCw1YnCbAMoyynPB2NiXlLLUFCYB
 vwdvO6bV5FTwyujZmgzo9+dcKFWAuibv9KrtSPAjfMIXatqp33ETgbg4hi6YshP5lLzFseNo39
 8dubXsHsfzsBOJPTIf2Qm8BBnfjOKRVqGxIKc16aBzXr36Mat5Ukj3Y5GacAm7ofppD4+PenDb
 Fp8=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO risc6-mainframe.int.fusionio.com) ([10.196.157.248])
  by uls-op-cesaip01.wdc.com with ESMTP; 09 Mar 2021 08:10:09 -0800
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/3] linux-yocto: Add qemuriscv32 as a compatible machine
Date: Tue,  9 Mar 2021 08:10:04 -0800
Message-Id: <20210309161005.27422-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309161005.27422-1-alistair.francis@wdc.com>
References: <20210309161005.27422-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 6c0bec76d7..5f77a42b04 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -8,6 +8,7 @@ KBRANCH_qemuarm64 ?= "v5.10/standard/qemuarm64"
 KBRANCH_qemumips ?= "v5.10/standard/mti-malta32"
 KBRANCH_qemuppc  ?= "v5.10/standard/qemuppc"
 KBRANCH_qemuriscv64  ?= "v5.10/standard/base"
+KBRANCH_qemuriscv32  ?= "v5.10/standard/base"
 KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
@@ -17,6 +18,7 @@ SRCREV_machine_qemuarm64 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
 SRCREV_machine_qemumips ?= "d6e16284f4bd6e627ef6dc2f6aea7116ae871d3e"
 SRCREV_machine_qemuppc ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
 SRCREV_machine_qemuriscv64 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
+SRCREV_machine_qemuriscv32 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
 SRCREV_machine_qemux86 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
 SRCREV_machine_qemux86-64 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
 SRCREV_machine_qemumips64 ?= "40975f4cdd7da46177e9b7817740a0aa22313897"
@@ -43,7 +45,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.30.1

