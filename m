Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.72])
 by mx.groups.io with SMTP id smtpd.web12.1810.1594279267562639256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 00:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Z7qO5eSo;
 spf=pass (domain: outlook.com, ip: 40.92.16.72, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THZZSuu/lJ9JwYjWgKBbuaIhc3MDWzmmBC04E6b+TIv7fChMeH/N5GAQPJSlOcInLv/Gv94s8rfTDG8qUVUjIiIEE3X2Z4DyLqHtPSJ/tAhPsZa5ycmpmezAiBBimrVx/SNmhwYwk1w8molfLAZm03Yz36yQ7IJgPFfoVfwF737QHCf2biqhbROmFrQLPI5uFBv/cysmmuAvkYadj4iS1lNtlxJQYDmhA7c4gBdxxW4CtXTsdVSNPyRSXjEd6j7c6KLYIJ6zcgjY9ZlS5haBkAcHu77+jmcL7chB3QSO4wGVKU477dB0c9NvizjZcFE3vGOnWfaL9uxpuHgRVHD6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3JrlITwutb77DlQf4pwTUEBd3w7OAAW4zKR4DCO+Yw=;
 b=nqt7DWcoPV4+XzkQk3vZr7Sp04G/XpNsNmQ/Fh8Dp5BaUIC8MLrPjj2JtuhT6OVj+Qzo1qpIoeecYUsQru5sZr5W6XXB/5jQp30S8qy4FZ6xQLMWJZCF8GyeM7BWCWPUoUoJ5edFH1BzdoozENY/e1HwXQQr9HvfKuMMk4AgXbcSiGxpkjyMmiB98uRhGOwRkVtfpydRkz/LJvlCou7EfkBuo/H4IMTr/n9d+ik0Am9GGKyHJOO0WWMF44x791Jq6bTXPzSIRvHehcfAODjxz3bchQAYYFYq/mLUNPupSbpip36mLPu62Jy9cVptV82yqYae7LVcaZpikHqPkvpXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3JrlITwutb77DlQf4pwTUEBd3w7OAAW4zKR4DCO+Yw=;
 b=Z7qO5eSoJOwZOchf5FWi2QdYmh3eTqWCeAs7R3NYX6ZPtQ9l+PPZBD6ZMXZoIv1lNdn3W9KXKLT+2BoDp4csUvdUnZXE/Nl/LY0LsNrPAbld3Hym1dM2+8iYgrF/0mEzVrjrLH14lN1cX/syqAVLFGGXLZoQkfNasq0+SA3lkkJ4kTxdsx3BpnMyho6j8AXDI5OVxJ3o6Crwt1yhQFklLhtbgUTLpSzqiP/pKxWE5DmV7WpI+06I27J1Qnu+VvkhCaz/7S5yBhrn3LiRGl1B1eAo7XLZ2j7hcK7vy3aHWYX9erlSa3miAkv0gGBkIiQJn++2yS5x8IaIeF3+SSBARw==
Received: from AM7EUR06FT018.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::51) by
 AM7EUR06HT179.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::215)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 07:21:05 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::47) by AM7EUR06FT018.mail.protection.outlook.com
 (2a01:111:e400:fc36::396) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Thu, 9 Jul 2020 07:21:05 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:16D7AC00A3E36ABA77A1CD47613394AE10B8D24BC981F9718EFFC2BA006A38EF;UpperCasedChecksum:6A258525B7D8EF03F7FCB51E02BCD4B8D701D262FBC8C2F81C25E3D6650B719B;SizeAsReceived:8003;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3174.021; Thu, 9 Jul 2020
 07:21:05 +0000
Subject: Re: [OE-core] [PATCH 1/2] rootfs-post: remove traling blanks from tasks
To: Jens Rehsack <rehsack@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <AM7PR05MB68810192ED5AB6DB0BDFF67DA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <B35F64C3-D38E-4612-B68B-A359F79AE892@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB68814011E8252FCB5A9A471DA8640@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Thu, 9 Jul 2020 09:21:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <B35F64C3-D38E-4612-B68B-A359F79AE892@gmail.com>
X-ClientProxiedBy: AM6PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::30) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <dcca5f9b-efcd-bdc9-f393-e31e47054af6@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.150.35.214) by AM6PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:20b:92::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 07:21:05 +0000
X-Microsoft-Original-Message-ID: 
 <dcca5f9b-efcd-bdc9-f393-e31e47054af6@outlook.com>
