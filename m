Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id A8F487847B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 11:30:10 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id x125so122119841ywa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 04:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0WrGPtIl9xFCNwVW2+JbvpGV880ti4j9yQkhTBhh2BQ=;
	b=YB0F0NoNIhOQJ9DDcTjsYOITrhEqFdH+gvGiBw5vqjasmA+tTUZfd6AChN7NMBliG0
	gDrrY2SAun/GCTpUuneO7TVa8YHsQH27vzBbd1OWLv8evwPfdQHUPotvb5ynFHuVfT3g
	8b4d+Az5eU9Bd4WVm7YNdCbVpBfY04iatWA0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0WrGPtIl9xFCNwVW2+JbvpGV880ti4j9yQkhTBhh2BQ=;
	b=VDwzJaKIY2eiMfkNf/5J1oDh54xN9kqTDoDf6kbXF0a9PYOz1rNOL3JhxqzTfktudx
	uZRq/vazXffUj4yh/hWrTnnf+BhNfCL1DdmaOaJoiOsfCAcnsxsHpRhYa6wh/6lRf55k
	LROoxsgkfEBjP1gDo5keKv6NkfZkmpnJRpZy/96O04kkVJgdqWTxgnqwj2EGUKPXuemY
	oueFUiq6mkWw5BDYSQuqtXCFxk4orvm0nDMZn0D9/RckCvE6s+2zbxk8bYzGYtgUaCrA
	4sChIQtZEqQwXhB8yPbY8WmiDNfQF0hi3rAXzeze3cM4MX0KLwPPY+8kSl+dJdsjzx6G
	i/PA==
X-Gm-Message-State: AIVw110pXuh70yrKK2gvAyNhK5DHlOUdcCC7zh7kNPISkuufSx6eTmj2
	cO+3KisuaDfsnR/dtk6Igw==
X-Received: by 10.129.163.131 with SMTP id a125mr6493420ywh.95.1501241411568; 
	Fri, 28 Jul 2017 04:30:11 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1408:4167:d592:eb44:5635:7865])
	by smtp.gmail.com with ESMTPSA id
	n63sm1487257ywd.34.2017.07.28.04.30.10
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 28 Jul 2017 04:30:11 -0700 (PDT)
Date: Fri, 28 Jul 2017 07:31:31 -0400
From: Tom Rini <trini@konsulko.com>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20170728113131.GK26163@bill-the-cat>
References: <1501012696-2666-1-git-send-email-trini@konsulko.com>
	<CANwerB1m5u91dBEGRjVrn42DE38OaUtXUp18f-OC4LXY1mB9sA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANwerB1m5u91dBEGRjVrn42DE38OaUtXUp18f-OC4LXY1mB9sA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types
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
X-List-Received-Date: Fri, 28 Jul 2017 11:30:10 -0000
X-Groupsio-MsgNum: 100804
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ucKxrLtqiGlSKUCp"
Content-Disposition: inline

--ucKxrLtqiGlSKUCp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 09:09:55PM +1000, Jonathan Liu wrote:
> Hi Tom,
>=20
> On 26 July 2017 at 05:58, Tom Rini <trini@konsulko.com> wrote:
> > The vmdk/vdi/qcow2 IMAGE_FSTYPEs predate wic.  As such, they provide
> > some similar underlying functionality in order to produce a "disk" image
> > that in turn can be converted into different formats that various
> > hypervisor types work with.  They do not however provide the ability for
> > other disk image types to be converted into these same output types.
> > Furthermore, they are less flexible than what wic does provide.  This
> > drops the old style vmdk/vdi/qcow2 types and re-introduces them under
> > the CONVERSION_CMD framework.  The equivalent of vmdk is now wic.vmdk
> > and so forth for the other types.
> >
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> > This depends on my previous series to correct chaining compression
> > support.  I had attempted to keep the vmdk/vdi/qcow2 IMAGE_FSTYPES for
> > compatibility sake using IMAGE_TYPEDEP_vmdk =3D "wic" and introducing an
> > oe_qemuimg function to run to do the conversion.  This was working, but
> > I could not get it to have the symlinks created automatically.  At this
> > timeI think it makes most sense to not hide that the underlying disk
> > content has changed at least slightly from the old vmdk type to the new
> > type and that we can simply handle this change in documentation.  As
> > such, if there's agreement about dropping the types I'll include some
> > documentation changes in the next version.
> >
> >  meta/classes/image-vm.bbclass                      | 171 -------------=
--------
> >  meta/classes/image.bbclass                         |   3 -
> >  meta/classes/image_types.bbclass                   |  12 +-
> >  .../images/build-appliance-image_15.0.0.bb         |   6 +-
> >  4 files changed, 10 insertions(+), 182 deletions(-)
> >  delete mode 100644 meta/classes/image-vm.bbclass
> >
> > diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbcl=
ass
> > deleted file mode 100644
> > index b52df9f..0000000
> > --- a/meta/classes/image-vm.bbclass
> > +++ /dev/null
> > @@ -1,171 +0,0 @@
> > -# image-vm.bbclass
> > -# (loosly based off image-live.bbclass Copyright (C) 2004, Advanced Mi=
cro Devices, Inc.)
> > -#
> > -# Create an image which can be placed directly onto a harddisk using d=
d and then
> > -# booted.
> > -#
> > -# This uses syslinux. extlinux would have been nice but required the e=
xt2/3
> > -# partition to be mounted. grub requires to run itself as part of the =
install
> > -# process.
> > -#
> > -# The end result is a 512 boot sector populated with an MBR and partit=
ion table
> > -# followed by an msdos fat16 partition containing syslinux and a linux=
 kernel
