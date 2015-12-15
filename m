Return-Path: <haris.okanovic@ni.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0140.outbound.protection.outlook.com [207.46.100.140])
	by mail.openembedded.org (Postfix) with ESMTP id 0C63A6FF97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 20:00:29 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=haris.okanovic@ni.com; 
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	BLUPR04MB006.namprd04.prod.outlook.com (10.255.210.16) with Microsoft
	SMTP Server (TLS) id 15.1.337.9; Tue, 15 Dec 2015 19:45:31 +0000
To: Denys Dmytriyenko <denis@denix.org>, Martin Jansa <martin.jansa@gmail.com>
References: <1450119998-2912-1-git-send-email-haris.okanovic@ni.com>
	<CADkTA4OFzBpvo_fSnf-0h85erobO=DY4cJcc05+=Gg+Ua9xHyQ@mail.gmail.com>
	<CADkTA4PoDAgiJ2kdpT9HBnWLfGG-spLmSnF66BP33z520ig6wA@mail.gmail.com>
	<20151215165826.GN13597@denix.org> <20151215190310.GD2556@jama>
	<20151215191041.GQ13597@denix.org>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <56706DD6.4010303@ni.com>
Date: Tue, 15 Dec 2015 13:45:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151215191041.GQ13597@denix.org>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: BY2PR1001CA0041.namprd10.prod.outlook.com (25.164.163.179)
	To BLUPR04MB006.namprd04.prod.outlook.com (10.255.210.16)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB006;
	2:RfpljMK676sA2ISzEkZsjnscrPn7+ZSqbZjmR5z8kfRu9/19lMdVu2DhwODnIYmARLtMx5EWW1GFFhd4ZC6VAFoV/FiId2CXCDbwZ+ArkKcrZNwAG0trGj5gbSNDEFLxuwLCKA6IjUt9LgYjSN+WlQ==;
	3:+RYDC3HMnvEGmVgTO1TYHCGPBRT4Lkv7r46qkKObpAuUFY6VVPY5Pm2HXzk0iB52YjguTT5dc/738dQE//7sz+2wSxmEzp14+WNZG/A363eq0pubBqxR+Ck4sa/MaH24;
	25:mS+eQlDmzQFlhGKFZFdya4/xHJ/fUBUiscRp/voO4q/cHPs7ookAuEGtZpVBH5kT94X5g+tL9aSdM0beDNMCWl+9VOb5fjIEtuOnZRdIsuhXGDSc1fEyUv8aqNx5c4TVfjrejlERquZWyYY/ABtv4LvpRYOKk8nYeP6/FB26lNdNOJqdpkcTktEzEOZ4QQQjZq/FoK5mO6RqmyuknJo5vOLd3oW4Igz/X/as/t4QS1UpBBNwER/GOENZDFUgr7Dnx0kJ614M4Q1GP0XsppZ0dw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR04MB006;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB006;
	20:QOTEqd68MI2eUkozc8cnf6C0m+OvwSaDEtIz67gkhewDbMVauHMyBoMsWQcZcx/U1VNwMX9ktYBpXIAtrHB+rk04U0r4yc/nQ2hYCcmeXG0EZLFjEqk1VEMU7K5FiApiByEhlSk5YG1+jqGEoJ842A35VybxwHjdz4s3UVYwPNO7ptvQDErSN6oxTiDaGPBU5lpS0JH5/TnCHSPS9dIJWJi3Htu5QMsXZvPYBI/MlhURWjeXRfhjeh7KJf8ZN7Zva1bp9oECWAHFvoKT+oml46MTpJKRoEE3hRt7Bj7DxI8n5vKCAcZfap76rHQSCqpmYFHI8fgiX36jmh+5mw8tTmM3x19DB5ZvQYyA+RIIJ5viGeZs3zH4ICF+0uQ8bvrdwerjj0IFTNyhie8zPe5LXb3vbSSLKW5xW4NyeQV6KF9E8p260K5ZUZ+DSHyFu+fbuHe6uEwxUi8fxK+dD0sjDeHd/6xKrYdHFXtxeiV8eoKUtRgfiMl4J9Ukl6AICLMAt9N2TU/xFCgcx07Hjr4R4+ViXIBCXcv18UXLE86sYIhw5zILVsi+WA9laBRvUROD5nYpZgUe4vm6R4Gled+r1ed6EUPQrZbfzwJeB6hb9ks=
