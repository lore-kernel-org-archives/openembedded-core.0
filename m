Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0054.outbound.protection.outlook.com [104.47.41.54])
	by mail.openembedded.org (Postfix) with ESMTP id C412878560
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8wuZkd+eEyUsyfRGl2ifMtgYl9RZrRPnOsx/gtpv6M8=;
	b=q2rlHcgi7H4FxGfHlGwfhw0JbhQ97hTlMI1cBgBj81GVAQwaqNK9h5r81jHdwNT8gEUm6qSowmJ3gJvhSdF1tUBfRWtwiCNuDX6lkEhp/QPfA3NRxW5lqxE373TLr9+QTQ7efDRyXzh8ZkYmgePJb7kndX9z0lP8C6o8b10nfyg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (97.113.238.55) by
	MW2PR0102MB3418.prod.exchangelabs.com (2603:10b6:302:3::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.14; Tue, 5 Jun 2018 16:56:30 +0000
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20180604230602.8461-1-mkelly@xevo.com>
	<20180604230602.8461-2-mkelly@xevo.com>
	<248cbe41837f42c88d3b38cefec71a4b@XBOX02.axis.com>
	<73a2a78cd6778812d9983f044f374e6c2de0b248.camel@linuxfoundation.org>
	<a72d01504c484595ae44abe19bbf4665@XBOX02.axis.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <42738ca8-6427-8f46-fa69-91b9930381b4@xevo.com>
Date: Tue, 5 Jun 2018 09:56:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <a72d01504c484595ae44abe19bbf4665@XBOX02.axis.com>
X-Originating-IP: [97.113.238.55]
X-ClientProxiedBy: MW2PR2101CA0009.namprd21.prod.outlook.com
	(2603:10b6:302:1::22) To MW2PR0102MB3418.prod.exchangelabs.com
	(2603:10b6:302:3::11)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3418; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3418;
	3:a9uqFaJUC3mvXMrrotxeKL+VxxXvNHvbodd9471LFmkb2bixUauWIiUpyEM8Gmr59Hf5crAhrSrdiGYcAWR55qMfT06Kr3J0txjSb83GTp3SVnSu8YvChjqKsK7TA+B3Lf83qmrv+04snfOfVB9KcxVmP+irHU4SaqTHQ5MfilmXfY6L3E0XhkEaQEkeX8DPiELhu8/oK2IUPp+gs7Y35b6cmphaSwMcZeGAcSyKYsTrWA/leinkI/2DGyeSZjOW;
	25:cbrcpXnIOBi81lP3eTTKGTnbTRiGyMVBHsPoIOcaE7wvnTNenye9nioovaEMdFS/6kKfyot8yirieYbYdolwruJkVU56jLQRomjC6W2nEPoAwm3onxHpI1yEO1jsL0NqOtmvlQGKUVLfI4F0WAg01PGZyqUjfcskFHrkumwxhCFTgYWfusW0b+5rEW25W1pm65V0GR24rqDVVdyYDnhU8bbqxq7N0JEMpLeP+UF5pVsZpb3xLmHfu/Y7Wjov1ae8IfwZJ6VJ4/eNa1O6GqERTk500SBG/6ns0jv+Kp7pn+z75LSzEYUFLfKH4f3P8IlINcWSHsmaEM2MRXbfUuImlQ==;
	31:HQ4OIiWdQzA/+3KqMZeGAyEajkP7/vXd0HxrlNnbR5tBR0iEe6C8lvIbW3CQAzBlvR+Sdjt2B8t73BmSLQB19cjYz510dvxRACyNdbGQdVMHpr0pkcJkWxIsWE6Ed446CU8xSz+6AVobodcny7Yu1XhG5Eyq0T+q790tCOw5KQg7k2kklbieqIo2WxZZdH/3kVBiQnYoTpIbc65hqwPoIwyLQaMhx5OroSE1evU80lI=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3418:
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3418;
	20:o4jHAheSIsJ5vq4S+2A2X2XQ+qKMe/qYEhgkTNACXh2F89JCg3hwrWNSqIoBhKOoKNF8Rh6APptZlCDLG9Hm3/OJOZ+OM89ROU4qt0Nw97ZTaGBE+qqxxVE9O1cERN7flcd2F+Pnsa1Ng/OqDGz+BywHpFReoQeW4kKursCZ7qrtt9UIWazQyjqnf5bzng4g8LIiLrop/u1C/GmM4r65OFKWE2X+8Xj0+fWsVtwIL3X/EjzpwQ571GCpQuQcUJkLOc2Pa0cRGbw412jw8EyETTFC+MueGL6uwQhE99Jlym9gq/kizRK1Y4trzGmEXcPhvNA8B3zUy3TXfn5cBYO7nOQODZ8JIdpUMQiQ9A8bQNor1Q8YLfHq8B8Im7d6ZYFFyYlvtSM6On7oyXHksAHWS8ARCfU6Yon0Ix3C7IflbeorCeW57YuwAzvTmtYoxbneEcHAUe4mNDel1fN6YodO7bwiYbS1gUCLB8Sbdeh7BWe5+4wO8iFXTW9Q23XCPyKK;
	4:q92k5dpBKIS3hNUeznB0GL0/LPFgCaGkqtDsccZ+8NPTt3qQ0P3lVcL12Hf+hO3d7juFtDMgODdnU+9y6OufQJ0GZ7eaKS5+zamt9Wabei1G88ZOsF82Bt29D/hPn4J1ftY/PczoVW3utuNCDMj1ru8CnX+w0pioaLjsO430gvpRXWEty/ByTSqqKTO3T0fsJuL0jLZ42oWOcTq3T+LKPK2YQC14vlBX0/xvhxu/KCXOJxTfzYbi0wvzDGQ2/9dxAmgdCpL4HPD4TfDpMQxbqOSEPvdKliKucdh52mRJqEcUFIjAJc4P+HXlcN00rlBv
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3418660675EEDEA4D31AE260AB660@MW2PR0102MB3418.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3418; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3418; 
X-Forefront-PRVS: 0694C54398
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(376002)(366004)(346002)(39380400002)(396003)(39850400004)(13464003)(199004)(189003)(110136005)(31696002)(53546011)(2501003)(66066001)(65956001)(65806001)(26005)(47776003)(52146003)(386003)(59450400001)(76176011)(23676004)(50466002)(2906002)(67846002)(52116002)(2486003)(53936002)(81156014)(7736002)(8676002)(81166006)(36756003)(6116002)(117156002)(478600001)(8936002)(86362001)(31686004)(64126003)(16576012)(3846002)(58126008)(486006)(65826007)(11346002)(186003)(93886005)(105586002)(476003)(2616005)(956004)(106356001)(16526019)(25786009)(6486002)(6246003)(229853002)(446003)(5660300001)(6666003)(68736007)(97736004)(305945005)(230700001)(77096007)(316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3418; H:[192.168.0.3];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNVzJQUjAxMDJNQjM0MTg7MjM6ZmhLRjJTUmdUNVNYOE0rd1BiVERvSmZV?=
	=?utf-8?B?bFBZam1wMDc3RGNJRmxMUE82OU5xUVlJSFlZamR4M1dHbkxKbWg4NXRacWk4?=
	=?utf-8?B?SmhVbHZuNUpGSm5hOXVlbHQxM2dwMCsxRUtId0xoRy9sTlUrSkVTU3BGekpt?=
	=?utf-8?B?ZTNjbTZsN3VsUDI3WmdmK3AyT1NHSWQ4WE1uRlA2ZmRXeEp2K3dJR3p6ZjdU?=
	=?utf-8?B?WEtvbUY2T3JBajJEaVJTVnh1akM1SWc2eWpGQWUrT2habTNKejFLLzlaOTFK?=
	=?utf-8?B?Y1pDTWN2blVZT1duamY2V2lhNTNDUkpKQUp4Vm4raExjNFdwejBydzdsVFJw?=
	=?utf-8?B?SFdvRHJ5UURjQXFQZVV1QXNOUDZjcWRsUnFKbVhteUdTV3Z2eGdpV21HTHM0?=
	=?utf-8?B?NEZxak9FNll3Q0k2U3piZG9zNkM4aVNmQ21Pdkl3VGVEOUxtdGpoSU91RjlE?=
	=?utf-8?B?UjlhRUxrT0RTRXZxSWZuMnQrT1Z6QXQ4WEQ5TFkxRjdjaEtCVi8wU20vMDRY?=
	=?utf-8?B?M1pqVEJLSXhDd1N4K2RJUmdBbytsbGM3MVpTa1JjZSsyb3lnMk5UOFV0VTVo?=
	=?utf-8?B?bXRoa0cxbHEzbUczYXNWZTVPQU9JcCtDdEtFc2h6UTZ1dlVNWkE0clRiN2pm?=
	=?utf-8?B?N1RhUUJLUElxSTdIbThoSWVWVHA1MjdDcmxNeWp6aUFHdzFqVjZHajVMNFBW?=
	=?utf-8?B?a01sak1xOTRzZ1EzempXdmZmanNpazhFSEVqS1VRbENjS1liTjNlNmtETUpl?=
	=?utf-8?B?ZnFrUHZZWFkyQ1NSa0YyZkFFNmJ4QWM2TW9zTGhNVStHSVVVNEpzWUlwc0xP?=
	=?utf-8?B?Mm1maWNiTDZKbmU4WVQ2MGFpVk9mdmRyTEkzbkM2OWR0aXFVREE0REc3MnM0?=
	=?utf-8?B?Vko4S0dkYmlBVEpxemNGWDJiak0yd3dlTXE1QXBrWVVoZEJleWsvRVp2WjFO?=
	=?utf-8?B?NTZXNzJhaVdkZVdKOSttMTBWMkNVbkdWQm5VeUkrSXJYV1BNTkFDSS9rL3Zu?=
	=?utf-8?B?L3NNM0x3L21SbHZ1MDd3c0hJaXlwMDZNb3pwOExkQm5aU3Zldjh2UThMTmtH?=
	=?utf-8?B?L3k1TFNkZE5HSkRPRTRNMWtBRnBnQncyc09XNVR3QXhzN1pDdGNwWW4zNHNV?=
	=?utf-8?B?UDN1VHhBMzJNcUkwblliTnpHOElTYlNUMVdhM2h0N0ducVdrVVg1MVI2bmRx?=
	=?utf-8?B?eTlWREErdXVCcEZMRTFubFNzaUtkWHpjWnM0cHB1V3R2NUhWaG9MbUpqdWFh?=
	=?utf-8?B?NDJUV2xnUUJZU08zYUZiY3QxQnJnN0ZsOXluSnVtaTRPQXFHQ1VoQ2dTMHJu?=
	=?utf-8?B?N01EU1FkZVNLek5TY1pwY3BSL0JjUHJOb21XQlFTczhhdTFOUGFYMFJaakVB?=
	=?utf-8?B?eWNtMHhTQjMyZy9Pbm85cEJQeU8rVDF3aWdYV0RKbHg3cDc4VGgvRGxrYVdH?=
	=?utf-8?B?VmdWeU5sN1ltSkdrQVlkN1hZME9TaVcxYnUrbTlpMDZYZnpLb1FyV1dSUFpL?=
	=?utf-8?B?Y3l1NTAxV0xZMWJHTk1sMGVINEZHNmNXclZsVERQV0JDS0FiT1MxWWE2SkRp?=
	=?utf-8?B?L1JiSkFpMVVZZi85R2krZkUrSWE3RzY2RVlMdnczMVFYWEZTSjRhVEdVKzJF?=
	=?utf-8?B?ejc2Mkh6UG42MFQzVEN3b09idnA0WHpUVTBjL3VUSy9WN0hPUytwQ1lQdzlh?=
	=?utf-8?B?SUt1NkVMMW5ySmVhdm1wcDFNb3AxdTI5aGQ0dUh3WmtZd2F2QkZEOGpPeG9z?=
	=?utf-8?B?THp4SkFWMXR3NjdQWjc3VmtTRkRuY2p3VXJGYTVHRVkrTDhFUk1aRC9uallL?=
	=?utf-8?B?QkNtd0ZId1EyV3B5NVgvMU15S3YvSDZhRlduT0sxOW5KTmNxa0txc0xwMFBh?=
	=?utf-8?B?QWpQd2xVY1QvYk9DQmhrcXliUDk5anpqRHNQTVcyREFheXRySjlUdCtSNEtO?=
	=?utf-8?B?eTZmOGZkaHowMmRkODQwUjQ5Y05oMnRUNzREZTNHWmI3VzhRQmtVRjdQT3hZ?=
	=?utf-8?B?WndCbCtYTHlJcjNWY1YyYzA4cHdtSnZoa0E3VjJwS05NU2JldjNzSVppM2p6?=
	=?utf-8?Q?ZXrh766p3EFqmmbKq258G8Zzax+?=
X-Microsoft-Antispam-Message-Info: IJYpEXp8vLEtiwK2cY3IX8IerD7ec+ycrluQIDC6gNKKhJp46WgCRP/bv4LGxjF2y/PUVJn8E6+wNiGHRcSISAMcN6BzRJeMn/ZX6RfN6dstqkvIl8QUb0zdErGfk2FEvTII8BJnB6wXPcMelF/2/zuy+aMxgZMDo2mu0MaKfM99kMKw2SJZmXqtHhIcOPW9
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3418;
	6:AWlL3CYyQGpJUQjl9w1+TM1CiLurA6XBSDPbfONJW1myShBpG02NTFGysnK9jfnulFkoc9547oKY1WZTQQFJ+I8uq+ngsLoeyZZB6qkOD3IRLaMH93D9fIHK7J/n3olEftRaJMZB7l0MGQr0aCtxffr54sTUjwYUQYhUjBlq/crYJMT5AeO6GLOCvqCEPNsBeEwhw7jDTwzmb/gQdNl5wupyFH/Lk8gLbH7zPeCYYMEGFbgjH8jyhOdZqzPLihqnu69U21Dc9/cSQkXC0F5pQnT306LhsaeO95Fm49BL3O6ndmGKir51NHYBt8V9V1jX4YYr5t74MSJTkdJjaEIgQGlZcpI/13pkDW/fDLXIqdSpNmn4Pwm5wv8DKo+7A4jQ9x12r8a8QSk5VdGN3I1F2gyC9k3itTulfChTU8KiN7StLqzoctES5Jfgk1LvbSGY6qOwCDOX0iohc/AiyqLJlA==;
	5:bnlDjHPfEUeTzjUugdZOhrVIWEG4uoAXZmtiGECo6lZiGiwYCX2Xpe4qpAWf5b4KeU3TQadVT5u0tP6TxIeolKyJwo1SrVapJLpHtOlD2Skfq2J0x4kRYP8LChh5mldPijF+OB6Sl3OflILD+KW3yP/aZNuk37nxqzv3CYTKjHI=;
	24:dYoIbupzBM1zJM4pszbKFmE77De927rVerSAtYCAaXR30J/wEJeaMH+ktjgbCOrzXpJPaWu867UIDVG86w6exTpHUQYgtJRhDs/UjMbgvtk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3418;
	7:OHBz6kOlMhx+ezofTXVKYz9rzhTKM5gR3JBtcOdufWNdmalJCFo6tu8EQpi0bUOVomUKpqXtsaVxiHWBkP5tPQjYoGxfjHDGShWeFPE2NfM3XgXhqXNGFujOy08WUaQXgJxROkxIIvTfRE3OPCgSrPhLZpZZ0AzKzDCX/tTTYkjI/E2EOrNVP3Ikyerlra7sOyaax6oRzm/tewbTVy9iPJ0lsAc4pqULFj6UpgWRFZd6rHVpUBywQH8yYYPpVDrm
X-MS-Office365-Filtering-Correlation-Id: ad9af1f2-6a65-4598-1833-08d5cb0548f5
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2018 16:56:30.1465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9af1f2-6a65-4598-1833-08d5cb0548f5
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3418
Subject: Re: [PATCH v3 1/6] toolchain-scripts: retab file
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
X-List-Received-Date: Tue, 05 Jun 2018 16:56:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/05/2018 05:04 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
>> Sent: den 5 juni 2018 12:37
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Martin Kelly
>> <mkelly@xevo.com>; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH v3 1/6] toolchain-scripts: retab file
>>
>> On Tue, 2018-06-05 at 10:09 +0000, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>>>> Of
>>>> Martin Kelly
>>>> Sent: den 5 juni 2018 01:06
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: [OE-core] [PATCH v3 1/6] toolchain-scripts: retab file
>>>>
>>>> Two functions is uses a mix of spaces and tabs. The rest of the
>>>> file
>>>> uses tabs, so switch to tabs uniformly.
>>>>
>>>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>>>> ---
>>>>   meta/classes/toolchain-scripts.bbclass | 20 ++++++++++----------
>>>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/meta/classes/toolchain-scripts.bbclass
>>>> b/meta/classes/toolchain-scripts.bbclass
>>>> index 71da5e5409..a72436167c 100644
>>>> --- a/meta/classes/toolchain-scripts.bbclass
>>>> +++ b/meta/classes/toolchain-scripts.bbclass
>>>> @@ -122,7 +122,7 @@ toolchain_create_post_relocate_script() {
>>>>   	rm -f $script
>>>>   	touch $script
>>>>
>>>> -    cat >> $script <<EOF
>>>> +	cat >> $script <<EOF
>>>>   if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
>>>>       for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*.sh; do
>>>>           \$s "\$1"
>>>
>>> This part should be indented using tabs as well.
>>>
>>>> @@ -166,13 +166,13 @@ toolchain_create_sdk_siteconfig () {
>>>>   toolchain_create_sdk_siteconfig[vardepsexclude] =
>>>> "TOOLCHAIN_CONFIGSITE_SYSROOTCACHE"
>>>>
>>>>   python __anonymous () {
>>>> -    import oe.classextend
>>>> -    deps = ""
>>>> -    for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or
>>>> "").split():
>>>> -        deps += " %s:do_populate_sysroot" % dep
>>>> -        for variant in (d.getVar('MULTILIB_VARIANTS') or
>>>> "").split():
>>>> -            clsextend = oe.classextend.ClassExtender(variant, d)
>>>> -            newdep = clsextend.extend_name(dep)
>>>> -            deps += " %s:do_populate_sysroot" % newdep
>>>> -    d.appendVarFlag('do_configure', 'depends', deps)
>>>> +	import oe.classextend
>>>> +	deps = ""
>>>> +	for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or
>>>> "").split():
>>>> +		deps += " %s:do_populate_sysroot" % dep
>>>> +		for variant in (d.getVar('MULTILIB_VARIANTS') or
>>>> "").split():
>>>> +			clsextend =
>>>> oe.classextend.ClassExtender(variant, d)
>>>> +			newdep = clsextend.extend_name(dep)
>>>> +			deps += " %s:do_populate_sysroot" %
>> newdep
>>>> +	d.appendVarFlag('do_configure', 'depends', deps)
>>>
>>> This is Python code. I believe the OE-Core standard is for Python
>>> code
>>> to be indented using four spaces (whereas shell code should be
>>> indented
>>> using tabs).
>>
>> I noticed this last bit and simply dropped that patch hunk.
>>
>> Cheers,
>>
>> Richard
> 
> You might want to update the commit message then as well, as it refers
> to the two functions that are modified, which is no longer the case.
> 
> //Peter
> 

Thanks all; good point about Python and the commit message. I thought 
about using the one-line || version, but like Richard, I find the 
explicit if statement more readable, and more consistent with what the 
rest of the function does.

