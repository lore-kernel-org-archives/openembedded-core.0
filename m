Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.80])
 by mx.groups.io with SMTP id smtpd.web08.948.1616534258338338568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 14:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=V6zwRYTc;
 spf=pass (domain: windriver.com, ip: 40.107.70.80, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxOq4aO2Y1LNqIaWrazoSfPUfSe3MzSpxiOJ9VVx6e0T8pgf1xwClRx+hLZAAky4iEfZELQAnoKwv1afS6uI53mckd5kx+e2sShqUxFuqYLwLnKkTrs7CY0C2MbMKWXz7OZ9mBz9WqkJu5AJzv8VSF0gRkykdfQ5rPOsgQ1a1iPgu4JXiudpxnsQlmdVcVHAJwqrjLzXyOapVXmmZHMjqxgHOL4JaZkWYCU+KP6ZmJsxEfb1Dty2Cger5PZ5dlZDn7dGoq8QZVcmHa4uN7QMG0AwlUMifibaeWGKr257HAd7mwntuhXUzVGoWqrwc7TZnBjByIbNJ2MLLZgKoQO9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPi0c1Ts8a7bfWlt4WcsVsShGuKJkye4s4Y1GamKNgM=;
 b=QTqTBfH84qPnDrhen08vfOP86wFUitgavEO5VvKIh47AzUSsrlWzyBhf6igue2DxdUK+cQ9qXWwub076Ppo2UXakL93A4cxNaXMy5LaYghVsnC36i8gDJ1gNoEqcLnoneP63qAl9FzoWdfFQIaxYg9byD+zdQ1yPWuTvC9Ccv0y53NgmreBaQiURF/r+FThW3Pc8S12ZW+VMntKhBNrqBKBZQ7NW3zPhKEspVglmSdKLVXTOF1z6dSGWLYTWrMaB0HhdlbAb50O6YkZ7j5x4KwSUhHuR0Eebm2w+uogA/Q32sFygjNtNccAzdwBssOESdQy4z2SJA5txrMbNL8TngQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPi0c1Ts8a7bfWlt4WcsVsShGuKJkye4s4Y1GamKNgM=;
 b=V6zwRYTcOCvgKhAdWmx51XUSmbZ5VVsWa9yc+c1Ge/XGDZNzzRkCvBIspxftEbYox4VU51UBJ71ENk4/Dxhe2LSOxD57USe6TWAe38kS9qfVvdDOI18ZHnDTY1sI3CEyhRh+ONmoVTNXIiw6PsdZTPCP7RIqzqDSNjscskKVywg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2607.namprd11.prod.outlook.com (2603:10b6:805:56::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 23 Mar
 2021 21:17:36 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 21:17:36 +0000
Subject: Re: [oe-core][PATCH 2/2] valgrind: Disable ptest swapcontext.vgtest
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210323205029.87251-1-yifan.yu@windriver.com>
 <20210323205029.87251-2-yifan.yu@windriver.com>
 <CANNYZj-V8feRiiYvEEGKRrOKgFd-392PZa8XWRMs7Qmmm8+dgg@mail.gmail.com>
From: "Yi Fan Yu" <yifan.yu@windriver.com>
Message-ID: <835b0b66-1f28-ced5-c52b-7fb4516e8cc5@windriver.com>
Date: Tue, 23 Mar 2021 17:17:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CANNYZj-V8feRiiYvEEGKRrOKgFd-392PZa8XWRMs7Qmmm8+dgg@mail.gmail.com>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: BYAPR11CA0085.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::26) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by BYAPR11CA0085.namprd11.prod.outlook.com (2603:10b6:a03:f4::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 21:17:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9044685c-9e12-4947-1fc3-08d8ee4114bd
X-MS-TrafficTypeDiagnostic: SN6PR11MB2607:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2607AC766E502E1E73DEF98A80649@SN6PR11MB2607.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p+USwzrlCL0ruOBk03eWKeKGrWaU9IMQTaeXaSezpoduGohbHNX2FZDt8nxvUxKUGcyxj0XvIf5DUsYKhX6h/fIyQ/ypRSEDTjlPKvtNhZvnzQZG6XwVShY2dx4ABOuPq3d69wxTgI3DI0HUWtQOpbT2RvGZH+P5VeUUKuSThs1c1L12OTYz+7DeQmvFLimXIXb59XloMEGziV11dDmQHhFmpi/ZuD5tNViE+9ACb8NRQTKXcW0vT9BXCBjF+CouEtP0ONeaU3mOqRKUpiS5Scmk/UaqGEBKdKPmJc98sYXHM3I57LHcnjCscUZ1FU/qL/3MF8dX+ZF4thlWgBZjvTK5gbjNQGWS829CcyNluZze9yCTHaO0SXpK4TUYYw7dk+0zm4ac3rqkMIdFyN+luBRkcPzfzUWXaBgdWRvO2h/fXGsXq6EHNBDNQDcu62WwIcKgaqD9bTZZgbtkm3AHkUGwqmzTWI1L5rYLFh05vzabvPAjAeUSOnBBKag4b0+H7/PD9OGCNPTEZHubAkYwPqlCqJOjIl1cUfcZAEMiDEHjyds1vf3TWmGOmfSqzoQQpvLslXioI/ermu00Hj1DP5VMWWXQnIMIsr959ssbal8E3D0ZRpwPsRgBtKkupTeObbRPCgvnOf+Wda2JrGQ7RKEDoQzmYdxj3Qs9Kgcv9ePluuipk7wOa3WQSRdAitVwH9L5+EnCmiuKjlEUOnG5G52CsjF0zkgkh8yj8OPRzuI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(366004)(376002)(346002)(2906002)(66946007)(31686004)(66476007)(31696002)(66556008)(83380400001)(86362001)(316002)(26005)(16576012)(8676002)(52116002)(53546011)(38100700001)(186003)(478600001)(16526019)(6916009)(36756003)(956004)(4326008)(2616005)(6486002)(8936002)(5660300002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UkRsbFkvL3VLdkFweHh5aFdrenNycFNRWUFSc2dSNExJeTd0bVpSS1ExdkJj?=
 =?utf-8?B?QXl6S2lMZFhtUktnMHRDemtoYTdmOFI1TEtTVklGRXFvY2tXUG9IMTBRVWZL?=
 =?utf-8?B?WWlkMnNNcWxkZVRpNDNMcFdpUTIzaHdUZk9yUTN2U1pydjI3RkpoUmh6N2RD?=
 =?utf-8?B?UFZ6aEt2L3NpU0p3OTNRNWY2d2ZRREJuOTJ5YTJsdnhpaGtsRURmLzZ5WjNF?=
 =?utf-8?B?Z3F3cXlOZHg5NW9Xc1g5TEFneC9QVkppck9XOVdsTTlrTVd3QkhvRUhFb1VK?=
 =?utf-8?B?MGlhS3Q2NytFWk5qa2JlTGJSa1haYlRJYmg0Rjh4WU9KalZFbjNzbVdpbTRV?=
 =?utf-8?B?WnY5N3IwbXliYTFPUG5pVFIyZWVBdVNxQStvU09TRmNGalNBeERoU0dZODNC?=
 =?utf-8?B?bFhhYWhqbVRYaW1ydTIyTEVnUW5SZG1saVk5a2NCWXg0ZGxkNFlNRHppNmdF?=
 =?utf-8?B?UUwwRjF1TkNuZWdmblhnbzV5Qk9TeXQrc0p0UnF4UVdHTUdaREVsaUhLRW92?=
 =?utf-8?B?RDRtbThneFgwN2ZrOHZKSzBsQW1nYXlvY3hEd0ZpSTJCM0VPNGpCTDVPYlh1?=
 =?utf-8?B?Y2ZaZ0NpUVltVW9XRTJvc0tRK1ZTK045WE9DUnFRNUxwSTQxMHo4cWpNNW04?=
 =?utf-8?B?THB2M0lRL1dxaVJoR2FKMmhJT3Y2M0Y2ZWhsQzROTEN3eDFKcHFzVmEvc051?=
 =?utf-8?B?MUZLeHhUT25EbG0rMXR5ejROdlJHVWtxT2pHaUtYeElOdzUxS3lUeEZOU0Zy?=
 =?utf-8?B?eVNOY3VQclNUUUZhUkNvVmNqOGJKanJOeGpIa0hhaHRIZEVHNitpVW1xTnN0?=
 =?utf-8?B?SndlZm85bDJxUStkc251RXExazE1WUhLMkxhOVpkcnVXZ3NFaEVnRWN5S0Q1?=
 =?utf-8?B?NFhKWTUyY0hReStlaEFuNDU5NXE3eENCR1JRMG8zQUNoYk96YVNnS25YQ2hz?=
 =?utf-8?B?ZnJiTG41UU4rc1hDQzFnbHRpR1dYdXgxbkJMQk5GM2ZBMGdjeWthRGgzbnVo?=
 =?utf-8?B?R2ppeEhZNG1aQTVsR2toTktuNVhUUGpIblhMb3ZHSkFrT3pjUWFsMEFucGVS?=
 =?utf-8?B?OE02WmtFK1IwbnJqZ2F3ck8yUGdsRmxMWUxCYTZXMGg4OHlzT0pOWFUwMEhm?=
 =?utf-8?B?TncyL3g4Q1dGMWdyVXpJdDUyNDUyMGJOMmNNRzBnYjBnQXJyNCtVQTYvNDlq?=
 =?utf-8?B?Zmh1T0ZtbFVoS3UwcVlKV1J4dFZGNlB3TGV6eXlFQkZsNFBHcWJESm5uZjZH?=
 =?utf-8?B?bXM2YUR3TVNqTTFsdkNpdmZPYjdIZ0lVMGQ4Mmk1aGNjakttbDdIV3pTNUox?=
 =?utf-8?B?OExEVk1KejZ6MGwwUi8rcWd5YWdFV1AxQnIxdnVKQVZRbnBZWjN3UHFOMExV?=
 =?utf-8?B?Q0lLQlR1NC91S05hb0E0RjJsWS9ocGRIVlY1QnBvUk56N1NqUVpkSDZqQm5G?=
 =?utf-8?B?SVlnZmtudis2a1Y4cUREdEFMb0tEaW5CWGl4cmRDTzlWWHgzTGtuZnU5aW5V?=
 =?utf-8?B?bmpNZ1ZmbGlxMWx6QXh3Q1MydmQzTGZBUmxYZTRNVzFnUCtVd0hBRFZBMjJ4?=
 =?utf-8?B?S2l4SHQ0bkdZVlo4TW44UFdkYnJ6b3I0REVJb3c4TzdFUTJ3WU52TlUxdGJ3?=
 =?utf-8?B?VldVTW5LeGR1aC9KUmtBbCszTlFvTU9IcDEvSCtwVWFBQ2l1aUoyQXpwcGdD?=
 =?utf-8?B?T015V2hpRmpHZW0zTjViTnN4ZFdwK01vN211dXRHKytxeDJGZVhMMFBlU0ND?=
 =?utf-8?Q?6Rh7ORUklAqmQppud5GeujonXnn3uaitA8nR5QP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9044685c-9e12-4947-1fc3-08d8ee4114bd
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 21:17:36.2453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0n1Ajcag1Oppny4FFpKot0toiTdNJcB9JIFT6kAahtc/PZRcfnGZ9wKuOgeRwcr24QrE+qY7ov0wEZZa72AQnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2607
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/23/21 5:07 PM, Alexander Kanavin wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> On Tue, 23 Mar 2021 at 21:50, Yi Fan Yu <yifan.yu@windriver.com<mailto:yifan.yu@windriver.com>> wrote:
> New test introduced in valgrind 3.17.0.
> Test fails on both qemuarm64 and qemux64.
> 
> Fails how? Did you try to build valgrind on the host and run the test there? I am somewhat concerned that we should not be simply disabling failing tests too quickly like this; the very point of ptest is to catch and address regressions, including newly added tests that don't work.
> 

it passes on the host (relatively recent archlinux build x86-64)

I just checked on qemu and it miraculously passes.
(it seems to be load dependent)

My recommendation now would be just take the first patch and throw it on 
the autobuilder to see if this particular failure can be reproduced
