Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0048.outbound.protection.outlook.com [104.47.41.48])
	by mail.openembedded.org (Postfix) with ESMTP id E680D77AE1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 17:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=VopiPzyLuJlZN53K3lYHSMugS4CvHFBYf1P2AcCzhuA=;
	b=qXvTFA+xXMUT2ipQnTPXj5BglmaOF1XagCVU8/iC5V8zZT84M1naamZ1ARZeJVG6Xkc6ZDTR61r6aAdGAS68rphg5GYsMT+WWbqZWadcHT50eSDPD/JafwEbuF6p0FrAnTey+X+cI7PonBVbyTtT3DOOsR0bujAgc8o0cUIrzgc=
Authentication-Results: windriver.com; dkim=none (message not signed)
	header.d=none; windriver.com;
	dmarc=none action=none header.from=xevo.com; 
Received: from [10.0.1.79] (65.122.179.226) by
	CY4PR01MB2679.prod.exchangelabs.com (10.172.135.13) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.13; Mon, 24 Apr 2017 17:52:37 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>, 
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	Patrick Ohly
	<patrick.ohly@intel.com>, "Lock, Joshua G" <joshua.g.lock@intel.com>,
	Robert Yang <liezhi.yang@windriver.com>
References: <1492820479-2808-1-git-send-email-mkelly@xevo.com>
	<1493051478.19076.117.camel@linuxfoundation.org>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <23d7c81e-276e-f0a9-b3f8-dcea28aa00a7@xevo.com>
