Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0055.outbound.protection.outlook.com [104.47.34.55])
	by mail.openembedded.org (Postfix) with ESMTP id 410AD748E7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 18:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=a6f5dLRXqPHWnFeOmL4wH0uopj3ulTJ9TQrApstLYK4=;
	b=DNK3jo45mAx1ZVdxCmuhERs5O5KSKrgUgaM1mMNBIaSMKiKVZvnqiKbjcXaeygN6GT+1Q9ZvQD5igVH7b+C0qnBs9MOkzoAA2wzPH3LkE1nlAxtx93WNQiiXQzcvSDG3PX5XR0Q9blQKBID8SQP6YS6Avp23SNsbPu6baYwuFzA=
Received: from [192.168.0.3] (97.113.238.55) by
	DM5PR0102MB3416.prod.exchangelabs.com (2603:10b6:4:a0::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.13; Mon, 4 Jun 2018 18:10:07 +0000
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-6-mkelly@xevo.com>
	<1fa5f19ad4ac398de0dc6da40c46ead935133dbe.camel@gmail.com>
	<5c2bc7c4-6a79-2775-af6a-30fb6d693296@xevo.com>
	<79a9b2f1db65d8cc4233f93b7b5213d025a6d262.camel@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <0994b61a-1465-e227-81ff-6ef60e055656@xevo.com>
Date: Mon, 4 Jun 2018 11:10:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <79a9b2f1db65d8cc4233f93b7b5213d025a6d262.camel@gmail.com>
X-Originating-IP: [97.113.238.55]
X-ClientProxiedBy: MWHPR13CA0014.namprd13.prod.outlook.com
	(2603:10b6:300:16::24) To DM5PR0102MB3416.prod.exchangelabs.com
	(2603:10b6:4:a0::17)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR0102MB3416; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	3:YNOmH4BfKD/XEIOfY6CqWIEgU592ghKCHH3u5pfqwrNsPpieOU3gR1t0nvQV+XkWAGwakxxpkTnzHvaPoRrZ4gasKF/McSWT4NpXkVcHbDEHHkxQ+X0DKYkV5A/0L2PtL2WZBLPWnSJHYgbLTDHKxqFJL3fQWnUTVsZpJFstCevUs7w6vyY+6I9CK0eQtgLtIkenCfDGJzdyAY6q7s2ihqY99PFymtV5pcwDqiROgFPERS0sfPcJgdus4gVFRouA;
	25:1I8MBN4EJXWIocjXJXcLNYKk4DI0Zhie7e68GJ24e3B2ELrDaFZoi2kESSw/Rr3qy4Ka21maQG27PStsvmQ/mBDxGXuwkSGr4tZKx9Nk5m+kDhsHWIIAjRuXI5OR0CnNXjCvpZebk/cNj79zWUZFUN1vy+TgA/EYDKQJl5E/GbF0Ox1O6sUaSkMog9BRBCRe6JbRayaTND2soVZmr8MOTrvo+4IcygtX0UeWmnzlJzPNOh/Tt77WbszrPlRuch2wMFif+z4sOXKpHt+JH+LEJdXaR8pszB61n5xE/eWt1B8Ij6F8m1hSHaUGOnwMFv6ZpNlgJPZf22WLZnkt4fitcw==;
	31:KUcn2uTvJlnjOJ5xcnWsMUfXBckC5YSHi4ULtZ9HhXqPL2lIaRXBdzOWQWYmD14jcFNpR6nFHfodwZx3BmIIFO43IzFfe4fPMOL+DBCpO6HRoMwFB079OqmJdJ0EkYLDFpEgmdV5o02Z48Gss8BL4hn3gPo0Lxcq+QZ9sICwLXWiAfa4lIbCM+9l0SrGPrfoYtablvCQR5pP4i5EJ/OHUyvdda0pOOL/VZv7VYeluDs=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3416:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	20:M+ub0t1WzHtxm6fMzyFFBCh9umloxcDd9AW+b+Vb/HEG4qUCZw09dINFcl7hy1tE6ZTLptGoA+kCud6LR2BpfH9YcKMhsrBgQb2Vb4h7fm28k0nkHzkcnWiVgP6HB3cJSh/tQZFoEJt8OfokqHfHx5Skk00zerOMi3Xewl379D8Ly2LaGOE7adzidJqwUAz6OYvICYMDAifmTJj7gbhZKqRCwNBQbEd4hn0Qw7+QBT/KVoqCHt8o6S0H+w88TARKP+TijQqA7ujeIKdmrHRgJt2Nf9mVCbaloXxjD5X0JxuVFkRM2qLMqrc0unKkWa56jNaO7PaXj9TQVDaq8UJamF+o9T1bXHRQqXwJKkMT1r+0jyXPsMCej8zGKdSpQ/TFMIlmNYGK45Imka/8hdETh01XV4Eare6rdOdkeNstFvo+KdUG3JKSI4vLu8q0olgaJ/PZi0tfrBhy8D20oGFqcKSljJbZgdNahyVuRUUmlZXjYDNwk+MTeTT7eMHemKsE;
	4:E1zvpzqXEp65CKzYNIIOSphz6JfQV+IOG99QU+4cxJk346vtmg7RDirGgmarPcUPxl76PPnkBpKtuJFwrspWMiWL/Yb5UePv759lIfqMLcPTPXvMOrii1h9fmwT/veUJdDv+XttRkN5kkNQKqqOJeNjdzOgcNcmLL/c3gCqGFHIaNBTtVhh0lN2UQDKCq3uf+aWbmm0+AF+XxHSEVomzabGk8lvnW8tU4Cx1Kj/kF8LLNO8Xr8RIUI/+6TUTyhxiTezv9h4UFOzEggB3m4Fnfg==
X-Microsoft-Antispam-PRVS: <DM5PR0102MB34164F4144B671A737275FA8AB670@DM5PR0102MB3416.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0102MB3416; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3416; 
X-Forefront-PRVS: 069373DFB6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(346002)(396003)(39840400004)(376002)(39380400002)(366004)(189003)(199004)(65806001)(7736002)(31696002)(229853002)(117156002)(16526019)(2906002)(31686004)(230700001)(3846002)(76176011)(67846002)(77096007)(26005)(59450400001)(386003)(93886005)(53546011)(105586002)(52116002)(6116002)(23676004)(64126003)(478600001)(52146003)(65956001)(8676002)(68736007)(66066001)(106356001)(6246003)(305945005)(36756003)(2486003)(86362001)(25786009)(6666003)(11346002)(53936002)(5660300001)(50466002)(2616005)(6486002)(81166006)(81156014)(39060400002)(4326008)(65826007)(8936002)(446003)(97736004)(58126008)(476003)(956004)(47776003)(486006)(316002)(16576012)(186003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3416; H:[192.168.0.3];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDJNQjM0MTY7MjM6SUgrNHFwclZPQ25xbURVVXoxSHJjUG44?=
	=?utf-8?B?UW1YdWMrczcvVkRJd0lqNHRacHJUUnIxUzIzUzBzL1RJUnI2MVQvTWZMWDE3?=
	=?utf-8?B?QU83anJpY2Z2SUVVOFBmYnArd3ZEWUNGdnRUeUpVY0RJWDdBSmd3ZEM1SmY0?=
	=?utf-8?B?dDNadzlxSHZhMU5xZEJpRnhKQVNUNjdNNUQwMjJhaEdoRUorQmZRblhkRVh3?=
	=?utf-8?B?cGZDYis1dGdrRU11TU1VN0tocGVJc0tZYUl0SDRFV0xpVkpRWituVy9zQ0lE?=
	=?utf-8?B?MzlYcEFvai82M085cGlVNGhEVngyT2wzd0h2QVF1Z1Q5a1JMMTFvN3I2bzBz?=
	=?utf-8?B?YzFTTWZRZ0RKY2RtOU4zNXVUVVlWQnhxTXFrU0djb0JZUDMrS2dUeGttRlQz?=
	=?utf-8?B?RCtIZDhhdm14Wkg5c2lmb3J1cnZycU5oci8yTXZaMFhIQnYrY1lDdVFTTXJZ?=
	=?utf-8?B?aUtXSzhXVHVObFB2d25CZFgwQ3EwSy9WNU54a2VYcGZOa1lEQWEvODFzM0px?=
	=?utf-8?B?ZWV4dGVEa3h2THRVSFhSK2xZYmlQNGFVbWtpRUZkMmhWZUZwcGNYY2ZCZTVO?=
	=?utf-8?B?ekNtaVQ3bkRIc2RTRXZ3WXl4MzV3NVkzYndsNXJqaHZSZytRYmxJaTdmMkNh?=
	=?utf-8?B?REJGaXZMb0oxeWRBbTZrTFhqNm9QT0JZUVJnbThicER6M2FRSE9CVGZrMXdu?=
	=?utf-8?B?aWJmQ2QzNjhOdERnSGsyb0ZiUWREcVlsTlI3ZGJUTVFvbzNJYnIwdjZwdGY5?=
	=?utf-8?B?bExXRnI0QWwwVm5ucVpWRlNYYXc4RUpqVkpVaEdoZml1MVdtcmNIbFNPQnYz?=
	=?utf-8?B?Rm9XNklKSkRETzdxWDBvdUhmbVJrb3JPVGRJbTVKdHhnNzdxVFV6cU9DRnZL?=
	=?utf-8?B?cEZFZDkwS2lwN2liUDZ0STZRSjh3N2xsZkFGQWFZT3VVUXV6aGVkYkZrQmJZ?=
	=?utf-8?B?QVRJMDBxQzdsNkVTSXp0aHpNVVQ1T1VnTVN6dWI3M0ErbFdkbEZINWp0N1Qz?=
	=?utf-8?B?a2FDM0NBYUZ3eEhHSllBc2dLNEtSSHBPK1ZCUStnbEsrc0ZwZ3NCODZFN0xO?=
	=?utf-8?B?UGdkTXk4VllFa09qbFA2MWZOektSNEVpakxPSzY5blk2dzBTSmN0ZmlLaGE2?=
	=?utf-8?B?WDFCLytXbmdpNFdXb2lFZnJrNDhaU3o4UFNqZkxHK1A2bkN6Y29aZC9ZOCth?=
	=?utf-8?B?dlZRVTBpUThOWXRzN3JNZDRKaDJJVVNlSnBKUlk1THlHT21DeFZhenlhYjZs?=
	=?utf-8?B?bzFGNlJkeTIwNk10YnNlS2NBU3pPR2QvTGlSekh3ZG1RcHRsRGhhcm54MVMy?=
	=?utf-8?B?VHliNmkrQmRlMHN3dGFUN2pSRWU0SkhtdnhDSlhJZFJUeTJGVkIzRXBWcWdv?=
	=?utf-8?B?ZGJzVnlJNW9PanlHb29qMDMzbUZyT3NNSHpOMkpBa05GdXR2cFd3ZVE1b2dF?=
	=?utf-8?B?ekNaSzMzZG5SK0hTdEhINllhQjdpamRvTU9FRmlVTDgyaFJoeFRGdkVabjR5?=
	=?utf-8?B?NWFleTRZZGU1K3ozR3VkL0E5dU1SOGZ3VTBETmI3SlFjK3NzcTJxWTlGTlVi?=
	=?utf-8?B?QXRKOG81TXBYOElVREx6TVVDS0U4Y3U3R3V1ZlF2MXVvdzQxUUhhaVVHZXBG?=
	=?utf-8?B?dGE1dnZOcjlVTXRldUVTU09hSnh0T3p2T3JERVI0cXVlSnk1dy9LUko4d3hV?=
	=?utf-8?B?QXpnN0ZZVFZrNnpsMHJhY2dlSy8waGcvUjM5Q1lON1pDU0JIUEVZQ3BGTVN0?=
	=?utf-8?B?LzJoWTJIQTQ4T00wNVBHdUN5cU5HQUJ1ZEFkRWdQVkZyQ3ZDRjdRWS9KQlhN?=
	=?utf-8?B?MWRReWN6UVFlTjVaMUQyS3ZabFY4TGNZanpzWGt6Q1ZOMzJtQTUwQmtEcm5V?=
	=?utf-8?B?MXcwZEJSek5hb2Z5OUlPdHR1b2FJd3Byb3BmM0xmaStiZ1FTS2RyN3FRSHJu?=
	=?utf-8?B?Qys3Z3NmWjBmMk1vKzBsNU1jMzh4ZlJlQk1hSmVMRUZicGNQWEJBRTUzRU43?=
	=?utf-8?B?N08zY1VRZVBFbVIwTW9xZFF0elJOYmI1b2Nyam52SnNNMjBLdWlac1ZWcXRh?=
	=?utf-8?Q?SpOuuw=3D?=
X-Microsoft-Antispam-Message-Info: ErmzbOwq8vuvRNhlLOxP8vHGl3nYgFLCooo3bqiM6QrDt1biqpUpCrAmTdHNsj9az4bfF1Fp91cgXwzdYKdsHmb5XXnZp9AGqL5KljiMc0W8sUdXHDGhJWenaz7cDvtfLTtVE93YMckCkRocbyE9PPLQbSTFN3fhggN0pl68CMse0v27GKTZcpS05KiwIAtB
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	6:E5Bbs0+EeZqS6Z6+ypPnn1sHomLViISoPZkJJ3qXKjEl7qVGcroFBsMEcC5btHSYO/fhMn72tmSoZuVpCm5HB36kTsKwlrY+R7d6rQhGGIqZLlEvG4mt8G20qImdxTPCL2hUwSbKxSVJbJ0YLy6B9lED6hW+3Cl/7h1fS3BHSvV+yfub7ekfipApamxybwUhUbrLibn2w2ru3hhJgK9GWcSYywA4ifWViC/9SdUgK3GwdNc9RPZGO8XnOw7nSdwsnfTLDHAjHglLpavmu2fBacjhCCjVdLyHHX4YGKOFF7pP1GBotGrXLK7CoVTJ76+isBDMIZt2cK9F3zuCuhnWWDB3un8pASc3lyFB8FKwQqVMVfP8QEwFY+KHWF/SUeYcsZenlgwm3Qp7n4uggNmQqOVocB2jvXyw2raUw+qP9mpgXHgHln6Y6fVWpEcJsw2S7H239agtP4owIO6jIbTU2Q==;
	5:8RAoIArQlUA4DxsHG7WvZn44QMWW534FEbxdFGAlZSsIGrZ2PAhbkBSPcrgIKI90zZ8OWVV3BneTDjFIYfYQXXKmwj1Z6Y9QVJN89ShRwKxSPMeyXRwPeUT+ItIC3j+0IZxG9J8rhZD8PZhHgKcgi8uYMsk6Y3CvwKAUmWlNQNo=;
	24:4bwLC71WabbaE8x1w57GsZ6okK4ICN+WnLNz7JgY0W83NTeLnHdUUa9KW6dhzahSneecOrwhG/IAUDk/8ANj+zX1c8aNhQVp6GXM/BfRsJo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	7:lGFMJNYJ1Yh0eHrrS7DKpfWFOBSdKk2AaqusXX3xsQDYfvQpWl2Vd1SVhEpgRxx821VuaF2Ad84Ncj2m71v7n+9tif3opb1tWh4H3s+2zwInS6DJPnFg46Oflhx+7RXSjUI1dhyRypnpao8vHKbSlnrugoIwnwH1n3I5c9FrWtRffgLpJ94zvb/NCyRR3CNw62z0+d6K0xmVkvvhhFuYqT7PspOs7ZBB0FlqoE8deZfh1bLa1JLAw/7uPb6xpBmR
X-MS-Office365-Filtering-Correlation-Id: 703b55e6-ba2d-4f32-f4a3-08d5ca4667cd
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2018 18:10:07.8573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 703b55e6-ba2d-4f32-f4a3-08d5ca4667cd
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3416
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
X-List-Received-Date: Mon, 04 Jun 2018 18:24:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/04/2018 10:20 AM, Joshua Watt wrote:
> On Fri, 2018-06-01 at 15:24 -0700, Martin Kelly wrote:
>> On 06/01/2018 03:08 PM, Joshua Watt wrote:
>>> On Fri, 2018-06-01 at 14:02 -0700, Martin Kelly wrote:
>>>> It's useful for the post-relocate scripts to be able to see the
>>>> SDK
>>>> environment, for example to see the values of CC, CXX etc. in
>>>> order
>>>> to
>>>> dynamically generate toolchain files.
>>>>
>>>> To enable this, source the SDK environment script prior to
>>>> calling
>>>> the
>>>> relocate scripts.
>>>>
>>>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>>>> ---
>>>>    meta/classes/toolchain-scripts.bbclass     | 17 +++++++++++++
>>>> ----
>>>>    meta/recipes-core/meta/meta-environment.bb |  5 +++--
>>>>    2 files changed, 16 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/meta/classes/toolchain-scripts.bbclass
>>>> b/meta/classes/toolchain-scripts.bbclass
>>>> index ae7bbef034..5f99fd8c03 100644
>>>> --- a/meta/classes/toolchain-scripts.bbclass
>>>> +++ b/meta/classes/toolchain-scripts.bbclass
>>>> @@ -118,11 +118,20 @@ EOF
>>>>    }
>>>>    
>>>>    toolchain_create_post_relocate_script() {
>>>> -	script=$1
>>>> -	rm -f $script
>>>> -	touch $script
>>>> +	relocate_script=$1
>>>> +	sdk_script=$2
>>>> +	rm -f $relocate_script
>>>> +	touch $relocate_script
>>>> +
>>>> +    cat >> $relocate_script <<EOF
>>>> +# Source the SDK env script in case it is needed for the
>>>> relocate
>>>> scripts.
>>>> +. $sdk_script
>>>
>>> I had originally done something similar to this when I added
>>> support
>>> for the post-relocate scripts with icecream. However, it is
>>> insufficent
>>> because there can be multiple SDK environment scripts that need to
>>> be
>>> sourced. In order to get a fully correct environment, I had to do:
>>>
>>>    # Setup environment
>>>    for env_setup_script in `ls $1/environment-setup-*`; do
>>>    	. $env_setup_script
>>>    done
>>>
>>> see meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-
>>> setup.sh
>>>
>>>
>>
>> There's one overall "SDK environment" script (the one you source as
>> a
>> user to enter the SDK environment), and also customizable ones
>> installed
>> by nativesdk-* packages (e.g. one that cmake uses). In this patch, I
>> had
>> not intended that post-relocate scripts should be able to see the
>> environment scripts for every project but instead just for the
>> global
>> SDK enivorment (to get at variables like OECORE_NATIVE_SYSROOT).
> 
> (Almost) All of the code I can find that deals with the SDK environment
> supports multiple top level environment-setup-* files. If you happen to
> have more than one, the relocation script will relocate all of them
> (meta/files/toolchain-shar-relocate.sh), and the extraction script will
> give you instructions to source them all (meta/files/toolchain-shar-
> extract.sh).
> 
> It's possible this is some left over anachronism and it has no actual
> use, but we should either fix it everywhere else or be consistent here.
> 

OK, that's good to know.

>>
>> Let me know if I have missed something and not including the other
>> environments could cause breakage.
>>
>> Here's what I mean from an example extracted SDK:
>>
>> martin@columbia:~$ ls /opt/xos/nanopi-neo-plus2/*environment*
>> /opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-linux
>>
>> martin@columbia:~$ ls
>> /opt/xos/nanopi-neo-plus2/sysroots/x86_64-xevo-linux/environment-
>> setup.d/
>> cmake.sh
>>
>> In the above example, we are currently sourcing only
>> /opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-linux and
>> not
>> cmake.sh.
> 
> Sort of.... environment-setup-aarch64-poky-linux is going to implicitly
> source the cmake.sh script (see the for loop at the end of the script)
> 

Yes, I see that now. Given that the top-level environment-setup script 
implicitly sources the individual project sh scripts, isn't it correct 
to source only the top-level one? In that way, if the path to the 
individual sh scripts changes, this code won't break, and it leaves the 
top-level script to the single source of truth with regard to 
environment setup scripts.

