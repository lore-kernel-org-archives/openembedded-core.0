Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3E46B785D8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 16:14:00 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id f190so7865357ita.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Dec 2017 08:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c0rrT3G9hHQRn8vQ9+EnGBxBwE3PUpnJi7RSQ9ljdYA=;
	b=ROpa+55qnMieDO3E9rFwcUm2Qbqk/RMEGyWSO3c98AMD2iQOVfFob3344Twtchtn5M
	/KcobnV7NfUEx+mULkcbCqkvmI1E/t2LpTfhKoZlf/J6JWZIdv7h2A+nmRBAyPClUO9V
	R5mfl8fgx8lrH3WSWuSor0Kl6CuaqedIoe6x5bYc5lNUsMA4MBRxxKnjgvuLThaoiTU/
	B4B+kvN/awIo3yZ5wFrHnSO0SWLTrioiw0pAxL5KWrqG4fAlDcKTEBICe6Y3Mgfnpqlz
	6JlkhqPRtWae4kgEEumsF/gfC/xxucn8qSjq8E6NAymrhSbjMrIjE+4Mdfl+Zf8sujd7
	x6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c0rrT3G9hHQRn8vQ9+EnGBxBwE3PUpnJi7RSQ9ljdYA=;
	b=HvZFCDy1+r0padtLuiIs3WuHPLgJqCOF9SctjrhbwrmJrGvSG60a+w5SxOYGh/x5Ks
	kPrQwXDGCoktmC8pDn4U4dGQjz5xDSVB20lWk4vWl5/zPp9jyFM4M2SfMBcD45CzCouu
	+JTB/lDsRjdqJQ0NVTFuW2L9IpW9cVk0uIj1udO4BUzBOz/uKEhRgqnNg1wKBW10zpTh
	57RqvcnkVEVO5WWGYbARy9C1LLQ5QH23LsNH68xwS/gOrUAVaIggZYowxTWx74x45NpV
	EW/8F18bWnkpxYPM3amvMVWrg/X9cpX20odu9Bi7uAiLsirT3RpebnJqMQs9Wvz3iGek
	PHOQ==
X-Gm-Message-State: AKGB3mKKi2P9NMVfu3iK96qt80KMpN2u46Sa4llJxwBbJy3/aCyV4lGF
	pLqvMSYBmJqD5348Y4gRBtv0Ye+c4pxwgLj4EsOlTg==
X-Google-Smtp-Source: AGs4zMatcn2/HYW/me8EzqpZ2fXZegJhQoiLDn4NTOeMJZFV1LoqAzBn1BwmETZRROFPEpAxOfAV+XkkULvJrxHIrXk=
X-Received: by 10.36.120.11 with SMTP id p11mr13806967itc.10.1512404042113;
	Mon, 04 Dec 2017 08:14:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Mon, 4 Dec 2017 08:13:41 -0800 (PST)
In-Reply-To: <f65277d0-e056-5181-9cc9-1e78e4e97c6b@ni.com>
References: <1500479806.27323.202.camel@intel.com>
	<20171107184039.31164-1-haris.okanovic@ni.com>
	<1510179606.1903.92.camel@intel.com>
	<f65277d0-e056-5181-9cc9-1e78e4e97c6b@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Dec 2017 16:13:41 +0000
Message-ID: <CAJTo0LaZ7cQFyvMazuZ9PAFMdFgptBHovLBpsHsBmQbmo+19qw@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: "Ashfield, Bruce \(Wind River\)" <bruce.ashfield@windriver.com>,
	"josh.hernstrom@ni.com" <josh.hernstrom@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH v9] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Mon, 04 Dec 2017 16:14:01 -0000
Content-Type: multipart/alternative; boundary="001a114a9b5eb0212b055f860142"

--001a114a9b5eb0212b055f860142
Content-Type: text/plain; charset="UTF-8"

I know I'm late and this has gone through so many revisions, but I'm seeing
unexplained changes in buildhistory:

$ buildhistory-diff
packages/corei7-64-intel-common-poky-linux/linux-intel/kernel-image-bzimage:
FILELIST: removed "/boot/bzImage"

Doing builds of virtual/kernel with and without this patch and comparing
pkgdata directly confirms that the /boot/bzImage symlink doesn't exist with
this patch but does without it.

Ross

On 10 November 2017 at 21:51, Haris Okanovic <haris.okanovic@ni.com> wrote:

