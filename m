Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.54])
 by mx.groups.io with SMTP id smtpd.web10.1149.1597271695699883073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=BGUixT2z;
 spf=pass (domain: xilinx.com, ip: 40.107.76.54, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nX3XbZOa5QY4PfE4+KS2fYHv2RnTQVj/EL+aSayQVaoFqlXbf16wvWl6YH2IOpvi3wYZBGuHZoND/pxmdYjKoYIhYk5GGKBY+enbqPMhe1z98YLsaD2dVlIhVb1RPWFummNBMgxAjgxq06Pz9ehzFFByaXKWN9KN7hpY3CjghdVax5zQL1pvBsZuXvlvpAhwLyp7e5MqS8Zc/w0v6a7jXjVv1Vu7b0wf/5ODlNcEDV/IRTp0D3zzfw19lQkzOw67PArzUywZID8gTWCUZpZ3gwXZB7wAPBCumAKn5oxH/gANa42POPExOKUt8MKZkJhKPwlEQqRd2Qt40DZSVP1pdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZQp11ZHxP2uJzCsC0zoIYZw/bYkbZRkQiqG1vIrsdw=;
 b=gvrYF52E/Fe0jTAMrRrIw7OAtcnokETX+nYy4Xgcwij37E7FJEzg3+5YAR31OoSF/f9fvKfsnE9Rq/0GgtQTAzWijXsjJI3fwLUIkicte9ILCzXaznwI6CdAPhBJKCHeEnKSEYIaNZFlvfsSwLm2aFXMFd7UbuTBFKl4PRmjTjHn44TpZis2MVWWqjDj85zmY5CEiw95IVzir0KET7yTGqZxVXr6yES7+Y+KGGswi5aDbj9eB4sQDGLgvwH4Fc0wdikNGyVohIvsuKEmYh+7VLAgAwZT7KvbNlyWQzH9UWld5kfR8Rjcd/jIkT4Mw4iQZgWMMFJQG5yPfVbItMgUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZQp11ZHxP2uJzCsC0zoIYZw/bYkbZRkQiqG1vIrsdw=;
 b=BGUixT2zNbdpUsCgMl73ThOzSMX/36/R23PXegQGMjkmJzlUJErNNgh2BrAFXA499DemoMwHrdwtQCmThfwAWIoNKvkiKCFarCwaJJM2VRrX7ujJMGRXol7tHvNVB6M0l1Y7+ppuzN4ns6X3/DtPu9cwvDUxoMapyAE18os4KJU=
Received: from MN2PR19CA0037.namprd19.prod.outlook.com (2603:10b6:208:19b::14)
 by SN6PR02MB5246.namprd02.prod.outlook.com (2603:10b6:805:6c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 12 Aug
 2020 22:34:54 +0000
Received: from BL2NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:19b:cafe::ef) by MN2PR19CA0037.outlook.office365.com
 (2603:10b6:208:19b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Wed, 12 Aug 2020 22:34:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT004.mail.protection.outlook.com (10.152.76.168) with Microsoft SMTP
 Server id 15.20.3283.16 via Frontend Transport; Wed, 12 Aug 2020 22:34:53
 +0000
Return-Path: chandana.kalluri@xilinx.com
Received: from [149.199.38.66] (port=47660 helo=smtp.xilinx.com)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1k5zKW-0004FF-6f
	for openembedded-core@lists.openembedded.org; Wed, 12 Aug 2020 15:34:44 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1k5zKf-0007b1-B9
	for openembedded-core@lists.openembedded.org; Wed, 12 Aug 2020 15:34:53 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1k5zKY-0007Zt-Ki; Wed, 12 Aug 2020 15:34:46 -0700
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: openembedded-core@lists.openembedded.org
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [ipoky][master][PATCH] qemu.inc: Use virtual/libgl instead of mesa
Date: Wed, 12 Aug 2020 15:34:45 -0700
Message-Id: <1597271685-22993-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 3e90846f-1a31-4400-5455-08d83f0feecf
X-MS-TrafficTypeDiagnostic: SN6PR02MB5246:
X-Microsoft-Antispam-PRVS: 
	<SN6PR02MB52468497E95614DC46BDD163B0420@SN6PR02MB5246.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RZIRR/ewoWZZdqRZoaHaMEMwnZAV9d4q8HmALJlftJ8xa/C3llmrcQ5zZ7n+CYrShQlPLlNqN6khWvHu/b3WZyOVUHWdPnsufLcyT/WVsLmpD3K9i+XrayLJDwXtD5fi9FNW/FjNElj98Qhof/g1XiNG+45s4XU/NzMapP7NOZ9AK5cWQI3e/xfAHUfH/tnuipSmP42qJ3ImhFzbsD0vzoQ1kC6nkMQRlpmRSl5WNC6AkyjIp0OhEmYNQBw226brKpueDf67YNuSZcEZJyiRn5/mRXKGHjWq21nazuFx+9+InCZPw2x9kEOVSXGzDO5tzFnl10QraOtB+iOgw2VEh9G1PWOWN198KprVkJNOFxBZcELpUBqBDW/zcG10dTDFuSzg9HsjiNHTzNDQZNoN6GZGI3Koj63Up8TiAnHsuRvfBl7MrkvZwVB5cN4Od5nrGM2wGJfNWdgFllCwEMNE6g==
X-Forefront-Antispam-Report: 
	CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(136003)(396003)(39860400002)(346002)(376002)(46966005)(2906002)(36756003)(478600001)(8676002)(426003)(2616005)(70206006)(6916009)(336012)(316002)(4326008)(82310400002)(107886003)(26005)(7696005)(8936002)(83380400001)(83080400001)(9786002)(47076004)(5660300002)(70586007)(82740400003)(186003)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2020 22:34:53.6519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e90846f-1a31-4400-5455-08d83f0feecf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL2NAM02FT004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5246
Content-Type: text/plain

Use virtual/libgl instead of mesa within the recipes to provide users the
flexibility to specify providers other than mesa.

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 meta/recipes-devtools/qemu/qemu.inc                        | 2 +-
 meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b1c822b..dada4b8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -163,7 +163,7 @@ PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"
 PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
 PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
 PACKAGECONFIG[alsa] = "--audio-drv-list='oss alsa',,alsa-lib"
-PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,mesa"
+PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/libgl"
 PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
index 29b1262..5282119 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://virgil3d.github.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
-DEPENDS = "libdrm mesa libepoxy"
+DEPENDS = "libdrm virtual/libgl libepoxy"
 SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
-- 
2.7.4

