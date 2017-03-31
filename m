Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0064.outbound.protection.outlook.com [104.47.41.64])
	by mail.openembedded.org (Postfix) with ESMTP id 0229C77CD8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ZNLbHRQsQ1EwfrLxLFII5Yr3FoX2T4p1ZkBoe9TMZ5g=;
	b=x2cgSdavxBocBI8l5JGqWzKOkGzCdsckj++Esdy2Z2mJyFD4ACcWc9vC1qCSlYgy5/6+0eI1NaFgJWohPfO3qqdu0NaCP30TX3908Ih4qdF+5zeCshJNKASt6UG38xbptUbDi4zhJI62GEh6xevNB6g+5Q2e/GHDRWHsTY7p22I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	BN3PR01MB1400.prod.exchangelabs.com (10.163.36.155) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1005.10; Fri, 31 Mar 2017 16:42:09 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <0eeb55ac-a3c8-95c3-a5e6-4cc94f963427@xevo.com>
	<CAJTo0LY7NYeozpJL+EWc9ZNgezFZ=xMuzLnsMsPMd9PFYBmy5A@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <03bcb224-f3c3-682a-b6ba-15b9451cd031@xevo.com>
Date: Fri, 31 Mar 2017 09:46:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY7NYeozpJL+EWc9ZNgezFZ=xMuzLnsMsPMd9PFYBmy5A@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR11CA0001.namprd11.prod.outlook.com (10.172.48.139) To
	BN3PR01MB1400.prod.exchangelabs.com (10.163.36.155)
X-MS-Office365-Filtering-Correlation-Id: ef2abf50-303e-4720-e457-08d47854dfef
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BN3PR01MB1400; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1400;
	3:jeblm/vQ/vRKCboYhBMzMkASuHADmHz0e64FVyEIWdZ3DWpUIOWOIGHk5Lcy98+5kpQrBsSHT3Wj8AUZAJaK8Di/BAj2FZGhSAD1u3AKJ9krGGTAcQadX0oBjUSL+aPoaaU3UrpBdgoezquXs96V3GZWprW8APMekQn4TC2Vdz8wrgNqSVMPEmVyGekbrDzo49N/K3P+hAun+OJtTGClnLW2n/ykeJGW3GsyhWt7qGARAgBgkAHOrGTKvBe7a/SKzDCyMqN+SKXVfacagdAfF3tw2UfgJtMl4nFY3Figslq4s2H4YouoTsXyGHijztI4bbhIT8dPjOf4K7EvGDcH+Q==;
	25:xzPWKMcO20qendX7ipPqD2EQq13JgW9SFs/wD9rtWsmT662XD0ytkViG3u2pEDvWBeJerNdo8kUjpfr/IYyluSjc1kzNLLsH2GSonQJPgksJ1TaxELLfbDvFonQ7eTmtx1Wpf4EED0ZVWgy4wmRNwlascFtbsPLEEL3Ul8iV03f+PczHT2wAbcFb4HQPOY+b3XAy/fRk0JKNjF8NXFgfbCKjp/Q76GonDfmHhou0zksyF8SLGU13pbvrI5DRhlsNUeMSEwn/bbBHxg8QwZcmZwbn9vd4/F3EmomWCEUS0Yce+pgBFCBDqQxo/9cnWkntC1lqlnb1zh6U3CfcixYfSN6sms0tdYJH+Bfe9312J9xZpnVSfNMtw0wvd0aL5juGVtm9ENpYBmKpj5b2+TaNgUz+VpQ9jwGhlkG8ygn2H5BHCYevU4+KflOSSQgY15U8YpLSYkRxr0iIlacdZ/fZRw==
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1400;
	31:ZOq4c9vMWt8Wj80muHDwId/mWHomZJsKmBk6bd7QnkmUbK6/gETEqpC6WCZMXRrCPCnfUv1nHKJFj9o0+bwTe1Vk20kXHCxC7GNbTEdiC/SCFUSLmAQVNEh1DYWgD8Pok55KTC6pdRuJ47TGFitfSdhPSnSaIqjvXR80zXWm7t5pXl1Gr/vopHMmVLscgfBoyKWS1Za7YWaj8aJLFHyWYOp6frtTGOlrpnaX5wbcs3pA9LlVnsAwX+dTvkRoxNMKfO+rrff08S/pl2bynZ8Zjw==;
	20:yq+EjqBSMuFCO7bGIPktZWIDeQpKzwpIVndGqu9IaAGWVJ4DyS+BDBGVw42/3VC8j9QyfOljq+hRYpj+ufHis6q2XYBCvBHnxqQLrZrM0zfGtY4olSNZiZJ3DuG1IqEnYiuoYnX5RQD5FHhpve+lNZVCg39XEkXR2R4sT0QIGZV1RGZP1A+92CfRBoHSPlAWcwZGF8B3S5urmjncb8QRboVpoTBZy97w0dYFyvCr3Iokd2x7mxInPxK95CesTLrSqbZBQwoyat/8vcsSpkMmvzR3yWI1wyEm2xpAOkdnIpIzdhiwYVQ3rXCPsQdc/Otb6VVeZEiXfASb/Yc5TXjzVQ==
