Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 164250 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Jun 2018 22:24:14 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0089.outbound.protection.outlook.com [104.47.38.89])
	by mail.openembedded.org (Postfix) with ESMTP id 39CBA7506A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AYP5C8vT/xIQe6zMSSvyZcWGTJpYgAn4/8oMiR1gDvM=;
	b=UlzRAfYi0HuwmXixEeRBQfssVudunlDZdz+H68iV/bVeBdr9s4dZjz9SXWkDjupQ5A0negg5gKGIhqkvPS26Y/U11sFkqc7Pjb/nhy4MLlZJvcaUVB0gPbs3rHbI7UpylU84g9SksNE1V2MPSnO/7uTXhu5HVp0Q6W/YklPr030=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	MW2PR0102MB3420.prod.exchangelabs.com (2603:10b6:302:3::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Fri, 1 Jun 2018 22:24:12 +0000
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-6-mkelly@xevo.com>
	<1fa5f19ad4ac398de0dc6da40c46ead935133dbe.camel@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <5c2bc7c4-6a79-2775-af6a-30fb6d693296@xevo.com>
Date: Fri, 1 Jun 2018 15:24:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1fa5f19ad4ac398de0dc6da40c46ead935133dbe.camel@gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR11CA0042.namprd11.prod.outlook.com
	(2603:10b6:300:115::28) To MW2PR0102MB3420.prod.exchangelabs.com
	(2603:10b6:302:3::13)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3420; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3420;
	3:fezZnOpE052SJwIz1XCf9zcVDVWVLXGOWbeZmvz9+bDOzxW6+6V5LTY0wGDYtzplfTnDadgvpFxcgK94Usi3DJs8JVNA9Zab84H2VWHvkh7MNlvG7VDTGGa7jOZaGn4lXOZJv1zfpsnoJ3dhWh+EufY8aXJPV4pchdChHvcoIl3BJxBWqDuFT7dzIvr+O6a0D6DZWWtC74M2vMPlTb6IoZ64+/t8nzpQBcFqLxX/Du+8O6aFvoTqc6objrd6yxgL;
	25:nYitql97q6IX27YzBVhplj/rfglbuljYJtRTwrljO+fu9kg+30GC/db8qX2zAwX1EVWUdwX2CBN2CYlfNYKPebqkItt5uclV/xYSeRvER9q0RyS8gmaj2K2K+sj2pfvAcQrx9Zv3c9Kwj0rYgtBMZ8syyki5ZJBWACnrgJkPMXE5tSpcTGf5uUlN2UH9pNLu7ILy4B/z/wUoX6BFy3gLwduZgTKSJLO8xOp+yvL+o77MrG/D1IqIK2jwmLLD6HJ9WB/kxsJir8Vte+a1wom8XoZr3S4A7s0p25UjBqkisFfpSBnmZWxg9qUbJei5Pxfz8yuEGOWXjByqk4jiBGfHXQ==;
	31:gQx7Q/Qy0pl3IdC+361ckCAu05WTcdtOQu97rVWA+5Kmk9BCwl+6hHsy7ASQtuGQMA3rctv5mdLbcrjFckmQWfurEZDB5U0VJohd6fS2ERImC2qmlT3AfcvWhuugMnje7MKL3MV2cO7+miukSlhQhc7RIjOFzRS1GWLAPZ9GoFhBs+9ANIanhkDoNfOtauVFWlE1HfNnNOsYwyayTBaP6xo7VChXRRlLMGF2NHjGVvw=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3420:
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3420;
	20:DmOD1E2spKE3JA0ED9uJRWN05PdRSp3dOwfzo/jNZYUSdSFIuwQLSPy5q1YyTA07LOyvRya0R4clpewfDmg6ASAFWXXyQSeeFf/JWOTlmn064D2JMg2cfOgIRy8DXd9RuSzQGNnKlHQh1WKQ3L9CYU+uMvTV9FUIClDE78jdDUpmU1CxyZkYUsxQlzH82x8hpebcCnD+RyBa4dzfFJ+At/y/zdmRYba0sAPXN1Vala0CqOzackqN49bpseYmCX/gNxp37jSVeMmTz8KsrjC8eNDKWhEZlrv0oD6YoZShuz3wn8llTaaxyNlDqm06D1e5l+ZKJLNsvRZCl+x65fOGq6G/jLEbCiIA6Q2UO1TWwsm6W64+27VU+kyGSVrGDcKNgjE9+G8nkSiAGPFO72P9fPA64C2xI2g3Rkakez44Ufm+VOyqtd3j//ejdS5jVop33injJA1GY0rOcWgBP8ZSHmRXo76u66UDEOovo+Bye/yVT0Rj6v1PAG626muLafEI;
	4:YqiIMNyeTX9dTY3AJYlLPH+OneZVARDhV8MISeT5SlJVFxhlQxJ0Q5uDoPZjwQ01kBw2eY7GqYMO9aM70CTf4H3eAsUYJNhA+LH7/JskD55SLu/YQyaH6mnGRSDxEnujEmrSnt5MLC6GKhm4JRj+3ULJYwqBBkLUdkrmvFlcujExWGxbjhWyZDB4yV0djsNejVT0zZ/+AsdpYJLGE5OboYsyr5doAxqdaLPSGNmgcOqp61lFENuvC53c+AvvdurXbe6MuR3mYWBRqWkCcSYE8Q==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3420C38450A1C88A1D8D4E86AB620@MW2PR0102MB3420.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231254)(944501410)(52105095)(93006095)(93001095)(149027)(150027)(6041310)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3420; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3420; 