X-TMN: [VpGvXkPlZgLc7zhic6hjab7skMzYukNz]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 89e7ff2e-e346-4783-48fc-08d823d8a499
X-MS-TrafficTypeDiagnostic: AM7EUR06HT179:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PmoT1A3k5alw+gLPpNmv/s9mVUiDJVdtdSVcv9dv7DqcAJRapsJb6Kk9lYi9a40O7oCudEiErneMeLniP+BkPxPCnqVby/D7+BNUMyYzsQUVpbsyh+VQ3G2g8B7WEdorY86Q6nah+qI1Iz+FQIc+QMTiTRwYTFsPMnKYsGaZ95q24iIeIFEZo9hbgJaGrLHZDVMzg9mbNLAx3sKgseza8GebfFhwBpf6EGwWOQgN6L1IDtuYvMqHQoZhhArbkS0C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	0QBHwjKsxj2/TBKEPX6LmZ+kfLFrX7enZ4TgIkIAxzc+B5YRu5pHaoMjEOifp9B6x3bSD18eI2njihSG/ddlKvJF1p0panYKSQik3dPTlBWIopm1g+wU88lA32e28iGmBXhlzwa4Dsu24ZPi5ZVxOA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e7ff2e-e346-4783-48fc-08d823d8a499
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 07:21:05.7677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR06FT018.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT179
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Thanks - missed that -> sent a v2

On 09.07.20 07:30, Jens Rehsack wrote:
> 
> 
>> Am 08.07.2020 um 13:09 schrieb Konrad Weihmann <kweihmann@outlook.com>:
>>
>> remove the traling blanks before the ;-delimiter, so one could use
>                 ^
>                 here & subject: do you mean "trailing"?
> 
>> "_remove" to avoid running tasks like 'rootfs_update_timestamp',
>> which are currently hardcoded and not bound to any
>> configurable feature flag
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>> meta/classes/rootfs-postcommands.bbclass | 6 +++---
>> meta/classes/rootfsdebugfiles.bbclass    | 2 +-
>> 2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
>> index c43b9a9823..984730ebe8 100644
>> --- a/meta/classes/rootfs-postcommands.bbclass
>> +++ b/meta/classes/rootfs-postcommands.bbclass
>> @@ -1,6 +1,6 @@
>>
>> # Zap the root password if debug-tweaks feature is not enabled
>> -ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
>> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
>>
>> # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks or allow-empty-password is enabled
>> ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
>> @@ -12,7 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>> ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
>>
>> # Create /etc/timestamp during image construction to give a reasonably sane default time setting
>> -ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
>> +ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
> 
> How about
> +ROOTFS_POSTPROCESS_COMMAND += " rootfs_update_timestamp;"
> 
> Reading a list is much easier when words are separated by whitespaces.
> 
>> # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
>> ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
>> @@ -26,7 +26,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only
>> APPEND_append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro", "", d)}'
>>
>> # Generates test data file with data store variables expanded in json format
>> -ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
>> +ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data; "
>>
>> # Write manifest
>> IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
>> diff --git a/meta/classes/rootfsdebugfiles.bbclass b/meta/classes/rootfsdebugfiles.bbclass
>> index e2ba4e3647..85c7ec7434 100644
>> --- a/meta/classes/rootfsdebugfiles.bbclass
>> +++ b/meta/classes/rootfsdebugfiles.bbclass
>> @@ -28,7 +28,7 @@
>> ROOTFS_DEBUG_FILES ?= ""
>> ROOTFS_DEBUG_FILES[doc] = "Lists additional files or directories to be installed with 'cp -a' in the format 'source1 target1;source2 target2;...'"
>>
>> -ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files ;"
>> +ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files;"
>> rootfs_debug_files () {
>>     #!/bin/sh -e
>>     echo "${ROOTFS_DEBUG_FILES}" | sed -e 's/;/\n/g' | while read source target mode; do
>> --
>> 2.20.1
>>
>> 
> 
> --
> Jens Rehsack - rehsack@gmail.com
> 
