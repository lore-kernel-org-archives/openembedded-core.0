Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.47])
 by mx.groups.io with SMTP id smtpd.web11.5926.1615278788256739731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 00:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=i0dHZ/P+;
 spf=pass (domain: windriver.com, ip: 40.107.101.47, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqtlbH/k5Kt7rAgENIpwjbPSAlZUm8v0ZZtgCDjZ0T4pqezS013OzvIcxdjPMCwSFqayCl4cHOh4Cda9KjBNgT0EyZnaxlN+VEhSWY9mu/uA8CwfiFB3F9nak9KPJS0TLSpL7GDnrOYMPQyChHOV3I4MenylG57MP3qPX4RuTEgAkFMt+yj1fMpL97IZXqgv11xZYDe4kg8Igg/Er6oCiyexh/kbP4fOHNn1TEpLpeFQZ9ilVQVoMFhNo5qxkN/cpELKVeBX5OJ2WrBVJ/y8LRYu4lHF/KWPXEB+QY9k8vHwml13Y9UeKkHfd2nFToRJPNmVi/pL6xiNY85/m+JD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLIi4lqIbYfzEN8k3G92p20UdZf6DiPUn1chf7qIgsQ=;
 b=FOSw3khR3wnh4VbNDhvSZ2jHQqbRxUtg9zt0tas5yr2DOwJJ65WQef+fbYD0Ddlc1a+eIT0OdbvW+Eum/2+uytZ7b35u9n1CFFQBDHI7S81WNG1W5GYMNHFhCjVpzwn8B5tNKLjJL7ujLzPIo/+BxmuF6CjmOZMB41YGB5PgybFnNj5TDP0xbKPbNXOj4Zl0DR12qIAa80T/glgYkgz/DkGGyY7E2N7F5KFMJsGLaa617T/PVj1+HuSXbOOELWEdpwdACDyBHEhmOlTEAOMAVmFcufBdH0wMiB4ToCM1cWK4bJEx7cBJY8+FdU4g+ydyLzixQKszg2326ynnJN+rYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLIi4lqIbYfzEN8k3G92p20UdZf6DiPUn1chf7qIgsQ=;
 b=i0dHZ/P+wygPyJcnbBew07El7ZUFqB152pziLe9ZVWj46+16qbFE4f9PJ55sk1FHqaUbWBOgiSFvHA81Hbl8zohWCxQZgYCDIIpzdNdFes16L8L7Q4CR189BO7nf5R2if9NQgu7yCUcHv7klL/H1JkkCS67rEQaRvo/8Bc96Z4c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10)
 by SJ0PR11MB4797.namprd11.prod.outlook.com (2603:10b6:a03:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 9 Mar
 2021 08:33:06 +0000
Received: from BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9]) by BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9%7]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 08:33:06 +0000
Subject: Re: [OE-core] [PATCH 1/1] rootfs-postcommands.bbclass: Print a warning when login with root is disabled
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1614916931.git.liezhi.yang@windriver.com>
 <870b35befc0b8fa9cd1c3a03fcfd2395440c2f41.1614916931.git.liezhi.yang@windriver.com>
 <f23d196c13f24731a5a7e00ff139aa42@XBOX03.axis.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <975479fc-e8f4-dccd-56c9-3d830cc5dc54@windriver.com>
