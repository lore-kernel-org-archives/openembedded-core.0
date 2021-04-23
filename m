Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.48])
 by mx.groups.io with SMTP id smtpd.web08.5893.1619157743691059040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 23:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Qtsk7puj;
 spf=pass (domain: windriver.com, ip: 40.107.93.48, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SB9Dd9rBzyaA5/rcjsxE2tbk1Q2FClgUqh1xUVhyAOfgJHkNg61tUoWeUj9tc2xe2NGMQsxqgJyAL2rVYEGlZdEJQ0MP5WPlOD6/O4C/G4jMIx5TBd4JeQRE6Vre1X2c2TBzckY3LzgLvuKjXVHG+N4Ke20i8di6maYBAbNheVY8nzzYpNdT7D7iFaDlog7aYZ7kxKqbXE8dHs2+rDnUZv7YmRP1yZg6AfLg5rKaijGicru1BXMbAUCXI8q7JLLADtTLY8ylsEowwRnZFAb29rGhWahuD7zMfn6ESxct4rxwyD52uzoQuuRlDkwNPm9sHo1Q9rBXwKUmwE225j/m+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+haMF+C2P9sJflS/7Gv0fMj6C/XmgX2w2j5SMvNKTTM=;
 b=Hgn3vhJLjpnVDlP1teOnp462EvRmG5ZfE6FYcgndd6ZyGZyBcpFhfQzSPeYioIQAQ4yVUgLvbxE3cABysrXWLmW01itkf2iJeHuPV0nRzRM9B5ajep7Pt7w48JR9bUPVuqi+UR+Ou57QOhgqYVOt64O/xee+A4uAZsow/kNROe8XSoy1dDVkXaM89/X5E89cpEl29uG9bkZDtHr8MTyRacCJhhXBGHqo+MazLgB+SOHopTAe6ZHOSBFO85fMzsr+8Z1rBITXQyaED5sr++oGrmll/sal9s+2amNuq1Bbi/MCcapWmRRS0LD1jEscv2r4LWMA9kfmt9X/RSiC/pACeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+haMF+C2P9sJflS/7Gv0fMj6C/XmgX2w2j5SMvNKTTM=;
 b=Qtsk7pujMObArghzvRo5o6uswXG0eR9dQ8xvPW5HUbJ0ArQAAs/7KJxRMgFd9vM74dR4z9y1fqMBR5G3Kv/ISKKlPjUejQRYIIFsoM5iz804jDALIwhNZoisRSxAZnpUDeoBI8qOlrmeMm1upcZfCpTBTcnrYrgRe/Nr6E6FnN4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB5002.namprd11.prod.outlook.com (2603:10b6:806:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 23 Apr
 2021 06:02:21 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::145d:e124:e9e8:e89b]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::145d:e124:e9e8:e89b%3]) with mapi id 15.20.4065.024; Fri, 23 Apr 2021
 06:02:21 +0000
Subject: Re: [OE-core] [PATCH][hardknott] gdk-pixbuf: fix CVE-2021-20240
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20210422080959.3147-1-changqing.li@windriver.com>
 <04ce3eb269095b9a704ad969b9b5e242fa3df4c8.camel@intel.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <a5c51b81-9a7c-f661-7d4f-8be9db04dc44@windriver.com>