X-Microsoft-Antispam-PRVS: <BLUPR04MB006FC61E635C6FF8A909328E5EE0@BLUPR04MB006.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:BLUPR04MB006; BCL:0; PCL:0; RULEID:; SRVR:BLUPR04MB006; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB006;
	4:xAFmo4KXnt9Z9K14kMPnZGCeUvPG74j3xK8+Uvv5CAgZ03YkZFSWI8TJ1pXEnqV051p1lbuIvwJ8UEAsSKhZ7Gb+v27g2vi/MBjVDKEmK7YvDK/uTp5zV7t5+umkiVtubr/APSVSmISrOWw5S1Xq72RR5I3ARryr/W/FERWCWu67YIJFd6dpMMqYjArUbxvAoxwPIuBH6H7ffE7GhnzU60hhhw825tmwUYHL1HerW+hbyxIlLGAwdLDu5rSNFVSM3hEKlDAC2X91No5JEwiihwEfEjpAhjWrVMn3DDd1x8ypuCVwqGsPb/hvzNPRJFrbPDRZ3sT2vZsJjYlFxaGb1LI7+6NRzlGwh4w+IALYC1I/tRkFO9RXoul0ziA4vVzf
X-Forefront-PRVS: 07915F544A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(479174004)(199003)(377454003)(189002)(33656002)(77096005)(87266999)(83506001)(87976001)(42186005)(66066001)(106356001)(23746002)(5008740100001)(19580405001)(65956001)(65816999)(92566002)(99136001)(1096002)(86362001)(122386002)(80316001)(65806001)(5004730100002)(19580395003)(105586002)(4001350100001)(189998001)(93886004)(47776003)(3846002)(50986999)(64126003)(230700001)(36756003)(2950100001)(15975445007)(586003)(101416001)(76176999)(1720100001)(5001960100002)(6116002)(54356999)(50466002)(97736004)(81156007)(5001770100001)(40100003)(59896002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR04MB006;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BLUPR04MB006;
	23:9RZ1pGxPoiVdw8+Z2VX+DvWUrD49c6sT1vSp4G?=
	=?Windows-1252?Q?QmDzos/OPfoVmFJpkZrIqc5p80gy9GdS4pqvTPFoARPyo2b42H150rHz?=
	=?Windows-1252?Q?QAyh0HhXn454xrJf9JcVnnIZl/Apt+NZsXPR2OxeQ1X8mOar9DYrL/NL?=
	=?Windows-1252?Q?wAGuha5GNnScfotvUDtU5TCXSkSLXarYKTgb4SNDIL3RCVdx6oRdEzvX?=
	=?Windows-1252?Q?vBApym5iJFdB3QW/QVyMkCd0SVadcxohAIHXINEfmV53CPoit55ELQ/M?=
	=?Windows-1252?Q?bqYvksKAKNqVrpX9yUhcooBF3MuiVoG1lJ2gQlwvKRxhsd9F5oFW3Jih?=
	=?Windows-1252?Q?ptsOLF/K29EmrE4m4but/81MveracWpQcY+1a3iV5wrB3YfbB4kU7TId?=
	=?Windows-1252?Q?5ob+WS8AcNShhJowuSC7bmXmhPnINX1u1+tWPtX4PtzFOxNomvUF/w2m?=
	=?Windows-1252?Q?BO9E2xU4i/iC3mt36PqAM6MBwTwmwo13uM3QFfy2v3SKH0KATePgn0Hq?=
	=?Windows-1252?Q?qMlcnkpvZWi82Ve9atnneTRiw8pw/aJ0iV85NEXdb8SZuPzmgl2AgcJZ?=
	=?Windows-1252?Q?/SJRvozdXDYoS7Hh6blxUxH2kt87Wc/pZGHHMkW8Cw6mWfBanK8FtPJ2?=
	=?Windows-1252?Q?xnKkZhPy7/QIioHdSJrmWYERRknwEbeHhdwIgKuzepOcQNT6h/g4MUqZ?=
	=?Windows-1252?Q?A74TMgm/tvAmfSVva7ikd+BQPRcaidgfP3yVnC35kJU4lm6blRhBbmIX?=
	=?Windows-1252?Q?4s3b5QC0ueZSrjtq5vmcHbGrYsp6ecS3HrrYp1jRf9/9qY9YLg9RRPTf?=
	=?Windows-1252?Q?hw4vDrG85dN7tLutitcDGKFksk54LfzTdbLfiAhbf/kdQpigIcG8Dz6S?=
	=?Windows-1252?Q?kmVhZ1vHc+XxYPgCkXmTmHplQ07E3A7mfZSdiel2ZHX50/CTI9ZFTUIL?=
	=?Windows-1252?Q?yebvlIItvjmFLGbMyqCHBSUBUJgRrAojZPlVnC/ognhlnHHo8l1pzQJj?=
	=?Windows-1252?Q?Ncg4X7KFN82RDhkNqCJAbVnq51ErlTVa4+HT1SvUb6m3CeLYcsCOP11U?=
	=?Windows-1252?Q?JYooguzo6R83uf8hfsRZ5thB45nQuJVCXi3a+vRUWOoPhKKItuRuCPnf?=
	=?Windows-1252?Q?yxhAqs04A4j0pkiWzbNJAzkA8RhYZPmhN0ND9dgt3mi07X47un72va3Z?=
	=?Windows-1252?Q?zk4dS1ooMH8JPlpIGUc8ivyQVJC+atm7h/IUxYmEgxBQVtS9Qn0wWizD?=
	=?Windows-1252?Q?AOV0qpGiin1nIna5sV2OCPyta3lcQjtYEu8jLBAvUh4PE0SgAtdstVLu?=
	=?Windows-1252?Q?eg/wTn4nkKBzlJqx8uogH9frm7bIue//fj0knQ1W+usOuvkZlNuEW4O3?=
	=?Windows-1252?Q?JWiFoV9xmr+3tXFpLuw+i7NOndrsdPhOYq69DiiEvN9w7JYcf+brrDoA?=
	=?Windows-1252?Q?/DVH/ixQ+u9yIy5enW7s+Lg0dm79jKc0zi599KSihQtsZejLlG6/iZ2V?=
	=?Windows-1252?Q?MJDuo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB006;
	5:zAI3f/FOUn1w/jSKQAVQxEqAhyVm5qS45NPcaoyKhZpDtmF1QNu6lllw6g8E8jF11OO+92lz0q3BJzAuMj5G4CepAOkHLJ7rpJRE8eraFIjJoy2CUkda6FaESWwexOiw8XrdLHNsOKvL1SxJLlgMcw==;
	24:90YWdVlBkPEeFxVICNQAYFbq7g674i9key12PjnCpCTmETXI2wRNM4OVPeUU62ROR8K2Si23EfdjY/zjXGt4JsfNce5BuUiY4OXgyZV13zo=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2015 19:45:31.3932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR04MB006
Cc: Gratian Crisan <gratian.crisan@ni.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Tue, 15 Dec 2015 20:00:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2015 01:10 PM, Denys Dmytriyenko wrote:
> On Tue, Dec 15, 2015 at 08:03:10PM +0100, Martin Jansa wrote:
>> On Tue, Dec 15, 2015 at 11:58:26AM -0500, Denys Dmytriyenko wrote:
>>> On Mon, Dec 14, 2015 at 03:02:44PM -0500, Bruce Ashfield wrote:
>>>> On Mon, Dec 14, 2015 at 2:17 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
>>>> wrote:
>>>>
>>>>>
>>>>>
>>>>> On Mon, Dec 14, 2015 at 2:06 PM, Haris Okanovic <haris.okanovic@ni.com>
>>>>> wrote:
>>>>>
>>>>>> From: Gratian Crisan <gratian.crisan@ni.com>
>>>>>>
>>>>>> Templetize kernel package name:
>>>>>>
>>>>>> Add a "weak" variable KERNEL_PACKAGE_NAME used as the base name for kernel
>>>>>> packages. It defaults to the old hard-coded name 'kernel' but it can be
>>>>>> redefined by recipes that provide additional kernel packages in order
>>>>>> to avoid build conflicts.
>>>>>>
>>>>>> Change hard-coded 'kernel' references to KERNEL_PACKAGE_NAME in
>>>>>> kernel bbclass-es.
>>>>>>
>>>>>> Build alternate kernels from WORKDIR instead of STAGING_KERNEL_DIR:
>>>>>>
>>>>>> Prior to this change, kernel recipes would all fetch source to
>>>>>> STAGING_KERNEL_DIR as defined by bitbake/distro confs. This broke
>>>>>> parallel builds when more than one kernel recipes are defined in
>>>>>> the distribution, since they all attempted to fetch() and patch()
>>>>>> in a shared source dir.
>>>>>>
>>>>>> With this change, alternate kernel recipes fetch source into their
>>>>>> ${WORKDIR} so that they may build in parallel to each other and the
>>>>>> default kernel recipe, which still fetches to STAGING_KERNEL_DIR.
>>>>>>
>>>>>
>>>>>
>>>>> But what's the system level use case for this capability ? Honestly, it
>>>>> just
>>>>> looks complicated .. and I'm not seeing exactly multiple kernels are being
>>>>> built in parallel in a single build. We've been forcing everything
>>>>> explicitly
>>>>> to be in a single, shared location .. and I see that this is both
>>>>> complicating
>>>>> and a possible source of errors.
>>>>>
>>>>> It's probably that I'm just misunderstanding the point of the change.
>>>>>
>>>>> If I had to guess, you are building recovery, or kexec/kdump kernels along
>>>>> side the main kernel ?
>>>>>
>>>>
>>>> Aha. I see the debug kernel reference in the comments (as one example).
>>>>
>>>> As a follow up. If these kernel's are building via kernel.bbclass, how are
>>>> you
>>>> avoiding the artifacts all ending up in STAGING_KERNEL_BUILDDIR ? I did
>>>> a quick scan, and couldn't see if it was being considered.
>>>
>>> And the next question would be - how can you build/rebuild and package
>>> out-of-tree modules against all the alternatives?
>>>
>>>
>>> I've looked at doing the same for our needs and ran out of time and patience
>>> to cover all the corner cases... :)
>>
>> When I was implementing this for SHR, I ended with the default kernel in
>> default images and other kernels + out-of-tree modules built in separate
>> build directories with separate binary feed.
>
> Yep, I ended up using separate build directories and setting corresponding
> PREFERRED_PROVIDER_virtual/kernel for now...
>
>
>> Having just separate kernel image users deploy manually is nice and
>> still useful, but to cover all corner cases and upgrade-able package
>> feeds providing different kernel flavors is indeed nightmare.
>
> Agree. Should we raise this topic for more detailed discussion on the new
> Architecture list, as it seems it would require some invasive changes and
> careful consideration of all the corner cases?
>

