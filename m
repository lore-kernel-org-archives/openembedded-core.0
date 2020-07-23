Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web12.8853.1595497936088763776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 02:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kiM3AW97;
 spf=pass (domain: arm.com, ip: 40.107.8.48, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEptVUgLASZlVeT41XY66ocEZK5bge0mvsBm9UPXc1k=;
 b=kiM3AW97qcDIbBplGFpv+UPf8erSz1Uww98ik5wr8E1IUBgJ0HlMbQiJWLMJMvpAzR3yZ05hi3D3bDDJalwgXtvqRW0Zf7VJS+ypvvtu81+OnXW7giS26ui1P8YKkF/Bkx7ND87qmpbK5tkP+r/pbfw1pY0RQDxJJ6B0MJdJQKY=
Received: from DB6PR07CA0058.eurprd07.prod.outlook.com (2603:10a6:6:2a::20) by
 DB7PR08MB3852.eurprd08.prod.outlook.com (2603:10a6:10:7f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.24; Thu, 23 Jul 2020 09:52:12 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::25) by DB6PR07CA0058.outlook.office365.com
 (2603:10a6:6:2a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9 via Frontend
 Transport; Thu, 23 Jul 2020 09:52:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 09:52:12 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62"); Thu, 23 Jul 2020 09:52:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e721d4a129eda5f9
X-CR-MTA-TID: 64aa7808
Received: from dcbff8a8c3f2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B8E1F2B5-799A-4018-9378-9D6D24490198.1;
	Thu, 23 Jul 2020 09:52:07 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dcbff8a8c3f2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Jul 2020 09:52:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvKQ563GrGcdqjzu5Gr+PciMl9goVR5ykTCSjbgQAkE7K4ViFsW6KUTUKztkARRKoNBC8N1RJHQsaCp1ZwmE5hvSXtL3nZyVC4CMovdpEuc5gTXHElYzbJCasSAXrVNEDGOgWjqCitzbyVBeXKmQDACO9feBQc6+uA+zIRKshod4FdKXyfq2nFXfZjghBcckG/A75tbCzoGL/BIFRL/iJtQQfEfGUTPvsPWqVVePfhRsUWzeUcXrZiBFMUiQrFCFIE1xFl4d778qns5uuaeWlSXnPWej0XxdiYz1n11ICTlNzcHg3mVXcYrKveAld62jwcN3972mn/5wOMbLC6ulnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEptVUgLASZlVeT41XY66ocEZK5bge0mvsBm9UPXc1k=;
 b=XKVKS9vbCmlWsdlzA+YIv4HyUrNLLLouDRQFm0dDYRZT8OijPsZt8fxj79rDNcSu1H30EvNd7wrJhI0ZvokS5MwvqMI9K4HVbqg4qX37ECEmQFdUAfMExROpAEbVizCjSRDZjdt8KxfC/2mqxfoz2w1POUBYBZYx+qhhxYzgy0KIc/DlvPecRySYbnkTkuhm2cQrnYu12VIbT4zbpNW3aY+37MYqdsn2f03fwiy3jdikL9dcpbDreJQCl5MepvMgcyu+vlX9rbiAXAl65ysbVmXj3Q7oWlsmpgsvr3SYw9n7xP0nslLOs4H/A6BwaLK2hfCjurToz5sCHDjUTtV7nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEptVUgLASZlVeT41XY66ocEZK5bge0mvsBm9UPXc1k=;
 b=kiM3AW97qcDIbBplGFpv+UPf8erSz1Uww98ik5wr8E1IUBgJ0HlMbQiJWLMJMvpAzR3yZ05hi3D3bDDJalwgXtvqRW0Zf7VJS+ypvvtu81+OnXW7giS26ui1P8YKkF/Bkx7ND87qmpbK5tkP+r/pbfw1pY0RQDxJJ6B0MJdJQKY=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB6PR08MB2855.eurprd08.prod.outlook.com (2603:10a6:6:24::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Thu, 23 Jul
 2020 09:52:06 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3216.024; Thu, 23 Jul 2020
 09:52:06 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] wic/bootimg-efi: Add support for IMAGE_BOOT_FILES
Date: Thu, 23 Jul 2020 15:21:50 +0530
Message-Id: <20200723095150.18257-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM6PR18CA0019.namprd18.prod.outlook.com
 (2603:10b6:5:15b::32) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by DM6PR18CA0019.namprd18.prod.outlook.com (2603:10b6:5:15b::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Thu, 23 Jul 2020 09:52:03 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 48957d32-6c88-46b7-65a2-08d82eee12d3
X-MS-TrafficTypeDiagnostic: DB6PR08MB2855:|DB7PR08MB3852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB38524334CC0A0E45A2681549FA760@DB7PR08MB3852.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ESk64XUglAmMTlZuVEoiQ9eUsRBUwH19KseDBYDoeqv1+qbIW6L++povBHLhJitw5HOuD2RdouUY7OrQl4sdHhlrzlIZnWtXK8neAvZOIfHhXsvCvfIqInyaTfsEDJJ4l7CPdiYWt3BSvrjt6k8YU8Me0U3MVKNURgsa8bD6iwOyQwpm8AgPVEaD+vlt9FWNIA47hmkBXRgW4pJkBuhTzPeZe/iWNs+d0v6rrs3K2ufDzpT6YSiyV05KWyKc55mo6uPeox5C8zf5VP67bZr7X2kmJ1JssqqD5VzCom6igGfSUglhWX8N29Y2RvxSZzynvMdj3sQUwM7uMHiRA542DQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(66946007)(7696005)(6666004)(52116002)(956004)(2616005)(66556008)(66476007)(4326008)(86362001)(36756003)(186003)(6486002)(1076003)(6916009)(16526019)(8676002)(2906002)(8936002)(5660300002)(478600001)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 rrVyqZrnAWrVDPZpP2yIKg0XPuE7IDymOsiSbzP4i4XEGqkBrnFY1m04QTNcEKGBUIc5E0Njk72ODnhvf5aNeugpDnsvgkZIKffnKLeXgTbTdXbTADj3ZizxTT3aSPp+RJZ3vVGRBIDoiHfc+kQlLYALrDM9eOuwMVpYCCHtslpoDb2cTLAbbokVtthDdecfMHYN+pfhdZuQjfJG/C4bMsrqMNR4riASsznydswW7El2ys49CmLfSb6JxBNhqRaTDSKutHOv4S9mWb04X6HByaGjxO0y0XtERd4J+jRRrt7hdgxATiiCxSmjb1mSdQIAcIzSRDpnMfuIXpf0VD5WKmT/xLxpZDgxzl9vhPwDnOj9UYbZL64IjvcTQWEaSlhlW/1KrhhcrCQS4rrQzVOr254vfiIHjt/DI4v/PfwCo4+P/ESE2yYdz0CXXy8Hf1RFBCgdcp7d0sP+N6+8VdasxveE1PxMh017cTZM5uGUYOkL8RRjnI7bHmhPpHgnWnQo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2855
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4e2da789-daab-4145-5c97-08d82eee0eb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rT1rg0Cof177xi8v3l/RMg/zg5I3QUNP9kiQFPZBhz9SY67A7GVLQnPV6iQN5R6Hnbch5MxYrnpPm3Este47gZxTP5vSVIIB7Q55LS1TLnsN8cBzBIwhDkz7ko2DPRO/ZTxoTA/QHr4VzssaXScT8T0h9bbG9zih5qP4jGSaUJw4WnhkwmHKMWASP+EYjXg1Sunwa+aNblNnZgwdsbqXpbNsilnZi3TpUdCHN/qD5bsIUcdi5bkt4NEh9/nIbHD0V3vqpbk6ukq+CoIWTO7bvj73BI1Lb8vJ2Ng105lO6FSTbfPvW2fK1RmgGbgeze77H4lxul7v9b1T0ITpKdgtLynvGte4foMSBF58vK937lm7e/RqQdBLcwXEjQsRhn2eHa+FQojNfszBkyZX+2D1pA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(81166007)(70206006)(6916009)(6486002)(70586007)(82310400002)(356005)(2906002)(5660300002)(316002)(26005)(8676002)(16526019)(86362001)(478600001)(36756003)(336012)(186003)(7696005)(956004)(82740400003)(6666004)(4326008)(8936002)(2616005)(47076004)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 09:52:12.5803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48957d32-6c88-46b7-65a2-08d82eee12d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3852
Content-Type: text/plain

List of files defined using IMAGE_BOOT_FILES are installed into
the boot partition when preparing an image using the wic tool with
the bootimg-efi source plugin.

The code snippet introduced is taken as is from bootimg-partition.py

Change-Id: I8dbb6b4e7c24870f587a6f31e6ae4a87d7033782
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2cfdc10ecd..14c1723577 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -13,6 +13,9 @@
 import logging
 import os
 import shutil
+import re
+
+from glob import glob
 
 from wic import WicError
 from wic.engine import get_custom_config
@@ -209,6 +212,57 @@ class BootimgEFIPlugin(SourcePlugin):
         except KeyError:
             raise WicError("bootimg-efi requires a loader, none specified")
 
+        if get_bitbake_var("IMAGE_BOOT_FILES") is None:
+            logger.debug('No boot files defined in IMAGE_BOOT_FILES')
+        else:
+            boot_files = None
+            for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), (None, None)):
+                if fmt:
+                    var = fmt % id
+                else:
+                    var = ""
+
+                boot_files = get_bitbake_var("IMAGE_BOOT_FILES" + var)
+                if boot_files:
+                    break
+
+            logger.debug('Boot files: %s', boot_files)
+
+            # list of tuples (src_name, dst_name)
+            deploy_files = []
+            for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
+                if ';' in src_entry:
+                    dst_entry = tuple(src_entry.split(';'))
+                    if not dst_entry[0] or not dst_entry[1]:
+                        raise WicError('Malformed boot file entry: %s' % src_entry)
+                else:
+                    dst_entry = (src_entry, src_entry)
+
+                logger.debug('Destination entry: %r', dst_entry)
+                deploy_files.append(dst_entry)
+
+            cls.install_task = [];
+            for deploy_entry in deploy_files:
+                src, dst = deploy_entry
+                if '*' in src:
+                    # by default install files under their basename
+                    entry_name_fn = os.path.basename
+                    if dst != src:
+                        # unless a target name was given, then treat name
+                        # as a directory and append a basename
+                        entry_name_fn = lambda name: \
+                                        os.path.join(dst,
+                                                     os.path.basename(name))
+
+                    srcs = glob(os.path.join(kernel_dir, src))
+
+                    logger.debug('Globbed sources: %s', ', '.join(srcs))
+                    for entry in srcs:
+                        src = os.path.relpath(entry, kernel_dir)
+                        entry_dst_name = entry_name_fn(entry)
+                        cls.install_task.append((src, entry_dst_name))
+                else:
+                    cls.install_task.append((src, dst))
 
     @classmethod
     def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
@@ -238,6 +292,12 @@ class BootimgEFIPlugin(SourcePlugin):
             (staging_kernel_dir, kernel, hdddir, kernel)
         exec_cmd(install_cmd)
 
+        if get_bitbake_var("IMAGE_BOOT_FILES"):
+            for src_path, dst_path in cls.install_task:
+                install_cmd = "install -m 0644 -D %s %s" \
+                              % (os.path.join(kernel_dir, src_path),
+                                 os.path.join(hdddir, dst_path))
+                exec_cmd(install_cmd)
 
         try:
             if source_params['loader'] == 'grub-efi':
-- 
2.17.1

