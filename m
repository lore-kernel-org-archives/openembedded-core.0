Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0045.outbound.protection.outlook.com [104.47.32.45])
	by mail.openembedded.org (Postfix) with ESMTP id BB856752AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 18:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mMwqnVznT2W+awDMeslJlRIaKFUCxiTup4N+YZQwrSU=;
	b=bMegvLEnpDyGNonDIWT7a1XZdp2CyOkQ4bfph70L3eHzoaq+jM2wTKrHrvhX4GzViVBH74BPP2urCwRCcGnag5iYeiZW14llg0eDxfPAuYLLt0VxevsUHK63cHPjV0/NVjz1VN8Ca8fsDSfoqQG975hkf7LCJH1tCX8y7alicXQ=
Received: from [192.168.0.3] (97.113.238.55) by
	MW2PR0102MB3419.prod.exchangelabs.com (2603:10b6:302:3::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.12; Mon, 4 Jun 2018 18:24:24 +0000
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-6-mkelly@xevo.com>
	<1fa5f19ad4ac398de0dc6da40c46ead935133dbe.camel@gmail.com>
	<5c2bc7c4-6a79-2775-af6a-30fb6d693296@xevo.com>
	<79a9b2f1db65d8cc4233f93b7b5213d025a6d262.camel@gmail.com>
	<0994b61a-1465-e227-81ff-6ef60e055656@xevo.com>
	<e2132fe30522a6ec140f036a244a71d51c476b51.camel@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <d97bdd25-24ee-e7f9-0d11-a99489979e46@xevo.com>
Date: Mon, 4 Jun 2018 11:24:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <e2132fe30522a6ec140f036a244a71d51c476b51.camel@gmail.com>
X-Originating-IP: [97.113.238.55]
X-ClientProxiedBy: MWHPR17CA0059.namprd17.prod.outlook.com
	(2603:10b6:300:93::21) To MW2PR0102MB3419.prod.exchangelabs.com
	(2603:10b6:302:3::12)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3419; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	3:YbQ3qcwRUb4dodb2xa7pZZZSt24UialCfqmtn141NWjawKFu9ZqE1h896b5ZlMnjzMOGFY3qoy+h8YkuDYBJw9ldASJbvKK2Jm/SAj/GdAAgnm4U3RbnZOD1/CLdblqA3y0Q1rs9RNEOkwHoPtC21+dopQDnW1nYIuzwYrB8pJjDzVpkEe22o8Cq/Di8MOlT+e69+4u2cgLU/L+E81AnMkAz0xqQshnk+oKjZHwoE+AZ1GETLcHEz1Z1tL78c8T9;
	25:/j8r6fUoyI8KqgWd1ZmLrHi3ckhM64Nk5IpF/IaMWyA3cH9YwQmiA7ZTnxUt+xNds5rraWC01Mp8Mtq/TapkbQraqSzb0fHTciFbCwjoeW2g/+6bVqMMmU+y35WpMV6XEN1u+SLAqp/M/Alp4Bkq5K0uS10LUtzeWwAYX3WlKLRcIwQSRuvDHCKmoZ2fCBcEhpxqPrhZG7sDMEMTJJa9sDgCP6gRnQeRRoxijXwVjZyNIJsB5d5u/sIlTfaFbFs5firPQ5wTyNSF2lN2spgpwpTeacqRreq+PD4wZesbjRt35mXgPHu+eWLHTEuBXK/2K2Gc6zhzr+BwnqYI39kd3w==;
	31:FlFVn6CjmpG38B+IR4bH+t4ODUE8/NYsxZKybLqb5F/YaKV9akN2v/ABYxztvR4c4suxHu+Vt6gj9VjPf5gVZCfzpjZDXVwIN8IGif0pU7aCf70ZaVMQxm5C6QQO374CF9T1kx+2XGhnGGhrJboOzvxckuBt3PIQh35mhzmKg0kTqTmYV5wL7NYHDMjmW4rw3QQWe4XI5t2dvc/m8c8qNvWBEe+1PL1UN2rhZ4Y+QIw=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3419:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	20:f81x5al6XSbuntE91dqQ+CedN/izXEp6rtcDSttcKduv/Ur7+yhLeHUlwklnvHkThOB8gZB1ji5GX7DeE/WTenUEP6xJOhUSRnaRBx/LSslk7xNF6x+Evp1A6c597GjBxTgrbWJQAQdGttKeqJVEBUOIPM5yWDnc4FtXWLzJI0m2EE/LwHc1D26xBHJV1NhhNIhWexvyHvOUAYsr5Rga4D5cMvYYHRdWEy+jg4RWKbaZ0CMt/o2BBCHiNOeNyAb7qGkceCKxE45WxsEJ95DifhpBlKhKq/pSRICTCCTOCsmDr2QRJ7EOGpX9CRBEv6SLPOi/aT1BRSeX/+Rt1ilYSgX6xnCvw4Wu2WYZ18rtr5C4cXlb1MKgosucp81XkUhIldI314+vgKwLABkezm9XtrP+OpdQefmqm+KO8PzNj8+MybR2YU1DR9LoZSMeKlW8tNuF+1wohpKUlkA0RtFWcJijuIUpP+H4iZO2b7u+0TlRr7hazWs7C6ce86fyVmyR;
	4:Bxdy24K7UvxJUgW0hg0vDNz37mminG+pWT7HeIpeyAwQbTKuuZ8G3lXKRH/nutk7taNDMH+gqZnpuQ7xczrUrR9HsDtnvFhQfKVVVOuKMaT2eZwJn8Q2BwVRpnLIm++b6imD2V6BdWLjvuq+5qyZrdXi65thWVpQ2ggc1ig70Ei+snrYotioLBup4qIOEBVb69i593hmItsP3VCjm8MKPYY3GT5PpKJa5Y0i3KvY5FpSHI3OqrNQCrrPVku1/pae/aQshdfyxkKZ+l9VubjTZQ==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34195FF5BF9BEF877359C1D4AB670@MW2PR0102MB3419.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231254)(944501410)(52105095)(10201501046)(3002001)(149027)(150027)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3419; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3419; 
