Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 942 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Apr 2018 23:18:34 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0069.outbound.protection.outlook.com [104.47.34.69])
	by mail.openembedded.org (Postfix) with ESMTP id D23FE74551
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 23:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=0+RKHzs9PoY13pAY7TvTzRZtIixGg0ie9Fqb8vGti0Y=;
	b=ewqmhjY16Kep9LfuDoj4COiMuG6b6awF7ATFCpl+2gtI6Gyc0DLmgHAOiQJV6VDIw5YYSiiF7Xg+hAS7bQB4+dEA3CyyTTodqghnenQViCEDw09HYJH8mhoxRrPH4eDggt57uvl9HOR/TL2mOX8BE80KZM6HnNGMA26+rPvCtTg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.156.29.79] (205.175.119.34) by
	DM5PR0102MB3415.prod.exchangelabs.com (2603:10b6:4:a0::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.696.15;
	Wed, 25 Apr 2018 23:02:51 +0000
To: Martin Jansa <martin.jansa@gmail.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
	<CAJTo0Lb+GDpEMbZP7tgVuMtpw1=38u486VXoQL1NFGnFpTD4Mw@mail.gmail.com>
	<2607b2d4-c37f-5693-1002-db17f9e1024d@xevo.com>
	<CAJTo0LavpmZCQPHSTrsuJwEZHLT2eAhKLQR8A7Fj3kX6BTC0wg@mail.gmail.com>
	<20180425195437.GA2244@jama>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <b640e9cc-0bce-0b7b-9639-0a37bf459695@xevo.com>
Date: Wed, 25 Apr 2018 16:02:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180425195437.GA2244@jama>
X-Originating-IP: [205.175.119.34]
X-ClientProxiedBy: CY4PR14CA0034.namprd14.prod.outlook.com
	(2603:10b6:903:101::20) To DM5PR0102MB3415.prod.exchangelabs.com
	(2603:10b6:4:a0::16)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR0102MB3415; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3415;
	3:bauaD5KuDW/YCImb17CH/aImiigCEQFiyEMZnRJPyOXJo2ETbAixfXD7x3sBjvABp6CUVG8DnYx3PxYwrSKammoICvGSH2KHu8RZidpKCEtqZnxpmk/T4U37Ea1T05RV0V9QuGhkrnKNi8CNR6qUG9gB1N6RqrLXpgctMf+BfOY73O6ryiC++zt7A24f+pwI+d88rV5STe8FVk2UTJx0wunEeS5ZLulVzlHw5ZJry129nDolgS3vQy1GXzPoCSWf;
	25:CIPpGoBY3bqZfMyID0IwUElI/NIE/dwp4BTs175bUx3wSwwiIA6c/IyoyZ7D0eTYqGkxh4nmmb5MEy2h+i7PsS2Xhy0SmcPC9RZDFyXclQEMA3gJ3VDIfH+ExHbfU1n2vHejV5+btOmqEF831miHfM0QD/F4nPDvmlIwC99kl/c7/3VzgNYULxBlZvV21ipOXLIgIND9mXpWjjDhUWmE/bvHzdgjAk64jsbZsxS76Nao+vun4fRFJVqNCWAlge/oANjnbVP0cX92saPdRxP9QSmNHV2ADWF0V0fKgQeilWsX27Z3jYtSwRMdoUeLaD6ilymYpF37NKNwgiPBFqRRCg==;
	31:ptk15TY/++1EUHsrZZWDUHgOGCs6v+DT4vdeBSOLMML8Vca0p5Sckl/Yr4M5xG+L9OUAcaiGxC1OHKcvjuqV3Q2KbAPLrOAEPNPF6uIIYrnl8+BEXETNloWhtS2eMEE2MD1pube2guZC9Hr4tadeBogHJAPyWiZcqg8QU1qp5fOJJ1QpPXlaWjGhf99t6Qhp0EJQBjwCwkUqvj0OS0bcB/Efa/5r7dt8E6v3u8Buyo4=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3415:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3415;
	20:ld9KlyYM07jLPxV0JTuIWOUpAtHY2ICzZOttdU4U1c03wAlHf+/L6hdk4gTJNf2HxEqvAGWm+uAET6T/m/RP6JsmQGokB69OS/CAb/qktfvjrKBJa62cfzeGVepC5j+ltu8SGc5IHG4VDlcB4Am0c/7hr1zW4/sLY3kYAmv4OlLMgIdw7cjLdKJbM+MzJUlyW/Key5uhGbQqN36UuYdxjVUUijE6YiWzk5GsRt+Ji/2op+wr/S3QpnHYE9Zw4IdBJA09qlibF+4r5BGoBkYGAvdFHExALzAW+JVG4wTR/CrKkazfGxkEonezZHVx2jJatwDnMqJ+FnChNiuSk25E2pgcKgrsM7ccgcc1E8AuXuAmP1jo/46SLg9y5+Z3fbV53acQyDArnYJu/Aioy6uKIx9cNAxbfnwvYrkdSArvnlCgqx3BQ3fOXQYlNmHtRGLZ/g6Q5cU2p+8QwQDBgAJp9fRoV5sska2HlCq2rG3ZWPg7aqGy334njHzxfl35XCxV;
	4:ZFHmhnTjQEu6GVC6SueMuk8mFkaC0UuszqLOpm4YZ9aIRWGgQkcvIItMsH82nE1Tg7DfTufoLrUIx+grkLOiKWdWmT1fMk0By2n6yDxqFCZTurK4s9+JG1IIaElYId9gnjOfBZqN9wlB/Im7Qo+RMtmoWNqKrLPXvGUDRqyqNB7kIXG1J2m+/kLglXVk2L8HUYK3sZ4QxeNMowERUyjV1WNK0WwWmPHbjAT2kD7a5jTbmUqVpZFoz76iE6wyGoWpMlPBpu1NuLlcmZuW0DVA4Q==
X-Microsoft-Antispam-PRVS: <DM5PR0102MB3415C27856EF32EE34DA3231AB8F0@DM5PR0102MB3415.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(3231232)(944501410)(52105095)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011);
	SRVR:DM5PR0102MB3415; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3415; 