Date: Tue, 9 Mar 2021 16:32:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f23d196c13f24731a5a7e00ff139aa42@XBOX03.axis.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0074.apcprd04.prod.outlook.com
 (2603:1096:202:15::18) To BYAPR11MB3736.namprd11.prod.outlook.com
 (2603:10b6:a03:f6::10)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by HK2PR04CA0074.apcprd04.prod.outlook.com (2603:1096:202:15::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 08:33:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d88fdfd-1e81-4cca-d1b4-08d8e2d5f630
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4797:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4797DD9CFABF31C2652249E8FF929@SJ0PR11MB4797.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L78NNRK2RZt9q6nReZoc5M3Z36xxk0OgiiHJubSIrMvrKUpXir6ooU5M+awuPx9SCX5Ma2NH3SsyviYEzgravWuQPTHjAn7YQhevXsnY2CIoaf7WgKnCLwnGY3XOwlbRQw3gtiEqqIkuGYFK25ryMrLzSyaRqc1pLbqbVZEETR+RiFls3wMr/pRrqcFEsgD3a+1MiuzTHDJTGAU7Pdpvvo+RNX3M5MZL6vJI/euwrVNMtSwKM7H+M+Pwz8M8enJYKPYHBBBP6WwJmqqehxb5ApVwu0g6b15uGVzly64lHka2oy5sPHsxpz1tDqLrZ/iBemoUPbEV00mJCwuayA9DuFjLaCnLcfxXdJ9InLsSXmatSsMqPCH8zn8ICuXpwScsziSZ24dM+WsjC79Y2Kvo2z3ly+eO3j0t7Iqo757hbRZ4WZde9R9OAZzbFfd0Nmyqlw2sAA8YtoBwdbj2NWvaUSm90yAISf9dPEb4hyC8J8w2BpidfQcIJqXV0gYt8vLa0ySvYl4dxj/N3HNT/FCnXSIgTJ3CK8OKCZabjzdoFyHYdIdEDDCmlvw21apoy+wgDIFvkA7xywu1c6BO5E3zW9f0Ccd/m4kCi6igFPjsrd6F/exMYOGBC6y1jjn+YBYO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39850400004)(136003)(376002)(52116002)(5660300002)(83380400001)(26005)(6706004)(6666004)(16526019)(186003)(478600001)(86362001)(66556008)(2616005)(110136005)(8676002)(66946007)(16576012)(53546011)(31696002)(66476007)(31686004)(316002)(36756003)(8936002)(2906002)(6486002)(956004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TW5aMjJGMjBBbWZqMmZodUQzb0hoWll5WWZxRTJtM29DdDEyeVNCRE5KZ1pQ?=
 =?utf-8?B?VXZJOUFJVXc0RTVKWjZDdUQ5NzRZcklCVTUzV1ZFeVNqSUpya0thSnhjOUdF?=
 =?utf-8?B?RXlQWjBXNzJhMmJUT3ZvY2MrQTRPT2NEbWhnazFmcjN6cGhMTS9xTE05STFz?=
 =?utf-8?B?QTQyUUY5YnU2R1g5TnkvU0IyMURLN0MreDEzc3FMN2dQL0pVVXF0WWJCMG1l?=
 =?utf-8?B?T2JrVjNXK3k4NTlROUtUbkVJUjdWOWdOZ2FhZHFkUjhNL2xKQjVuN00wMkVN?=
 =?utf-8?B?a3BpbjNkaTRWWmR6OXZuTWIzWGJDa0pSNGdpcE5panNoRWtSeFk2eTRHUERK?=
 =?utf-8?B?TTFncXd1T29VSzYzSlh0VFh2YlRlTUR3VUkwVDRWZXdBVnk3Wk1QTXk1V3Zx?=
 =?utf-8?B?QmpUaVJ2QzRySWJOL0NqRS9yL2xScnpRQ2RxVVNBTmlRQWZXMHJBZExWVWli?=
 =?utf-8?B?R08wU2FzbVNZbkNaU2t1aWNEQ3JjL2l1TTFUTFczTjFWYlZSREVKY0U1akJZ?=
 =?utf-8?B?OXpXZE9TVlVmVTdJZXFxMy9ZVXVzS1hVNG9VY05ieUJvN1cxbmtES1J5RTA0?=
 =?utf-8?B?WTVhN2diYXN3Uyt2VTBWNC94cmxpYlRsVlNFVnhPeHJsSk1DRmduZ0F1djk2?=
 =?utf-8?B?K2lxbkpLYW9ZQlVNUGtnZXhFYVNIT0laV01RZituR21pa3BTWGUzTFlsVjBo?=
 =?utf-8?B?ZGdodUJWRkk0dkpUQ2xuZzh6aG5oQXdoLy9lTHlPa24zcU41WVBVbWlxdDdn?=
 =?utf-8?B?VVFpUmlpVlRSeG5IVTE0SGR1bmVZVXNvSUpwZXJQN3BVa0txQlJ3ZFUzTXhn?=
 =?utf-8?B?ZG5tbC9OUFB4aElkcEtkYm9od013Y2dEU0N0ODBwUzhiOEFXb1NkNERJYjl0?=
 =?utf-8?B?WW84VCttd0FuK0pNaGZrRHlDUlI4QkxrYWo0eHF1QzJORlZ0Qm8wNHpHK2w5?=
 =?utf-8?B?RlRYeGJ2ZlRYY2xrQnhrSmpLNnhzV3dpdzYwamVIWi9zVkxtd0NBSlRwSDZU?=
 =?utf-8?B?WERRM3VLUG1Seno1b3dISVRnRGg4dUZNejhuUnVEUmdSbWhySUFnL01oUk5M?=
 =?utf-8?B?blRJV1RKR1ZvVGJ0YVZsZnRWMTRkN2k3dG5TRS9Najk0eTJGSFdsVUdNcGVL?=
 =?utf-8?B?V0pJeHV2NWJpcWE1U3pRRlZiVFRNRTk1NWhOYVYyQWF2MjVjcVZWTFlMdVJr?=
 =?utf-8?B?NG5keHVmaTVPc3d3dy82OW5NblJQR0hqKzByKzhNL0JuQkVTbFhaZTNqTXFY?=
 =?utf-8?B?RmpwVmJJSnN0T1E0R2phMEkzeFkvMlNUbko3WjdaZ2l5M1UvZk1TUUZtYVkv?=
 =?utf-8?B?L2dqS1laYk5IUElCT0lFd0l4N0w2ekxVVndVY0NZb25kWHdhOXg5c256SElq?=
 =?utf-8?B?cVI1M0JRVmZxUHVweXljT0dQNVJuM1R5VWhPZjdJQ05ZRHN0TnpaR1FiY3hw?=
 =?utf-8?B?R240ZnlOKzZsN1oyclpXc0xlOU9USmwwVGJjV3J6M1FHa1FGSUhvTjVQUk9o?=
 =?utf-8?B?N2RkU0k1bFpNUlF0bU5Db2VBQVFjUzZSTzk3VzlJMGF6NDlVbjVEanh4WTJK?=
 =?utf-8?B?MVNRaWlucjBZUjkxVVdXSnF4ZnMvWld5QkNEU0xoUTJUelNseVhjQkRJM29Y?=
 =?utf-8?B?M0N5ZmJoUjd1UHovV3E4eGJ0VDdmSnYxMEtGUFVMT3loQTR1enh6V2xDWVY3?=
 =?utf-8?B?R2R4bWNSeUhVNUd2UkYrR2xFRGJEU0RqWmthV3V4UTE1QnVzclp0ZU1uRUZZ?=
 =?utf-8?Q?x0la8QhYIe+A+RQFQG+RUVJimMrobABzI/g0UI2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d88fdfd-1e81-4cca-d1b4-08d8e2d5f630
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 08:33:06.1359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UejtUhPdthBid8ZOSgJk/lUyeMaSj5oi2kOrcECmVOcxXBrncuxuZv+CmukZvJR85aVXpgHOdIJX7qKw7pUrkCm06eEDq5LHz5htUG+IirQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4797
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Peter,

On 3/5/21 6:18 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Robert Yang
>> Sent: den 5 mars 2021 09:49
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 1/1] rootfs-postcommands.bbclass: Print a warning when login with root is disabled
>>
>> Fixed:
>> EXTRA_IMAGE_FEATURES_remove = "debug-tweaks"
>> $ bitbake core-image-minimal
>>
>> Then we can't login to the system with root without any messages. Add a warning
>> makes it easy to debug.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/rootfs-postcommands.bbclass | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
>> index 1f27a3d07a..e4fe416ac9 100644
>> --- a/meta/classes/rootfs-postcommands.bbclass
>> +++ b/meta/classes/rootfs-postcommands.bbclass
>> @@ -147,7 +147,11 @@ read_only_rootfs_hook () {
>>   zap_empty_root_password () {
>>   	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
>>   		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
>> -        fi
>> +		grep -q '^root:*:' ${IMAGE_ROOTFS}/etc/shadow
> 
> That will match any /etc/shadow file with "root:" in it. Change it to:
> 
> 		grep -q '^root:\*:' ${IMAGE_ROOTFS}/etc/shadow

Thanks, I will update it.

> 
> And make this optional. We intentionally do not have a root password set in our

I don't quite understand about "optional", when the command is:

grep -q '^root:\*:' ${IMAGE_ROOTFS}/etc/shadow

Then empty root password in shadow is:
root::

so empty root password won't be matched?

// Robert

> products when they are delivered due to the state law (SB-327) that went into
> effect on January 1, 2020 in California, which prohibits default passwords to
> be used in IoT products.
> 
>> +		if [ $? -eq 0 ]; then
>> +			bbwarn "Login with root user is disabled since zap_empty_root_password is enabled"
>> +		fi
>> +	fi
>>   	if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
>>   		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
>>   	fi
>> --
>> 2.17.1
> 
> //Peter
> 
