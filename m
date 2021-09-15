Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web12.5859.1631703188901505382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 03:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=Z2ARJggZ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.81, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2o7s4bh/xmhIA5LfTDji248daufaJkLVJ+nDwinZ10Q7KMYDx7v+YXDVyMQ8EkL8mPJ7yaV1yKEu4uxAEebyLacSErklZKih8mKB87DuVVEHfsZDzahny2NLBgHwA9c0vh2tYgIcaMP8VETxkXQXCPTOFD3cyYjNRWjqUkbJyDGM5NtTBn9AdktpKUzTC3fOmnggQRlgCT+BKvOtwt+6gueqfDfIIbSwBqh6Oun6r8QSAGHb1FxrDWtfDUgq5OvUpF73pT3kRMs4SrmyHP3jd6FEf4tBMqbri+gyQ3BnSW/0RfnbMGAPNiXaii/8PJFy+0jO2d7UrjCy5EmhNQCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VYOO44x+KZIYGzywhzOz7+0N1vR4ZHw9dAGxVraXfpE=;
 b=YGqnN6W5/Vp5eqaoRowSNirriRU4GqsWRH7LvYW86k4RD9WwEsE+DoLM1A4UhNwKBNv05Pe4IlQWsKAyinY64nXkMbXLt402bHVNWCDT5G2GIDf4OA8COdSbMJ6yxs4z/pJbrbO98t8jNBYebteZH0bKFpbseKAifUGEeWiVYOctFyoE2Cc52Tby3adRzI+wIqsGln285oRh/Z9kfZ9xCPIMkxIqrsANmdc3Zab+3pEAbJ+6aLTiqG/T/3PfKeAbkGIIxzMo98JzfbJMwzOhScxgY0g5Nc1vbioaZOMTjipxS9csjb95n/ClkBGwlw8Jmvo12gbTtQvCu85jXdTAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYOO44x+KZIYGzywhzOz7+0N1vR4ZHw9dAGxVraXfpE=;
 b=Z2ARJggZh/+wapKs74+R1b0MZmM0nUvCSC3c40S57fqhduM0w+oTU9v1ztP5l09pi1SPBG5ciCBZlqhheIPfFPgdcUzbVOLHn2i0QvaNGcaFiD4/YopfztANb4+vzt43YJ9cZuxUTVVZ0f9aRIQ6pPVyLqn9mUrOZ/8wFf1PEkk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3684.eurprd04.prod.outlook.com
 (2603:10a6:208:8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 10:53:06 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 10:53:06 +0000
Date: Wed, 15 Sep 2021 12:53:03 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-skeleton][PATCH 2/2] hello-mod/hello.c: convert printk to pr_xxx
Message-ID: <20210915105303.3x6gmiuaisqkxlvm@fedora>
References: <20210915003804.34746-1-twoerner@gmail.com>
 <20210915003804.34746-2-twoerner@gmail.com>
