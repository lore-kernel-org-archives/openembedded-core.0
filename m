Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id B658B60557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 16:22:08 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id 6so324273itl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Sep 2017 09:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=whGZ9lTYpqG/F+Z2zr4qlddZbLS6OE/TpdYbYar76l0=;
	b=lM5QudZBVAdsiAsMhIud0Q5LX6Wzcdyq3UAC8M6MwNfYTOSESsuDhifzFIgNWuu6nw
	5KMMBcS7RNs4fvOfNjMt4zFbRnF/sokYqV4bVaY+yyQfRyIZvbryU3fg2MMvYF48MD4j
	puBYNXjbOvhp6W26bmgEnIm9NAk3VbZfHGE/wsM2/fJqsM6p+S156jHVmtYi2W8kv51H
	F16+jr3MgSBIFpgjzijWHGssThY+A/3sI4H4GH0zpAQj1OM8Noxp6D1tRGUTeoxLVtyh
	9EoaC06DubLixLoHhpsco1k+4Bs8B/oHdc8xklW19rjCFfiL2n0hkfHl17/5tr9Tmiew
	OAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=whGZ9lTYpqG/F+Z2zr4qlddZbLS6OE/TpdYbYar76l0=;
	b=AATfmIRm2PDbJFjwMdX6W4NLX6tyQGlPiA7VjOTR94yYO8JtU9gMfvRjKI0P24PXA0
	fD+C0zxqydllUOrMxpsQB5bxQDdCPK8aL4mVJfaUrGaKWpDj77gC9rl252P3QEahOyGd
	AdRqMA8Q2sz9hzXDx/4gHHvlQzrSA/xuOaxLCQApEJP7iJfwbU0ebcmvQ42jE9U/xxGn
	BLpQ43kXsOyAaFbizp4wQlTQEQv37QyHWanOLWU+eTjmBGtSAb6jVZSW4QOfPVzEgwCa
	4ZpbrLTQnjDi54kPu2hRUg++UqMU1BtUMcNHJcutrNQrh19dDQLvRMH55Jwgg1jlc2/j
	bzyg==
X-Gm-Message-State: AHPjjUgVPyt3Tlb5vifUyVRA9xBtT/e2zEPDpMEwQMZimV1O9y6Zsp1S
	bF0JXxUvHJwr612UNJDdLB1CMogTAios
X-Google-Smtp-Source: ADKCNb4cyp/DKASUBg21kRdQ+B+SOdWl8iWMPbSP2EwXGKfpMz03h51jqsDSmtvFLOju9zrc6Er9VEYzT95ZJIRIhcI=
X-Received: by 10.36.225.75 with SMTP id n72mr1750604ith.82.1504801329792;
	Thu, 07 Sep 2017 09:22:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Thu, 7 Sep 2017 09:21:49 -0700 (PDT)
In-Reply-To: <20170905015722.16993-1-otavio@ossystems.com.br>
References: <20170905015722.16993-1-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Sep 2017 17:21:49 +0100
Message-ID: <CAJTo0LY7LOj73k2eu10sw-6NySPDyencXYXTKDBLh_mrFwLaYg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Move Device Tree support to kernel.bbclass
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
X-List-Received-Date: Thu, 07 Sep 2017 16:22:09 -0000
Content-Type: multipart/alternative; boundary="94eb2c19dc1ab87f5f05589bdc2f"

--94eb2c19dc1ab87f5f05589bdc2f
Content-Type: text/plain; charset="UTF-8"

Would this be the cause of this failure on the autobuilder when doing
testimage?

