Return-Path: <nathan@nathanrossi.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 012A278C29
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 11:59:11 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id g141-v6so22561530ita.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 04:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gTA7FpSG5CjvNz/TY+VrZEmSlsRZoAX4+8Z4b1SAUhg=;
	b=chi+vWoXdj//SKed/q6xm4OJlwBELXXjdwZ218QO/771VCbHLG3XkpEsLO8jQpYs0C
	874F4TM6CuzT91kUmV1TxjJrU8UDS9hlPZ0xGNbT+ToFH555e2ISd1Swv1BzBvRotJzi
	Wk+cKvJUio9Zq43lbnDzR1tngWhOVG3qKFQkhhj8Kl76qxSux6cedNo3rIpfulTtcaRO
	EnKv/VBthqRWyAPEFl85OvXtyJMEAz3tIsoALby/w4Sx1H7+FgE2FK+9WwKRLxHr2Q7+
	PUixW1INq4Kq3Kh3e6hyBC9JEw1jpVcJUpU97M7m5QA7+zMD+2br7/eTnqAuCby81Qe+
	+vHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gTA7FpSG5CjvNz/TY+VrZEmSlsRZoAX4+8Z4b1SAUhg=;
	b=R3wgRleLdJEAbbrTLfqQeCVIqs2TjQ3ZrnHCQ3pMX5fWFFOmFcBykVjAoK3CGLUDYP
	JO74cn2anJooa0ThNhk1zo8F8VLgjy2ELQ+OqtG4206Zf62DAJx03cfvovLTV79sRqY8
	NfUaQ6h5q6pJmDjceQSnn7FAZ7agQdC9/+elXUJp3VgXG/UJQSwK6vxkzKPrC1HjkwRd
	QW/5nVrb5r+re0O1oqQfJ78wpzi+nUzKBHRMbnWSA5Ds2l8UFtM6LNwfwoyyCzJL9NjK
	u2ayvTL2k85bYY++dpdCByiJ4B89lfKetU8loNiC0W4a+kI6uSTIskXL7lbAkbKaDWl/
	1ODw==
X-Gm-Message-State: AOUpUlG1IjxDJSEv5l2o+buJJ0SQPbShG2y/wjTJJgQtYpZLOvjrM10f
	P5zPLop1CYchOQe7x6PLTTrCZJg208t0dnSnlPjk/cwe
X-Google-Smtp-Source: AA+uWPz4Kv5icA/uag8jh60Nm7B8W5JwBKVC0CMerKU82gbV2rOWoVYd9EQIq130nYCCHohlIP7J+deYCgODQ7TQTFc=
X-Received: by 2002:a24:fac7:: with SMTP id
	v190-v6mr1604144ith.126.1533643152567; 
	Tue, 07 Aug 2018 04:59:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:e510:0:0:0:0:0 with HTTP;
	Tue, 7 Aug 2018 04:59:12 -0700 (PDT)
In-Reply-To: <MWHPR02MB2768F151648844374BA8BF3BAF200@MWHPR02MB2768.namprd02.prod.outlook.com>
References: <20180802085504.15851-1-nathan@nathanrossi.com>
	<MWHPR02MB2768F151648844374BA8BF3BAF200@MWHPR02MB2768.namprd02.prod.outlook.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 7 Aug 2018 21:59:12 +1000
Message-ID: <CA+aJhH0HwtVvAY3cLPfCapykLaqJi-Whi9=WdGMwgMgCVnq6Pg@mail.gmail.com>
To: Jaewon Lee <JAEWON@xilinx.com>
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
X-List-Received-Date: Tue, 07 Aug 2018 11:59:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 7 August 2018 at 07:16, Jaewon Lee <JAEWON@xilinx.com> wrote:
> Hi Nathan,
>
> What do you think about adding support for dts include files as well (.dt=
si)?

Hi Jaewon,

Device tree include files already work with the implementation in this
patch. The default include path is the same as the path of the dts
files, so if you use "/include/ "<dtsi>.dtsi";" (dtc) or "#include
<dtsi.dtsi>" (preprocessor) it will search within the DT_FILES_PATH
(which is WORKDIR by default) and then the KERNEL_INCLUDE paths.
Though if the dtsi is in another path you can add it to DT_INCLUDE,
and it will be searched.

Does this cover the support you are after or is there another
configuration you would like it to support?

Thanks,
Nathan

