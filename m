Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id F2FD56E688
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 23:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E446720A3B;
	Tue, 17 Oct 2017 23:18:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vaSUHO6vosP0; Tue, 17 Oct 2017 23:18:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B000B204B1;
	Tue, 17 Oct 2017 23:18:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3CD49162706; Tue, 17 Oct 2017 19:18:06 -0400 (EDT)
Date: Tue, 17 Oct 2017 19:18:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
Message-ID: <20171017231806.GO9221@denix.org>
References: <20171017165424.22887-1-thomas.perrot@tupi.fr>
	<20171017190915.GI9221@denix.org>
	<BL2PR02MB2163A3231B9F61417D92A803B94C0@BL2PR02MB2163.namprd02.prod.outlook.com>
	<20171017222000.GL9221@denix.org>
	<BL2PR02MB216333023A57FEE778BC75DCB94C0@BL2PR02MB2163.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BL2PR02MB216333023A57FEE778BC75DCB94C0@BL2PR02MB2163.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta][pyro][PATCH] Fix some issues in the fitImage generation
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
X-List-Received-Date: Tue, 17 Oct 2017 23:18:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 10:27:07PM +0000, Manjukumar Harthikote Matha wrote:
>=20
>=20
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denis@denix.org]
> > Sent: Tuesday, October 17, 2017 3:20 PM
> > To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
> > Cc: Thomas Perrot <thomas.perrot@tupi.fr>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [meta][pyro][PATCH] Fix some issues in the fitIm=
age
> > generation
> >=20
> > On Tue, Oct 17, 2017 at 09:35:12PM +0000, Manjukumar Harthikote Matha w=
rote:
> > > Hi Denys,
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core-bounces@lists.openembedded.org
> > > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > > > Of Denys Dmytriyenko
> > > > Sent: Tuesday, October 17, 2017 12:09 PM
> > > > To: Thomas Perrot <thomas.perrot@tupi.fr>
> > > > Cc: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core] [meta][pyro][PATCH] Fix some issues in the
> > > > fitImage generation
> > > >
> > > > On Tue, Oct 17, 2017 at 06:54:24PM +0200, Thomas Perrot wrote:
> > > > > - Bad image type replacement for aarch64
> > > > > - Fix DTB path in fitimage.its
> > > >
> > > > I've seen the above 2 fixes before, but they never made it.
> > > >
> > > >
> > > > > - Ignore fitImage type during the packaging of the initramfs
> > > >
> > > > Can you please explain this one a bit more?
> > > >
> > > > And in general, commit message should rather explain "why" and not =
"what"
> > > >
> > > I see this behavior:
> > > https://lists.yoctoproject.org/pipermail/yocto/2017-October/038438.htm
> > > l
> > >
> > > When you build using initramfs and fitimage, we see a failure in kern=
el deploy.
> >=20
> > Please provide any relevant logs for the failure.
> >=20
> >=20
>=20
> Here you go:=20

Thanks! Now it's clearer.

Apparently, I don't see this issue as I don't use INITRAMFS_IMAGE_BUNDLE =
=3D "1"=20
for appending initramfs into the kernel...


