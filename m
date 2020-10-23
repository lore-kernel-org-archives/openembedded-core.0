Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.60])
 by mx.groups.io with SMTP id smtpd.web09.12032.1603472223611592581
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 09:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Lyt3+Zdp;
 spf=pass (domain: windriver.com, ip: 40.107.92.60, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwpAzsQouOs6Rze9tr1AQj/Wy6iC2SiOp9oEBkiQMHSaYV6KouP9T0JdSPqobieheFWTILhnAIEhFPaR4MPDDoLOuaJ0WABEqdE7NLNE/ghxPmAcXMkfeWLpwKa7VulMueDTr2Nm+VvHWb5ccOMToqRaAs6+VV08VajtKQwqzPL7N9AMILvm10p5iA100ZTpmpNZrG5pFE2s3v/A5dL7/Wf7b03vfEPtuZGn5ckEWK8jdzCrl8qEat/veJIXOgWIVOsF6dFuMLhJ6v+SkxHeghu8W6+phnctAJsqNxnJpDmy+Gu2OvIpvuJ3saFP0zi0VJZ9HmVYQvU6YcxlGPRESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xaypR+wPSArmKf+Kqi0Ua1zLRm9Ce4Hq5MAaUKJkIY=;
 b=kEb185leI4dHhR6Hb4qXebgQ5lMENlNaOB//FEVC71jheuwClifLYX59x/DokkDblWiBkg4XOblC78z0W3+O7rZYXbu9WQ0QzKbRGVjnZa4QWX/Y+4zzhbUuFa1MuOWHKMnVYUHri/aGGLPLa/+Y+MAUGXDUss2aDEgDGg96/8Uldukvv9Y2ixbmV2RIoAlU0W9lO4nIAcfFS8UcYCh6aBeXW3pqEVpYtRnNJ2UWJYWiLNENW90/rmc9VJ+b7BNssyUoA+lSIFfviAmS8dgJUt60b6qiQbWmi3Fz8df6J7IbamLopLHouvsvf+gRnkCebQWda5GAXsT6H0OtHvAkDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xaypR+wPSArmKf+Kqi0Ua1zLRm9Ce4Hq5MAaUKJkIY=;
 b=Lyt3+ZdpfLDeaoJHNikpFj73wg13dgty9sxK781NmOUGvgVoYT36ZO00pBn8oP9KhtDaEcqUgdcXB9Rj4uShkmVyp6zHmuWQjBsnm+++A62PhfA8ttOktAnDzxWnp03krYrptk6yeIWLeu+05fA4qxAXKP2WCyHKD19lAImeZMI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR1101MB2106.namprd11.prod.outlook.com (2603:10b6:4:54::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.28; Fri, 23 Oct 2020 16:57:01 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a%7]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 16:57:01 +0000
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] buildstats.bbclass: add functionality to collect
Date: Fri, 23 Oct 2020 12:56:47 -0400
Message-ID: <20201023165648.5515-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Fri, 23 Oct 2020 16:57:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81e387a6-c7a2-4952-35d7-08d87774a92b
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2106:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB210655A64E26E5E1F97FB286F21A0@DM5PR1101MB2106.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SiRBw3JkOChrTyoGJhCoB3H/FGSAYXVM2vXuZzmLVmRQ21p4shWZh01v98h1bGz+aXHU34hWNFVNZU8CpH040EXkAGxA0TguUVR51AI1/weLN2p5VJo6nQuTNT1c5x15WqWqHZxYpkB/JOZ15BDOhgl6zZhwfw75BxPIuAr8aTkSU1fzt8fHk4S+Xoora6Dw86aGbJzDbc09lP6TAwa0vvLnUy5oR+YVZJJdhPn8fDrq0zpknm5WdNqKGMUV2x8xil0rLzLtVC2TLBzZxCHxuiuRUqX0SdGFrfhOkEThRFlS6hU9iANfj13vFmCoWzkPEVHawNZj2brYdlOKvsDd5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39850400004)(136003)(366004)(44832011)(186003)(66476007)(26005)(16526019)(83380400001)(6486002)(2906002)(6916009)(52116002)(8936002)(66556008)(8676002)(316002)(66946007)(6506007)(2616005)(36756003)(478600001)(86362001)(6512007)(956004)(6666004)(5660300002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FHnax/ZKYKetzWexjgtnn5XGmu1fTPkpZajGh0EyCd0fM0t1bMyQa2/cqTdF3JyRUlFeVF3ZCYtFg/EmohUuoyFAzVgVsr6ZLUiGI5EB98kgTPQNwIBNm2DY8rQcq8x+RtXTX13bh0fvPzBo4ouwM8ytmnatq0l5MJoKwgIrU59lzuUgxOtTYjSlYIH7CG988R825eKDyawUtpyjmg9kd+NwvooTCftoN8mrGJHhh1z8S84/v1hOkg6dUq52yyGB61J6hRhF7UZ3MxZZLgHbemspgokEONz+2X3NvhebB5AqAicVB/GVVwEEMX6Ql9P5OR6iLWq8pX32W5BtmLSXmYXpw2F4w09Df30pnU+EOF/g7ZWlvdpGGNlWPYNkqBV2HfP+qeXqt9sCtFWZjcfn1lNNU9wQXiiN2MPuaw2g56jR6rCIpyhcdXRaQFdJSNp65gnCejtNon7yhKQtKpVtLbB57FeXmMM04B5yGZOw6Y/3GFcw4DvlqtGH6Cky60HVVtInoZdYw7V0JDELBXSk0SyO1rtDxIjAoayW8swjCn392bp4LawWuuAYN8xfEGdu+ttQUQS33tn/P6/tDG0P8kj/UuZ6PJLXQWkV2HOKdQafWeZNrB95BvKDyyGImMAGZluTXP7MEEI4kqMAx3CEsg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e387a6-c7a2-4952-35d7-08d87774a92b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 16:57:01.3136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xH1hv/vzCgGQyW8aBAPWM/hBHoZimW5gGx4VyL8pc645kaM/kSTvFw5DuEdjG3fvJz60xWPX2sYC6M8Az5uHOH9Qk4xVt+P7+Bi2dp81IzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2106
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This functionality allows users to log host stats on a regualar
interval and/or upon failure.

Initial implementation design was to predefine a list of commands
to collect host system stats.

Obstacles:
Event TaskFailed runs in recipe specific environments, ie, the PATH
variable does not point to host tools. Moreover, having a predefined
list of tools to run is rigid and many of the tools may not be
available on the host system.

Solution:
Allow users to specify the tools with the absolute path, as well as=20
the desired options to be run. The onus is on the users to make sure the
tools exist and the command runs to completion and exits.

Built core-image-minimal with an interval of 10s which resulted in a
log file of size 15Mb at a cost of 1-2% increase in build time.
core-image-minimal tmp-glibc is ~20Gb, and this increase is a trivial
increase.

Grepping the log file for specific tokens give a useful indication of
how the system resources are being used.

To Do:
1) Do selftests need to be added for this functionality?
2) Documentation about the usage.

Sakib Sajal (1):
  buildstats.bbclass: add functionality to collect build system stats

 meta/classes/buildstats.bbclass | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

--=20
2.26.2

