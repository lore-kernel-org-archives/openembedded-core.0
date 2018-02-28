Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id DD25C78873
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 16:38:26 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id p78so3844930iod.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 08:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4Dhp/Bzy9HdXI1AfuTASpIaqDze3WEpSEQfhdltIEfY=;
	b=S0uMkJ3I03LItk3HFXYutV6yVbSQzcT3NFMKDmfTF469kaR0XpbGHN32EIms0mjpAG
	wXNlL+spOvk1VpNL2uQGJ4hMjlss7ROJo4iplc9XEIm5I+V1vau+4JYr2yT/PneQoOoY
	kWaXLjfzNhe8wOgdGSQItxLf+IwdsXj0Qn5YLtIc2qxQJHn/Q1eHRPDhGDA5PHoG1HBa
	J52n1vvQ1ssH78ntUh3ZKNtE30L6rhMpdmZycjDxWdqbj9wKax/ON7jTAo0+FdzN0xKj
	H4rNRHccQ5WEOUjJhqoRoZDbEBrsf0PMCZsyp4m5S6a7FZOuj083PFDDSDnAPdBPxMJy
	RjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4Dhp/Bzy9HdXI1AfuTASpIaqDze3WEpSEQfhdltIEfY=;
	b=cdvnEVTVBv/t9GNIPfwhw8PDaGMvMIK4zSM6zgyBRooCitW3v2WAm3Yn4sjjDHoe1z
	lTit30PGIJp+V2gPlP2FEkOB0G2r4XqhWq+1xaOtIWA9po4DZvlaQcD8gc2qdMUjgFmf
	e7Ry7Rmvk7W4XwS1Fw+x6TRe7CaSDPfR7qx+8xBWpEELmHxyL6zCBAJWz8+ANsuaHR8K
	EhjbMCamPHEreY7EvsFBEtemlWoH+h9yYWjs7+KeHMRjGStAyr54FNXV1XEn2A4SIDIv
	LsYO5pW7ntsZGzFiu6zUzw5yBXRXht3N3iQFr0AoNS2VjwuJX4hEtJJagPHNYZTKvVyF
	58PA==
X-Gm-Message-State: APf1xPAjlgidY+iuZdztn/tvKbioqRMwLhe6PTyxRkLYMts2s9s3crL/
	CQCPXv0FOk3D25gQDSNAnoiq6Ce1YVdyFszNgZbgyQ==
X-Google-Smtp-Source: AG47ELuzFpQE5j2oF3mYVY7S07y1iHL++yEtjlL/ALi6NOO9K/xlxf+OihZLVMPfxv0MqUG701Qa0pLqLukTLxRoUpo=
X-Received: by 10.107.161.200 with SMTP id k191mr19516896ioe.270.1519835907938;
	Wed, 28 Feb 2018 08:38:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 28 Feb 2018 08:38:07 -0800 (PST)
In-Reply-To: <edec3fd339889290220602c525683ab97d1c1fb4.1519783331.git.bruce.ashfield@windriver.com>
References: <cover.1519783331.git.bruce.ashfield@windriver.com>
	<edec3fd339889290220602c525683ab97d1c1fb4.1519783331.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Feb 2018 16:38:07 +0000
Message-ID: <CAJTo0Lb3+VSbk+iQcD5cqTHXm4fap-QZQv6eS1ZAVzZCVj=8pw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Wed, 28 Feb 2018 16:38:27 -0000
Content-Type: multipart/alternative; boundary="001a113e919868f3810566485f72"

--001a113e919868f3810566485f72
Content-Type: text/plain; charset="UTF-8"

Sorry, but this breaks on ARM:

ERROR: kernel-devsrc-1.0-r0 do_install: Function failed: do_install (log
file is located at
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822)
ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822
Log data follows:
| DEBUG: Executing shell function do_install
| cp: with --parents, the destination must be a directory
| Try 'cp --help' for more information.
| WARNING:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/run.do_install.25822:1
exit 1 from 'rm -rf $kerneldir/build/include'
| ERROR: Function failed: do_install (log file is located at
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822)