> Initialising tasks: 100% |###############################################=
###########################################################################=
#######################| Time: 0:00:03
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: linux-xlnx-4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0 do_bundle_i=
nitramfs: Function failed: do_bundle_initramfs (log file is located at /wor=
kspaces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_zynqmp-poky-linu=
x/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/temp/log.do_bundle=
_initramfs.30337)
> ERROR: Logfile of failure stored in: /workspaces2/manjukum/meta-xilinx-ma=
ster/build/tmp/work/zcu102_zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v2017.3+=
gitAUTOINC+f1b1e077d6-r0/temp/log.do_bundle_initramfs.30337
> Log data follows:
> | DEBUG: Executing shell function do_bundle_initramfs
> | Creating a kernel image with a bundled initramfs...
> | Copying initramfs into ./usr ...
> | Finished copy of initramfs into ./usr
> | NOTE: make HOSTCC=3Dgcc  -isystem/workspaces2/manjukum/meta-xilinx-mast=
er/build/tmp/work/zcu102_zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v2017.3+gi=
tAUTOINC+f1b1e077d6-r0/recipe-sysroot-native/usr/include -O2 -pipe -L/works=
paces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_zynqmp-poky-linux/=
linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot-nativ=
e/usr/lib -L/workspaces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_=
zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/re=
cipe-sysroot-native/lib -Wl,-rpath-link,/workspaces2/manjukum/meta-xilinx-m=
aster/build/tmp/work/zcu102_zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v2017.3=
+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link,/wo=
rkspaces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_zynqmp-poky-lin=
ux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot-na=
tive/lib -Wl,-rpath,/workspaces2/manjukum/meta-xilinx-master/build/tmp/work=
/zcu102_zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v201
> 7.3+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot-native/usr/lib -Wl,-rpath,/wo=
rkspaces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_zynqmp-poky-lin=
ux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot-na=
tive/lib -Wl,-O1 HOSTCPP=3Dgcc  -E Image CC=3Daarch64-poky-linux-gcc   -fus=
e-ld=3Dbfd  --sysroot=3D/workspaces2/manjukum/meta-xilinx-master/build/tmp/=
work/zcu102_zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1=
e077d6-r0/recipe-sysroot -ffile-prefix-map=3D/workspaces2/manjukum/meta-xil=
inx-master/build/tmp/work-shared/zcu102-zynqmp/kernel-source=3D/kernel-sour=
ce/  LD=3Daarch64-poky-linux-ld.bfd    --sysroot=3D/workspaces2/manjukum/me=
ta-xilinx-master/build/tmp/work/zcu102_zynqmp-poky-linux/linux-xlnx/4.9-xil=
inx-v2017.3+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot CONFIG_INITRAMFS_SOURCE=
=3D/workspaces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_zynqmp-po=
ky-linux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/linux-zcu10=
2_zynqmp-standard-build/usr/core-image-minimal-zcu102-zynqmp.cpio
> |   CHK     include/config/kernel.release
> |   Using /workspaces2/manjukum/meta-xilinx-master/build/tmp/work-shared/=
zcu102-zynqmp/kernel-source as source for kernel
> |   GEN     ./Makefile
> |   CHK     include/generated/uapi/linux/version.h
> |   CHK     include/generated/utsrelease.h
> |   CHK     include/generated/bounds.h
> |   CHK     include/generated/timeconst.h
> |   CHK     include/generated/asm-offsets.h
> |   CALL    /workspaces2/manjukum/meta-xilinx-master/build/tmp/work-share=
d/zcu102-zynqmp/kernel-source/scripts/checksyscalls.sh
> |   CHK     include/generated/compile.h
> |   GEN     usr/initramfs_data.cpio.gz
> |   AS      usr/initramfs_data.o
> |   LD      usr/built-in.o
> |   CHK     kernel/config_data.h
> |   LD      vmlinux.o
> |   MODPOST vmlinux.o
> |   GEN     .version
> |   CHK     include/generated/compile.h
> |   UPD     include/generated/compile.h
> |   CC      init/version.o
> |   LD      init/built-in.o
> |   KSYM    .tmp_kallsyms1.o
> |   KSYM    .tmp_kallsyms2.o
> |   LD      vmlinux
> |   SORTEX  vmlinux
> |   SYSMAP  System.map
> |   OBJCOPY arch/arm64/boot/Image
> | NOTE: make HOSTCC=3Dgcc  -isystem/workspaces2/manjukum/meta-xilinx-mast=
er/build/tmp/work/zcu102_zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v2017.3+gi=
tAUTOINC+f1b1e077d6-r0/recipe-sysroot-native/usr/include -O2 -pipe -L/works=
paces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_zynqmp-poky-linux/=
linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot-nativ=
e/usr/lib -L/workspaces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_=
zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/re=
cipe-sysroot-native/lib -Wl,-rpath-link,/workspaces2/manjukum/meta-xilinx-m=
aster/build/tmp/work/zcu102_zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v2017.3=
+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link,/wo=
rkspaces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_zynqmp-poky-lin=
ux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot-na=
tive/lib -Wl,-rpath,/workspaces2/manjukum/meta-xilinx-master/build/tmp/work=
/zcu102_zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v201
> 7.3+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot-native/usr/lib -Wl,-rpath,/wo=
rkspaces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_zynqmp-poky-lin=
ux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot-na=
tive/lib -Wl,-O1 HOSTCPP=3Dgcc  -E Image CC=3Daarch64-poky-linux-gcc   -fus=
e-ld=3Dbfd  --sysroot=3D/workspaces2/manjukum/meta-xilinx-master/build/tmp/=
work/zcu102_zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1=
e077d6-r0/recipe-sysroot -ffile-prefix-map=3D/workspaces2/manjukum/meta-xil=
inx-master/build/tmp/work-shared/zcu102-zynqmp/kernel-source=3D/kernel-sour=
ce/  LD=3Daarch64-poky-linux-ld.bfd    --sysroot=3D/workspaces2/manjukum/me=
ta-xilinx-master/build/tmp/work/zcu102_zynqmp-poky-linux/linux-xlnx/4.9-xil=
inx-v2017.3+gitAUTOINC+f1b1e077d6-r0/recipe-sysroot CONFIG_INITRAMFS_SOURCE=
=3D/workspaces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_zynqmp-po=
ky-linux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/linux-zcu10=
2_zynqmp-standard-build/usr/core-image-minimal-zcu102-zynqmp.cpio
> |   CHK     include/config/kernel.release
> |   Using /workspaces2/manjukum/meta-xilinx-master/build/tmp/work-shared/=
zcu102-zynqmp/kernel-source as source for kernel
> |   GEN     ./Makefile
> |   CHK     include/generated/uapi/linux/version.h
> |   CHK     include/generated/utsrelease.h
> |   CHK     include/generated/bounds.h
> |   CHK     include/generated/timeconst.h
> |   CHK     include/generated/asm-offsets.h
> |   CALL    /workspaces2/manjukum/meta-xilinx-master/build/tmp/work-share=
d/zcu102-zynqmp/kernel-source/scripts/checksyscalls.sh
> |   CHK     include/generated/compile.h
> |   CHK     kernel/config_data.h
> | mv: cannot stat 'arch/arm64/boot/fitImage': No such file or directory
> | WARNING: /workspaces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102=
_zynqmp-poky-linux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/t=
emp/run.do_bundle_initramfs.30337:1 exit 1 from 'mv -f arch/arm64/boot/$typ=
e arch/arm64/boot/$type.initramfs'
> | ERROR: Function failed: do_bundle_initramfs (log file is located at /wo=
rkspaces2/manjukum/meta-xilinx-master/build/tmp/work/zcu102_zynqmp-poky-lin=
ux/linux-xlnx/4.9-xilinx-v2017.3+gitAUTOINC+f1b1e077d6-r0/temp/log.do_bundl=
e_initramfs.30337)
> ERROR: Task (/workspaces2/manjukum/meta-xilinx-master/sources/yocto/meta-=
xilinx/recipes-kernel/linux/linux-xlnx_2017.3.bb:do_bundle_initramfs) faile=
d with exit code '1'
> NOTE: Tasks Summary: Attempted 2371 tasks of which 2370 didn't need to be=
 rerun and 1 failed.