> > -# completed by the ext2/3 rootfs.
> > -#
> > -# We have to push the msdos parition table size > 16MB so fat 16 is us=
ed as parted
> > -# won't touch fat12 partitions.
> > -
> > -inherit live-vm-common
> > -
> > -do_bootdirectdisk[depends] +=3D "dosfstools-native:do_populate_sysroot=
 \
> > -                               virtual/kernel:do_deploy \
> > -                               syslinux:do_populate_sysroot \
> > -                               syslinux-native:do_populate_sysroot \
> > -                               parted-native:do_populate_sysroot \
> > -                               mtools-native:do_populate_sysroot \
> > -                               ${PN}:do_image_${VM_ROOTFS_TYPE} \
> > -                               "
> > -
> > -IMAGE_TYPEDEP_vmdk =3D "${VM_ROOTFS_TYPE}"
> > -IMAGE_TYPEDEP_vdi =3D "${VM_ROOTFS_TYPE}"
> > -IMAGE_TYPEDEP_qcow2 =3D "${VM_ROOTFS_TYPE}"
> > -IMAGE_TYPEDEP_hdddirect =3D "${VM_ROOTFS_TYPE}"
> > -IMAGE_TYPES_MASKED +=3D "vmdk vdi qcow2 hdddirect"
> > -
> > -VM_ROOTFS_TYPE ?=3D "ext4"
> > -ROOTFS ?=3D "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${VM_ROOTFS_TYPE}"
> > -
> > -# Used by bootloader
> > -LABELS_VM ?=3D "boot"
> > -ROOT_VM ?=3D "root=3D/dev/sda2"
> > -# Using an initramfs is optional. Enable it by setting INITRD_IMAGE_VM.
> > -INITRD_IMAGE_VM ?=3D ""
> > -INITRD_VM ?=3D "${@'${IMGDEPLOYDIR}/${INITRD_IMAGE_VM}-${MACHINE}.cpio=
=2Egz' if '${INITRD_IMAGE_VM}' else ''}"
> > -do_bootdirectdisk[depends] +=3D "${@'${INITRD_IMAGE_VM}:do_image_compl=
ete' if '${INITRD_IMAGE_VM}' else ''}"
> > -
> > -BOOTDD_VOLUME_ID   ?=3D "boot"
> > -BOOTDD_EXTRA_SPACE ?=3D "16384"
> > -
> > -DISK_SIGNATURE ?=3D "${DISK_SIGNATURE_GENERATED}"
> > -DISK_SIGNATURE[vardepsexclude] =3D "DISK_SIGNATURE_GENERATED"
> > -
> > -build_boot_dd() {
> > -       HDDDIR=3D"${S}/hdd/boot"
> > -       HDDIMG=3D"${S}/hdd.image"
> > -       IMAGE=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.hdddirect
> > -
> > -       populate_kernel $HDDDIR
> > -
> > -       if [ "${PCBIOS}" =3D "1" ]; then
> > -               syslinux_hddimg_populate $HDDDIR
> > -       fi
> > -       if [ "${EFI}" =3D "1" ]; then
> > -               efi_hddimg_populate $HDDDIR
> > -       fi
> > -
> > -       BLOCKS=3D`du -bks $HDDDIR | cut -f 1`
> > -       BLOCKS=3D`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
> > -
> > -       # Remove it since mkdosfs would fail when it exists
> > -       rm -f $HDDIMG
> > -       mkdosfs -n ${BOOTDD_VOLUME_ID} ${MKDOSFS_EXTRAOPTS} -C $HDDIMG =
$BLOCKS
> > -       mcopy -i $HDDIMG -s $HDDDIR/* ::/
> > -
> > -       if [ "${PCBIOS}" =3D "1" ]; then
> > -               syslinux_hdddirect_install $HDDIMG
> > -       fi
> > -       chmod 644 $HDDIMG
> > -
> > -       ROOTFSBLOCKS=3D`du -Lbks ${ROOTFS} | cut -f 1`
> > -       TOTALSIZE=3D`expr $BLOCKS + $ROOTFSBLOCKS`
> > -       END1=3D`expr $BLOCKS \* 1024`
> > -       END2=3D`expr $END1 + 512`
> > -       END3=3D`expr \( $ROOTFSBLOCKS \* 1024 \) + $END1`
> > -
> > -       echo $ROOTFSBLOCKS $TOTALSIZE $END1 $END2 $END3
> > -       rm -rf $IMAGE
> > -       dd if=3D/dev/zero of=3D$IMAGE bs=3D1024 seek=3D$TOTALSIZE count=
=3D1
> > -
> > -       parted $IMAGE mklabel msdos
> > -       parted $IMAGE mkpart primary fat16 0 ${END1}B
> > -       parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
> > -       parted $IMAGE set 1 boot on
> > -
> > -       parted $IMAGE print
> > -
> > -       awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | sed 's/\(..\)\=
(..\)\(..\)\(..\)/\\x\4\\x\3\\x\2\\x\1/')\" }" | \
> > -               dd of=3D$IMAGE bs=3D1 seek=3D440 conv=3Dnotrunc
> > -
> > -       OFFSET=3D`expr $END2 / 512`
> > -       if [ "${PCBIOS}" =3D "1" ]; then
> > -               dd if=3D${STAGING_DATADIR}/syslinux/mbr.bin of=3D$IMAGE=
 conv=3Dnotrunc
> > -       fi
> > -
> > -       dd if=3D$HDDIMG of=3D$IMAGE conv=3Dnotrunc seek=3D1 bs=3D512
> > -       dd if=3D${ROOTFS} of=3D$IMAGE conv=3Dnotrunc seek=3D$OFFSET bs=
=3D512
> > -
> > -       cd ${IMGDEPLOYDIR}
> > -
> > -       ln -sf ${IMAGE_NAME}.hdddirect ${IMGDEPLOYDIR}/${IMAGE_LINK_NAM=
E}.hdddirect
> > -}
> > -
> > -python do_bootdirectdisk() {
> > -    validate_disk_signature(d)
> > -    set_live_vm_vars(d, 'VM')
> > -    if d.getVar("PCBIOS") =3D=3D "1":
> > -        bb.build.exec_func('build_syslinux_cfg', d)
> > -    if d.getVar("EFI") =3D=3D "1":
> > -        bb.build.exec_func('build_efi_cfg', d)
> > -    bb.build.exec_func('build_boot_dd', d)
> > -}
> > -
> > -def generate_disk_signature():
> > -    import uuid
> > -
> > -    signature =3D str(uuid.uuid4())[:8]
> > -
> > -    if signature !=3D '00000000':
> > -        return signature
> > -    else:
> > -        return 'ffffffff'
> > -
> > -def validate_disk_signature(d):
> > -    import re
> > -
> > -    disk_signature =3D d.getVar("DISK_SIGNATURE")
> > -
> > -    if not re.match(r'^[0-9a-fA-F]{8}$', disk_signature):
> > -        bb.fatal("DISK_SIGNATURE '%s' must be an 8 digit hex string" %=
 disk_signature)
> > -
> > -DISK_SIGNATURE_GENERATED :=3D "${@generate_disk_signature()}"
> > -
> > -run_qemu_img (){
> > -    type=3D"$1"
> > -    qemu-img convert -O $type ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.hdddi=
rect ${IMGDEPLOYDIR}/${IMAGE_NAME}.$type
> > -
> > -    ln -sf ${IMAGE_NAME}.$type ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.$type
> > -}
> > -create_vmdk_image () {
> > -    run_qemu_img vmdk
> > -}
> > -
> > -create_vdi_image () {
> > -    run_qemu_img vdi
> > -}
> > -
> > -create_qcow2_image () {
> > -    run_qemu_img qcow2
> > -}
> > -
> > -python do_vmimg() {
> > -    if 'vmdk' in d.getVar('IMAGE_FSTYPES'):
> > -        bb.build.exec_func('create_vmdk_image', d)
> > -    if 'vdi' in d.getVar('IMAGE_FSTYPES'):
> > -        bb.build.exec_func('create_vdi_image', d)
> > -    if 'qcow2' in d.getVar('IMAGE_FSTYPES'):
> > -        bb.build.exec_func('create_qcow2_image', d)
> > -}
> > -
> > -addtask bootdirectdisk before do_vmimg
> > -addtask vmimg after do_bootdirectdisk before do_image_complete
> > -do_vmimg[depends] +=3D "qemu-native:do_populate_sysroot"
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index dee17ae..40bd614 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -138,9 +138,6 @@ def build_live(d):
> >  IMAGE_TYPE_live =3D "${@build_live(d)}"
> >  inherit ${IMAGE_TYPE_live}
> >
> > -IMAGE_TYPE_vm =3D '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", =
"vdi", "qcow2", "hdddirect"], "image-vm", "", d)}'
> > -inherit ${IMAGE_TYPE_vm}
> > -
> >  IMAGE_TYPE_container =3D '${@bb.utils.contains("IMAGE_FSTYPES", "conta=
iner", "image-container", "", d)}'
> >  inherit ${IMAGE_TYPE_container}
> >
> > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_type=
s.bbclass
> > index 4fdcde2..138d7a5 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -254,10 +254,6 @@ IMAGE_TYPES =3D " \
> >      ubi ubifs multiubi \
> >      tar tar.gz tar.bz2 tar.xz tar.lz4 \
> >      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
> > -    vmdk \
> > -    vdi \
> > -    qcow2 \
> > -    hdddirect \
> >      elf \
> >      wic wic.gz wic.bz2 wic.lzma \
> >      container \
> > @@ -269,7 +265,7 @@ IMAGE_TYPES =3D " \
> >  # CONVERSION_CMD/DEPENDS.
> >  COMPRESSIONTYPES ?=3D ""
> >
> > -CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha=
224sum sha256sum sha384sum sha512sum bmap u-boot ${COMPRESSIONTYPES}"
> > +CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha=
224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 ${COMPRESSI=
ONTYPES}"
> >  CONVERSION_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFI=
X}.${type}"
> >  CONVERSION_CMD_gz =3D "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
=2E${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> >  CONVERSION_CMD_bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
=2E${type}"
> > @@ -287,6 +283,9 @@ CONVERSION_CMD_sha384sum =3D "sha384sum ${IMAGE_NAM=
E}${IMAGE_NAME_SUFFIX}.${type}
> >  CONVERSION_CMD_sha512sum =3D "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFF=
IX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
> >  CONVERSION_CMD_bmap =3D "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
> >  CONVERSION_CMD_u-boot =3D "mkimage -A ${UBOOT_ARCH} -O linux -T ramdis=
k -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${I=
MAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot"
> > +CONVERSION_CMD_vmdk =3D "qemu-img convert -O vmdk ${IMAGE_NAME}${IMAGE=
_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
> > +CONVERSION_CMD_vdi =3D "qemu-img convert -O vdi ${IMAGE_NAME}${IMAGE_N=
AME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
> > +CONVERSION_CMD_qcow2 =3D "qemu-img convert -O qcow2 ${IMAGE_NAME}${IMA=
GE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
> >  CONVERSION_DEPENDS_lzma =3D "xz-native"
> >  CONVERSION_DEPENDS_gz =3D "pigz-native"
> >  CONVERSION_DEPENDS_bz2 =3D "pbzip2-native"
> > @@ -297,6 +296,9 @@ CONVERSION_DEPENDS_zip =3D "zip-native"
> >  CONVERSION_DEPENDS_sum =3D "mtd-utils-native"
> >  CONVERSION_DEPENDS_bmap =3D "bmap-tools-native"
> >  CONVERSION_DEPENDS_u-boot =3D "u-boot-mkimage-native"
> > +CONVERSION_DEPENDS_vmdk =3D "qemu-native"
> > +CONVERSION_DEPENDS_vdi =3D "qemu-native"
> > +CONVERSION_DEPENDS_qcow2 =3D "qemu-native"
> >
> >  RUNNABLE_IMAGE_TYPES ?=3D "ext2 ext3 ext4"
> >  RUNNABLE_MACHINE_PATTERNS ?=3D "qemu"
> > diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b=
/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > index f145b5e..927a931 100644
> > --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > @@ -19,7 +19,7 @@ IMAGE_ROOTFS_EXTRA_SPACE =3D "41943040"
> >  APPEND +=3D "rootfstype=3Dext4 quiet"
> >
> >  DEPENDS =3D "zip-native python3-pip-native"
> > -IMAGE_FSTYPES =3D "vmdk"
> > +IMAGE_FSTYPES =3D "wic.vmdk"
> >
> >  inherit core-image module-base setuptools3
> >
> > @@ -120,7 +120,7 @@ create_bundle_files () {
> >         cd ${WORKDIR}
> >         mkdir -p Yocto_Build_Appliance
> >         cp *.vmx* Yocto_Build_Appliance
> > -       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.vmdk Yocto_Build_Appliance=
/Yocto_Build_Appliance.vmdk
> > +       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vm=
dk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
> >         zip -r ${IMGDEPLOYDIR}/Yocto_Build_Appliance-${DATETIME}.zip Yo=
cto_Build_Appliance
> >         ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${IMGDEPLOYDIR}/Yo=
cto_Build_Appliance.zip
> >  }
> > @@ -130,4 +130,4 @@ python do_bundle_files() {
> >      bb.build.exec_func('create_bundle_files', d)
> >  }
> >
> > -addtask bundle_files after do_vmimg before do_image_complete
> > +addtask bundle_files after do_image_wic before do_image_complete
>=20
> I know some people rely on DISK_SIGNATURE. Does DISK_SIGNATURE still
> work after this change?

It does not, because the code is gone.  Can you point me to users of it?
We could move it to the "common" file if there's users still.  FWIW, it
may be better to leverage the UUID support in wic.

--=20
Tom

--ucKxrLtqiGlSKUCp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZeyCTAAoJEIf59jXTHXZSL9IP/2y1Mo1/Y+7sNXlVeDjzz4Id
m0/oql6GLDL+3pAcrQjSuRrdl4jZxu+Aoq2xBxCHL68FdPuXCgGf/j24UKjSPfjN
/q6l0tlK/CnZ9dmavtaFyv3GbyBDlbGDH3+ArJcf25V2Kmd7Xep2zICFtubtQ+66
3Ir0zEpA5h5ILuCIsle3Qgt49guOF0VYRewH8wGXFdK5jJXHvDaTlQOhUb+daFYj
CAPGF9TmuavZ7Vtg3bv7T9wOnInpCl8q6g/BXqZw2Ui2Be6dHPaX9frBd6HHYr11
1gDRbdYtiFWSjPFvS9wradj+d81pag2bZqu04/UtaYvBefZbKUSZ2+tsaVKyAhnR
sw/W6S0z3Q00t/SukO1K8MCV5uyn2R5bF3EgBLnYH35x0jf+FmzmFhCmRh70srHI
oXhVMNGF52PDtiGfmNBQnZp5ZSLGTAuTA+Tf1kt9z+/zxnojWWbCwmaT8wV56Jxu
jy9OzM+8CVqGX1U96mQiwZqkxRjhIVaEa7ixQqIoYxnYOVGQZbdRR1H8/oIcGOm9
m+OSD0IObDiSxxL4ggjswh0yW22+RnD+7wkQQGmFZpeeLkDSmf9rP2NwAh15PHag
nj/5GhK++F6BAbLRbGZsr3qaIMykDPKJLqYOB+kFTwlhujELm7iIP+MT80Ddnej2
FUYGFxyiWBk/E+uLkG+A
=GPXl
-----END PGP SIGNATURE-----

--ucKxrLtqiGlSKUCp--