Date: Mon, 24 Apr 2017 10:57:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493051478.19076.117.camel@linuxfoundation.org>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR11CA0023.namprd11.prod.outlook.com (10.172.48.161) To
	CY4PR01MB2679.prod.exchangelabs.com (10.172.135.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8538632b-f57b-4792-aa5d-08d48b3ab224
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR01MB2679; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	3:inzumuJrio5DV0jAttvEz7w1EAyuParLJHB3k3ripGY9rRCCJLgtaH3F3n/6OzmYmrGcX/UpAKJHYu7tditYIWlUEQ4bG7uXXhuECvIArig0+lrln/SLgKFCK+Ka8suPokuzkdpTT8Rjmd5XGpljynfBd0jmy+KczipZb03XBz8iHjnGCoB7xG11fd8Xl2UZLOA0JlYE4iATmTgrPQUnNiQauUB1cBXC7of1a3txe+zO77+qg/JBsLNUsxObyr2eCQ6VTnjMU1ESH5MNFJ3+Dyi1uulfJwkUJVwejecqsbv/SQro59u6PlqSSVkWOLArW7+8NEIMtk3cJkHjDJH4aQ==;
	25:kxoOKnSG4wThgSdIrO1iSoih+3lV8G8zVjOEDj/aLmwXqQfD4iuBeky+hGhAe053ZxtZ8fU2dbuLzkrSHrMLkyM7qYV45WZ9uBonr8fTK6mgqDaLx9rI8wvAY1ciMtMhuaQlV9qS/Zj1Dz1nK3kkfSBXKXNp38WyHjuDF36BRLyDSikZJC80RtPLqR0T3MTbLewt29umlTVD+2se06+scZhvtCPD+0MidjtkLGXTLeL11LCwkUdioIg9JWGIiAiv7+C/AfXdlOeUHrA61Qmu+7QU1LvW4VQMWeZrBK/pYOVkRcAbnb9szm5QPh6DiO7OFwXjlyIuEpc7BhQ1kop20gt25FjQI87tVMFzElJcHIdkDNAoxAA5hTkAMbI54X/x8DXl3wHXZ5Yo3npoFhmYlXbgCGwuJHMvtGky0uakeh/sisUpMEXkHAmpZJ9ijNbOesb2XhXkxPsH4ZtVSIYesQ==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	31:HH8QaOu+PXknl+VoXVFHVrPtc0/dMlBG1y4UqOGmOt09Ny85qb4pbGjGr5i+7kV8n7/4H8B1VkUYaY7YEcoxOeqBnH9YervNPE7O//wqtBsadshxn7kKf0bajX4qZwaXJqF7AgTe+hHVnaUpYZ1O3DXZrTu/ZBdtaDJ4hHGo7S8iT7WVVQo2tw8eucjan2GjInYPDlg31IHxNgCIs4zmk8MeogoKP5neGSsGhuEzNs66vG9FWMCQSfwlILNyJ7zJNEvlb5E17ORAsPFuxBS8kA==;
	20:7R8JJsjrfiQxvTKhpgaePcwoN8chA4QKp6ufmzXK7+qJRTFzzYS9Cic9yo3wE32O3wURC9uBhcgieRn3TrsynMp4dhGvG2tGpCF/yJoj12n3ngzFumtbkyrOIy3QcmPU5IEDLEjuCcz2HI/BR4hVKSFND8QYiI55QOXMIDR+mZjgvbBtwvxQ+0byqEgHMK/thBbelwykzwQJ+kaQ2CwRm6jZLK+nm+9N7WwW9vB0gE8gGXjgk4JsnZp2TLhgkaKYVn5kpVaEIAdIRJP/sJb//qtIY5meIuVVD3pZ5jKa842nRHNO1IBur2aVYPOgWOvOXMzyZi8l27eMMzh+UhSmpg==
X-Microsoft-Antispam-PRVS: <CY4PR01MB2679D78EF8485EBBF94EAA32AB1F0@CY4PR01MB2679.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123560025)(20161123564025)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(6072148);
	SRVR:CY4PR01MB2679; BCL:0; PCL:0; RULEID:; SRVR:CY4PR01MB2679; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	4:bn9pdlYCUOS8glSy4yRAiwQtQBnbD+nWsVzoRk00twiCX/857dUJK0vvgGRVCDcB5hvkfAz/g504tgIkF8Qz+i23wB5HvZ7aPnw1H4IhaCOLdD1SMc2aMryCHQZMa5vt9XYZzakUSiIys+I9yA5Nb4aR5YcL60kBhEMBlOxsjIkNqqNxxDNyH/zjzBctgD5QQ4q7AKhMcSjdqK+uCihIpYOuZpQNtgbzkPk9L3njzQTvdckDp250X3pTvz5iKCWPaNxmkiwm3zxmOGEsNfIJFqNl91gxkyIdcsCDf7UslkrvHAOQEUiYsbIKEnycTntNA1rU7shxGckJshCndiCLHR99lv1+LSfymW7av4H5rjXqeeTPKL6o5VLdWqfYnCjL6iGZtxEWXoIXgf4GHG/NUBQxPRrTP29aqlF9ccYxI2KELeHBPqWAcXPZ58e0O4vQYE1ofUaUgp8UMwJG6VLSIjGBhtFa6NKG2riSZ5odJtZ4baaj3zAZLGHzZHW39TJAOcNec6uvNyxWzAVQ4jIXLrD/LSSzkM0C4wuvypoK2sd1AV09he5bnS6hh6KtA/C5kdWnVvwsgpVX5PSfzqjgblxZR+h4RCO7EX1sD8WeClFwgbwWDZo98t2Z/fkFmQXSi+0vBipE0n0e7PWB7Lq84pPBt/S7qHqSvkJEB2EWjgToZVm/CoSD5aV818MjOR3QAlCVa+muxt2PtMtBgelZ2A==
