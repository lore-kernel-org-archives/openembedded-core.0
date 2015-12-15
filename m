Return-Path: <haris.okanovic@ni.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0139.outbound.protection.outlook.com [207.46.100.139])
	by mail.openembedded.org (Postfix) with ESMTP id F1A5E73194
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 19:48:59 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=haris.okanovic@ni.com; 
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	BY2PR04MB014.namprd04.prod.outlook.com (10.242.34.17) with Microsoft
	SMTP Server (TLS) id 15.1.355.11; Tue, 15 Dec 2015 19:48:57 +0000
From: Haris Okanovic <haris.okanovic@ni.com>
To: Khem Raj <raj.khem@gmail.com>, Haris Okanovic <haris.okanovic@ni.com>
References: <CADkTA4PoDAgiJ2kdpT9HBnWLfGG-spLmSnF66BP33z520ig6wA@mail.gmail.com>
	<1450132548-31177-1-git-send-email-haris.okanovic@ni.com>
	<D29D34BA-D50B-45F9-9866-854FB1B8F843@gmail.com>
Message-ID: <56706EA2.5070808@ni.com>
Date: Tue, 15 Dec 2015 13:48:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <D29D34BA-D50B-45F9-9866-854FB1B8F843@gmail.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: CY1PR08CA0027.namprd08.prod.outlook.com (25.163.94.165) To
	BY2PR04MB014.namprd04.prod.outlook.com (10.242.34.17)
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB014;
	2:6QoYQA1k92A8iFhFqJKlinn/D/V92AZb+DDJ23Vm2NrqNkoZewhxecOTNzaYrqtF8HnysMa3DYezFUJjzP/g9AUNVlj0c9bzOxGx9QSf/AOFtPOzlG9ZJ3rfeUQLf36s/tHYoYX+bsNXBf6bKwtL6w==;
	3:nFNvN1/atmy8GPHCW54bw9/VAVtTIsmIcAUtI8G+6w+8U8xtLJ1OQ90qNEZXNDWm7M4NcrCxg0NGIvu9fFaoygD1NwcSJT6hrCxBOFCFiXWjbwPRG5MdrKzwNRADThUY;
	25:ZYTH0HTva0bnwAmtd0sX/tjAOIPHuE1ihkcE5/sf60CKfee2aiU3Tj8SunwkPFi+O7jvbDTiOxt0pXDLpr4zE41sWbw94BoPI3JZ8qn88rhoobvHKqV1Rl+4bOe0UP9/n6zOlK4QRGo9+QH1ZDTzaQKz1YZ7lcMtzSwaxUgPQ+geP8zEzyh8ScFIULolnyS0LiHw1nZ6qLj9y2VOabmp2Du9nFaz0bDpjG/bW/IffjObBv5FLJzfmUJRu5mRzNSsmMFPvCvcULVEwPBoIl5vgQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR04MB014;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB014;
	20:SXWy7arQEhqd287+SQODv0Oe2SCvl1BcLMnbW9figpBAr2uxpqVyz92xdxc5TWGdQ8/xhQ0PF2S/5UF1ESoAoWHBsm1B28rb0tYx3dushoAbuD4mFGhOj1JlEmOBO5Ph5opOFAvEpnnu2o1DFiHqeYme/gmJi90PxV6dWHVQOhuH7ad1H4zObnpvf9GRHoiT5eW9iGeXhK0ZbssoFGcsas+Gr8ysDwDCfkicw0SloaohhPRbTkxWs7Mn+EQ+suJGRhrYohQ+zb3UowKMkekHeECFtEg2HB293GOKI0SxD608nivYeAG3dDC7xVNn4LeYbOkw3IGSZB/VIy0tYyULx0aSgEwEu18s3ca8HD8ArsbKtEkaYZxqyJvzb4ONqcJuFb7jFuEZC2I3zF7s55jI05Bmq6Cyu+9H/hOvimq/iTt2dyMMHhXXiOwztSe5jfXwqAant4iiWqcR0+LNz0DLvhrPn6RPPGbd5q1Jgh4QBMwZAoa15CkSlcaTvkYHZd2rgACWXrEDYh7WMdjWzZr6dDBDHMkixHW9lvvXF0n42wT2ElaTZ8W5SeYYvgBx7stT8zCu8O2z860bhByeV2J95pc9exkfIfRtcD+UjRXDsvo=
