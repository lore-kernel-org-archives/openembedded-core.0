Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.70])
 by mx.groups.io with SMTP id smtpd.web08.10226.1615821433231090664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 08:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=aH5g4GY0;
 spf=pass (domain: topicproducts.com, ip: 40.107.7.70, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UbznMpCuCOOuX0VuZTzO/uCC57FWDksioyvSK0dXw4=;
 b=aH5g4GY0bA7U4P5jLgO4kinbSOy1iauEnKjGApUyMD5udYkS+Xv/rEqtzYyuGpRypiWePYmIysKgWalUf3sVDfqUqgaHgFD1XnKxbguDIRopoGK6PvAygl3SesvYp7jiHeOBdUIKroUNRvmp06mUXLiiibW3At6fWUTp/cNOqhA=
Received: from AM5PR0502CA0012.eurprd05.prod.outlook.com
 (2603:10a6:203:91::22) by DB6PR0401MB2487.eurprd04.prod.outlook.com
 (2603:10a6:4:36::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 15:17:08 +0000
Received: from HE1EUR01FT017.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::4c) by AM5PR0502CA0012.outlook.office365.com
 (2603:10a6:203:91::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 15:17:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 HE1EUR01FT017.mail.protection.outlook.com (10.152.0.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.30 via Frontend Transport; Mon, 15 Mar 2021 15:17:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.58) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 15 Mar 2021 15:17:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnMEYB2vGd8nCenUUUEF8iEmf7SFHW32mshq40E9wv/6/csF5HCcyhB0g2kcjga0HtDfxN3ifQhK8DtY0ozg3IeiqE2p4Pohmkw3ruHy4a6qROJ1AelWN51RE7dLowx0zHFASN4sIvW8iePGbhSco7dR/JFmDtaFcndnqFu3qgVB3ku0ehBrBpGdGfIOfbcRHS2wxBJ643rJsIqNJMqUqKyIbJiRbwl7wPyq30aAVdcgqk2zHQdWBSd8GH+If6gdv0SUFi8G31w0E4WqyVBor+9tC3gEKsVSbwZ/5xYFCNi584fwhghjiv339U1RDbD5G65Ju92ZF+J5QHZuBnNJVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdptEAndqw2m+mM5XDvypSyghyG+hzhenRgrKZAwJZs=;
 b=PwYHhr/xiRR3crrqmkEwTdfP6kgWI3VTXBdZsN1PGaG/Me0Z3frDI1QMffNs3gQURKZNbk9huQeWtOKTLic9STFRfn94xeSv1QNfHw2P8PT2o1rr7UfiRyuJgKBAyedvN8ngW8mPZtiASIU1wlfHkl8j/l7vVYO3PpZI1K5lt8Z7L/a+s4G7hiW1fNhBJ8uTlpOrvjHIbnHpu+AzLgguqcFKHar4HrkY1wwCigdxUIRYRkCJ2jQ2ot9UIgUYCOuA1ZByBdvB/gtuArBYM0TfqjdL1RrfRa1QKNJOcCIQWbbepJQ7dR2adk3Ctqgwpz7z4P8IywjHKClP1zkS34XVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB7PR04MB4716.eurprd04.prod.outlook.com (2603:10a6:10:18::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 15:17:04 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 15:17:03 +0000
Subject: Re: [OE-core] Build the "boot" partition image (just like the rootfs)
To: Stefano Babic <sbabic@denx.de>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.8fe74b17-765d-490b-bd80-d5971d41488f@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1e9416a1-3cc9-4dc0-8334-9bfb06079d86@emailsignatures365.codetwo.com>
 <4e1a212c-32d2-b474-3bc4-06b271e68f82@topic.nl>
 <19f19fd4-a80e-45ae-3fcc-36016baf8754@denx.de>
 <073fe5f4-0a45-aaa5-39f8-2f0c0b3c30d0@topic.nl>
 <f988e8a8-eba4-63d0-334f-caabb0e86a83@denx.de>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <e842a695-d747-c28d-0541-ff5f16e6ca8e@topic.nl>
Date: Mon, 15 Mar 2021 16:17:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f988e8a8-eba4-63d0-334f-caabb0e86a83@denx.de>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR04CA0107.eurprd04.prod.outlook.com
 (2603:10a6:208:be::48) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR04CA0107.eurprd04.prod.outlook.com (2603:10a6:208:be::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 15:17:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aca6d1c-cbda-4e58-5b27-08d8e7c565f0
X-MS-TrafficTypeDiagnostic: DB7PR04MB4716:|DB6PR0401MB2487:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0401MB2487938F1FB6EE8FE0F70A17966C9@DB6PR0401MB2487.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 i6ELMJN1c3Lubh4rzJBIeMFFJC4AC3XlocaBi1kQMOHN2nqr8sbnZBouJGo9DH00UlyHLTqeWJndfdzWmqPgvqZ06lzUBSCptYThN7hyRuLKPa6b7/gsTHBXBpqU6RmLI8tnj4Vpzp98Na/NxIFwiO5fweKBQ9sah1NcBgu4RQfB65q837aIxcEe3hovLHw/mDJNCW9Q9TVr2o+3PsWR37cV5umZKIK4RzVrfXOXbAN3IpnAa4RetlkhxFiD42YutjDJ8T9lK4XpW+QsL4nuGBANK+gARxJ9m2uDLUpI6DVz0aI5Nsy4VsppJYil8S6Rgz9XO81QBVl/Vi0X2mHbS5ISBGxMTUdFGoiE6Byl5WzUuEljfnSvXO503xQbGQsVuse6briVfQRKy7er/0zGa21rzNFjV33TcmCXE8WXitYeNUPU3BlSAxqBr9wGSEfox2oUXPXx/qqJRWCLZpdSYo9IwA7eteFZpVX3DjZ7dwEeU5sBcIdBnTU4UZF8z4dc/uvREzDXnPaBBP/OVK84j1snt3b3zXrAS2k/s+mx+/W7fdx1PxNzoXDmW308vlI36dMXziI6pHQtSMNHbr8fGLW6tYjAPjtYSoIcU5bP2iTllb4LMLC1hjHd06kcP/iJbZDwKpsGZ38GqkN6HT0qMQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(39830400003)(346002)(366004)(83380400001)(31696002)(66476007)(83170400001)(2906002)(5660300002)(31686004)(478600001)(66946007)(186003)(26005)(956004)(8936002)(44832011)(36756003)(6486002)(16526019)(2616005)(52116002)(16576012)(316002)(110136005)(8676002)(42882007)(36916002)(53546011)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?I7ltaAe1RqsnZQRnOmLOtMmTBd1totB7CGXmbebJD0nch6klAoAD9fmJHtJ8?=
 =?us-ascii?Q?qefizWEu+CVwygOpjjJeHBwnTf7CNoHBHvgqP1YhiCuGBwfAi5Qv2q726sUv?=
 =?us-ascii?Q?uxNlnIXHEgi7ABBtT6pCeVu2KIlDjmCWYVqTezaCKl92oDkoAjoojgoBpaYP?=
 =?us-ascii?Q?AjnZxF7jogKnikLFxbrZ7JCMJ2Zu9BHfONlE4CsQGU0Fiqq0sqYftHPbXEcu?=
 =?us-ascii?Q?Nh56zujeT96hBIiIWh9iGhweH+9ikE0txtjZoRxq45orfFfDVpjYZ9dXbLWO?=
 =?us-ascii?Q?goYSHlKImu2mk9smrwlq80o1tdLTrVVDvTCd1y3KWFbdGlY5jKlUyFitpOmX?=
 =?us-ascii?Q?7ZKJuNj+PBbWgGI2EzsudZ2XHDPNnH8wO8S8aNu8CxAUQAipVoGNWtJ7ltEP?=
 =?us-ascii?Q?roQncqKpZRKqLcXfwTuu8AjBpEq3mih+lrQH/abg1FAlfkDUs2IpNW7qamsR?=
 =?us-ascii?Q?+Ne5OjRdv+mEn3BzZVWOpj6oSA+8oAU7sEGcE13ahT8JH657m/00V2P8yLgI?=
 =?us-ascii?Q?+q2ajyL9Fvhm1YgLNEfiV2U6Eh40RMSDwG92Teu4pAL7+J+80Qqv2+f8c5rc?=
 =?us-ascii?Q?DVR1s5Va7pmCeo773JqmIoBEcs/EuRNF08se42dGP44FOH2PE+EYM1IelUkM?=
 =?us-ascii?Q?RoJvX4Xt0jeUDX4wI/OLzCgDrFHlX3pXFAw09mgX9CaLtTZHPpoZyvyxtO15?=
 =?us-ascii?Q?sRQHtpLZ+Znq4K9OlDeDlNmtfw9sOD5/r25YNgELdfZNCVhyrGi7QVneFcVP?=
 =?us-ascii?Q?Am4D6WBcpcGL/vAmUt5+wCU/Tbw1ZbYEU5YgdMubpel6W8LGbyS+3b3+FP17?=
 =?us-ascii?Q?OgBXhiQ/Jn/mg7zg1ifQv2RQiFNs5QMaQ0eWhhldrLs3QAC17xhOT9iz6cSr?=
 =?us-ascii?Q?puSfTSjpDLxsAjUJvQGiXakhIpqk4OJItb+Ssh5t3lryIgPplEB7yPoq17lU?=
 =?us-ascii?Q?V+smwWMBhPsj17D95wXmumm7Q/GpCKMt+Dp79WfGPMZOUqqBOIkanZlEdAL6?=
 =?us-ascii?Q?3DDRalegH5eIG3C1lJoAW7vZvTukdXPixOb3MmBlIQA4qBzbkUVVHeiF4f70?=
 =?us-ascii?Q?fVBBUN9VkooEpAjdr1FL+nEroRWBtDR0MpiXbBA53jIaRg0atAfTtXCc6470?=
 =?us-ascii?Q?I0XbcV7miDTM50i4EKmltAQnUkvmQLdC3iioTqpjRXbI8AOz1oJGRyLQIEYm?=
 =?us-ascii?Q?xi/klcVFDrDwNe7pya9etq8dr3biqPM73lT+F6w3X9id5SzLpCdl6MlVO/Al?=
 =?us-ascii?Q?oyhMCeOd8MrGFdIF/muMlrR/FqJ1M0EpvXH2BN6DJckDYieQjCg/riP8hSyk?=
 =?us-ascii?Q?r7CfyBkKsPT52pkdU+FpaUtN?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4716
X-CodeTwo-MessageID: bc58b4a1-4f49-4aa9-ab3a-0d2ac61d57b0.20210315151706@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT017.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f89b04e1-2719-4e2a-b239-08d8e7c56381
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KuE6BkXELTpRAT/+++NVZDjPStH32P+4Jt76/9tWrDq4zQiuSWrCumQAU/Kwc53sVTi3En+muaSNQlMi9ZeC5yhIw+7qGGRXxjUBzkLobkgfERdfndF59sVMFavVxJ06aDxJy9BKRr4SIECYi5EgW3wFdmjoImAKIuYNreZlb/oi9DSLm1uV/6H+/HELRBwTnwl9Jmu27w0cS4wcC0Y63V7FQChFn2rbKYA9sn8iS+t8oIZ/t8zov4p3yYobeSTTkS0Q2ceemRlRhZlW0BhtOJRJuvHijoKgPJn0VtAZEYizIg5TBWZRgWUVMfHx7Wb/vZsOO4lIF2dvMCZv4ORtNValjYBcduAW6ukPL7PGYMDvVe9cIImoerOHAUNyd6C7Sg0BFM3ez3Ss6mtL8LFPpubvTzCUuJrO0gHm31sEZgF86FvOwkcTnYxqWeqGS7kKl8nLlkIsXQJNqv2uB4UMzqs3qSdNR/oZ7p5TPjWIM96GmpPc6/Hm3b1KtDLNdg22TbChZXLJ3NSFyAXZQpozLJACypK9lgCqUcFrW5ZzuIIxbI1dBgzCeE3sNG8fKuZuGmBFBySO2KsAmjvXaUtqmdVGFF1R9dmPrEW4YCO6CEzjnVWiWSBhOG29hV5FJPoLYp4mnDZupNKcNSJuNDIC7HRcih08j/xohbJuTfOdVat2bSrrbR/udn9ntQhhvUzw2GpKY20ZSEW7Qg9/mB1uQH4EXFHDXcISImwrC8mb+edwZTD7ZkhaLZChnRe6V2Ps1LosmW/m59LVUJkVnx91Aw==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(396003)(39830400003)(136003)(376002)(346002)(46966006)(36840700001)(82310400003)(478600001)(956004)(42882007)(356005)(36916002)(16576012)(8676002)(110136005)(8936002)(316002)(44832011)(26005)(7596003)(83380400001)(6486002)(5660300002)(70206006)(2616005)(53546011)(70586007)(47076005)(16526019)(36756003)(31696002)(2906002)(7636003)(186003)(36860700001)(336012)(83170400001)(15974865002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 15:17:07.6979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aca6d1c-cbda-4e58-5b27-08d8e7c565f0
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT017.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2487
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi Stefano,


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topicproducts.com=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 15-03-2021 15:58, Stefano Babic wrote:
> Hi Mike,
>
> On 15.03.21 15:46, Mike Looijmans wrote:
>>
>> On 15-03-2021 14:47, Stefano Babic wrote:
>>> Hi Mike,
>>>
>>> On 15.03.21 14:13, Mike Looijmans wrote:
>>>> For software updates, I want to have what would have gone into the=20
>>>> boot partition of the WIC image as a separate file.
>>>>
>>>> If I want to have the contents of the rootfs as an ext4 image, I=20
>>>> can just specify IMAGE_TYPES=3D"ext4" in my image recipe.
>>>> =C2=A0> This image I can feed to SWUdate and write to the rootfs stora=
ge.
>>>>
>>>> But I also want to be able to update the boot partition (for=20
>>>> example, the raspberrypi has the annoying property that devicetree=20
>>>> and kernel reside here).
>>>
>>> This is very annoying, but you could also get rid of it. You can=20
>>> install kernel and device tree in your rootfs (then they are located=20
>>> in /boot as usual), and you switch to U-Boot ( RPI_USE_U_BOOT =3D=20
>>> "1"). The proprietary bootloader will start U-Boot instead of=20
>>> kernel, and in u-boot you can load kernel and device tree from your=20
>>> rootfs.
>>
>> That's what I did on other boards, but for the RPi that's not enough.=20
>> There's also firmware there, which interacts with the kernel, and the=20
>> firmware is altering the devicetree too. It's pretty likely that the=20
>> firmware needs an update too when the kernel gets a big update.
>>
>>
>>>
>>>>
>>>> If I create a WIC image, the boot partition is in there with the=20
>>>> proper files (from IMAGE_BOOT_FILES) so I would really like to=20
>>>> re-use that code. I could create the wic image and then cut out the=20
>>>> part I want, but that doesn't seem particularly nice.
>>>
>>> You can add vfat support for IMAGE_FSTYPES, and then you can build=20
>>> an image (you can just take the files you have in IMAGE_BOOT_FILES).
>>
>> But that's *exactly* my problem: How do I get these IMAGE_BOOT_FILES=20
>> into an image of sorts? Just setting IMAGE_FSTYPE=3D"vfat" will put the=
=20
>> rootfs contents in there, not the bootfiles I'm after.
>
> rpi-bootfiles inherit nopackage, so you should write a recipe that=20
> instead of simply deploying the files as this recipe does, install=20
> them. You should then install it into /, as this is where they are put=20
> on the VFAT partition. If they are in the package, you can write an=20
> image recipe to install it via IMAGE_INSTALL, and via post process=20
> command you drop what is not necessary (/etc,...).
>
> Anyway, as far as I know, an IMAGE_FSTYPES +=3D "vfat" is not supported,=
=20
> you have also to add support for it.

rpi-bootfiles provides only part of the file set. The issue is that=20
IMAGE_BOOT_FILES, which lists much more than what rpi-bootfiles=20
provides, can be modified in the image recipe itself. It contains the=20
kernel, devicetrees and configuration files as well.

>
>>
>>>
>>>>
>>>> What I want to do at update time is to write the new boot partition=20
>>>> to another location on disk, and then adjust the partition table to=20
>>>> make the first partition entry point to the new copy. That way, in=20
>>>> case of unexpected failure (power loss for example), the device=20
>>>> remains bootable.
>>>
>>> This does not seem to be atomic. It remains the risk that partition=20
>>> table gets corrupted and then even the first bootloader cannot run.=20
>>> If you want to have a power-cut safe way to update is not enough.
>>
>> It's not perfect but it's close enough. The partition table resides=20
>> in a single sector, so chances of power-out at exactly this moment=20
>> are small enough that I'm willing to take my chances here.
>>
>> My experience is that there's more chance of the SD card completely=20
>> dying because of power-out during some internal mumbojumbo than=20
>> corrupting that partition table.
>
> True, that is. So simply the hardware does not allow a safe update,=20
> point. Fully agree. Or use a very expensive industrial grade SD, but=20
> any board with eMMC is then cheaper.

I actually tried a few industrial grade SDs (usually SLC type). I had=20
issues with those on other boards and the Pi is no exception. If I put=20
one of those expensive SLC cards into the SD slot of the RPi4, there's=20
about 30% chance that the board won't boot at all.

>
>> Against that SD failure there's nothing I can do...
>
> Absolutely true.

Amen.

I'm going to let this thing rest for a while, maybe I'll come up with=20
something completely different or maybe someone in this group has some=20
brilliant idea...


--=20
Mike Looijmans

