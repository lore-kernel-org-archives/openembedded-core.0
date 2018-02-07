Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 2060 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Feb 2018 17:48:44 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0082.outbound.protection.outlook.com
	[104.47.37.82])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8A678416
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 17:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=85H2DKBIBQ9hwJUhocYmlWfeTrjs/wCj6Gn+AqGiR3A=;
	b=e+UtgsnC46xXgPyrUpFF49kJpxha/JDtnuBUj3bXuA2w/8cqxwGk/E0uVm2U+4Ywmv60JmPaUYFuYi37PhD7jzCgJ+WNmeEsBK4wEE92hhnkyx3R+/tGhrmG9Vft2o3mabw8djQMbChgQ3RzGzBmUyyqH1a9xa3sUv7d1AiVd2M=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.35.165.30) by
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.464.11; Wed, 7 Feb 2018 17:14:19 +0000
To: Joshua Watt <jpewhacker@gmail.com>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Jussi Pakkanen <jpakkane@gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
	<e3dda70b-e6b2-bb18-2fe0-807b5c4fed48@xevo.com>
	<CAAjYPQ=u2U3f6DrL1KP-RkftD8P3nbASf1YUeeL0PFP6vY=hzQ@mail.gmail.com>
	<0ca64688-6a1d-0415-537f-bf59fb8dd2a6@xevo.com>
	<aa0ec366-dcd4-bac2-418a-acb0f9a06709@xevo.com>
	<0f020bf5-d0e7-82ae-c2b3-e7ea5006313d@linux.intel.com>
	<a6f2ab9f-e466-6107-a8a5-12d0706277ce@xevo.com>
	<36bec7a1-e968-ca73-0dcb-444ebc6da496@xevo.com>
	<1517970512.7888.8.camel@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <c8d77ee2-0858-f5a2-dcfe-309061956537@xevo.com>
Date: Wed, 7 Feb 2018 09:14:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1517970512.7888.8.camel@gmail.com>
X-Originating-IP: [71.35.165.30]
X-ClientProxiedBy: MWHPR10CA0059.namprd10.prod.outlook.com (10.169.238.21) To
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7c0b682-ce84-4351-c45c-08d56e4e39a5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:BN6PR0101MB2932; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	3:+vEMMPF9Uxhz6Q1p+8+lVSp2Et675j7cXaveIRe69R7gsMRCyI5bxi/ybOFT+ZjUpPkazXON72toFqf5pCBXKh3YtPE3c2dsF0Ba9/66SrbXZp639T7DUCrXUzFeV19FroQf/z6E9Xyx9ZxOtwGl5mJADnWWlVS6iZfozGM63buyHjP4BZEM8A4Qb9xKauxZBQdnXF4sOCeKKnbMgAgctvovMdC6BDJqwt5ni/fxbmsEb+yGdySKN5csl2z3Vvqg;
	25:1g0H43gyPhKX27Axo31YINZO0ou0ECtISpWa/bXiKiXRr7NqXusEMisrY/+MIgMkIJFlF0i2q0b4X+zHdGeC9+HAVf7+yPYFacvDi+QKnW6BzYYJ8Pvx2wpMtQH+wAhJvQLE/tpxw+fpTmTIo99f2KF1JuOom7cLHgj5pNZum3wiO+HCUEeo009peAzcXXAcQaBRZd3I4DXrIDjF2yMYOAYqCsQggnl6cYfBQfOpzbqm3y89l8eU5KjMMpd3XCat3Fv7UBSaEKUFz95a3TsCFy8vXaD6hq1KxHPhM6Q8e70CNKd+oER2oVD8z2/3+St9VIPjTW41f2tk2Ihpeo9/DQ==;
	31:zhUiVCiP7T2fCF41nnN3LD0CzAg///HJ4bHBgYF+LSm1c9H/87hlZtxt04IQAucbUzRC8nRcIHBKVXZTe5plIHg/2vLYC0OyLER16BNFLfaRHxXyB3jdju7Nz91rcVSfoRCtt5xrVLfwNlZvbLINTj+EUEZHkRKyeiqgVDGxbFTzE8d2n51q5pGZ2ESRprfURiHkMX1pens3tiOleLjHQkjyZWMH/pTNBr6ZW1jQRnw=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2932:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	20:BOMtEY+cG1IkwhRQpxeKX/KFqF9jAqGRTJXsyjHknfU35auZ2JVG9JCiBlJ48/vFCg9MxnhRKnvx2vJ1ZjQqed7naKvkqmQbyh/Ghf6Avbb+3T1uCqOP6TA2oor0/YYBojMLZrKQ/+McO+4GRzionCr3Zr30r3MwyZPIbY53V4HyCeSZ2bZfM+lRnDN24NSVEChtWLJfL7phdxcYfNIej+zdFQ3Qp7msPvfFe3I03CAR5vhLnis74rshTTVpZ8bEiSbSORb2BukWbEKmWiNDS4hu7JWD52/QWMuQ36TnCjjKJHhYeqhr3NQOMzphFSH729FjT/JEz+u65RIH9CmgY993Jw2LD7skMDPe41/D5ArvNGS54e6Oo8Rx1y44bHdjiHV4trSDNFPK1eTGI08gHKKEmsZ+mUpK+WyvQm9/HDs=;
	4:26lNTjwH/UlYqGn5p6XCKPUYSQ3Mlht3VtYIP8BpR97As4YnfFTOcqsa70ZeNaBvl4qNzaOB0laHY+EaIhv3NvjqzAm2d4WTzc/nEjY+V8avpT+VrKWyhkMFkhj9AQcw5sSHhJXKyNPSVcBfIvSwlRH42xP+3RJxtY+EnGbsZZpfeKljB9CG7XmWJWT0Mioe2Aa2LPmHgoIYNf25Q/jkUxqtBayesURpCuhMBlkK3/4vXstUILeS8ye8PTFj4K9rGex7SEFXzKgSXE4V2/mH1nKmh2JMFyalAoBb/eABdnWjzwXoZ6tFhPwSWg5MgCP8
