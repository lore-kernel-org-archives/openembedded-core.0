Return-Path: <nathan@nathanrossi.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id F0FB278AE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 11:20:16 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id s7-v6so2933717itb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rS9RB8Llp+YUzwEwdSXS7MBScTkdgTvPtFMPtJkv1oU=;
	b=MwBLECACQQxwYzJYgq1WZbX6QaJ1dzSl5gVhMJcFkwe1j5LI5YhBr/pzOrsmS069EF
	BUyCpjE9CnftNaT1Aw8g98GGFyH+aTzyp1DXFzUFt7+3VCixMoNO2ztmUegwLFfRvBBj
	k8aXMeghr50IWP0tp7zF1OszA2wfmddDcJBiWyHsyAQjcPD4/TNe7OP+m5IVy8JuX1cU
	JznZSVWozpjvddPGQiciz2eHmPQbTb17Sz8nk+niDy0ce7MLogifbHkXY/04YaKJbVlj
	6woq07V+LPApHdhpAp+uAk0guMu4ZUho2bIFNLz/UmN62nmQNSPge4a87BPD7JtKd+Ha
	Ti0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rS9RB8Llp+YUzwEwdSXS7MBScTkdgTvPtFMPtJkv1oU=;
	b=NCknA89SVHPHKC0BVIG7to4sjiO4qEvbs6GIVVKGP9BYhwRy7demElGttsStFT0lpB
	BL0VEEGYdbwNijaHsU6+KiV2rlFFaBbNH+LB/2NUnA8PyfbpTlzUpptVBN989WimmsRV
	2FlJIWzk4pDUz0twm+q+6OTf5dYenZJfBcmdL6bOHzPupe/aTHvR2L5ngDWZtlvfGifA
	DtXERqGq9uU7RPAV/AmCZbVCaktLZFstWo5pxOPv64AicKiPdPS2KAn5kzXND7EbP8jt
	Y9+oMVK/HJSby3Ci29qvFEBRtQuY/ob+6kHQm9/URd+/VKKL7u1BL7XFOTl+EQxVzLh0
	ADjg==
X-Gm-Message-State: AOUpUlF62TqQQkll5U5KxJsGHJwbnyBdY1rP0iGWFQNfjU/rqyKOc9X9
	bFz9IRr+GjQm1KMvIbtNiC7rXNiXATdwINsRgWoztIC/
X-Google-Smtp-Source: AA+uWPxf97Wy2rEJWby8VDVkqQxIYdH4QqS6iueLlhGOMblq7aOcuxk/Zs5kKfMJhI4ColxSVraDoqNaYeaNOGUoGPw=
X-Received: by 2002:a24:4112:: with SMTP id
	x18-v6mr1790446ita.83.1533727217517; 
	Wed, 08 Aug 2018 04:20:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:e417:0:0:0:0:0 with HTTP;
	Wed, 8 Aug 2018 04:20:16 -0700 (PDT)
In-Reply-To: <ca10ec07-72df-fcbf-efb2-738dcdbabc43@xilinx.com>
References: <20180802085504.15851-1-nathan@nathanrossi.com>
	<MWHPR02MB2768F151648844374BA8BF3BAF200@MWHPR02MB2768.namprd02.prod.outlook.com>
	<CA+aJhH0HwtVvAY3cLPfCapykLaqJi-Whi9=WdGMwgMgCVnq6Pg@mail.gmail.com>
	<ca10ec07-72df-fcbf-efb2-738dcdbabc43@xilinx.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 8 Aug 2018 21:20:16 +1000
Message-ID: <CA+aJhH0qEFONL8D7SWYDWs6Y9Sz8Tv4dnAHTC1kOtbc4rOyGYg@mail.gmail.com>
To: Jaewon Lee <jaewon.lee@xilinx.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devicetree.bbclass: User/BSP device tree source compilation class
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
X-List-Received-Date: Wed, 08 Aug 2018 11:20:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 8 August 2018 at 06:27, Jaewon Lee <jaewon.lee@xilinx.com> wrote:
>
> Hi Nathan,
>
>
> On 08/07/2018 04:59 AM, Nathan Rossi wrote:
>>
>> On 7 August 2018 at 07:16, Jaewon Lee <JAEWON@xilinx.com> wrote:
>>>
>>> Hi Nathan,
>>>
>>> What do you think about adding support for dts include files as well
>>> (.dtsi)?
>>
>> Hi Jaewon,
>>
>> Device tree include files already work with the implementation in this
>> patch. The default include path is the same as the path of the dts
>> files, so if you use "/include/ "<dtsi>.dtsi";" (dtc) or "#include
>> <dtsi.dtsi>" (preprocessor) it will search within the DT_FILES_PATH
>> (which is WORKDIR by default) and then the KERNEL_INCLUDE paths.
>> Though if the dtsi is in another path you can add it to DT_INCLUDE,
>> and it will be searched.
>
> If i'm understanding correctly, this flow just supports compiling a dts f=
ile
> that has a plugin tag (it can include dtsi files)
> in short I can't compile the dtsi file itself to a dtbo