X-Microsoft-Antispam-PRVS: <BY2PR04MB014D34E89AF7A678D0E3859E5EE0@BY2PR04MB014.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:BY2PR04MB014; BCL:0; PCL:0; RULEID:; SRVR:BY2PR04MB014; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB014;
	4:MuDfOkjdXmok962CqWf0h+Yl8SD9tMU5Q4DbCmulJaDmVPCJ2IZgwqzWSPB1HRvrkYJxw8UPTZ9FfdCXSx0S3PzjusGhRSMgKJ/XERbWseXdAdnujEMtgS+x+GBKaHxQM6noIMoJbgVT9w46wu99jDDWoiG8K7PflKD3gbglgktlfGZ0JXWAJGnaKShGSwg1rQMPK3TRFj23iZxpMYC03cTUM78gMmo00i602zTkY0AVsgbRQ55vQMKqg+wxUZjKl9bTwp+MI057KJgEOa86lz5ERGBhF6isD8jaimcGw5xEKPP9zfjaJpxXz2B4zI8MeNrNM53HAPJxhxkJUR11rBphkn4tFM86CbEouy1Loow5wRkYoa0UoNR2U/DleSVE
X-Forefront-PRVS: 07915F544A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(479174004)(377454003)(199003)(24454002)(42186005)(99136001)(80316001)(76176999)(5001770100001)(54356999)(59896002)(92566002)(66066001)(5001960100002)(87266999)(86362001)(97736004)(105586002)(2950100001)(106356001)(4001350100001)(189998001)(15975445007)(1720100001)(81156007)(5004730100002)(50986999)(230700001)(77096005)(36756003)(23746002)(3846002)(65956001)(19580395003)(6116002)(19580405001)(47776003)(65806001)(50466002)(1096002)(122386002)(101416001)(586003)(64126003)(87976001)(5008740100001)(40100003)(83506001)(65816999)(33656002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR04MB014;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BY2PR04MB014;
	23:TZWo26u8HBUeUAAs+vskN1EBa/i5sFx05BcdVP?=
	=?Windows-1252?Q?LbuONc0AOlCdW5TdNU9HSLhpB1CMY7azEgoA7wpws/K+I1fPh0OsXMzv?=
	=?Windows-1252?Q?AijDwk70ikkBXspWZGu7tGSSRbZxv6AjGzlEUynpG41B8PMy9ECp/eKr?=
	=?Windows-1252?Q?fphus5Lde9RWWI7M3OQJoXgIKdakzYSSFsIlYWtuTktYE2TFPkoC5JB9?=
	=?Windows-1252?Q?TY/gPxtMWKb06BRr0aWTRHiKJAF32SZYIhnoHYZ4rjhYw4VQCVbOmnHB?=
	=?Windows-1252?Q?XlJjsAh6QlUvwLFpuC5i2nMRLorHpp8iou/G5nuMo937gE+aBYIaIEow?=
	=?Windows-1252?Q?BNIaQ5aGBa5T9MeJg5wwDY5TbR/2wqWO4IaHLmpOSPkWDqjqEGc5/vRs?=
	=?Windows-1252?Q?4j/RNGlZcJFu3Eytwj3B4RscnWcmZ4GagiAu0+z1N0DT3/NTQ1guRncj?=
	=?Windows-1252?Q?Dn3zx6sQ9jssy9ipSMAlS/xfLPrOj9i9o4tyTAo0kdLThs0kwvV9I3LT?=
	=?Windows-1252?Q?fy8kEndd9HcI9QM1DaAc1OiNNIN743tqOecXnVL0rqfJjo6VlIYw9j9f?=
	=?Windows-1252?Q?m2ohVDJcKQZ5A5lP5KLSTDiHMaeMa8IFGroZs9PEAX9zguqSMTc7P9oA?=
	=?Windows-1252?Q?LG1DPy/CywUujGs0QItzDMabCrGSwXTZpMKLymDrrAFlvBCcQwow6OSM?=
	=?Windows-1252?Q?bkvyFZG1XRwd7tXdrHaTYItUIFpmCr7H0gJqqcdOEonaWmHweHm43a3v?=
	=?Windows-1252?Q?m3wMIgWQTwkff6uyHvFbHwhhqzXthOfoNM0fy5EN1H85pTIfHKeZwz91?=
	=?Windows-1252?Q?8EgZ5jHRgenz3dS+sN8R8QQ/WRHmNdCi2p/LjXjk2CgDW7UgXVqLUKYm?=
	=?Windows-1252?Q?u+XpQMAbLj5PwLw5sQfLzZ2m2Jd1eBIvebwQLCMy6bWwKhKVj/nom3QC?=
	=?Windows-1252?Q?+ruxyWEaHnti7c5fPVjEl2Z9wph1UzCbIqs8z9jIQbrG+SSM67MEyln9?=
	=?Windows-1252?Q?YI7SyyHkkq/1Z1DTf/jBjG9SxyjIb4B3Yuz7kO1SsRB/jprjbANtls16?=
	=?Windows-1252?Q?x53vPb1LWEy/x2vMx6LhRFjVNigSUlhjQPnra16ugFfKyhGClL//cw+F?=
	=?Windows-1252?Q?0VjkM5KIqXqDTqQwlHtYuEl0Nx2/DmTgttzrXjkRUgJt6HaL+WUYMLHV?=
	=?Windows-1252?Q?EikPrk+aqsGCgcn5AHYpJ2cmwiOLD4tilAAVpfGN2CqGIJ9M6uW5Gm6e?=
	=?Windows-1252?Q?yrdrY8cQXzm+Gwiao4wDrFRP8FwTmjP2vVkX1xG0yVnAvc/niZm2ljAb?=
	=?Windows-1252?Q?m2FC/t4rKHpXKXAYE5uvpzIIExy1ervIlmq2c+kQikd6hIvFFETs5XZp?=
	=?Windows-1252?Q?KdWiAVfjsJ8bzMgoHf8eI6rKB0WVVD28ryXQkMsJD7mx/6Bg895Xz2iK?=
	=?Windows-1252?Q?cyZ61z18AKQ8WVzv8zDbRGUkFuxYdhk42uDZWiGA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB014;
	5:egb+chgxs6xEd4oYi4rNjybBIfacCkmsFcAEcziNuQ4L8myTUDXKQOGkToxiEHMsY1dTBBzkxS/74+bKEOMyr/S0VcP10blEfw6TaSZOIAc0moFhBil2ExSQoU/jJ6CsLCMchls2msc+/FWZ+iRoRQ==;
	24:Gb5kISI58TSWhiBxPkbd7ORApF7V7t7h77nKnswLDgDo9ZVEsd5iTqhGlPml3fZ4AVLpfe/vQl+8e+DaHslv5tsit0nIJwiREJjq0iyi2OE=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2015 19:48:57.6215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR04MB014
Cc: Gratian Crisan <gratian.crisan@ni.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Tue, 15 Dec 2015 19:49:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

On 12/14/2015 06:33 PM, Khem Raj wrote:
>
>> On Dec 14, 2015, at 2:35 PM, Haris Okanovic <haris.okanovic@ni.com> wrote:
>>
>> From: Gratian Crisan <gratian.crisan@ni.com>
>>
>> This change allows distributions to provide multiple builds of kernel
>> and module packages. For example, a distro may want provide an alternate
>> debug kernel in a package feed for debug/testing.
>>
>> Templetize kernel package name:
>>
>> Add a "weak" variable KERNEL_PACKAGE_NAME used as the base name for kernel
>> packages. It defaults to the old hard-coded name 'kernel' but it can be
>> redefined by recipes that provide additional kernel packages in order
>> to avoid build conflicts.
>>
>> Change hard-coded 'kernel' references to KERNEL_PACKAGE_NAME in
>> kernel bbclass-es.
>>
>> Build alternate kernels from WORKDIR instead of STAGING_KERNEL_DIR:
>>
>> Prior to this change, kernel recipes would all fetch source to
>> STAGING_KERNEL_DIR as defined by bitbake/distro confs. This broke
>> parallel builds when more than one kernel recipes are defined in
>> the distribution, since they all attempted to fetch() and patch()
>> in a shared source dir.
>>
>> With this change, alternate kernel recipes fetch source into their
>> ${WORKDIR} so that they may build in parallel to each other and the
>> default kernel recipe, which still fetches to STAGING_KERNEL_DIR.
>>
>> Testing:
>>
>> Built linux-yocto-4.1.13 for qemux86 and verified it produced kernel
>> image and modules packages. Added kernel recipe with non-default
>> KERNEL_PACKAGE_NAME and verified it produces kernel image and modules
>> packages with alternate name next to default kernel.
>
> is it all targeted at just kernel package ? can you cite some use cases which benefit from
> such a thing and what are current alternatives ?
>

The ultimate goal is to improve developer efficiency:

We're looking to provide an alternate debug kernel+modules in our feed, 
which our developers could easily install to diagnose problems or run 
tests without having to build kernels on their desktop. E.g. Our debug 
kernel would have options like CONFIG_DEBUG_INFO, CONFIG_DEBUG_PREEMPT, 
and CONFIG_FRAME_POINTER enabled. We may provide more variants in the 
future tuned to specific use cases.

We need all kernel+module variants to co-exist both in the feed and 
on-target, so that users may quickly install different variants and 
toggle between them as needed. The only solution we have to that end is 
to change the hard-coded package prefix "kernel" throughout 
kernel.bbclass & friends. The proposed change makes that prefix 
configurable by the recipe.

I'm not sure how else we could do this without rewriting a lot of 
kernel.bbclass functionality. We're certainly open to suggestions.


Denys Dmytriyenko also brought up an interesting point in a separate 
email: "how can you build/rebuild and package out-of-tree modules 
against all the alternatives?"

kernel.bbclass builds under work-shared, which is what I presume enables 
building out-of-tree modules against the default distro kernel. Please 
correct me if I'm wrong on that point. This change overrides the build 
location of alternate kernel recipes
(where KERNEL_PACKAGE_NAME != kernel) to WORKDIR, which likely makes it 
impossible to build against the alternatives.

This is not something we've considered in this change since we build our 
out-of-tree modules outside of OE entirely. I'm not sure what it would 
take to make this happen, but I'd prefer to do it in a separate change, 
so long this change doesn't preclude that eventual improvement.


-- Haris


>>
>> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
>> Natinst-ReviewBoard-ID: 120348
>> Natinst-ReviewBoard-ID: 120447
>> ---
>> meta/classes/kernel-module-split.bbclass |  9 ++--
>> meta/classes/kernel.bbclass              | 76 ++++++++++++++++++++------------
>> meta/conf/documentation.conf             |  1 +
>> meta/recipes-kernel/linux/linux-dtb.inc  |  2 +-
>> 4 files changed, 55 insertions(+), 33 deletions(-)
>>
>> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
>> index e1a70e6..7415ec8 100644
>> --- a/meta/classes/kernel-module-split.bbclass
>> +++ b/meta/classes/kernel-module-split.bbclass
>> @@ -28,7 +28,7 @@ do_install_append() {
>>
>> PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>
>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>> +KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
>>
>> python split_kernel_module_packages () {
>>      import re
>> @@ -179,14 +179,17 @@ python split_kernel_module_packages () {
>>          # Avoid automatic -dev recommendations for modules ending with -dev.
>>          d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
>>
>> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True)
>> +    kernel_version = d.getVar("KERNEL_VERSION", True)
>> +
>>      module_deps = parse_depmod()
>>      module_regex = '^(.*)\.k?o$'
>> -    module_pattern = 'kernel-module-%s'
>> +    module_pattern = '%s-module-%%s' % kernel_package_name
>>
>>      postinst = d.getVar('pkg_postinst_modules', True)
>>      postrm = d.getVar('pkg_postrm_modules', True)
>>
>> -    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
>> +    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>>      if modules:
>>          metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
>>          d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index b75a462..281519e 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -1,5 +1,23 @@
>> inherit linux-kernel-base kernel-module-split
>>
>> +KERNEL_PACKAGE_NAME ??= "kernel"
>> +
>> +# The default kernel recipe builds in a shared location defined by
>> +# bitbake/distro confs: STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR.
>> +# Set these variables to directories under ${WORKDIR} in alternate
>> +# kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so that they
>> +# may build in parallel with the default kernel without clobbering.
>> +python __anonymous () {
>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) != "kernel":
>> +        workdir = d.getVar("WORKDIR", True)
>> +
>> +        sourceDir = os.path.join(workdir, 'kernel-source')
>> +        artifactsDir = os.path.join(workdir, 'kernel-build-artifacts')
>> +
>> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
>> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
>> +}
>> +
>> PROVIDES += "virtual/kernel"
>> DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
>>
>> @@ -79,9 +97,9 @@ base_do_unpack_append () {
>>
>> inherit kernel-arch deploy
>>
>> -PACKAGES_DYNAMIC += "^kernel-module-.*"
>> -PACKAGES_DYNAMIC += "^kernel-image-.*"
>> -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>>
>> export OS = "${TARGET_OS}"
>> export CROSS_COMPILE = "${TARGET_PREFIX}"
>> @@ -270,9 +288,9 @@ do_shared_workdir_setscene () {
>>
>> emit_depmod_pkgdata() {
>> 	# Stash data for depmod
>> -	install -d ${PKGDESTWORK}/kernel-depmod/
>> -	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-depmod/kernel-abiversion
>> -	cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
>> +	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
>> +	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-abiversion
>> +	cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.map-${KERNEL_VERSION}
>> }
>>
>> PACKAGEFUNCS += "emit_depmod_pkgdata"
>> @@ -287,7 +305,7 @@ do_shared_workdir () {
>> 	# Store the kernel version in sysroots for module-base.bbclass
>> 	#
>>
>> -	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>> +	echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>>
>> 	# Copy files required for module builds
>> 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>> @@ -361,28 +379,28 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>>
>> # kernel-base becomes kernel-${KERNEL_VERSION}
>> # kernel-image becomes kernel-image-${KERNEL_VERISON}
>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
>> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>> FILES_${PN} = ""
>> -FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
>> -FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>> -FILES_kernel-vmlinux = "/boot/vmlinux*"
>> -FILES_kernel-modules = ""
>> -RDEPENDS_kernel = "kernel-base"
>> +FILES_${KERNEL_PACKAGE_NAME}-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
>> +FILES_${KERNEL_PACKAGE_NAME}-image = "/boot/${KERNEL_IMAGETYPE}*"
>> +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux*"
>> +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
>> +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>> # Allow machines to override this dependency if kernel image files are
>> # not wanted in images as standard
>> -RDEPENDS_kernel-base ?= "kernel-image"
>> -PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', 'kernel-vmlinux', '', d)}"
>> -PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>> -ALLOW_EMPTY_kernel = "1"
>> -ALLOW_EMPTY_kernel-base = "1"
>> -ALLOW_EMPTY_kernel-image = "1"
>> -ALLOW_EMPTY_kernel-modules = "1"
>> -DESCRIPTION_kernel-modules = "Kernel modules meta package"
>> -
>> -pkg_postinst_kernel-base () {
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
>> +PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
>> +PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
>> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta package"
>> +
>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>> 	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>> 		mkdir -p $D/lib/modules/${KERNEL_VERSION}
>> 	fi
>> @@ -393,18 +411,18 @@ pkg_postinst_kernel-base () {
>> 	fi
>> }
>>
>> -pkg_postinst_kernel-image () {
>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-image () {
>> 	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
>> }
>>
>> -pkg_postrm_kernel-image () {
>> +pkg_postrm_${KERNEL_PACKAGE_NAME}-image () {
>> 	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
>> }
>>
>> PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>
>> python split_kernel_packages () {
>> -    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>> +    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>> }
>>
>> do_strip() {
>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>> index 1b5c071..fb5e03f 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -250,6 +250,7 @@ KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto Project kern
>> KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set by the machine configuration files and defaults to 'zImage'."
>> KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded during boot"
>> KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
>> +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to 'kernel'."
>> KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
>> KERNEL_SRC[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
>> KFEATURE_DESCRIPTION[doc] = "Provides a short description of a configuration fragment. You use this variable in the .scc file that describes a configuration fragment file."
>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
>> index 772adcb..c27a3cb 100644
>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>> @@ -2,7 +2,7 @@
>> FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
>>
>> python __anonymous () {
>> -    d.appendVar("PACKAGES", " kernel-devicetree")
>> +    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
>> }
>>
>> normalize_dtb () {
>> --
>> 2.6.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