X-Microsoft-Antispam-PRVS: <BN6PR0101MB29322A0F28AD5C1EDF9D3A24ABFC0@BN6PR0101MB2932.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231101)(2400082)(944501161)(10201501046)(3002001)(93006095)(93001095)(6041288)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011);
	SRVR:BN6PR0101MB2932; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR0101MB2932; 
X-Forefront-PRVS: 0576145E86
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(366004)(39850400004)(376002)(39380400002)(396003)(346002)(199004)(189003)(51444003)(377424004)(2906002)(36756003)(966005)(65956001)(65806001)(26005)(6246003)(64126003)(106356001)(77096007)(6116002)(3846002)(2950100002)(93886005)(91966014)(50466002)(105586002)(6666003)(230700001)(229853002)(81156014)(66066001)(81166006)(31696002)(4326008)(67846002)(1720100001)(19625735003)(386003)(6306002)(90366009)(186003)(8676002)(65826007)(5660300001)(31686004)(97736004)(6486002)(110136005)(7736002)(316002)(39060400002)(8936002)(16576012)(16526019)(58126008)(478600001)(53936002)(117156002)(54906003)(1860700003)(47776003)(52146003)(2486003)(23676004)(68736007)(25786009)(52116002)(53546011)(83506002)(86362001)(305945005)(76176011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2932; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzI7MjM6dThBSTdlcmpjSXRMU0RIYkZPTFdRNE9K?=
	=?utf-8?B?R2NTR0hyb1hzWjlzSFpXWkR1dU11WFk4by9lbkJaQ3E4MjJwdnR3YjV6dGxN?=
	=?utf-8?B?K3g1czJjK3g5MUxlSW9XY2F6cXNSTVZsZGpzWUFyb2trb001WGRGTkh5UDY1?=
	=?utf-8?B?K2Fjc3hvSERaU05vbEYyMnFxNVhzNkRPM0ZzVW1VVDJYVlpmU0dSUlRUOUY4?=
	=?utf-8?B?d3hOSUdCaEJxaW9JamgvOEhyeDJjeFZxNWdwMnE0VmlPejdtbE5kWDl3akVF?=
	=?utf-8?B?RU9kRWhqNmJNT2ppYkYrSHd0WDY2Tk9KRmpUTlFobzhvb3E2QWFFTDRDczhr?=
	=?utf-8?B?dFcrcndHbWxudVBzaXRmR25tQVYrNlVjcko0bTdRZHFYQ2xjQkZkL0ZBVmNU?=
	=?utf-8?B?MWlUQ1hnR0F2TmlDaXhMdCtTQmVnSUo3amJpUXQxQlBDNXNKOWlzUkRpUHRO?=
	=?utf-8?B?N2VWdUc1MHowTHQ5bjh4QjZKSjUrUjVtQnAwQXlON2FlK3JiZklaNmNKN3du?=
	=?utf-8?B?Q3ZXTUU3dE9nYzQ1R2FCZnU5K0J5K1A4OFpPMDlteWZsZkxRUEEzbFdzRmNP?=
	=?utf-8?B?aFRQRVlZTEo1UzFNMkhUZ1B0eC9DM0UwODRRVGhlbVF3SmIwSnNLbTVUOWJP?=
	=?utf-8?B?RnRCb1QzQTR2ZnhmbWsyd2RTQmpNSE5pTVkvUy8vN2hrd00zWXdyRFhjOVZO?=
	=?utf-8?B?cHUraTJUaUp4NGYxb054UWQrVnZtTFdHanVZUkpKMFZSaDI0bzRPck5aRTVk?=
	=?utf-8?B?Ym1qZWp5QjFadWtYQUZDaVZwdFdJRkl5M20zbEpxZktBc3h6Y0tyemkxVmhN?=
	=?utf-8?B?eUpWTjZHVGsyYVVhNzAvcEwwRFcwQ1cyT3JDb0tXbU1UTy94QnhVNDZ6c3ZB?=
	=?utf-8?B?U2l1WXJTK0xoWHhJb2V0WU9uVlZUeHQ5RWJseS95d3l6Mm5wNUF3ckdVR1dm?=
	=?utf-8?B?aHh6a3lhYzlUcHlDb2QzY2JjY041T2JVM0M3amNKdjFDRDlDdUREWlYzTmor?=
	=?utf-8?B?d09zV1JnSFUwV0h0bTBJNnhGWkR1MzFoSVJaa0xJdktqQWJneTV4YUZkcGFI?=
	=?utf-8?B?ZXhsTmFQL0h4ZS90bWNlcVAzVTRSWk02TFloQmpwT2tpODZzQVYxdVd4WVhO?=
	=?utf-8?B?NkYyU1NoMjdEei8xODJTd3ZEdnJPQ1Z1b2pjQVM4bUtFOFkrYXA4QS9pUlVi?=
	=?utf-8?B?ZVpJUVRBOWFUTHpHMUZBNXhLVHFzVGdycHhCMnY1K0h2bldadWVZQ3JvaDNn?=
	=?utf-8?B?MUtIS0o4cTNhQTB3aWNnWHdFZXJsNFJ6WWM1WGlycElzU3czNTBac2JmcStm?=
	=?utf-8?B?eDFDa1NjREkya251bnVLc1JHOWtjdDBXM1BmV3Npdk5acm5EOGZaOVh2aUZU?=
	=?utf-8?B?OWRmZTk0TjBXOXEwS2cydjVualdhYmEzeXJEalA2ZG5sZkwzdjROVER5cHV5?=
	=?utf-8?B?VFdLYUlqNVZXQnkzMFhlRDJMcHdvcFpPWngwSHNUQWhqUUxpY1hhZitFRVJJ?=
	=?utf-8?B?amJ4MHcxdzJPclFvUjlkRlIrKzRVdkY3anJUZDdTZHNxYS9Kb2FqTnNCRTlx?=
	=?utf-8?B?QU9YNmpTVUt2c3NlTmd3Tk81eit3NVpxNi8zdHNpQVBpelZ3UnFxeS9uWjZR?=
	=?utf-8?B?YmVOSUxXVFk1VzMxUVdiTC81ZlVmMVVLdzEzVmpIUGVQL28wT1lVODRsU1pI?=
	=?utf-8?B?cnVXNzhDSUc5RHhpOC9PbVVVajdIMUhzUjU2SWRhZmxRTEYwdWVkRUxieVBM?=
	=?utf-8?B?cmtMdU9QUmdCcTFqZFpwckFFdXNXNktUZThTWVUzS3BJQXBlamt5V3JadnJx?=
	=?utf-8?B?QkM2TW9aRkRyOEpSVDBtNFFmVmF0RThDMVpuKzZCU1o1QUZIaHhJK21kcU42?=
	=?utf-8?B?ZVArY0FmN0h4S244R3FvVXU4VzBRR0Z6TU1HRGtwYksyYWg1L3F2RjAxZG9V?=
	=?utf-8?B?YndTSWVsb1psTXdPRFdZb0VFNVRDc1o4YldrUGxXTmJtSU9rMlpyaW5uRFNF?=
	=?utf-8?B?K0s5S3dkQ2JNQWxPR0I1ZDFtUFdWdUd1SWN2MjFZa1R5NFFDN1NlcHppOExW?=
	=?utf-8?B?dnNWMHZFOTRnQVZLVTVhblpldEt2TTZOOVlNcitSb1E5Q3JjTzgzNkNTZ3VM?=
	=?utf-8?B?TVIzblpWZnZJQkdQbVJMOThrV0FKTktZZ1hIaG1NcldBZnZ2dWk4STIzTlFX?=
	=?utf-8?B?NWFQcnRETG5MZmlXbXplZzZFeUNjc0tyck80K1JsWVJ3Q2FoMS8vRnIwWG5j?=
	=?utf-8?B?aDZFVGlOYUxhU2NGd0tBSkFwKy9sQmxxM0Fwb2Y1ckpKdGs4bHlPVDhRPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	6:ciN15ycdXoul/yn//oSjQp0jPgr8mLqeO8KO8RnruT9e/IbW4Yg43w8I2RLGc1ABgxBz9tU8f0ND4k3Y/QVEtznRaJTNsyAK7VzFVWPFZZHxFTfgxpfoys29BkDEKBdNoGlvA1dN6lwqdLVOnXGKUmz/gNBPu8OGE1/durcATCzBI8qvJBYWvuOOM8+zia7BOkVWF9Nh7pxzkp46rOXn4FZ13jcPTX1ycgK/QijgT0SxtgrjWLnbGTod8ajYym7/n633RvnHR1er8rTrbcSaF965qZSL8Tx+571HSReEd7GplGV0J29AbEvatFkox7qoyaNb84owtKy2rF8UXgw0g69uAPXDiWfh+Q3glF84DPQ=;
	5:XqluAaaKV17D7NhhDsUJS/MzyFVv9ZCdWlnKfTRn4okU/qER/vohcSALq8ISiwC15KjCJ5rCZVaVRd66yFsK5ysaviCscSaQDK5PTYbynRTy4YicrqYoU8Jb29DbpsM6TfksUTVKkQxKAhcN0iBt4BBJB218uBwpOLh+fxQvLjE=;
	24:r1SOusWSzBESthhn32wZADQkeqa8Eoxele+gG+FzvBG06ZOJuuGc7ozlYmGxIzbLmgf73n2ZP0gKGa/F9DIHpSL+p7fiTJvWZgFyfFkV/HQ=;
	7:JDKPvNn51rLqFzbyOKQ93++Yu+7OtamecUVGepxwx0pV52wjQl/3e0KJ+mWGCyapfu0h2DMBbTnML4BL5PidOE+OsRBV30Xd8R0INcOmy4TZWlkQ6WPksmcnxElcNC88A+d7B4ju2y4xENOuvcyY/uejDaix25aViJcgkP9KsqsiIYBxLPiyWtfwaprxFZoYq3gzbK7E7lFiksDAittAhE88EWhv8wegp9VhYbvdmlmyO64na6eqtVXPg0jXTbWq
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2018 17:14:19.0056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c0b682-ce84-4351-c45c-08d56e4e39a5
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2932
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with meson in SDK with cross-file
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
X-List-Received-Date: Wed, 07 Feb 2018 17:48:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/06/2018 06:28 PM, Joshua Watt wrote:
> On Tue, 2018-02-06 at 15:39 -0800, Martin Kelly wrote:
>> (ping)
>>
>> Paul, what do you about the options we have here for making meson
>> work
>> properly in the SDK?
>>
>> To recap, here are the available options. I'm wondering if you could
>> give your opinion on the best fit for how OE SDKs work:
>>
>> - Generate meson.cross toolchain file at SDK extraction time.
>> - Wrap meson with a shell script that dynamically generates a
>> toolchain
> 
> FWIW, I *just* pushed up a patch to add support for this to so that I
> could have Icecream distributed compiling support in the SDK. I called
> them post-relocation scripts, see http://lists.openembedded.org/piperma
> il/openembedded-core/2018-February/147282.html
> 
> This patch show how you install a post-relocation script from a recipe:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-February
> /147283.html (look at icecc-setup.sh). It's pretty easy and modeled
> after the environment setup scripts. The issue that meson is having
> sounds similar to what I encountered with Icecream: something needed in
> the SDK can only really be generated by host system when the SDK is
> installed. There isn't enough information or the ability to generate it
> beforehand when the SDK is constructed by Yocto.
> 
> Granted, this patch has not yet gone through the rigors of code review
> so it will likely change, but I think that it is safe to say that such
> a feature would be useful for more that just meson.
> 

I think this is exactly what we need, thanks so much! When your patches 
get merged, I'll try this out with meson.