>
> Thanks,
> Jaewon
>
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf Of Nathan Rossi
> Sent: Thursday, August 2, 2018 1:55 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] devicetree.bbclass: User/BSP device tree sourc=
e compilation class
>
> This bbclass implements the device tree compilation for user provided dev=
ice trees. In order to use this class, it should be inherited in a BSP reci=
pe which provides the sources. The default setup enables inclusion of kerne=
l device tree sources (though can be disabled by the recipe by overriding D=
T_INCLUDE or KERNEL_INCLUDE).
>
> This provides an additional mechanism for BSPs to provide device trees an=
d device tree overlays for their target machines. Whilst still enabling acc=
ess to the kernel device trees for base SoC includes and headers.
>
> This approach to providing device trees has benefits for certain use case=
s over patching the device trees into the kernel source.
>
> * device trees are separated from kernel source, allows for selection of =
kernel and or kernel versions without needing to explicitly patch the kerne=
l (or appending to the kernel recipes).
>
> * providing device trees from separate sources, from the layer, generated=
 by the recipe or other recipes.
>
> This class also implements some additional features that are not availabl=
e in the kernel-devicetree flow. This includes population of device tree bl=
obs into the sysroot which allows for other recipes to consume built dtbs (=
e.g. U-Boot with EXT_DTB compilation), device tree overlay compilation and =
customizing DTC compilation args (boot cpu/padding/etc.).
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> Acked-by: Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
> ---
> In addition to this patch I have written some documentation for the Yocto=
 BSP guide that covers details about both methods.
