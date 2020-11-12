Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.69])
 by mx.groups.io with SMTP id smtpd.web10.2702.1605179347997596683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 03:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ItcLt6mU;
 spf=pass (domain: windriver.com, ip: 40.107.236.69, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZhpGIhS+zqnGUkDgVlQZrpNDLTeo0H5fOjDgiVU2qAArdDvREFLkmgQE5+5O3BmmAWRo8IuWIH25DSrs482hGalrclTkgDLnl+099QNwAK4LDnWpEKrvD1an22C9YeipvpkxMqhul/MhAveLq1QBpV9PpMNvxBuxLVtg0O+A3BEp6iTfjBayiFIhYLlbgp0FnEPSDar8G52q1ZfzubkgIPdHQzILwbuC8135LG5nl25eDDpo3BoHwYZXmEtlo0QLuin2PufV9/ZwKc9OpuIzIeah785IAWz+NV1qwWrycx/I7IrwrUPMjmeYGtHXZIiFceY3tHksdYfC0rfTJiKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qA7Kv9lCzqCT/NwnAN84v8XcTjYz3CfxZPO5Mrptgvw=;
 b=WWt52taSd5uZPwExtLUIp09ekR37kZaqb12B4OXLHphJrNEb+l6XPH8phlBErMg2aTsnPOg6kTxKEav5vKm5WxPVOAw82cTX5Q8k8Qtd3C6sMoH9BSUc0nAVi7LtKGog/M4S+Du8sye9Ato7MP0hIA3aKlyw9pm656/si2JogpU5FkZGfv56SE+BCeEghLFx62OUEpgHsnChbsmTczDtogxerQChqww6yLDeF1gg8PHQO4phGHAg7pmO9Ju+7HKJ7SJh5ZmWqrUJig7lQ2Gp9k5xMHThdTivn3urdI/crMdWSVxPwjpU5va0kwfio8DQWhsV5iXJ1efgpsEl3hswsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qA7Kv9lCzqCT/NwnAN84v8XcTjYz3CfxZPO5Mrptgvw=;
 b=ItcLt6mU2alaTvDDb79Y2aT/ieG429AvhcLo8dcjs5FDA8dBVmsi5ITvAvPHaOEyT5hHTnD0gsv92LhqPwBVMQ37Ut9X+Q/kzgZFyk6FOuhhVkH80tq9XmjMYTF95/bdmUEQEuB9kHK6KgJqVU84+UYGp5f0dvRIX8tIb/S3Isg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SN6PR11MB3040.namprd11.prod.outlook.com (2603:10b6:805:db::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Thu, 12 Nov
 2020 11:09:05 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 11:09:05 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] oe-buildenv-internal: Support extra settings
Date: Thu, 12 Nov 2020 19:25:48 +0800
Message-Id: <cover.1605180304.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::32) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1.wrs.com (60.247.85.82) by HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.11 via Frontend Transport; Thu, 12 Nov 2020 11:09:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de0c5414-f3f5-466d-3d3a-08d886fb5e88
X-MS-TrafficTypeDiagnostic: SN6PR11MB3040:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3040A1917B4D7651876CB6C5FFE70@SN6PR11MB3040.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0o3/l7L/5xr96UfS7LuvUOiQd4h/i3tEOwPCmdpNJ4qj2CqnH7VZwviDbqFcAIJBSOJJ800TCzEhrnoEl47wOUDwtflDLRLaLFLzPANjq0WmivwnIAd59L1/6DWNOTOoI+yHa0WWbWRuRNIHULR0vNy1zfaO1jN35MZF+x/MG2DkGz+jEyprGF7LPqsbU7yNMKmQ7HYPCvhSD47RQQJc9HUshad/fkzsyFA1nJ8NuGpL9GGfoXzKRTtPYVfriHivmpgA40qL8InyAjaaoLR8V7zoyemIZf3bnuKwANz7yLYpowyVFf31NhVilmm+wNbew1AvYg6qG0xZib/4Dpldyd0oKUEWH2aFMgajU3bAs97A6aV/cupw3kqawGfr2uvyl2I4hyyoVvqbsrt4rIt6Vw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39850400004)(366004)(966005)(4001150100001)(956004)(2906002)(6916009)(186003)(52116002)(26005)(36756003)(8676002)(316002)(6666004)(8936002)(4744005)(6506007)(16526019)(6486002)(66556008)(5660300002)(66946007)(66476007)(478600001)(2616005)(86362001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	j/ufcac7fNjq883hDhnkZA0B9z6/5Z9bUCXNSYcsIxZ8oakucUJJDFKA3532YdaOK3Scximckz1gOfdnqgpH+GWGAtbpqQWstfJl6pBEKdZX2SfCVfp4VOElfDGzDxXxtMPVI7z/fB6IRLlufIIlLGvakvNHF5mjrEo4LEYyl/m6nYrF7OQHGtnPJbcv81mDrheoYwiR5DHnY0Zky6SUglyLr2+6E58IuB9ZRVtHoN048GfFGdvB2VJeYNuNwO36/ou0Xb6pRDUyl58OsaEhiZvZql2Ts6srSYuwy4jijVlk3UoxNDXwAB7pZpUkQMbdkxWwDj3A+vRgyS++KfLIgzEN/13Ku5PsltW8b9X4iCFX6KltuiVVaeg+1hAcUCVriv0APgVcXZrbML+noluP3EycoQwPCdvyyh7aeoYdjLWMxWmS+bFK+E4yDUUkRJdb6nUYKLaXIIwLBssiBpo6VFURo9clzltFXouAv60mDPpSDMVc/QTTqQmnhMOw9vLDfKSN+CmttOhKkg8qV61pCYC6I1e+c9qB/JFsNidVmXrgE8KoZx4d9c8bflLSJtYw4vFxWw1XZW0IuuQcZsO/ozMS8yVMW0oAh5af/dd2EOGsUwVVrlvH0tXgZw+XksqDa60R5qxB3oZ5ntghOr7t1Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0c5414-f3f5-466d-3d3a-08d886fb5e88
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 11:09:05.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzK9O3Vp0g0zgU6Me1egMDds2IlOjKD5AhtF1a6ypeT7Ii7KyHyDFv3UipFJcInvtMi1VkXim2shWsv7rqrhKf8J8vLhpXeKAR16UXrFEwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3040
Content-Type: text/plain

The following changes since commit 4dce4e01cfa153fb12cfd1684d36e0432bef6741:

  binutils: reproducibility: reuse debug-prefix-map for stabs (2020-11-11 10:08:07 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/path
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/path

Robert Yang (1):
  oe-buildenv-internal: Support extra settings

 scripts/oe-buildenv-internal | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.17.1

