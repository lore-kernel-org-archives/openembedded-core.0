Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.92.69.47])
 by mx.groups.io with SMTP id smtpd.web10.5606.1594298019677284880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 05:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=UGPCmAT5;
 spf=pass (domain: outlook.com, ip: 40.92.69.47, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUcy9PyQksbXdBlenA3nzfvkq0DrouXpiZhXa/R/B6DgfNnc5gZA/+rDrmDzJNZphjyDhiDEssllIsW24BJjldFbY0VBUn7+mLMbqhR4qQlHzmP3geU7KMbc3/0VBSHQXI90fI1pUbqeT4cP14kvqylMPJ5HRRkx62HR6UGdwip8/iTGd0FVR66ro27kLbMhQfG3vgr1A8tFsf91lCkAcTrBN7KKO/r/vE6wJO/4ccgjICv9QdEFKaYc7CXphSPHd97lULtjVrf3g0aR5QnK3vPCW/T6lgszL6GrQ32Ddls9rqz6/DGOGYP3emhibY3YGSBKRoWRZFmPEJJ2HcHEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3qUQEFroGXuwP7eWSQYCWU0G4CHQ9GIFFS0fzlh2lI=;
 b=KqUdIjOhLcBkfkGKgK8HwSivFY7+2yH2fsoCYk0bTv/w9lGpXLDiKTuIGtUKRZPfCAXSOxK/nC0q/pOd58XzSiZu0wBMBL5DomQkaOSO7jhzujLo4VhJKwRyOjY/RXyHs8N6D35Lr3uqFVd6TPb5HH/qATgHl3HpaWweWEwjsFyVZoPGMtbMuU7xu7Ybs/tG+qkgcKHo9/4zw/jcDP9iqKaj+G2FZERsIe5tFQVbzP/cOleY5shjh4lJ0VERVbPTykVcIdMZwJXl7vc0wqdJStslQ16bz5zieaQYgty4D4wBKtRKFAl/KrH38Gl03WY8/f6SzzAnwHh0HD3KayB43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3qUQEFroGXuwP7eWSQYCWU0G4CHQ9GIFFS0fzlh2lI=;
 b=UGPCmAT5V9hAfmy1tZ5YeOTSu3AtqG1NnDWrgVmy95oVfgE7QKmA8gpQxCGJOOyNflakvnWbQjcN2R2lJB33tc5a3YhxZpT1lnZXcZ2vJrK4hOIMrsyMA6hIfzaPJWJUrIANLVz7zZ77NZy2C3F+vzBdJZMkvUvpUZyBEguYjQWZZlShEycn5c9WsloGjgonwh80GZQPNRHoRmi4Cb+QRWTedivRkcgiBfH1wTkqcP3T7TGOGqob2bvccclldm+vhJp7S2j6XgTvARw/FiU8h1XVUeuU5S80Akrmh0Ruvh03ePywMttrhqS7cViqIC7T/KUW4sO71rIH5LIY+om8XQ==
Received: from AM5EUR02FT057.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1c::4e) by
 AM5EUR02HT216.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1c::378)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 12:33:36 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1c::52) by AM5EUR02FT057.mail.protection.outlook.com
 (2a01:111:e400:7e1c::498) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Thu, 9 Jul 2020 12:33:36 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:BCC8995CD9ED98D14EDB1A58D4DB8012E5D1A3F35B6C1DB5386E5282059CBD84;UpperCasedChecksum:E41314801ED2B95636D252783821C3A7B73E6D7E9EC28044782F12465E838D8E;SizeAsReceived:9008;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3174.021; Thu, 9 Jul 2020
 12:33:36 +0000
