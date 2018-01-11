Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 91828 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jan 2018 19:26:18 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0066.outbound.protection.outlook.com [104.47.34.66])
	by mail.openembedded.org (Postfix) with ESMTP id E541E600EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 19:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AOICmEhoFztINEx+4krRKzpVnFo+bSAEDekNR2ykIeg=;
	b=eSNe8NscqiLzZ+ZwHrIUM2WK9qA1nhtyxGC4UbOr2AXAp9bCEiaEHgz3ORG6dwVqmsdfjujZIRvcPk+gxFFbowiEJNKX5gZvjYqHLknot7Kyg8LPdbBtRkUtHRWcTP8H/rvRxxGRN9WlVXnL/z9WbJmJ6AvhQosOzY78O8w1eRY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Thu, 11 Jan 2018 19:26:19 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
	<20180104131238.21452-2-alexander.kanavin@linux.intel.com>
	<CAJTo0Lb4YRsAknNGhzc_dqGS7wJgFzxL_siyqQAGJ=9Wy7Cm+g@mail.gmail.com>
	<0ff515da-6221-7074-11c9-96b1cb8380ba@linux.intel.com>
	<64c07649-f0df-9acc-fbf3-e8f6a52db9f1@xevo.com>
	<1515610131.29722.112.camel@linuxfoundation.org>
	<9a261bf7-62c9-2aa9-9fa2-d27bb6ff7653@xevo.com>
	<83efbf54-dde5-2a84-00a0-6db5fc9e7ee5@linux.intel.com>
	<1515692956.29722.122.camel@linuxfoundation.org>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <a379308d-1f84-a033-98ed-175da915f315@xevo.com>
Date: Thu, 11 Jan 2018 11:26:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515692956.29722.122.camel@linuxfoundation.org>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR20CA0014.namprd20.prod.outlook.com (10.173.116.152) To
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eed66d1-5dbc-4d60-3ddc-08d55929310c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020070)(4652020)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:CY4PR0101MB2933; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	3:eP5gjbTZ0QbNGIkdyohOfQU49uNhsJgvmPcFZOmEVmGbCnrW6tbCgUQqKGUrzPk1um3D8g07N/zinn8LCKAlugcThPGDDtpZekRWi7trxgrdVllhF4/0jAB//1N5iRoCxC6ttuDPhjB6DB18oI1J4+IEtWrFoaDiVxm8gv5hnlCyQOhXUI3AeUBqufgru3E7qn9i2Nqqhp7ugs+lrLf59/Q9DnsNuHzerI1c5iYGRj3m22wu4mJmd75v912aMRRG;
	25:ta7ekd/Qv2cXTHYDb/R2hQBFOGEjJ7Fn2AXcrzQ21eBtK1fPbRjI8V2uPNo2HI+rByCvMB2Kk3PzQj6oaTsktxouYbOcmv4XpFJ0m3UHIKK2iG3bZ5jvq2c+FlrcOIDDG1V1o2zSABjV4n0EYee/a3yMx1YFLx9B0oanm+mSoS6BSmIpUyoEygKSXqIxnrTMiMGh7Lymab64UdEcwV0nvgmSLA9xewbmu7JLuwNmmSbMmu+7e4VYJC28HiPynLoKEDqX3bmzCuLac5pmEmZFPZF0EjgYT5SdzaRJznDYdnlT5FRRTWlRQcamQJtbBFOQnyy290VtgLNk3ITCbjPCSw==;
	31:XQYkRkkEJVAVcQfkC79xBeuOCVo031bEjEuDreDBhopPNH73cw+tzViuN3S+v6Y3mkEdQIz77LYw3GTAWUuGJjWrycqFZrb2t3zN39svWks9JdMr2qMAd+bK7ZWHD1rAVIJFFDJOn5egF5rY52zZ3slX1WVVnBHeE3ylfbk9b4CQn7A0130u8vKlrSEsy9jt8gocvu7a1RU3fIBTcAGD4xHR/VmG1swkofQw8mN5VYA=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2933:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	20:uX/pd/jDKZ12J6EFn+vTsYuBZhXomgmlvbbpeGB9nIr2eZ5Ixy2pLLKhorv15o3czlQxIUpdv4InKpter1OkxdmUvw6eWCoQACcM1iw4SmoHPeB3uudqEhwUjpi6iv1rVgdgAig5Er9Stbr5RYnIG899sA7WtI2QVCVLnp1kPsE7G8Vm4vLeMGioOE0wCpq8gUI6ExAcyMjLjCGpfiWvRQXsPPGqnHMJoIUTiG7sa3ic/gtsBY6AjEsZaJOg7UQQaJTK//CYA1ejfamDPXcQwcCPwUHNEMGKn0L6leGuY10ceMb79lDZ64pLrGBp1UNcIs8jlHPBBC4W3igx0xqQx2W21GD9U76lb11JXFhN0rDSVgQYC0+3BVRzxJ4TLj3YKCCzkaGKq1n42Tqh7N7PE8qZw4xngW86mO+CwUiBLtU=;
	4:n7t8WYub3Jpd0AL+s1ul8hel3QgXLyrZNOo/Y0qr+Xaq3f+lHOcw8vFygADJja5FwiC7Vi1s8wMGYqZnGHn2Z4VRWrY0qLYEHlLTgZBGwUWjEg7q06myU61vqYHvFlQDAsYIg+U2TKlNbr14s9HUMs044l8T04waKL5wCkRLxIXjDf0HkiZvw9pmN2Tyvk414m4QUdXp8mHlF1tvewqjDX9qdO0RCnhBNA/wzTXkz+sXrnmwpOq5J2Bopanp8U2Wj5+irJRBLEf59zvwHdrKjQ==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2933E63049FF3F1852079BECAB160@CY4PR0101MB2933.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231023)(944501134)(3002001)(6041268)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY4PR0101MB2933; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR0101MB2933; 