X-Microsoft-Antispam-PRVS: <BN3PR01MB1400F8EAE10506639AE7363AAB370@BN3PR01MB1400.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(20161123562025)(20161123560025)(20161123555025)(6072148);
	SRVR:BN3PR01MB1400; BCL:0; PCL:0; RULEID:; SRVR:BN3PR01MB1400; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1400;
	4:r0bjUC6YzMm+uFiHHgpDZpc/0gUic5UbXxDeoyK2l1NwnKDCk8TolczuakLoR8Hh70gmUpltASHuXlvKLcqSwqz6ppqPgzSvxyfmZQFkePccTyTP1Nu6gdXdNc4LJmexx5j9yUYydrDsy75F59a+Wro95oqrqqbogRgOX5HhIufBQqwpzR5sHPrCY+sG4RxLrBuL1ZNlmf9mnjENZllV95Y6co60nBFY+uKjvKtiEzKL0P95JuZN+xl+x7O7vywBFnrpsVDTGGiQQp0bZd1iLpjLZfdI89d+neVJyh7znIs22wHdHF9ecIqzLGyUVnhKOV1+M+eVoSjAIvh9KGYIgxwkIPRMhnVzsRmzi18KEcUqfZY96uxHOsbf3C2w6++qnF5C6vztpAkpglarjFFwfCcWf2q6rblB9TC5YEkqWZiNNlC3hmWS1TGHIIUmHLwHy0xRrhvM2MJhRfqzx6ekYe4PXC+JrVkRTDvKryoE0U0rtnYtKNXLFair1ZohsbVF0wZDtpmb+hqMcvw5BSEllTB3vKYXfGXQgyv1rbgfWmdmjj3K1SULuQzgBs3Sp+BhHCa4zbmOXCf3uSqmGGhCbF4EzuSjKdbZLAXcLRPxfrQMloKUnGTbMBvnnLnTqq/bbM6AKh1x00PMc5hHfzpFQIMZ3IU6HobsZC+/HUYPUgsQKSo6cnL5BguZAWf5e1r0GDEE0NmmYjAUpJG8uTNgnw==