> No problem! Thanks for all the good feedback. I think we shook out most of
> the gremlins in the last few months.
>
> Let me know if you need help with boot loader integration.
>
> -- Haris
>
>
>
> On 11/08/2017 04:20 PM, Wold, Saul wrote:
>
>>
>> Haris,
>>
>> Thanks for your patience on this process.  This version works well, now
>> I have the extra work of getting these kernel known to systemd-boot!
>>
>> Acked-by below!
>>
>> Sau!
>>
>> On Tue, 2017-11-07 at 12:40 -0600, Haris Okanovic wrote:
>>
>>> Some distros may want to provide alternate kernel "flavors" via feeds
>>> or
>>> within bootable images. For example, readily available builds which
>>> provide certain diagnostic features can enable developers and testers
>>> to
>>> more quickly resolve issues by avoiding lengthy kernel builds.
>>>
>>> This change allows for building multiple flavors of the kernel and
>>> module packages by templatizing kernel package names via a new
>>> KERNEL_PACKAGE_NAME variable in kernel.bbclass. It defaults to the
>>> old
>>> name of "kernel", but can be overridden by certain recipes providing
>>> alternate kernel flavors.
>>>
>>> To maintain compatibility, recipes providing alternate kernel flavors
>>> cannot be the "preferred provider" for virtual/kernel. This is
>>> because
>>> OE puts the preferred provider's build and source at
>>> "tmp-glibc/work-shared/$MACHINE/kernel-build-artifacts/" and
>>> "tmp-glibc/work-shared/$MACHINE/kernel-source/" instead of
>>> "tmp-glibc/work/*/$PN/" like other recipes. Therefore, recipes using
>>> the
>>> default KERNEL_PACKAGE_NAME="kernel" follows the old semantics --
>>> build
>>> in the old location and may be preferred provider -- while recipes
>>> using
>>> all other KERNEL_PACKAGE_NAME's build from the normal WORKDIR and
>>> don't
>>> provide "virtual/kernel".
>>>
>>> Testing:
>>>   1. Add `KERNEL_PACKAGE_NAME_pn-linux-yocto-tiny = "tiny-linux"`
>>>      to local.conf so that linux-yocto-tiny may build alongside
>>>      the main kernel (linux-yocto).
>>>   2. `bitbake linux-yocto linux-yocto-tiny` to build both kernel
>>> flavors.
>>>   3. Verified image and modules IPKs exist for both:
>>>      tmp-glibc/deploy/ipk/qemux86/kernel-* for linux-yocto
>>>      tmp-glibc/deploy/ipk/qemux86/tiny-linux* for linux-yocto-tiny
>>>   4. Verified linux-yocto is the "preferred provider", and was built
>>> in
>>>      shared directory: tmp-glibc/work-shared/qemux86/kernel-*
>>>   5. Add `CORE_IMAGE_BASE_INSTALL_append_pn-core-image-base = "tiny-
>>> linux"`
>>>      to local.conf to install both kernel flavors in core-image-base.
>>>   6. `bitbake core-image-base` to build an image.
>>>   7. Verified image contains two bzImage's under /boot/, with
>>>      "yocto-standard" (linux-yocto recipe) selected to boot via
>>> symlink.
>>>
>>> Discussion threads:
>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.op
>>> enembedded.org_pipermail_openembedded-2Dcore_2015-2DDecemb&
>>> d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bz
>>> iuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshb
>>> n-ZaBXenlH_4CQklz7Csmi7u70A&s=cJkppECRP9FwMwrmn-tbJfRpffqbPb
>>> eRXS1uCu5JsB0&e=
>>> er/thread.html#114122
>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.op
>>> enembedded.org_pipermail_openembedded-2Dcore_2017-2DJuly_t&
>>> d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bz
>>> iuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshb
>>> n-ZaBXenlH_4CQklz7Csmi7u70A&s=B73w8-RIOKqgiEjZMC2ra49Q1594cW
>>> VJp9c6Yx6u34w&e=
>>>
>>> hread.html#139130
>>>
>>> [YOCTO #11363]
>>>
>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
>>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>>> Coauthored-by: Gratian Crisan <gratian.crisan@ni.com>
>>> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
>>> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
>>>
>>
>> Acked-by: Saul Wold <sgw@linux.intel.com>
>>
>> Sau!
>>
>> ---
>>> [PATCH v2] Change STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR to
>>> the
>>> "work" directory in alternate kernel builds, instead of "work-
>>> shared",
>>> so
>>> that the two builds don't clobber each other.
>>>
>>> [PATCH v3] An updated version of this change rebased onto the current
>>> OE-core master. Changes:
>>>   - Remove PREFERRED_PROVIDER check in linux-yocto.inc in alternate
>>>     kernel builds, since alternate kernels aren't the
>>>     PREFERRED_PROVIDER for virtual/kernel by definition.
>>>   - Remove "virtual/kernel" from PROVIDES in alternate kernel builds.
>>>
>>> [PATCH v4] Another rebase onto master; no functional change.
>>> Improved description and testing steps.
>>>
>>> [PATCH v5]
>>>   - Warn when PN == KERNEL_PACKAGE_NAME (bug # 11905)
>>>   - Add KERNEL_DEPLOYSUBDIR to avoid DEPLOYDIR collisions
>>>
>>> [PATCH v6] Add KERNEL_PACKAGE_NAME to kernel-module-split.bbclass for
>>> module recipes; fixes lttng-modules build.
>>>
>>> [PATCH v7] Remove second definition of KERNEL_PACKAGE_NAME from
>>> kernel-module-split.bbclass; apply a default in two places where
>>> KERNEL_PACKAGE_NAME is referenced.
>>>
>>> [PATCH v8] Rebase onto current master and more fixups.
>>>   - kernel-devicetree.bbclass: Fixup package names
>>>   - depmodwrapper-cross: don't error when called from alt kernel
>>> recipes
>>>   - kernel.bbclass: Don't install /boot/image symlink in alt recipes
>>>
>>> [PATCH v9]
>>>   - Add feature tracking tag
>>>   - Update testing section to define vars in local.conf
>>>   - Add KERNEL_PACKAGE_NAME check to *-rt recipes
>>>
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.
>>> com_harisokanovic_openembedded-2Dcore_tree_dev_hokanovi_&d=
>>> DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziu
>>> w3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshb
>>> n-ZaBXenlH_4CQklz7Csmi7u70A&s=g1DTbKMM_NmbTwVK6ABKrg7v5Qst-D
>>> AX8wovpBEZiQQ&e=
>>>
>>> multi-kernel-packages-v9
>>> ---
>>>   meta/classes/kernel-devicetree.bbclass             |   8 +-
>>>   meta/classes/kernel-module-split.bbclass           |   9 +-
>>>   meta/classes/kernel.bbclass                        | 114
>>> +++++++++++++--------
>>>   meta/conf/documentation.conf                       |   1 +
>>>   .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |  14 +--
>>>   meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |   2 +-
>>>   meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |   2 +-
>>>   meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   2 +-
>>>   meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |   2 +-
>>>   meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
>>>   10 files changed, 94 insertions(+), 62 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel-devicetree.bbclass
>>> b/meta/classes/kernel-devicetree.bbclass
>>> index 6e08be4b70..4f80cc62eb 100644
>>> --- a/meta/classes/kernel-devicetree.bbclass
>>> +++ b/meta/classes/kernel-devicetree.bbclass
>>> @@ -1,10 +1,10 @@
>>>   # Support for device tree generation
>>>   PACKAGES_append = " \
>>> -    kernel-devicetree \
>>> -    ${@['kernel-image-zimage-bundle',
>>> ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>>> +    ${KERNEL_PACKAGE_NAME}-devicetree \
>>> +    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle',
>>> ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>>>   "
>>> -FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb
>>> /${KERNEL_IMAGEDEST}/*.dtbo"
>>> -FILES_kernel-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
>>> *.dtb.bin"
>>> +FILES_${KERNEL_PACKAGE_NAME}-devicetree =
>>> "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
>>> +FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle =
>>> "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
>>>     # Generate kernel+devicetree bundle
>>>   KERNEL_DEVICETREE_BUNDLE ?= "0"
>>> diff --git a/meta/classes/kernel-module-split.bbclass
>>> b/meta/classes/kernel-module-split.bbclass
>>> index 1035525dac..73c7f18c78 100644
>>> --- a/meta/classes/kernel-module-split.bbclass
>>> +++ b/meta/classes/kernel-module-split.bbclass
>>> @@ -30,7 +30,7 @@ do_install_append() {
>>>     PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>>   -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>>> +KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME",
>>> True) or "kernel" }-modules"
>>>     KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>>   KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>>> @@ -129,16 +129,19 @@ python split_kernel_module_packages () {
>>>              postfix = format.split('%s')[1]
>>>              d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix, ''))
>>>   +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True) or
>>> "kernel"
>>> +    kernel_version = d.getVar("KERNEL_VERSION", True)
>>> +
>>>       module_regex = '^(.*)\.k?o$'
>>>         module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>>>       module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>>> -    module_pattern = module_pattern_prefix + 'kernel-module-%s' +
>>> module_pattern_suffix
>>> +    module_pattern = module_pattern_prefix + kernel_package_name +
>>> '-module-%s' + module_pattern_suffix
>>>         postinst = d.getVar('pkg_postinst_modules')
>>>       postrm = d.getVar('pkg_postrm_modules')
>>>   -    modules = do_split_packages(d,
>>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>>> output_pattern=module_pattern, description='%s kernel module',
>>> postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
>>> extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
>>> +    modules = do_split_packages(d,
>>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>>> output_pattern=module_pattern, description='%s kernel module',
>>> postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
>>> extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>>>       if modules:
>>>           metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>>>           d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>>> diff --git a/meta/classes/kernel.bbclass
>>> b/meta/classes/kernel.bbclass
>>> index 756707a3c2..48b718d777 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -1,6 +1,9 @@
>>>   inherit linux-kernel-base kernel-module-split
>>>   -PROVIDES += "virtual/kernel"
>>> +KERNEL_PACKAGE_NAME ??= "kernel"
>>> +KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME",
>>> True) == "kernel") else d.getVar("KERNEL_PACKAGE_NAME", True) }"
>>> +
>>> +PROVIDES += "${@ "virtual/kernel" if
>>> (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else "" }"
>>>   DEPENDS += "virtual/${TARGET_PREFIX}binutils
>>> virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
>>>   PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>>>   @@ -34,11 +37,32 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_
>>> name(d.getVar('KERNEL_VERSION')
>>>   KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>>     python __anonymous () {
>>> +    pn = d.getVar("PN", True)
>>> +    kpn = d.getVar("KERNEL_PACKAGE_NAME", True)
>>> +
>>> +    # XXX Remove this after bug 11905 is resolved
>>> +    #  FILES_${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
>>> +    if kpn == pn:
>>> +        bb.warn("Some packages (E.g. *-dev) might be missing due to
>>> "
>>> +                "bug 11905 (variable KERNEL_PACKAGE_NAME == PN)")
>>> +
>>> +    # The default kernel recipe builds in a shared location defined
>>> by
>>> +    # bitbake/distro confs: STAGING_KERNEL_DIR and
>>> STAGING_KERNEL_BUILDDIR.
>>> +    # Set these variables to directories under ${WORKDIR} in
>>> alternate
>>> +    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so
>>> that they
>>> +    # may build in parallel with the default kernel without
>>> clobbering.
>>> +    if kpn != "kernel":
>>> +        workdir = d.getVar("WORKDIR", True)
>>> +        sourceDir = os.path.join(workdir, 'kernel-source')
>>> +        artifactsDir = os.path.join(workdir, 'kernel-build-
>>> artifacts')
>>> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
>>> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
>>>         # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>>> KERNEL_IMAGETYPES
>>>       type = d.getVar('KERNEL_IMAGETYPE') or ""
>>>       alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>>>       types = d.getVar('KERNEL_IMAGETYPES') or ""
>>> +    kname = d.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
>>>       if type not in types.split():
>>>           types = (type + ' ' + types).strip()
>>>       if alttype not in types.split():
>>> @@ -55,15 +79,15 @@ python __anonymous () {
>>>           typelower = type.lower()
>>>           imagedest = d.getVar('KERNEL_IMAGEDEST')
>>>   -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
>>> +        d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
>>>   -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest
>>> + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' +
>>> type)
>>> +        d.setVar('FILES_' + kname + '-image-' + typelower, '/' +
>>> imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest
>>> + '/' + type)
>>>   -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
>>> typelower)
>>> +        d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' %
>>> (kname, typelower))
>>>   -        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' +
>>> typelower + '-${KERNEL_VERSION_PKG_NAME}')
>>> +        d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-
>>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>>   -        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>>> +        d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower),
>>> '1')
>>>         image = d.getVar('INITRAMFS_IMAGE')
>>>       if image:
>>> @@ -121,9 +145,9 @@ base_do_unpack_append () {
>>>     inherit kernel-arch deploy
>>>   -PACKAGES_DYNAMIC += "^kernel-module-.*"
>>> -PACKAGES_DYNAMIC += "^kernel-image-.*"
>>> -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>>>     export OS = "${TARGET_OS}"
>>>   export CROSS_COMPILE = "${TARGET_PREFIX}"
>>> @@ -339,7 +363,9 @@ kernel_do_install() {
>>>         install -d ${D}/boot
>>>         for type in ${KERNEL_IMAGETYPES} ; do
>>>                 install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>>> ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
>>> -               ln -sf ${type}-${KERNEL_VERSION}
>>> ${D}/${KERNEL_IMAGEDEST}/${type}
>>> +               if [ "${KERNEL_PACKAGE_NAME}" == "kernel" ]; then
>>> +                       ln -sf ${type}-${KERNEL_VERSION}
>>> ${D}/${KERNEL_IMAGEDEST}/${type}
>>> +               fi
>>>         done
>>>         install -m 0644 System.map ${D}/boot/System.map-
>>> ${KERNEL_VERSION}
>>>         install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>>> @@ -393,9 +419,9 @@ do_shared_workdir_setscene () {
>>>     emit_depmod_pkgdata() {
>>>         # Stash data for depmod
>>> -       install -d ${PKGDESTWORK}/kernel-depmod/
>>> -       echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-
>>> depmod/kernel-abiversion
>>> -       cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod/System.map-
>>> ${KERNEL_VERSION}
>>> +       install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
>>> +       echo "${KERNEL_VERSION}" >
>>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-
>>> abiversion
>>> +       cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-
>>> depmod/System.map-${KERNEL_VERSION}
>>>   }
>>>     PACKAGEFUNCS += "emit_depmod_pkgdata"
>>> @@ -410,7 +436,7 @@ do_shared_workdir () {
>>>         # Store the kernel version in sysroots for module-
>>> base.bbclass
>>>         #
>>>   -     echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>>> +       echo "${KERNEL_VERSION}" >
>>> $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>>>         # Copy files required for module builds
>>>         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>>> @@ -508,28 +534,28 @@ EXPORT_FUNCTIONS do_compile do_install
>>> do_configure
>>>     # kernel-base becomes kernel-${KERNEL_VERSION}
>>>   # kernel-image becomes kernel-image-${KERNEL_VERSION}
>>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-
>>> dev kernel-modules"
>>> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
>>> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
>>> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>>>   FILES_${PN} = ""
>>> -FILES_kernel-base =
>>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>>> -FILES_kernel-image = ""
>>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>>> /boot/config* ${KERNEL_SRC_PATH}
>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>>> -FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>>> -FILES_kernel-modules = ""
>>> -RDEPENDS_kernel = "kernel-base"
>>> +FILES_${KERNEL_PACKAGE_NAME}-base =
>>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>>> +FILES_${KERNEL_PACKAGE_NAME}-image = ""
>>> +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map*
>>> /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>>> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-
>>> ${KERNEL_VERSION_NAME}"
>>> +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
>>> +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>>>   # Allow machines to override this dependency if kernel image files
>>> are
>>>   # not wanted in images as standard
>>> -RDEPENDS_kernel-base ?= "kernel-image"
>>> -PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNE
>>> L_VERSION}')}"
>>> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE',
>>> 'vmlinux', 'kernel-vmlinux', '', d)}"
>>> -PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSI
>>> ON}')}"
>>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>>> -ALLOW_EMPTY_kernel = "1"
>>> -ALLOW_EMPTY_kernel-base = "1"
>>> -ALLOW_EMPTY_kernel-image = "1"
>>> -ALLOW_EMPTY_kernel-modules = "1"
>>> -DESCRIPTION_kernel-modules = "Kernel modules meta package"
>>> -
>>> -pkg_postinst_kernel-base () {
>>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-
>>> image"
>>> +PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@
>>> legitimize_package_name('${KERNEL_VERSION}')}"
>>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditional('KERNE
>>> L_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
>>> +PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitim
>>> ize_package_name('${KERNEL_VERSION}')}"
>>> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-
>>> ${KERNEL_VERSION}"
>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
>>> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta
>>> package"
>>> +
>>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>>>         if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>>>                 mkdir -p $D/lib/modules/${KERNEL_VERSION}
>>>         fi
>>> @@ -543,7 +569,7 @@ pkg_postinst_kernel-base () {
>>>   PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>>     python split_kernel_packages () {
>>> -    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-
>>> firmware-%s', description='Firmware for %s', recursive=True,
>>> extra_depends='')
>>> +    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
>>> output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s',
>>> description='Firmware for %s', recursive=True, extra_depends='')
>>>   }
>>>     # Many scripts want to look in arch/$arch/boot for the bootable
>>> @@ -626,21 +652,27 @@ MODULE_TARBALL_SYMLINK_NAME ?= "modules-
>>> ${MACHINE}.tgz"
>>>   MODULE_TARBALL_DEPLOY ?= "1"
>>>     kernel_do_deploy() {
>>> +       deployDir="${DEPLOYDIR}"
>>> +       if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
>>> +               deployDir="${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
>>> +               mkdir "$deployDir"
>>> +       fi
>>> +
>>>         for type in ${KERNEL_IMAGETYPES} ; do
>>>                 base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>>> -               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>>> ${DEPLOYDIR}/${base_name}.bin
>>> +               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>>> $deployDir/${base_name}.bin
>>>         done
>>>         if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e
>>> '^CONFIG_MODULES=y$' .config); then
>>>                 mkdir -p ${D}/lib
>>> -               tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME}
>>> -C ${D} lib
>>> -               ln -sf ${MODULE_TARBALL_BASE_NAME}
>>> ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
>>> +               tar -cvzf $deployDir/${MODULE_TARBALL_BASE_NAME} -C
>>> ${D} lib
>>> +               ln -sf ${MODULE_TARBALL_BASE_NAME}
>>> $deployDir/${MODULE_TARBALL_SYMLINK_NAME}
>>>         fi
>>>         for type in ${KERNEL_IMAGETYPES} ; do
>>>                 base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>>>                 symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
>>> -               ln -sf ${base_name}.bin
>>> ${DEPLOYDIR}/${symlink_name}.bin
>>> -               ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
>>> +               ln -sf ${base_name}.bin
>>> $deployDir/${symlink_name}.bin
>>> +               ln -sf ${base_name}.bin $deployDir/${type}
>>>         done
>>>         cd ${B}
>>> @@ -650,8 +682,8 @@ kernel_do_deploy() {
>>>                         echo "Copying deploy ${type} kernel-
>>> initramfs image and setting up links..."
>>>                         initramfs_base_name=${type}-
>>> ${INITRAMFS_BASE_NAME}
>>>                         initramfs_symlink_name=${type}-initramfs-
>>> ${MACHINE}
>>> -                       install -m 0644
>>> ${KERNEL_OUTPUT_DIR}/${type}.initramfs
>>> ${DEPLOYDIR}/${initramfs_base_name}.bin
>>> -                       ln -sf ${initramfs_base_name}.bin
>>> ${DEPLOYDIR}/${initramfs_symlink_name}.bin
>>> +                       install -m 0644
>>> ${KERNEL_OUTPUT_DIR}/${type}.initramfs
>>> $deployDir/${initramfs_base_name}.bin
>>> +                       ln -sf ${initramfs_base_name}.bin
>>> $deployDir/${initramfs_symlink_name}.bin
>>>                 fi
>>>         done
>>>   }
>>> diff --git a/meta/conf/documentation.conf
>>> b/meta/conf/documentation.conf
>>> index a55e2836b5..2c88504fb9 100644
>>> --- a/meta/conf/documentation.conf
>>> +++ b/meta/conf/documentation.conf
>>> @@ -247,6 +247,7 @@ KERNEL_IMAGETYPE[doc] = "The type of kernel to
>>> build for a device, usually set b
>>>   KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a
>>> device, usually set by the machine configuration files and defaults
>>> to KERNEL_IMAGETYPE."
>>>   KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be
>>> auto-loaded during boot"
>>>   KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the
>>> build system expects to find module_conf_* values that specify
>>> configuration for each of the modules"
>>> +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages.
>>> Defaults to 'kernel'."
>>>   KERNEL_PATH[doc] = "The location of the kernel sources. This
>>> variable is set to the value of the STAGING_KERNEL_DIR within the
>>> module class (module.bbclass)."
>>>   KERNEL_SRC[doc] = "The location of the kernel sources. This variable
>>> is set to the value of the STAGING_KERNEL_DIR within the module class
>>> (module.bbclass)."
>>>   KFEATURE_DESCRIPTION[doc] = "Provides a short description of a
>>> configuration fragment. You use this variable in the .scc file that
>>> describes a configuration fragment file."
>>> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>>> b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>>> index 44d013f29d..2eec921728 100644
>>> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>>> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>>> @@ -23,17 +23,13 @@ if [ "\$1" != "-a" -o "\$2" != "-b" ]; then
>>>       echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION" >&2
>>>       exit 1
>>>   fi
>>> -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion ]; then
>>> -    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/kernel-
>>> abiversion" >&2
>>> -else
>>> -    kernelabi=\$(cat ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion)
>>> -    if [ "\$kernelabi" != "\$4" ]; then
>>> -        echo "Error: Kernel version \$4 does not match kernel-
>>> abiversion (\$kernelabi)" >&2
>>> -        exit 1
>>> -    fi
>>> +
>>> +kernelabi=""
>>> +if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ]; then
>>> +    kernelabi=\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-
>>> abiversion")
>>>   fi
>>>   -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ]; then
>>> +if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [
>>> "\$kernelabi" != "\$4" ]; then
>>>       echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-
>>> \$4" >&2
>>>       exec env depmod "\$1" "\$2" "\$3" "\$4"
>>>   else
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>>> index f93d9530eb..894e2ffbf6 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>>   # to build multiple virtual/kernel providers, e.g. as dependency of
>>>   # core-image-rt-sdk, core-image-rt.
>>>   python () {
>>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>>> yocto-rt":
>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
>>>           raise bb.parse.SkipPackage("Set
>>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>>   }
>>>   diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>>> index c49a9340f8..be4d163ff1 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>>   # to build multiple virtual/kernel providers, e.g. as dependency of
>>>   # core-image-rt-sdk, core-image-rt.
>>>   python () {
>>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>>> yocto-rt":
>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
>>>           raise bb.parse.SkipPackage("Set
>>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>>   }
>>>   diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>>> index 25d88833a9..e489bbb9f2 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>>   # to build multiple virtual/kernel providers, e.g. as dependency of
>>>   # core-image-rt-sdk, core-image-rt.
>>>   python () {
>>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>>> yocto-rt":
>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
>>>           raise bb.parse.SkipPackage("Set
>>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>>   }
>>>   diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>>> index 6734dc0d05..8212b1445c 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>>   # to build multiple virtual/kernel providers, e.g. as dependency of
>>>   # core-image-rt-sdk, core-image-rt.
>>>   python () {
>>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>>> yocto-rt":
>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
>>>           raise bb.parse.SkipPackage("Set
>>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>>   }
>>>   diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>> b/meta/recipes-kernel/linux/linux-yocto.inc
>>> index 9c1f61be75..8a70eb5018 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>> @@ -12,7 +12,7 @@ INC_PR = "r4"
>>>   # PREFERRED_PROVIDER for virtual/kernel. This avoids network access
>>> required
>>>   # by the use of AUTOREV SRCREVs, which are the default for this
>>> recipe.
>>>   python () {
>>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>>> d.getVar("PN"):
>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>>> d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != d.getVar("PN",
>>> True):
>>>           d.delVar("BB_DONT_CACHE")
>>>           raise bb.parse.SkipPackage("Set
>>> PREFERRED_PROVIDER_virtual/kernel to %s to enable it" %
>>> (d.getVar("PN")))
>>>   }
>>> --
>>> 2.14.2
>>>
>> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114a9b5eb0212b055f860142
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I know I&#39;m late and this has gone through so many revi=
sions, but I&#39;m seeing unexplained changes in buildhistory:<div><br></di=
v><div><div>$ buildhistory-diff</div><div>packages/corei7-64-intel-common-p=
oky-linux/linux-intel/kernel-image-bzimage: FILELIST: removed &quot;/boot/b=
zImage&quot;<br></div></div><div><br></div><div>Doing builds of virtual/ker=
nel with and without this patch and comparing pkgdata directly confirms tha=
t the /boot/bzImage symlink doesn&#39;t exist with this patch but does with=
out it.</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On 10 November 2017 at 21:51, Haris Okanovi=
c <span dir=3D"ltr">&lt;<a href=3D"mailto:haris.okanovic@ni.com" target=3D"=
_blank">haris.okanovic@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">No problem! Thanks for all the good feedback. I think we shook o=
ut most of the gremlins in the last few months.<br>
<br>
Let me know if you need help with boot loader integration.<br>
<br>
-- Haris<div><div class=3D"h5"><br>
<br>
<br>
On 11/08/2017 04:20 PM, Wold, Saul wrote:<br>
</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">
<br>
Haris,<br>
<br>
Thanks for your patience on this process.=C2=A0 This version works well, no=
w<br>
I have the extra work of getting these kernel known to systemd-boot!<br>
<br>
Acked-by below!<br>
<br>
Sau!<br>
<br>
On Tue, 2017-11-07 at 12:40 -0600, Haris Okanovic wrote:<br>
</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">
Some distros may want to provide alternate kernel &quot;flavors&quot; via f=
eeds<br>
or<br>
within bootable images. For example, readily available builds which<br>
provide certain diagnostic features can enable developers and testers<br>
to<br>
more quickly resolve issues by avoiding lengthy kernel builds.<br>
<br>
This change allows for building multiple flavors of the kernel and<br>
module packages by templatizing kernel package names via a new<br>
KERNEL_PACKAGE_NAME variable in kernel.bbclass. It defaults to the<br>
old<br>
name of &quot;kernel&quot;, but can be overridden by certain recipes provid=
ing<br>
alternate kernel flavors.<br>
<br>
To maintain compatibility, recipes providing alternate kernel flavors<br>
cannot be the &quot;preferred provider&quot; for virtual/kernel. This is<br=
>
because<br>
OE puts the preferred provider&#39;s build and source at<br>
&quot;tmp-glibc/work-shared/$MACHIN<wbr>E/kernel-build-artifacts/&quot; and=
<br>
&quot;tmp-glibc/work-shared/$MACHIN<wbr>E/kernel-source/&quot; instead of<b=
r>
&quot;tmp-glibc/work/*/$PN/&quot; like other recipes. Therefore, recipes us=
ing<br>
the<br>
default KERNEL_PACKAGE_NAME=3D&quot;kernel&quot; follows the old semantics =
--<br>
build<br>
in the old location and may be preferred provider -- while recipes<br>
using<br>
all other KERNEL_PACKAGE_NAME&#39;s build from the normal WORKDIR and<br>
don&#39;t<br>
provide &quot;virtual/kernel&quot;.<br>
<br>
Testing:<br>
=C2=A0 1. Add `KERNEL_PACKAGE_NAME_pn-linux-<wbr>yocto-tiny =3D &quot;tiny-=
linux&quot;`<br>
=C2=A0 =C2=A0 =C2=A0to local.conf so that linux-yocto-tiny may build alongs=
ide<br>
=C2=A0 =C2=A0 =C2=A0the main kernel (linux-yocto).<br>
=C2=A0 2. `bitbake linux-yocto linux-yocto-tiny` to build both kernel<br>
flavors.<br>
=C2=A0 3. Verified image and modules IPKs exist for both:<br>
=C2=A0 =C2=A0 =C2=A0tmp-glibc/deploy/ipk/qemux86/<wbr>kernel-* for linux-yo=
cto<br>
=C2=A0 =C2=A0 =C2=A0tmp-glibc/deploy/ipk/qemux86/<wbr>tiny-linux* for linux=
-yocto-tiny<br>
=C2=A0 4. Verified linux-yocto is the &quot;preferred provider&quot;, and w=
as built<br>
in<br>
=C2=A0 =C2=A0 =C2=A0shared directory: tmp-glibc/work-shared/qemux86/<wbr>ke=
rnel-*<br>
=C2=A0 5. Add `CORE_IMAGE_BASE_INSTALL_appen<wbr>d_pn-core-image-base =3D &=
quot;tiny-<br>
linux&quot;`<br>
=C2=A0 =C2=A0 =C2=A0to local.conf to install both kernel flavors in core-im=
age-base.<br>
=C2=A0 6. `bitbake core-image-base` to build an image.<br>
=C2=A0 7. Verified image contains two bzImage&#39;s under /boot/, with<br>
=C2=A0 =C2=A0 =C2=A0&quot;yocto-standard&quot; (linux-yocto recipe) selecte=
d to boot via<br>
symlink.<br>
<br>
Discussion threads:<br>
</div></div><a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A=
__lists.openembedded.org_pipermail_openembedded-2Dcore_2015-2DDecemb&amp;d=
=3DDwIGaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3D8Bziu=
w3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&amp;m=3DPo_g6d_nUSqHTshbn-ZaBXenlH_4=
CQklz7Csmi7u70A&amp;s=3DcJkppECRP9FwMwrmn-tbJfRpffqbPbeRXS1uCu5JsB0&amp;e=
=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.<wb=
r>com/v2/url?u=3Dhttp-3A__lists.op<wbr>enembedded.org_pipermail_opene<wbr>m=
bedded-2Dcore_2015-2DDecemb&amp;<wbr>d=3DDwIGaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6=
<wbr>YCiE2uzI1jjZZuIPelcSjixA&amp;r=3D8Bz<wbr>iuw3IaCGjyrSAphuGwHmVdHcVwza-=
<wbr>srUYwL9U_Ms&amp;m=3DPo_g6d_nUSqHTshb<wbr>n-ZaBXenlH_4CQklz7Csmi7u70A&a=
mp;s=3D<wbr>cJkppECRP9FwMwrmn-tbJfRpffqbPb<wbr>eRXS1uCu5JsB0&amp;e=3D</a><b=
r>
er/thread.html#114122<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.open=
embedded.org_pipermail_openembedded-2Dcore_2017-2DJuly_t&amp;d=3DDwIGaQ&amp=
;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3D8Bziuw3IaCGjyrSAph=
uGwHmVdHcVwza-srUYwL9U_Ms&amp;m=3DPo_g6d_nUSqHTshbn-ZaBXenlH_4CQklz7Csmi7u7=
0A&amp;s=3DB73w8-RIOKqgiEjZMC2ra49Q1594cWVJp9c6Yx6u34w&amp;e=3D" rel=3D"nor=
eferrer" target=3D"_blank">https://urldefense.proofpoint.<wbr>com/v2/url?u=
=3Dhttp-3A__lists.op<wbr>enembedded.org_pipermail_opene<wbr>mbedded-2Dcore_=
2017-2DJuly_t&amp;<wbr>d=3DDwIGaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6<wbr>YCiE2uzI1=
jjZZuIPelcSjixA&amp;r=3D8Bz<wbr>iuw3IaCGjyrSAphuGwHmVdHcVwza-<wbr>srUYwL9U_=
Ms&amp;m=3DPo_g6d_nUSqHTshb<wbr>n-ZaBXenlH_4CQklz7Csmi7u70A&amp;s=3D<wbr>B7=
3w8-RIOKqgiEjZMC2ra49Q1594cW<wbr>VJp9c6Yx6u34w&amp;e=3D</a><div><div class=
=3D"h5"><br>
hread.html#139130<br>
<br>
[YOCTO #11363]<br>
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
 target=3D"_blank">adrian.ratiu@ni.com</a>&gt;<br>
Signed-off-by: Gratian Crisan &lt;<a href=3D"mailto:gratian.crisan@ni.com" =
target=3D"_blank">gratian.crisan@ni.com</a>&gt;<br>
Signed-off-by: Haris Okanovic &lt;<a href=3D"mailto:haris.okanovic@ni.com" =
target=3D"_blank">haris.okanovic@ni.com</a>&gt;<br>
Coauthored-by: Gratian Crisan &lt;<a href=3D"mailto:gratian.crisan@ni.com" =
target=3D"_blank">gratian.crisan@ni.com</a>&gt;<br>
Coauthored-by: Haris Okanovic &lt;<a href=3D"mailto:haris.okanovic@ni.com" =
target=3D"_blank">haris.okanovic@ni.com</a>&gt;<br>
Coauthored-by: Josh Hernstrom &lt;<a href=3D"mailto:josh.hernstrom@ni.com" =
target=3D"_blank">josh.hernstrom@ni.com</a>&gt;<br>
</div></div></blockquote><div><div class=3D"h5">
<br>
Acked-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_b=
lank">sgw@linux.intel.com</a>&gt;<br>
<br>
Sau!<br>
<br>
</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">
---<br>
[PATCH v2] Change STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR to<br>
the<br>
&quot;work&quot; directory in alternate kernel builds, instead of &quot;wor=
k-<br>
shared&quot;,<br>
so<br>
that the two builds don&#39;t clobber each other.<br>
<br>
[PATCH v3] An updated version of this change rebased onto the current<br>
OE-core master. Changes:<br>
=C2=A0 - Remove PREFERRED_PROVIDER check in linux-yocto.inc in alternate<br=
>
=C2=A0 =C2=A0 kernel builds, since alternate kernels aren&#39;t the<br>
=C2=A0 =C2=A0 PREFERRED_PROVIDER for virtual/kernel by definition.<br>
=C2=A0 - Remove &quot;virtual/kernel&quot; from PROVIDES in alternate kerne=
l builds.<br>
<br>
[PATCH v4] Another rebase onto master; no functional change.<br>
Improved description and testing steps.<br>
<br>
[PATCH v5]<br>
=C2=A0 - Warn when PN =3D=3D KERNEL_PACKAGE_NAME (bug # 11905)<br>
=C2=A0 - Add KERNEL_DEPLOYSUBDIR to avoid DEPLOYDIR collisions<br>
<br>
[PATCH v6] Add KERNEL_PACKAGE_NAME to kernel-module-split.bbclass for<br>
module recipes; fixes lttng-modules build.<br>
<br>
[PATCH v7] Remove second definition of KERNEL_PACKAGE_NAME from<br>
kernel-module-split.bbclass; apply a default in two places where<br>
KERNEL_PACKAGE_NAME is referenced.<br>
<br>
[PATCH v8] Rebase onto current master and more fixups.<br>
=C2=A0 - kernel-devicetree.bbclass: Fixup package names<br>
=C2=A0 - depmodwrapper-cross: don&#39;t error when called from alt kernel<b=
r>
recipes<br>
=C2=A0 - kernel.bbclass: Don&#39;t install /boot/image symlink in alt recip=
es<br>
<br>
[PATCH v9]<br>
=C2=A0 - Add feature tracking tag<br>
=C2=A0 - Update testing section to define vars in local.conf<br>
=C2=A0 - Add KERNEL_PACKAGE_NAME check to *-rt recipes<br>
<br>
</div></div><a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__github.com_harisokanovic_openembedded-2Dcore_tree_dev_hokanovi_&amp;d=3D=
DwIGaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3D8Bziuw3I=
aCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&amp;m=3DPo_g6d_nUSqHTshbn-ZaBXenlH_4CQk=
lz7Csmi7u70A&amp;s=3Dg1DTbKMM_NmbTwVK6ABKrg7v5Qst-DAX8wovpBEZiQQ&amp;e=3D" =
rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.<wbr>com=
/v2/url?u=3Dhttps-3A__github.<wbr>com_harisokanovic_openembedded<wbr>-2Dcor=
e_tree_dev_hokanovi_&amp;d=3D<wbr>DwIGaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YC<wbr>=
iE2uzI1jjZZuIPelcSjixA&amp;r=3D8Bziu<wbr>w3IaCGjyrSAphuGwHmVdHcVwza-<wbr>sr=
UYwL9U_Ms&amp;m=3DPo_g6d_nUSqHTshb<wbr>n-ZaBXenlH_4CQklz7Csmi7u70A&amp;s=3D=
<wbr>g1DTbKMM_NmbTwVK6ABKrg7v5Qst-D<wbr>AX8wovpBEZiQQ&amp;e=3D</a><div><div=
 class=3D"h5"><br>
multi-kernel-packages-v9<br>
---<br>
=C2=A0 meta/classes/kernel-devicetree<wbr>.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0 meta/classes/kernel-module-spl<wbr>it.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 114<br>
+++++++++++++--------<br>
=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0 .../recipes-kernel/kmod/<a href=3D"http://depmodwrapper-cross_1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">depmod<wbr>wrapper-cross_1.0.bb</a> =
|=C2=A0 14 +--<br>
=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" =
rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.10.bb</a>=C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" =
rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.12.bb</a>=C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" r=
el=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.4.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" r=
el=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.9.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 meta/recipes-kernel/linux/linu<wbr>x-yocto.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 10 files changed, 94 insertions(+), 62 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-devicetr<wbr>ee.bbclass<br>
b/meta/classes/kernel-devicetr<wbr>ee.bbclass<br>
index 6e08be4b70..4f80cc62eb 100644<br>
--- a/meta/classes/kernel-devicetr<wbr>ee.bbclass<br>
+++ b/meta/classes/kernel-devicetr<wbr>ee.bbclass<br>
@@ -1,10 +1,10 @@<br>
=C2=A0 # Support for device tree generation<br>
=C2=A0 PACKAGES_append =3D &quot; \<br>
-=C2=A0 =C2=A0 kernel-devicetree \<br>
-=C2=A0 =C2=A0 ${@[&#39;kernel-image-zimage-bundl<wbr>e&#39;,<br>
&#39;&#39;][d.getVar(&#39;KERNEL_DEVICETRE<wbr>E_BUNDLE&#39;) !=3D &#39;1&#=
39;]} \<br>
+=C2=A0 =C2=A0 ${KERNEL_PACKAGE_NAME}-devicet<wbr>ree \<br>
+=C2=A0 =C2=A0 ${@[d.getVar(&#39;KERNEL_PACKAGE_N<wbr>AME&#39;) + &#39;-ima=
ge-zimage-bundle&#39;,<br>
&#39;&#39;][d.getVar(&#39;KERNEL_DEVICETRE<wbr>E_BUNDLE&#39;) !=3D &#39;1&#=
39;]} \<br>
=C2=A0 &quot;<br>
-FILES_kernel-devicetree =3D &quot;/${KERNEL_IMAGEDEST}/*.dtb<br>
/${KERNEL_IMAGEDEST}/*.dtbo&quot;<br>
-FILES_kernel-image-zimage-bun<wbr>dle =3D &quot;/${KERNEL_IMAGEDEST}/zImag=
e-<br>
*.dtb.bin&quot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-<wbr>devicetree =3D<br>
&quot;/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo&quot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-<wbr>image-zimage-bundle =3D<br>
&quot;/${KERNEL_IMAGEDEST}/zImage-*<wbr>.dtb.bin&quot;<br>
=C2=A0 =C2=A0 # Generate kernel+devicetree bundle<br>
=C2=A0 KERNEL_DEVICETREE_BUNDLE ?=3D &quot;0&quot;<br>
diff --git a/meta/classes/kernel-module-s<wbr>plit.bbclass<br>
b/meta/classes/kernel-module-s<wbr>plit.bbclass<br>
index 1035525dac..73c7f18c78 100644<br>
--- a/meta/classes/kernel-module-s<wbr>plit.bbclass<br>
+++ b/meta/classes/kernel-module-s<wbr>plit.bbclass<br>
@@ -30,7 +30,7 @@ do_install_append() {<br>
=C2=A0 =C2=A0 PACKAGESPLITFUNCS_prepend =3D &quot;split_kernel_module_packa=
ges &quot;<br>
=C2=A0 -KERNEL_MODULES_META_PACKAGE ?=3D &quot;kernel-modules&quot;<br>
+KERNEL_MODULES_META_PACKAGE ?=3D &quot;${@ d.getVar(&quot;KERNEL_PACKAGE_N=
AME&quot;<wbr>,<br>
True) or &quot;kernel&quot; }-modules&quot;<br>
=C2=A0 =C2=A0 KERNEL_MODULE_PACKAGE_PREFIX ?=3D &quot;&quot;<br>
=C2=A0 KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot;-${KERNEL_VERSION}&quot;<br>
@@ -129,16 +129,19 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0postfix =3D format.split(&#=
39;%s&#39;)[1]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;RPROVIDES_&#3=
9; + pkg, pkg.replace(postfix, &#39;&#39;))<br>
=C2=A0 +=C2=A0 =C2=A0 kernel_package_name =3D d.getVar(&quot;KERNEL_PACKAGE=
_NAME&quot;<wbr>, True) or<br>
&quot;kernel&quot;<br>
+=C2=A0 =C2=A0 kernel_version =3D d.getVar(&quot;KERNEL_VERSION&quot;, True=
)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 module_regex =3D &#39;^(.*)\.k?o$&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 module_pattern_prefix =3D d.getVar(&#39;KERNEL_=
MODULE_PACKAG<wbr>E_PREFIX&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 module_pattern_suffix =3D d.getVar(&#39;KERNEL_MODULE_=
PACKAG<wbr>E_SUFFIX&#39;)<br>
-=C2=A0 =C2=A0 module_pattern =3D module_pattern_prefix + &#39;kernel-modul=
e-%s&#39; +<br>
module_pattern_suffix<br>
+=C2=A0 =C2=A0 module_pattern =3D module_pattern_prefix + kernel_package_na=
me +<br>
&#39;-module-%s&#39; + module_pattern_suffix<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 postinst =3D d.getVar(&#39;pkg_postinst_modules=
<wbr>&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 postrm =3D d.getVar(&#39;pkg_postrm_modules&#39;)<br>
=C2=A0 -=C2=A0 =C2=A0 modules =3D do_split_packages(d,<br>
root=3D&#39;${nonarch_base_libdir}/m<wbr>odules&#39;, file_regex=3Dmodule_r=
egex,<br>
output_pattern=3Dmodule_pattern, description=3D&#39;%s kernel module&#39;,<=
br>
postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadat=
a,<br>
extra_depends=3D&#39;kernel-%s&#39; % (d.getVar(&quot;KERNEL_VERSION&quot;)=
))<br>
+=C2=A0 =C2=A0 modules =3D do_split_packages(d,<br>
root=3D&#39;${nonarch_base_libdir}/m<wbr>odules&#39;, file_regex=3Dmodule_r=
egex,<br>
output_pattern=3Dmodule_pattern, description=3D&#39;%s kernel module&#39;,<=
br>
postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadat=
a,<br>
extra_depends=3D&#39;%s-%s&#39; % (kernel_package_name, kernel_version))<br=
>
=C2=A0 =C2=A0 =C2=A0 if modules:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 metapkg =3D d.getVar(&#39;KERNEL_MODULES=
_META_<wbr>PACKAGE&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_&#39; + metapk=
g, &#39; &#39;+&#39; &#39;.join(modules))<br>
diff --git a/meta/classes/kernel.bbclass<br>
b/meta/classes/kernel.bbclass<br>
index 756707a3c2..48b718d777 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -1,6 +1,9 @@<br>
=C2=A0 inherit linux-kernel-base kernel-module-split<br>
=C2=A0 -PROVIDES +=3D &quot;virtual/kernel&quot;<br>
+KERNEL_PACKAGE_NAME ??=3D &quot;kernel&quot;<br>
+KERNEL_DEPLOYSUBDIR ??=3D &quot;${@ &quot;&quot; if (d.getVar(&quot;KERNEL=
_PACKAGE_NAME<wbr>&quot;,<br>
True) =3D=3D &quot;kernel&quot;) else d.getVar(&quot;KERNEL_PACKAGE_NAME&qu=
ot;<wbr>, True) }&quot;<br>
+<br>
+PROVIDES +=3D &quot;${@ &quot;virtual/kernel&quot; if<br>
(d.getVar(&quot;KERNEL_PACKAGE_NAME<wbr>&quot;, True) =3D=3D &quot;kernel&q=
uot;) else &quot;&quot; }&quot;<br>
=C2=A0 DEPENDS +=3D &quot;virtual/${TARGET_PREFIX}binut<wbr>ils<br>
virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native&quot;<br>
=C2=A0 PACKAGE_WRITE_DEPS +=3D &quot;depmodwrapper-cross&quot;<br>
=C2=A0 @@ -34,11 +37,32 @@ KERNEL_VERSION_PKG_NAME =3D &quot;${@legitimize_=
package_<br>
name(d.getVar(&#39;KERNEL_VERSION&#39;<wbr>)<br>
=C2=A0 KERNEL_VERSION_PKG_NAME[vardep<wbr>value] =3D &quot;${LINUX_VERSION}=
&quot;<br>
=C2=A0 =C2=A0 python __anonymous () {<br>
+=C2=A0 =C2=A0 pn =3D d.getVar(&quot;PN&quot;, True)<br>
+=C2=A0 =C2=A0 kpn =3D d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;<wbr>, True)=
<br>
+<br>
+=C2=A0 =C2=A0 # XXX Remove this after bug 11905 is resolved<br>
+=C2=A0 =C2=A0 #=C2=A0 FILES_${KERNEL_PACKAGE_NAME}-d<wbr>ev doesn&#39;t ex=
pand correctly<br>
+=C2=A0 =C2=A0 if kpn =3D=3D pn:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Some packages (E.g. *-dev) might=
 be missing due to<br>
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bug 11905 (v=
ariable KERNEL_PACKAGE_NAME =3D=3D PN)&quot;)<br>
+<br>
+=C2=A0 =C2=A0 # The default kernel recipe builds in a shared location defi=
ned<br>
by<br>
+=C2=A0 =C2=A0 # bitbake/distro confs: STAGING_KERNEL_DIR and<br>
STAGING_KERNEL_BUILDDIR.<br>
+=C2=A0 =C2=A0 # Set these variables to directories under ${WORKDIR} in<br>
alternate<br>
+=C2=A0 =C2=A0 # kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=3D kernel=
) so<br>
that they<br>
+=C2=A0 =C2=A0 # may build in parallel with the default kernel without<br>
clobbering.<br>
+=C2=A0 =C2=A0 if kpn !=3D &quot;kernel&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 workdir =3D d.getVar(&quot;WORKDIR&quot;, True=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sourceDir =3D os.path.join(workdir, &#39;kerne=
l-source&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 artifactsDir =3D os.path.join(workdir, &#39;ke=
rnel-build-<br>
artifacts&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;STAGING_KERNEL_DIR&quot;, sourc=
eDir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;STAGING_KERNEL_BUILD<wbr>DIR&qu=
ot;, artifactsDir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETY=
PE into<br>
KERNEL_IMAGETYPES<br>
=C2=A0 =C2=A0 =C2=A0 type =3D d.getVar(&#39;KERNEL_IMAGETYPE&#39;) or &quot=
;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 alttype =3D d.getVar(&#39;KERNEL_ALT_IMAGETYPE<wbr>&#3=
9;) or &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 types =3D d.getVar(&#39;KERNEL_IMAGETYPES&#39;) or &qu=
ot;&quot;<br>
+=C2=A0 =C2=A0 kname =3D d.getVar(&#39;KERNEL_PACKAGE_NAME&#39;<wbr>, True)=
 or &quot;kernel&quot;<br>
=C2=A0 =C2=A0 =C2=A0 if type not in types.split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 types =3D (type + &#39; &#39; + types).s=
trip()<br>
=C2=A0 =C2=A0 =C2=A0 if alttype not in types.split():<br>
@@ -55,15 +79,15 @@ python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typelower =3D type.lower()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imagedest =3D d.getVar(&#39;KERNEL_IMAGE=
DEST&#39;)<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;PACKAGES&#39;, &#39; &=
#39; + &#39;kernel-image-&#39; + typelower)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;PACKAGES&#39;, &#39; %s-image=
-%s&#39; % (kname, typelower))<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;FILES_kernel-image-&#39; =
+ typelower, &#39;/&#39; + imagedest<br>
+ &#39;/&#39; + type + &#39;-${KERNEL_VERSION_NAME}&#39; + &#39; /&#39; + i=
magedest + &#39;/&#39; +<br>
type)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;FILES_&#39; + kname + &#39;-imag=
e-&#39; + typelower, &#39;/&#39; +<br>
imagedest + &#39;/&#39; + type + &#39;-${KERNEL_VERSION_NAME}&#39; + &#39; =
/&#39; + imagedest<br>
+ &#39;/&#39; + type)<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_kernel-i<wbr>=
mage&#39;, &#39; &#39; + &#39;kernel-image-&#39; +<br>
typelower)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_%s-image<wbr>&#39; %=
 kname, &#39; %s-image-%s&#39; %<br>
(kname, typelower))<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PKG_kernel-image-&#39; + =
typelower, &#39;kernel-image-&#39; +<br>
typelower + &#39;-${KERNEL_VERSION_PKG_NAME}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PKG_%s-image-%s&#39; % (kname,ty=
pelower), &#39;%s-image-<br>
%s-${KERNEL_VERSION_PKG_NAME}&#39; % (kname, typelower))<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;ALLOW_EMPTY_kernel-i<wbr>=
mage-&#39; + typelower, &#39;1&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;ALLOW_EMPTY_%s-image<wbr>-%s&#39=
; % (kname, typelower),<br>
&#39;1&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 image =3D d.getVar(&#39;INITRAMFS_IMAGE&#39;)<b=
r>
=C2=A0 =C2=A0 =C2=A0 if image:<br>
@@ -121,9 +145,9 @@ base_do_unpack_append () {<br>
=C2=A0 =C2=A0 inherit kernel-arch deploy<br>
=C2=A0 -PACKAGES_DYNAMIC +=3D &quot;^kernel-module-.*&quot;<br>
-PACKAGES_DYNAMIC +=3D &quot;^kernel-image-.*&quot;<br>
-PACKAGES_DYNAMIC +=3D &quot;^kernel-firmware-.*&quot;<br>
+PACKAGES_DYNAMIC +=3D &quot;^${KERNEL_PACKAGE_NAME}-modul<wbr>e-.*&quot;<b=
r>
+PACKAGES_DYNAMIC +=3D &quot;^${KERNEL_PACKAGE_NAME}-image<wbr>-.*&quot;<br=
>
+PACKAGES_DYNAMIC +=3D &quot;^${KERNEL_PACKAGE_NAME}-firmw<wbr>are-.*&quot;=
<br>
=C2=A0 =C2=A0 export OS =3D &quot;${TARGET_OS}&quot;<br>
=C2=A0 export CROSS_COMPILE =3D &quot;${TARGET_PREFIX}&quot;<br>
@@ -339,7 +363,9 @@ kernel_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/boot<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for type in ${KERNEL_IMAGETYPES} ; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${K=
ERNEL_OUTPUT_DIR}/${type}<br>
${D}/${KERNEL_IMAGEDEST}/${typ<wbr>e}-${KERNEL_VERSION}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${type}-${KE=
RNEL_VERSION}<br>
${D}/${KERNEL_IMAGEDEST}/${typ<wbr>e}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${KERNEL=
_PACKAGE_NAME}&quot; =3D=3D &quot;kernel&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${type}-${KERNEL_VERSION}<br>
${D}/${KERNEL_IMAGEDEST}/${typ<wbr>e}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 System.map ${D}/boot/System.map=
-<br>
${KERNEL_VERSION}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 .config ${D}/boot/config-${KERN=
EL_VERS<wbr>ION}<br>
@@ -393,9 +419,9 @@ do_shared_workdir_setscene () {<br>
=C2=A0 =C2=A0 emit_depmod_pkgdata() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Stash data for depmod<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${PKGDESTWORK}/kernel-depmod/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${KERNEL_VERSION}&quot; &gt; ${PKGDE=
STWORK}/kernel-<br>
depmod/kernel-abiversion<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod=
/S<wbr>ystem.map-<br>
${KERNEL_VERSION}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${PKGDESTWORK}/${KERNEL_PACKAG<wbr>E=
_NAME}-depmod/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${KERNEL_VERSION}&quot; &gt;<br>
${PKGDESTWORK}/${KERNEL_PACKAG<wbr>E_NAME}-depmod/${KERNEL_PACKAG<wbr>E_NAM=
E}-<br>
abiversion<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACK=
AG<wbr>E_NAME}-<br>
depmod/System.map-${KERNEL_VER<wbr>SION}<br>
=C2=A0 }<br>
=C2=A0 =C2=A0 PACKAGEFUNCS +=3D &quot;emit_depmod_pkgdata&quot;<br>
@@ -410,7 +436,7 @@ do_shared_workdir () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Store the kernel version in sysroots for modu=
le-<br>
base.bbclass<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0echo &quot;${KERNEL_VERSION}&quot; &gt; $kernel=
dir/kernel-abiversion<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${KERNEL_VERSION}&quot; &gt;<br>
$kerneldir/${KERNEL_PACKAGE_NA<wbr>ME}-abiversion<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy files required for module builds<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp System.map $kerneldir/System.map-${KERNEL<wb=
r>_VERSION}<br>
@@ -508,28 +534,28 @@ EXPORT_FUNCTIONS do_compile do_install<br>
do_configure<br>
=C2=A0 =C2=A0 # kernel-base becomes kernel-${KERNEL_VERSION}<br>
=C2=A0 # kernel-image becomes kernel-image-${KERNEL_VERSION}<br>
-PACKAGES =3D &quot;kernel kernel-base kernel-vmlinux kernel-image kernel-<=
br>
dev kernel-modules&quot;<br>
+PACKAGES =3D &quot;${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base<br>
${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image<br>
${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules<wbr>&quot;<br>
=C2=A0 FILES_${PN} =3D &quot;&quot;<br>
-FILES_kernel-base =3D<br>
&quot;${nonarch_base_libdir}/module<wbr>s/${KERNEL_VERSION}/modules.<wbr>or=
der<br>
${nonarch_base_libdir}/modules<wbr>/${KERNEL_VERSION}/modules.<wbr>builtin&=
quot;<br>
-FILES_kernel-image =3D &quot;&quot;<br>
-FILES_kernel-dev =3D &quot;/boot/System.map* /boot/Module.symvers*<br>
/boot/config* ${KERNEL_SRC_PATH}<br>
${nonarch_base_libdir}/modules<wbr>/${KERNEL_VERSION}/build&quot;<br>
-FILES_kernel-vmlinux =3D &quot;/boot/vmlinux-${KERNEL_VERSIO<wbr>N_NAME}&q=
uot;<br>
-FILES_kernel-modules =3D &quot;&quot;<br>
-RDEPENDS_kernel =3D &quot;kernel-base&quot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-<wbr>base =3D<br>
&quot;${nonarch_base_libdir}/module<wbr>s/${KERNEL_VERSION}/modules.<wbr>or=
der<br>
${nonarch_base_libdir}/modules<wbr>/${KERNEL_VERSION}/modules.<wbr>builtin&=
quot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-<wbr>image =3D &quot;&quot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-<wbr>dev =3D &quot;/boot/System.map*<br>
/boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}<br>
${nonarch_base_libdir}/modules<wbr>/${KERNEL_VERSION}/build&quot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-<wbr>vmlinux =3D &quot;/boot/vmlinux-<br>
${KERNEL_VERSION_NAME}&quot;<br>
+FILES_${KERNEL_PACKAGE_NAME}-<wbr>modules =3D &quot;&quot;<br>
+RDEPENDS_${KERNEL_PACKAGE_NAM<wbr>E} =3D &quot;${KERNEL_PACKAGE_NAME}-base=
&quot;<br>
=C2=A0 # Allow machines to override this dependency if kernel image files<b=
r>
are<br>
=C2=A0 # not wanted in images as standard<br>
-RDEPENDS_kernel-base ?=3D &quot;kernel-image&quot;<br>
-PKG_kernel-image =3D &quot;kernel-image-${@legitimize_pa<wbr>ckage_name(&#=
39;${KERNE<br>
L_VERSION}&#39;)}&quot;<br>
-RDEPENDS_kernel-image +=3D &quot;${@base_conditional(&#39;KERNEL_I<wbr>MAG=
ETYPE&#39;,<br>
&#39;vmlinux&#39;, &#39;kernel-vmlinux&#39;, &#39;&#39;, d)}&quot;<br>
-PKG_kernel-base =3D &quot;kernel-${@legitimize_package_<wbr>name(&#39;${KE=
RNEL_VERSI<br>
ON}&#39;)}&quot;<br>
-RPROVIDES_kernel-base +=3D &quot;kernel-${KERNEL_VERSION}&quot;<br>
-ALLOW_EMPTY_kernel =3D &quot;1&quot;<br>
-ALLOW_EMPTY_kernel-base =3D &quot;1&quot;<br>
-ALLOW_EMPTY_kernel-image =3D &quot;1&quot;<br>
-ALLOW_EMPTY_kernel-modules =3D &quot;1&quot;<br>
-DESCRIPTION_kernel-modules =3D &quot;Kernel modules meta package&quot;<br>
-<br>
-pkg_postinst_kernel-base () {<br>
+RDEPENDS_${KERNEL_PACKAGE_NAM<wbr>E}-base ?=3D &quot;${KERNEL_PACKAGE_NAME=
}-<br>
image&quot;<br>
+PKG_${KERNEL_PACKAGE_NAME}-im<wbr>age =3D &quot;${KERNEL_PACKAGE_NAME}-ima=
ge-<wbr>${@<br>
legitimize_package_name(&#39;${KER<wbr>NEL_VERSION}&#39;)}&quot;<br>
+RDEPENDS_${KERNEL_PACKAGE_NAM<wbr>E}-image +=3D &quot;${@base_conditional(=
&#39;KERNE<br>
L_IMAGETYPE&#39;, &#39;vmlinux&#39;, &#39;${KERNEL_PACKAGE_NAME}-vmlinu<wbr=
>x&#39;, &#39;&#39;, d)}&quot;<br>
+PKG_${KERNEL_PACKAGE_NAME}-ba<wbr>se =3D &quot;${KERNEL_PACKAGE_NAME}-${@l=
eg<wbr>itim<br>
ize_package_name(&#39;${KERNEL_VER<wbr>SION}&#39;)}&quot;<br>
+RPROVIDES_${KERNEL_PACKAGE_NA<wbr>ME}-base +=3D &quot;${KERNEL_PACKAGE_NAM=
E}-<br>
${KERNEL_VERSION}&quot;<br>
+ALLOW_EMPTY_${KERNEL_PACKAGE_<wbr>NAME} =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${KERNEL_PACKAGE_<wbr>NAME}-base =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${KERNEL_PACKAGE_<wbr>NAME}-image =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${KERNEL_PACKAGE_<wbr>NAME}-modules =3D &quot;1&quot;<br>
+DESCRIPTION_${KERNEL_PACKAGE_<wbr>NAME}-modules =3D &quot;Kernel modules m=
eta<br>
package&quot;<br>
+<br>
+pkg_postinst_${KERNEL_PACKAGE<wbr>_NAME}-base () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -e &quot;$D/lib/modules/${KERNEL_VERSI<w=
br>ON}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $D/lib/mod=
ules/${KERNEL_VERSIO<wbr>N}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
@@ -543,7 +569,7 @@ pkg_postinst_kernel-base () {<br>
=C2=A0 PACKAGESPLITFUNCS_prepend =3D &quot;split_kernel_packages &quot;<br>
=C2=A0 =C2=A0 python split_kernel_packages () {<br>
-=C2=A0 =C2=A0 do_split_packages(d, root=3D&#39;${nonarch_base_libdir}/f<wb=
r>irmware&#39;,<br>
file_regex=3D&#39;^(.*)\.(bin|fw|cis<wbr>|csp|dsp)$&#39;, output_pattern=3D=
&#39;kernel-<br>
firmware-%s&#39;, description=3D&#39;Firmware for %s&#39;, recursive=3DTrue=
,<br>
extra_depends=3D&#39;&#39;)<br>
+=C2=A0 =C2=A0 do_split_packages(d, root=3D&#39;${nonarch_base_libdir}/f<wb=
r>irmware&#39;,<br>
file_regex=3D&#39;^(.*)\.(bin|fw|cis<wbr>|csp|dsp)$&#39;,<br>
output_pattern=3D&#39;${KERNEL_PACKA<wbr>GE_NAME}-firmware-%s&#39;,<br>
description=3D&#39;Firmware for %s&#39;, recursive=3DTrue, extra_depends=3D=
&#39;&#39;)<br>
=C2=A0 }<br>
=C2=A0 =C2=A0 # Many scripts want to look in arch/$arch/boot for the bootab=
le<br>
@@ -626,21 +652,27 @@ MODULE_TARBALL_SYMLINK_NAME ?=3D &quot;modules-<br>
${MACHINE}.tgz&quot;<br>
=C2=A0 MODULE_TARBALL_DEPLOY ?=3D &quot;1&quot;<br>
=C2=A0 =C2=A0 kernel_do_deploy() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0deployDir=3D&quot;${DEPLOYDIR}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${KERNEL_DEPLOYSUBDIR}&quot; ]; t=
hen<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deployDir=3D&quot;$=
{DEPLOYDIR}/${KER<wbr>NEL_DEPLOYSUBDIR}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir &quot;$deploy=
Dir&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for type in ${KERNEL_IMAGETYPES} ; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base_name=3D${type}=
-${KERNEL_IMA<wbr>GE_BASE_NAME}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${K=
ERNEL_OUTPUT_DIR}/${type}<br>
${DEPLOYDIR}/${base_name}.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${K=
ERNEL_OUTPUT_DIR}/${type}<br>
$deployDir/${base_name}.bin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ${MODULE_TARBALL_DEPLOY} =3D &quot;1&quot;=
 ] &amp;&amp; (grep -q -i -e<br>
&#39;^CONFIG_MODULES=3Dy$&#39; .config); then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/lib<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -cvzf ${DEPLOYD=
IR}/${MODULE_TARBALL_<wbr>BASE_NAME}<br>
-C ${D} lib<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${MODULE_TAR=
BALL_BASE_NAME}<br>
${DEPLOYDIR}/${MODULE_TARBALL_<wbr>SYMLINK_NAME}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -cvzf $deployDi=
r/${MODULE_TARBALL_BA<wbr>SE_NAME} -C<br>
${D} lib<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${MODULE_TAR=
BALL_BASE_NAME}<br>
$deployDir/${MODULE_TARBALL_SY<wbr>MLINK_NAME}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for type in ${KERNEL_IMAGETYPES} ; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base_name=3D${type}=
-${KERNEL_IMA<wbr>GE_BASE_NAME}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 symlink_name=3D${ty=
pe}-${KERNEL_<wbr>IMAGE_SYMLINK_NAME}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${base_name}=
.bin<br>
${DEPLOYDIR}/${symlink_name}.b<wbr>in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${base_name}=
.bin ${DEPLOYDIR}/${type}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${base_name}=
.bin<br>
$deployDir/${symlink_name}.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${base_name}=
.bin $deployDir/${type}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
@@ -650,8 +682,8 @@ kernel_do_deploy() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;Copying deploy ${type} kernel-<br>
initramfs image and setting up links...&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 initramfs_base_name=3D${type}-<br>
${INITRAMFS_BASE_NAME}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 initramfs_symlink_name=3D${type}<wbr>-initramfs-<br>
${MACHINE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644<br>
${KERNEL_OUTPUT_DIR}/${type}.i<wbr>nitramfs<br>
${DEPLOYDIR}/${initramfs_base_<wbr>name}.bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${initramfs_base_name}.bin<br>
${DEPLOYDIR}/${initramfs_symli<wbr>nk_name}.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644<br>
${KERNEL_OUTPUT_DIR}/${type}.i<wbr>nitramfs<br>
$deployDir/${initramfs_base_na<wbr>me}.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${initramfs_base_name}.bin<br>
$deployDir/${initramfs_symlink<wbr>_name}.bin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 }<br>
diff --git a/meta/conf/documentation.conf<br>
b/meta/conf/documentation.conf<br>
index a55e2836b5..2c88504fb9 100644<br>
--- a/meta/conf/documentation.conf<br>
+++ b/meta/conf/documentation.conf<br>
@@ -247,6 +247,7 @@ KERNEL_IMAGETYPE[doc] =3D &quot;The type of kernel to<b=
r>
build for a device, usually set b<br>
=C2=A0 KERNEL_IMAGETYPES[doc] =3D &quot;The list of types of kernel to buil=
d for a<br>
device, usually set by the machine configuration files and defaults<br>
to KERNEL_IMAGETYPE.&quot;<br>
=C2=A0 KERNEL_MODULE_AUTOLOAD[doc] =3D &quot;Lists kernel modules that need=
 to be<br>
auto-loaded during boot&quot;<br>
=C2=A0 KERNEL_MODULE_PROBECONF[doc] =3D &quot;Lists kernel modules for whic=
h the<br>
build system expects to find module_conf_* values that specify<br>
configuration for each of the modules&quot;<br>
+KERNEL_PACKAGE_NAME[doc] =3D &quot;Name prefix for kernel packages.<br>
Defaults to &#39;kernel&#39;.&quot;<br>
=C2=A0 KERNEL_PATH[doc] =3D &quot;The location of the kernel sources. This<=
br>
variable is set to the value of the STAGING_KERNEL_DIR within the<br>
module class (module.bbclass).&quot;<br>
=C2=A0 KERNEL_SRC[doc] =3D &quot;The location of the kernel sources. This v=
ariable<br>
is set to the value of the STAGING_KERNEL_DIR within the module class<br>
(module.bbclass).&quot;<br>
=C2=A0 KFEATURE_DESCRIPTION[doc] =3D &quot;Provides a short description of =
a<br>
configuration fragment. You use this variable in the .scc file that<br>
describes a configuration fragment file.&quot;<br>
diff --git a/meta/recipes-kernel/kmod/<a href=3D"http://depmodwrapper-cross=
_1.0.bb" rel=3D"noreferrer" target=3D"_blank">dep<wbr>modwrapper-cross_1.0.=
bb</a><br>
b/meta/recipes-kernel/kmod/<a href=3D"http://depmodwrapper-cross_1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">dep<wbr>modwrapper-cross_1.0.bb</a><br>
index 44d013f29d..2eec921728 100644<br>
--- a/meta/recipes-kernel/kmod/<a href=3D"http://depmodwrapper-cross_1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">dep<wbr>modwrapper-cross_1.0.bb</a><=
br>
+++ b/meta/recipes-kernel/kmod/<a href=3D"http://depmodwrapper-cross_1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">dep<wbr>modwrapper-cross_1.0.bb</a><=
br>
@@ -23,17 +23,13 @@ if [ &quot;\$1&quot; !=3D &quot;-a&quot; -o &quot;\$2&q=
uot; !=3D &quot;-b&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 echo &quot;Usage: depmodwrapper -a -b rootfs KERNEL_VE=
RSION&quot; &gt;&amp;2<br>
=C2=A0 =C2=A0 =C2=A0 exit 1<br>
=C2=A0 fi<br>
-if [ ! -r ${PKGDATA_DIR}/kernel-depmod/k<wbr>ernel-abiversion ]; then<br>
-=C2=A0 =C2=A0 echo &quot;Unable to read: ${PKGDATA_DIR}/kernel-depmod/k<wb=
r>ernel-<br>
abiversion&quot; &gt;&amp;2<br>
-else<br>
-=C2=A0 =C2=A0 kernelabi=3D\$(cat ${PKGDATA_DIR}/kernel-depmod/k<wbr>ernel-=
abiversion)<br>
-=C2=A0 =C2=A0 if [ &quot;\$kernelabi&quot; !=3D &quot;\$4&quot; ]; then<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Error: Kernel version \$4 does not =
match kernel-<br>
abiversion (\$kernelabi)&quot; &gt;&amp;2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
-=C2=A0 =C2=A0 fi<br>
+<br>
+kernelabi=3D&quot;&quot;<br>
+if [ -r &quot;${PKGDATA_DIR}/kernel-depmod/<wbr>kernel-abiversion&quot; ];=
 then<br>
+=C2=A0 =C2=A0 kernelabi=3D\$(cat &quot;${PKGDATA_DIR}/kernel-depmod/<wbr>k=
ernel-<br>
abiversion&quot;)<br>
=C2=A0 fi<br>
=C2=A0 -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/S<wbr>ystem.map-\$4 ]; then<=
br>
+if [ ! -r ${PKGDATA_DIR}/kernel-depmod/S<wbr>ystem.map-\$4 ] || [<br>
&quot;\$kernelabi&quot; !=3D &quot;\$4&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 echo &quot;Unable to read: ${PKGDATA_DIR}/kernel-depmo=
d/S<wbr>ystem.map-<br>
\$4&quot; &gt;&amp;2<br>
=C2=A0 =C2=A0 =C2=A0 exec env depmod &quot;\$1&quot; &quot;\$2&quot; &quot;=
\$3&quot; &quot;\$4&quot;<br>
=C2=A0 else<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a><=
br>
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a><br>
index f93d9530eb..894e2ffbf6 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a><br>
@@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0 # to build multiple virtual/kernel providers, e.g. as dependency of<=
br>
=C2=A0 # core-image-rt-sdk, core-image-rt.<br>
=C2=A0 python () {<br>
-=C2=A0 =C2=A0 if d.getVar(&quot;PREFERRED_PROVIDER_v<wbr>irtual/kernel&quo=
t;) !=3D &quot;linux-<br>
yocto-rt&quot;:<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;<wbr>, True) =3D=
=3D &quot;kernel&quot; and<br>
d.getVar(&quot;PREFERRED_PROVIDER_v<wbr>irtual/kernel&quot;) !=3D &quot;lin=
ux-yocto-rt&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;Set<br>
PREFERRED_PROVIDER_virtual/ker<wbr>nel to linux-yocto-rt to enable it&quot;=
)<br>
=C2=A0 }<br>
=C2=A0 diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
-rt_4.12.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.=
bb</a><br>
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
index c49a9340f8..be4d163ff1 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
@@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0 # to build multiple virtual/kernel providers, e.g. as dependency of<=
br>
=C2=A0 # core-image-rt-sdk, core-image-rt.<br>
=C2=A0 python () {<br>
-=C2=A0 =C2=A0 if d.getVar(&quot;PREFERRED_PROVIDER_v<wbr>irtual/kernel&quo=
t;) !=3D &quot;linux-<br>
yocto-rt&quot;:<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;<wbr>, True) =3D=
=3D &quot;kernel&quot; and<br>
d.getVar(&quot;PREFERRED_PROVIDER_v<wbr>irtual/kernel&quot;) !=3D &quot;lin=
ux-yocto-rt&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;Set<br>
PREFERRED_PROVIDER_virtual/ker<wbr>nel to linux-yocto-rt to enable it&quot;=
)<br>
=C2=A0 }<br>
=C2=A0 diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
-rt_4.4.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb=
</a><br>
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" rel=3D=
"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb</a><br>
index 25d88833a9..e489bbb9f2 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb</a><br>
@@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0 # to build multiple virtual/kernel providers, e.g. as dependency of<=
br>
=C2=A0 # core-image-rt-sdk, core-image-rt.<br>
=C2=A0 python () {<br>
-=C2=A0 =C2=A0 if d.getVar(&quot;PREFERRED_PROVIDER_v<wbr>irtual/kernel&quo=
t;) !=3D &quot;linux-<br>
yocto-rt&quot;:<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;<wbr>, True) =3D=
=3D &quot;kernel&quot; and<br>
d.getVar(&quot;PREFERRED_PROVIDER_v<wbr>irtual/kernel&quot;) !=3D &quot;lin=
ux-yocto-rt&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;Set<br>
PREFERRED_PROVIDER_virtual/ker<wbr>nel to linux-yocto-rt to enable it&quot;=
)<br>
=C2=A0 }<br>
=C2=A0 diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
-rt_4.9.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb=
</a><br>
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" rel=3D=
"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb</a><br>
index 6734dc0d05..8212b1445c 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb</a><br>
@@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0 # to build multiple virtual/kernel providers, e.g. as dependency of<=
br>
=C2=A0 # core-image-rt-sdk, core-image-rt.<br>
=C2=A0 python () {<br>
-=C2=A0 =C2=A0 if d.getVar(&quot;PREFERRED_PROVIDER_v<wbr>irtual/kernel&quo=
t;) !=3D &quot;linux-<br>
yocto-rt&quot;:<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;<wbr>, True) =3D=
=3D &quot;kernel&quot; and<br>
d.getVar(&quot;PREFERRED_PROVIDER_v<wbr>irtual/kernel&quot;) !=3D &quot;lin=
ux-yocto-rt&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;Set<br>
PREFERRED_PROVIDER_virtual/ker<wbr>nel to linux-yocto-rt to enable it&quot;=
)<br>
=C2=A0 }<br>
=C2=A0 diff --git a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
b/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
index 9c1f61be75..8a70eb5018 100644<br>
--- a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
@@ -12,7 +12,7 @@ INC_PR =3D &quot;r4&quot;<br>
=C2=A0 # PREFERRED_PROVIDER for virtual/kernel. This avoids network access<=
br>
required<br>
=C2=A0 # by the use of AUTOREV SRCREVs, which are the default for this<br>
recipe.<br>
=C2=A0 python () {<br>
-=C2=A0 =C2=A0 if d.getVar(&quot;PREFERRED_PROVIDER_v<wbr>irtual/kernel&quo=
t;) !=3D<br>
d.getVar(&quot;PN&quot;):<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;<wbr>, True) =3D=
=3D &quot;kernel&quot; and<br>
d.getVar(&quot;PREFERRED_PROVIDER_v<wbr>irtual/kernel&quot;, True) !=3D d.g=
etVar(&quot;PN&quot;,<br>
True):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.delVar(&quot;BB_DONT_CACHE&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;Set<br>
PREFERRED_PROVIDER_virtual/ker<wbr>nel to %s to enable it&quot; %<br>
(d.getVar(&quot;PN&quot;)))<br>
=C2=A0 }<br>
-- <br>
2.14.2<br>
</div></div></blockquote></blockquote><div class=3D"HOEnZb"><div class=3D"h=
5">
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114a9b5eb0212b055f860142--
