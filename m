Return-Path: <aehs29@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9EED57F7E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 07:19:35 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id r19so13602172ljg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 23:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uO10YJjpCRmPwxti42EMNzDBJDDEc9O7o6sW1JMc+tk=;
	b=K87fNTvtvf1zaHa0S7oqC+QDK6iP3QOx/67mY+bwAlvuU9+4+irke+hV8U9gvoBWg2
	+BF3HxJkf8hkz0rqRyYw4Z12/AQgt3iASBxXPlm8mzqsm3Z70bXbh/Uo2lAkon5WhzzZ
	kjBgGX5+Ejf30EHYcB4GjCJT6gmIjxPSYhuBoUUNJYWysZJXDLDQiuko+AjT3smVzmMB
	fQ6Mnx1Co9aJVB+gUevfUc4Rdu5EpKhDYXOEwT13xkwLOWM3Es7+A6eTjN6KYsy+va4H
	tzHTYHsP3v3Z0+YpwNNRSWiRn6zTfKOC/yuBopw0cXvULZsiddxJbnGD9Q6EqkslBwBm
	sVJw==
X-Gm-Message-State: APjAAAUloSY5Q5s5dTXl5lMaj3yIHUVneNlOwlzk/5CtRHo0BilunNqO
	N5g1COqT6dcn/h50reMtVGjW80fdOQU=
X-Google-Smtp-Source: APXvYqwqvo5s+ERK0EGQuSz11QEFC9EOBFgp8kpEMTCSJlT2OEUK1uUnGVL2zbK8tzFvoLDulbdLuA==
X-Received: by 2002:a2e:b4af:: with SMTP id q15mr1200750ljm.43.1580195976085; 
	Mon, 27 Jan 2020 23:19:36 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
	[209.85.167.53]) by smtp.gmail.com with ESMTPSA id
	m13sm9320255lfo.40.2020.01.27.23.19.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jan 2020 23:19:35 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id z26so8255612lfg.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 23:19:35 -0800 (PST)
X-Received: by 2002:ac2:592e:: with SMTP id v14mr1584655lfi.73.1580195975080; 
	Mon, 27 Jan 2020 23:19:35 -0800 (PST)
MIME-Version: 1.0
References: <1580119213-10641-1-git-send-email-alejandro@enedino.org>
	<CAMKF1soRSNJLDPfBMuVyYiPz14r5c3aAGb6NtHUtFa+QcP2_rQ@mail.gmail.com>
In-Reply-To: <CAMKF1soRSNJLDPfBMuVyYiPz14r5c3aAGb6NtHUtFa+QcP2_rQ@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Mon, 27 Jan 2020 23:19:23 -0800
X-Gmail-Original-Message-ID: <CAHMutra8_8ZLc7kvW-EhsZ1Yyn2sRd1owF2h7oTDuXMD5nnoiA@mail.gmail.com>
Message-ID: <CAHMutra8_8ZLc7kvW-EhsZ1Yyn2sRd1owF2h7oTDuXMD5nnoiA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 28 Jan 2020 07:19:37 -0000
Content-Type: multipart/alternative; boundary="000000000000c52f59059d2e0b33"

--000000000000c52f59059d2e0b33
Content-Type: text/plain; charset="UTF-8"

Hey Khem,

On Mon, Jan 27, 2020, 12:51 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jan 27, 2020 at 2:01 AM Alejandro Enedino Hernandez Samaniego
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
> I think MIT or Apache-2.0 would be much nicer.
>

I agree but this wasn't by choice, the original code written for the
versatile architecture was licensed on CC-BY-SA, which AFAIC wouldn't be
compatible with those, this is the best I could come up with since this
way, something that uses this could use GPLv3 if there's a better way let
me know


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
>
> Perhaps check for TARGET_OS instead of LIBC
>