X-Forefront-PRVS: 02638D901B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39410400002)(39450400003)(39830400002)(39400400002)(377454003)(24454002)(2906002)(36756003)(4001350100001)(6116002)(189998001)(76176999)(66066001)(47776003)(305945005)(110136004)(38730400002)(230700001)(3846002)(81166006)(54356999)(50986999)(5660300001)(8676002)(77096006)(4326008)(86362001)(6486002)(33646002)(23676002)(53546009)(83506001)(6246003)(31696002)(229853002)(2950100002)(6916009)(31686004)(42186005)(6666003)(25786009)(53936002)(64126003)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR01MB1400; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjNQUjAxTUIxNDAwOzIzOmVCZ3pIYlk1UGx5V2d6WXQ1NWZHbmJYazVJ?=
	=?utf-8?B?RlBYYkJDZHlKRnVBVzJlYlN4amZSYkMwY1dERVcxRlBIVE0rSWpod294M2tI?=
	=?utf-8?B?UjF0RkdCZlNRbWpJSzJqZEdVb3JkSWNVNk9jTXBwbGYrVmZyem5URllMVHYy?=
	=?utf-8?B?VG1qNkMvc3lpMXF3SEpHcjI1d1ZiZjdMWVArdklTVjRPMEpUVlgzQkNTMGNp?=
	=?utf-8?B?RGRTZFhiM0gzNnMrTVNOSTl6MUdLMTQrL2RaYjNvekt6NmczSGhTMjh6VDRT?=
	=?utf-8?B?NDJtK0U1azJKT1gwZ0RtTHJQd0tiN2lWbHRNaXhYdkdkNXJINkI3TVc5RW1h?=
	=?utf-8?B?d3pyaHM1SGxaNXF5RGhxZk02RFlLTkFMeXJQblpER3VwYXp5ZjBOa3lIMDk1?=
	=?utf-8?B?SFJ2UmRmUHplYmpSOVBYL05lWGtQL3lmOE95YU03VDdjenpTUkRoZjNDUjE5?=
	=?utf-8?B?c3FBSlVlMTlOVTB6S2FXUHE1ZEIxZDhJTVRNcnM4cHZ2bCtJNHYvVmIzMHY4?=
	=?utf-8?B?R1F1SjFNMjhId3NLN2NDZWlsV2VBemV6Y2RqNWFhcFFRRXJZTU82M0JUNUNR?=
	=?utf-8?B?V043VXpmUmtrRGlnQlg4bmNwZ0I3alhkcFpQMDlBakNFUU5tUE9zMERJbngz?=
	=?utf-8?B?akVYajl6RzJFYzg4ZFRET3FyaDVQVUdpVDVoM05mUDk2NCthSld2NEdLd1hi?=
	=?utf-8?B?ZnMrS2xyV2c1Y2FhMXZMdjUxelh4QUhNSnNoY2JrTWcvNW5YdlhCVklIUXg5?=
	=?utf-8?B?MlhHaE9EUWZSMVgrUlpNVmNwVGZvL3UybkRNblJhZ3F4V2FNbnZoRnNRRXNG?=
	=?utf-8?B?V3RKUkVWVHBhdWFUd0hWSmV6MmhISXNaRGRPRlhaR2dmQ2JsbXpCUGVGVFJR?=
	=?utf-8?B?Q080NmxkNmEydldJQjI4amRUamZUU1JaQzVZUUhsU1l2M2FQSkRNUzhRL243?=
	=?utf-8?B?NVJBRGZOYnUxcmJuNUZjdS9JZlVaamZSdXM4QlVickRHQ2o0cGZUUjJ5a0NB?=
	=?utf-8?B?MVY2d1VUaW9pOVNOQ1FRMkNEaGpITVpSbTRudWVidEF1Zm9RbkRyemo3eTJK?=
	=?utf-8?B?YTRxb2R6MnpRTGRXVVFNNkRnOWVMYWZGRDdkOVdVaG4xTU5lL1VJVDhSbXlE?=
	=?utf-8?B?elNMYk8yZWI5OWVnbng5TFZmTWo1THpUbU5mdU5IbENKZkRlTDhHa2dFUXpx?=
	=?utf-8?B?WHpVYlBqQVRUU0o1U2VxTmZydlJYQ1dyRy9pdkc2Q3FaT0hnaDFZOFZ3T0c1?=
	=?utf-8?B?K2dJVDdaM3FTWUpQd2FlOCtsaHlIOXFQNGFzQzFVd0FsNmVEaEdyTEhoRDBW?=
	=?utf-8?B?WCs3dUJkZlBSdUk3UDZ2TG5yUzVscTFiWXdtYlE2WVE5VG95NGR4NDgyVWQr?=
	=?utf-8?B?OUoyZUVKeVR6U0FFeEdYelFSK3ErNzBhQVQwQjhQK0hwcTRHckNWWnVGVEJt?=
	=?utf-8?B?aHVOdDk5TjQ0Yy9TdUxySjFDM1pHR0QwNDZkR203QVRZbTBlNXZObVBJS043?=
	=?utf-8?B?RnowY0N2dFAwNnlETW5MSWZZZkpGZSt6LzhQVEY0N3BDbkcyVGp3V2h6Njgy?=
	=?utf-8?Q?9FSQL3EahnaKkFc3BYuzNWmKaLyAzkHA9w4I+5ISud1Y=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1400;
	6:bF2MaHUQwdVf/MgVXVbtAF5DaQYOgkzTMxXZ8nTMS122Je4sqqdrrls/7BVH7hyH6aR2Z4H3v9uzX0XdXXUNtdRjDiJP4+2+w0jIny33czRosbz8ajm4vAYI6RdakfEW1UnGcvDiKkXcf7EsW0H7CsHk7mWVn8tQ+BkwiKE5lLWMm5Ttc98sBDF/l7gfuqBNT7cMulrhgVckW/fclGz9Vi5nuGR/3KUOOxr1i/IJ6pj7nQlzN7jTUbSWp6lj6qH+BXAygj6jwpK7ow3c7f4353qBOs0CENWOdO0OgMjHsLH5kmLy87Sy40HSvvfZg0Eoc7YfmVolwz/o4B7k/qi/ixdz6aZpPZGivC5j3DIKpmacWYTHngDwLWF6/tgUVL4tVQck0LFHWV/EiNO3gQWP/A==;
	5:JbuaGbeN/9PzEVtzWlBABtkn+lQY7LOQ81s4mH/QDJtpCVpEEhTczWFbaAna02Rb3Q9p5K2fjcP+9VVZWA4qJYZoPqq0wqEsihnqtWDswbeIWOiJZfRdLKC8Jd3z21XnVCFnOiZLX75nLQiGSH0pte5UxxnjNXVc6m7smmNoTFk=;
	24:FAtQzMjQMsuxRh0AUE7oDUiv6AxBDjnW5oy94ezpHu92nRWvWtP1+TPCr1VaJFDrIur756EI4eTTKrKerUxl3xDv8e+1mW6xz+hwsAkTOWI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1400;
	7:OEwWD/KrsKkKzj8ujmE/lYe3zLTcEyBicsiGLu991bwX+BDnjv8QiWlg9WAqTsDuWLWaV00GIUAlCOk/70o5oPxogacjRz99jOWYVIV3GZBGZ1kChvl1f6QyuokBAEwiCAHTANKDtPZoxqquhhkDGx3AWmRwABpJppir1IzL6jQmqXVVMpwaD1hqUJpf/EyEwFYGUofM3pCuAR7ethBq6iMvhOzbz3rMO/W380glE6S3V17tFbKg/ih6wmWxUQXC3BsTCK2kuXEip9q62/kF22RcpdDx+xA0jNOoJa5jZDrcq6blDPNps18mL4KSdai+OFjZ/TMkqr5liu/d9OPoJg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2017 16:42:09.2740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR01MB1400
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] oe-core and meta-clang llvm coexsting?
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
X-List-Received-Date: Fri, 31 Mar 2017 16:42:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/31/2017 01:51 AM, Burton, Ross wrote:
>
> On 30 March 2017 at 20:20, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
>
>     I'm trying to integrate the meta-clang version of LLVM 4.0 (used for
>     recipes that need a newer LLVM version) alongside the oe-core
>     version of LLVM 3.3 (used for mesa). I'd like some recipes to use
>     LLVM 4.0 and some to use LLVM 3.3 and for them not to collide with
>     each other.
>
>
> Not that presumably you mean meta-oe, not oe-core.
>
> Ross

Yes, typo :).