Subject: Re: [OE-core] [PATCH v2] rootfs-post: remove trailing blanks from tasks
To: Alex Kiernan <alex.kiernan@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <AM7PR05MB6881E512124C27A177984016A8640@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <CAO5Uq5TimYvfuX=M4-4ms=4C_yHyo0pKsMfZXhSoopA7J1FhMA@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB6881E8F49318EE9EEE1F2F99A8640@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Thu, 9 Jul 2020 14:33:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CAO5Uq5TimYvfuX=M4-4ms=4C_yHyo0pKsMfZXhSoopA7J1FhMA@mail.gmail.com>
X-ClientProxiedBy: AM5PR0601CA0030.eurprd06.prod.outlook.com
 (2603:10a6:203:68::16) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <397671d9-f94c-fedd-8cee-496bafd9f43f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.150.35.214) by AM5PR0601CA0030.eurprd06.prod.outlook.com (2603:10a6:203:68::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22 via Frontend Transport; Thu, 9 Jul 2020 12:33:35 +0000
X-Microsoft-Original-Message-ID: 
 <397671d9-f94c-fedd-8cee-496bafd9f43f@outlook.com>
X-TMN: [1BD/BtYeQSUxoeRAZXUI6a7OFdr3TB/w]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 582f7647-f47e-424f-976b-08d824044c93
X-MS-TrafficTypeDiagnostic: AM5EUR02HT216:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8n/ENxs3/cCiiDAy8YBMKOKY6qjToMFcKr0IRvU/8S3v94/ftvyxKIeLA62+SxiJYwThHqVt5y1lqlB1xBcoGwH+inKcrnoPuvyzc0KyThv4UzLmtR+xg4Rmob1K3bJVP4Xv9wcI4Jviqh6wekUDxK5CHXceKHHHpjllvRVe4a1Jvj58jhj+Nx5zkwuwgXc/G/DZRd9/e/LPQ5paS9XZKD8/Y7obPsgXHgTAqY3eKPl3zSXbzycL3Kha/C8egpkv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	1/voJiRtYGFAremKiKnMdmkzRvspSXGlSE+N8dvPOL+O/WWq7vYH/b45E7zKBcT/har6T51hjGsspgau3BfSliHpzE/So2nYgVplm0jMfxGhrxmY0/Jpjpbh+kGovCff49/mej3aCbl5+FN3WqU2Tg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582f7647-f47e-424f-976b-08d824044c93
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 12:33:36.0426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT057.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT216
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Yep, I suspect the resulting empty shell statement to cause problems - 
if I'll find some time later, I can take a deeper look into it

On 09.07.20 13:57, Alex Kiernan wrote:
> On Thu, Jul 9, 2020 at 8:19 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>>
>> remove the trailing blanks before the ;-delimiter, so one could use
>> "_remove" to avoid running tasks like 'rootfs_update_timestamp',
>> which are currently hardcoded and not bound to any
>> configurable feature flag
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
> 
> I think this duplicates a change I submitted:
> 
> https://patchwork.openembedded.org/patch/168931/
> 
> Comment from @Richard Purdie at the time was "This does sound like
> you're working around a bug in shlex :/", which I started to dig into,
> but failed to figure it out.
> 
> 
> 
> 
> 
>>   meta/classes/rootfs-postcommands.bbclass | 6 +++---
>>   meta/classes/rootfsdebugfiles.bbclass    | 2 +-
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
>> index c43b9a9823..984730ebe8 100644
>> --- a/meta/classes/rootfs-postcommands.bbclass
>> +++ b/meta/classes/rootfs-postcommands.bbclass
>> @@ -1,6 +1,6 @@
>>
>>   # Zap the root password if debug-tweaks feature is not enabled
>> -ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
>> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
>>
>>   # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks or allow-empty-password is enabled
>>   ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
>> @@ -12,7 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>>   ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
>>
>>   # Create /etc/timestamp during image construction to give a reasonably sane default time setting
>> -ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
>> +ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
>>
>>   # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
>>   ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
>> @@ -26,7 +26,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only
>>   APPEND_append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro", "", d)}'
>>
>>   # Generates test data file with data store variables expanded in json format
>> -ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
>> +ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data; "
>>
>>   # Write manifest
>>   IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
>> diff --git a/meta/classes/rootfsdebugfiles.bbclass b/meta/classes/rootfsdebugfiles.bbclass
>> index e2ba4e3647..85c7ec7434 100644
>> --- a/meta/classes/rootfsdebugfiles.bbclass
>> +++ b/meta/classes/rootfsdebugfiles.bbclass
>> @@ -28,7 +28,7 @@
>>   ROOTFS_DEBUG_FILES ?= ""
>>   ROOTFS_DEBUG_FILES[doc] = "Lists additional files or directories to be installed with 'cp -a' in the format 'source1 target1;source2 target2;...'"
>>
>> -ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files ;"
>> +ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files;"
>>   rootfs_debug_files () {
>>      #!/bin/sh -e
>>      echo "${ROOTFS_DEBUG_FILES}" | sed -e 's/;/\n/g' | while read source target mode; do
>> --
>> 2.20.1
>>
>> 
> 
> 
> 
> --
> Alex Kiernan
> 
