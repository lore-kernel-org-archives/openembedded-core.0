Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9985D1F9B8
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 10:55:34 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40643.1764845728254884594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 02:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QQRMhwNE;
 spf=pass (domain: cherry.de, ip: 52.101.83.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdUtn41JauosadgFCdBQFaD1t1AIUkIW9DFxbpmzy7ubr4TJmL4bCCrRcjE91NJMEm7sCnSNe7NCtX44+jT0ETKmaDujnPqqMIkk5lYhE2gef/G1vEFTVHGIJZLQVzpmIJ+lX0qSQuun0irq/SEctp46FSFyQITopiwyZK92mvKsIzxrwIvT8U8ab/Dk9YD7Mpwe1bhvIlDt0QvsbNWD1lml4Uue9OIky8Mdp+I+UN5Z3NCnqfDIPT+eeWGkFD2iYtUbmCTFD+32zjJG4i09p+lpNorpphBgKKE7wt2reQ+p7eMErpeQ85W4tC05znmEPJr2nIF5GUBP15S19WPvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vLzyAx+LX+KCvs2XSRIkFnv6a2spOHrYSn6WxpPfSA=;
 b=y1kGMCd0t0M5AoaZaPfla08wfbxEXNfehiNmAssf4KTcIX6dbVulFq3egypCp9zNHslJ3qAHsydzVOVWz0LgptAcYSRX78IMsrK3JXAuwfJwoHDOWma8tuopQ7LCmjPTj9LMJHXfikcJL5KUzvDEOz0bkcGP0/LLv3J6hyQsqfkXpceWrcNXuM1QPEaW+e1CRU0UJUTM5fWH6bCZcuaJGAHDUQ8z3gHKAEQdPz10I9Hx9ouZDkz5CjQG6O3IWYmSRMxV/CNVuUhOUaf6wiEEkXShHsYb2oj+AdW+l6B5S8+6/hQ/ito1d6eaIjLRiQz0KA8asXcVwnolzbYLnTFU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vLzyAx+LX+KCvs2XSRIkFnv6a2spOHrYSn6WxpPfSA=;
 b=QQRMhwNESigEfvrHTMoyW9q+E0Nl0tu360uWlLA5PwpmQZ/9OA69uWDWODQ6vxtdtfSJhA08ad8G2LN9XdMUchvfdC1D6zHgOhVb6oS+y13o9qd/pWyCRIhar7aDXBObww8iLuFd/vxw6gShISWJcyNnqzFeLMpPGCXjwex7SnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB9024.eurprd04.prod.outlook.com (2603:10a6:102:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 10:55:23 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 10:55:23 +0000
Message-ID: <b4056671-539e-4248-9a27-5ba13f2ac30c@cherry.de>
Date: Thu, 4 Dec 2025 11:55:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: upgrade 25.2.5 -> 25.2.7
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20251204104814.3255908-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251204104814.3255908-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf630a8-4abd-4b28-0a1c-08de33239fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dWFwUnYrc1o2SDMrYUI3ZlMxR3czSGk4NHUxWk5yZ0lKY2ZJYVV6NFZwcC9o?=
 =?utf-8?B?eVQ3d3plOWtkMlhMZ0RZN083UVd4ZGRQR2VGUU9OVkl3Mmx6eXJac09la1pz?=
 =?utf-8?B?SDhyb0xOakRiSnhIaXF3Q0N2b2JwM1lvaGxlWkpCeExUMzR2ZGsxY2tQMy9Q?=
 =?utf-8?B?TjBtQWR5MVdsNUtURHR6TmZUNE5PYy94VzZQcnhGdlNzRUNiRDFSa0JBeDM3?=
 =?utf-8?B?NTNMUkFjemJDUnI5OTczamJ4QVRBQVhzMEhwampmb0lxWkxsckd0eDd1MjMr?=
 =?utf-8?B?UzloS0FJNmVvOGxYZUI5M2oxT2g4VXZCQUgyeFYrazdGaFpZQ1c5OUpFOVFJ?=
 =?utf-8?B?SHFDbEhuU1J2d2RUeGZGSkdFcFpoTmxML1JHdDZHUDhVQU1zeUduN2FCRFFD?=
 =?utf-8?B?b0ViRW54UGpBeDVwa2NaRW9kM29kaFAyRWZsNTFFQzFyS053V3M1U3JONzRs?=
 =?utf-8?B?SFZ6KzVvaXRRK0F5dnZ4QTB5dmpKT3htL1U0b3M2eVV1ZWRTbThnV3I5aHNw?=
 =?utf-8?B?YXJ6OHVHY0Z3bmtoWkF4ZFN4UXpJVG5VRFdxQ05Yb0RCYTZHbW1EUi9WV1JM?=
 =?utf-8?B?ZVZ0RW9QQ3dPUHk0ekYyWTcyRGVwR04rcTBzSjBIblUwNmJHRmRJYlViTGRm?=
 =?utf-8?B?clp2cDc4TW4vaFVNVW9ZMWtWMjBhT095dEVOQTdnWGtubXVCclNWTS8wOGt5?=
 =?utf-8?B?WEUrWE5JUmEwYmFBWUFzQXJlR24zbXU5NHhEWkU4Y1FKVUpGdFJaOEMvSzFV?=
 =?utf-8?B?a0RzZkpHKzB1NnYza2NGUThFanJPTnQvbUNUampPT2RZUDg3NFVZVmxXY3I3?=
 =?utf-8?B?clRvQ28xYitEbzRlZ0UxQURnalA4VmtyOW9MWUVLTjNDSFk3ZXBiTkxQc2Zy?=
 =?utf-8?B?Tjg5NVlWSWNGT3BnVS92WWNnaE9tbWNoV2ZWUGZmTVFCZ0tpNEFoMFdXS0pX?=
 =?utf-8?B?S21JMDNNcG5VWGZmdHJaa1VtUHFuTnRHMjg0b0ZQUWJGTW1Denp2QUFWb3FW?=
 =?utf-8?B?OE5xSjF5bW01WTZBRlVkMldpSEhjVmJNUk9HRk5jaVNQbmZDdk1IQmdrRjVj?=
 =?utf-8?B?SEpsL0RRTm1rM3VKa1dnb0szVVRLRGFyZU1xSHRjWEtwRHdaa0JHa2ZyZ2lW?=
 =?utf-8?B?TVNJZytWcXlVWGlxOXVRM0d0L3hZZ2JrL0ZIdldPajNHVERzQlJQa1BDNy8w?=
 =?utf-8?B?UUJSN01oOURmWFVaUnpwUGRBNDErTkNVZFRkZHVreUFJOXFISHlVOUV0cm9W?=
 =?utf-8?B?Mk9jYStwM1hPL0FoVWh3ZFdibjl5SzcyVmZLUnVGZkVObVo4ZCtEUkd0UkhO?=
 =?utf-8?B?ckEvZFVXS3Q3V1kyc0NlV2lUNmM1bDM1SWxYL2k5T25OU2JPTDFNcmM2WTdz?=
 =?utf-8?B?V21nb3BHQ042a2NnZkFzTGcrc0J2ZERIZTRwL1c5QitNc1B6dy9CVFhjVE1w?=
 =?utf-8?B?MzdKSzI2cHU5RGxOSWsrQlVrOWVYcjFsR21wNU9oaTRFMFNUT3lseVNHWkQ4?=
 =?utf-8?B?ZFVsbXFMT2V3NXdLaVRGb2RucS80V1Noamg4ajJCcFg5L1pueWlLdUcxcmYx?=
 =?utf-8?B?dkNITVhwWUU5MHZ1bk5QUnVCYjNoVUN4bUdFa3NwRld4VzU3MDFnT2xMZmpj?=
 =?utf-8?B?VEV0Ry9aaU1EK2hXaktpbk05eThjZHpMRW44dmhrOHFXUTdyY3E5Wjlub0Ez?=
 =?utf-8?B?MXZUUFlCN1RCcGJueXFoV1RaUGJUMElkL1h6a05uM0k0bjlUcDFJN0NZT1R1?=
 =?utf-8?B?NUg5QVZrQWtuNHg4MFJ6cGtjZHljem4xaVFXOHVLV1J2eTBjUm16VlVtWkdl?=
 =?utf-8?B?N1VWOHVZaW5NU0wvelpPMmFNMVhNN2d0SkFKWVQ0NTM3QUVHWEZGS0J2NkJm?=
 =?utf-8?B?TmliKzJPUkFGaFFsRkRzMlVoTEFDZWRjTlZucVB1aUU3V3E0YVh5TUY4Y0xu?=
 =?utf-8?Q?zg/gOqkhnuUJVD/06CmjE/L8pjNmt7sW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVYrd2xPRFJNemUvMUlxT0JLT0M2ME1DN3dvdkxQZWZ5ZGZOQnhxdXhVa0Vn?=
 =?utf-8?B?OWx4bitBNGRHU2FRMjlRdFNaY0I4UHJPbVcyS1hSTlhCOGV5VWVNR0xFdm1w?=
 =?utf-8?B?d1c5WExDZ0p4MjNDMTVYOElpRHQ3TVYycHhpcG1NK0hYMWcxN0VNOWsrOWFJ?=
 =?utf-8?B?SDF0NFBNVzdjQi9rSWQyWDRDMm45YnJLVkVnYU9nN0VsSWhiU2Mvei9QbGtL?=
 =?utf-8?B?OTFIWkE3N3cvanA1R2EwRnBwTmRVRWlvSEVlL2ZONUJIdVNhenlLbC90MkFu?=
 =?utf-8?B?aXc1WW9PS3lmKzRXcHBqYzhKZTgzYk9FK09wMmE0RE1HcmtkZWpXOURpN2E4?=
 =?utf-8?B?djVyVDJCVGhrY2RMSXJpSVdjZVVYd054ZkpWaFZtdHZVTEZrNzIyUXpTcGRT?=
 =?utf-8?B?RGlMOVZIRkhjbjlDL2R4OGhPc0JuZFhNSDFLWnd6VDU3eElEYWhHZkVKckgx?=
 =?utf-8?B?WFIvM0ttcnVjd3R0Q28vcWNBUnA1WWw4ZHVuNGNPRExuZFQ0WEFIZ1VEVnpH?=
 =?utf-8?B?Z05OcXg0UUpqMk9WMnI3bGo5UUY5ejZhOWI3WVhiemhjOVBlOE04KzQrOHEw?=
 =?utf-8?B?NTh1ZlJVR1ZLWVBXMU9pWW9ld2VkWmF4ZFN4V3FsQXU1WmRkSVRJRU9OdHpJ?=
 =?utf-8?B?UGRyTDQrVlpEcE1IWXhZY2haRzVMczE1alBPNDU5dkFKVE0vRVdSbEhudGR2?=
 =?utf-8?B?WHo2VDViMWdMSU0zcUJEZXpKN0hOTDBJNDg5Ky8rNkdVclptZjhoenVyVE0r?=
 =?utf-8?B?bU16WkZrSVhhWDJqd2N5TFBsdXNoK3A0WTdzdE5OQzRNdlBDMHlhbnRhaVZs?=
 =?utf-8?B?OVpabUNaNDNaampzVlJ6UWFITVhFYnlleTk5cmhLK2JzY1NURmhhYk95VHM1?=
 =?utf-8?B?UWh5ZnEzZFBLTkZmRU5DdGc1VDhJTHltWnhJS054TTI3anVYYWkyalJsZlp3?=
 =?utf-8?B?QnVLRmF2YkpGT09ibW5DUXZpakxUV2RISk9aYXRlOTdLVElIVTlYdjV4VEtB?=
 =?utf-8?B?aU5ocSs4MnN1dUgyZlF0eldyZjhRcno2VDZKSjQ2aVdzcWNoak1paVdtWC83?=
 =?utf-8?B?THdFQ1AzVVI2RjI1VlJ0SDNGSHhZTDQvemVsS3BXczdMRmhpZnNiZzB1MGlT?=
 =?utf-8?B?OFphdEZVbXl5ZjZoR1JqY2Z3Z05EemxiV0ZsU3crbFZTTEhyZ2pRbm1pZWZS?=
 =?utf-8?B?UXZPWlpGTWtMeWl5aXk2Y2JYaCtrSnI5U0lMZVNIclVqOXFyVDJwZzZiOEs1?=
 =?utf-8?B?ZUxMR1R2aEJvbTJ6WDIyWndYblZQelRGN0FydjI0MGhlZ2U0cGZvak9Dd2Jr?=
 =?utf-8?B?RTAzQ0duZWRIZUxLa0RGa1VpYzJ3dCtiMXFTSk15UXhWR0h4VE5oays5Si9L?=
 =?utf-8?B?MlhwaW92TjBWbFQ4cHZIK21ZZFFDY0dFdHk3RTNZbjhZK2FBVWh0OE9TYkVr?=
 =?utf-8?B?dGFVL3Z1Wi8xYlB3aHh1ZGNJclphVXV6MHI0a1I2ZGdqUkRxSFJGM2c0YVVK?=
 =?utf-8?B?cWJBbGdLVDR4MjhZNXlSWGlIU3ppcHBRWkVRUzJqSERkZDZGTUd4bnlyTU5h?=
 =?utf-8?B?QkpERk5oV0U2dWlIbFkwdG1CR01iamkvM3l4SUI0L1l5Y2U5dTN2bjY2ckda?=
 =?utf-8?B?czFFNUxQRmliQTlDV0hzZE5MaGYvdytBN0x5MzBXS1Rxc3p3eWlvckFVblpx?=
 =?utf-8?B?TjREWFMvM3h4VnM2T3BOSEhvZEFQK2gvSWxVVE1FVllxQnFLa1BtRUR5ZWZY?=
 =?utf-8?B?ZE9BZU5SWkF1M1hpa2N2U3FhakN4SjdZRkJFUzgrbXg4eUl0YjFteGJMWUtu?=
 =?utf-8?B?b0JxdG5HdG9UcWNNUHRzdzFBS3h2Wm9URWRyZklGeVJZS0Y4YlpjWlVmQUV5?=
 =?utf-8?B?bXBkbnYvMHgyL1R4UnNkUjZQd2p3NUxIZEJBRmRqYnpnVUI2TnI1Yjk2MmhX?=
 =?utf-8?B?UllIRDMwU1pMNk1ncnNVSXhmOStTZk5lb09OYm01Y1BOanpjTUZxblgxRFJk?=
 =?utf-8?B?QjFVOSt4YnppdnFpU3VQVzI3dy9SQUgyWnoxeWpBc2ZhektDTFgrenJPM0Nj?=
 =?utf-8?B?a1ppMm91WHRGNnlxSmRtZ0VmWFlRcFFrSFhVZVR6UVByUHlESTlZVGZucjln?=
 =?utf-8?B?TzdubUJsdzFGTmlodzhpeWpjVUVucGE5QzFja0NRbHpHQ1JUcjJNU3R2eFMv?=
 =?utf-8?Q?dzkW4099hQhdgHXPYQyK68s=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf630a8-4abd-4b28-0a1c-08de33239fb7
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 10:55:23.1204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZcYbxzrQrn7qp/MX1Bvm5QAPFg96xsd1e4iLyjbuO9UbwzN90JJr7CDupwBdOBAjSuidcGKfLpaw9vVE95OYQwd/CP0MUuZ3RiytO57jGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227279

Hi Dmitry,

On 12/4/25 11:48 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Pick up the release from 25.2 branch, fixing several issues with the
> drivers.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

