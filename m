Return-Path: <Martin.Hundeboll@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0111.outbound.protection.outlook.com [104.47.2.111])
	by mail.openembedded.org (Postfix) with ESMTP id 88E9965CC6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 01:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Ozi5oI8PTqm90lVVw3PIvbUQXG0Pd84IZdB52s8cx1I=;
	b=X+djdNYGKfi/aFcmIDXNuNkPurMxxKN+ivrnnfOBOIcAlCC39UW2/t2QTug/BKA40sG+TFdEiRi+t4dnRMamqz0eGja4bGFckBVQ/fvF5+58d83hoSnCEbYyGoVdKbHY9BXTv5ad70VqP93J9rn4MWnMn54q2kdnJ5Z7gcqnSJQ=
Received: from hundeboll-mobile.local (85.184.147.232) by
	VI1PR10MB0125.EURPRD10.PROD.OUTLOOK.COM (2a01:111:e400:c54a::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.715.20;
	Mon, 30 Apr 2018 18:05:36 +0000
Date: Mon, 30 Apr 2018 20:05:25 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <0802e876-fda0-d8d2-9dca-18ba8cbe073e@denx.de>
References: <20180408230223.17260-1-marex@denx.de>
	<CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
	<bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
	<53904a8f-7ba2-7f09-4e93-a95a780f60c7@denx.de>
	<d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
	<8cc34667-5bb3-9642-40e2-d56b28f56646@prevas.dk>
	<32a348ed6176434db8178d29d7e1f183@SOC-EX01V.e01.socionext.com>
	<5ca366ed-3108-4a56-caaf-06b4f136d259@denx.de>
	<627e0fde-f97f-5c49-bc1a-325e7baa9072@linux.intel.com>
	<0802e876-fda0-d8d2-9dca-18ba8cbe073e@denx.de>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	yamada.masahiro@socionext.com, mnhu@prevas.dk, raj.khem@gmail.com
From: =?ISO-8859-1?Q?Martin_Hundeb=F8ll?= <mnhu@prevas.dk>
Message-ID: <009AC170-F15B-43D0-B00A-5FAF4673C7CF@prevas.dk>
X-Originating-IP: [85.184.147.232]
X-ClientProxiedBy: HE1PR05CA0209.eurprd05.prod.outlook.com
	(2603:10a6:3:f9::33) To VI1PR10MB0125.EURPRD10.PROD.OUTLOOK.COM
	(2a01:111:e400:c54a::23)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR10MB0125; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0125;
	3:Y4IXhcStWwGK5Nd+eoPCt0Lzgj2SW0Akik1vjHEhMotuv+tOhj3Mn7Sw6teo5Zh1vWjag2MFPSsFXtbUZrQIJg01aXdgt3t9pTNVN5UXjSn5mkoJxVkDE1aR4JudjgnKFIbxvKFYTN6y53tjLrA5fVoHGXkpU/Fwt1rsaskLt9YAIRq0iSYj1s+VWvWb2gVAXNGdoiIYE86dKtmr0VH4mnP0hez0TIKKC3wbJJr9C+6pgGlowNyjuVGzyg/GWZPc;
	25:5KuNz8jO9IN7rs0VsTbWC18DLH5CQAlc8gvGtG3xWq70uLRrDmXF6lMLyYUp3m9HyX1SznORVgeeopkYDjSz8R+tJsycvNue2DsF/2B1ilHOlLcW3GTDRZGdhQJMFy40bUpblhJPc4cdvU563TXkP1hrwBOb+sH5icjLx8FWK4Pig7p1Z5I6+Gos/xxn60lqYue7o24rxFtRdLALKjSACs6iRyf4CtPAeGO/yHdu4of6SXhH/FHTqom2Y/DmXlhzj0Tq9ui/8ArTuYTG0kelZWNPB/GIKYbqQqIRltc0IE0ePPmJ7bn2v0UBKwQNXoQgyIGWzcVs5URAjzHC3T/7jw==;
	31:1hnR1MhFsA6jxOm4D/EZwUzZNvGGA5hIaM6q0kk2alqCrLotoVFyuhewhxNXpnQR9tU18MscH2cxiuM+cTOyRvoL+g5+J2zVSq2NZ9wcmqWmf+psZlRLLAofyLoDoRq2s2GhPU6dDvGMpxG3cygLyefduFOo4gLN4XIkFJjo5wPPi1acH5OsyDDxkWBnBA4uz8a3AOfKeibHvoxKmwHpaU6xSeMSiNamz5iT2O5goMw=
X-MS-TrafficTypeDiagnostic: VI1PR10MB0125:
X-Microsoft-Antispam-PRVS: <VI1PR10MB0125EAD734F5F18BF131C1969D820@VI1PR10MB0125.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(3231254)(944501410)(52105095)(10201501046)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:VI1PR10MB0125; BCL:0; PCL:0; RULEID:; SRVR:VI1PR10MB0125; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0125;
	4:d/IU4FqYFI2N3BctAwM2zuhgMsFU8jJdAX6D7/a3UaNFm8uuRkg4ygZ2IbT0QwDXz5xrdXmYqr4Q6lcyyic3DyAW8gHz3d3YAv+jUGnBX8anzFYJMEP+CX1q5USR9+et0SsUlAK+sci1GimIm3Um4/MQjulXrg1mEg9Wmk3q3UOdYVphon2F6CNStnElUQ3Bufvu8GdWlJbu+PKn0lqumdFHv6m+Cl+zjoGlxGF0f79r+ii1389wRCh3NFXeWSBndbCNmVgeJzgwqzA0M+x1qQ==
X-Forefront-PRVS: 0658BAF71F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(396003)(39380400002)(346002)(39850400004)(376002)(366004)(199004)(189003)(81156014)(6246003)(66066001)(53546011)(6512007)(39060400002)(6666003)(47776003)(3846002)(6486002)(6116002)(229853002)(8746002)(8676002)(76176011)(105586002)(186003)(6346003)(81166006)(386003)(106356001)(26005)(53936002)(8936002)(8976002)(52116002)(52146003)(2486003)(23676004)(16526019)(6506007)(42882007)(36756003)(82746002)(7736002)(5660300001)(478600001)(72206003)(11346002)(68736007)(110136005)(2616005)(476003)(74482002)(446003)(956004)(305945005)(50466002)(486006)(33656002)(4326008)(2906002)(83716003)(316002)(93886005)(97736004)(58126008)(25786009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB0125;
	H:hundeboll-mobile.local; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjEwTUIwMTI1OzIzOmZnNlF5Q0hMSlZxVzI5SERlc3M4alVYeFFB?=
	=?utf-8?B?RVpSYXdLczZ0TGhCM2FSNHRoZE50NkZIWk53ODRvMnZtVFlxMGJ2L25BZzBl?=
	=?utf-8?B?QklvUTRMcjdVMXc2dGhiYkREVWpSZDJOVzdXL1h0N0NDQm45RzVhTGlERVpt?=
	=?utf-8?B?RDU4ZjlQd2c1Szh5N083dGEyeSsyTndOVU5sbEJHU2hyOFEzeW9ZL3BVVm5i?=
	=?utf-8?B?WG93b3VtY295Z09hby91VjdFbVd4dllSS0NnVE5TZkNuTllwM0pIWEloNHdD?=
	=?utf-8?B?UVZGN05nRk9ONXFUTXhoNDM1KzlOWU9BdmUyeDhpZVgxYVNoQkJvRXFnU1Vp?=
	=?utf-8?B?Y0lvRVJjOS96NFlUdUNmaU1YdWo5aExiaEJUL2YzZUJabkYrQUswUi9uSW5m?=
	=?utf-8?B?WVFBemZSWVZpL3ZremQvZGMrRXRYQzlkek16ZU94K0xHZkxIU2JEam9rSUla?=
	=?utf-8?B?TjJ3QUZ5Um5Ld05RUHFWWTlpMitIOW5iYXcvN3hKMXFpU0xuSE5HY3VscWhs?=
	=?utf-8?B?ei83Kzc2aEh4VG9mTEYvdEFzNWZmeTFVNC9OczNWT3BaVjhrN3VwVnR6VVNW?=
	=?utf-8?B?eGRvWGF6NjlZL0VsUURMRU9lUVhPazE1cFYrd1Buc2YwaWFsZFVmeW0rdFVH?=
	=?utf-8?B?aWlQMFNZd0UzTGdkeHM2SmhQcnlVTVJEek9hZFVTZHh3RDBlMTNlYjU3MEVy?=
	=?utf-8?B?OU9NZ1ZnaWdhNVVaRHNvVDV4d0kyUkVSS0dsT24xa29MYlhzc1hOcFp0SFd2?=
	=?utf-8?B?ZmttZzBrVnVvWnpNODBCK2ZHNUVOQlZNbWNiNDZ6cjQ3Y1E1ZW9HVnJ4ZCta?=
	=?utf-8?B?RjlQaGdRNXB3dnBGdGJFNDF3YW5SVXVrTHQ1MUhzVWZqN2svNVI3dXBoa2sr?=
	=?utf-8?B?b1hBOFAwMkI3eVZGdzBodEVvSkc5TVkxZGd5L2J4Zng5NmsrUkRNTFg5MkFn?=
	=?utf-8?B?ZmQzMzhDc2lVcStROWsxOEdraUVxVW85U2Y0d3NnM2poaEN3MnNVQXFrTkw4?=
	=?utf-8?B?RXF3RDdDSHhrUFhkMlBOYWh6UXg0MzdJYy9GcUJENkhZNWsybHBnWmNQQ3VT?=
	=?utf-8?B?ZHJSMC9aRk44UkZzRG1ocXNSWVQ0Z3hsekVUYS9odHh3YllWUHJlY1BSV3B6?=
	=?utf-8?B?OVhFSC8yb0lGKzFHWHBrdHkyejdHcE9jV1k2ZkVpSG5tVHNLTzBESENoekow?=
	=?utf-8?B?SkNKUTA2QVEzdzExUUU5enI5T3d1ZE5LL05lZFpiKzhSWFR5TUNvWU9malhZ?=
	=?utf-8?B?MU80MkJKYVNabzhKWnBnblpMK0djL05BRHpaWWpVdjhjTVp2eXFFWG1ySUd2?=
	=?utf-8?B?M2FrU0kyZnpYNHE4dTFFckRFUUplZG0wL0lCTVlpYjJTK2xRdmdQRTlrcEx2?=
	=?utf-8?B?dGZjVDNzN2ZQTTBVOFZEbjVQV2l0WGtjT3VUWldGL0hVOUU2Nzdnam81aEpQ?=
	=?utf-8?B?N0xNYjVWUzZoWEpERmNWRWVaNFVEU05ZcnRJWmJXblFFdXhzK3FIZmt4bkZI?=
	=?utf-8?B?clpiU1NhS2R2R0hTb1Z5enNxVjBiZ0ZlelBMYlNlVGhINWxkMEhXOW5zblVZ?=
	=?utf-8?B?eDhuMHVzK2xXRnhXTUhvMHRKdnNENnkrZzU0TWxaY29tMXZHSTZoU2l3b2ZH?=
	=?utf-8?B?MWZycm5IN1FTS0dXZVRJMnlFR1p6TUVjTko4RnlPS2IwMG1tOVNQRktoUXda?=
	=?utf-8?B?OUR2WDM2Nm9VSENWNGRDR3RNSFR0b3BTeElUYWpSV2Jsc1p0cnpXU1d5UHE2?=
	=?utf-8?B?TGFPVEcreDVCRUIvUXR2V0pSYkx1TjBEYVZzWnlkY1lRUUtTZ1FFZ2xjNWY2?=
	=?utf-8?B?b1NqeXZNNXFVWSt3K3Y5ZUMvQUZSd2t4QVM2c1pjMHdPSjJQYWNkUzU0UWJo?=
	=?utf-8?B?SU9KdTRIR0J2L0swZFFaT1A2QmdZS0drYzhUa3dSYnE5UEpLa2F4dDdGSUw5?=
	=?utf-8?B?SDVpOUZWWHJIOHhTNFlFNnVTdkQzOU8rUmdoN1QzUGFVVXhMYWhVem1MUUFD?=
	=?utf-8?Q?uGK0c8?=
X-Microsoft-Antispam-Message-Info: JVht/y1xk7ZO0ybXxuloqMDmOxCIvylXmv6QWo2Yd2ww3FJz3YRLlXMvbO4QkLxtlS7JCdn4e58p0IqGEfkVjidl1Xi4umwIAjql8TAJSu7s3EMb0zBsXiEDCMFbPtccVwywHFxMHuBIPB2Fc/aUWNvHMqH8DJd18p7CbpKN3uIPYiK3koDRj0i+EJlUgH/1
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0125;
	6:3XAubGgsUDvD8GOXp9oiNAocEhKWId0aGxWA+XHLrmYHoS1LyLfB4R8+GnH6+LRYKmaeJcxf94nnQmFCL2ESSVzEI6RrxuMdg2dSGPF1O2AyZfri7RPlYymnTuqfKoDGGsJM3hjjoIVnBs0CKVS4JUGR8ZCUU+gyI4XeNjjPFB/CuD7LEsKgCdcFvWr/UayqigBJECyNxi2LOttWfE/vFL95zlyE0l/GKfVKhmSYbARfiVJJDWt6I8WkBEVi+1fzMLy25jyEjlcfJsiWsaGwWBKSeHrAQTi3FKMfs/jS+llpk4c/FAETG+vXvuKzhoAR+dhKHJ3OCUdIb8niGVCSILlCiLct5P548RWPY8hhTxIlqz/s0UjXydakdDrMAhFCJsFjRSsLqYraX/qa3uCvoTbB8HM13U0wPR60OqT7oegJ7BvLw8P0jmT423w4SqIys6xhKMH/lJzCgVHelNPcSQ==;
	5:8Zh7CRrABi09zRrdTjgjiU2p7g3StyaVb2kGr/67F7tpKabeqx62nSS+ujydKZ4JI0fgBLS8q7zS/zybRdPOVGALli6eCY01Pa2QZcMjyLJjlsu4V6NtyD/5jicrnAGdcm/7QyZEQUDORDUPPdX2nwCNiafwrM8mnuxwsBjDn6A=;
	24:7uPILJkj07pCIlbUJZtjfur7egF9sUyjX1Xiv+PJE5g6LsM8rn3hfSSiz8pCGs7wcksPmQZtNDT/7zkU4Dv4/42pHSB0KlZRMmMplyFiNYs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0125;
	7:1BF4oCJ6l8lusNJf3De/NaJ718fRYlEjp3QjIxSP2A5GkevNDh8OrEc1gP0HlZJGJGXLsu/K31u1/+34fMg+jT98KrY50mlwATvk2g8yPJJ8yuAivU+wVPo4WvzCap/uK2wfxSlqNDMU79DS2TJWbyqXSwYxGUajmCSOsrllVK75ihiMpqWbDSUGd1uVmZl4UNbuYtoZSNvO+kAAMSJ+xUCW6zydjkvu3k2OwF5BMUlCyq7BrZPso/PIzFERe0Bf
X-MS-Office365-Filtering-Correlation-Id: 34fa8975-ee41-4ee7-06b2-08d5aec4f970
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2018 18:05:36.1984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fa8975-ee41-4ee7-06b2-08d5aec4f970
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB0125
Cc: otavio@ossystems.com.br, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Tue, 01 May 2018 01:41:53 -0000
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On April 30, 2018 7:25:10 PM GMT+02:00, Marek Vasut <marex@denx=2Ede> wrot=
e:
>On 04/30/2018 02:17 PM, Alexander Kanavin wrote:
>> On 04/16/2018 11:40 AM, Marek Vasut wrote:
>>>> Isn't it possible to solve your issue in the OE side?
>>>>
>>>
>>> Can we NOT compile DTC alongside U-Boot somehow ? :)
>>> That'd be the most desired solution IMO=2E
>>=20
>> Yes please=2E Can you adjust the recipes and classes in oe-core, and
>> remove the dtc recipe altogether?
>
>Remove dtc recipe ? Not sure I understand what you're implying=2E

I guess Alexander misunderstood the "alongside U-Boot" part of your sugges=
tion=2E

I agree that building dtc/libfdt in the U-Boot build instead of just using=
 whatever is already available on the host/OE is undesirable=2E

But please elaborate if I am mistaken=2E

// Martin