Correct, that is the common practice when it comes to dts and dtsi files.

>>
>> Does this cover the support you are after or is there another
>> configuration you would like it to support?
>
> Yes for us, if dt overlays are enabled, we don't include a dtsi in the ba=
se
> dts and compile that dtsi separately as a dtbo which is loaded later.
> so would be great to loop through all dtsi files as well and compile if i=
t
> has a plugin tag.
>
> Your thoughts?

The behaviour you are after sounds specific to the sources you have.
There would be some issues if the default behaviour of the class
worked in the way you desire, such as name conflicts (a.dtsi ->
a.dtbo, a.dts -> a.dtbo, which one is used?).

However the class should be able to handle your use case. With the
current implementation you could handle it by creating a custom or
appended do_compile and using the devicetree_compile function. But
maybe it is worth handling the use case in a more generic way. For
example the class could instead have "DT_FILES" instead of
"DT_FILES_PATH", where DT_FILES is a space separated list of files
which expands with globbing. Then to enable building .dtsi files
append the paths to DT_FILES in your recipe, e.g. DT_FILES +=3D
"${S}/*.dtsi". Though it would not be able to filter out dtsi's that
are not /plugin/;.

Regards,
Nathan

>
> Thanks,
> Jaewon
>
>
>>
>> Thanks,
>> Nathan
>>
>>> Thanks,
>>> Jaewon
>>>
>>>
>>> -----Original Message-----
>>> From: openembedded-core-bounces@lists.openembedded.org
>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>>> Nathan Rossi
>>> Sent: Thursday, August 2, 2018 1:55 AM
>>> To: openembedded-core@lists.openembedded.org
>>> Subject: [OE-core] [PATCH] devicetree.bbclass: User/BSP device tree
>>> source compilation class
>>>
>>> This bbclass implements the device tree compilation for user provided
>>> device trees. In order to use this class, it should be inherited in a B=
SP
>>> recipe which provides the sources. The default setup enables inclusion =
of
>>> kernel device tree sources (though can be disabled by the recipe by
>>> overriding DT_INCLUDE or KERNEL_INCLUDE).
>>>
>>> This provides an additional mechanism for BSPs to provide device trees
>>> and device tree overlays for their target machines. Whilst still enabli=
ng
>>> access to the kernel device trees for base SoC includes and headers.
>>>
>>> This approach to providing device trees has benefits for certain use
>>> cases over patching the device trees into the kernel source.
>>>
>>> * device trees are separated from kernel source, allows for selection o=
f
>>> kernel and or kernel versions without needing to explicitly patch the k=
ernel
>>> (or appending to the kernel recipes).
>>>
>>> * providing device trees from separate sources, from the layer, generat=
ed
>>> by the recipe or other recipes.
>>>
>>> This class also implements some additional features that are not
>>> available in the kernel-devicetree flow. This includes population of de=
vice
>>> tree blobs into the sysroot which allows for other recipes to consume b=
uilt
>>> dtbs (e.g. U-Boot with EXT_DTB compilation), device tree overlay compil=
ation
>>> and customizing DTC compilation args (boot cpu/padding/etc.).
>>>
>>> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
>>> Acked-by: Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
>>> ---
>>> In addition to this patch I have written some documentation for the Yoc=
to
>>> BSP guide that covers details about both methods.
>>>
>>> The meta-xilinx layer has a recipe (device-tree.bb) that behaves exactl=
y
>>> like this class for some time. It has been very useful for out-of-kerne=
l
>>> device tree compilation as well as for a mechanism so that users of Xil=
inx
>>> SoCs can provide their customizations (FPGA devices) and board specific
>>> configuration. This compilation flow also makes sense for other BSPs, w=
hich
>>> is the reason for creating this bbclass for common shared use by other =
BSPs.
>>>
>>> Examples of this classes usage can be seen for meta-xilinx:
>>>
>>> https://github.com/nathanrossi/meta-xilinx/blob/nrossi/devicetree-class=
ify/meta-xilinx-bsp/recipes-bsp/device-tree/device-tree.bb
>>> ---
>>>   meta/classes/devicetree.bbclass | 140 +++++++++++++++++++++++++++++++=
+
>>>   1 file changed, 140 insertions(+)
>>>   create mode 100644 meta/classes/devicetree.bbclass
>>>
>>> diff --git a/meta/classes/devicetree.bbclass
>>> b/meta/classes/devicetree.bbclass new file mode 100644 index
>>> 0000000000..dbc83f2a1d
>>> --- /dev/null
>>> +++ b/meta/classes/devicetree.bbclass
>>> @@ -0,0 +1,140 @@
>>> +# This bbclass implements device tree compliation for user provided
>>> +device tree # sources. The compilation of the device tree sources is
>>> +the same as the kernel # device tree compilation process, this include=
s
>>> +being able to include sources # from the kernel such as soc dtsi files
>>> +or header files such as gpio.h. In # addition to device trees this
>>> +bbclass also handles compilation of device tree # overlays.
>>> +#
>>> +# The output of this class behaves similar to how
>>> +kernel-devicetree.bbclass # operates in that the output files are
>>> installed into /boot/devicetree.
>>> +# However this class on purpose separates the deployed device trees
>>> +into the # 'devicetree' subdirectory. This prevents clashes with the
>>> +kernel-devicetree # output. Additionally the device trees are populate=
d
>>> +into the sysroot for # access via the sysroot from within other recipe=
s.
>>> +
>>> +SECTION ?=3D "bsp"
>>> +
>>> +# The default inclusion of kernel device tree includes and headers
>>> +means that # device trees built with them are at least GPLv2 (and in
>>> +some cases dual # licensed). Default to GPLv2 if the recipe does not
>>> specify a license.
>>> +LICENSE ?=3D "GPLv2"
>>> +LIC_FILES_CHKSUM ?=3D
>>> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f80980d171dd6425610833a2=
2dbe6"
>>> +
>>> +INHIBIT_DEFAULT_DEPS =3D "1"
>>> +DEPENDS +=3D "dtc-native"
>>> +
>>> +inherit deploy kernel-arch
>>> +
>>> +COMPATIBLE_MACHINE ?=3D "^$"
>>> +
>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> +
>>> +SYSROOT_DIRS +=3D "/boot/devicetree"
>>> +FILES_${PN} =3D "/boot/devicetree/*.dtb /boot/devicetree/*.dtbo"
>>> +
>>> +S =3D "${WORKDIR}"
>>> +B =3D "${WORKDIR}/build"
>>> +
>>> +# Default kernel includes, these represent what are normally used for
>>> +in-kernel # sources.
>>> +KERNEL_INCLUDE ??=3D " \
>>> +        ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts \
>>> +        ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/* \
>>> +        ${STAGING_KERNEL_DIR}/scripts/dtc/include-prefixes \
>>> +        "
>>> +
>>> +DT_INCLUDE[doc] =3D "Search paths to be made available to both the dev=
ice
>>> tree compiler and preprocessor for inclusion."
>>> +DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
>>> +DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to
>>> select dts files that are not in source (e.g. generated)."
>>> +DT_FILES_PATH ?=3D "${S}"
>>> +
>>> +DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, use=
d as
>>> extra space typically for additional properties during boot."
>>> +DT_PADDING_SIZE ??=3D "0x3000"
>>> +DT_RESERVED_MAP[doc] =3D "Number of reserved map entires."
>>> +DT_RESERVED_MAP ??=3D "8"
>>> +DT_BOOT_CPU[doc] =3D "The boot cpu, defaults to 0"
>>> +DT_BOOT_CPU ??=3D "0"
>>> +
>>> +DTC_FLAGS ?=3D "-R ${DT_RESERVED_MAP} -p ${DT_PADDING_SIZE} -b
>>> ${DT_BOOT_CPU}"
>>> +DTC_PPFLAGS ?=3D "-nostdinc -undef -D__DTS__ -x assembler-with-cpp"
>>> +DTC_OFLAGS ?=3D "-@ -H epapr"
>>> +
>>> +python () {
>>> +    if d.getVar("KERNEL_INCLUDE"):
>>> +        # auto add dependency on kernel tree, but only if kernel inclu=
de
>>> paths
>>> +        # are specified.
>>> +        d.appendVarFlag("do_compile", "depends", "
>>> +virtual/kernel:do_configure") }
>>> +
>>> +def expand_includes(varname, d):
>>> +    import glob
>>> +    includes =3D set()
>>> +    # expand all includes with glob
>>> +    for i in (d.getVar(varname) or "").split():
>>> +        for g in glob.glob(i):
>>> +            if os.path.isdir(g): # only add directories to include pat=
h
>>> +                includes.add(g)
>>> +    return includes
>>> +
>>> +def devicetree_source_is_overlay(path):
>>> +    # determine if a dts file is an overlay by checking if it uses
>>> "/plugin/;"
>>> +    with open(path, "r") as f:
>>> +        for i in f:
>>> +            if i.startswith("/plugin/;"):
>>> +                return True
>>> +    return False
>>> +
>>> +def devicetree_compile(dtspath, includes, d):
>>> +    import subprocess
>>> +    dts =3D os.path.basename(dtspath)
>>> +    dtname =3D os.path.splitext(dts)[0]
>>> +    bb.note("Processing {0} [{1}]".format(dtname, dts))
>>> +
>>> +    # preprocess
>>> +    ppargs =3D d.getVar("BUILD_CPP").split()
>>> +    ppargs +=3D (d.getVar("DTC_PPFLAGS") or "").split()
>>> +    for i in includes:
>>> +        ppargs.append("-I{0}".format(i))
>>> +    ppargs +=3D ["-o", "{0}.pp".format(dts), dtspath]
>>> +    bb.note("Running {0}".format(" ".join(ppargs)))
>>> +    subprocess.run(ppargs, check =3D True)
>>> +
>>> +    # determine if the file is an overlay or not (using the preprocess=
ed
>>> file)
>>> +    isoverlay =3D devicetree_source_is_overlay("{0}.pp".format(dts))
>>> +
>>> +    # compile
>>> +    dtcargs =3D ["dtc"] + (d.getVar("DTC_FLAGS") or "").split()
>>> +    if isoverlay:
>>> +        dtcargs +=3D (d.getVar("DTC_OFLAGS") or "").split()
>>> +    for i in includes:
>>> +        dtcargs +=3D ["-i", i]
>>> +    dtcargs +=3D ["-o", "{0}.{1}".format(dtname, "dtbo" if isoverlay e=
lse
>>> "dtb")]
>>> +    dtcargs +=3D ["-I", "dts", "-O", "dtb", "{0}.pp".format(dts)]
>>> +    bb.note("Running {0}".format(" ".join(dtcargs)))
>>> +    subprocess.run(dtcargs, check =3D True)
>>> +
>>> +python devicetree_do_compile() {
>>> +    includes =3D expand_includes("DT_INCLUDE", d)
>>> +    listpath =3D d.getVar("DT_FILES_PATH")
>>> +    for dts in os.listdir(listpath):
>>> +        if not dts.endswith(".dts"):
>>> +            continue # skip non-.dts files
>>> +        dtspath =3D os.path.join(listpath, dts)
>>> +        devicetree_compile(dtspath, includes, d) }
>>> +
>>> +devicetree_do_install() {
>>> +    for DTB_FILE in `ls *.dtb *.dtbo`; do
>>> +        install -Dm 0644 ${B}/${DTB_FILE}
>>> ${D}/boot/devicetree/${DTB_FILE}
>>> +    done
>>> +}
>>> +
>>> +devicetree_do_deploy() {
>>> +    for DTB_FILE in `ls *.dtb *.dtbo`; do
>>> +        install -Dm 0644 ${B}/${DTB_FILE}
>>> ${DEPLOYDIR}/devicetree/${DTB_FILE}
>>> +    done
>>> +}
>>> +addtask deploy before do_build after do_install
>>> +
>>> +EXPORT_FUNCTIONS do_compile do_install do_deploy
>>> +
>>> --
>>> 2.18.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

