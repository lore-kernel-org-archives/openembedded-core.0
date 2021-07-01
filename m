Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.112])
 by mx.groups.io with SMTP id smtpd.web11.4819.1625132804553432041
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jul 2021 02:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=lJFRrmaB;
 spf=pass (domain: prevas.dk, ip: 40.107.15.112, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCw+IExkYsjwPAm5DXat2IVjcAW16ON+CGrJrJbTK2fIcf1PA62rp9TyJDAjVN//6y+t56TWBF+uZSSVIbJKEobdsys6dlEoyTStA0lCea6k+y/2dk7W9lhj9jFTJJi9DQBFl6HMvcXYC5/uCLO5ISqYoEi+gda/kr0YgaTr2SH7QGKxPC5QWP3eq3gwR7ynqKXOPmFUNiioVgP47rirGk1hFcC0xfMZMQFuUOV8+/9BQpO6WRxSvEhNRmM6bppxIJOvT1wH0DhAPpay4WKVKLRyI113arJfbheaosAXUuwv+hso/cL8x/lG05x5rC+3SH3sPyLbk+jfBydaLzlhqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA+YfzqaTmJg/IrWPirgVE05bCLMxX7Lqxvtky1YS+w=;
 b=LXuRLd/n1msBMOOjTkLDQPGQdkgAJCKsrDIGu3OKTxFyoMf0qDb3xkLsItA8euo4tMjbhgXOv6wr4d85cXIdTi7YLTqj8M/JBjt/GEYXiiPuSnkRTJkzJchrGz9PAMkQqlcOzcSqOky1ah+IpQkR+sQ0MjdCIK6fZGPakCP7c46S+/VOqygzTFjU6U/EncRFXoCK8jiw+ZdF5PMn1fIHREPv8riS8NuZcsoCSafoC20MYY5My3fEv398rB097wmUWH0ivSJulT1WeZYTrya6q6OOV/O8By5L35OtuUcsMR+AiPmQ+NkfIy6Qa7Jc+jjFMT6BtT761/0LxJf1Srob0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA+YfzqaTmJg/IrWPirgVE05bCLMxX7Lqxvtky1YS+w=;
 b=lJFRrmaBAlAvFLnyyQcJnPZFzGtzE8a+QMIAnp+RgebacDeT2OzekzQujELDouE0ZtEtDSYOLlhtGWPBh26L6l/MkfqwnJLScno7QAjHfOFhOwnmcGR+xcClQhDS1MUfsPk4+hjc4LgQaVWF5i5sx+VSpXRmiwFec1SlqkwCnlQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3171.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Thu, 1 Jul
 2021 09:46:42 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb%7]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 09:46:42 +0000
Subject: Re: [OE-core] [PATCH] recipes-kernel: vdsotest: new recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20210630205233.23046-1-rasmus.villemoes@prevas.dk>
 <CANNYZj_BzozcbaQ27aD2WsJ0e_cCmNCzBzzmT=8yvWVXJJyyhw@mail.gmail.com>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <cec2d722-095e-5ca6-eea5-80b4d906f679@prevas.dk>