Denys, Martin,

Do you think the proposed change precludes this kind of future improvement?

We build most of our drivers outside of OE entirely and version 
on-target against the running kernel, which is why we're only looking to 
provide multiple kernel images + in-tree modules at the moment. We're 
willing to make any change if you guys think it'll help bridge the gap 
between the current implementation and wherever we decide to go in the 
future.

Our change shouldn't break existing recipes, unless they happen to 
already define a KERNEL_PACKAGE_NAME variable (unlikely imo). We're 
defaulting everything in kernel.bbclass & friends so that they behave 
the same as they do now.

-- Haris


>
>>> As of the use cases - we have a need to provide multiple variants of the same
>>> kernel per platform:
>>>
>>> 1. Production
>>> 2. All debugging options enabled
>>> 3. RT patch applied
>>> 4. Any other major feature, like LPAE
>>>
>>> It is common for Linux distros to provide multiple kernel variants:
>>>
>>> https://wiki.ubuntu.com/Kernel/Dev/Flavours
>>>
>>> So, it's not entirely unheard of...
>>>
>>> --
>>> Denys
>>>
>>>
>>>>>> Testing:
>>>>>>
>>>>>> Built linux-yocto-4.1.13 for qemux86 and verified it produced kernel
>>>>>> image and modules packages. Added kernel recipe with non-default
>>>>>> KERNEL_PACKAGE_NAME and verified it produces kernel image and modules
>>>>>> packages with alternate name next to default kernel.
>>>>>>
>>>>>> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
>>>>>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>>>>>> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
>>>>>> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
>>>>>> Natinst-ReviewBoard-ID: 120348
>>>>>> Natinst-ReviewBoard-ID: 120447
>>>>>> ---
>>>>>>   meta/classes/kernel-module-split.bbclass |  9 ++--
>>>>>>   meta/classes/kernel.bbclass              | 71
>>>>>> ++++++++++++++++++--------------
>>>>>>   meta/conf/documentation.conf             |  1 +
>>>>>>   meta/recipes-kernel/linux/linux-dtb.inc  |  2 +-
>>>>>>   4 files changed, 49 insertions(+), 34 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/classes/kernel-module-split.bbclass
>>>>>> b/meta/classes/kernel-module-split.bbclass
>>>>>> index e1a70e6..7415ec8 100644
>>>>>> --- a/meta/classes/kernel-module-split.bbclass
>>>>>> +++ b/meta/classes/kernel-module-split.bbclass
>>>>>> @@ -28,7 +28,7 @@ do_install_append() {
>>>>>>
>>>>>>   PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>>>>>
>>>>>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>>>>>> +KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
>>>>>>
>>>>>>   python split_kernel_module_packages () {
>>>>>>       import re
>>>>>> @@ -179,14 +179,17 @@ python split_kernel_module_packages () {
>>>>>>           # Avoid automatic -dev recommendations for modules ending with
>>>>>> -dev.
>>>>>>           d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
>>>>>>
>>>>>> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True)
>>>>>> +    kernel_version = d.getVar("KERNEL_VERSION", True)
>>>>>> +
>>>>>>       module_deps = parse_depmod()
>>>>>>       module_regex = '^(.*)\.k?o$'
>>>>>> -    module_pattern = 'kernel-module-%s'
>>>>>> +    module_pattern = '%s-module-%%s' % kernel_package_name
>>>>>>
>>>>>>       postinst = d.getVar('pkg_postinst_modules', True)
>>>>>>       postrm = d.getVar('pkg_postrm_modules', True)
>>>>>>
>>>>>> -    modules = do_split_packages(d, root='/lib/modules',
>>>>>> file_regex=module_regex, output_pattern=module_pattern, description='%s
>>>>>> kernel module', postinst=postinst, postrm=postrm, recursive=True,
>>>>>> hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION",
>>>>>> True)))
>>>>>> +    modules = do_split_packages(d, root='/lib/modules',
>>>>>> file_regex=module_regex, output_pattern=module_pattern, description='%s
>>>>>> kernel module', postinst=postinst, postrm=postrm, recursive=True,
>>>>>> hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name,
>>>>>> kernel_version))
>>>>>>       if modules:
>>>>>>           metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
>>>>>>           d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>>>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>>>>> index b75a462..cc27364 100644
>>>>>> --- a/meta/classes/kernel.bbclass
>>>>>> +++ b/meta/classes/kernel.bbclass
>>>>>> @@ -3,7 +3,6 @@ inherit linux-kernel-base kernel-module-split
>>>>>>   PROVIDES += "virtual/kernel"
>>>>>>   DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc
>>>>>> kmod-native depmodwrapper-cross bc-native"
>>>>>>
>>>>>> -S = "${STAGING_KERNEL_DIR}"
>>>>>>   B = "${WORKDIR}/build"
>>>>>>   KBUILD_OUTPUT = "${B}"
>>>>>>   OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
>>>>>> @@ -11,6 +10,7 @@ OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
>>>>>>   # we include gcc above, we dont need virtual/libc
>>>>>>   INHIBIT_DEFAULT_DEPS = "1"
>>>>>>
>>>>>> +KERNEL_PACKAGE_NAME ??= "kernel"
>>>>>>   KERNEL_IMAGETYPE ?= "zImage"
>>>>>>   INITRAMFS_IMAGE ?= ""
>>>>>>   INITRAMFS_TASK ?= ""
>>>>>> @@ -34,6 +34,17 @@ python __anonymous () {
>>>>>>       image_task = d.getVar('INITRAMFS_TASK', True)
>>>>>>       if image_task:
>>>>>>           d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
>>>>>> +
>>>>>> +    # The default kernel recipe fetches it's source to
>>>>>> +    # STAGING_KERNEL_DIR as defined by bitbake/distro confs.
>>>>>> +    # Alternate kernel recipes (E.g. debug kernels) fetch source into
>>>>>> +    # their work dir so that they may build in parallel.
>>>>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel":
>>>>>> +        d.setVar("S", d.getVar("STAGING_KERNEL_DIR", True))
>>>>>> +    else:
>>>>>> +        workdir = d.getVar("WORKDIR", True)
>>>>>> +        kernelSourceDir = os.path.join(workdir, 'kernel-source')
>>>>>> +        d.setVar("S", kernelSourceDir)
>>>>>>   }
>>>>>>
>>>>>>   # Here we pull in all various kernel image types which we support.
>>>>>> @@ -79,9 +90,9 @@ base_do_unpack_append () {
>>>>>>
>>>>>>   inherit kernel-arch deploy
>>>>>>
>>>>>> -PACKAGES_DYNAMIC += "^kernel-module-.*"
>>>>>> -PACKAGES_DYNAMIC += "^kernel-image-.*"
>>>>>> -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>>>>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
>>>>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
>>>>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>>>>>>
>>>>>>   export OS = "${TARGET_OS}"
>>>>>>   export CROSS_COMPILE = "${TARGET_PREFIX}"
>>>>>> @@ -270,9 +281,9 @@ do_shared_workdir_setscene () {
>>>>>>
>>>>>>   emit_depmod_pkgdata() {
>>>>>>          # Stash data for depmod
>>>>>> -       install -d ${PKGDESTWORK}/kernel-depmod/
>>>>>> -       echo "${KERNEL_VERSION}" >
>>>>>> ${PKGDESTWORK}/kernel-depmod/kernel-abiversion
>>>>>> -       cp ${B}/System.map
>>>>>> ${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
>>>>>> +       install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
>>>>>> +       echo "${KERNEL_VERSION}" >
>>>>>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-abiversion
>>>>>> +       cp ${B}/System.map
>>>>>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.map-${KERNEL_VERSION}
>>>>>>   }
>>>>>>
>>>>>>   PACKAGEFUNCS += "emit_depmod_pkgdata"
>>>>>> @@ -287,7 +298,7 @@ do_shared_workdir () {
>>>>>>          # Store the kernel version in sysroots for module-base.bbclass
>>>>>>          #
>>>>>>
>>>>>> -       echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>>>>>> +       echo "${KERNEL_VERSION}" >
>>>>>> $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>>>>>>
>>>>>>          # Copy files required for module builds
>>>>>>          cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>>>>>> @@ -361,28 +372,28 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>>>>>>
>>>>>>   # kernel-base becomes kernel-${KERNEL_VERSION}
>>>>>>   # kernel-image becomes kernel-image-${KERNEL_VERISON}
>>>>>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev
>>>>>> kernel-modules"
>>>>>> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
>>>>>> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
>>>>>> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>>>>>>   FILES_${PN} = ""
>>>>>> -FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order
>>>>>> /lib/modules/${KERNEL_VERSION}/modules.builtin"
>>>>>> -FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>>>>>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>>>>>> /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>>>>>> -FILES_kernel-vmlinux = "/boot/vmlinux*"
>>>>>> -FILES_kernel-modules = ""
>>>>>> -RDEPENDS_kernel = "kernel-base"
>>>>>> +FILES_${KERNEL_PACKAGE_NAME}-base =
>>>>>> "/lib/modules/${KERNEL_VERSION}/modules.order
>>>>>> /lib/modules/${KERNEL_VERSION}/modules.builtin"
>>>>>> +FILES_${KERNEL_PACKAGE_NAME}-image = "/boot/${KERNEL_IMAGETYPE}*"
>>>>>> +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map*
>>>>>> /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
>>>>>> /lib/modules/${KERNEL_VERSION}/build"
>>>>>> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux*"
>>>>>> +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
>>>>>> +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>>>>>>   # Allow machines to override this dependency if kernel image files are
>>>>>>   # not wanted in images as standard
>>>>>> -RDEPENDS_kernel-base ?= "kernel-image"
>>>>>> -PKG_kernel-image =
>>>>>> "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
>>>>>> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE',
>>>>>> 'vmlinux', 'kernel-vmlinux', '', d)}"
>>>>>> -PKG_kernel-base =
>>>>>> "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
>>>>>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>>>>>> -ALLOW_EMPTY_kernel = "1"
>>>>>> -ALLOW_EMPTY_kernel-base = "1"
>>>>>> -ALLOW_EMPTY_kernel-image = "1"
>>>>>> -ALLOW_EMPTY_kernel-modules = "1"
>>>>>> -DESCRIPTION_kernel-modules = "Kernel modules meta package"
>>>>>> -
>>>>>> -pkg_postinst_kernel-base () {
>>>>>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
>>>>>> +PKG_${KERNEL_PACKAGE_NAME}-image =
>>>>>> "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
>>>>>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image +=
>>>>>> "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux',
>>>>>> '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
>>>>>> +PKG_${KERNEL_PACKAGE_NAME}-base =
>>>>>> "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name('${KERNEL_VERSION}')}"
>>>>>> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=
>>>>>> "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
>>>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
>>>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
>>>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
>>>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
>>>>>> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta
>>>>>> package"
>>>>>> +
>>>>>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>>>>>>          if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>>>>>>                  mkdir -p $D/lib/modules/${KERNEL_VERSION}
>>>>>>          fi
>>>>>> @@ -393,18 +404,18 @@ pkg_postinst_kernel-base () {
>>>>>>          fi
>>>>>>   }
>>>>>>
>>>>>> -pkg_postinst_kernel-image () {
>>>>>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-image () {
>>>>>>          update-alternatives --install
>>>>>> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}
>>>>>> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
>>>>>> ${KERNEL_PRIORITY} || true
>>>>>>   }
>>>>>>
>>>>>> -pkg_postrm_kernel-image () {
>>>>>> +pkg_postrm_${KERNEL_PACKAGE_NAME}-image () {
>>>>>>          update-alternatives --remove ${KERNEL_IMAGETYPE}
>>>>>> ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
>>>>>>   }
>>>>>>
>>>>>>   PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>>>>>
>>>>>>   python split_kernel_packages () {
>>>>>> -    do_split_packages(d, root='/lib/firmware',
>>>>>> file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s',
>>>>>> description='Firmware for %s', recursive=True, extra_depends='')
>>>>>> +    do_split_packages(d, root='/lib/firmware',
>>>>>> file_regex='^(.*)\.(bin|fw|cis|dsp)$',
>>>>>> output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware
>>>>>> for %s', recursive=True, extra_depends='')
>>>>>>   }
>>>>>>
>>>>>>   do_strip() {
>>>>>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>>>>>> index 1b5c071..fb5e03f 100644
>>>>>> --- a/meta/conf/documentation.conf
>>>>>> +++ b/meta/conf/documentation.conf
>>>>>> @@ -250,6 +250,7 @@ KERNEL_FEATURES[doc] = "Includes additional metadata
>>>>>> from the Yocto Project kern
>>>>>>   KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device,
>>>>>> usually set by the machine configuration files and defaults to 'zImage'."
>>>>>>   KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be
>>>>>> auto-loaded during boot"
>>>>>>   KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build
>>>>>> system expects to find module_conf_* values that specify configuration for
>>>>>> each of the modules"
>>>>>> +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to
>>>>>> 'kernel'."
>>>>>>   KERNEL_PATH[doc] = "The location of the kernel sources. This variable is
>>>>>> set to the value of the STAGING_KERNEL_DIR within the module class
>>>>>> (module.bbclass)."
>>>>>>   KERNEL_SRC[doc] = "The location of the kernel sources. This variable is
>>>>>> set to the value of the STAGING_KERNEL_DIR within the module class
>>>>>> (module.bbclass)."
>>>>>>   KFEATURE_DESCRIPTION[doc] = "Provides a short description of a
>>>>>> configuration fragment. You use this variable in the .scc file that
>>>>>> describes a configuration fragment file."
>>>>>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
>>>>>> b/meta/recipes-kernel/linux/linux-dtb.inc
>>>>>> index 772adcb..c27a3cb 100644
>>>>>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>>>>>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>>>>>> @@ -2,7 +2,7 @@
>>>>>>   FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
>>>>>>
>>>>>>   python __anonymous () {
>>>>>> -    d.appendVar("PACKAGES", " kernel-devicetree")
>>>>>> +    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
>>>>>>   }
>>>>>>
>>>>>>   normalize_dtb () {
>>>>>> --
>>>>>> 2.6.2
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>
>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>>>>> at its end"
>>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>>>> at its end"
>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>

