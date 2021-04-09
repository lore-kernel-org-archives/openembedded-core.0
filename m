Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.59])
 by mx.groups.io with SMTP id smtpd.web12.6123.1617956228835906758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 01:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ee+/aTjr;
 spf=pass (domain: windriver.com, ip: 40.107.244.59, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMXtlyyHs/1CBiknd0e9J5D9TeohvHIzQBrxGJtXp90Mwbc75cVTPkKc3N+IvqxbuqY7PKiPb1geWcOg/pWnhdtawI4pek+BxyI32GBis4LWBymIlOgcrFHDzb8EIr4dryBXv6NQKrkVnZ1KzZp3s+hEsAE7aBHep6rValb+nkWHLwB8KmPTB22mSRBg7Da7ksVAdmeZadw123QLXPX5rIn/EjE0sVVwGUcP0kVGOOJxpNROmyovo26Lssr/746z6O2OMcFDztnAGUlrZjy5I2ZD1BTmUmWp7zVwdmuDLN5d9jzT32mWPY2cyIDx2qIArAdjkKbdR0pamaTpwFVggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=is3WLgWzOoJht/FOtWJroMG+CQnbaizStf/kTIHZWiw=;
 b=HLVSipJ93HLTxtmCbvGGvlNhbqxaMYmFPEjDf9omSLVY20SqEIWZQeF4JJ4PJoCQAzZQdDmAmo6hmKgZG065NpDdLOCenjgKkM06E16QCVm/WhCiTIETYwyHiNgRtCD/TFaKrDLkUssViUv+DiNwRgghCXFwZZR4cIm6Vn2VIqe/6mKrsBpFGSnS8ABoWnwHa/tcNz9kjOE/ELSKIlCsDl2soRz6XVH6B4pzlA94fmDIMx387nZHcns4GiVNYwCun8uUwFWpEFOOeFJOsbCyLd4hNgXVglULDmhXFMA/+wvw6DF90Kp1xlA9KAypbW0Y0NX3uEfikpiUjypBPmmjng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=is3WLgWzOoJht/FOtWJroMG+CQnbaizStf/kTIHZWiw=;
 b=ee+/aTjrJNqPl+4bRv9nm3YWEtzO7EC9fg3B4M2nn3rXP86NnFx8/rSCJiA/ZjPELY3SJhRbOCX5tlhWi/XaU6Ht9m80NBho1PzQSuEziEo8TybG7vXWPIyj76JMWFO9Xv4k+JfgBAQoZdxaQEduF7Mi27XLwZdGp3ZD7VtlccY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MWHPR1101MB2351.namprd11.prod.outlook.com
 (2603:10b6:300:74::18) by MW3PR11MB4539.namprd11.prod.outlook.com
 (2603:10b6:303:2f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Fri, 9 Apr
 2021 08:17:07 +0000
Received: from MWHPR1101MB2351.namprd11.prod.outlook.com
 ([fe80::c156:455d:860e:ba87]) by MWHPR1101MB2351.namprd11.prod.outlook.com
 ([fe80::c156:455d:860e:ba87%4]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 08:17:07 +0000
From: "He Zhe" <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
Subject: [PATCH] linux-yocto-dev: add features/scsi/scsi-debug.scc features/gpio/mockup.scc to KERNEL_FEATURES
Date: Fri,  9 Apr 2021 16:16:47 +0800
Message-Id: <20210409081647.37679-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SLXP216CA0008.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:6::18) To MWHPR1101MB2351.namprd11.prod.outlook.com
 (2603:10b6:300:74::18)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by SLXP216CA0008.KORP216.PROD.OUTLOOK.COM (2603:1096:100:6::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32 via Frontend Transport; Fri, 9 Apr 2021 08:17:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed69ba3d-5360-46df-f69a-08d8fb2fdd45
X-MS-TrafficTypeDiagnostic: MW3PR11MB4539:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB45391F5EEA98F49E617B92BB8F739@MW3PR11MB4539.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oefdWeTAi9/YvRnDQcMoNjLuSO5M8+E+CywoJvpxhpskxhiwC9jk6szX68YFFLDbsf/K1YLc4yGej/SNF7QrXw0PXLjsufByG/kk3++JIUchnWysiXN25JFQ/2A+GGDWhI7bPe3/ftypncrkP4UOFZV+MDPJSJcgT3cDhPIWDeRh4OG/MEBpooEv3kmHYzFWjwQ1xQeD243mRLm1Ci4RlPY6U0BprWaUnv6l8Nhy7sV4K2tB+9vPVHqYc4Z6cJHBHkGQLZT4LOkr61rnjG3hrH7fTJc5qOJTErIXLGB/vWnwOmadkQrIo1T7bG2CT8xtC/EkLgdGgf7XRLoB+cSpNyeGXOG6eXypUGrVRfAT9eT5kj1lBCx5Qap6YR0TJkqzrm62SoLxrWEJnM0Mx+ZwV16oth1V1VTiVa+07RnaFKCcxRR7t1+CJTM8e2Mcykk3LVOy27AxRhc3jwobpcDtebv8isKp5zmQAmHos0w8iU5Bw1uSXJ6IBFO9DTUSfQM+gmw0Iag5jdVD6pxhZ58POOFFoc3dpunuQHsN1gpMCmvBKIRbaCwtRr8+G/qh76gwfA160gfqoOr/EpXQqiMGyIi+GyF3ZGc53V41ijK1giH/M6wgbqpoetYllBO7RZv4OZkYFbW1M2+409EiIGXs23LHIrdwi5YsxhNznbym1dCs1LKNLANpAXTk8cTK5+VH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2351.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(366004)(376002)(396003)(52116002)(38350700001)(8676002)(478600001)(16526019)(6486002)(316002)(956004)(2616005)(26005)(186003)(1076003)(6916009)(6506007)(5660300002)(4326008)(66476007)(66556008)(66946007)(8936002)(2906002)(86362001)(6666004)(6512007)(36756003)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4my97NqTDUIq3BjrBHkMa3KCj8ICxxNXX8zXLeP7yTj/jTrPGi3nU0xghlCx?=
 =?us-ascii?Q?rQsSF1ADNkU2GKMA6sFu45CAeJjMj4g9UUnjuU5uDC4sz4wYb1UnnhD7ZtNI?=
 =?us-ascii?Q?bLDBnDIHDmVfyXa8qt5Q5IaNTTWkhIfcIy4djJKDc2Z16pk4liVgX2kgSQP3?=
 =?us-ascii?Q?nzbG47EP5PS02QpmKfdiUPd73l+UaBRGO62KzrJSW5ytC7+mmhcEuTfjqWCc?=
 =?us-ascii?Q?VWCXKnJbDSRNgQl0kvz4fb9oEdY+4fSXuONHAdYsHF2ppqByFBKHdu48yotv?=
 =?us-ascii?Q?1Sl5foIkI2pE65bdaUuiXi01cKVZOSXXbmLd26SXioaRW/ND6qFOdZdpdU3m?=
 =?us-ascii?Q?TpezDalJHYpSzHbX4MIOHX0FqT0QVq8+sfumYAUPu+wmbzlAFGyG/ceJ2Vot?=
 =?us-ascii?Q?wDR68eVKe+jToyRtLcXFYcgcSIrGuotBNGgHjEFkapWcTey8UlGyluFfsAOJ?=
 =?us-ascii?Q?y9rYPVJPLmDiiHBqNq0Pw56vJ0fv8YdYW+hYDWHWi4Gr7JKRZWA4b6hTvivu?=
 =?us-ascii?Q?0ifeKfgiiYZXijcQuQLkkLMGsAjPo4DIUYMJjUVsJIUg3bRyEzw1iSijaL1n?=
 =?us-ascii?Q?TDlaiZRfpSlNXAd9Eoi9tWllVmaNM1hg8shUmqjpBoO1M4vH0PDbHNH1ExA9?=
 =?us-ascii?Q?4w0s+LwVLijm3SVX/zJcRmnWuiI1rZkHIDdb5Q5Ow0OlzSj8KKtpGsZyVVrr?=
 =?us-ascii?Q?C3mruWMN3FlEyYKAtFqBB/e9Ib4XlVu7i/oIq8Ze3oYrssGAe/polFn742fZ?=
 =?us-ascii?Q?ioE9lGsiJy3/PvpWh8b2edeUBVpCMbz/eGILPbyownq3OSupaqkR6C3zo4ud?=
 =?us-ascii?Q?yRSJL9flxCQO28eLvv/BmwA5NMiM7ksTio3zeo6GsvMxLIjLKMKoL8N3WTwB?=
 =?us-ascii?Q?GbsZq/gWiIuO9r/3mvfN7WmgE/hW2MSCEne9l3nsLPieHEqMCNAAEoceYbA4?=
 =?us-ascii?Q?QezXkvRcwv0jMNIkqL+c7eWvJd0pC2ueiGh83J3t3VAVTSEHhuauigpp8G9F?=
 =?us-ascii?Q?xXtpnmDY+TgdszqPmKBNLbXZ+6rCZUKyDlFUmZHg7FzTAelRNKHmTxqTe4Ci?=
 =?us-ascii?Q?55LzglZ5QqlaaiAClRlOKyuc4wC3ak+vyiK9Q8CtuNDsaQr/ZX9/O1Gb4Avh?=
 =?us-ascii?Q?OpWL/aT3Y3B6iz9JWWifZZrV2ylNQnoUKmQ2+hfr6kJQ5xWUGs9FOBgw/TFD?=
 =?us-ascii?Q?Ku6MW6XdQsubeE74nbOGYM1iKHpsU6DHQuHgSj7iDdvrQJ+CG3qc8V1O75nN?=
 =?us-ascii?Q?DIxf/HSETIWfSKhkJKyqW1fq3DGFW+WAykZCExVPhVbKUT1AJjDdh1CNiu/O?=
 =?us-ascii?Q?2U+YVqbyxih0cJ0z/Tp63fYP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed69ba3d-5360-46df-f69a-08d8fb2fdd45
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 08:17:07.0858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyB5nIv7HpuwaVkY/LbMD12a3+UYNQfTuLgkUN8OPTHE37fbkm8UIikaMkyMQE8gkJEG1eUkTJEpFpB/c0KfFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
Content-Type: text/plain

Add features/scsi/scsi-debug.scc and features/gpio/mockup.scc to
KERNEL_FEATURES to meet ptest requirement as what we did for other
linux-yocto*.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 8725473d1c..ee41d612fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,5 +50,7 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
 
 KERNEL_VERSION_SANITY_SKIP = "1"
-- 
2.17.1