X-Forefront-PRVS: 0549E6FD50
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(376002)(366004)(39380400002)(396003)(346002)(39840400004)(377424004)(199004)(189003)(24454002)(31696002)(478600001)(76176011)(83506002)(77096006)(6486002)(2486003)(67846002)(52146003)(229853002)(23676004)(5660300001)(90366009)(65806001)(106356001)(81156014)(81166006)(386003)(2906002)(8936002)(52116002)(230700001)(4326008)(53546011)(64126003)(65956001)(8676002)(66066001)(6246003)(16526018)(305945005)(3846002)(31686004)(93886005)(50466002)(97736004)(6116002)(47776003)(316002)(86362001)(68736007)(2950100002)(65826007)(36756003)(105586002)(53936002)(7736002)(25786009)(58126008)(16576012)(6666003)(110136005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2933; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzM7MjM6d2ZNbXBwSm5WcHg4YVd1d0R6cUFvdjVu?=
	=?utf-8?B?RVhhbno2b3hSM0xXVm5zY0JYOUZhZ0tEWjNSclFMRUpZb2hzUTNrOVRzZXJm?=
	=?utf-8?B?UUdqSDZyRWtuZVJhcXg5cVB3LzNMclI5M1Qyby9xLy9hZGNWeDdLRGt3ZFpB?=
	=?utf-8?B?Q0l3c1lLOFNPNnZCYUFnc0FvNzZTa1RPazFPUG5sSUQwbG9nZWRWY2Z4TWo4?=
	=?utf-8?B?WVcreGdKSjE0dW5wa2ZWa0lXM01BS3BURXBIMVAzeUl0Rm8waGswQzZSMW9O?=
	=?utf-8?B?SVZRL05CRWhBVFU2dmVRa3Bzb3l4cXVSclNTejVjaUhDR3NJelpzeXRweGU4?=
	=?utf-8?B?cSt0clZpbDREaE5GeXFaY0dRR3ZmNXlTY0tDcHpWd0FpS1NTTG9QRWxrWkJU?=
	=?utf-8?B?OVhkQkRJc0JaeXlURzNldlRYSWI0aXpPYituU3N6MXIrT3pjUUx4cktSVDJK?=
	=?utf-8?B?N0dPQWJpL013bUxJc002NW5KZ0djSXhoWTlCZXhFcXZEUzh6M2Y1blA1ZEpV?=
	=?utf-8?B?eUQ5bVlENW9oMEtyejFWaTdLY0d2UUZka2tTRlUzRWlaa3BDY1RzL2UrVXE3?=
	=?utf-8?B?UFlTN2hqcm5NYjlsbGFnVlB3VmFPNFQvcTl5bWhRMmp2Sks3a3NvWHp1dDBx?=
	=?utf-8?B?d25Ud1JPTW52TzZsWnkzOHVuTFRjY3IvVzc2WC9CK2FoVFBDbGFVUVliaTl5?=
	=?utf-8?B?WFBpei9HMGphZmo2STBUeXJSQTlIWFV3d0dQLzhqOGNwWGpzN2dua01QcFZ4?=
	=?utf-8?B?cG9OTytoNHFoYUVCTXM3bTBBbmZma2loRFF1U0cxVmlSM1RSOTh6MGMvbzR1?=
	=?utf-8?B?bDlyMnFpUHhGajZadmFXWHhFNXFVYlNGNUExbXZZcFdsQ0FRdzk3dVhMQTk0?=
	=?utf-8?B?bmNTeXZ0YVhjZEg4Y08ydTBNbG92bGRVemdiUmxoUTcyS1RsSVlpclp2cjNr?=
	=?utf-8?B?ZUJiaWczVzd1ZC9uK1VldTUwLzlNSjNxRlZYbEgzT2FML2Ywd2dHdFFuQnhC?=
	=?utf-8?B?ellEWk5LL2NWd3M4KzdvMUYrSlM1amROVHVtVzJvUXE2aTRGSzlqb0NkR01q?=
	=?utf-8?B?LzBVUnp4NXl4TnFtNnpudnlnZTJhNU1MMDhiczZuRWIvVXl3UTZmeDhCT05p?=
	=?utf-8?B?LzRycG8yQVFrNndhdWhoelAvUWRKOUhhdEdrVXp5TytLUzRmN2VVY2dPK05Y?=
	=?utf-8?B?a2M5SDVZRW5sVWt6TTdRRVkzVTlteEFhWldLR1Qwa1Joa1k2NHpkMEszR2tz?=
	=?utf-8?B?NDA0YnZKb3NLd0J2OHhjaFNobFNZd2Y0cWxEUnA5b2hCVGF0TFRMdlMxNmVM?=
	=?utf-8?B?bThTbUR3dmlmNzBJcHdmdk5VK0hlOTQ0YkFyNDFIMkZEbHZTU00zdE14bFhJ?=
	=?utf-8?B?VU9MS3hHdmFDanZZMEsvKzlCQUU3dWFDT1QwdVQ5UFY0QmJhY3FkSUVqeUVv?=
	=?utf-8?B?L2piV0dvTjhPcXRkWk85V2d5RDQ5NWtYVzV0bklDTzhPUndDdkVtZzhFT0Yy?=
	=?utf-8?B?MmdQRmFpYkpVUWdqSGs2U29uSkQ5VnZ1QUZXZ09UNjJsc3YzQzE5ZU9TcVpX?=
	=?utf-8?B?ZjVSWmxyV25uKzhGZDNkTU9DNzBrREh4OGl5NUdKL0w2RVhUeE0xZFhkRHNK?=
	=?utf-8?B?Viszd2orbG9aeUZXbVhIU1JhTjRFb01LRkVLSmZTSDE3YnNDb0ZvMWdsTTNJ?=
	=?utf-8?B?OGVtN2dpOVdHTTk1Q1YzM2hGcTNJQTJuUEo0bmhISmFiSzZ3SkhBTjJtc1k2?=
	=?utf-8?B?QkU2VEcvOXZOMkVLMlpMbG5vajZSam5ZT3hEcGowNmYvRjRJQ3ZucmJMK2pQ?=
	=?utf-8?B?TWIyb3VJSlBvdU8veVppSTM0aDdVdTNyQ1cvUHRvU3dqaUdUM2RUTklRNUJl?=
	=?utf-8?B?QU9HRVNHVFdsMkdjZjU4TXdrWVBjR3FDYmlITFJZZUxiZmVpRWtVdTQxc0RB?=
	=?utf-8?Q?X/LIRklIWKY93JE9mjI01/UGHoo9sPV8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	6:mIrzkj2ddJRgIAQVZVxeNmyyKA25PH8L1ao9qZ54wNt6x2ZNum4z4Pw0kLgs/W/ljhYRIlZiFBAbm/ExVx3Fnbn+8463/IzpxR2/9+87ljoAKUz0+eTmjgDA9feXRNRGSQH+7gbgw/pz/5MAX0BwYdsdL4MqIqLzNF6pQa41UaiXVSEKevSsmvIOjs+oxmbwb1U7ZTRYpN35NaHCYaNm508nwNmRfLFaz7C793mZoEkacopINU4BAFhITVeQUlfJMBX0xx3LBpSpG0tqA3JTUtMjKrs0WbbhHbKPeIBD5ZM1eAI69Tka+4GzNiSiNmGcofgGBMSk/Un7l3jvVmTVRbOhjzlNj4XHhznwLe8oeqY=;
	5:XwxtFE4LofIcHOGVPylxXDgSwX3j1wdxxYiqKm2d/BWq1ZCTIPChy+1L1cXNzt/l+fs+aoqEmaE0C+6eQLEVDp5mpISJIkmgVye2mZhr0SKs41y6kNa36iaRx9llt66+iw8HC0yM93s/LWNWKvLJoF4b2eCa/qbj0sx0+hzRyRk=;
	24:BHFYyuBoQHyyzcIsAX06QBZTWmGmza07Thokx151m4qYKg1lLROGLVHszMfxyYWmnipgtdAKk/HwjBxaEeptpmwWX0iltDahM182IA9onR0=;
	7:z0K/QEFBbXNtGtA+2/unxIJzqLMI+DnnDlXq2riS9FwqTQo105d/SJThnKkOYFiaV4CNl/tYImoWc1LEYoB8o293+4PA4tYD6/clsDbUztMdiIcN/0TG75Y4lii9/ox8q8yLF/3rh7Rvcy9dmNeiuy1q4JqSr3XGQJPbzrM6FSe7pnDavr5fkONfvtpJlrhtg2OIByZvtMS7Dzpz+eKn1Fwvf6Vw2N/n+BZIhTElEJmBO8Q0I1sDQfIimx3lHXF2
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2018 19:26:19.2335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eed66d1-5dbc-4d60-3ddc-08d55929310c
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2933
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] gnomebase-meson.bbclass: add a meson-specific version
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
X-List-Received-Date: Thu, 11 Jan 2018 19:26:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/11/2018 09:49 AM, Richard Purdie wrote:
> On Thu, 2018-01-11 at 13:35 +0200, Alexander Kanavin wrote:
>> On 01/10/2018 09:11 PM, Martin Kelly wrote:
>>>
>>> Yes, to be clear, I'm not griping, as I'm very happy meson landed
>>> in
>>> OE-core, and I'm working on SDK support now. I have an OE-core
>>> thread
>>> going with meson upstream to get the issue fixed.
>>>
>>> To be clear though, I'm not sure it even regressed. AFAICT, it
>>> never
>>> quite worked.
>>>
>>> Where would I add SDK tests for this?
>> meta/lib/oeqa/selftest/cases is the place. Not sure what existing
>> SDK
>> tests are already there.
> 
> Actually, no. See:
> 
> $ ls meta/lib/oeqa/sdk/cases/
> buildcpio.py
> buildgalculator.py
> buildlzip.py
> gcc.py
> perl.py
> python.py
> 
> There is also "sdkext" for the eSDK.
> 
> You'd run these with:
> 
> INHERIT += "testimage"
> 
> and then
> 
> bitbake <sdk-target> -c testsdk
> 
> Cheers,
> 
> Richard
> 

Thanks!