runqemu - ERROR - DTB not found:
tmp/deploy/images/qemuarm/zImage-versatile-pb.dtb,
tmp/deploy/images/qemuarm/zImage-versatile-pb.dtb* or
tmp/deploy/images/qemuarm/*.dtb

From
https://autobuilder.yocto.io/builders/nightly-arm-lsb/builds/463/steps/Running%20Sanity%20Tests/logs/stdio

Ross

On 5 September 2017 at 02:57, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> The Device Tree is commonly used but it is still kept as a .inc file
> instead of a proper class. Instead now we move the Device Tree code to
> a kernel-devicetree class and automatically enable it when the
> KERNEL_DEVICETREE variable is set.
>
> To avoid breakage, we kept a linux-dtb.inc file which raises a warning
> telling the user about the change so in next release this can be
> removed.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/classes/kernel-devicetree.bbclass  | 63
> ++++++++++++++++++++++++++++++++
>  meta/classes/kernel.bbclass             |  4 +++
>  meta/recipes-kernel/linux/linux-dtb.inc | 64
> ++-------------------------------
>  3 files changed, 69 insertions(+), 62 deletions(-)
>  create mode 100644 meta/classes/kernel-devicetree.bbclass
>
> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-
> devicetree.bbclass
> new file mode 100644
> index 0000000000..6e6f39e640
> --- /dev/null
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -0,0 +1,63 @@
> +# Support for device tree generation
> +FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb
> /${KERNEL_IMAGEDEST}/*.dtbo"
> +
> +python __anonymous () {
> +    d.appendVar("PACKAGES", " kernel-devicetree")
> +}
> +
> +normalize_dtb () {
> +       DTB="$1"
> +       if echo ${DTB} | grep -q '/dts/'; then
> +               bbwarn "${DTB} contains the full path to the the dts file,
> but only the dtb name should be used."
> +               DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
> +       fi
> +       echo "${DTB}"
> +}
> +
> +get_real_dtb_path_in_kernel () {
> +       DTB="$1"
> +       DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
> +       if [ ! -e "${DTB_PATH}" ]; then
> +               DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
> +       fi
> +       echo "${DTB_PATH}"
> +}
> +
> +do_compile_append() {
> +       for DTB in ${KERNEL_DEVICETREE}; do
> +               DTB=`normalize_dtb "${DTB}"`
> +               oe_runmake ${DTB}
> +       done
> +}
> +
> +do_install_append() {
> +       for DTB in ${KERNEL_DEVICETREE}; do
> +               DTB=`normalize_dtb "${DTB}"`
> +               DTB_EXT=${DTB##*.}
> +               DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> +               DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
> +               install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/${
> DTB_BASE_NAME}.${DTB_EXT}
> +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +                       symlink_name=${type}"-"${
> KERNEL_IMAGE_SYMLINK_NAME}
> +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       ln -sf ${DTB_BASE_NAME}.${DTB_EXT}
> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
> +               done
> +       done
> +}
> +
> +do_deploy_append() {
> +       for DTB in ${KERNEL_DEVICETREE}; do
> +               DTB=`normalize_dtb "${DTB}"`
> +               DTB_EXT=${DTB##*.}
> +               DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
> +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +                       base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
> +                       symlink_name=${type}"-"${
> KERNEL_IMAGE_SYMLINK_NAME}
> +                       DTB_NAME=`echo ${base_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> +                       install -d ${DEPLOYDIR}
> +                       install -m 0644 ${DTB_PATH}
> ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
> +               done
> +       done
> +}
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 02a5e961cb..8c01e90709 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -662,3 +662,7 @@ do_deploy[prefuncs] += "package_get_auto_pr"
>  addtask deploy after do_populate_sysroot do_packagedata
>
>  EXPORT_FUNCTIONS do_deploy
> +
> +# If we are using Device Tree support, inherit the class to enable it
> +KERNEL_DEVICETREE_CLASS = "${@['kernel-devicetree', ''][d.getVar('KERNEL_DEVICETREE',
> False) == None]}"
> +inherit ${KERNEL_DEVICETREE_CLASS}
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> b/meta/recipes-kernel/linux/linux-dtb.inc
> index 6e6f39e640..f1912775ca 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -1,63 +1,3 @@
> -# Support for device tree generation
> -FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb
> /${KERNEL_IMAGEDEST}/*.dtbo"
> -
> -python __anonymous () {
> -    d.appendVar("PACKAGES", " kernel-devicetree")
> -}
> -
> -normalize_dtb () {
> -       DTB="$1"
> -       if echo ${DTB} | grep -q '/dts/'; then
> -               bbwarn "${DTB} contains the full path to the the dts file,
> but only the dtb name should be used."
> -               DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
> -       fi
> -       echo "${DTB}"
> -}
> -
> -get_real_dtb_path_in_kernel () {
> -       DTB="$1"
> -       DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
> -       if [ ! -e "${DTB_PATH}" ]; then
> -               DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
> -       fi
> -       echo "${DTB_PATH}"
> -}
> -
> -do_compile_append() {
> -       for DTB in ${KERNEL_DEVICETREE}; do
> -               DTB=`normalize_dtb "${DTB}"`
> -               oe_runmake ${DTB}
> -       done
> -}
> -
> -do_install_append() {
> -       for DTB in ${KERNEL_DEVICETREE}; do
> -               DTB=`normalize_dtb "${DTB}"`
> -               DTB_EXT=${DTB##*.}
> -               DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> -               DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
> -               install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/${
> DTB_BASE_NAME}.${DTB_EXT}
> -               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> -                       symlink_name=${type}"-"${
> KERNEL_IMAGE_SYMLINK_NAME}
> -                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -                       ln -sf ${DTB_BASE_NAME}.${DTB_EXT}
> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
> -               done
> -       done
> -}
> -
> -do_deploy_append() {
> -       for DTB in ${KERNEL_DEVICETREE}; do
> -               DTB=`normalize_dtb "${DTB}"`
> -               DTB_EXT=${DTB##*.}
> -               DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
> -               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> -                       base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
> -                       symlink_name=${type}"-"${
> KERNEL_IMAGE_SYMLINK_NAME}
> -                       DTB_NAME=`echo ${base_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -                       DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> -                       install -d ${DEPLOYDIR}
> -                       install -m 0644 ${DTB_PATH}
> ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
> -               done
> -       done
> +python() {
> +    bb.warn("You are using the linux-dtb.inc which is deprecated. You can
> safely remove it as the Device Tree support is automatically enabled when
> KERNEL_DEVICETREE is set.")
>  }
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c19dc1ab87f5f05589bdc2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span class=3D"gmail-stdout">Would this be the cause =
of this failure on the autobuilder when doing testimage?<br><br>runqemu - E=
RROR - DTB not found: tmp/deploy/images/qemuarm/zImage-versatile-pb.dtb, tm=
p/deploy/images/qemuarm/zImage-versatile-pb.dtb* or tmp/deploy/images/qemua=
rm/*.dtb</span></div><div><span class=3D"gmail-stdout"><br></span></div><di=
v><span class=3D"gmail-stdout">From <a href=3D"https://autobuilder.yocto.io=
/builders/nightly-arm-lsb/builds/463/steps/Running%20Sanity%20Tests/logs/st=
dio">https://autobuilder.yocto.io/builders/nightly-arm-lsb/builds/463/steps=
/Running%20Sanity%20Tests/logs/stdio</a><br></span></div><div><span class=
=3D"gmail-stdout"><br></span></div><div><span class=3D"gmail-stdout">Ross</=
span></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 September 2017 at 02:57, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The Device Tree =
is commonly used but it is still kept as a .inc file<br>
instead of a proper class. Instead now we move the Device Tree code to<br>
a kernel-devicetree class and automatically enable it when the<br>
KERNEL_DEVICETREE variable is set.<br>
<br>
To avoid breakage, we kept a linux-dtb.inc file which raises a warning<br>
telling the user about the change so in next release this can be<br>
removed.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
=C2=A0meta/classes/kernel-<wbr>devicetree.bbclass=C2=A0 | 63 ++++++++++++++=
++++++++++++++++<wbr>++<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 4 +++<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-dtb.inc | 64 ++-----------------=
-----------<wbr>---<br>
=C2=A03 files changed, 69 insertions(+), 62 deletions(-)<br>
=C2=A0create mode 100644 meta/classes/kernel-<wbr>devicetree.bbclass<br>
<br>
diff --git a/meta/classes/kernel-<wbr>devicetree.bbclass b/meta/classes/ker=
nel-<wbr>devicetree.bbclass<br>
new file mode 100644<br>
index 0000000000..6e6f39e640<br>
--- /dev/null<br>
+++ b/meta/classes/kernel-<wbr>devicetree.bbclass<br>
@@ -0,0 +1,63 @@<br>
+# Support for device tree generation<br>
+FILES_kernel-devicetree =3D &quot;/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMA=
GEDEST}/*.dtbo&quot;<br>
+<br>
+python __anonymous () {<br>
+=C2=A0 =C2=A0 d.appendVar(&quot;PACKAGES&quot;, &quot; kernel-devicetree&q=
uot;)<br>
+}<br>
+<br>
+normalize_dtb () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D&quot;$1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if echo ${DTB} | grep -q &#39;/dts/&#39;; then<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;${DTB}=
 contains the full path to the the dts file, but only the dtb name should b=
e used.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D`basename ${D=
TB} | sed &#39;s,\.dts$,.dtb,g&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${DTB}&quot;<br>
+}<br>
+<br>
+get_real_dtb_path_in_kernel () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D&quot;$1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=3D&quot;${B}/arch/${ARCH}/<wbr>boot/dt=
s/${DTB}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -e &quot;${DTB_PATH}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=3D&quot;${=
B}/arch/${ARCH}/<wbr>boot/${DTB}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${DTB_PATH}&quot;<br>
+}<br>
+<br>
+do_compile_append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEVICETREE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D`normalize_dt=
b &quot;${DTB}&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${DTB}<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+}<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEVICETREE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D`normalize_dt=
b &quot;${DTB}&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_EXT=3D${DTB##*.=
}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=3D`get_rea=
l_dtb_path_<wbr>in_kernel &quot;${DTB}&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_BASE_NAME=3D`ba=
sename ${DTB} .&quot;${DTB_EXT}&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D=
TB_PATH} ${D}/${KERNEL_IMAGEDEST}/${<wbr>DTB_BASE_NAME}.${DTB_EXT}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPE_FOR_MAKE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${<wbr>KERNEL_IMAGE_SYMLINK_NA=
ME}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed &quot;s/${MACHINE}=
/${DTB_BASE_NAME}<wbr>/g&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/<wbr>=
devicetree-${DTB_SYMLINK_NAME}<wbr>.${DTB_EXT}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+}<br>
+<br>
+do_deploy_append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEVICETREE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D`normalize_dt=
b &quot;${DTB}&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_EXT=3D${DTB##*.=
}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_BASE_NAME=3D`ba=
sename ${DTB} .&quot;${DTB_EXT}&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPE_FOR_MAKE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0base_name=3D${type}&quot;-&quot;${KERNEL_<wbr>IMAGE_BASE_NAME}<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${<wbr>KERNEL_IMAGE_SYMLINK_NA=
ME}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_NAME=3D`echo ${base_name} | sed &quot;s/${MACHINE}/${DTB_BASE=
_NAME}<wbr>/g&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed &quot;s/${MACHINE}=
/${DTB_BASE_NAME}<wbr>/g&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_PATH=3D`get_real_dtb_path_<wbr>in_kernel &quot;${DTB}&quot;`<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -d ${DEPLOYDIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${<wbr>DTB_E=
XT}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+}<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 02a5e961cb..8c01e90709 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -662,3 +662,7 @@ do_deploy[prefuncs] +=3D &quot;package_get_auto_pr&quot=
;<br>
=C2=A0addtask deploy after do_populate_sysroot do_packagedata<br>
<br>
=C2=A0EXPORT_FUNCTIONS do_deploy<br>
+<br>
+# If we are using Device Tree support, inherit the class to enable it<br>
+KERNEL_DEVICETREE_CLASS =3D &quot;${@[&#39;kernel-devicetree&#39;, &#39;&#=
39;][d.getVar(&#39;KERNEL_<wbr>DEVICETREE&#39;, False) =3D=3D None]}&quot;<=
br>
+inherit ${KERNEL_DEVICETREE_CLASS}<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-dtb.inc b/meta/recipes-ke=
rnel/linux/<wbr>linux-dtb.inc<br>
index 6e6f39e640..f1912775ca 100644<br>
--- a/meta/recipes-kernel/linux/<wbr>linux-dtb.inc<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-dtb.inc<br>
@@ -1,63 +1,3 @@<br>
-# Support for device tree generation<br>
-FILES_kernel-devicetree =3D &quot;/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMA=
GEDEST}/*.dtbo&quot;<br>
-<br>
-python __anonymous () {<br>
-=C2=A0 =C2=A0 d.appendVar(&quot;PACKAGES&quot;, &quot; kernel-devicetree&q=
uot;)<br>
-}<br>
-<br>
-normalize_dtb () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D&quot;$1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if echo ${DTB} | grep -q &#39;/dts/&#39;; then<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;${DTB}=
 contains the full path to the the dts file, but only the dtb name should b=
e used.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D`basename ${D=
TB} | sed &#39;s,\.dts$,.dtb,g&#39;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${DTB}&quot;<br>
-}<br>
-<br>
-get_real_dtb_path_in_kernel () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D&quot;$1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=3D&quot;${B}/arch/${ARCH}/<wbr>boot/dt=
s/${DTB}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -e &quot;${DTB_PATH}&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=3D&quot;${=
B}/arch/${ARCH}/<wbr>boot/${DTB}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${DTB_PATH}&quot;<br>
-}<br>
-<br>
-do_compile_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEVICETREE}; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D`normalize_dt=
b &quot;${DTB}&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${DTB}<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-}<br>
-<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEVICETREE}; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D`normalize_dt=
b &quot;${DTB}&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_EXT=3D${DTB##*.=
}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=3D`get_rea=
l_dtb_path_<wbr>in_kernel &quot;${DTB}&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_BASE_NAME=3D`ba=
sename ${DTB} .&quot;${DTB_EXT}&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D=
TB_PATH} ${D}/${KERNEL_IMAGEDEST}/${<wbr>DTB_BASE_NAME}.${DTB_EXT}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPE_FOR_MAKE}; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${<wbr>KERNEL_IMAGE_SYMLINK_NA=
ME}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed &quot;s/${MACHINE}=
/${DTB_BASE_NAME}<wbr>/g&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/<wbr>=
devicetree-${DTB_SYMLINK_NAME}<wbr>.${DTB_EXT}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-}<br>
-<br>
-do_deploy_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEVICETREE}; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB=3D`normalize_dt=
b &quot;${DTB}&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_EXT=3D${DTB##*.=
}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_BASE_NAME=3D`ba=
sename ${DTB} .&quot;${DTB_EXT}&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPE_FOR_MAKE}; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0base_name=3D${type}&quot;-&quot;${KERNEL_<wbr>IMAGE_BASE_NAME}<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${<wbr>KERNEL_IMAGE_SYMLINK_NA=
ME}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_NAME=3D`echo ${base_name} | sed &quot;s/${MACHINE}/${DTB_BASE=
_NAME}<wbr>/g&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed &quot;s/${MACHINE}=
/${DTB_BASE_NAME}<wbr>/g&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_PATH=3D`get_real_dtb_path_<wbr>in_kernel &quot;${DTB}&quot;`<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -d ${DEPLOYDIR}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${<wbr>DTB_E=
XT}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+python() {<br>
+=C2=A0 =C2=A0 bb.warn(&quot;You are using the linux-dtb.inc which is depre=
cated. You can safely remove it as the Device Tree support is automatically=
 enabled when KERNEL_DEVICETREE is set.&quot;)<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c19dc1ab87f5f05589bdc2f--