Date: Thu, 1 Jul 2021 11:46:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CANNYZj_BzozcbaQ27aD2WsJ0e_cCmNCzBzzmT=8yvWVXJJyyhw@mail.gmail.com>
X-Originating-IP: [80.208.64.110]
X-ClientProxiedBy: AM0PR10CA0089.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::42) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (80.208.64.110) by AM0PR10CA0089.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 09:46:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd2a7a59-0ccf-4baa-91e3-08d93c75216f
X-MS-TrafficTypeDiagnostic: AM0PR10MB3171:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB317102257956498215A9FFAB93009@AM0PR10MB3171.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6qwetn7UXsA4Pss3yUZdeAIT2NygFTZws26C8YFb2q2gLP6TqHOytbvT7Z4PNhNwg+Zg6udlMYsPXRqzcOERtog6Y2ENnP+gXMEP44wO8xpHj1gNJqcZ1LVeT2doV/w+QL1BlLJXfL28xtFjbwTMt1uO29DR7TheuunkRomEVeGypKKT/mRiERCyLxlBJCBgKgEb8wyR4sLgCi0Dvtlv5vWmxiAPhlqRRYUoWwI+jZmafu7ZeI9fQ5hKu3x0XkasVbw6Xk5SAm5BuaHbVsDkp8ZhsV1tIKAcaUU/3VZrdjV2H2ejqGM9Eao9fyIBihsQqQa7F17FxM6xNx8S1L1DxQOYwNtZHIEVvnLnWJEbox0DECTGFE3/CNyH0FdJAV9/1jX6l72OOGDiiQfHJrmZI8EjLEc9AFODGNnQcGrTYxzIMnPNrqVDmD58TP9nxtIkV5e3aNoitsOghDec5FKDOuJJCuRxd7gfjAKiGd+F6VPIE6DY6m3tPEGCrn1kZLowtIQ9ezILJrrMNQXoXAIb3/HLpalhhBcVSblZdHQgITfO3tdgWwBt6c37dE/kcKezbemfqCnGbfdB8bHqIgFbcZ919JSubpFVYG1PsrGjGvUg914/qjNKuNt05Yr4hdHPC/rMx74vzy5YjnXcX3dFrfmpFD4kftPdWt6Rk7jfe8HqJwkvAuou7ruC14/VfG7axWA6AffJtnF/jEbxRB1ci7/RLsvLAsZJwa7zm27WZM8V4FLWm7vrfCl8pa3v3Sumbp2XyOyZxCovzpnlONdBSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(346002)(39850400004)(376002)(38100700002)(2616005)(44832011)(4744005)(186003)(86362001)(54906003)(8936002)(8676002)(6916009)(956004)(52116002)(16526019)(31686004)(38350700002)(6486002)(36756003)(66556008)(66946007)(66476007)(83380400001)(31696002)(8976002)(26005)(4326008)(2906002)(316002)(5660300002)(478600001)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0J0bFpoTnp4ZTkwRitnYTlWOWpqTlFaQjl4N2xZd1UydElLaUlYdElkeEVT?=
 =?utf-8?B?Z2trM0duUG40S1dFQ2VlSXJSQTV3Y3VPZkZYTjJjTFN3eHJDNkg5Z0VnWVd5?=
 =?utf-8?B?QmcwbzB1ajhjNXBQckw4SXBMK21WeDVBYjIxTE9ueW1SZVp0S3dWb21EbWlo?=
 =?utf-8?B?eHkzaTlSUHZ1c3ZWQW05VXFkRUZMcEdnaWJhQjlNK2ViaUt6WjMyNndrb2t6?=
 =?utf-8?B?T2xWQmpWby90a1g2NTdnbEpDMXVnbytKMmNBTkhLVVNLUFZPaEp0Nk9GNmJx?=
 =?utf-8?B?aVVjbUl4dnBwNHcrMzlvYnpvd29qd2ZZdU16YmV5MXNJTGRab1N4OXpoYU4w?=
 =?utf-8?B?QktVUFFFVG9IWUFuL2wzcUsrU25USjZ1WFp6bkJyQjBrU0VzUnVmUHBxYnVR?=
 =?utf-8?B?bFNuMlg4c2hvT2c4cmE3VGUxMHdIejRoU0k3NUFFOEtqMGlZNVUvOE1MQUtM?=
 =?utf-8?B?bkprNGRUcEdhV1hxWm5Va2ZLN3QyVE54by92anFKdFNHNmxZaFJTczVGTDhC?=
 =?utf-8?B?STN6b2h2QWVlcEhRdUZSbGhJa3BqdloxM2h4VlBYZnp2OWFXdTBCR1hKeWhE?=
 =?utf-8?B?V2xtWmhBSzUyT2tvV0tmL2FnQnZlNTdHeFJmYysyMVgzSlFxcElTbjJlMDZ0?=
 =?utf-8?B?aWZzb1dOOVBDRmVIMVRCTXdJaE5mei8yWnR3RkhNMTZSOXk3QVMxWkEvL2lI?=
 =?utf-8?B?TlJYVFNWMnBMWEFqQmkrTjJzU0J2WHJUSzRXempZS3AwaktWZC9JYmZyejdO?=
 =?utf-8?B?a1hpQTJDSjhPdTBacjNUdFYwaUlqZkhib3Y4L3VVN1RId2dISGwyQzRubWNI?=
 =?utf-8?B?VWtqRXhMMjNvaTZnUjhYWDNRR01oN2tic2RrejhmSy90UUU2Ny9TNVRONThC?=
 =?utf-8?B?SWRNbGZJNkpJZzZEZW15RVZOZ2xkeUpFbzBqYkEwZ1RYem12UXc1YzMxR2xx?=
 =?utf-8?B?ZlcvaHNBbHJmN2hHdnlsWXB1UnZubmhvdkhDK2pXMXZ2SEVBNlNTUW80SnN0?=
 =?utf-8?B?U3M2bmFERGlYUFZJYXZRdlc1TGhGVmsyZnh3M3ROV1VNR1dzQmhnaGJwazlj?=
 =?utf-8?B?WER3VFEzU0tmT3grb0dBbU5oS3hkU3ZCYnZqTzdBTDlVQTliRys0WU5pdy9k?=
 =?utf-8?B?NWpQUER1aXdJaHhqQ1lpQTE4Mndqak1EMFF5cmdFbW9kQ3FzZGRSNHFQMmlM?=
 =?utf-8?B?cFRrOUdzeFVxRTBzUkpNbnlMSG5ZQWc4NjluaWVBd1B5OUYyVmR5aWNDdzEy?=
 =?utf-8?B?Y1grVjRxcnI4U0gvRHJtaUVIR2NxSXpucE5BSHR2Q1RtMEhVbXZMT0FEbUw3?=
 =?utf-8?B?TFJSOHFFaVF1Mk94UmVyWjZmVUpFNHcxRnAxdFpqTE5mRUVuVnZ2U1BiOVR0?=
 =?utf-8?B?Mk4wRjREVFZobVlUeERJTUQ3TmVBemk5dGJUYVB1R0RPRHNOL3k3emxOKzR0?=
 =?utf-8?B?dmcxRmVoSkxRQVFGUkdmQlNFTTVNMHhJdHNIeUE2TVFiN2lnejZnRkU4c2k2?=
 =?utf-8?B?ZlNwRlM1NXBraEdJTSs3Y1FweUlmdFNaQSsxeHc5TGkxUndZTWJYZFBYTDNK?=
 =?utf-8?B?RmhmQUNRR1MxTHE4a0ZrZUFCeDNweTRUczRVaTIvMkZwelJnRkFLRG1Pbmha?=
 =?utf-8?B?cnlCQWlWNVlWU2xGZTN2a1Znemd2WUpvdmQ5ZndKcXVrUUJOUm1VL0E3RjFT?=
 =?utf-8?B?VVAxbDFVT3EyWmcrcWs3Z3dXenZYcXFOOWhqeHRzOU9hcGJpNnZyOXYrbUda?=
 =?utf-8?Q?BWoFlqQ4aoqQId0jCRA8zsFpzxzbAmjZaTuFQou?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2a7a59-0ccf-4baa-91e3-08d93c75216f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 09:46:42.2784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gD/nj0HAvhdln0rphmo+wsttMcwNiHScsdI1Qqv2cc6gPqz3hNtgoySy3pJ90r2rXUkcfYBLlGg03rHm1Agz1Tr9YoR2OOljEo8XIWAMDMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3171
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30/06/2021 23.19, Alexander Kanavin wrote:

> Should this be in meta-oe rather than oe-core?

Perhaps. Could you share some of your thought process that led you to
ask that question? I honestly didn't think much about it, but it did
seem to fit well with the other "userspace tools closely tied to how the
linux kernel works".

Rasmus