In-Reply-To: <20210915003804.34746-2-twoerner@gmail.com>
X-ClientProxiedBy: PR0P264CA0112.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::28) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0112.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 10:53:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 150ed6d6-05e9-498a-6202-08d97836ff82
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3684:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB3684F6412B4CBC07DB6EBA5AC2DB9@AM0PR0402MB3684.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Px/+ztdlwgsFozI46Zu/kAUl2N/0Y+YemWgkycf2KW3JjDVz9EHVmYGlxHEs2Z6ZWVbopUOWOBFVXOKDOGtWpriCAB6jxxCtqeUlFNu3NYMDK+VqaeVOiTL8j1YwvN+YOrd9qVum59d4gA6yA3f7DtBtcWx6pR9Pl+BhNNTGxeUXBSvv2OGmeQCJUcydG+LN9fGKU/KTQv9KqZlYn1yAFyWlxPXl7P8xmFdbtNusI+ArHmdTYBg0aDnoP8r4d8vcL2NdBTP9qdCE6DUj9fPV91DFwcGXGU3vqUP7t8xHIaTgtlSuQPKFWb/lG4mYmzWWUZWvB733kosy2I+nfJpcmO+PJjtF0P5GPo3HnS+qrXJZ+70I0N7avdK/0S4iBBiEWA/Tk/iqaKQOWPwV8oiBh4yBUc/RQNmNYI7jELgRZ35wuNQnDBlqXX79k7Np4ZXnkEs1h7Rveq75eg0o45ZCCyXxC3lUjSHqCT2m3/Uhk0eV4LCJzYdrTNrCK7RjCqCxRGMTQc4P9enTdUIKHUKRpU8jR3OOCiz+vtu5w4p3sRwEjHHqCKdAkRTcLC5oQ/p7r8KEJkN8WP+TGAxxE7uIcNqn14lxQzUo6Gmh6jMw+hDUjtTwU7DuTfmgs3i/0f84MeuphSHcPgHvQ6YUPEQhrYf5Zvz3PtDmyDQRjSiKf1Y2MJ/0rBFtqI2PRtaNBMvO/UOvriHPE6DdJzvjEcojc3zfS+XEz6wbEONTVmys7AA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39850400004)(346002)(376002)(136003)(52116002)(2906002)(38350700002)(9686003)(44832011)(956004)(38100700002)(9576002)(86362001)(66946007)(4326008)(558084003)(478600001)(66556008)(55016002)(316002)(6916009)(26005)(8936002)(1076003)(6496006)(66476007)(5660300002)(186003)(33716001)(8676002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZoqRqxuDYLGNt69+1Na153B/XhZ5ymCRkcBxBbSXFXnDJBBg9ZPNbTIYcwEY?=
 =?us-ascii?Q?RHvZEQn+EsW0nPn9ipz8H4S1nkhmC4Lt0YJyb29JM8J/ibvJSWEy1nCYYDzA?=
 =?us-ascii?Q?eisKYUGm2UcRZtX30/KYYsvKPDGcVbUzWL9hhJxk3W8BYxSKpnHKJmSpSMnj?=
 =?us-ascii?Q?5Vfd0CWYMFfJzqryu3FZw5OEQVm9n+YC3tcJTZ6UDBpSxzYwbXllaOVkX2xs?=
 =?us-ascii?Q?Mukbb8XiEq3wVbbDFZzW9Aqe+qo4n4YCC2dHhzBzMQvdWGTBUsZPqTfQjnHW?=
 =?us-ascii?Q?L+2edYn/BSoHawsilAUSFHaO1UX0Dj8/4eQliBFZmz+U1NdftwUQt5nGlTzt?=
 =?us-ascii?Q?VUeCNg8yxrhvTHy3HNbhDZ7p6wwpQPIr5lU1WC79p6k69wgbuViYof0iOaJO?=
 =?us-ascii?Q?SukfEtjPadgMwDfqNtqtb/1OAkFxRZ7a2HMa0e2Jvfs1N/6wj8dP7JO4Y1gs?=
 =?us-ascii?Q?Khl+2umksdE311vg81ti2N4nC4Yzw0gsPLEfD9ILQhJ+B/KyiSntlRNcyTbp?=
 =?us-ascii?Q?BVkmK4w0+VgnisHV/eEGYJMEEAAGyZFReycWPqb7MA3Suke/7TQRHq4ManCA?=
 =?us-ascii?Q?1KMJvlx32Kk+4iK1G5gsJIhVFq5WffIu+v/2n2odXDSU9d1c/2vfJ1iyavVn?=
 =?us-ascii?Q?uTcqVXamrOLkA8QRyTAWKfAe99OKebZl0T39QQOQSUyoV/o8F2jy//vEbcpe?=
 =?us-ascii?Q?KQmuQ3quRHybr7u78KwVZXc4Px1r5y3QFavJoSo4x10SNGHAEnQyKm5m7MZp?=
 =?us-ascii?Q?QOH1/+iGb2ClW6NlzMRKmv+h/jMXvAXnJ05c+YpPzu3+sX/KGtkv5btbHrcO?=
 =?us-ascii?Q?11L/LM9/rOfFysuEgjGFVcKBT0yNw6Mf7p2sGn1wlVnxi9WnJYwFcTNV7u+L?=
 =?us-ascii?Q?SGkO0dPyE1sbLrFad8/U0kVXgV0jLIvsdH7Yt59ZJ/tLN3Z6UiyTAKdHNiWo?=
 =?us-ascii?Q?pzNiABFR0vBW3NyvnWK8tl0rqLpiCHMURiAQtaczp2I3mq2yWY1gjuHFNZ2i?=
 =?us-ascii?Q?zkHU7jxajxVV+nZdbtqXmX4KyTAxLr6ijWhDEfO/SEzw8i1JSnK9eOZsWiTc?=
 =?us-ascii?Q?eGAcl+0nvNjgyTwfgmaRlBdDipTP5oxJEhxpqTAePWOCl1u9VBBnKsaEKNSy?=
 =?us-ascii?Q?yznCoO5G3Xj8XZv8YNerLLm1R+h/bx0Ae75KdJcp20O6CwzXDnrAHT+k1YBo?=
 =?us-ascii?Q?HKW5TmNBm7bPCa1uA5Eht9lUdvS3eIuCinwDbd7ulYrWJmWGJNtIlRjcOjze?=
 =?us-ascii?Q?b0cciZ3Y3WRf9TG0xTgfz1hE2d22rO0eWaHDZrAiBrrMVIsiUcu5rVRO7Vko?=
 =?us-ascii?Q?OK1QutT8YVcXfWQQfBSFJsYB?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150ed6d6-05e9-498a-6202-08d97836ff82
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 10:53:06.0607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJRtYVk7ELFCLV7LGqz3sxDlrj0BrA/JaHx9n3vYxNgbCtxH+fMdjMKs+F1swAWFVgHB3LdBtWKDNW39gEvkNVNs4LW9LFNXV9MuTpEISiYj7dRwkFKI71wLvL7Ytzvc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3684
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Trevor,

On Tue, Sep 14, 2021 at 08:38:04PM -0400, Trevor Woerner wrote:
> Convert to the newer pr_xxx aliases for logging, which embed the log level in
> the macro names.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
