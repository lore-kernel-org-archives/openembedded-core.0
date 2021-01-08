Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.89])
 by mx.groups.io with SMTP id smtpd.web08.1809.1610067882624910756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 17:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BLlNHKsn;
 spf=pass (domain: windriver.com, ip: 40.107.94.89, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBGlhLHozbjB/N9NEJHcgfdyGBuCPh02flsWHKB6KgRYlXW7WOG8mqLt6ass2gBvUdfKwgfYHzp1Z09sMpxNGetwqqShLnyGcMTi96Zl2g3BZUPvPmTOYbJAAtuRcwJBEyLE1+eW3rqUAqp78PzYNUNlB1y3nDn2yHs2m7bhqP8CkyorTWlaPDCt5EN27iXTbzIWgnOCylRwFkfUdIW4hWq8yc4CzweHvjNe8IkTBeFmrxkXWWXM+edyLLS+/R6RKhhwyWSagTGv6y0ELfJ5M7u5MiG5AK2WF+iOB3TCfaapx6eCrfDLwX1LpsaRUxxpuWTmj17UbNi/OrDRvC6JHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ws6mfs9kWuJCc+sDTDTXpRsgswQ/InF0pxADNjuB8Jg=;
 b=kiOkRbaxYSRfs/L2Z68T804gmjO88WI0YHOdt5YjDSpLQf7nAbXdV2XcorS8XG3dckDYN/TXToIufiAtTlfrURxkQwStXlPImEdp+VbWtJ30Rz7PWJli/KmHYx7G+u6AEZM1fMxHDPTNjNeHiaE7ZKW/sgaGXdtcrXCNCzqSPrssmcAa99wo1tH0SUj6Wxz2i1uRYT5TT4Ey0iFSrsSlY072XTaHxw3T8nvg+ua+EJpoxKXOgS211KiBTs/41yqiRZq5efOzsO5Z9zbt+iTzHUa1xpKlBDrHACT1i5/AkCzIawLxjwnczRE/YndA6hdG1RIRFQLPGaZkEwpVUlMDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ws6mfs9kWuJCc+sDTDTXpRsgswQ/InF0pxADNjuB8Jg=;
 b=BLlNHKsnIjgGN1qW9+L4lTj5ZKdn/qRPWigKhNxk+450jk7Enr5yVH6As9xSrovWV3/we+pL05UrZVRrGIO1XX3S35jIhuKJmY2J0qqC5s+KdIGcd7eZWkDKMbMv4SB/1WTCr1So3kjHmoZig0M72XmOY8+FR9qafQRj9284vbk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB2573.namprd11.prod.outlook.com (2603:10b6:805:53::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 01:04:40 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 01:04:39 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/1] Customize prompt string for SDKs
Date: Fri,  8 Jan 2021 09:02:58 +0800
Message-Id: <20210108010259.25628-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:203:b0::13) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR03CA0097.apcprd03.prod.outlook.com (2603:1096:203:b0::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 01:04:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d766c006-b0df-4c67-f59d-08d8b3716025
X-MS-TrafficTypeDiagnostic: SN6PR11MB2573:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB25734E560459EB903F0A9FFA95AE0@SN6PR11MB2573.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UShxsWWpk7gLXk/rqTMLeJcgGEB+zh3TlthqITiBPZotWmtsaCEkR3tBLbBEUIa8aXNilKcDKdYnofegYADo20lATABTLc5hDBFpSf/7HMHDnSf8VsWcIQrhnvCuFalXSLzhtlXcc9az0giElD3x1psJBDxUEykbUDHn3ywVW3K5wIbfe1M9AJmFCqF3aRd4HVNuukX2sLmAxMMLL1qMvFeKVXrZr/eHh1yfde3roGzRnpjL6ADpRjM9N0Xnx2tdBBJMKEyk93acqVqVPxQ+6ZZ6KaMdfI6pahJbLbUDCHZixMCWUNce6z8/+lKzBpTTpcLLk7SRO06bypCRvcp+WfpbQY1YRnd8ixetsOyOiaL7HxwkRK2CrLvPzVfOQZd9fg+FXkgZbQpQvzSynZQJKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(136003)(366004)(478600001)(316002)(6666004)(6506007)(8936002)(956004)(4744005)(66556008)(16526019)(186003)(66946007)(66476007)(1076003)(2616005)(26005)(6486002)(86362001)(8676002)(6512007)(5660300002)(9686003)(52116002)(36756003)(2906002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?OkFHVdJYdEpZaGrXLd04eUOiIAbnaRhxI9j8GKHSIdf3rnrr+LqdF3of8HY4?=
 =?us-ascii?Q?o3k6zhcNrT552rPFEwBGE1BuX/ephf4XmTLnLpEtdmsDGSIOGVv1wTEl08gN?=
 =?us-ascii?Q?6vGIMaSeZLKyMulHdASZY0ggbyyQvo2Oy/mjkE0lu0ejpAuEIHUsfGJd71/l?=
 =?us-ascii?Q?ZoZDaRtsAjmk3Nkp/Jzf5VE3qnq9OZHa99aAL756Lnr2ZjGv/sIwkk/n/x+7?=
 =?us-ascii?Q?BwG6sXyte+Dl30RTrrFITkghdeMqKpuzni1zryBBsHdLrY8Nhkr6ZnDnLyst?=
 =?us-ascii?Q?38MIvmFNi14DfN85SFJlLp529NfROi/2QEQ5WD0qddoJDeneR5OB4GrzEEBx?=
 =?us-ascii?Q?+M2zOQwNOayXKmbwMtFPzj6UKqYaLiggHWg57Ubx7Z/6JgJ2RWegYJ/3e4LO?=
 =?us-ascii?Q?qnFT7fG48Mx7rRnqt2auWxfzpZuBrTkLC1aaZhsIjOXoVS64gZNE5OjWfMYP?=
 =?us-ascii?Q?MOXG4b9mnMqPWLQWkL9Sj09yiN9Qa3vx/y84EgvYOWRfxzGdvIKGTG8/Mh2h?=
 =?us-ascii?Q?uiQ1fF6OboPdHK7m8hi9SOcf7IX5xFliv5io12Igy278z6pLffg17du3LV2o?=
 =?us-ascii?Q?sBcKfp8Kqb1zqZMxkMZ+WvmvhmOC81NuS3FB/WknLr0/HUddQZd/GZDGhVKp?=
 =?us-ascii?Q?y5HRDEmjTWxbX/mkFkv6sPMGfVPFS3RDsQNsBGR0Wz4n7mTvbFuU4TION8wJ?=
 =?us-ascii?Q?UFUGA9LD0YpAJAQO8n1Fde5oFPmvWENALpSzocvUCSASAjSWC4h1J1SHuC7n?=
 =?us-ascii?Q?Gt9cZc/DmxZVI8QDa0LMzmTuDQPPg+bAxcCfAyLsUv1nBhdsvni41vnV/rIm?=
 =?us-ascii?Q?osi7WrXdzBsypJnbCXyU06PJD3uduocq4WMzgHP46oUjvCnkxqBIERpzB3Eq?=
 =?us-ascii?Q?UnlU7mDgh+Ya8RSut8yRykn6XSV/lBsb3l4r37JhY0S8ufeRpDn3OMlFFon5?=
 =?us-ascii?Q?ztrF0Xy1Bi4bIqTd2G9e/pSrPKN6YcovzAldeprQ0h8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 01:04:39.6663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: d766c006-b0df-4c67-f59d-08d8b3716025
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9j0mGbKzaILlbBX3BXxMczetuNqlrwOi4EhhnIpW6yZQ9HuwqLMfShg8fqr0v/54VKtcxGpLNSgocDUTNE7awA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2573
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* set new variable SDK_PS1 in bitbake.conf
* set PS1 for buildtools-tarball too

Kai Kang (1):
  Customize prompt string for SDKs

 meta/classes/toolchain-scripts.bbclass       | 1 +
 meta/conf/bitbake.conf                       | 1 +
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 3 files changed, 3 insertions(+)

-- 
2.17.1