Date: Fri, 23 Apr 2021 14:02:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <04ce3eb269095b9a704ad969b9b5e242fa3df4c8.camel@intel.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by BYAPR06CA0014.namprd06.prod.outlook.com (2603:10b6:a03:d4::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend Transport; Fri, 23 Apr 2021 06:02:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b960ecf-a211-4817-1d4e-08d9061d5b6c
X-MS-TrafficTypeDiagnostic: SA2PR11MB5002:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5002373EF08CEFFC2084813582459@SA2PR11MB5002.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IZX62aYyvvQ/YwypkebQblzNB3IMiVAbKPh5K5aWUcS0GSRHCxJZzkF1sh5NlI1zHHwfp+98HwwiHCJ77hVEP64ehGV7/JVkcPVw1I32U9LVDcQMgrOwcnegKvc9KYdtS+I+frjxle55yLIJZONMjNeqscifU17U2KSGrMDYy99Gxww94KnvLZPWs0iVVmfUETSNBcwe5F8ND0U44aSQr7cLXbIkf29jp4kkMUvCnafzYKAZJmhc0tk6S3+RiCvLeRNXLWTLlBbTfxNRUr2tm6GtNrpsZ6KAnsAadz4CXwLnIdC64+y+DHDELjdPHuboOor792cMyw26cujSKGoyugCNEu9+f/9B9oShQ5LcT1OVeJtRyW2zOSj0MaU76ZE7ZIW2vDN4QlQ/aC3o0YxK/GMk9ekhDhCzT7SikMkDfLV2OHNql6iDQldeUsbbs6JQEQKIsarlYnRzT7Ifq87vwud80P/TyXCVqWeKsCG55oEg+Ce+sHsAAUQ8wjrM/KSp9HYau6jtnqBoqGYQ245cr7Om2L1wY/NNqvjYuRYtoqdZLKwBu0OXYYOr1ddtCB3A3hx0iFBbLnJ0wrG/D1b+aFEKnmSoyitTcIPcMBVVMOTLG/s9aSkU/HnO5waE9uXj0bx3R3ny3k4BDJbyJTtzA7BvzQg6kcqRFEqw4YTRsoMllq6UJ4csJ6qKmelVxgI1J6Z5Gq046Q9bJHj3qh5MfOZJpi6PxNKnkJnhcbF79UB3hFSYygjcx3eyP/1U7CIicPzDBfhv16989M97hEilzae9GGPeHfGqwwKGZ5+Q9lbeyFC8+I1uqXA6xsdf17aB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39850400004)(5660300002)(6706004)(2906002)(966005)(478600001)(52116002)(38350700002)(36756003)(53546011)(83380400001)(38100700002)(316002)(8936002)(31686004)(66946007)(16526019)(66556008)(31696002)(26005)(16576012)(110136005)(66476007)(6486002)(44832011)(956004)(2616005)(186003)(86362001)(8676002)(6666004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?r8WnaD60T/j26p0wlar20ej4iigQNM5gFcWjStROa9Yd1Ot9ZJM9uK73O/d2?=
 =?us-ascii?Q?ATR5d961PRwcE1zMoydGHoSo6BkBkiYB07Z8Il5GqGPOBnY04K+oDeiwWx7a?=
 =?us-ascii?Q?LHMkNlLVMpHjvxSkxMjAj6QjkOxS29uv2Nb8V40g3/TqMcAfR8K4YVb7j8tX?=
 =?us-ascii?Q?bwhkVyvLWFGf/shRu3uXA2eSI5pmyJUXCMKV7ReUrevQ8qJKaT3K2M9ljbt0?=
 =?us-ascii?Q?+woAAojejBE+2KaYwvjiCKkqT/7zUzCNEFONztxBt2Db1LTosJg6ejV+4ow/?=
 =?us-ascii?Q?MzKPIr5+bSKbwKxkvYAxgSrWQGTS1mlmQA4q+d+5Un5tZ3jrZ+Ij36duRB0g?=
 =?us-ascii?Q?mkxHaSN3ZnO4seQm8jEodlWOJe1blf6K957YL52MjrrL9jK2t5NcgnShWfH6?=
 =?us-ascii?Q?gODwmSXmoaT/Y3qtg8nPKfMoW+zD6vkrY/OH2A8zT/SrtWBXjUku6aQIT5j6?=
 =?us-ascii?Q?oe7P1uCjg7XzdXSrWa4IeTM/zfyrCSwXkdxJ9Ez2yFBy8H4H2VsqIrNf5WfF?=
 =?us-ascii?Q?vd29JYsQeUG5Cabe3069rRRsJFEbxKDaqc6CjgH2c0V+IoxrKQk9LLLsWWPH?=
 =?us-ascii?Q?BRXJMXgHdsi6ukg6lR2/zLQ57kILEd05a7ZPCZDSOwci7aUDWUexssPxgXjK?=
 =?us-ascii?Q?cY7a1xFMQR0WCiYXxmaP3/g1xqIGI7JusuBDQ11nsOd7xVcR38NZDIM8zeza?=
 =?us-ascii?Q?DVn6oV9o8ywc+wazCLZ8j6VFx/V7FQ3Bw5Ki3f+cjeO4I5cOuHstthS35Buf?=
 =?us-ascii?Q?KnRwxzbR7j1apkIbspP3jRuW87214p15rT+XMcjSd17P08dDy7EeGGZinbO3?=
 =?us-ascii?Q?jrNYbxlauUKuCqs/L9RPskrRKtW44N2dcDSDXE67PaRq25c+JwQqp+IC6kmv?=
 =?us-ascii?Q?VzEtSyY2QbGmCOm7aJ1XoZLeepD7oQY3MhrGCDxtKI57BCDnlYudkwwwp5Kw?=
 =?us-ascii?Q?SiFQqkFdt7Czbqm4GptZGuVS7DTDvTwwjAF3O6HDW5B2HouJdJkJYY8YrBNN?=
 =?us-ascii?Q?n1ejXdHUgDtmzlpcbO6CwYmnJ5lI+XFRD0PbSu2rtLw53mg926gmZcoJR4Mm?=
 =?us-ascii?Q?ThZcJMCduO7NxiUvlvTKae+kpoUYFXQVyYZhqfbkZfqvEopb+Bkj8cZoTwTL?=
 =?us-ascii?Q?VepWsZlcyZh0ijpzN+OLF6bLSd6LPcNQMDnNOO2o6vcq7mIoZhYyA1kZZkuD?=
 =?us-ascii?Q?FHfljNoHj6shj+OmgfG+u6nI8Nwnpf3dnhyqS6CxrHEkXBbH8D9GU8FtorvD?=
 =?us-ascii?Q?z7m4AgP5SrrtOyAjxpMM3m5zHA/RrCi4nX0NvPhgdXR43P+Zika8uurWZujH?=
 =?us-ascii?Q?7ASBoB1dzyyGANfOXUHnBvGY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b960ecf-a211-4817-1d4e-08d9061d5b6c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 06:02:20.9145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99Em6doU9IUpJ75g6hz2bHel4XP9VURjHVSMMxQTwIJdaKFCOGoaZZc4cJGP/Nl3K+bVJHl38cE0ea1cBQ5ToKtnN5vYnsj6pd9o6O3rxQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5002
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 4/23/21 1:54 PM, Mittal, Anuj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> This should be proposed for master too. We're still at 2.40.0 there.
>
> Thanks,
>
> Anuj
I plan to=C2=A0 upgrade gdk-pixbuf on master to 2.42.6, which already fix=
=20
this CVE.
>
> On Thu, 2021-04-22 at 16:09 +0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../gdk-pixbuf/CVE-2021-20240.patch           | 40
>> +++++++++++++++++++
>>   .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |=C2=A0 1 +
>>   2 files changed, 41 insertions(+)
>>   create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-
>> 2021-20240.patch
>>
>> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-
>> 20240.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-
>> 20240.patch
>> new file mode 100644
>> index 0000000000..fe594b24bb
>> --- /dev/null
>> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch
>> @@ -0,0 +1,40 @@
>> +From 086e8adf4cc352cd11572f96066b001b545f354e Mon Sep 17 00:00:00
>> 2001
>> +From: Emmanuele Bassi <ebassi@gnome.org>
>> +Date: Wed, 1 Apr 2020 18:11:55 +0100
>> +Subject: [PATCH] Check the memset length argument
>> +
>> +Avoid overflows by using the checked multiplication macro for gsize.
>> +
>> +Fixes: #132
>> +
>> +Upstream-Status: Backported
>> [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/086e8adf4cc352cd115=
72f96066b001b545f354e
>> ]
>> +CVE: CVE-2021-20240
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + gdk-pixbuf/io-gif-animation.c | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/gdk-pixbuf/io-gif-animation.c b/gdk-pixbuf/io-gif-
>> animation.c
>> +index c9db3c66e..49674fd2e 100644
>> +--- a/gdk-pixbuf/io-gif-animation.c
>> ++++ b/gdk-pixbuf/io-gif-animation.c
>> +@@ -412,11 +412,15 @@ gdk_pixbuf_gif_anim_iter_get_pixbuf
>> (GdkPixbufAnimationIter *anim_iter)
>> +
>> +         /* If no rendered frame, render the first frame */
>> +         if (anim->last_frame =3D=3D NULL) {
>> ++                gsize len =3D 0;
>> +                 if (anim->last_frame_data =3D=3D NULL)
>> +                         anim->last_frame_data =3D gdk_pixbuf_new
>> (GDK_COLORSPACE_RGB, TRUE, 8, anim->width, anim->height);
>> +                 if (anim->last_frame_data =3D=3D NULL)
>> +                         return NULL;
>> +-                memset (gdk_pixbuf_get_pixels (anim-
>>> last_frame_data), 0, gdk_pixbuf_get_rowstride (anim-
>>> last_frame_data) * anim->height);
>> ++                if (g_size_checked_mul (&len,
>> gdk_pixbuf_get_rowstride (anim->last_frame_data), anim->height))
>> ++                        memset (gdk_pixbuf_get_pixels (anim-
>>> last_frame_data), 0, len);
>> ++                else
>> ++                        return NULL;
>> +                 composite_frame (anim, g_list_nth_data (anim-
>>> frames, 0));
>> +         }
>> +
>> +--
>> +GitLab
>> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
>> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
>> index 226e1c7b89..f01da32e71 100644
>> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
>> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
>> @@ -26,6 +26,7 @@ SRC_URI =3D
>> "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
>>
>> file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
>>              file://missing-test-data.patch \
>>              file://CVE-2020-29385.patch \
>> +           file://CVE-2021-20240.patch \
>>              "
>>
>>   SRC_URI_append_class-target =3D " \
>>
>>=20
>>
