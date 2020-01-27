Return-Path: <aehs29@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1A5F07FD40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 15:42:09 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id j26so11139455ljc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 07:42:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tPlaFs5Z9mpJ6+YLrmeyAZnzDmx9MWcqZyuAZoD9XPM=;
	b=g9JalUdzxHYxCPLacZpL1oO9v297LfoGaBKvElX7ZKa0J3wZmXWzHi+NBTofcE8o4O
	Jd54Pllp1e+q27IWP1xImXHfa5i2mppEboStsBLJsH9ZFgrClWC9eL5/PUdbelayau25
	d34oGZyGlqn1hX4LqsNkNx4w5+j9/5zaWlJx1FhW5bj2LP4me4pvoK7RgEZ8QyEe2BuI
	LNGSaGav+wmuxgeAGLW8dEWKcJVeJ3v9q52x9fM5I3v8J2SSCeUv2MawfmU+R30dyuM0
	1h2955daA1UHXonwIoPBnLU53N8tQfQ0XZATL7WzZMXJImhOeNFNJ+Kb/Hibv9njbC3N
	WElQ==
X-Gm-Message-State: APjAAAXr6mynm8Yx7CfS6PAWhAeFAlIJVZeLXOKP1H2MFeMYfV8qjodx
	uhXv/DvN1SJat/T9LxmV0w7p0lJt
X-Google-Smtp-Source: APXvYqxHcGTs5zUgDYqdPlXMZJ+MtwiyHSbccPfWvJNdYmCuuPmG3YtzEvIJV6cGWLpfbxqdn3ZFVA==
X-Received: by 2002:a2e:9c0b:: with SMTP id s11mr10255354lji.11.1580139729247; 
	Mon, 27 Jan 2020 07:42:09 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
	[209.85.167.52])
	by smtp.gmail.com with ESMTPSA id j7sm2100732lfh.25.2020.01.27.07.42.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jan 2020 07:42:08 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id z18so6524374lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 07:42:08 -0800 (PST)
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr8415007lfp.133.1580139728316; 
	Mon, 27 Jan 2020 07:42:08 -0800 (PST)
MIME-Version: 1.0
References: <1580119213-10641-1-git-send-email-alejandro@enedino.org>
	<CAM9ZRVvWRcvV3MMZCwr3-Au2KKU2xJcMi=jkLDZtHKTB7822Nw@mail.gmail.com>
In-Reply-To: <CAM9ZRVvWRcvV3MMZCwr3-Au2KKU2xJcMi=jkLDZtHKTB7822Nw@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Mon, 27 Jan 2020 07:41:56 -0800
X-Gmail-Original-Message-ID: <CAHMutrbgM7To4zg=3R_BaU4PjyuW7hWcgNW0O2ZjM6TOuBNE7Q@mail.gmail.com>
Message-ID: <CAHMutrbgM7To4zg=3R_BaU4PjyuW7hWcgNW0O2ZjM6TOuBNE7Q@mail.gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] baremetal-helloworld: Create recipe for baremetal examples on QEMU
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
X-List-Received-Date: Mon, 27 Jan 2020 15:42:09 -0000
Content-Type: multipart/alternative; boundary="00000000000033afba059d20f3c5"

--00000000000033afba059d20f3c5
Content-Type: text/plain; charset="UTF-8"

Hey Paul,



On Mon, Jan 27, 2020, 2:09 AM Paul Barker <pbarker@konsulko.com> wrote:

> On Mon, 27 Jan 2020 at 10:00, Alejandro Enedino Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > Create HelloWorld examples that run on several of the QEMU architectures
> > supported by the build system.
> >
> > This recipe can be used by anyone to understand how baremetal
> applications
> > can be built using OpenEmbedded and how the wiring to set them up could
> be.
> >
> > This should also facilitate creating/extending the OE testing
> infrastructure
> > to allow baremetal applications or RTOSs to be tested in the same way
> that
> > Linux currently is.
> >
> > This can easily be extended to work on other MACHINES in the future.
> >
> > To run this example:
> >
> > # Source the oe environment as usual
> > $ source oe-init-buildenv
> >
> > # Set TCLIBC to either newlib or baremetal
> > $ echo "TCLIBC = \"newlib\"" >> ./conf/local.conf
> >
> > # Use one of the supported architectures (qemuarm64, qemuarm or
> qemuarmv5)
> > $ echo "MACHINE = \"qemuarm64\"" >> ./conf/local.conf
> >
> > # Build
> > $ bitbake baremetal-helloworld
> >
> > # Launch QEMU
> > $ runqemu
> >
> > runqemu - INFO - Running bitbake -e ...
> > runqemu - INFO - Continuing with the following parameters:
> > KERNEL: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
> > MACHINE: [qemuarm64]
> > FSTYPE: [bin]
> > ROOTFS: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
> > CONFFILE:
> [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.qemuboot.conf]
> >
> > Hello OpenEmbedded!
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  .../baremetal-examples/baremetal-helloworld_git.bb | 114
> +++++++++++++++++++++
> >  1 file changed, 114 insertions(+)
> >  create mode 100644 meta/recipes-extended/baremetal-examples/
> baremetal-helloworld_git.bb
> >
> > diff --git a/meta/recipes-extended/baremetal-examples/
> baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-examples/
> baremetal-helloworld_git.bb
> > new file mode 100644
> > index 0000000..aab48b1
> > --- /dev/null
> > +++ b/meta/recipes-extended/baremetal-examples/
> baremetal-helloworld_git.bb
> > @@ -0,0 +1,114 @@
> > +SUMMARY = "Baremetal examples to work with the several QEMU
> architectures supported on OpenEmbedded"
> > +HOMEPAGE = "https://github.com/aehs29/baremetal-helloqemu"
> > +LICENSE = "CC-BY-SA-4.0"
>
> I've raised https://github.com/aehs29/baremetal-helloqemu/issues/1 as
> CC licenses aren't recommended for software.
>
>
>
I do agree, I originally had it as MIT, although I did base this on the
original work of someone who made it work for the versatile architecture
and they licensed that with CC-BY-SA and as I was reading I have to use the
same license as them.

I thought about it and for the Hello OpenEmbedded examples it would be ok
since they should serve mostly as basis for the wiring that users can use
to build, run and test their baremetal apps on OE, so the license wouldn't
affect them, but I'm open to suggestions here.


> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=4084714af41157e38872e798eb3fe1b1"
> > +
> > +SRCREV = "fe81742f1159725408dd7305e40e7bd4dfd1e264"
> > +
> > +SRC_URI = "git://
> github.com/aehs29/baremetal-helloqemu.git;protocol=https "
> > +
> > +S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> > +
> > +# These examples are not meant to be built when using either musl or
> glibc
> > +COMPATIBLE_HOST_libc-musl_class-target = "null"
> > +COMPATIBLE_HOST_libc-glibc_class-target = "null"
> > +
> > +# This will be translated automatically to the architecture and
> > +# machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
> > +# but the examples can also be run on other architectures/machines
> > +# such as vexpress-a15 by overriding the setting on the machine.conf
> > +COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64"
> > +
> > +BAREMETAL_QEMUARCH ?= ""
> > +BAREMETAL_QEMUARCH_qemuarmv5 = "versatile"
> > +BAREMETAL_QEMUARCH_qemuarm = "arm"
> > +BAREMETAL_QEMUARCH_qemuarm64 = "aarch64"
> > +
> > +
> > +EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH}"
> > +
> > +do_configure(){
> > +    # Avoid building on the source directory
> > +    cp ${S}/* ${B}
> > +}
> > +
> > +do_install(){
> > +    install -d ${D}/${datadir}
> > +    install -m 755 ${B}/hello_baremetal_${BAREMETAL_QEMUARCH}.bin
> ${D}/${datadir}/hello_baremetal_${MACHINE}.bin
> > +    install -m 755 ${B}/hello_baremetal_${BAREMETAL_QEMUARCH}.elf
> ${D}/${datadir}/hello_baremetal_${MACHINE}.elf
> > +}
> > +
> > +# Make sure there are no race conditions when
> > +# assembling compiling and linking steps
> > +PARALLEL_MAKE = ""
> > +
> > +# Borrowed from meta-freertos
>
> Can these borrowed sections go into a bbclass to make the example
> simpler? meta-freertos might then be able to use the bbclass from
> openembedded-core.
>

Yup, I am in the process pf upstreaming to core part of the FreeRTOS work,
this will go on a class eventually, but as part of the work I am writing
some oeqa tests and I wanted to have this merged for now, will move this to
a class later.

Cheers,

Alejandro


> > +inherit rootfs-postcommands
> > +inherit deploy
> > +do_deploy[dirs] = "${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
> > +do_rootfs[dirs] = "${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
> > +DEPLOYDIR = "${IMGDEPLOYDIR}"
> > +IMAGE_LINK_NAME ?= "baremetal-helloworld-image-${MACHINE}"
> > +IMAGE_NAME_SUFFIX ?= ""
> > +
> > +do_deploy(){
> > +    install ${D}/${datadir}/hello_baremetal_${MACHINE}.bin
> ${DEPLOYDIR}/${IMAGE_LINK_NAME}.bin
> > +    install ${D}/${datadir}/hello_baremetal_${MACHINE}.elf
> ${DEPLOYDIR}/${IMAGE_LINK_NAME}.elf
> > +}
> > +
> > +do_image(){
> > +    :
> > +}
> > +
> > +FILES_${PN} += " \
> > +    ${datadir}/hello_baremetal_${MACHINE}.bin \
> > +    ${datadir}/hello_baremetal_${MACHINE}.elf \
> > +"
> > +
> > +python do_rootfs(){
> > +    from oe.utils import execute_pre_post_process
> > +    from pathlib import Path
> > +
> > +    # Write empty manifest testdate file
> > +    deploy_dir = d.getVar('DEPLOYDIR')
> > +    link_name = d.getVar('IMAGE_LINK_NAME')
> > +    manifest_name = d.getVar('IMAGE_MANIFEST')
> > +
> > +    Path(manifest_name).touch()
> > +    if os.path.exists(manifest_name) and link_name:
> > +        manifest_link = deploy_dir + "/" + link_name + ".manifest"
> > +        if os.path.lexists(manifest_link):
> > +            os.remove(manifest_link)
> > +        os.symlink(os.path.basename(manifest_name), manifest_link)
> > +    execute_pre_post_process(d, d.getVar('ROOTFS_POSTPROCESS_COMMAND'))
> > +}
> > +
> > +# QEMU generic FreeRTOS parameters
> > +QB_DEFAULT_KERNEL = "${IMAGE_LINK_NAME}.bin"
> > +QB_MEM = "-m 256"
> > +QB_OPT_APPEND = "-nographic"
> > +QB_DEFAULT_FSTYPE = "bin"
> > +QB_DTB = ""
> > +
> > +# This next part is necessary to trick the build system into thinking
> > +# its building an image recipe so it generates the qemuboot.conf
> > +addtask do_deploy after do_write_qemuboot_conf before do_build
> > +addtask do_rootfs before do_deploy after do_install
> > +addtask do_image after do_rootfs before do_build
> > +inherit qemuboot
> > +
> > +# Based on image.bbclass to make sure we build qemu
> > +python(){
> > +    # do_addto_recipe_sysroot doesnt exist for all recipes, but we need
> it to have
> > +    # /usr/bin on recipe-sysroot (qemu) populated
> > +    def extraimage_getdepends(task):
> > +        deps = ""
> > +        for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
> > +        # Make sure we only add it for qemu
> > +            if 'qemu' in dep:
> > +                deps += " %s:%s" % (dep, task)
> > +        return deps
> > +    d.appendVarFlag('do_image', 'depends',
> extraimage_getdepends('do_addto_recipe_sysroot'))
> > +    d.appendVarFlag('do_image', 'depends',
> extraimage_getdepends('do_populate_sysroot'))
> > +}
> > --
> > 2.7.4
>
> Thanks,
> Paul
>

--00000000000033afba059d20f3c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hey Paul,<div dir=3D"auto"><br></div><br><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 27, 2=
020, 2:09 AM Paul Barker &lt;<a href=3D"mailto:pbarker@konsulko.com">pbarke=
r@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mo=
n, 27 Jan 2020 at 10:00, Alejandro Enedino Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noref=
errer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Create HelloWorld examples that run on several of the QEMU architectur=
es<br>
&gt; supported by the build system.<br>
&gt;<br>
&gt; This recipe can be used by anyone to understand how baremetal applicat=
ions<br>
&gt; can be built using OpenEmbedded and how the wiring to set them up coul=
d be.<br>
&gt;<br>
&gt; This should also facilitate creating/extending the OE testing infrastr=
ucture<br>
&gt; to allow baremetal applications or RTOSs to be tested in the same way =
that<br>
&gt; Linux currently is.<br>
&gt;<br>
&gt; This can easily be extended to work on other MACHINES in the future.<b=
r>
&gt;<br>
&gt; To run this example:<br>
&gt;<br>
&gt; # Source the oe environment as usual<br>
&gt; $ source oe-init-buildenv<br>
&gt;<br>
&gt; # Set TCLIBC to either newlib or baremetal<br>
&gt; $ echo &quot;TCLIBC =3D \&quot;newlib\&quot;&quot; &gt;&gt; ./conf/loc=
al.conf<br>
&gt;<br>
&gt; # Use one of the supported architectures (qemuarm64, qemuarm or qemuar=
mv5)<br>
&gt; $ echo &quot;MACHINE =3D \&quot;qemuarm64\&quot;&quot; &gt;&gt; ./conf=
/local.conf<br>
&gt;<br>
&gt; # Build<br>
&gt; $ bitbake baremetal-helloworld<br>
&gt;<br>
&gt; # Launch QEMU<br>
&gt; $ runqemu<br>
&gt;<br>
&gt; runqemu - INFO - Running bitbake -e ...<br>
&gt; runqemu - INFO - Continuing with the following parameters:<br>
&gt; KERNEL: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bi=
n]<br>
&gt; MACHINE: [qemuarm64]<br>
&gt; FSTYPE: [bin]<br>
&gt; ROOTFS: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bi=
n]<br>
&gt; CONFFILE: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.=
qemuboot.conf]<br>
&gt;<br>
&gt; Hello OpenEmbedded!<br>
&gt;<br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@=
enedino.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../baremetal-examples/<a href=3D"http://baremetal-helloworld_gi=
t.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">baremetal-helloworld_=
git.bb</a> | 114 +++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 114 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/baremetal-examples/<a h=
ref=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">baremetal-helloworld_git.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/baremetal-examples/<a href=3D"http:=
//baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">baremetal-helloworld_git.bb</a> b/meta/recipes-extended/baremetal-examp=
les/<a href=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">baremetal-helloworld_git.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..aab48b1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/baremetal-examples/<a href=3D"http://barem=
etal-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">bar=
emetal-helloworld_git.bb</a><br>
&gt; @@ -0,0 +1,114 @@<br>
&gt; +SUMMARY =3D &quot;Baremetal examples to work with the several QEMU ar=
chitectures supported on OpenEmbedded&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/aehs29/baremetal-hel=
loqemu" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/=
aehs29/baremetal-helloqemu</a>&quot;<br>
&gt; +LICENSE =3D &quot;CC-BY-SA-4.0&quot;<br>
<br>
I&#39;ve raised <a href=3D"https://github.com/aehs29/baremetal-helloqemu/is=
sues/1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/=
aehs29/baremetal-helloqemu/issues/1</a> as<br>
CC licenses aren&#39;t recommended for software.<br>
<br><br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><span style=3D"font-family:sans-serif">I do agree, I originally had it =
as MIT, although I did base this on the original work of someone who made i=
t work for the versatile architecture and they licensed that with CC-BY-SA =
and as I was reading I have to use the same license as them.</span><br></di=
v><div dir=3D"auto"><span style=3D"font-family:sans-serif"><br></span></div=
><div dir=3D"auto"><span style=3D"font-family:sans-serif">I thought about i=
t and for the Hello OpenEmbedded examples it would be ok since they should =
serve mostly as basis for the wiring that users can use to build, run and t=
est their baremetal apps on OE, so the license wouldn&#39;t affect them, bu=
t I&#39;m open to suggestions here.</span></div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4084714af41157e38872e=
798eb3fe1b1&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;fe81742f1159725408dd7305e40e7bd4dfd1e264&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/aehs29/baremetal=
-helloqemu.git;protocol=3Dhttps" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">github.com/aehs29/baremetal-helloqemu.git;protocol=3Dhttps</a> &quot;=
<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +B =3D &quot;${WORKDIR}/build&quot;<br>
&gt; +<br>
&gt; +# These examples are not meant to be built when using either musl or =
glibc<br>
&gt; +COMPATIBLE_HOST_libc-musl_class-target =3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_libc-glibc_class-target =3D &quot;null&quot;<br>
&gt; +<br>
&gt; +# This will be translated automatically to the architecture and<br>
&gt; +# machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57<br=
>
&gt; +# but the examples can also be run on other architectures/machines<br=
>
&gt; +# such as vexpress-a15 by overriding the setting on the machine.conf<=
br>
&gt; +COMPATIBLE_MACHINE =3D &quot;qemuarmv5|qemuarm|qemuarm64&quot;<br>
&gt; +<br>
&gt; +BAREMETAL_QEMUARCH ?=3D &quot;&quot;<br>
&gt; +BAREMETAL_QEMUARCH_qemuarmv5 =3D &quot;versatile&quot;<br>
&gt; +BAREMETAL_QEMUARCH_qemuarm =3D &quot;arm&quot;<br>
&gt; +BAREMETAL_QEMUARCH_qemuarm64 =3D &quot;aarch64&quot;<br>
&gt; +<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE_append =3D &quot; QEMUARCH=3D${BAREMETAL_QEMUARCH}&quot;=
<br>
&gt; +<br>
&gt; +do_configure(){<br>
&gt; +=C2=A0 =C2=A0 # Avoid building on the source directory<br>
&gt; +=C2=A0 =C2=A0 cp ${S}/* ${B}<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install(){<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}/${datadir}<br>
&gt; +=C2=A0 =C2=A0 install -m 755 ${B}/hello_baremetal_${BAREMETAL_QEMUARC=
H}.bin ${D}/${datadir}/hello_baremetal_${MACHINE}.bin<br>
&gt; +=C2=A0 =C2=A0 install -m 755 ${B}/hello_baremetal_${BAREMETAL_QEMUARC=
H}.elf ${D}/${datadir}/hello_baremetal_${MACHINE}.elf<br>
&gt; +}<br>
&gt; +<br>
&gt; +# Make sure there are no race conditions when<br>
&gt; +# assembling compiling and linking steps<br>
&gt; +PARALLEL_MAKE =3D &quot;&quot;<br>
&gt; +<br>
&gt; +# Borrowed from meta-freertos<br>
<br>
Can these borrowed sections go into a bbclass to make the example<br>
simpler? meta-freertos might then be able to use the bbclass from<br>
openembedded-core.<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Yup, I am in the process pf upstreaming to core part of t=
he FreeRTOS work, this will go on a class eventually, but as part of the wo=
rk I am writing some oeqa tests and I wanted to have this merged for now, w=
ill move this to a class later.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alejan=
dro</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<br>
&gt; +inherit rootfs-postcommands<br>
&gt; +inherit deploy<br>
&gt; +do_deploy[dirs] =3D &quot;${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}&quot;<br>
&gt; +do_rootfs[dirs] =3D &quot;${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}&quot;<br>
&gt; +DEPLOYDIR =3D &quot;${IMGDEPLOYDIR}&quot;<br>
&gt; +IMAGE_LINK_NAME ?=3D &quot;baremetal-helloworld-image-${MACHINE}&quot=
;<br>
&gt; +IMAGE_NAME_SUFFIX ?=3D &quot;&quot;<br>
&gt; +<br>
&gt; +do_deploy(){<br>
&gt; +=C2=A0 =C2=A0 install ${D}/${datadir}/hello_baremetal_${MACHINE}.bin =
${DEPLOYDIR}/${IMAGE_LINK_NAME}.bin<br>
&gt; +=C2=A0 =C2=A0 install ${D}/${datadir}/hello_baremetal_${MACHINE}.elf =
${DEPLOYDIR}/${IMAGE_LINK_NAME}.elf<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_image(){<br>
&gt; +=C2=A0 =C2=A0 :<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES_${PN} +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/hello_baremetal_${MACHINE}.bin \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/hello_baremetal_${MACHINE}.elf \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +python do_rootfs(){<br>
&gt; +=C2=A0 =C2=A0 from oe.utils import execute_pre_post_process<br>
&gt; +=C2=A0 =C2=A0 from pathlib import Path<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Write empty manifest testdate file<br>
&gt; +=C2=A0 =C2=A0 deploy_dir =3D d.getVar(&#39;DEPLOYDIR&#39;)<br>
&gt; +=C2=A0 =C2=A0 link_name =3D d.getVar(&#39;IMAGE_LINK_NAME&#39;)<br>
&gt; +=C2=A0 =C2=A0 manifest_name =3D d.getVar(&#39;IMAGE_MANIFEST&#39;)<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Path(manifest_name).touch()<br>
&gt; +=C2=A0 =C2=A0 if os.path.exists(manifest_name) and link_name:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest_link =3D deploy_dir + &quot;/&qu=
ot; + link_name + &quot;.manifest&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.lexists(manifest_link):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(manifest_link)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(os.path.basename(manifest_name=
), manifest_link)<br>
&gt; +=C2=A0 =C2=A0 execute_pre_post_process(d, d.getVar(&#39;ROOTFS_POSTPR=
OCESS_COMMAND&#39;))<br>
&gt; +}<br>
&gt; +<br>
&gt; +# QEMU generic FreeRTOS parameters<br>
&gt; +QB_DEFAULT_KERNEL =3D &quot;${IMAGE_LINK_NAME}.bin&quot;<br>
&gt; +QB_MEM =3D &quot;-m 256&quot;<br>
&gt; +QB_OPT_APPEND =3D &quot;-nographic&quot;<br>
&gt; +QB_DEFAULT_FSTYPE =3D &quot;bin&quot;<br>
&gt; +QB_DTB =3D &quot;&quot;<br>
&gt; +<br>
&gt; +# This next part is necessary to trick the build system into thinking=
<br>
&gt; +# its building an image recipe so it generates the qemuboot.conf<br>
&gt; +addtask do_deploy after do_write_qemuboot_conf before do_build<br>
&gt; +addtask do_rootfs before do_deploy after do_install<br>
&gt; +addtask do_image after do_rootfs before do_build<br>
&gt; +inherit qemuboot<br>
&gt; +<br>
&gt; +# Based on image.bbclass to make sure we build qemu<br>
&gt; +python(){<br>
&gt; +=C2=A0 =C2=A0 # do_addto_recipe_sysroot doesnt exist for all recipes,=
 but we need it to have<br>
&gt; +=C2=A0 =C2=A0 # /usr/bin on recipe-sysroot (qemu) populated<br>
&gt; +=C2=A0 =C2=A0 def extraimage_getdepends(task):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D &quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dep in (d.getVar(&#39;EXTRA_IMAGEDEPE=
NDS&#39;) or &quot;&quot;).split():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Make sure we only add it for qemu<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;qemu&#39; in dep:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps +=3D &qu=
ot; %s:%s&quot; % (dep, task)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return deps<br>
&gt; +=C2=A0 =C2=A0 d.appendVarFlag(&#39;do_image&#39;, &#39;depends&#39;, =
extraimage_getdepends(&#39;do_addto_recipe_sysroot&#39;))<br>
&gt; +=C2=A0 =C2=A0 d.appendVarFlag(&#39;do_image&#39;, &#39;depends&#39;, =
extraimage_getdepends(&#39;do_populate_sysroot&#39;))<br>
&gt; +}<br>
&gt; --<br>
&gt; 2.7.4<br>
<br>
Thanks,<br>
Paul<br>
</blockquote></div></div></div>

--00000000000033afba059d20f3c5--
