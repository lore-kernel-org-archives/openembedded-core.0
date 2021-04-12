Subject: Initramfs with OpenSBI for a RISCV SoC
To: openembedded-core@lists.openembedded.org
From: sathishmls@yahoo.com
X-Originating-Location: Chennai, Tamil Nadu, IN (117.248.33.6)
X-Originating-Platform: Linux Firefox 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 12 Apr 2021 10:28:05 -0700
Message-ID: <D3Uc.1618248485581174676.TPEa@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="c5snoNkPIGVvnZTzkYJh"

--c5snoNkPIGVvnZTzkYJh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

i pulled openembedded-core, meta-openembedded, meta-riscv layers
In build/local/auto.conf, added INITRAMFS_IMAGE =3D "core-image-minimal-in=
itramfs" and INITRAMFS_IMAGE_BUNDLE =3D "1"
I created core-image-minimal-initramfs.bbappend with adding riscv to COMPA=
TIBLE_HOST

trying to build with "bitbake riscv-initramfs-image"

(without adding INITRAMFS_IMAGE in build/local/auto.conf, able to get succ=
essfully the kernel Image files, dtbs, riscv-initramfs-image-mach1-???????.=
rootfs.cpio.gz, except initramfs is NOT bundled along with the kernel Image=
 which i want)

getting the following circular dependency error

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
Task /media/meta-mach1/recipes-kernel/linux/linux-mainline_5.11.bb:do_bund=
le_initramfs (dependent Tasks ['linux-mainline_5.11.bb:do_install', 'core-i=
mage-minimal-initramfs.bb:do_image_complete'])
Task /media/meta-mach1/recipes-kernel/linux/linux-mainline_5.11.bb:do_depl=
oy (dependent Tasks ['linux-mainline_5.11.bb:do_bundle_initramfs', 'pigz_2.=
6.bb:do_populate_sysroot', 'linux-mainline_5.11.bb:do_packagedata', 'depmod=
wrapper-cross_1.0.bb:do_populate_sysroot', 'linux-mainline_5.11.bb:do_popul=
ate_sysroot'])
Task /media/openembedded-core/meta/recipes-bsp/opensbi/opensbi_0.9.bb:do_c=
ompile (dependent Tasks ['linux-mainline_5.11.bb:do_deploy', 'opensbi_0.9.b=
b:do_configure'])
Task /media/openembedded-core/meta/recipes-bsp/opensbi/opensbi_0.9.bb:do_i=
nstall (dependent Tasks ['opensbi_0.9.bb:do_compile', 'pseudo_git.bb:do_pop=
ulate_sysroot'])
Task /media/openembedded-core/meta/recipes-bsp/opensbi/opensbi_0.9.bb:do_p=
opulate_sysroot (dependent Tasks ['opensbi_0.9.bb:do_install', 'binutils-cr=
oss_2.36.bb:do_populate_sysroot'])
Task /media/openembedded-core/meta/recipes-core/images/core-image-minimal-=
initramfs.bb:do_image_complete (dependent Tasks ['opensbi_0.9.bb:do_populat=
e_sysroot', 'core-image-minimal-initramfs.bb:do_image_cpio', 'core-image-mi=
nimal-initramfs.bb:do_image'])

ERROR: Command execution failed: 1

Please suggest

--c5snoNkPIGVvnZTzkYJh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />i pulled openembedded-core, meta-openembedded, meta-riscv la=
yers<br />In build/local/auto.conf, added INITRAMFS_IMAGE =3D "core-image-m=
inimal-initramfs" and INITRAMFS_IMAGE_BUNDLE =3D "1"<br />I created core-im=
age-minimal-initramfs.bbappend with adding riscv to COMPATIBLE_HOST<br /><b=
r />trying to build with "bitbake riscv-initramfs-image"<br /><br />(withou=
t adding INITRAMFS_IMAGE in build/local/auto.conf, able to get successfully=
 the kernel Image files, dtbs, riscv-initramfs-image-mach1-???????.rootfs.c=
pio.gz, except initramfs is NOT bundled along with the kernel Image which i=
 want)<br /><br />getting the following circular dependency error<br /><br =
/>Identifying dependency loops (this may take a short while)...<br /><br />=
ERROR: <br />Dependency loop #1 found:<br />&nbsp; Task /media/meta-mach1/r=
ecipes-kernel/linux/linux-mainline_5.11.bb:do_bundle_initramfs (dependent T=
asks ['linux-mainline_5.11.bb:do_install', 'core-image-minimal-initramfs.bb=
:do_image_complete'])<br />&nbsp; Task /media/meta-mach1/recipes-kernel/lin=
ux/linux-mainline_5.11.bb:do_deploy (dependent Tasks ['linux-mainline_5.11.=
bb:do_bundle_initramfs', 'pigz_2.6.bb:do_populate_sysroot', 'linux-mainline=
_5.11.bb:do_packagedata', 'depmodwrapper-cross_1.0.bb:do_populate_sysroot',=
 'linux-mainline_5.11.bb:do_populate_sysroot'])<br />&nbsp; Task /media/ope=
nembedded-core/meta/recipes-bsp/opensbi/opensbi_0.9.bb:do_compile (dependen=
t Tasks ['linux-mainline_5.11.bb:do_deploy', 'opensbi_0.9.bb:do_configure']=
)<br />&nbsp; Task /media/openembedded-core/meta/recipes-bsp/opensbi/opensb=
i_0.9.bb:do_install (dependent Tasks ['opensbi_0.9.bb:do_compile', 'pseudo_=
git.bb:do_populate_sysroot'])<br />&nbsp; Task /media/openembedded-core/met=
a/recipes-bsp/opensbi/opensbi_0.9.bb:do_populate_sysroot (dependent Tasks [=
'opensbi_0.9.bb:do_install', 'binutils-cross_2.36.bb:do_populate_sysroot'])=
<br />&nbsp; Task /media/openembedded-core/meta/recipes-core/images/core-im=
age-minimal-initramfs.bb:do_image_complete (dependent Tasks ['opensbi_0.9.b=
b:do_populate_sysroot', 'core-image-minimal-initramfs.bb:do_image_cpio', 'c=
ore-image-minimal-initramfs.bb:do_image'])<br /><br /><br />ERROR: Command =
execution failed: 1<br /><br />Please suggest

--c5snoNkPIGVvnZTzkYJh--