X-Forefront-PRVS: 069373DFB6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(376002)(346002)(396003)(39840400004)(366004)(39380400002)(189003)(199004)(97736004)(26005)(50466002)(8936002)(7736002)(86362001)(386003)(53546011)(76176011)(6666003)(4326008)(16526019)(186003)(305945005)(59450400001)(81156014)(81166006)(77096007)(31696002)(39060400002)(6246003)(117156002)(11346002)(68736007)(478600001)(3846002)(6116002)(446003)(23676004)(2486003)(52146003)(52116002)(2616005)(476003)(956004)(105586002)(16576012)(2906002)(6486002)(486006)(25786009)(31686004)(230700001)(53936002)(93886005)(47776003)(66066001)(65956001)(65806001)(316002)(67846002)(58126008)(229853002)(8676002)(5660300001)(65826007)(36756003)(106356001)(64126003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3419; H:[192.168.0.3];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNVzJQUjAxMDJNQjM0MTk7MjM6K3lyNVBGOWFwUVkrRW13Q0ZhMzdyODFI?=
	=?utf-8?B?cmZiVkxVZk5kcS9scmdxbmgwd21Zbktxa0o2RDZaL1RmaGY4MDRGNjQyRkQ5?=
	=?utf-8?B?WUszMXAxbUI3R1ExdW1sRUxCTWgrT2pSdU02SzNrdTU3ZTg3cjgwRFBoY2NX?=
	=?utf-8?B?NUM5MlozZDNwWWUvdUVkUThqNUVCQVZJOEdDaExEYjFBeHlmV1Fjd0pkaDdR?=
	=?utf-8?B?K1pQMnBRTHNka3dnQ1RMazhPajBUaElSMldzRkQrUGlkczBrYnkzTmtnRHhW?=
	=?utf-8?B?R1FFRjNkY1drMnFjbWNTVUtpWUxOYW9KTU5zNWJBbCtET1Q5V2FuZFpwZ0Yz?=
	=?utf-8?B?b21zdENZUFlTL3UvbytrSko4N3hVQ2lEU2YvT3cwM2VOekJLanJ1Yy85Vzlq?=
	=?utf-8?B?K0VRWUs4MkhXc3VrbStOTjhXZUxRdlh5Q2Y4bERKNWV1K0xJanFUSStqVzYz?=
	=?utf-8?B?TVE1K0tZV2RuVGo2YkFRWEsxVlFBQ1FkK01QbSttRzZSUUhSQjA2ekQ4Nkk0?=
	=?utf-8?B?MThQZCtESlZqQ3REenFhbngzMlZXNGl4R2RtSHdaS1hBcnVDNGpMeDl5NWx2?=
	=?utf-8?B?YWFma1dhZ25iMm5nZkdObUVJRHhqSmZCV2dxZFFSK25EM2JPWTNaNlhtVEZ2?=
	=?utf-8?B?UURHaCtaSTFqKzNDZ2NyaGVoV2E2Z0x4U0xIL2kyY2ZIaWlvWFF6YTRISTZM?=
	=?utf-8?B?MDV6U2N0WHVYWUlDY3ExUFloYXpwQnZwM0U2dzdVeXBscXB2cTBrUTV5ajBE?=
	=?utf-8?B?cHRBNmMwM0s1Lzc2UFN3ZDFlTXpoenF3aHhFQ09ZVTdVbUdsdTlUaHQ1bDF3?=
	=?utf-8?B?SGFwTUdnRHRaeVRvbmpkQzVGTTltcEdCU2l0SXA0UXdUbnNCY2VWZUJ0WnJa?=
	=?utf-8?B?NUgzTzQxQk1yb09RMFl4TEp5eEVKZk5jUGUyT2haL0pKL05yTkhrdFBJbnhX?=
	=?utf-8?B?UWJDUGZOZ1I0Z2xPS05QMmlCaU5uVTBDRHFUdEE4SnptNWg0QmlTSWVmTFdx?=
	=?utf-8?B?MzZ6aGpiTVYzN3NsQno4bFh3V0hBckFrdEtOQmw3dzVnVU1WaVkzaVZ2MTRn?=
	=?utf-8?B?alVtUkdYQ0NyaVVSNDlGL1IwQWNmbzMrWnIxZTFtMFVzalpPajFQeEM0bm51?=
	=?utf-8?B?a3RRTFA3VnJ4aGJoZ3NsVTBQY2pvcndqQWliczM1L09yTlByMlRCYjFJUURj?=
	=?utf-8?B?ck9XV2dnbkhqZW50bnZ0bVduS2YyVzIxTE4rOGpEMGN5SUJmZ3MvdURZU0t4?=
	=?utf-8?B?SDNldkduZUVFRGdFN0c4c1c0Vjhjc3U1QThSL1VOZitaMnpLN04yUUYxR2o3?=
	=?utf-8?B?elhReWNGem91WmpkY2tCQmgxS3prVldHUmN0WlFzNjFHV0o3UmVzWk51MDdl?=
	=?utf-8?B?R21vdkFTR3hWZUd4bGpOOWljdzBUOTVmb2JhNnBPblFTMU11Nm1qRDJIbFZ0?=
	=?utf-8?B?YkU4cExEQklsbUdQbUtQV0tqa3hPWXVlV0JrTElLbU1GY2UvMG5KTiswRlhJ?=
	=?utf-8?B?Zkx2NW4yUExmSml3dTZQeHl0WklyNG54T2w1Um95WEFVNDcwSjJpSUtVaFNa?=
	=?utf-8?B?dExONFR3OHBobDl0UmU2WXhNeUppRkxGamFzeHF0M2NreHY0K0RSUG5xV2tn?=
	=?utf-8?B?V1dQOCt1Y1g3RjRrbC9jbnBnYkw0OVdOMUUwZDVIdy9BNlQ3aEVjOWdPT0RY?=
	=?utf-8?B?Mm54WjR4NE4yL0h0NzhwTCtqSklDOFFCbWRCN2V1dStIeUhySlZLcGJ5aW8w?=
	=?utf-8?B?dFV1dGJnMmxvSkF1K3NFM1VsSEJONVhNbjdLVXN3dkRTQkpRWTlSc0gzbGpI?=
	=?utf-8?B?VzNkekkyTXBRYStnRCtrYVp0QnRPM1grUWZueHMvSktrQWg1RWU5NnZYZzVR?=
	=?utf-8?B?alR4MVRyUGFBQkNOUEhDN1BUYVRoNDN0KytVamJrL2NkaEZydkRsRTNPTkUw?=
	=?utf-8?B?L2hwSStFVDRhaDduQUtQR0hKQXhPd1Z4Q1ZIeGg1SHQzUVBkMWxtVFl4cmts?=
	=?utf-8?B?Y0gvQUlESzVZcVMxOVBLdndqSnZsZXdoVUFhbmlFVVVYd0t2cFAwWkFZbmlh?=
	=?utf-8?Q?qDwKfc=3D?=
X-Microsoft-Antispam-Message-Info: QpW2LkVxmDDIHu/imobRxdqn7LKQtqtdCPw6bNROMZINWvR+EwghLXXajAeT4r+KgFJufi74eSyERtSNYYK5MzhUoL+p4T6S+Ef1TWswH/zopPTOPDWxv729U2STBw4OS4N2Ab2tFg7jg3fneBYtIus9aFvWS03pkZtVsNLNlzNTPQlUASytVJRRpf+lXtqO
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	6:2q9J7rQsJBhGfay+akPy8DTUJZquJkW6X6Y1aZaYn1SQq0NzlEHEuENmWOhLKUTlNtC+D+a+qwMYhdFTBuylw0xYGFjNsEwGAMC7S/FmZ0rnVfq2ax2ymVcVrFhPeiH42ENj/WSMm2OWW3dJgJtWS4/Tpm0mxqE/YePiaSmG3x8vPPjaLoACxKFykAdYxj9Bms/zwYnlF81okN+ATnEkBDO7G++7/Tw4hIZK2rPXmw3w1qngCI/GvKvj/qfGSkFWSE+AZBf6/1PiBY5hXiSzh8rwDBz/Z92r6yGZYknDHUVB5PUV2LOufCrMPbsTdb47Juxdvqib8WG4nvY7PEjxPAya/QTWucghnpMiIVe3n5ROAHvulXUjME8RWEAad3+GEfS1uE5bUu+Y8JDn+jvjF0EvPyGeH5dofv/bPwzokCYWT70nAqChGkQj/z7lnrajgWCBdHV8njX90ZLwEfLkcw==;
	5:0qZkISKJz7/v63aVJf8Uj9iWLrA3sqOW2hJ8l1mlkdetWJv89wN6WNjXPw86M7Zt8z73jkLMC+UZNd8/pj58/t28fEzvSEiOr2R1+3bOzOKsHkiLSZWrwk83B1WwugNClB5YJ04ywf+EvIX4pPzjTxYnSn/qnGXiaj71j8KU5uM=;
	24:/ObeoshQniS/kAqta6O5crfhWJqTY61EThg6T8k499d5LjU+i3z6AuUNrTQXzIHxx4Mzq8kFhaaBafeKnuEEZPzk7zgSJ/B2g/2TSZ/uCu0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	7:3tOvFzQCyZFAQKClGg2qQ/RK0udpqWq/iSa5jjKtOqaSmxAv3BhWIeaIGIp+pknd0I1R06dUcsjw1Kd1rd4Gf+l5rf85pwMFQ/2BzT3KFFjShj77oM6ByWrUc4ZUmf3ZJu4QTaDooLIAYYRgpQtX/0PAFGU+dHhYGyvMTb0tEtlPUnj55WpRZ6CWNacv2KjHV0mvzM/QNjn+lDvFSyMwVYv4GySKxIxntyla4KzDm5Ksfxz1DW7Ux/mrwv3xH+YY
X-MS-Office365-Filtering-Correlation-Id: e181a353-8eb3-46fe-69c0-08d5ca486634
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2018 18:24:24.3335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e181a353-8eb3-46fe-69c0-08d5ca486634
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3419
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
X-List-Received-Date: Mon, 04 Jun 2018 18:39:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/04/2018 11:20 AM, Joshua Watt wrote:
> On Mon, 2018-06-04 at 11:10 -0700, Martin Kelly wrote:
>> On 06/04/2018 10:20 AM, Joshua Watt wrote:
>>> On Fri, 2018-06-01 at 15:24 -0700, Martin Kelly wrote:
>>>> On 06/01/2018 03:08 PM, Joshua Watt wrote:
>>>>> On Fri, 2018-06-01 at 14:02 -0700, Martin Kelly wrote:
>>>>>> It's useful for the post-relocate scripts to be able to see
>>>>>> the
>>>>>> SDK
>>>>>> environment, for example to see the values of CC, CXX etc. in
>>>>>> order
>>>>>> to
>>>>>> dynamically generate toolchain files.
>>>>>>
>>>>>> To enable this, source the SDK environment script prior to
>>>>>> calling
>>>>>> the
>>>>>> relocate scripts.
>>>>>>
>>>>>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>>>>>> ---
>>>>>>     meta/classes/toolchain-scripts.bbclass     | 17
>>>>>> +++++++++++++
>>>>>> ----
>>>>>>     meta/recipes-core/meta/meta-environment.bb |  5 +++--
>>>>>>     2 files changed, 16 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/classes/toolchain-scripts.bbclass
>>>>>> b/meta/classes/toolchain-scripts.bbclass
>>>>>> index ae7bbef034..5f99fd8c03 100644
>>>>>> --- a/meta/classes/toolchain-scripts.bbclass
>>>>>> +++ b/meta/classes/toolchain-scripts.bbclass
>>>>>> @@ -118,11 +118,20 @@ EOF
>>>>>>     }
>>>>>>     
>>>>>>     toolchain_create_post_relocate_script() {
>>>>>> -	script=$1
>>>>>> -	rm -f $script
>>>>>> -	touch $script
>>>>>> +	relocate_script=$1
>>>>>> +	sdk_script=$2
>>>>>> +	rm -f $relocate_script
>>>>>> +	touch $relocate_script
>>>>>> +
>>>>>> +    cat >> $relocate_script <<EOF
>>>>>> +# Source the SDK env script in case it is needed for the
>>>>>> relocate
>>>>>> scripts.
>>>>>> +. $sdk_script
>>>>>
>>>>> I had originally done something similar to this when I added
>>>>> support
>>>>> for the post-relocate scripts with icecream. However, it is
>>>>> insufficent
>>>>> because there can be multiple SDK environment scripts that need
>>>>> to
>>>>> be
>>>>> sourced. In order to get a fully correct environment, I had to
>>>>> do:
>>>>>
>>>>>     # Setup environment
>>>>>     for env_setup_script in `ls $1/environment-setup-*`; do
>>>>>     	. $env_setup_script
>>>>>     done
>>>>>
>>>>> see meta/recipes-devtools/icecc-toolchain/icecc-
>>>>> toolchain/icecc-
>>>>> setup.sh
>>>>>
>>>>>
>>>>
>>>> There's one overall "SDK environment" script (the one you source
>>>> as
>>>> a
>>>> user to enter the SDK environment), and also customizable ones
>>>> installed
>>>> by nativesdk-* packages (e.g. one that cmake uses). In this
>>>> patch, I
>>>> had
>>>> not intended that post-relocate scripts should be able to see the
>>>> environment scripts for every project but instead just for the
>>>> global
>>>> SDK enivorment (to get at variables like OECORE_NATIVE_SYSROOT).
>>>
>>> (Almost) All of the code I can find that deals with the SDK
>>> environment
>>> supports multiple top level environment-setup-* files. If you
>>> happen to
>>> have more than one, the relocation script will relocate all of them
>>> (meta/files/toolchain-shar-relocate.sh), and the extraction script
>>> will
>>> give you instructions to source them all (meta/files/toolchain-
>>> shar-
>>> extract.sh).
>>>
>>> It's possible this is some left over anachronism and it has no
>>> actual
>>> use, but we should either fix it everywhere else or be consistent
>>> here.
>>>
>>
>> OK, that's good to know.
>>
>>>>
>>>> Let me know if I have missed something and not including the
>>>> other
>>>> environments could cause breakage.
>>>>
>>>> Here's what I mean from an example extracted SDK:
>>>>
>>>> martin@columbia:~$ ls /opt/xos/nanopi-neo-plus2/*environment*
>>>> /opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-linux
>>>>
>>>> martin@columbia:~$ ls
>>>> /opt/xos/nanopi-neo-plus2/sysroots/x86_64-xevo-linux/environment-
>>>> setup.d/
>>>> cmake.sh
>>>>
>>>> In the above example, we are currently sourcing only
>>>> /opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-linux
>>>> and
>>>> not
>>>> cmake.sh.
>>>
>>> Sort of.... environment-setup-aarch64-poky-linux is going to
>>> implicitly
>>> source the cmake.sh script (see the for loop at the end of the
>>> script)
>>>
>>
>> Yes, I see that now. Given that the top-level environment-setup
>> script
>> implicitly sources the individual project sh scripts, isn't it
>> correct
>> to source only the top-level one? In that way, if the path to the
>> individual sh scripts changes, this code won't break, and it leaves
>> the
>> top-level script to the single source of truth with regard to
>> environment setup scripts.
> 
> Yes I agree. I think there was some miscommunication, I wasn't
> suggesting that we should be sourcing those manually. I just wanted to
> handle the top level environment-setup-* scripts in a consistent manner
> to the rest of the code (i.e. make sure we source all of them).
> 

OK, before I move to the next revision, let me make sure I understand 
you correctly:

- There may be multiple top-level environment setup scripts.

- The environment setup script that is always created 
(environment-setup-aarch64-poky-linux in our example) sources all the 
project-specific files.

- Thus, we should source all top-level environment scripts, but not any 
project-specific ones, as they will be pulled in implicitly.

Is that correct?