X-Forefront-PRVS: 0690E5FF22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(39850400004)(39380400002)(396003)(376002)(366004)(346002)(199004)(189003)(6486002)(65956001)(81156014)(16526019)(81166006)(8676002)(47776003)(6666003)(66066001)(65806001)(229853002)(25786009)(230700001)(53936002)(52146003)(26005)(956004)(76176011)(186003)(486006)(52116002)(2906002)(39060400002)(2616005)(86362001)(31696002)(77096007)(11346002)(53546011)(4326008)(2486003)(446003)(8936002)(59450400001)(476003)(23676004)(305945005)(478600001)(5660300001)(36756003)(67846002)(31686004)(105586002)(106356001)(386003)(6246003)(50466002)(65826007)(58126008)(68736007)(64126003)(3846002)(7736002)(97736004)(6116002)(16576012)(316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3420; H:[10.201.1.39];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNVzJQUjAxMDJNQjM0MjA7MjM6aSsxbXBBN3FqaXVzcW5mNWlGTHJFU2dH?=
	=?utf-8?B?S3ZULzA1UWlxelR2eStDSWxsZHBSdjkydDRvSjhhU2dGU3dnZVVUMTltMSt0?=
	=?utf-8?B?UkNvRHpZaVMrelNpMFlFZGtnU0Q5WUgzd2llNDFmMDNFcFRhcTV6dkFkMFZz?=
	=?utf-8?B?N2hhTVhqNlJUdVBLUVgyeWlhcTZ0MkpaRXZrTE43QmxNTld2UTFqWUF3U3NR?=
	=?utf-8?B?aGkweEhnVXRuMjROcUQrMlBHczdKSXBjS2p1WjNrQ0F5bTZYS25RelBEN0Ry?=
	=?utf-8?B?QUhRbEVzTW8rZTljTFZNcUk1RUoyNjlDM2tPM3NtNHRQVXFjWXNmV3hvZlJj?=
	=?utf-8?B?THhVRjJSbFZYcWhBb0lLNjg0bjZ1OXNOSElIWGxFOTdkMTZZOWNUMTVrVUV1?=
	=?utf-8?B?QVNyTklLUkZPS1FONTA2andxTS9jVndBS0Y0OWNFcVZ6RlYxSjFlYnpoSnoz?=
	=?utf-8?B?UVlrcG1MRVo4ekZwSGVsaE9FcmdVK1Rld0pwSzBpU2JWME83ZURURmQ5c1pn?=
	=?utf-8?B?ZXRwMngwU2RjK0tHcHZ1SG00anRxRjZkRkZsekUxMjdOM2tXU1Z3cGh2Mzcv?=
	=?utf-8?B?NWdIbHFFMmFCRXdJN3VwM04wMmJTYzYvUVhIT0tKZzE4Mkw5Y0xGMFJqUnVk?=
	=?utf-8?B?Z3d6UGx1dGhjUTcyZkxGK09BNzNKR2tXSHVRMWg5VlhUY0pxazBaellmWXh3?=
	=?utf-8?B?dWFvMHFkNmNjZ05aVzZxdmYrejc3VHFxRmg0cm9yaXJnMVViVUgycCtUei9y?=
	=?utf-8?B?dExaZGhhNmV2Y1I4by9SWnJ4V1BNRndXMzhuQ1ZwREN2RTBjcUpuMEhObzZX?=
	=?utf-8?B?THA5ckhmQmdGbjFxQytPNHp2Yy9Mc2xwV1lIVTJHcHhtMExZRGdVQzBQTFkv?=
	=?utf-8?B?NXFLMmlGWnVuVjNCcUpkU3VJZEFPd04wbE5JZ3VOYUZnSktnT045RC9rdDJ4?=
	=?utf-8?B?TTVvdGpRLzlPRHFVT0NYcUlIZnpzNWw3STZOdVZ2QlArUmhkdFJleklRVWhH?=
	=?utf-8?B?ZjJZNHpDTytlOUN0QkQ5dXVKS3dscWZEdjRyYm84NVpzRHoxS0tCelBLZmtV?=
	=?utf-8?B?SGkvcEt3dW5SL0tjT2FNK0JTSTNtWnk2VXIwb0pjUVRPakd3YjNnYjhKNDhT?=
	=?utf-8?B?bE5JWStNZXFCNGpaVzhxZFBNRXZVb01TZXM4S0VzT3NHNFRnMlRUWGZ0L1Vu?=
	=?utf-8?B?MmJ2elVTdXRRRzk5dStSeHZQcFluaElCRWVZdmZOOFNaKzgxUThjeCtkdjg2?=
	=?utf-8?B?N0NxeGw0MmMzS0Y5Sys2MWkwM2VpSWxsL3VoZ3FDcThrdGN3aWNEWXRXZG1x?=
	=?utf-8?B?N2NBZHIrQzN6eERWcGd3bm13Q1JBRzlMcDZNL3R2aFZIQTcxRlBRQWdxNXZm?=
	=?utf-8?B?N3FjMmpNVzFRVzlRYjhLazZVS2QvSW9SUWF4aTVvR3FzQXlIUVd4NERXT255?=
	=?utf-8?B?dzJPNVVrNXMzWjFTNW56d1JTZ05oNHFyM0wxY3haRElLRWJDdWhvVkt5V3pS?=
	=?utf-8?B?Nno0VFY1SEZwQWRYNXRzUUw4MitGbnlsZUhxMXE3eks5dDhLTmVlLzRoODdv?=
	=?utf-8?B?NElQK2tOOGNqVUhrdXZMcDJJdTdWTmg4TnZ1SXN4V3NKZ21jWktCNGkxUDFu?=
	=?utf-8?B?NGNmK2liRFJlbGFDdEpabE9CRStIVVEzdHZJYlk1L1d4TkY4cHNSMzdvU0VW?=
	=?utf-8?B?NlVIZGRYU2VOZEZlRW5qekU3OEVRTVA0Tjl2cjh6Q0N3WVQ0YXFjSUdLRmdM?=
	=?utf-8?B?NTUyQWJPVVBEREZWKzBiRjFZUENHMEUxS1BLQnRDbmg3OUZPV3lFM3FYSnc5?=
	=?utf-8?B?V0x4NEgxVEsvS2Z5anRmMTRoVitYYjh0Zk9vUEhwYjNnU25mblU5WUNweDZ6?=
	=?utf-8?B?MDRjU1F2S2lwaU1XQ3FiTkxITkw1N0M5eXhET05ZV3g4SnY1dmVGeGxYclpv?=
	=?utf-8?B?eWxLYVpRcG5jdDhkZG1UZmFuMVdwU0VuZ1VJblh4aWNPNThCdFZCK2dMbEVT?=
	=?utf-8?Q?6H6UiZzC?=
X-Microsoft-Antispam-Message-Info: 22vApeSQJg5xBglB3PiNYnlVFbx0UdnClMqJLyEsyKAEp4ara4GuRiC8N7SAvz/9PoQxp6JEHa96+VRe8pTwhCDIh/ZmWHHOJYcxq0aMv9X6U285GFWl7ZvxlF0pDyy/Bc4fhRWuXFz6L6hixS9IbBX5x6pP2QICGqYcjGjlFNibvy+QmB6Vb46vZORM4A26
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3420;
	6:iR82ffcnKEedVckThcs2Bvd/u+D4y4LALAt9UuHc4DW2zCP9A7vnSUCAYuasjAeekkrGd0nhalovrj5ik4t7ZtDuFcLEN/IAhy5CJr5IEpEIoNJj53lerajr6+PF7nTVA3QWYldnNaa4ZPoqCySez5vsriYg6Dztg9tJ79cDWRRMLLYgOI55fhAOdRP6dlWvRsrHV609WSBHl0psSumaJ9ty+fjVsTvfs96Nhs84qt0Y6cBISLyeHCKeJWLoPz1tnWvtU+AQr3AOT9Xl7z7BFvWroLGPubQwXKC/SPaiiE/P+EIkONopx2QbYPlMEggdT3/fr6JqX4dqg314m2t/hq9+dLIqvndDcwDjsY+U3verWh+PGPtyAVA+KjSZl6+HzQVbJJeZovG5DdQZcY83vTPWNTWYtkm9FgGsWHK8ki1xuSb626oO5GL+tjWm3SXtVsMicxzSjcUCtxinbmKrGA==;
	5:ydNs6Xp8c4xlclgeFt34ErhvuYEeeCM0fH93ZzZfwYNdljnbnNrskjwkoEhVHvOMWl871Q8vABbs7Vkb9nf6HlVb61Xsi3oTgB9v3Alv5o2dhmvO+bG+ya+iC5cS8TpPJ+UOtutElM8f1/CcQamW9vk6BBH9uLneAmlPXt1VCCc=;
	24:2lZplaBqk4O+TgCJJJzYyjOqyeyjMUlRlPybEDc3xH61D4GZTJlNW+szpOAMsHL9ojCMPNs0RsJWuZz/6SXcROYHhr2PHUP7BEOL7AXyfYk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3420;
	7:WOu8H+DnjMdTXaswxVN+bA38AKotI9nEcbiNt+0QOkvXDBPYG1Y2WuriXpup/BoZlR7UdrN7ENCt4x1oEYiM4mHNv2+4DokVlai/zVL/PrY0BWq6jVPfHBUTynzWuIjVfSeTh8MQlCYjOdDr+whCDngLIEMsxx0of3jHgBv8dF5eO1Ol3gGGRAQPf/fD8Z9I8An5sfg7VZ0YKr9FdbH204X/sbooX0D5uquUA0LkPPNdYsnmzU1NZZeS/ixgRfvE
X-MS-Office365-Filtering-Correlation-Id: 0a80ef9b-0c22-462a-ef63-08d5c80e66f1
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 22:24:12.4709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a80ef9b-0c22-462a-ef63-08d5c80e66f1
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3420
Subject: Re: [PATCH v2 5/7] toolchain-shar-extract: pass env to post-relocate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2018 22:24:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/01/2018 03:08 PM, Joshua Watt wrote:
> On Fri, 2018-06-01 at 14:02 -0700, Martin Kelly wrote:
>> It's useful for the post-relocate scripts to be able to see the SDK
>> environment, for example to see the values of CC, CXX etc. in order
>> to
>> dynamically generate toolchain files.
>>
>> To enable this, source the SDK environment script prior to calling
>> the
>> relocate scripts.
>>
>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> ---
>>   meta/classes/toolchain-scripts.bbclass     | 17 +++++++++++++----
>>   meta/recipes-core/meta/meta-environment.bb |  5 +++--
>>   2 files changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/classes/toolchain-scripts.bbclass
>> b/meta/classes/toolchain-scripts.bbclass
>> index ae7bbef034..5f99fd8c03 100644
>> --- a/meta/classes/toolchain-scripts.bbclass
>> +++ b/meta/classes/toolchain-scripts.bbclass
>> @@ -118,11 +118,20 @@ EOF
>>   }
>>   
>>   toolchain_create_post_relocate_script() {
>> -	script=$1
>> -	rm -f $script
>> -	touch $script
>> +	relocate_script=$1
>> +	sdk_script=$2
>> +	rm -f $relocate_script
>> +	touch $relocate_script
>> +
>> +    cat >> $relocate_script <<EOF
>> +# Source the SDK env script in case it is needed for the relocate
>> scripts.
>> +. $sdk_script
> 
> I had originally done something similar to this when I added support
> for the post-relocate scripts with icecream. However, it is insufficent
> because there can be multiple SDK environment scripts that need to be
> sourced. In order to get a fully correct environment, I had to do:
> 
>   # Setup environment
>   for env_setup_script in `ls $1/environment-setup-*`; do
>   	. $env_setup_script
>   done
> 
> see meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-
> setup.sh
> 
> 

There's one overall "SDK environment" script (the one you source as a 
user to enter the SDK environment), and also customizable ones installed 
by nativesdk-* packages (e.g. one that cmake uses). In this patch, I had 
not intended that post-relocate scripts should be able to see the 
environment scripts for every project but instead just for the global 
SDK enivorment (to get at variables like OECORE_NATIVE_SYSROOT).

Let me know if I have missed something and not including the other 
environments could cause breakage.

Here's what I mean from an example extracted SDK:

martin@columbia:~$ ls /opt/xos/nanopi-neo-plus2/*environment*
/opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-linux

martin@columbia:~$ ls 
/opt/xos/nanopi-neo-plus2/sysroots/x86_64-xevo-linux/environment-setup.d/
cmake.sh

In the above example, we are currently sourcing only 
/opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-linux and not 
cmake.sh.