X-Forefront-PRVS: 0287BBA78D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39450400003)(39830400002)(39410400002)(39400400002)(24454002)(377454003)(377424004)(31696002)(8676002)(47776003)(81166006)(3846002)(54356999)(86362001)(76176999)(4001350100001)(66066001)(65956001)(189998001)(6116002)(50986999)(53546009)(33646002)(25786009)(50466002)(23676002)(2950100002)(229853002)(42186005)(6666003)(5660300001)(36756003)(90366009)(966004)(53936002)(38730400002)(77096006)(6486002)(6246003)(2906002)(6306002)(7736002)(83506001)(305945005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR01MB2679; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxTUIyNjc5OzIzOmJzQ3lKZVIzR0pqS3ZkV21TNGFGMW9CNTFX?=
	=?utf-8?B?OTlhMm9hQnBCdVZnd3Z5VGZETERmeHRUNjE2T2JpZGtBaXhKVFVRS2tkWTE0?=
	=?utf-8?B?UzNKcmJPdXV2KzA0eStZSUd0MDZXT2xEMzBsT3dhN3ZqbklPSzliYXdySHVD?=
	=?utf-8?B?ZmlHalJsQ0Z3OHhQTXl1NUl0TlR2eDVadHNXbUYwb29DcDBCRnJVRms1Qnlw?=
	=?utf-8?B?dktYeWs5RGhkMDBRNjV6cDRPM2dCY1hXYU9nUks1dHNOaEpsNnVUT0kvbTZu?=
	=?utf-8?B?SGREWHNUVGV0UW9ITnlrTUhoM3AreXdLQytoYzdEL282bVpNb0d3REhXellF?=
	=?utf-8?B?ajg1RE5Kcm5VY1YyWXpXSVoxVkJyTUM2RHl3ZUFaTS9UMkdYL0ovRnl6Uy9C?=
	=?utf-8?B?RjJGditJVmh6WFkyNjBKaHZpWnU1WGNTbXdDU0N3VVhmYitWVUtndERGSXBZ?=
	=?utf-8?B?eXdXeGtma1RWYm8ySVBScTN0VGdJbmRmSXMyU1ZReHZMUTNnS0ZvMEhaMHY2?=
	=?utf-8?B?L3VyOHZEZGs4L3FFeDgzbFJML1BiZHk0Mys4enl3eXhEUHZFTjRQVkZvMDcv?=
	=?utf-8?B?MjlJMnozblNJZjV0RWlXYXpZaTZmckRXdUR0N0o3WFhuR3lUWGx0bFhQZldh?=
	=?utf-8?B?ZGVFb0ZOa0JQeG5LeGd1ZEhZOEdQbnZGNW1vamNISDFGOHNiOEg2aVB6b28w?=
	=?utf-8?B?OE5Nbm5Pcnh6RGQzcXZqblNEb3VMclNtV0hWZnZGaElRQ3BFT3ZPNUlTN0h3?=
	=?utf-8?B?WkE0VXVNTWFMcm9lRlJSNmJmbURNbjA5OWdiMFdOU2ZHME5HZzVhVjk0VlN2?=
	=?utf-8?B?SkpGUzV1NnNtMTV5TDVkR2JKTytCdk01V082aDJTdW9UM01HNm1RcURRRnFZ?=
	=?utf-8?B?MkV6OFZldXEvaTV0Q25ka1ZUUU9RVXBtRDZ4Tk1vSWtTdzY1ZEJyQ0E0Y3la?=
	=?utf-8?B?NHFjR052aWpCS2l3aE5pSU5kMUtxVFVEdGdPZ203VUFjSDNrR0FhZklJbVFT?=
	=?utf-8?B?dFNjNTF4cVN5R1RFR1ExT3oxUEMzcVYzYWwxZW5JTzUvQzRIcGQwM0d2eXE3?=
	=?utf-8?B?dUpDekY4RFQ0Y0F5ZDFMWXVHOHk3ZTNVNnRadmV1bFNLNFhaK1o0bHIwdzFn?=
	=?utf-8?B?Q3QrTXNDSWxBYjJyTjdERDlEUnZ0NFRsQzlFZlBHVUZGZ0lNQVk4VlVvV1JP?=
	=?utf-8?B?OXdrWXBlNnd1OTA3RVZkY3FmRHBRanQvbVJnSVpJQ2NGSzcvcEtiMXVtaDVr?=
	=?utf-8?B?c3JUTGNXdE9qNEMzSHdUZHhZbWJoc1YwOGorQzBnRlpxOXV2SE9vbGJLcTc3?=
	=?utf-8?B?a3NqbDlVOUNwUEVoTXgrak5URGxDSk5ibk5kQnlYa2FpdzVUb0xiSmxPamVk?=
	=?utf-8?B?czFpZkpVSWlIc1p4YU9wWUhJelZWRlJMTXplYlhkbm0vdVVVeks2STkxYytI?=
	=?utf-8?B?TDk4bnZpVHJJV0hvN2J1MWFxL3E2OEN5SXh0dlN0UitwdXJaSHc5U0taMldq?=
	=?utf-8?B?VzlrbXlMY3daMmU1UnRxWHdhMERNdTVUd3JGM0UvY3VzWERtSEFmTkE4S0ZI?=
	=?utf-8?B?VDZkNG1vNmpFdncvSWgrOFRtTnpEakE9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	6:9NqxgDCQYGkVTcWocsTtqvuQtH7kx2bT61fB5WI42ivK0j8jHxdW0okScmMorNy+mKxrH3L19f5P1HohLOveaYy0vORd6jO8oPaMQjDE5BHbFBnW3NQ7e6Fp2zbopLUulp/aDiNS24ArOcopkvAPwSRSpO9dBMcCEFhMOj6H8EtOT5YK13eik28QCAyJcdp5bCyLiUFuTBxJ1uqrGg0sT2b6Pzog6sbOCDmae4JAo92yH+yeN1Jee9QE5JGJXzc7CprJ9VmLbeDxulOmhao/mAmlgkegcFL4gI0uTILWJffzxTFmhwJI16CU2jpTVG4zvNlsaqvXCT0kFhfrG03NcSLioKO44Fwf6p4+11ZbjsfUJJt+SncZgYTAXDNrS562PYg6IFBr6MtaB+Y6wo8zz2w5ffwev1OtujzOwx6Cr+3bfO3AUORAbZffNap+cLcFs72VQDQ6VFwjyEcZUuChYPTgeZm/OTgImK7yeTCCTf2oLGHcOK4FWGQKB0FZ3lvW4T78nVVM2mX/zqT/4J6LSQ==;
	5:DcAWIx4PfR2MBuyhsCMed/DM5efzuBKrfYNwEgVLtiTgQ9J0K1pPw9XY6DHKIBeHSOhAaL6hGrji+bYbtweKcQnQTCRHMt0spy9Cn0HYthsuMHPkFY4MH7hzZ/7gmuMmxW4ALSsLNq4pfphVk0JoMw==;
	24:l+YgeQNlAr+PgWZMzeT3o5fJeq+WH8U2ygMjvTtCQrm4h8aBhruc81E+RGGn7j/V3zPHRdRfcXytizINQdZOOLW2v/mHMV7r+HGetyRn/p0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	7:GokpeEPMd7WbnlDpwGeCGFdGkcOIwT+1WPoJ5JQMmHO2BmX+Io7cSd5HbKgiZs7AdDnrDEox8fXpW613znsF1iC9GWr5nXWwAHYVIFa+J/8uFVjXzhc3h4q0i1qBWIhuVTmPtY07njvoaSqjLmo2BNp9frRpW+Pz0KWO0yiAIsYyl6jv2Xf3Qsd45nLqEAdwByTlNK2AlD9HQGMHDR85EdzNa7+Hi8YaklgCy0jZ76LVWEaAs6vyfxPphLENb4JQWRNQiwZjghTzqW7e5BLcTNTFGYWGj6xx4s+mp5cQCILNuvDt0VeHgUSREV2WJLd5z99iqDZeXh/0nqt3k/Zxxw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2017 17:52:37.6671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR01MB2679
Subject: Re: [poky] [PATCH] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Mon, 24 Apr 2017 17:52:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/24/2017 09:31 AM, Richard Purdie wrote:
> On Fri, 2017-04-21 at 17:21 -0700, Martin Kelly wrote:
>> Currently, the qemu CPUs for are specified as generic, but the built
>> artifacts are not. For example, we build x86-64 artifacts targeting
>> core2duo but run them in qemu with generic qemu/kvm CPUs. This causes
>> some packages that take advantage of the host architecture to crash
>> because they try to use CPU features not advertised by qemu. As an
>> example, Qt uses ssse3. When artifacts linked against Qt and built
>> targeting core2duo attempt to run on a generic qemu/kvm CPU, we get
>> the following crash:
>>
>> Incompatible processor. This Qt build requires the following
>> features:
>>      ssse3
>>
>> We could fix this by making packages like Qt not take advantage of
>> CPU
>> features. However, we will probably keep facing similar issues over
>> time, so it's better to resolve them in a more enduring way.
>>
>> Fix this by making the qemu -cpu arguments match the built artifacts.
>>
>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> ---
>>  meta/conf/machine/include/qemuboot-x86.inc | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/qemuboot-x86.inc
>> b/meta/conf/machine/include/qemuboot-x86.inc
>> index 06ac983..acd03a1 100644
>> --- a/meta/conf/machine/include/qemuboot-x86.inc
>> +++ b/meta/conf/machine/include/qemuboot-x86.inc
>> @@ -1,12 +1,12 @@
>>  # For runqemu
>>  IMAGE_CLASSES += "qemuboot"
>>  QB_SYSTEM_NAME_x86 = "qemu-system-i386"
>> -QB_CPU_x86 = "-cpu qemu32"
>> -QB_CPU_KVM_x86 = "-cpu kvm32"
>> +QB_CPU_x86 = "-cpu pentium2"
>> +QB_CPU_KVM_x86 = "-cpu pentium2"
>>
>>  QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
>>  QB_CPU_x86-64 = "-cpu core2duo"
>> -QB_CPU_KVM_x86-64 = "-cpu kvm64"
>> +QB_CPU_KVM_x86-64 = "-cpu core2duo"
>>
>>  QB_AUDIO_DRV = "alsa"
>>  QB_AUDIO_OPT = "-soundhw ac97,es1370"
>
> We've had problems here in the past:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b8819b02dc4ff29d678cc55887dfe6c2d109a67d
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a2a20adbfd03ed9f07a3aa38ee2c9a8d962d4bf9
>
> so we once did use core2duo and had to switch away from it after kernel
> issues. Admittedly that was some time ago and I don't know if those
> issues were resolved. I do remember other debates about qemu32 verses
> pentium2 and other tunes as well so I'm a little nervous about changes
> in this area as the issues were subtle to track down and fix,
> particularly given the range of host distro kernels we need to run kvm
> against :(.
>

Got it; thanks for filling me in. Please let me know if I'm missing 
something, but I looked over the bugs and I think they are different 
issues (not caused by pentium2 or core2duo settings).

Bug #5817 [1][2] appears to be an issue with passing two -cpu arguments 
instead of just one. This didn't actually cause a crash or panic AFAICT, 
but it was confusing. It was fixed by always passing in kvm/kvm64 when 
--enable-kvm is set.

Bug #3908 [3][4] is caused by an interaction between -cpu host and the 
kernel. It makes sense that -cpu host could cause issues like this 
because there are no guarantees that the host CPU and the target CPU are 
100% compatible. In this bug, some kernels worked and others did not, 
which makes sense.

These bug fixes did fix the relevant bugs, but they caused the bug I'm 
seeing because they switched to generic CPUs (which advertise very few 
CPU features) without switching the actual compile target. Thus we are 
building for i586 (pentium2) and core2duo but running with generic CPUs 
that don't know about the features we have compiled in. Any program 
attempting to use CPU features that were compiled in but not enabled at 
runtime are going to crash, and that's exactly what I saw in Qt.

Obviously, a change like this warrants good testing, but by my analysis 
it should be safe. If there's some extra testing I can do to help out, 
or if there's  let me know and I'd be happy to do it.

[1] 
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a2a20adbfd03ed9f07a3aa38ee2c9a8d962d4bf9
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=5817
[3] 
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b8819b02dc4ff29d678cc55887dfe6c2d109a67d
[4] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3908

