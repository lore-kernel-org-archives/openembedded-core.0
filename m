Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0072.outbound.protection.outlook.com [104.47.41.72])
	by mail.openembedded.org (Postfix) with ESMTP id 0C28975068
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 22:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LRSNGXGKwmqAboYWJmAv9Fg+z0ZYCnJqug1boH8X5D8=;
	b=FtzEBc+50Q1W2Fha/l19ySFFnthcxtx7a/FfPcgBPGtU5qsnvArSLpJzKjDgQCX+iNsZLOgB8NKEv8RAQN4sf1QOG4DGzT4PKYn7CfOVHXX/Ussr0+m+QbKys3biD8iaSWzf2ZkMAY/n9HUWy8uN+X/NyM3qhFYT4AYVzlxpbpA=
Received: from [10.201.1.39] (65.122.179.226) by
	MW2PR0102MB3419.prod.exchangelabs.com (2603:10b6:302:3::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.12; Fri, 1 Jun 2018 22:00:07 +0000
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-5-mkelly@xevo.com>
	<7168144860e220ae47cefe9df0af760e095d62c9.camel@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <2e145089-67f6-4b01-11ba-62a54e08dbc2@xevo.com>
Date: Fri, 1 Jun 2018 15:00:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <7168144860e220ae47cefe9df0af760e095d62c9.camel@gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR22CA0018.namprd22.prod.outlook.com
	(2603:10b6:300:ef::28) To MW2PR0102MB3419.prod.exchangelabs.com
	(2603:10b6:302:3::12)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3419; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	3:nEZLEVJuSthADblaLeZp5W2LAYeIrkfVnpnbdp8OTwDiXLCkac65AAWpndEd4/e/Vj+XkdhWc+5wzQu+kAeDhtd7PvZ/3d0CW5GkWxaadMVPs+Rh5zXOqY/6eg1MFXE66aqdTsD93OSf2ZKnK4OPja/hIaXTNIiFjkxMrsbs9HaE18iwsW3siHQZGondxyYcL5wbfr4uqrpxL5FKQ4mPUlmUHNPLBXgWYwJx+jxw8otKdoJAaBXsDD17ccJberxB;
	25:gqrgRJrTdCCa8WyrTtz9GDm9Ck5f312/z2xTltqkJoNXZnBASacB2jh5muU8ajurRA8niBRn4Lt1ttMsHogIphd3GO7Z/c5opkwnPhjhE7p6+JmG0Zry6wUlul5V3O7hWZBZ+lwgKhwzYEJzbSLfDT4oQNCkTfZwiEUqnSh3vOFAsDoqdyPXvf2MvkqAHoBOJbJbyKc8h2sj++rQyn1kg1WWULf9ryGEaqbRleUJAOcghp7z4p435h1B2R8aRsbePXsZZJsCn6BgvGgbxegWPZRFsU+sUayRehwxOSjMYAmikq8CuPNixuT2xB8ft8tcFpasT0yR3Amt0qL/5tEssw==;
	31:cPMYH01frsfIlqtoHyd9DjL9eq+O6V2hOZ7n/ADEgMBk2IyAWDTXUgmbesbWomrev4CPQWg19I9fhpsGKgPhs29H8XK9RhZXyM9P4+aUtYhE7M6NMMenKavvgJyz15EejzmGbdKgBNb/DeqFatewtgKsChbq2tNH8L95J3+KKdhS9zPGZz9LINsGjqrYh/qO1i1Wnk23aqEVtt8EoxIcKdu5YCILUViKsNiZwQk3aus=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3419:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	20:87hIgmgWSldUd2OojzZlqJ6bB7QFztGNEinscmCcZlqMb1nDrDnkfZ+iaDr6puAcRpGb1dkl28+Pj1eH8ieTP3ZeMxbh7P+SeE2hIpF7Mfl2T7G9t1NyswDiqnK5v8Tg/PFlBlcEgJayyV6yRcGcK35YYpfIASqjDUcm/saj4996G52mU4HdzS0yhiH25j+azqA01Tpn3INvRypZUk9/rxLdhMTDi/KAC8sfoVG4UX4q0K+3KpQRl3MdgVjTPq5HBYwZmnj7h3i8TX2xC91p4a19TxZTU3kLMas49Eyetr8dYtUirfjjKSplxhOLvyrwsW70ZU1CE4lHyIcZ+yhBCG5s204CffIppMg00sa9j2A0vesUbDuL068gvzWVuMAIMBS6pUv/N7t3o0LmXlnD5AVNudFnzMNG4snnD7scEmJ4mvZmwwlOwwv+6si2UeIxEBX75bpJuWmClCxrwe2LU4zaR2GfLCye+HIy+rqU6a+4WBWltg1hHjDjWTmpARWl;
	4:6N8zde53j55T+OZp9bp9CeCUpKPlu4LOMu+//VfVu0tEm7iZ//PRnO3QjyjL6hIcPGMVCYbwreBhsDCD7+7UaiS+YIs1qJrtU1fF1qqOp9cRfhDrJioNeHjE4uoxokOTULx8TSuSGLmT+R5PlhclNyWRiDx5RdjyC6daw4h1jdsxA5OrXrL9fUjdmzfI5CfAm7wRs/JGwXJ4iBfOkxBtBX3cK0hK6+7Uiir3fB9Yid//Xw3wSmkZK9tr3mraCu2eXxyFDag77bq4wte5sIB34g==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3419770EAAC27E0E0484DB1EAB620@MW2PR0102MB3419.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3419; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3419; 
X-Forefront-PRVS: 0690E5FF22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(979002)(6049001)(396003)(366004)(39850400004)(376002)(39380400002)(346002)(189003)(199004)(68736007)(36756003)(230700001)(3846002)(6116002)(6666003)(64126003)(50466002)(66066001)(229853002)(47776003)(5660300001)(65826007)(105586002)(106356001)(6486002)(65956001)(65806001)(86362001)(97736004)(446003)(2616005)(476003)(11346002)(31686004)(316002)(16576012)(25786009)(486006)(16526019)(956004)(4326008)(478600001)(6246003)(58126008)(39060400002)(186003)(67846002)(53936002)(386003)(76176011)(8676002)(23676004)(52116002)(52146003)(2906002)(77096007)(7736002)(2486003)(81166006)(31696002)(26005)(53546011)(81156014)(8936002)(305945005)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3419; H:[10.201.1.39];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNVzJQUjAxMDJNQjM0MTk7MjM6WHRPSUVrcm5XaUpwTzJQNlpJenVjMkt4?=
	=?utf-8?B?TVhkdm92QStraHZXY2JheWx2d2xTL1hzejM3U1Q3ajdDWTNWQjYxSllmZ1ZD?=
	=?utf-8?B?ajhHTWc5M3IzUHl3RkxSTFR1TmxzSEZmZTBBUHdHRnU1WFl4K0FrVHQ5R095?=
	=?utf-8?B?ZWw0alVEemE4VXlVaHZTVnpBTDJlMVlRbXdzU0VjZGFPam5pczJQZTRsSTlC?=
	=?utf-8?B?RDFqZW9zMngxNXFLVExoZWpCakM3OEw4Zlo4OE92WnlBUkF2MjZ6R3BldHl5?=
	=?utf-8?B?cWFKRWlNbEZpeElBaW13SlZtZ3FKT3Jndko1ZFNicmNZQ3VzL1ZHZ0d2cXFV?=
	=?utf-8?B?amtuNWxkNkRaK1hCUmF6akViRlRDK0JkdURUVnNLNGdTamdvZmpWcEMxb3NX?=
	=?utf-8?B?NWIyaHVOTlFRMkYzSVBkazlzSVJCZmQwejJ4ci9rRjNNZU04cjNSTmlKL3E1?=
	=?utf-8?B?TFRaUTFKZklzOElzSlg3eWQ5ZzB6YW9kc2h1UjkyUWwvMm5TQXhILzdwbnV1?=
	=?utf-8?B?cER1TG9MeitNd3lZWXkxNjk3SmdmdFQzb1ZpM1Y4WHZaQlZTSllFaTFhTEtD?=
	=?utf-8?B?Zi9VSDQvUVlUNGp3b0R5bU1hOXdURFNWMGdEd1pPTFJKc3JtdGpRVzJuMS9j?=
	=?utf-8?B?d0RhN2diYlhLTHpISkgyR1gzNW5oSjlkTG9tUjhzV0hIdTJiMEVka0piN1Vw?=
	=?utf-8?B?VmtIZ2YxVGRGVG0wWnJ3RXpLazQ0QkU4QmtHcUZhdzA4UndIWDVWNXlCVUtm?=
	=?utf-8?B?MnB2K296MlZDcHpEMjhPOGI5NnhRT1ZmazBGT1RQRllQY3E0aWFoMmpHdGNu?=
	=?utf-8?B?clJLYWlacmhWVHYyVVpEN3pJZlJkdTZBUTNkUC8wTmRXMEYvMkI2WFIvNllX?=
	=?utf-8?B?azlOMzFQbnhGcmZxQlZ6c0FCZXR4ZVhMZlpnVEhmdjY4Sy9RU1NoWXduTWp2?=
	=?utf-8?B?Z21mZW1nTWc3Q25wRVR2aTlsWjhwSjM1Rm9CU3RacFJ6K0xyY25WeDlKWkhP?=
	=?utf-8?B?bVViVlZFdFpzcTlGR3gvSGJSZE9mUFpNRGFOOU8vRjdYVjZ1WmY2QlYxMkVS?=
	=?utf-8?B?Smh1VUhIWGlKMUxmSldiRXBSR0d0bUR0MVZrRWVabEdyVmVWejVXOTQ5Y3Ro?=
	=?utf-8?B?aE1hVGJRYUF3R1dKRStXdXBhNjl5M0JYdHlJejlkY0RsWkFjYWQ1RDRYMnNZ?=
	=?utf-8?B?akJYN3g2OFlvKzlBZGdNOFBkdW8ycmtyWnFsTURVN2NEQVRDcTkrY0tsbDVF?=
	=?utf-8?B?WGVyQ09iWFdvcVNYUzB5eW9aOGFqN3JtR2h0a096bW5KaUUvNmordUVjbzFP?=
	=?utf-8?B?Q3ExVEhFeHZ3QkdNOWs4SDJreGpCRUxNOEJvV1VmNmtyNUZEaGdBS2JGdEpt?=
	=?utf-8?B?TWJXckdYZDBNNWhPZkVrMXZNSkgwSmY2VVZzSWhtbjJ4aGRCOCticEpJUU5r?=
	=?utf-8?B?Ly9ubHRGbW1xbnJER2dtRElyZ3Y1WmVEKzlKRU5oYVF6Ry94Y3V2OFVZL0NZ?=
	=?utf-8?B?bVlhdjAyaUZCYloyZy9LSU5SNjh0ZHoxTXVGZEpVSGhPdTk4MGNiZWxoVkRG?=
	=?utf-8?B?dlhBVjBhYStFZWF3YU5QZktOcTN3VTNqQzFETzJMRERKZFQwUHNDYTZhT3dm?=
	=?utf-8?B?Z1JVbnlRRWlFb21RdFB3bml1TVA3eXE4aVVEM1JlY0JtTzRXaGZ4YXhJQzFy?=
	=?utf-8?B?RmZrY1Erb1hPNjZ2cEtuSTFuMStvYVNadkR3a2dvMGhIeTNSOWtIckFBZVRs?=
	=?utf-8?B?eU41OHJSNmRiWTFvbUVDNW9xK3JjUW9OQzhnR2NKa2ZrQkRvYTFpazBDNUtR?=
	=?utf-8?B?cjVSekhJTTljSkk4WG9xbFVNRDBOTklQdDhNTFlWaUZKekRoV2lvMDc5T2pD?=
	=?utf-8?B?MGwxekx3SUM5R2NpNFdqbmZMaXIzbzFEeGdJSVBrVmFBWjQ0U205VTFJTUpG?=
	=?utf-8?B?Qk5BMDVEVjNjQzl3OFB2U204LzhJSDQvWDNzS2lKc0RVVEo1MjhQakxxcndF?=
	=?utf-8?B?MkJoUXhIU1FKUVVNRzFGdlVONTE2ZGkzRFZJMVJsMFUwR0RDU2ZPaGJzSmVM?=
	=?utf-8?Q?AqjxedFUOdUs3SUPeWjyuM8LyNU?=
X-Microsoft-Antispam-Message-Info: WtvXz1cfNcAKoi0BmZ4A+CDMd61spq19thRjYjidiYQU0g9CkES0j2KRVkjBuPto4Zwn+IuzAvpXRUEc/ig14K4cfTYdVU1L3D+YGrFExRZ6MOmluYtmyknfimUS0PWgYSPpISK+Orli8ykljLGSfo9DNlv03ar57wKAnm7uMYJcv41N5lmBTKyYZTeAbkad
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	6:9uJJ4NpyWV8zQHvLiH6Mfq5t1M8RBp5kKuL35gxvZCp1+qoZUZS4qChRDh1l4LgCCpxcbPRuMzQ1B3yCnmFQerxa2ZpI85plpETjJJN2uJMtGfUPXJyl3NIXu2RP0rjmLwXNX8UdypS9g8IM4jUBKunxQPExuArNaSOMKNUK30gZuHGpTgZuSRPkb7LoVRxFMNDR3C6HLR849SKJW7p0QSTQbBmc2ErYwkaXuYVZfKVPyKISgU6MiDtSgZ5hOTya2St+lS+K0rdfT35kUtAnPPAvLtq6FT07IdvfmOsGG6yaRqJnkyTJxQ4fSzRbwpCIInBy5aCZfBAEtPrDcefUtQYp1ilx6yfzATi4ejpWifaYTe5OQfygTpQSmvqvIcPymPbS0C6nkZEFzOHrbLdGIqZY9mEJTYcA1+LRZDEjRGB0brXZhpaYaF1xcuJYrmqxNuDkI19gJHLdN6AUEE+4iQ==;
	5:ibGDrqVGteJzQzDiE0dRiIwUVA37LmqtmbJ7QPeLZyPzyo/eHCoArcsAPAXEyFx+TwEPuBy+ciGv4NCqhZWrm/dagg27rDvDsh6kndWJkGabRM9owMIqBEGWfO8hsddJgvqjDq+9rJfJOgHWSE7oBra4R0leibE5LZ/m9ir3Lqc=;
	24:6R5lJgzhnacwe9+8TVxBYaidPNiIare/wEsePhT6is7x7s+1lbty8GBvwd+eZ3TYjHL6UvSU8choaM72TM4V5G57J9OQQkJGdNdCaTnEhxM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	7:LZdtjyNJVynIFNQbZtE5GWL0Wbhb37rZZEv+VwWDi2ahmN9UlxLkOHk5YnzK+TgLcJmkB7qZ6D/lqeYUkeeBALbDuHvrkEqFBYacXxRw6+N6fAoMjui/BazWWH+7gCqKJXOOyrovpSHo5cIPFIHU7c6xbxgxluWnMnWWcZol6ZqMqlmoJVvOnnYxVuzilW8v5aqOO6jAmZU+yiNXsqFEKe8CAZTgjDTz51SOiu1Pru68chNrNlHdsr3m3bgbydJt
X-MS-Office365-Filtering-Correlation-Id: c124a36e-f866-44bf-07c7-08d5c80b09e3
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 22:00:07.8549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c124a36e-f866-44bf-07c7-08d5c80b09e3
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3419
Subject: Re: [PATCH v2 4/7] toolchain-shar-extract: print post-relocate error
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
X-List-Received-Date: Fri, 01 Jun 2018 22:00:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/01/2018 02:57 PM, Joshua Watt wrote:
> On Fri, 2018-06-01 at 14:02 -0700, Martin Kelly wrote:
>> Currently, if a post-relocate script fails, it fails silently. We
>> should
>> be louder about this, as it likely indicates a broken SDK.
>>
>> Print a message if a post-relocate script fails.
>>
>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> ---
>>   meta/classes/toolchain-scripts.bbclass | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/classes/toolchain-scripts.bbclass
>> b/meta/classes/toolchain-scripts.bbclass
>> index cbba07838a..ae7bbef034 100644
>> --- a/meta/classes/toolchain-scripts.bbclass
>> +++ b/meta/classes/toolchain-scripts.bbclass
>> @@ -126,6 +126,11 @@ toolchain_create_post_relocate_script() {
>>   if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
>>       for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
> 
> Perhaps worth adding:
> 
>   [ -x \$s ] || continue
> 
> ?
> 

Yes, good idea. I will add it in the next revision, after I wait a day 
or two more for other reviews.

>>           \$s "\$1"
>> +        status=\$?
>> +        if [ \$status != 0 ]; then
>> +            echo "post-relocate command \"\$s \$1\" failed with
>> status \$status" >&2
>> +            exit \$status
>> +        fi
>>       done
>>       rm -rf "${SDKPATHNATIVE}/post-relocate-setup.d"
>>   fi

