Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.73])
 by mx.groups.io with SMTP id smtpd.web11.26947.1590716999104149193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 18:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pAskFvdw;
 spf=pass (domain: windriver.com, ip: 40.107.236.73, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrUlQbjjBNz+0rucZPRrzfsJDcz+yWe/n0rEfSwzYMAN7TFdOdild0/9OgN4w67kXcKeDrjyPwlAkE4cQ85pOPJ6YnXxc4UzEj4TgRqKz2TmHyfkLazm5lL0pzjVTV0adY7/yes4mq0JNhddFrt5FZcO4IfDsjhQ9NScoB8Jm9fAylZEn+bFvv9ZR4/Vk3SNiyhkSK6QSvCZKB5hGCP8QRsciO/KgicuSaTZE5sPVec0Nx8e6rOWXi7hjteYUXZNFv52wm6q1gk3+ksfjMMgmXMf+1lOZlz6b1XzCPEGUEkcunpCXd+kiFn4NPvZm1g3mxFYCB5QPz633YRMSUsxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ajErquPQiuPYjKwZi95IaVqG6YuSCbadmztAeARB5k=;
 b=CBD2Hvj5jYNDXxQ1DRqagoOSPIMu0jxzOI9v6pnW11WIhmxKjkJYHGkfvSitTGbjs41MyWK5fbY4Cw8RDxqLs97b4E7vBZu25BjF9TvDzaG/i3RIfHMUYE7k9pU3DjZ2MoFVkwSLBVEwnVklHKYl2pidHr885E0zlyUgJwyc76e7FlGdSC1nUKKqFC5Z4LOR59UyF6fNDGIOvRtewR9kB5cjYOg0E6SGROlnjn0ICYCcFYouh7HUu1Z3aeVIv/bilI8QbDBgRYSbeNpLZDNsZ5Zl3dQmTNWVQDjDvl+OlxS8dMPRihN53BaUCKBIo7DBY3LfH7CWCGdYtZzpo9VlCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ajErquPQiuPYjKwZi95IaVqG6YuSCbadmztAeARB5k=;
 b=pAskFvdwzL+gFAsSUmAd8Yw82GSFAN/D7Pyn0xNuEDd2rLmnqtGCRsFGpnXzHMrEkMbDosX7XbbLmqvCYxXx21ps5ZgoMlHdtus6dRMiRZ0p4uq51QtAQ5nY14xChJPv0/thXu2jP/mVLnLdwq8QIWMZzKFKNr9+1KpbIA5dj4k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB2970.namprd11.prod.outlook.com (2603:10b6:5:65::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 29 May
 2020 01:49:57 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d%6]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 01:49:57 +0000
Subject: Re: [PATCH] initramfs-framework/udev: remove mount.sh to avoid /run/media/XXX
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200527134324.23121-1-hongxu.jia@windriver.com>
 <6405627755e039216f6cf2f53d74b34004c75a4f.camel@linuxfoundation.org>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <3150a63f-208c-b362-79d7-2b264c23c3f6@windriver.com>
Date: Fri, 29 May 2020 09:49:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <6405627755e039216f6cf2f53d74b34004c75a4f.camel@linuxfoundation.org>
X-ClientProxiedBy: YTBPR01CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::26) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.148] (60.247.85.82) by YTBPR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Fri, 29 May 2020 01:49:55 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 604d5141-748d-41ab-8eef-08d8037296eb
X-MS-TrafficTypeDiagnostic: DM6PR11MB2970:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2970091EAEFA026316654937948F0@DM6PR11MB2970.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HphgkhmD/Hq2jhxYDCOQLAvC1R3loPIcTjLYSGDvbw3ndk0ihmPosBFJajnNPQMkX9Kpn9/ReRwnkYI6szTKB+IecOfJ7/YKAU2L0spcc/4IBi22ViibJMm6W0m4x/CuLdnlQBIv8aYsCmqXKNvsDFEp9aGgkMVTruLraL0ePrpVXxhi6KLq4Bot7MHRgUumGwPlCWXx0hX4b1I8C8Q/3uhR1GDISypWivgKjftKQURM6cqwCLJp1Ph3Iq0kKyvn9//tSNIVnp8nvWokOaf3UfKrYVChgqGxefUhm+c4dP6YJ43/UbfZWGcAlvK7ni6D+8nuJDFkAsWTNUithfd9e8Y7CrqskSjkIXZWcy+rbYobr7PzHJoQT1luUPg9wkqTozCYeKo2s/YoHB+zfjZcBnnovOXRKU3q7JRT70kMMbjyzxLNF1bdXFI9U29v4TT0+lJlANtvPEO1GprNV7sDD63AA36+Tn8uYU9tXPcbQvovymYQV6m0tCnBe6fNvSHnmOf1Kfd6jRUea6+NAgpw3pYJLV8PzEvKNYfVaLk0uj9SiJNXmxyr+TUzLZSHPlBX183WTMluq71Pm9uEKC6VWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(39850400004)(346002)(376002)(366004)(16526019)(966005)(26005)(8936002)(36756003)(6706004)(478600001)(2906002)(66556008)(52116002)(66476007)(66946007)(53546011)(86362001)(31696002)(186003)(44832011)(6666004)(316002)(83380400001)(16576012)(956004)(8676002)(31686004)(6486002)(5660300002)(2616005)(78286006)(13513002)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rBncAfQArwPQZD7+5nSw+n7CL13gBtAg5H8Z8t0h+O71Heb+fYYnuhuUQvgg1jBpwgZg8NsfzgbOhQr5/SeY8eeqzB2q9GvcwprLLg1Fio4DeTLcSuj4jXo1yx9Pm36Uj/Nd7kNMUu+b0MuyUHoJz0V5HQcaITma9wZKLli+3KQPCkTa6dxQyLl2hHzUhmbvLLkDAvohCrLrpAPIgOpbHI5VWZWEsMNZWOeKbnoKHYPl7Js0Nspf1wjJ0w/YbZEjenepp3/srK7w668doYm1DdkXcXT+ravTs2NlQ/1HWmpyaSwmPnRyaiRGKFh+2cMsEoXQPu+QgGYu6mk2lJ3fjYOoM2dew5BDq9I7cvoyctLJCh0cnfn6861UrgUGLVsbFBYaF6oMLaSFntR+vsenJvD22wgMwMfGwoRSm4SuFIwOrQ5nz2x+HhdpXcTii2Cbelx2br3Sz+O+YonjhyCjfJNzOefsH+Q/0t7o05DTezk=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604d5141-748d-41ab-8eef-08d8037296eb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 01:49:56.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6gnDjatGJhpWqCAQY5/N5cLj8YWWXG/ED59oTMoQV6ljVp/v8AcaRyCbPziDmyMieFWwod06Dhbw2uzhfaDRNtGlCW3AUtp3bhQpplX8ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2970
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 5/29/20 6:06 AM, Richard Purdie wrote:
> On Wed, 2020-05-27 at 21:43 +0800, Hongxu Jia wrote:
>> The udev invokes script hook mount.sh to mount /run/media/XXX. In
>> initramfs-framework, if udev was not killed in time, the partition
>> will be mounted to /run/media/XXX before switch_root.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-core/initrdscripts/initramfs-framework/udev | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev
>> b/meta/recipes-core/initrdscripts/initramfs-framework/udev
>> index 8b62080c68..3c4dd0ec9b 100644
>> --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
>> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
>> @@ -49,6 +49,9 @@ udev_run() {
>>   	# Workaround if console=null, systemd-udevd needs valid stdin,
>> stdout and stderr to work
>>   	sh -c "exec 4< /dev/console" || { exec 0> /dev/null; exec 1>
>> /dev/null; exec 2> /dev/null; }
>>   
>> +	# Avoid /run/media/XXX was mounted by udev
>> +	rm -f /etc/udev/scripts/mount.sh
>> +
>>   	$_UDEV_DAEMON --daemon
>>   	udevadm trigger --action=add
>>   	udevadm settle
> Somehow I think this patch is causing:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/976
>
> (the runqemu.RunqemuTests.test_boot_machine_iso and
> runqemu.RunqemuTests.test_boot_deploy_hddimg failures)

Sorry for the inconvenient

//Hongxu

> Cheers,
>
> Richard
>

