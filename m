Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.56])
 by mx.groups.io with SMTP id smtpd.web08.9684.1615819613909795992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 07:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=CmvlCkS4;
 spf=pass (domain: topicproducts.com, ip: 40.107.21.56, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeqxhA/fnLfUKIA1bXB44nQIL/wc+lnBEgMXXDMJnG8=;
 b=CmvlCkS46U/ZreOqQguDKxgo3XmP7czE0gZPXAjuMDLfQrDCkcWtIGi58X3ouv7WIzPFmMdVxoKwJ2jsS1jKEPX9b98bTrEZYP9c1zMqX1qogMqJXRk5EpuFwhS1ODnIefxiqy+wqTNF3zMfxVHICmjy1+7uP8vHMUoMKBuFQ8k=
Received: from DU2PR04CA0081.eurprd04.prod.outlook.com (2603:10a6:10:232::26)
 by AM5PR0402MB2804.eurprd04.prod.outlook.com (2603:10a6:203:99::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 14:46:49 +0000
Received: from DB5EUR01FT015.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::70) by DU2PR04CA0081.outlook.office365.com
 (2603:10a6:10:232::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 14:46:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT015.mail.protection.outlook.com (10.152.5.0) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.30 via Frontend Transport; Mon, 15 Mar 2021 14:46:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.50) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 15 Mar 2021 14:46:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1dzLKhbUodrzvK7QjMAt3SCfWlXBYC4eOf010DK6VCxQveRh9pux09XF38q6zRBqenC5CLlZA5tOJIlvLIHBM+iACMjVm/E3pYDE++/WKptWXBn3XEENQ+qc2E0cgLQIkk/qh+QS1+CbnW0frrJuQYF5moHMyZCg2BlZUc85bXm67Wux1ij8Vj7KyREa/1KM3OUOgg9ZKwU7BXy+fKV5h5VQoqHdtw++PPw5TWDg/hMVfJDvcIcmephjGL551fgKqN92XhypOMIWKfqJmHFZxuchaC4wCpfp44ENpc3mDP7Iwi2Cex7O4o8dXga6ObMRdYu0YNEoNgfWyXnq4keYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xkfCp5JORLvWo3Gb4REfh6l/kcNvqp73rwLH+/Oc88=;
 b=Q+B8bXOICSP5yNbWxb/TpckvXE97OzigRUbf2pN9Wq+WgdbhKcJVxrmQhvS69S1uKwIbJa7svTvaEyMcHXOh9t0AvRXVLs6+QFRXCRk9pP7mW5no4/6myZeIyAQGVf8Y65LT5e4Dx/5wy6gvlsHKq+oceTMg4wXbxDkq7wjI2STK60N0fjSeQIvpN8eOv5GiW02DObCrXYm7sewfJ24LgBhs1/UJ8crCcWKLIBgUle25HCR21/i+o5RL5K2bKS3rWL0aV9aUEMhtoCD1pwoAU7vrRiq6GyZIqAhJ0wKcf5Hg6kbQihiyfqwoR93z0lpvsNshPHTh8dV9WEOFhYjVag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB6PR0401MB2472.eurprd04.prod.outlook.com (2603:10a6:4:36::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 14:46:45 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 14:46:45 +0000
Subject: Re: [OE-core] Build the "boot" partition image (just like the rootfs)
To: Stefano Babic <sbabic@denx.de>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.8fe74b17-765d-490b-bd80-d5971d41488f@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1e9416a1-3cc9-4dc0-8334-9bfb06079d86@emailsignatures365.codetwo.com>
 <4e1a212c-32d2-b474-3bc4-06b271e68f82@topic.nl>
 <19f19fd4-a80e-45ae-3fcc-36016baf8754@denx.de>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <073fe5f4-0a45-aaa5-39f8-2f0c0b3c30d0@topic.nl>
Date: Mon, 15 Mar 2021 15:46:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <19f19fd4-a80e-45ae-3fcc-36016baf8754@denx.de>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::19) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0P190CA0009.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 14:46:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c00abd66-e3c3-4d7f-ff89-08d8e7c129f5
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2472:|AM5PR0402MB2804:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0402MB2804F8CF553EBFB4AC6AF50E966C9@AM5PR0402MB2804.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aC7MT4/z7bMUjujpcDWYtxhnISfPFQ7F+twg2eEcFPrrxLLZZR/ANpMhXj29+cfZ3zekeyFBIipYN2DAH7UKNih57ECTy9aQaliqWbD6HB6ptGbWgdL7CngWm+eWRnh4um6I02uDeg38/e0waa5f4gDS91p46V8dbq9T0f/Fi8jvLyDKJOWrJINLwO3MNtKyHZ181LtmUPGFcuYAjLBvTr+VOqFNFK+BmB1JAPD+W6aaD9wzq5zydW620kdpSkBdyXhCYOKYJpgl/4utYSrBTgcR1Oj1Lxqb3YH63OTiHvHrvYz8vu/yAFJaFBJCLHlayqG4DepPXZq6DtQ/Ja0MzuFi7M+QP1vKwe80DLnzdPdqI+HcNPB/WOoPx2T1DZwBcqBOpaXluIXC2XsfLBzmvZYtKFjTpfbRYGeSj3c4jRT8brdKt1k2G7Nns0jwHi9wh4m6ATVSScWMT7AQHKwpuPSYYqKD4j3ugZTpBTfYXL1slj2BYnyomHbn30OffpX4R/6rKCOaUZnQ0LRqdo8qNvXIYfFBukCaLS5MQTLfDyY8rNFnUaFuZE5wl++U5hWid+Dsn0EaQHDw8ZrWHnttjAwqpuxao/dxP91sqVwqmSUaerUvrmX6/sb7RSjfjO90mTtCw1uoBYLEpdXY/zK7ng==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39830400003)(346002)(366004)(36916002)(52116002)(66476007)(110136005)(53546011)(8676002)(66556008)(42882007)(16526019)(5660300002)(31696002)(31686004)(186003)(26005)(8936002)(2616005)(66946007)(36756003)(6486002)(508600001)(83380400001)(44832011)(83170400001)(16576012)(2906002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?l3XdLhzfYNywpj+GpktVEIk3BiJMZIYqliQRNbOewi609uUVXsRufDtf5j7y?=
 =?us-ascii?Q?Qc4OFysOUxmDrYxGI72/1lwWZcR/6BA694A3vRsX6Y52jbQ5EEiO4voUQf6k?=
 =?us-ascii?Q?3WE5LDpNVy3G2/RRxxsb17L6sCxjET6YewYUfqlFeP6xBCn6YA7wGnb4QdgQ?=
 =?us-ascii?Q?9gJuH4kPzbN78fNdlhKkqrO1ifaQ6uqzfrd40Be9drRHlvavezM2SyvRUdGM?=
 =?us-ascii?Q?n0rAtACbWcFbFDH5tAIuAplwXFFv/h+chyPBIJZZM3ZkRidhSJN9fpFlMcPC?=
 =?us-ascii?Q?g4RFWsUDTNb5Zm4LgBon7Gw7yfnMxAm5E6FSwu5b5uO+V5UQVRkNxkn4zfsK?=
 =?us-ascii?Q?cahKm/2xwojZt9tYKVeUY1QUtJhnG4ZHAd+78GefNehYuY6vXLAEs97fLWqB?=
 =?us-ascii?Q?OZJ4mew+xgpGPzGQEMQwXjnwCOEERb8I6W9mu7iUs5UAlBGdUqoDeNh68hzY?=
 =?us-ascii?Q?f6yFuOAARq3AOpFEy6kcfVO0S1Wcmoo01eN+4wkWO5+pLjNX30H7THL9VWNR?=
 =?us-ascii?Q?5VSj7SOfDIhCNUHjVw/0baZDu5ReVR9SD2oKnyVciyM5IoVifHwA8vAA7HXU?=
 =?us-ascii?Q?C2UHMaJM38y6dUyYdPoPzs0OjSsg5Pyr2VW9ckQ+dx2j92m1PqrK397rHfMQ?=
 =?us-ascii?Q?O2u9Ci2nZ8U9q6MkijQX9sBEHoKmFMBelow2osMYlVntR13ICX3XTpb0WuLc?=
 =?us-ascii?Q?2x5AYh+O23URAXr4jpn568bZE0Vf70h3yeD7tjXwpxo6E3IVO4cJjj4XlPCa?=
 =?us-ascii?Q?ck+uY5Jk4UAXiSBq7nvpiTbksuGn0bNEa0Vt13BTyG6SMkoQJ8Kl9W+TZFYC?=
 =?us-ascii?Q?soF8iOjVL8sgjNFJWwlXNPjAjix10hI/x4XUCu/HFJCsEQmoSLt507cltiOL?=
 =?us-ascii?Q?NvM5FBwDi/H16nPgZ72W2LbqXgi6wHCOiN5OvSEbbCdj8BTcZ9/O6RhtY5SS?=
 =?us-ascii?Q?N7UYF2nUfH5er65PC+LpJN9Djit8nmhHhbWGXTLWAbY3QEqGU0ILEiJHC3fL?=
 =?us-ascii?Q?Wuc+w+AEjp20Jq8gQQxmFNFxZznqITL7aPWZdmw/yPblDj8SWFXKB+f16vnV?=
 =?us-ascii?Q?O73HWFhJtCs/vnd6yb0irPTHzgNJk4vtrYyj1nLjXcbgm8DPZ1BD4cY/udsU?=
 =?us-ascii?Q?OmqCvjyTMPJkNdldFjy7KU3scalCdwVgmpejqFE+9OtppZXu/MxIem9ESttL?=
 =?us-ascii?Q?sksDJ/pTMfsmyHSAEBnG/IptpFMa9h+ifxGU3PUXLJfmiTls9p/wLq8nvIDE?=
 =?us-ascii?Q?ZOCHxItyIW07MHN64/ao/N2SqJqIJIgDfq65n9I0H4cKKZlj0Fzr8i4HRxTP?=
 =?us-ascii?Q?J4JGZhie5q4epV2QmUJIIcVa?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2472
X-CodeTwo-MessageID: d2d1407b-43b6-466b-b19e-09ed22d15b8b.20210315144647@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c532f267-9203-4e0c-9443-08d8e7c127cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k8MxDyVRx69FI/a4P7SrpHGrhO5tplMNDBSF/IDsHIv0llKcnPaFWzV6fQr6qy+yNTJRFU54y1q2QNfc5MG9NT8t6aO3wHZgBK1bsfHhAVVe6Y5XgZn/Pp8fLOg8c6Qzigf3oRaveP+nwolNUK2otunZftKIszRiVABicHRpNyWy0Rb6Zau3hY4DLgvdWSkdo9BqV3n66KUD8vkNCPZOYiRugcD+2BVZknpb2ty0ivEhwcyGDD8l18kv6bTpoIuWgAZD14RdTpwfO0OEZ1b5vpb2gtJE3BrC81+yQOA1uzmK+DpKyQTtr+6ngothNnk8xe4CWOijRdHPFGy8w/y7YtjzOrP0ryJfN2nUqCHqQeTkAklN5yDcgN4SxqabKre5i5lexs4QoftzFylJq5Hkok7L8htQyXWcFUIZiHWARR6HPLod6CDcPwBNUd4pL9dv/LwUPvzSQMy/+fmAb5YEhOcQfVrP4Qi6PJ82JjknpyOfKkWYTAYbcnZvxqlniv10Ksa8uvvDuYLEMM5LtXgh02K+tmGRf8e3x7ckwU9p8WE/ZatAMfZRcJSRmo0pvNN0J/IbUdEz22q/8vmv/uIskzjmMgE1rNmxtFV57V/kWvuLhMg4CqBqupPZ0n1CLWTFrs7AVfNoMUDz9qStFiccbDOJMxqbmrBfN/DW0jpZyYSE++uFoLw103mzhyQwoX6IN8eU/GH63gqRNYLawSWkoW1MYd2GQFQNjvtDXCTk9TdYU17smrxt6mr/9gkgUVSQYihjsY9+bkjm3eC5PxAzHg==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(396003)(346002)(39830400003)(376002)(36840700001)(46966006)(508600001)(956004)(110136005)(8936002)(8676002)(70586007)(16576012)(83170400001)(36756003)(26005)(356005)(16526019)(70206006)(36860700001)(15974865002)(47076005)(31686004)(186003)(53546011)(82310400003)(7596003)(31696002)(5660300002)(36916002)(2906002)(2616005)(6486002)(42882007)(336012)(44832011)(83380400001)(7636003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 14:46:49.0947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c00abd66-e3c3-4d7f-ff89-08d8e7c129f5
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2804
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


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
On 15-03-2021 14:47, Stefano Babic wrote:
> Hi Mike,
>
> On 15.03.21 14:13, Mike Looijmans wrote:
>> For software updates, I want to have what would have gone into the=20
>> boot partition of the WIC image as a separate file.
>>
>> If I want to have the contents of the rootfs as an ext4 image, I can=20
>> just specify IMAGE_TYPES=3D"ext4" in my image recipe.
>> =C2=A0> This image I can feed to SWUdate and write to the rootfs storage=
.
>>
>> But I also want to be able to update the boot partition (for example,=20
>> the raspberrypi has the annoying property that devicetree and kernel=20
>> reside here).
>
> This is very annoying, but you could also get rid of it. You can=20
> install kernel and device tree in your rootfs (then they are located=20
> in /boot as usual), and you switch to U-Boot ( RPI_USE_U_BOOT =3D "1").=20
> The proprietary bootloader will start U-Boot instead of kernel, and in=20
> u-boot you can load kernel and device tree from your rootfs.

That's what I did on other boards, but for the RPi that's not enough.=20
There's also firmware there, which interacts with the kernel, and the=20
firmware is altering the devicetree too. It's pretty likely that the=20
firmware needs an update too when the kernel gets a big update.


>
>>
>> If I create a WIC image, the boot partition is in there with the=20
>> proper files (from IMAGE_BOOT_FILES) so I would really like to re-use=20
>> that code. I could create the wic image and then cut out the part I=20
>> want, but that doesn't seem particularly nice.
>
> You can add vfat support for IMAGE_FSTYPES, and then you can build an=20
> image (you can just take the files you have in IMAGE_BOOT_FILES).

But that's *exactly* my problem: How do I get these IMAGE_BOOT_FILES=20
into an image of sorts? Just setting IMAGE_FSTYPE=3D"vfat" will put the=20
rootfs contents in there, not the bootfiles I'm after.

>
>>
>> What I want to do at update time is to write the new boot partition=20
>> to another location on disk, and then adjust the partition table to=20
>> make the first partition entry point to the new copy. That way, in=20
>> case of unexpected failure (power loss for example), the device=20
>> remains bootable.
>
> This does not seem to be atomic. It remains the risk that partition=20
> table gets corrupted and then even the first bootloader cannot run. If=20
> you want to have a power-cut safe way to update is not enough.

It's not perfect but it's close enough. The partition table resides in a=20
single sector, so chances of power-out at exactly this moment are small=20
enough that I'm willing to take my chances here.

My experience is that there's more chance of the SD card completely=20
dying because of power-out during some internal mumbojumbo than=20
corrupting that partition table. Against that SD failure there's nothing=20
I can do...


--=20
Mike Looijmans