We had decided this to avoid bitbake world errors, if you think TARGET_OS
is better I'm okay with that.



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
>
> this setting should be abstracted into something like  baremetal.bbclass
>
>
> > +
> > +EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH}"
> > +
> > +do_configure(){
> > +    # Avoid building on the source directory
> > +    cp ${S}/* ${B}
> > +}
>
> copying sources to B why is that needed ?
>
>
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
>
> hmmm bad example to start of.
>
> > +# Borrowed from meta-freertos
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
>
>
> these all should be abstracted
>

Ok, of all the above, my intention is to create a class that abstracts
this, it actually already is a class on meta-freertos, even the code below,
but I have WIP on testimage, oe-selftest, FreeRTOS and for the next couple
of days I'll have a lot on my plate and I'm trying to split the work in
chunks, so it doesn't break other WIP and at the same time I get things
done, I agree its not ideal, but its less confusing for me to have a single
class for now (the meta-freertos one), along with these recipes already
being built for the test cases and once I can upstream the work, all this
will be abstracted in a class in oe-core, I can file a bug in bugzilla and
take it to keep track of this if that helps.

v2 fixes:
Copying sources
Paralell make


> > +# QEMU generic FreeRTOS parameters
> > +QB_DEFAULT_KERNEL = "${IMAGE_LINK_NAME}.bin"
> > +QB_MEM = "-m 256"
> > +QB_OPT_APPEND = "-nographic"
> > +QB_DEFAULT_FSTYPE = "bin"
> > +QB_DTB = ""
> > +
>
> this setting perhaps should be in machine conf ?
>

Those are already on the machine.conf, these are overriding the Linux
configurations so QEMU loads the baremetal application correctly , e.g.
FSTYPE=bin


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
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c52f59059d2e0b33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div>Hey=C2=A0Khem,<br><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 27, 2020, 1=
2:51 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Mon, Jan 27, 2020 at 2:01 AM Alejandro Enedino Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" rel=3D"noreferrer" target=3D"_=
blank">alejandro@enedino.org</a>&gt; wrote:<br>
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
ilto:alejandro@enedino.org" rel=3D"noreferrer" target=3D"_blank">alejandro@=
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
I think MIT or Apache-2.0 would be much nicer.<br></blockquote></div></div>=
<br>I agree but this wasn&#39;t by choice, the original code written for th=
e versatile architecture was licensed on CC-BY-SA, which AFAIC wouldn&#39;t=
 be compatible with those, this is the best I could come up with since this=
 way, something that uses this could use GPLv3 if there&#39;s a better way =
let me know<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
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
<br>
Perhaps check for TARGET_OS instead of LIBC<br></blockquote></div></div><di=
v dir=3D"auto"><br></div>We had decided this to avoid bitbake world errors,=
 if you think TARGET_OS is better I&#39;m okay with that.<div dir=3D"auto">=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br>
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
<br>
this setting should be abstracted into something like=C2=A0 baremetal.bbcla=
ss<br>
<br>
<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE_append =3D &quot; QEMUARCH=3D${BAREMETAL_QEMUARCH}&quot;=
<br>
&gt; +<br>
&gt; +do_configure(){<br>
&gt; +=C2=A0 =C2=A0 # Avoid building on the source directory<br>
&gt; +=C2=A0 =C2=A0 cp ${S}/* ${B}<br>
&gt; +}<br>
<br>
copying sources to B why is that needed ?<br>
<br>
<br>
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
<br>
hmmm bad example to start of.<br>
<br>
&gt; +# Borrowed from meta-freertos<br>
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
<br>
<br>
these all should be abstracted<br></blockquote></div></div><div dir=3D"auto=
"><br></div>Ok, of all the above, my intention is to create a class that ab=
stracts this, it actually already is a class on meta-freertos, even the cod=
e below, but I have WIP on testimage, oe-selftest, FreeRTOS and for the nex=
t couple of days I&#39;ll have a lot on my plate and I&#39;m trying to spli=
t the work in chunks, so it doesn&#39;t break other WIP and at the same tim=
e I get things done, I agree its not ideal, but its less confusing for me t=
o have a single class for now (the meta-freertos one), along with these rec=
ipes already being built for the test cases and once I can upstream the wor=
k, all this will be abstracted in a class in oe-core, I can file a bug in b=
ugzilla and take it to keep track of this if that helps.<div dir=3D"auto"><=
br></div>v2 fixes:<br>Copying sources<br>Paralell make<div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
&gt; +# QEMU generic FreeRTOS parameters<br>
&gt; +QB_DEFAULT_KERNEL =3D &quot;${IMAGE_LINK_NAME}.bin&quot;<br>
&gt; +QB_MEM =3D &quot;-m 256&quot;<br>
&gt; +QB_OPT_APPEND =3D &quot;-nographic&quot;<br>
&gt; +QB_DEFAULT_FSTYPE =3D &quot;bin&quot;<br>
&gt; +QB_DTB =3D &quot;&quot;<br>
&gt; +<br><br>
this setting perhaps should be in machine conf ?<br></blockquote></div></di=
v><div dir=3D"auto"><br></div>Those are already on the machine.conf, these =
are overriding the Linux configurations so QEMU loads the baremetal applica=
tion correctly , e.g. FSTYPE=3Dbin<div dir=3D"auto"><br></div><div dir=3D"a=
uto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
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
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>
</div>

--000000000000c52f59059d2e0b33--