Ross

On 28 February 2018 at 02:06, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> The existing kernel-devsrc package starts with a full copy of the kernel
> source and then starts to strip out elements that are not required.
>
> This results in extra time (I/O) and extra space being taken up in the
> final package. The main purpose of the kernel-devsrc package has been to
> build modules against the running kernel, not to include a full copy of
> the source code for re-building the kernel. The end result was a
> 600M kernel-devsrc package.
>
> This restructuring of the package uses an approach similar to other
> distros, where the kernel-devsrc package is for building against the
> running kernel and uses a curated set of copied infrastructure, versus
> a mass copy of the entire kernel.
>
> The differences in this approach versus other is largely due to the
> architecture support and the split build/source directory of the
> kernel.
>
> The result is a kernel-devsrc package of about 10M, which is capable
> of running "make scripts" and compiling kernel modules against the
> running kernel.
>
> Along with the changes to the copying of the infrascture, we also
> have the following changes:
>
>  - a better/more explicit listing of dependencies for on-target
>    builds of "make scripts" or "make modules_prepare"
>
>  - The kernel source is installed into /lib/modules/<version>/build
>    and a symlink created from /usr/src/kernel to the new location.
>    This aligns with the standard location for module support
>    code
>
>  - There is also a symlink from /lib/modules/<version>/source -> build
>    to reserve a spot for a new package that is simply the kernel
>    source. That package is not part of this update.
>
> [YOCTO #12535]
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 178
> ++++++++++++++++++++++-------
>  1 file changed, 138 insertions(+), 40 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index c1b5b7786d7c..f55b115e0936 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -30,50 +30,148 @@ do_populate_sysroot[noexec] = "1"
>  S = "${STAGING_KERNEL_DIR}"
>  B = "${STAGING_KERNEL_BUILDDIR}"
>
> -KERNEL_VERSION = "${@get_kernelversion_headers('${S}')}"
> -
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> +KERNEL_BUILD_ROOT="/lib/modules/"
> +
>  do_install() {
> -        kerneldir=${D}${KERNEL_SRC_PATH}
> -        install -d $kerneldir
> -
> -        #
> -        # Copy the staging dir source (and module build support) into the
> devsrc structure.
> -        # We can keep this copy simple and take everything, since a we'll
> clean up any build
> -        # artifacts afterwards, and the extra i/o is not significant
> -        #
> -        cd ${B}
> -        find . -type d -name '.git*' -prune -o -path '.debug' -prune -o
> -type f -print0 | cpio --null -pdlu $kerneldir
> -        cd ${S}
> -       find . -type d -name '.git*' -prune -o -type d -name
> '.kernel-meta' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
> -
> -        # Explicitly set KBUILD_OUTPUT to ensure that the image directory
> is cleaned and not
> -        # The main build artifacts. We clean the directory to avoid QA
> errors on mismatched
> -        # architecture (since scripts and helpers are native format).
> -        KBUILD_OUTPUT="$kerneldir"
> -        oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> clean _mrproper_scripts
> -        # make clean generates an absolute path symlink called "source"
> -        # in $kerneldir points to $kerneldir, which doesn't make any
> -        # sense, so remove it.
> -        if [ -L $kerneldir/source ]; then
> -            bbnote "Removing $kerneldir/source symlink"
> -            rm -f $kerneldir/source
> -        fi
> -
> -        # As of Linux kernel version 3.0.1, the clean target removes
> -        # arch/powerpc/lib/crtsavres.o which is present in
> -        # KBUILD_LDFLAGS_MODULE, making it required to build external
> modules.
> -        if [ ${ARCH} = "powerpc" ]; then
> -                mkdir -p $kerneldir/arch/powerpc/lib/
> -                cp ${B}/arch/powerpc/lib/crtsavres.o
> $kerneldir/arch/powerpc/lib/crtsavres.o
> -        fi
> -
> -        chown -R root:root ${D}
> +    kerneldir=${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}
> +    install -d $kerneldir
> +
> +    # create the directory structure
> +    rm -f $kerneldir/build
> +    rm -f $kerneldir/source
> +    mkdir -p $kerneldir/build
> +
> +    # for compatibility with some older variants of this package, we
> +    # create  a /usr/src/kernel symlink to /lib/modules/<version>/source
> +    mkdir -p ${D}/usr/src
> +    (
> +       cd ${D}/usr/src
> +       ln -s ${KERNEL_BUILD_ROOT}${KERNEL_VERSION}/source kernel
> +    )
> +
> +    # for on target purposes, we unify build and source
> +    (
> +       cd $kerneldir
> +       ln -s build source
> +    )
> +
> +    # first copy everything
> +    (
> +       cd ${S}
> +       cp --parents $(find  -type f -name "Makefile*" -o -name
> "Kconfig*") $kerneldir/build
> +    )
> +
> +    # then drop all but the needed Makefiles/Kconfig files
> +    rm -rf $kerneldir/build/Documentation
> +    rm -rf $kerneldir/build/scripts
> +    rm -rf $kerneldir/build/include
> +
> +    # now copy in parts from the build that we'll need later
> +    (
> +       cd ${B}
> +
> +       cp Module.symvers $kerneldir/build
> +       cp System.map* $kerneldir/build
> +       if [ -s Module.markers ]; then
> +           cp Module.markers $kerneldir/build
> +       fi
> +
> +       cp .config $kerneldir/build
> +
> +       # TODO: this scripts copy will likely blow up QA, so for now, we
> +       #       require a more complex 'make scripts' to restore these,
> versus
> +       #       copying them here. Left as a reference to indicate that we
> +       #       know the scripts must be dealt with.
> +       # cp -a scripts $kerneldir/build
> +
> +       if [ -f tools/objtool/objtool ]; then
> +           cp -a tools/objtool/objtool $kerneldir/build/tools/objtool/
> +       fi
> +       if [ -d arch/${ARCH}/scripts ]; then
> +           cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
> +       fi
> +       if [ -f arch/${ARCH}/*lds ]; then
> +           cp -a arch/${ARCH}/*lds $kerneldir/build/arch/${ARCH}
> +       fi
> +
> +       rm -f $kerneldir/build/scripts/*.o
> +       rm -f $kerneldir/build/scripts/*/*.o
> +
> +       if [ "${ARCH}" = "powerpc" ]; then
> +           cp -a --parents arch/powerpc/lib/crtsavres.[So]
> $kerneldir/build/
> +       fi
> +
> +       cp -a include $kerneldir/build/include
> +    )
> +
> +    # now grab the chunks from the source tree that we need
> +    (
> +       cd ${S}
> +
> +       cp -a scripts $kerneldir/build
> +       if [ "${ARCH}" = "arm64" ]; then
> +           # arch/arm64/include/asm/xen references arch/arm
> +           cp -a --parents arch/arm/include/asm/xen $kerneldir/build/
> +           # arch/arm64/include/asm/opcodes.h references arch/arm
> +           cp -a --parents arch/arm/include/asm/opcodes.h
> $kerneldir/build/
> +       fi
> +
> +       # include the machine specific headers for ARM variants, if
> available.
> +       if [ "${ARCH}" = "arm" ]; then
> +           cp -a --parents arch/${ARCH}/mach-*/include $kerneldir/build/
> +
> +           # include a few files for 'make prepare'
> +           cp -a --parents arch/arm/tools/gen-mach-types
> $RPM_BUILD_ROOT/lib/modules/$KernelVer/build/
> +           cp -a --parents arch/arm/tools/mach-types
> $RPM_BUILD_ROOT/lib/modules/$KernelVer/build/
> +       fi
> +
> +       if [ -d arch/${ARCH}/include ]; then
> +           cp -a --parents arch/${ARCH}/include $kerneldir/build/
> +       fi
> +
> +       cp -a include $kerneldir/build
> +
> +       if [ "${ARCH}" = "x86" ]; then
> +           # files for 'make prepare' to succeed with kernel-devel
> +           cp -a --parents arch/x86/entry/syscalls/syscall_32.tbl
> $kerneldir/build/
> +           cp -a --parents arch/x86/entry/syscalls/syscalltbl.sh
> $kerneldir/build/
> +           cp -a --parents arch/x86/entry/syscalls/syscallhdr.sh
> $kerneldir/build/
> +           cp -a --parents arch/x86/entry/syscalls/syscall_64.tbl
> $kerneldir/build/
> +           cp -a --parents arch/x86/tools/relocs_32.c $kerneldir/build/
> +           cp -a --parents arch/x86/tools/relocs_64.c $kerneldir/build/
> +           cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
> +           cp -a --parents arch/x86/tools/relocs_common.c
> $kerneldir/build/
> +           cp -a --parents arch/x86/tools/relocs.h $kerneldir/build/
> +           cp -a --parents tools/include/tools/le_byteshift.h
> $kerneldir/build/
> +           cp -a --parents tools/include/tools/be_byteshift.h
> $kerneldir/build/
> +           cp -a --parents arch/x86/purgatory/purgatory.c
> $kerneldir/build/
> +           cp -a --parents arch/x86/purgatory/sha256.h $kerneldir/build/
> +           cp -a --parents arch/x86/purgatory/sha256.c $kerneldir/build/
> +           cp -a --parents arch/x86/purgatory/stack.S $kerneldir/build/
> +           cp -a --parents arch/x86/purgatory/string.c $kerneldir/build/
> +           cp -a --parents arch/x86/purgatory/setup-x86_64.S
> $kerneldir/build/
> +           cp -a --parents arch/x86/purgatory/entry64.S $kerneldir/build/
> +           cp -a --parents arch/x86/boot/string.h $kerneldir/build/
> +           cp -a --parents arch/x86/boot/string.c $kerneldir/build/
> +           cp -a --parents arch/x86/boot/ctype.h $kerneldir/build/
> +       fi
> +    )
> +
> +    # Make sure the Makefile and version.h have a matching timestamp so
> that
> +    # external modules can be built
> +    touch -r $kerneldir/build/Makefile $kerneldir/build/include/
> generated/uapi/linux/version.h
> +
> +    # Copy .config to include/config/auto.conf so "make prepare" is
> unnecessary.
> +    cp $kerneldir/build/.config $kerneldir/build/include/config/auto.conf
> +
> +    chown -R root:root ${D}
>  }
> +
>  # Ensure we don't race against "make scripts" during cpio
>  do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>
> -PACKAGES = "kernel-devsrc"
> -FILES_${PN} = "${KERNEL_SRC_PATH}"
> -RDEPENDS_${PN} = "bc"
> +FILES_${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
> +FILES_${PN}-dbg += "${KERNEL_BUILD_ROOT}*/build/scripts/*/.debug/*"
> +RDEPENDS_${PN} = "bc glibc-utils"
> --
> 2.5.0
>
>

--001a113e919868f3810566485f72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, but this breaks on ARM:<br><br>ERROR: kernel-devsrc=
-1.0-r0 do_install: Function failed: do_install (log file is located at /ho=
me/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/wor=
k/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822=
)<br>ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder=
/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/k=
ernel-devsrc/1.0-r0/temp/log.do_install.25822<br>Log data follows:<br>| DEB=
UG: Executing shell function do_install<br>| cp: with --parents, the destin=
ation must be a directory<br>| Try &#39;cp --help&#39; for more information=
.<br>| WARNING: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/=
build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/r=
un.do_install.25822:1 exit 1 from &#39;rm -rf $kerneldir/build/include&#39;=
<br>| ERROR: Function failed: do_install (log file is located at /home/poky=
build/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemua=
rm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822)<div><=
br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On 28 February 2018 at 02:06, Bruce Ashfield <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruc=
e.ashfield@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">The existing kernel-devsrc package starts with a full copy of the ker=
nel<br>
source and then starts to strip out elements that are not required.<br>
<br>
This results in extra time (I/O) and extra space being taken up in the<br>
final package. The main purpose of the kernel-devsrc package has been to<br=
>
build modules against the running kernel, not to include a full copy of<br>
the source code for re-building the kernel. The end result was a<br>
600M kernel-devsrc package.<br>
<br>
This restructuring of the package uses an approach similar to other<br>
distros, where the kernel-devsrc package is for building against the<br>
running kernel and uses a curated set of copied infrastructure, versus<br>
a mass copy of the entire kernel.<br>
<br>
The differences in this approach versus other is largely due to the<br>
architecture support and the split build/source directory of the<br>
kernel.<br>
<br>
The result is a kernel-devsrc package of about 10M, which is capable<br>
of running &quot;make scripts&quot; and compiling kernel modules against th=
e<br>
running kernel.<br>
<br>
Along with the changes to the copying of the infrascture, we also<br>
have the following changes:<br>
<br>
=C2=A0- a better/more explicit listing of dependencies for on-target<br>
=C2=A0 =C2=A0builds of &quot;make scripts&quot; or &quot;make modules_prepa=
re&quot;<br>
<br>
=C2=A0- The kernel source is installed into /lib/modules/&lt;version&gt;/bu=
ild<br>
=C2=A0 =C2=A0and a symlink created from /usr/src/kernel to the new location=
.<br>
=C2=A0 =C2=A0This aligns with the standard location for module support<br>
=C2=A0 =C2=A0code<br>
<br>
=C2=A0- There is also a symlink from /lib/modules/&lt;version&gt;/source -&=
gt; build<br>
=C2=A0 =C2=A0to reserve a spot for a new package that is simply the kernel<=
br>
=C2=A0 =C2=A0source. That package is not part of this update.<br>
<br>
[YOCTO #12535]<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com">bruce.ashfield@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kern<wbr>el-devsrc.bb</a> | 178 +++++++++++++=
+++++++++-------<br>
=C2=A01 file changed, 138 insertions(+), 40 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">ke<wbr>rnel-devsrc.bb</a> b/meta/recip=
es-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" targ=
et=3D"_blank">ke<wbr>rnel-devsrc.bb</a><br>
index c1b5b7786d7c..f55b115e0936 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">ke<wbr>rnel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">ke<wbr>rnel-devsrc.bb</a><br>
@@ -30,50 +30,148 @@ do_populate_sysroot[noexec] =3D &quot;1&quot;<br>
=C2=A0S =3D &quot;${STAGING_KERNEL_DIR}&quot;<br>
=C2=A0B =3D &quot;${STAGING_KERNEL_BUILDDIR}&quot;<br>
<br>
-KERNEL_VERSION =3D &quot;${@get_kernelversion_headers(<wbr>&#39;${S}&#39;)=
}&quot;<br>
-<br>
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
+KERNEL_BUILD_ROOT=3D&quot;/lib/<wbr>modules/&quot;<br>
+<br>
=C2=A0do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kerneldir=3D${D}${KERNEL_SRC_<wbr>PATH}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d $kerneldir<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy the staging dir source (and module buil=
d support) into the devsrc structure.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We can keep this copy simple and take everyt=
hing, since a we&#39;ll clean up any build<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # artifacts afterwards, and the extra i/o is n=
ot significant<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 find . -type d -name &#39;.git*&#39; -prune -o=
 -path &#39;.debug&#39; -prune -o -type f -print0 | cpio --null -pdlu $kern=
eldir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0find . -type d -name &#39;.git*&#39; -prune -o =
-type d -name &#39;.kernel-meta&#39; -prune -o -type f -print0 | cpio --nul=
l -pdlu $kerneldir<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Explicitly set KBUILD_OUTPUT to ensure that =
the image directory is cleaned and not<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The main build artifacts. We clean the direc=
tory to avoid QA errors on mismatched<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # architecture (since scripts and helpers are =
native format).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 KBUILD_OUTPUT=3D&quot;$kerneldir&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C $kerneldir CC=3D&quot;${KERNEL_C=
C}&quot; LD=3D&quot;${KERNEL_LD}&quot; clean _mrproper_scripts<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # make clean generates an absolute path symlin=
k called &quot;source&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # in $kerneldir points to $kerneldir, which do=
esn&#39;t make any<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # sense, so remove it.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -L $kerneldir/source ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;Removing $kerneldir=
/source symlink&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f $kerneldir/source<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # As of Linux kernel version 3.0.1, the clean =
target removes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # arch/powerpc/lib/crtsavres.o which is presen=
t in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # KBUILD_LDFLAGS_MODULE, making it required to=
 build external modules.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ${ARCH} =3D &quot;powerpc&quot; ]; then<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $kerneldi=
r/arch/powerpc/lib/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${B}/arch/power=
pc/lib/<wbr>crtsavres.o $kerneldir/arch/powerpc/lib/<wbr>crtsavres.o<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 chown -R root:root ${D}<br>
+=C2=A0 =C2=A0 kerneldir=3D${D}${KERNEL_BUILD_<wbr>ROOT}${KERNEL_VERSION}<b=
r>
+=C2=A0 =C2=A0 install -d $kerneldir<br>
+<br>
+=C2=A0 =C2=A0 # create the directory structure<br>
+=C2=A0 =C2=A0 rm -f $kerneldir/build<br>
+=C2=A0 =C2=A0 rm -f $kerneldir/source<br>
+=C2=A0 =C2=A0 mkdir -p $kerneldir/build<br>
+<br>
+=C2=A0 =C2=A0 # for compatibility with some older variants of this package=
, we<br>
+=C2=A0 =C2=A0 # create=C2=A0 a /usr/src/kernel symlink to /lib/modules/&lt=
;version&gt;/source<br>
+=C2=A0 =C2=A0 mkdir -p ${D}/usr/src<br>
+=C2=A0 =C2=A0 (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${D}/usr/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${KERNEL_BUILD_ROOT}${KERNEL_<wbr>VERSION=
}/source kernel<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 # for on target purposes, we unify build and source<br>
+=C2=A0 =C2=A0 (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd $kerneldir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s build source<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 # first copy everything<br>
+=C2=A0 =C2=A0 (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp --parents $(find=C2=A0 -type f -name &quot;M=
akefile*&quot; -o -name &quot;Kconfig*&quot;) $kerneldir/build<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 # then drop all but the needed Makefiles/Kconfig files<br>
+=C2=A0 =C2=A0 rm -rf $kerneldir/build/Documentation<br>
+=C2=A0 =C2=A0 rm -rf $kerneldir/build/scripts<br>
+=C2=A0 =C2=A0 rm -rf $kerneldir/build/include<br>
+<br>
+=C2=A0 =C2=A0 # now copy in parts from the build that we&#39;ll need later=
<br>
+=C2=A0 =C2=A0 (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp Module.symvers $kerneldir/build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp System.map* $kerneldir/build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -s Module.markers ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp Module.markers $kerneldir/buil=
d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp .config $kerneldir/build<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# TODO: this scripts copy will likely blow up Q=
A, so for now, we<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0require a more comp=
lex &#39;make scripts&#39; to restore these, versus<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0copying them here. =
Left as a reference to indicate that we<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0know the scripts mu=
st be dealt with.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# cp -a scripts $kerneldir/build<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f tools/objtool/objtool ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a tools/objtool/objtool $kern=
eldir/build/tools/<wbr>objtool/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d arch/${ARCH}/scripts ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a arch/${ARCH}/scripts $kerne=
ldir/build/arch/${ARCH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f arch/${ARCH}/*lds ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a arch/${ARCH}/*lds $kerneldi=
r/build/arch/${ARCH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $kerneldir/build/scripts/*.o<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $kerneldir/build/scripts/*/*.o<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${ARCH}&quot; =3D &quot;powerpc&quot=
; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/powerpc/lib/=
crtsavres.[<wbr>So] $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a include $kerneldir/build/include<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 # now grab the chunks from the source tree that we need<br>
+=C2=A0 =C2=A0 (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a scripts $kerneldir/build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${ARCH}&quot; =3D &quot;arm64&quot; =
]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# arch/arm64/include/asm/xen refe=
rences arch/arm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/arm/include/=
asm/xen $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# arch/arm64/include/asm/<wbr>opc=
odes.h references arch/arm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/arm/include/=
asm/opcodes.h $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# include the machine specific headers for ARM =
variants, if available.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${ARCH}&quot; =3D &quot;arm&quot; ];=
 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/${ARCH}/mach=
-*/include $kerneldir/build/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# include a few files for &#39;ma=
ke prepare&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/arm/tools/ge=
n-mach-types $RPM_BUILD_ROOT/lib/modules/$<wbr>KernelVer/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/arm/tools/ma=
ch-types $RPM_BUILD_ROOT/lib/modules/$<wbr>KernelVer/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d arch/${ARCH}/include ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/${ARCH}/incl=
ude $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a include $kerneldir/build<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${ARCH}&quot; =3D &quot;x86&quot; ];=
 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# files for &#39;make prepare&#39=
; to succeed with kernel-devel<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/entry/sy=
scalls/<wbr>syscall_32.tbl $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/entry/sy=
scalls/<wbr>syscalltbl.sh $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/entry/sy=
scalls/<wbr>syscallhdr.sh $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/entry/sy=
scalls/<wbr>syscall_64.tbl $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/tools/re=
locs_32.c $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/tools/re=
locs_64.c $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/tools/re=
locs.c $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/tools/re=
locs_common.c $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/tools/re=
locs.h $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents tools/include/too=
ls/le_<wbr>byteshift.h $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents tools/include/too=
ls/be_<wbr>byteshift.h $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/purgator=
y/purgatory.c $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/purgator=
y/sha256.h $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/purgator=
y/sha256.c $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/purgator=
y/stack.S $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/purgator=
y/string.c $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/purgator=
y/setup-x86_<wbr>64.S $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/purgator=
y/entry64.S $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/boot/str=
ing.h $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/boot/str=
ing.c $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/boot/cty=
pe.h $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 # Make sure the Makefile and version.h have a matching times=
tamp so that<br>
+=C2=A0 =C2=A0 # external modules can be built<br>
+=C2=A0 =C2=A0 touch -r $kerneldir/build/Makefile $kerneldir/build/include/=
<wbr>generated/uapi/linux/version.h<br>
+<br>
+=C2=A0 =C2=A0 # Copy .config to include/config/auto.conf so &quot;make pre=
pare&quot; is unnecessary.<br>
+=C2=A0 =C2=A0 cp $kerneldir/build/.config $kerneldir/build/include/<wbr>co=
nfig/auto.conf<br>
+<br>
+=C2=A0 =C2=A0 chown -R root:root ${D}<br>
=C2=A0}<br>
+<br>
=C2=A0# Ensure we don&#39;t race against &quot;make scripts&quot; during cp=
io<br>
=C2=A0do_install[lockfiles] =3D &quot;${TMPDIR}/kernel-scripts.<wbr>lock&qu=
ot;<br>
<br>
-PACKAGES =3D &quot;kernel-devsrc&quot;<br>
-FILES_${PN} =3D &quot;${KERNEL_SRC_PATH}&quot;<br>
-RDEPENDS_${PN} =3D &quot;bc&quot;<br>
+FILES_${PN} =3D &quot;${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${KERNEL_BUILD_ROOT}*/build/<wbr>scripts/*/.deb=
ug/*&quot;<br>
+RDEPENDS_${PN} =3D &quot;bc glibc-utils&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.0<br>
<br>
</font></span></blockquote></div><br></div>

--001a113e919868f3810566485f72--