>=20
>=20
> Thanks,
> Manju
>=20
> > > I think we need even fixes to deploy class as well.
> > >
> > >
> > > Thanks,
> > > Manju
> > >
> > > >
> > > > > Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> > > > > ---
> > > > >  meta/classes/kernel-fitimage.bbclass | 6 +++++-
> > > > >  meta/classes/kernel.bbclass          | 4 +++-
> > > > >  2 files changed, 8 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/meta/classes/kernel-fitimage.bbclass
> > > > > b/meta/classes/kernel-fitimage.bbclass
> > > > > index 2630b47316..abbc309b09 100644
> > > > > --- a/meta/classes/kernel-fitimage.bbclass
> > > > > +++ b/meta/classes/kernel-fitimage.bbclass
> > > > > @@ -7,8 +7,11 @@ python __anonymous () {
> > > > >          depends =3D "%s u-boot-mkimage-native dtc-native" % depe=
nds
> > > > >          d.setVar("DEPENDS", depends)
> > > > >
> > > > > -        if d.getVar("UBOOT_ARCH") =3D=3D "x86":
> > > > > +        uarch =3D d.getVar("UBOOT_ARCH")
> > > > > +        if uarch =3D=3D "x86":
> > > > >              replacementtype =3D "bzImage"
> > > > > +        elif uarch =3D=3D "arm64":
> > > > > +            replacementtype =3D "Image"
> > > > >          else:
> > > > >              replacementtype =3D "zImage"
> > > > >
> > > > > @@ -351,6 +354,7 @@ fitimage_assemble() {
> > > > >  				DTB_PATH=3D"arch/${ARCH}/boot/${DTB}"
> > > > >  			fi
> > > > >
> > > > > +			DTB=3D$(echo "${DTB}" | tr '/' '_')
> > > > >  			DTBS=3D"${DTBS} ${DTB}"
> > > > >  			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
> > > > >  		done
> > > > > diff --git a/meta/classes/kernel.bbclass
> > > > > b/meta/classes/kernel.bbclass index ce2cab65ae..a8b0d0a061 100644
> > > > > --- a/meta/classes/kernel.bbclass
> > > > > +++ b/meta/classes/kernel.bbclass
> > > > > @@ -219,7 +219,9 @@ do_bundle_initramfs () {
> > > > >  		# Backing up kernel image relies on its type(regular file or
> > > > > symbolic
> > > > link)
> > > > >  		tmp_path=3D""
> > > > >  		for type in ${KERNEL_IMAGETYPES} ; do
> > > > > -			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> > > > > +			if [ "$type" =3D=3D "fitImage" ] ; then
> > > > > +				continue
> > > > > +			elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> > > > >  				linkpath=3D`readlink -n
> > > > ${KERNEL_OUTPUT_DIR}/$type`
> > > > >  				realpath=3D`readlink -fn
> > > > ${KERNEL_OUTPUT_DIR}/$type`
> > > > >  				mv -f $realpath $realpath.bak
> > > > > --
> > > > > 2.13.6
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
>=20

