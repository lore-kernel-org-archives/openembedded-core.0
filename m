Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.51])
 by mx.groups.io with SMTP id smtpd.web09.2891.1605180835217913224
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 03:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XeFmnN8h;
 spf=pass (domain: windriver.com, ip: 40.107.220.51, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYOg7sN7lg8sDPeiwg/1BLqMyLPC/hW6nmiYOrJpknBs6vGLt4PcaYkWHCyHJHymTFr1jA4HN6mhBqyQxu36zLkvzA+OTDl4X8qU6MCwxWGqv+IlYcPAnT0ug7GuQJ/TjbPrzyVsEfNepM4fZaJzNyUCP5SeYY8ATh5JTeu5EHVdUV/LPUFs8x6zX+fXCEXeUO2ScqzwutH9JGRZxybAD+Jx++7tL6PTwmFQbtqdgzm66oDmdTjI1yC76g2KBzMKVbQXz1gZx8iHaLAlVa6FqlhR7lZpZI3XfnJ028qSvmcAZ26+vhZqSZ784fB3xdFtSJwhtchxlygvPNA+kQE9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjk6P5QJk0F7KLZUQXWieACycR8Vxtv0B9jp5kqvhFU=;
 b=fyXa1K3ph9Kp6oX3jDjsAw58LO8L4brE5j2B6PxBUwCy8LGCNrfgwrbP6QbYGfNhd0BvVM+2GridsyjB+Joqb5dRE4i21zjRW20rsgS02SrugcWIg5g2diFwasaHMkGVDKeh9euh4PWU5pIuvJNqnZNz9LwczbfyqyZdq83VtmiizMAJZ26WcNeagPeJ8l/Oq8J+bL5jiBAN7upG+nU9aubyrIMrFvOTN2PW/woZPJZNDc0QpKxSLRXYdOYUy+YABoojtiWRaFIFpGNsO0dbtnTrL9dY0RgPLymY0hnwdXXEEe5NCMYXwwv2Z67oRLjakWpd4XhKsoLRv7KvSaanoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjk6P5QJk0F7KLZUQXWieACycR8Vxtv0B9jp5kqvhFU=;
 b=XeFmnN8hXFrXfrev21WmF5rW6hjCxIdMI8zBfdO73B/QG0mmA02qzvMSOxJp7oazfNHpcmHK9Gv/60S7hahflgXUSegY2lYCw1kb72PjYULiaRdJRbL1zwqplanpkF09Zn8BJOQgsq3U11nbmGkruOOCNwO/0/F3wdIWVoaE4pU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA2PR11MB4939.namprd11.prod.outlook.com (2603:10b6:806:115::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Thu, 12 Nov
 2020 11:33:54 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 11:33:54 +0000
Subject: Re: [OE-core] [PATCH 1/1] oe-buildenv-internal: Support extra settings
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1605180304.git.liezhi.yang@windriver.com>
 <9d68429be743586fd36b8f76f086fea16968054f.1605180304.git.liezhi.yang@windriver.com>
 <20201112122412.3dfaaf80@opendreambox.org>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <2aaa45a7-a835-98a6-d49a-09c56e875721@windriver.com>
Date: Thu, 12 Nov 2020 19:32:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201112122412.3dfaaf80@opendreambox.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:a03:338::26) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by SJ0PR03CA0171.namprd03.prod.outlook.com (2603:10b6:a03:338::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25 via Frontend Transport; Thu, 12 Nov 2020 11:33:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b2d4ac3-b851-4a8d-6f00-08d886fed5b6
X-MS-TrafficTypeDiagnostic: SA2PR11MB4939:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB493970D83B6E61A3D786F9B6FFE70@SA2PR11MB4939.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	isJxgYdyyhJCEml7k8VhtHn3EqfgoFtg1QNtBrCOStet9qYGxA8OBZhT04mWiAqDFOx5DutxtBRf90vUEko3qoz64VlZtRNebsZhYt3Bsz16kr+iTMqxsaathf5mVE5wvN+icG5aS4gRNsp8Y5aK6nlyLe30DqfHJSXkPGa6tA0DJ9Kzp1IrUyoWIBBeLuTGB455NHxxWP8DI1Ele7/olWpIBzPMrtzuIddg5n0ibpL4udrDCWXIUSMUTbEaOEDtuhsvTbQTm8BEAuJ4evUGjK+D47GgGsoJTQqcHv2VBojppbBVii8TzmCtCeKMPT3AhemJQwrLmbS1uXGNG9ou8A2fiR0rJO8DfprLN5kjAEnXwIoWPfB7MdJ+2mxvMJP+zPZq4OL/RFQT/ru6fQb0KQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(66556008)(6706004)(53546011)(186003)(66476007)(31686004)(16576012)(5660300002)(316002)(16526019)(2616005)(956004)(31696002)(26005)(6916009)(66574015)(2906002)(478600001)(8676002)(8936002)(6486002)(86362001)(83380400001)(52116002)(4326008)(36756003)(66946007)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	V0W9GuSALUVAljaKFOxPDOmnRJEZOVwI5jyHenVMJiwCu2Po/YnHvBBnOHdNfe/FDmFaPr8u8P3dEewJimVqvFY+1YYfRTUVdDWwccrDwwQGyMsm8l36vinMumX2za3QzK0/K87WL39tuqITwAncWmG9VZdAtcDD8xtf3DSJPkMqdvX39ZGdsIVSD1vCJy+lehBaB1eP24qqNtlfMkiASkavxVMqgQHDlw5ezUD13MIXsKV68U4EukCowZ7V0SCHLNpz46xwMEpD+5JxnI4JvZTcN3/1+A7yWSN2oDZtDJDx7AuJf0nP4b2zgrKTBwoNNCQWrGIXtzv5PiFkQvQxdAZRBHiuHE/3WJ8eWFAsaco+8jkdhzWiuZu5tQpqM8RAvfrA+FNML9cAVD5NinMvaQn6CID1MkOaa7JWbWFMo3MEfnkVh+uyQTbxe7fmFCXYumEZyRdinpsryZJNDxsEw56enyTvMw6pWf1nyg1JZqEd8FG52D9gG2NQHXE71eqlSvW/B01XJEzvb+twsyE2WyV5eeg7oMEOwRXRpdFQsEIGJM/AYFaQHWCrUvkKQBD+Mv0mxZIfnsOYJHVeEAkTdp0w0MxmF8ZkT4sZ8v6I+T3eJFQ2YwbJt+vaCKw/bBC89M2Q4BySzoCmC1uU9L8tZw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2d4ac3-b851-4a8d-6f00-08d886fed5b6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 11:33:53.9702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xT9rGq2g8BjckALs8W+6HiwfiF4E/EU/aAHEG7MfaSrH5YxM5FR36VJDuSKOeTVYAXxrSQBPWFqwoi7NIxhYrZywfHA+q3bsoPH0NEZuDaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4939
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 11/12/20 7:24 PM, Andreas Oberritter wrote:
> Dear Robert,
> 
> On Thu, 12 Nov 2020 19:25:49 +0800
> "Robert Yang" <liezhi.yang@windriver.com> wrote:
> 
>> This can make it possible to do extra settings such as PATH for other layers,
>> for exampole, other layers may also have scripts directories as oe-core, we
>> have to run them with path since they are not in PATH, for example, there is a
>> tool meta-browser/scripts/firefox-gen-l10n-recipes, we have to use
>> /path/to/meta-browser/scripts to run it. Make oe-buildenv-internal check and
>> enable $OEROOT/extrasettings, and set a line like the following can fix the
>> problem:
>>
>> PATH=/relative/to/$OEROOT/meta-browser/scripts:$PATH
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   scripts/oe-buildenv-internal | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
>> index ba0a9b44d6..bf84003d72 100755
>> --- a/scripts/oe-buildenv-internal
>> +++ b/scripts/oe-buildenv-internal
>> @@ -98,6 +98,10 @@ for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
>>   done
>>   unset BITBAKEDIR newpath
>>   
>> +if [ -e $OEROOT/extrasettings ]; then
>> +. $OEROOT/extrasettings
>> +fi
> 
> I think this filename isn't very descriptive, and people finding this file might wonder what it is about.

There is no such a file by default, the file should be created by other layers
or people out of oe-core.

> 
> How about sourcing all files (maybe with a given suffix like .sh) in $OEROOT/scripts/oe-buildenv-internal.d/ in lexical order?

If we do this, people need to patch oe-core/scripts/oe-buildenv-internal.d/ to
add their own settings, and oe-core can't accept such customization patches,
then it would make their oe-core repo non-fastword because of the local patches,
so I'm afraid that we can't do this.

// Robert

> 
> Regards,
> Andreas
> 