>
> The meta-xilinx layer has a recipe (device-tree.bb) that behaves exactly =
like this class for some time. It has been very useful for out-of-kernel de=
vice tree compilation as well as for a mechanism so that users of Xilinx So=
Cs can provide their customizations (FPGA devices) and board specific confi=
guration. This compilation flow also makes sense for other BSPs, which is t=
he reason for creating this bbclass for common shared use by other BSPs.
>
> Examples of this classes usage can be seen for meta-xilinx:
> https://github.com/nathanrossi/meta-xilinx/blob/nrossi/devicetree-classif=
y/meta-xilinx-bsp/recipes-bsp/device-tree/device-tree.bb
> ---
>  meta/classes/devicetree.bbclass | 140 ++++++++++++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 meta/classes/devicetree.bbclass
>
> diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bb=
class new file mode 100644 index 0000000000..dbc83f2a1d
> --- /dev/null
> +++ b/meta/classes/devicetree.bbclass
> @@ -0,0 +1,140 @@
> +# This bbclass implements device tree compliation for user provided
> +device tree # sources. The compilation of the device tree sources is
> +the same as the kernel # device tree compilation process, this includes
> +being able to include sources # from the kernel such as soc dtsi files
> +or header files such as gpio.h. In # addition to device trees this
> +bbclass also handles compilation of device tree # overlays.
> +#
> +# The output of this class behaves similar to how
> +kernel-devicetree.bbclass # operates in that the output files are instal=
led into /boot/devicetree.
> +# However this class on purpose separates the deployed device trees
> +into the # 'devicetree' subdirectory. This prevents clashes with the
> +kernel-devicetree # output. Additionally the device trees are populated
> +into the sysroot for # access via the sysroot from within other recipes.
> +
> +SECTION ?=3D "bsp"
> +
> +# The default inclusion of kernel device tree includes and headers
> +means that # device trees built with them are at least GPLv2 (and in
> +some cases dual # licensed). Default to GPLv2 if the recipe does not spe=
cify a license.
> +LICENSE ?=3D "GPLv2"
> +LIC_FILES_CHKSUM ?=3D "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f80=
980d171dd6425610833a22dbe6"
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +DEPENDS +=3D "dtc-native"
> +
> +inherit deploy kernel-arch
> +
> +COMPATIBLE_MACHINE ?=3D "^$"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +SYSROOT_DIRS +=3D "/boot/devicetree"
> +FILES_${PN} =3D "/boot/devicetree/*.dtb /boot/devicetree/*.dtbo"
> +
> +S =3D "${WORKDIR}"
> +B =3D "${WORKDIR}/build"
> +
> +# Default kernel includes, these represent what are normally used for
> +in-kernel # sources.
> +KERNEL_INCLUDE ??=3D " \
> +        ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts \
> +        ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/* \
> +        ${STAGING_KERNEL_DIR}/scripts/dtc/include-prefixes \
> +        "
> +
> +DT_INCLUDE[doc] =3D "Search paths to be made available to both the devic=
e tree compiler and preprocessor for inclusion."
> +DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
> +DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to sel=
ect dts files that are not in source (e.g. generated)."
> +DT_FILES_PATH ?=3D "${S}"
> +
> +DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, used =
as extra space typically for additional properties during boot."
> +DT_PADDING_SIZE ??=3D "0x3000"
> +DT_RESERVED_MAP[doc] =3D "Number of reserved map entires."
> +DT_RESERVED_MAP ??=3D "8"
> +DT_BOOT_CPU[doc] =3D "The boot cpu, defaults to 0"
> +DT_BOOT_CPU ??=3D "0"
> +
> +DTC_FLAGS ?=3D "-R ${DT_RESERVED_MAP} -p ${DT_PADDING_SIZE} -b ${DT_BOOT=
_CPU}"
> +DTC_PPFLAGS ?=3D "-nostdinc -undef -D__DTS__ -x assembler-with-cpp"
> +DTC_OFLAGS ?=3D "-@ -H epapr"
> +
> +python () {
> +    if d.getVar("KERNEL_INCLUDE"):
> +        # auto add dependency on kernel tree, but only if kernel include=
 paths
> +        # are specified.
> +        d.appendVarFlag("do_compile", "depends", "
> +virtual/kernel:do_configure") }
> +
> +def expand_includes(varname, d):
> +    import glob
> +    includes =3D set()
> +    # expand all includes with glob
> +    for i in (d.getVar(varname) or "").split():
> +        for g in glob.glob(i):
> +            if os.path.isdir(g): # only add directories to include path
> +                includes.add(g)
> +    return includes
> +
> +def devicetree_source_is_overlay(path):
> +    # determine if a dts file is an overlay by checking if it uses "/plu=
gin/;"
> +    with open(path, "r") as f:
> +        for i in f:
> +            if i.startswith("/plugin/;"):
> +                return True
> +    return False
> +
> +def devicetree_compile(dtspath, includes, d):
> +    import subprocess
> +    dts =3D os.path.basename(dtspath)
> +    dtname =3D os.path.splitext(dts)[0]
> +    bb.note("Processing {0} [{1}]".format(dtname, dts))
> +
> +    # preprocess
> +    ppargs =3D d.getVar("BUILD_CPP").split()
> +    ppargs +=3D (d.getVar("DTC_PPFLAGS") or "").split()
> +    for i in includes:
> +        ppargs.append("-I{0}".format(i))
> +    ppargs +=3D ["-o", "{0}.pp".format(dts), dtspath]
> +    bb.note("Running {0}".format(" ".join(ppargs)))
> +    subprocess.run(ppargs, check =3D True)
> +
> +    # determine if the file is an overlay or not (using the preprocessed=
 file)
> +    isoverlay =3D devicetree_source_is_overlay("{0}.pp".format(dts))
> +
> +    # compile
> +    dtcargs =3D ["dtc"] + (d.getVar("DTC_FLAGS") or "").split()
> +    if isoverlay:
> +        dtcargs +=3D (d.getVar("DTC_OFLAGS") or "").split()
> +    for i in includes:
> +        dtcargs +=3D ["-i", i]
> +    dtcargs +=3D ["-o", "{0}.{1}".format(dtname, "dtbo" if isoverlay els=
e "dtb")]
> +    dtcargs +=3D ["-I", "dts", "-O", "dtb", "{0}.pp".format(dts)]
> +    bb.note("Running {0}".format(" ".join(dtcargs)))
> +    subprocess.run(dtcargs, check =3D True)
> +
> +python devicetree_do_compile() {
> +    includes =3D expand_includes("DT_INCLUDE", d)
> +    listpath =3D d.getVar("DT_FILES_PATH")
> +    for dts in os.listdir(listpath):
> +        if not dts.endswith(".dts"):
> +            continue # skip non-.dts files
> +        dtspath =3D os.path.join(listpath, dts)
> +        devicetree_compile(dtspath, includes, d) }
> +
> +devicetree_do_install() {
> +    for DTB_FILE in `ls *.dtb *.dtbo`; do
> +        install -Dm 0644 ${B}/${DTB_FILE} ${D}/boot/devicetree/${DTB_FIL=
E}
> +    done
> +}
> +
> +devicetree_do_deploy() {
> +    for DTB_FILE in `ls *.dtb *.dtbo`; do
> +        install -Dm 0644 ${B}/${DTB_FILE} ${DEPLOYDIR}/devicetree/${DTB_=
FILE}
> +    done
> +}
> +addtask deploy before do_build after do_install
> +
> +EXPORT_FUNCTIONS do_compile do_install do_deploy
> +
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