X-Forefront-PRVS: 06530126A4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(39840400004)(366004)(376002)(396003)(346002)(39380400002)(199004)(189003)(93886005)(77096007)(25786009)(65826007)(2906002)(86362001)(486006)(446003)(11346002)(50466002)(68736007)(476003)(8936002)(39060400002)(66066001)(47776003)(65806001)(81166006)(64126003)(81156014)(36756003)(65956001)(26005)(4326008)(186003)(6666003)(316002)(956004)(2616005)(16526019)(31696002)(54906003)(58126008)(6246003)(3846002)(5660300001)(106356001)(229853002)(6486002)(59450400001)(67846002)(7736002)(386003)(305945005)(53546011)(16576012)(76176011)(53936002)(230700001)(23746002)(52116002)(97736004)(110136005)(478600001)(105586002)(8676002)(6116002)(31686004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3415; H:[10.156.29.79];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DM5PR0102MB3415;
	23:CG3rR0brTVAm5aqhSL8/c8sCEvAmjX6KOtB?=
	=?Windows-1252?Q?m1/vddmgequT5qNF9vDbJnvwh+ah6B2k6KLI/VFrdnqtT0EFTx6xJuaV?=
	=?Windows-1252?Q?8BqYmsVluPceH6jDTHQLAenK3PLNs83q2tGHfWiBUIoH9IqVzMhsJwlU?=
	=?Windows-1252?Q?OsTn1wZ07oZHPoW5WMg39XVYqygPniCEmVNotRMlM5yAjznOmMOcbmZo?=
	=?Windows-1252?Q?2Ulc4QOhfq40rLGwSQoMvaak2S9qi3Nnv2KoXjUJ8HOBtkQrEpRuANGA?=
	=?Windows-1252?Q?8RXsr/xGu4uWMOfNZTXEZ9F6VSePmII9xyoyMHXMvZXVjicd1mw18T+3?=
	=?Windows-1252?Q?6h/YXjycSsH/rwXEoFCUHYZ3A6Z+hGMM1vu3GlM02ZWeA2LrKjWxxGCM?=
	=?Windows-1252?Q?Y8symAj1jNbdfP2KfT9VxMixcCtJu1qUvYYUuvm/bePRi9y0AHViJcNz?=
	=?Windows-1252?Q?W7Mxr1+YuKMeHtgCaVX0UfEeFFSsIsPSmf4kSL8rTahtThwmSXmasJxb?=
	=?Windows-1252?Q?9ngVmm5q0QrBGd7J9U7zRWIOxaSrVeaq/3Wvh1kiabXAweQx5KmY7EIF?=
	=?Windows-1252?Q?u3xDW4AMLszVzEMrr3INFJFhGpuTTu2L3zDlbBqqanzMt7vxghHa28AE?=
	=?Windows-1252?Q?YdRygs6FYPHIjO+UbB9mquTYKhl4LVmsDyY6dCuUnOObLDDMgm7eB3ZR?=
	=?Windows-1252?Q?kobsoLKbgysqSwdpEaL7rB60n2hE/w0MgKJcPUYzV4ahdf6P7D4OEJJm?=
	=?Windows-1252?Q?QQrtVTtlK1EN3FR57g4TYkwUdutME8sDh5aDtMnCGnK0PF4B5RFNleP8?=
	=?Windows-1252?Q?2I37SIERL/BDLYOeH9kZv/OE8fo441EuXc0y4TGisrtvtd9PUiKECJuh?=
	=?Windows-1252?Q?hipj31XXSw1hj/syFgsOMmRN1UxbwgIonZbgcogCPNGK4VijDo0svfJs?=
	=?Windows-1252?Q?VEom6J4NJXO2onhRJwa3q199dsvXTiNumgzTFLFuTTqeDMauTPzMzPP5?=
	=?Windows-1252?Q?z72jsXzXilOTe/fmszzA5N/HyAEd15G/IpOMzP0d3S2AcsF44ELNdwVc?=
	=?Windows-1252?Q?5dl/U9rsSPjQyzMBbrkPQBFfEKp3CX3G4lSLhMWXMaYQLzFLnpHNUcn0?=
	=?Windows-1252?Q?KUxbjPYTsI8OO1XmJ8deYfKo+DGQ/tO+0FAlN7TgD7sIsshu/NtBSzhb?=
	=?Windows-1252?Q?lodLWZml2BnC90y2poLZHTjjtkYIi6PfCd5wdXpsUITG+qqQkBQiSod/?=
	=?Windows-1252?Q?ljXxfisdxXBMHS0c3OJ/dLSLOc9f05bBGBQjIQPzGp/2e1/9lOA9Z+Ov?=
	=?Windows-1252?Q?wJp5fRm0Xp5vM3lfHy1VnO1RIQoL+nbYCnjWoTFYQOSMkWmfuRu0K1rp?=
	=?Windows-1252?Q?PycTiGz2Lxep265ptNczcxxg8QwXeZHW9xjQzflgCgkyYjbX3ldODlpk?=
	=?Windows-1252?Q?3O6cyi+NRYZTM0qdLN5ucL3cfYVqRlJimc0Ucb0q/7+OqDcbFGLoMZZm?=
	=?Windows-1252?Q?XMjY5F0It9WCdMdwg7FlTH5E1rLU/9ML52QW3ufBQtk2aSLhRAoJBEQh?=
	=?Windows-1252?Q?vhd8k5IbIdkgCppwVfMQLK6UOO+TZM8hm3uoS7x06Gj3pqlJC7b5FqSK?=
	=?Windows-1252?Q?/+g=3D=3D?=
X-Microsoft-Antispam-Message-Info: Ju2tuQGgbLvyMuKzH6O9R1U1QgjsvBU6G35f9QA0y2FWatKoP8XEGO3YoMLM4WNM74qpa2ZPNMPdeBa+iIVfk90Zu57MhO5jOKrgas7pheZEBLRLWiF+mIVv8+0VR1MovKa33kwbMwWVem38gB7B+lJc93kZY5wF4ugoQV0Z+5pmPVq4HOHCWkBBWholRK68
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3415;
	6:BItvgmnvqpKhMRkzVQn/iC9w4WhFkY1MT94klRLy1nevvQNuwhwNjr4SK2Bd5D86ayOce7PuiwaPc9bPap67skMbdcmiVQiW55X4cRWR4hDyGgk1bV7kpN0QouOSBxSM9ACqUqkMV3PN3AhdBReuiEF9eUVcoaGGIIdwItW7t2uf2z8ZkUXM8iow6hfSxcYs7NzE5+ql4PgWPu8bNPDdag/WZf3ybC9Q9Zoa0GFB3UrtA2UFy9CVKTPDcATEq00eGFhCbGNzLUyDFZ2FuNoISbXygTP9rXJudwjRkkW+EDU5SEeVqn3DgCCpTrjDhMBLqusDezp18+SR4lLaxru/hyQLvWzWCi9/DIMsP78gnEqnDsUfRVR7ZA3jR7GTZX1fNMQHWfevAoXyuBfSauMOVC40AhRGxkOUkGi+ixKNiK253Ibdl5CRR6I7YMeKT9TV93AHvcTjPyCnboYRySwWkg==;
	5:11pCvs2vjrp5Irilv+f3foWnVdldszk0KKG0Si5Pn8I27iIt/VPxVCJItR2pFJBiStUblhWkHE6ivyXgFmueTYycv/NMNQae3hzUHnL+6eFUY0gmiHG5I5ge3rUi6EaOb8o1GxhuVTwMQmnBsAJGyz1h2KE3Yz7D6x3hSBRreuU=;
	24:YfW4m6wEI0/gU0jQ6Fnjbp9w5jO4DldsyraUxkRHEidLz76MPEUMhJa6TMTcZMIM+iD5AHAaJEiUfxY/nP51NaSuzRXlMtAcn6OSmDpdzgk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3415;
	7:fJd4xNER6trP5X1GX+LOKJ7qDXgjpw2h3uq14OyrtSCAIwDZwy6VLMH4OEFoRbv5V+q3W8kz3t05dRevtD9gyviELIDt2EUqvvvDeE/VDTYUi/Q2UBextk/M8Hs7TuzR5SPUN5RXjy/oi/DWCyqIhBITklK8HAMgupfqzOc8sfHCWJOITnsqhthv4C0srnvgsjqiH/3KGl+BllJT1PFf5Ypg6BrqnF0lQLtQCMRtGES65lxDn+PC2hzUOpV1k9y1
X-MS-Office365-Filtering-Correlation-Id: 95bfec28-5a65-4834-5862-08d5ab00ac5f
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2018 23:02:51.5572 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bfec28-5a65-4834-5862-08d5ab00ac5f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3415
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH resend] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Wed, 25 Apr 2018 23:18:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/25/2018 12:54 PM, Martin Jansa wrote:
> On Thu, Jun 15, 2017 at 05:37:50PM +0100, Burton, Ross wrote:
>> On 15 June 2017 at 17:17, Martin Kelly <mkelly@xevo.com> wrote:
>>
>>> I am no expert, but running qemu -cpu help just says:
>>>
>>> kvm32 - "Common 32-bit KVM processor"
>>> kvm64 - "Common 64-bit KVM processor"
>>>
>>> My best guess is that, running on qemu without kvm, both cases will be
>>> slow (since it's all software emulation). But, using qemu -kvm, it should
>>> be fast as long as you run on a native CPU that is core2duo or better, as
>>> the native instructions can just be exposed and passed through to the host.
>>> Since core2duo is very old by now, it should be fast for virtually everyone
>>> building on x86.
>>>
>>
>> Right, I did some digging.  Assuming you have KVM enabled then in the
>> general case the -cpu option is irrelevant as the instructions are handled
>> natively.  -cpu just changes what CPUID flags the userspace sees, and so
>> this is the Right Thing To Do.
> 
> Sorry for replying to such old thread, but today I've noticed interesting side-effect of this change.
> 
> Today I was checking why starting qtbase examples in qemu fails with
> message about missing ssse3 support which which qtbase as compiled.
> 
> The DEFAULT_TUNE in qemux86-64 is indeed set to core2-64 which supports
> ssse3, so qtbase is right to expect it in runtime.
> 
> But then I was starting qemu manually (not with runqemu) with:
> qemu-system-x86_64 -M q35 -smp 4 -m 4G -net nic,model=virtio -net user,hostfwd=tcp::2222-:22 -vga virtio -display sdl,gl=on -hda luneui-example-image-qemux86-64-20180425152329-jama.rootfs.wic.vmdk -enable-kvm
> 
> which defaults to using this kvm64 generic CPU which doesn't support ssse3
> 
> Changing it to
> qemu-system-x86_64 -M q35 -cpu core2duo -smp 4 -m 4G -net nic,model=virtio -net user,hostfwd=tcp::2222-:22 -vga virtio -display sdl,gl=on -hda luneui-example-image-qemux86-64-20180425152329-jama.rootfs.wic.vmdk -enable-kvm
> 
> gets rid of the message from qtbase, because core2duo supports ssse3 and matches with qemux86-64,
> but my host CPU (AMD Bulldozer FX(tm)-8120), doesn't support the same cpu flags like core2due and qemu shows following
> message when starting:
> qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.01H:EDX.ss [bit 27]
> 
> EDX.ss is Self Snoop feature which is enabled in core2duo and few other QEmu emulated CPUs, so I was looking
> on some other cpu I can emulate which has ssse3 while having the same flags as my host's AMD cpu
> 
> e.g. -cpu phenom is relatively close, but Bulldozer CPUs don't support 3dnow, 3dnowext, so similar warning is shown.
> 
> In the end I've switched to using -cpu Nehalem, which has ssse3, but doesn't enable CPUID_SS flag, now it starts without any warnings:
> qemu-system-x86_64 -M q35 -cpu Nehalem -smp 4 -m 4G -net nic,model=virtio -net user,hostfwd=tcp::2222-:22 -vga virtio -display sdl,gl=on -hda luneui-example-image-qemux86-64-20180425152329-jama.rootfs.wic.vmdk -enable-kvm
> 
> Regards,
> 

Heh, this is bringing back memories of when I wrote the patch. It's 
tricky to say what CPU we should pick here; we want whatever is the 
closest to a lowest common denominator. I don't know enough to say what 
the right choice is, though it is important that the CPU we build for 
and the one we run for are the same.

Prior to this patch, we built for core2duo and then ran with kvm64, 
causing issues. Good follow-up work would be to see if core2duo is 
really the best CPU to be targeting for a lowest common denominator. If 
Nehalem is a better match, we might as well switch to that, as long as 
we switch in both build and runtime consistently.

