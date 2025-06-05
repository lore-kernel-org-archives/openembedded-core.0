Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FA4C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 14:35:50 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.33])
 by mx.groups.io with SMTP id smtpd.web11.9396.1749134149095285795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 07:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Q/Q6c/2S;
 spf=pass (domain: cherry.de, ip: 40.107.162.33, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMc8y/AQe9uQpR/cC9Menn3GxQWSTTmMwYx43eRPXNzOkLEpJgVYImePEWSXOm8681UCyd7jxeN5qZ6fworIeO/NEpkLFkcAz4tpvEYx+lxk4S2QAHvNC577tTRsOZmCmaBdCRf5EFHLfXmmnzq9OAhkKUALVy8wN5PLSyRbbJ5l0VXOjFJ94FQG/AgwWRAINjCyTYwHX6sfAKw94AkyyDvsJ33Ap81HGMtEj0m7RMPnXAUUcqPJhZlUX5UQA3gjbkp7thmB4fdbIOHqLFqj0o2Ara5T1zEV7gOhPL3GEswyu01CRQRdGmuXW/57w7PrWnjrE/9rhezgx+yuGN3EMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajyKmqAYB/zAI8YogSQi3aVm1eCOTxHqjQh60+ueFCY=;
 b=O/9pWrx9RXWpWb5AFa44gk7iYmrCau7DDOK3yZmza29rXYhbGasK1opy4X2kqnu5lKd4EMi6JqYcA/HJeJhBB3ff/Q7iEAD1qO6l012Zk/ljjUokJmFjV7Lw7KqZmmNkZMlnAuLVwj3UwJtJnaH0mEDKjdG6S8QFvam0+0N2jGiLtNJBb3bITY7CnzYKIi75cqsGQajV7u2NcrRn0zAKpeFfanSlV7E9KeKCeJQGFsKfXyQ40dTL+o4XzVLkudSMe8TrlUMmMwtQ32JN6XKX+KOCB4pLO9FZbfjBqSkLpkgUUsVwF0dRtpueiOIj63lGOkhNQEB6s8A2342haizOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajyKmqAYB/zAI8YogSQi3aVm1eCOTxHqjQh60+ueFCY=;
 b=Q/Q6c/2SJTXzDTcX1NX2k2c3k5bltNZZLl/v3/jC16FagGodGWz2Pgyw9fcvQqY6530Ix/NN4SBQN17DCMw5AMDt4Y/wAApGgUomCvukQcylsktBtfxDRBLKR34NRgYopAx9aEBbjiARj1HxN0QDDy6GmK9gfGIYrUke+r0OFEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10593.eurprd04.prod.outlook.com (2603:10a6:800:275::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 14:35:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 14:35:44 +0000
Message-ID: <09804aad-1957-4e69-984e-e31686fb506d@cherry.de>
Date: Thu, 5 Jun 2025 16:35:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] ref-manual: document KERNEL_SPLIT_MODULES
 variable
To: dixitparmar19@gmail.com, openembedded-core@lists.openembedded.org
References: <5621aff1-9f53-438c-a7f8-2acb66d52a4e@cherry.de>
 <15723.1749131890317178907@lists.openembedded.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <15723.1749131890317178907@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0488.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10593:EE_
X-MS-Office365-Filtering-Correlation-Id: e921af07-5abc-4e36-fe99-08dda43e40f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UHZaK0ZlQjhOME1YUXBwdnNFTFlaWXlGcXpEcGRyaGxFMktTOWJRZGgwUWFa?=
 =?utf-8?B?cE5nakdCR0VyZ0ZpRTVuNC9GaTBNajdCc2hxWjUwZ2F4aE0rM3N2UHVQeWpF?=
 =?utf-8?B?OTNuL25rS2tEaXZ4d2JtMHp1K3REalhFempsSGxnVXZPMURDdUd3RWIydGtn?=
 =?utf-8?B?WC93OVdaUW9NOE44REhhL2NuN3hQUzFXTHlhUWZtZkF5Z3h0OWlYUDYvTW9M?=
 =?utf-8?B?YldGZFVmU0lYMktZZFViNHJMcWcrQjZ2TkM2OUY3Rkh0Q1N6VGNrQmhlc2x0?=
 =?utf-8?B?OG1zbElieDdtM3JIcldVSk1VUmJQZExwUU1oRmFWTmFVMmo3WmxrL2crenRU?=
 =?utf-8?B?dzR2WS9hV05Rd0tXMjlHVHF3Uk5wUGpVSkJQeTUrU1lWTGJ3eEllZzJtM3RV?=
 =?utf-8?B?MmhZWnZjT2EzSmNheUJIdXFpTStLSFF1QTVXMy9hYXBsVVZRdS84NWFPNERx?=
 =?utf-8?B?VjRQNTh5eld4aldhaytWbDhibFEzMk9sMytFbXoxTHpkQ3MyRWl2RUN6YWFw?=
 =?utf-8?B?ZGN0VzhxNXh5VTNEWlVXS0pIM21sSGNjTmZTY09jYkVrS1IwaDNsVFUxNmdM?=
 =?utf-8?B?OU8zRTVGWXNkRzFwbDVrbVAvWll3K3hGbjZKMWVjL01hRjhwcU15QjhCM0Zt?=
 =?utf-8?B?MzBhVHBXY1ZDTU1HWE5kdlZJZ3pyM1phUmJzcUpZVnZuclpya29sS0w0dEhi?=
 =?utf-8?B?MWx6STlYTDRvUHBEWExJLzJmdDNyRTBXeitjQWtDWjJxUTFlSnVTZEpHNGxS?=
 =?utf-8?B?eXRmdWhyMDAvcGk5enVpYVdGbFllQUNTbmM2NVBaeFdscUZNeUtvYTVDeVc0?=
 =?utf-8?B?K0ZqNmJxTENwQldGZkRKdzJpNjROSmRUUVhqMGNIUXAyZEpRV2VET3FXNXJv?=
 =?utf-8?B?cEgxYm0zL0MxRmFrcks3bUxNampKWXk5TFQ5bkNHOE5JMTBjKzdOQXVZVlIr?=
 =?utf-8?B?VlJWdWhlNGJEYzNtUFF6L1FHaG9BaUdxQ1JWTGdvOHEybERQWVhWc0IyRWNS?=
 =?utf-8?B?ZWs3eCtGRzRuQmlhVjRzWXhqMDF1cGJHdlJ0cWdNdjJRYkRDM2l5bzk1ZWg1?=
 =?utf-8?B?aVZMVXQrUHg3L1F6SGcyekhDQUU3Y0xLVGhaZEQwN0Iwalc1cmJqeDVidlJi?=
 =?utf-8?B?SjhqbjJrNHk1T2RiaWZQN3BEbjZqa2x6Z0daYWkvZ0Y4RXc2Q1oxUDR1N3l1?=
 =?utf-8?B?Z1Vqdkh5bTRwSzA0MHhzYU5lVHNvTG45RHNlTDFSV0pabmYwOHhtMVF0dmNz?=
 =?utf-8?B?VlZDeHpWcHlzSmhjSXJvZXZiNlNLT2VkcWxydWJmNytLVDNscENIbGJVcVRT?=
 =?utf-8?B?TmQyeXQ5MEV4cFNST1hzZWpQV25xa0lORTFZeXVHT2lwM0F6QnZQTUpqWi9R?=
 =?utf-8?B?b2RIZVMvWnRrZjBTY0FLL1lydjNGSDBYdVlCZk9rTUtMc2V6aHBiT1hwMVZ3?=
 =?utf-8?B?ZWhkcHlya3hBNkR5VTFOSlR3ZFQxOTBKdHY3aDdFSGl3ZXAvby9UMCsvN2F6?=
 =?utf-8?B?SWdFTk1CK1owQ0R5MzZNSU5SYVArTThFVnRDK3FVakdtR2hFZVVoUlhWc2ZL?=
 =?utf-8?B?blVrVXhUVHpSc1hyb0VMVmQ0R21hTzRPdWxlVmx1d0dQNExOb25tNlJjV2ta?=
 =?utf-8?B?U3prb0I4SXU1Q29oWnNScmRyRWwzU085VG85OFc2VkhKbHV5NXNZVzdQb3ZF?=
 =?utf-8?B?V1hiV1NwdStyRWJDdlRNOUVqZFE3dFlXVjlTSjZLRlBML25qM3BGYXREUVI5?=
 =?utf-8?B?d1FtVG1jdHhjQ2ZwZXBCb1NJd2JKK1pwc2ZKNDdUUXJWWGVaK2Uza3BvQUVQ?=
 =?utf-8?B?VVNkdG5HenRJVVFHOHkyMlgvNEt5MnVDMFlEU3gxMC83dHNTM1ZrNnpsVmlW?=
 =?utf-8?B?bGh4NzdWdVpzSlJmQkVMUlh6ZXZ3TWlOS0FEM2hHajU1RExydlhsYUVETzRy?=
 =?utf-8?Q?1NNxoeJ2K08=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGdPdlgydFZVeWx4RURPdGJnUVA3bkhUQXNxWkdQZGwzY3RaNk94VEF3eFZY?=
 =?utf-8?B?bDVtMnpJNTB3KzBrL3NwaWh4d2lQbDlHaG1YNjh2VmlZSjI4M1VsNG1WZzNE?=
 =?utf-8?B?eTd1U25ZZVBrL21xR0JHM1RaZDJWREs0NmI3QVljTFh3dk05V0VBTXFtNElV?=
 =?utf-8?B?endmd0xzT0JqL2I3YklCMk5XbmZBOXVaOVlyY1NZNk1ZY2FKYUVBWHJUeEFq?=
 =?utf-8?B?eit1UnVoOTlpMmxBSjBxcnBGZ1FJRlg4dVcwd0lwb1dGb240c084ZHFpNUxJ?=
 =?utf-8?B?WlZtNWNXaVBhZnduMjhOdDQxSnE0WnBBTnJOMlRNRTBNL0Z4bXcwWUZXc1Iw?=
 =?utf-8?B?RHplMzRya0JaZzl3UW9BMmQ4WmtLRnNaQmNoTjIyR1JzbW16R29NSzBjMmlq?=
 =?utf-8?B?TVd0dEQxdXVJekdDazJmaEN2VWE5K2h2T2I1cERYZDB6QmhaRjhNWkZ2dVpx?=
 =?utf-8?B?ZDk5eWpWODY0UEVoQUNGRXZYL0MycE45SnFGOXc3ZGI4QUtnNDQrVHF2RDZp?=
 =?utf-8?B?dURoNVlXcDAzTUYvdGYxNTdxMzZ5bFVCL3ZOcHVSNmhqUzdna1NzNCtZNWpX?=
 =?utf-8?B?ZVF6L254R0wzenJkQ1lxSmlDWTNVTWVtQ1QrSzZSRExVQVN6QUxrT3hsVE91?=
 =?utf-8?B?eGtBeUZGVHlZNkVwbjVZNm5wUEl0R2YyVyt0c0hibFVhbFE4OFBDSEFaRWN6?=
 =?utf-8?B?UkprRDVTRlNNZU1CTTc0YVF6REh6bkdSVFVpN0VBc1QwclB2UzZaK0wrYmFU?=
 =?utf-8?B?TnRSeElseTRsZHFoMFhFTytvZUc0NTJJalJZUXgxdmRHdXdla3hpOFdDZ1ky?=
 =?utf-8?B?RmZUM05IQWwzQWlmQkdlemdXWksxY3M1NE5hRWtSVWN4cmQwZ0EveGJzYVZY?=
 =?utf-8?B?eDVoS1lPaGs4bjFxeUM1OHNwN2l1aWRkanlpZ09aV2pobkQxTU9hQTRHcHpX?=
 =?utf-8?B?Yyt1Wm1QQXp6WkNDUTVaR0RGSXhwTW41NEU0ZnBlaDhYMEpabngzUWwxcERk?=
 =?utf-8?B?cmE2YU9BNll2c0ZxRDFsSCs5aEg4RmZsbjRJa2Z5MGx1aGgyMUQ2dmNxQ3BV?=
 =?utf-8?B?bnFxOXNqbXlqZVNlYjlmMGF4ZHAxZUU1aGFsSk5JcDV1c0tiNGhRam9RYWxp?=
 =?utf-8?B?c2dGTHVibk5RVDlaQWVjc2tmTGhkSS9DdWZIODNRYkVhY2NTbzlNVHBUOXZu?=
 =?utf-8?B?M2xCUmx3NkxObXdHQlMwOERjWjE0THVyVTBCb3lvdFBpTTVkYWVzek43b3Ix?=
 =?utf-8?B?S1g1L1V5Z0FUdEZkQnc0cUlOYzE4SGRSS0NKajIxVmorR1hBa1k0WWpmZzJN?=
 =?utf-8?B?RU1WYk1sdlFMbnVqYmVjNHZXVE9xU1VLK1IxMGVGV0JkdHVQZnVqeHVGTktQ?=
 =?utf-8?B?TU9aNGR3K011RXo3Z0swZ21WNDlYc3liWVVFSTNwbCtwQ0h6aVN3RFhyZjdt?=
 =?utf-8?B?SHdXamxEVUQ4VGZKN2EzKzNRZE1Gc1VFV2ExK1NnQ01YWTBTZ0JuQitpWFFo?=
 =?utf-8?B?aEt6bGphT1Vja2hjSjhmR0pRUCsvSHNGOG94TU9xTTgzOHJIMHF2cldjWEcv?=
 =?utf-8?B?cVNEYUQxMGVJOEVEUDZSbmloa3ZvRkxqbGcxZjlFQmpvTC9QWUdXbkljZUZv?=
 =?utf-8?B?c2ZXWHRMekpBYURkUHk1Vzlla2FmUXFncWpNTlp3Q1ZvRmNha1p5T04wOGg2?=
 =?utf-8?B?VkJIems3eWppdGJkS2VQRUpZa0o5N3JWMDJuMFlUcENrL2xJWGtBZkxjRzhv?=
 =?utf-8?B?NnJKcUcvMkxqSm5jN1BVcWNyakFORFRPZ052SS9ROWV3NFYxN2V1SU5rSndz?=
 =?utf-8?B?azllR2VQMjF0N25sL3QxRldxR0lxOHVDeVZVbGNFcGNzK0pxMXVTcnRMcWwv?=
 =?utf-8?B?M2VjMDgweC9wQU5SN0F2Yzl6VHptalZHaVB4RzRFVS9MUlhpK3JkK1ZHVGFu?=
 =?utf-8?B?NG9sSE5hQkJiTXJjTlN1ZUl2OVZzZ3Q2VjFzaHE4emhUaGlGaFJqSDdDa0F4?=
 =?utf-8?B?T3ZrMWM5TnVpRDR3cWRrUTg2d0psQlBVUWIvbHhoZHN2bzl6V3dwQWltKzJN?=
 =?utf-8?B?WVVHRnRpazFlcXVsbTBjYUcwSU5GMFZZRzlsMHNDM1Y3YXBpMmhYa0ZYUURR?=
 =?utf-8?B?OEhnc0oyekFZQ3ovSnhHcmN1Rk41RUR1U0UvaDhuVG5CdzJNdFdNKzRKSSsy?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e921af07-5abc-4e36-fe99-08dda43e40f7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 14:35:44.2690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfpsdU4M6oDJLd2wkTVQMcKgJEJV3k7iZm8X8VG/rY6cUsO0ALUc1EQbxvtmHGRWpqQ/9hzOHQud3xv+hm03fFFDcAWfj1edctiS+vJnK80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10593
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 14:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218027

Hi Dixit,

On 6/5/25 3:58 PM, Dixit Parmar via lists.openembedded.org wrote:
> I had sent out this patch on docs@lists.yoctoproject.org ML with a different file earlier, they suggested to send it to OE-Core so I sent it here.
> I again sent this same patch to docs@lists.yoctoproject.org
> Looking forward to reviews.
> 

The original patch sent to yocto-docs mailing list was modifying a file 
from OE-Core so it should have been sent to OE-Core mailing list, even 
if it is "documentation".

As feedback to the original patch it was said it may have limited 
usefulness to have VAR[doc] and we should rather have the variable 
described in the variables glossary of the yocto documentation (or in 
both places). This now modifies a file that is part of the Yocto 
documentation and not OE-Core, so it shouldn't be sent to the OE-Core 
mailing list but the yocto-docs one.

Note that BitBake also has its own documentation, c.f. 
bitbake/documentation if you're looking from poky git repo.

Reading BitBake's README file you will see that patches for the BitBake 
documentation needs to be sent to both the BitBake and yocto-docs 
mailing list. The reason is simple for that: BitBake documentation gets 
reviewed by the documentation community (typically looking at yocto-docs 
mailing list only) but merged by the BitBake maintainer(s).

I know this isn't necessarily the clearest or easiest information to 
find so I hope this helps. Please let us know if you have suggestions on 
how to improve this.

Cheers,
Quentin

