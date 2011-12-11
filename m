Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RZgMT-00024l-33
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 11:10:25 +0100
Received: by eekb15 with SMTP id b15so2147422eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2011 02:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ksaOsoPeyUH4WpsriDEJ/0yrZhTXV9dCi3yCYTUvtns=;
	b=ueOnQRTJuj05eF9CloZD3gqzv0JPE5IBX2JiiFKir+CDRg9/9YI7uo946SjJE7e7LQ
	S3pu/WN/docyPBovtlOd7P8oLrsTtD52foL1KR3dy4DQ0qEN2Dam289uBYtve900nqLy
	PdG298BZYcwSmKXAanwVSOabDQiYGsAOE+l8Y=
Received: by 10.14.14.29 with SMTP id c29mr1869734eec.172.1323597810909;
	Sun, 11 Dec 2011 02:03:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z43sm46469193eef.7.2011.12.11.02.03.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 11 Dec 2011 02:03:28 -0800 (PST)
Date: Sun, 11 Dec 2011 11:03:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111211100325.GE3986@jama.jama.net>
References: <cover.1323212403.git.andrea.adami@gmail.com>
	<68e1fafa3ed455dd26cfbfe2a76b3cbdb5b7bfc2.1323212403.git.andrea.adami@gmail.com>
	<CA+M6bXmdt7UE+-HkLva9snnv=AJhhh0sxKSKCJhQOb58bNKGJQ@mail.gmail.com>
	<20111208151026.GC3761@jama.jama.net>
	<CAAQYJAuHVLo6A_cGXBVoq+3Tj863LRH+hu-6GtZeqo3_aJWYQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAuHVLo6A_cGXBVoq+3Tj863LRH+hu-6GtZeqo3_aJWYQA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] image_types.bbclass: implement jffs2 summary images (sum.jffs2)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Dec 2011 10:10:25 -0000
X-Groupsio-MsgNum: 14044
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Content-Disposition: inline

--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 08, 2011 at 10:30:27PM +0100, Andrea Adami wrote:
> On Thu, Dec 8, 2011 at 4:10 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Thu, Dec 08, 2011 at 07:57:52AM -0700, Tom Rini wrote:
> >> On Tue, Dec 6, 2011 at 4:23 PM, Andrea Adami <andrea.adami@gmail.com> =
wrote:
> >> > * Building the jffs2 filesystem to include summary information speed=
s up
> >> > * the mount process considerably at the cost of increased size.
> >> > * The rate of speedup is generally higher on NAND chips and on the c=
hips
> >> > * where the erase block size is large.
> >> >
> >> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> >
> > I'll repeat my comment from yesterday, but IMHO it would be easier to
> > see the difference between those 2 images if the IMAGE_CMD_jffs2 output=
 is
> > renamed to .jffs2.nosummary and IMAGE_CMD_sum.jffs2 (or renamed IMAGE_C=
MD_jffs2.summary)
> > produces .jffs2.summary (or even just .jffs2 if we can agree that .summ=
ary is
> > what enduser wants by default)
>=20
> I tried to keep the patch not too invasive and did not introduce a
> special EXTRA string for sumtool.
> The most widely used options (-p -l -e) are common, though.
>=20
> Unfortunately summary means we have a bigger image:
> 44M Dec  8 16:14 core-image-sato-c7x0-20111208151047.rootfs.jffs2
> 57M Dec  8 16:14 core-image-sato-c7x0-20111208151047.rootfs.sum.jffs2
>=20
> Being some devices have strict size requirements I think it is better
> to build both kind of images.

Today I've noticed that it doesn't work for me:

I have changed EXTRA_IMAGECMD_jffs2 to use new sum.jffs2:
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dblobdiff;f=3Dme=
ta-openmoko/conf/machine/om-gta02.conf;h=3Dad71d3db386b7d7df6ab484ea9ad8026=
0da30373;hp=3D7cfb1b2a07b09ac3a35a27d209015ea8533ff632;hb=3D26d60e47358abe6=
6d7d0fdbe6d5adea8f46bdbe2;hpb=3D043b5ac84794946e88e880b722fed445d3d985c5

OE om-gta02@shr ~/shr-core $ bitbake -e shr-lite-image | tee -a image.log

OE om-gta02@shr ~/shr-core $ grep ^EXTRA_IMAGECMD image.log | grep jffs2
EXTRA_IMAGECMD_sum.jffs2=3D"--eraseblock=3D0x20000 --no-cleanmarkers --litt=
leendian --pad"
EXTRA_IMAGECMD_jffs2=3D"--little-endian --eraseblock=3D0x20000 --pagesize=
=3D0x800 --no-cleanmarkers --pad; mv /OE/shr-core/tmp-eglibc/deploy/images/=
om-gta02/shr-lite-20111211-om-gta02.rootfs.jffs2 /OE/shr-core/tmp-eglibc/de=
ploy/images/om-gta02/shr-lite-20111211-om-gta02.rootfs.jffs2.nosummary;"

This looks right (notice that sumtool is using different --little-endian/--=
littleendian).

OE om-gta02@shr ~/shr-core $ grep IMAGE_CMD image.log | grep jffs2
# IMAGE_CMD_sum.jffs2=3D${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE=
}/${IMAGE_NAME}.rootfs.jffs2   -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.=
sum.jffs2 -n ${EXTRA_IMAGECMD}
IMAGE_CMD_sum.jffs2=3D"mkfs.jffs2 --root=3D/OE/shr-core/tmp-eglibc/work/om_=
gta02-oe-linux-gnueabi/shr-lite-image/2.0-r20/rootfs --faketime --output=3D=
/OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-lite-20111211-om-gta02.r=
ootfs.jffs2 -n  && sumtool -i /OE/shr-core/tmp-eglibc/deploy/images/om-gta0=
2/shr-lite-20111211-om-gta02.rootfs.jffs2      -o /OE/shr-core/tmp-eglibc/d=
eploy/images/om-gta02/shr-lite-20111211-om-gta02.rootfs.sum.jffs2 -n"
# IMAGE_CMD_jffs2=3Dmkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime --output=
=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}
IMAGE_CMD_jffs2=3D"mkfs.jffs2 --root=3D/OE/shr-core/tmp-eglibc/work/om_gta0=
2-oe-linux-gnueabi/shr-lite-image/2.0-r20/rootfs --faketime --output=3D/OE/=
shr-core/tmp-eglibc/deploy/images/om-gta02/shr-lite-20111211-om-gta02.rootf=
s.jffs2 -n"

Here we can see that bitbake -e didn't expand EXTRA_IMAGECMD right, but it =
seems like do_rootfs have them not empty:

shr-core/tmp/work/om_gta02-oe-linux-gnueabi/shr-image/2.0-r18/temp/run.do_r=
ootfs.688:
        # Image generation code for image type sum.jffs2
        ROOTFS_SIZE=3D`du -ks /OE/shr-core/tmp/work/om_gta02-oe-linux-gnuea=
bi/shr-image/2.0-r18/rootfs|awk '{size =3D $1 * 1.3 + 0; OFMT =3D "%.0f" ; =
print (size > 65536 ? size : 65536) }'`
        mkfs.jffs2 --root=3D/OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi=
/shr-image/2.0-r18/rootfs --faketime --output=3D/OE/shr-core/tmp/deploy/ima=
ges/om-gta02/shr-full-20111210-om-gta02.rootfs.jffs2 -n --eraseblock=3D0x20=
000 --no-cleanmarkers --littleendian --pad  && sumtool -i /OE/shr-core/tmp/=
deploy/images/om-gta02/shr-full-20111210-om-gta02.rootfs.jffs2    -o /OE/sh=
r-core/tmp/deploy/images/om-gta02/shr-full-20111210-om-gta02.rootfs.sum.jff=
s2 -n --eraseblock=3D0x20000 --no-cleanmarkers --littleendian --pad
        cd /OE/shr-core/tmp/deploy/images/om-gta02/
        rm -f /OE/shr-core/tmp/deploy/images/om-gta02/full-om-gta02.sum.jff=
s2
        ln -s shr-full-20111210-om-gta02.rootfs.sum.jffs2 /OE/shr-core/tmp/=
deploy/images/om-gta02/full-om-gta02.sum.jffs2

Notice that IMAGE_CMD_jffs2 is using EXTRA_IMAGECMD_sum.jffs2 (so params fo=
r sumtool not mkfs.jffs2) when it's expanded=20
inside IMAGE_CMD_sum.jffs2 variable

openembedded-core/meta/classes/image_types.bbclass:
IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime --outpu=
t=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}"
IMAGE_CMD_sum.jffs2 =3D "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAG=
E}/${IMAGE_NAME}.rootfs.jffs2 \
        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 -n ${EXTRA_IM=
AGECMD}"

And causing
mkfs.jffs2: unrecognized option '--littleendian'
mkfs.jffs2: error!: Usage: mkfs.jffs2 [OPTIONS]

And using EXTRA_IMAGECMD_jffs2 in IMAGE_CMD_jffs2 breaks parsing..

ERROR: Unable to parse /OE/shr-core/openembedded-core/meta/recipes-core/ima=
ges/core-image-minimal-initramfs.bb                                        =
                                                                       | ET=
A:  --:--:--
Traceback (most recent call last):
  File "/usr/lib64/python2.7/site-packages/bb/codeparser.py", line 268, in =
ShellParser.parse_shell(value=3D'\t#set -x\n\trm -rf /OE/shr-core/tmp-eglib=
c/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs=
\n\trm -rf /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-imag=
e-minimal-initramfs/1.0-r0/multilib\n\tmkdir -p /OE/shr-core/tmp-eglibc/wor=
k/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs\n\tm=
kdir -p /OE/shr-core/tmp-eglibc/deploy/images/om-gta02\n\n\tcp /OE/shr-core=
/openembedded-core/meta/files/deploydir_readme.txt /OE/shr-core/tmp-eglibc/=
deploy/images/om-gta02/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt\n=
\n\tif [ "0" !=3D "1" ]; then\n\t\tfor devtable in  /OE/shr-core/meta-handh=
eld/files/device_table-minimal.txt; do\n\t\t\tmakedevs -r /OE/shr-core/tmp-=
eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/r=
ootfs -D $devtable\n\t\tdone\n\tfi\n\n\trootfs_ipk_do_rootfs\n\n\tinsert_fe=
ed_uris\n\n\tif [ "xldconfig-native:do_populate_sysroot" !=3D "x" ]; then\n=
\t\t# Run ldconfig on the image to create a valid cache\n\t\t# (new format =
for cross arch compatibility)\n\t\techo executing: ldconfig -r /OE/shr-core=
/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0=
-r0/rootfs -c new -v\n\t\tldconfig -r /OE/shr-core/tmp-eglibc/work/om_gta02=
-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs -c new -v\n\tf=
i\n\n\t# (re)create kernel modules dependencies\n\t# This part is done by k=
ernel-module-* postinstall scripts but if image do\n\t# not contains module=
s at all there are few moments in boot sequence with\n\t# "unable to open m=
odules.dep" message.\n\tif [ -e /OE/shr-core/tmp-eglibc/sysroots/om-gta02/k=
ernel/kernel-abiversion ]; then\n\t\tKERNEL_VERSION=3D`cat /OE/shr-core/tmp=
-eglibc/sysroots/om-gta02/kernel/kernel-abiversion`\n\n\t\tmkdir -p /OE/shr=
-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramf=
s/1.0-r0/rootfs/lib/modules/$KERNEL_VERSION\n\t\tarm-oe-linux-gnueabi-depmo=
d -a -b /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-m=
inimal-initramfs/1.0-r0/rootfs -F /OE/shr-core/tmp-eglibc/sysroots/om-gta02=
/kernel/System.map-$KERNEL_VERSION $KERNEL_VERSION\n\tfi\n\n\t${IMAGE_PREPR=
OCESS_COMMAND}\n\n\t\n\t# Image generation code for image type cpio.gz\n\tR=
OOTFS_SIZE=3D`du -ks /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi=
/core-image-minimal-initramfs/1.0-r0/rootfs|awk \'{size =3D $1 * 1.3 + 0; O=
FMT =3D "%.0f" ; print (size > 8192 ? size : 8192) }\'`\n\tcd /OE/shr-core/=
tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-=
r0/rootfs && (find . | cpio -o -H newc | gzip -c -9 >/OE/shr-core/tmp-eglib=
c/deploy/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om-gta02=
=2Erootfs.cpio.gz)\n\tcd /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/\n\=
trm -f /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/core-image-minimal-in=
itramfs-om-gta02.cpio.gz\n\tln -s shr-core-image-minimal-initramfs-20111211=
-om-gta02.rootfs.cpio.gz /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/cor=
e-image-minimal-initramfs-om-gta02.cpio.gz\n\t# Image generation code for i=
mage type tar.gz\n\tROOTFS_SIZE=3D`du -ks /OE/shr-core/tmp-eglibc/work/om_g=
ta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs|awk \'{siz=
e =3D $1 * 1.3 + 0; OFMT =3D "%.0f" ; print (size > 8192 ? size : 8192) }\'=
`\n\tcd /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-m=
inimal-initramfs/1.0-r0/rootfs && tar -zcvf /OE/shr-core/tmp-eglibc/deploy/=
images/om-gta02/shr-core-image-minimal-initramfs-20111211-om-gta02.rootfs.t=
ar.gz .\n\tcd /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/\n\trm -f /OE/=
shr-core/tmp-eglibc/deploy/images/om-gta02/core-image-minimal-initramfs-om-=
gta02.tar.gz\n\tln -s shr-core-image-minimal-initramfs-20111211-om-gta02.ro=
otfs.tar.gz /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/core-image-minim=
al-initramfs-om-gta02.tar.gz\n\t# Image generation code for image type sum.=
jffs2\n\tROOTFS_SIZE=3D`du -ks /OE/shr-core/tmp-eglibc/work/om_gta02-oe-lin=
ux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs|awk \'{size =3D $1 * =
1.3 + 0; OFMT =3D "%.0f" ; print (size > 8192 ? size : 8192) }\'`\n\tmkfs.j=
ffs2 --root=3D/OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-i=
mage-minimal-initramfs/1.0-r0/rootfs --faketime --output=3D/OE/shr-core/tmp=
-eglibc/deploy/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om=
-gta02.rootfs.jffs2 -n --little-endian --eraseblock=3D0x20000 --pagesize=3D=
0x800 --no-cleanmarkers --pad; mv /OE/shr-core/tmp-eglibc/deploy/images/om-=
gta02/shr-core-image-minimal-initramfs-20111211-om-gta02.rootfs.jffs2 /OE/s=
hr-core/tmp-eglibc/deploy/images/om-gta02/shr-core-image-minimal-initramfs-=
20111211-om-gta02.rootfs.jffs2.nosummary; && sumtool -i /OE/shr-core/tmp-eg=
libc/deploy/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om-gt=
a02.rootfs.jffs2 \t-o /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-co=
re-image-minimal-initramfs-20111211-om-gta02.rootfs.sum.jffs2 -n --eraseblo=
ck=3D0x20000 --no-cleanmarkers --littleendian --pad \n\tcd /OE/shr-core/tmp=
-eglibc/deploy/images/om-gta02/\n\trm -f /OE/shr-core/tmp-eglibc/deploy/ima=
ges/om-gta02/core-image-minimal-initramfs-om-gta02.sum.jffs2\n\tln -s shr-c=
ore-image-minimal-initramfs-20111211-om-gta02.rootfs.sum.jffs2 /OE/shr-core=
/tmp-eglibc/deploy/images/om-gta02/core-image-minimal-initramfs-om-gta02.su=
m.jffs2\n\n\n\t   do_testlab ;\n\n\t\n'):
             try:
    >            tokens, _ =3D pyshyacc.parse(value, eof=3DTrue, debug=3DFa=
lse)
             except pyshlex.NeedMore:
  File "/usr/lib64/python2.7/site-packages/bb/pysh/pyshyacc.py", line 673, =
in parse(input=3D'\t#set -x\n\trm -rf /OE/shr-core/tmp-eglibc/work/om_gta02=
-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs\n\trm -rf /OE/=
shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initr=
amfs/1.0-r0/multilib\n\tmkdir -p /OE/shr-core/tmp-eglibc/work/om_gta02-oe-l=
inux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs\n\tmkdir -p /OE/shr=
-core/tmp-eglibc/deploy/images/om-gta02\n\n\tcp /OE/shr-core/openembedded-c=
ore/meta/files/deploydir_readme.txt /OE/shr-core/tmp-eglibc/deploy/images/o=
m-gta02/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt\n\n\tif [ "0" !=
=3D "1" ]; then\n\t\tfor devtable in  /OE/shr-core/meta-handheld/files/devi=
ce_table-minimal.txt; do\n\t\t\tmakedevs -r /OE/shr-core/tmp-eglibc/work/om=
_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs -D $devt=
able\n\t\tdone\n\tfi\n\n\trootfs_ipk_do_rootfs\n\n\tinsert_feed_uris\n\n\ti=
f [ "xldconfig-native:do_populate_sysroot" !=3D "x" ]; then\n\t\t# Run ldco=
nfig on the image to create a valid cache\n\t\t# (new format for cross arch=
 compatibility)\n\t\techo executing: ldconfig -r /OE/shr-core/tmp-eglibc/wo=
rk/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs -c =
new -v\n\t\tldconfig -r /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnue=
abi/core-image-minimal-initramfs/1.0-r0/rootfs -c new -v\n\tfi\n\n\t# (re)c=
reate kernel modules dependencies\n\t# This part is done by kernel-module-*=
 postinstall scripts but if image do\n\t# not contains modules at all there=
 are few moments in boot sequence with\n\t# "unable to open modules.dep" me=
ssage.\n\tif [ -e /OE/shr-core/tmp-eglibc/sysroots/om-gta02/kernel/kernel-a=
biversion ]; then\n\t\tKERNEL_VERSION=3D`cat /OE/shr-core/tmp-eglibc/sysroo=
ts/om-gta02/kernel/kernel-abiversion`\n\n\t\tmkdir -p /OE/shr-core/tmp-egli=
bc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootf=
s/lib/modules/$KERNEL_VERSION\n\t\tarm-oe-linux-gnueabi-depmod -a -b /OE/sh=
r-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initram=
fs/1.0-r0/rootfs -F /OE/shr-core/tmp-eglibc/sysroots/om-gta02/kernel/System=
=2Emap-$KERNEL_VERSION $KERNEL_VERSION\n\tfi\n\n\t${IMAGE_PREPROCESS_COMMAN=
D}\n\n\t\n\t# Image generation code for image type cpio.gz\n\tROOTFS_SIZE=
=3D`du -ks /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-imag=
e-minimal-initramfs/1.0-r0/rootfs|awk \'{size =3D $1 * 1.3 + 0; OFMT =3D "%=
=2E0f" ; print (size > 8192 ? size : 8192) }\'`\n\tcd /OE/shr-core/tmp-egli=
bc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootf=
s && (find . | cpio -o -H newc | gzip -c -9 >/OE/shr-core/tmp-eglibc/deploy=
/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om-gta02.rootfs.=
cpio.gz)\n\tcd /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/\n\trm -f /OE=
/shr-core/tmp-eglibc/deploy/images/om-gta02/core-image-minimal-initramfs-om=
-gta02.cpio.gz\n\tln -s shr-core-image-minimal-initramfs-20111211-om-gta02.=
rootfs.cpio.gz /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/core-image-mi=
nimal-initramfs-om-gta02.cpio.gz\n\t# Image generation code for image type =
tar.gz\n\tROOTFS_SIZE=3D`du -ks /OE/shr-core/tmp-eglibc/work/om_gta02-oe-li=
nux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs|awk \'{size =3D $1 *=
 1.3 + 0; OFMT =3D "%.0f" ; print (size > 8192 ? size : 8192) }\'`\n\tcd /O=
E/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-ini=
tramfs/1.0-r0/rootfs && tar -zcvf /OE/shr-core/tmp-eglibc/deploy/images/om-=
gta02/shr-core-image-minimal-initramfs-20111211-om-gta02.rootfs.tar.gz .\n\=
tcd /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/\n\trm -f /OE/shr-core/t=
mp-eglibc/deploy/images/om-gta02/core-image-minimal-initramfs-om-gta02.tar.=
gz\n\tln -s shr-core-image-minimal-initramfs-20111211-om-gta02.rootfs.tar.g=
z /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/core-image-minimal-initram=
fs-om-gta02.tar.gz\n\t# Image generation code for image type sum.jffs2\n\tR=
OOTFS_SIZE=3D`du -ks /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi=
/core-image-minimal-initramfs/1.0-r0/rootfs|awk \'{size =3D $1 * 1.3 + 0; O=
FMT =3D "%.0f" ; print (size > 8192 ? size : 8192) }\'`\n\tmkfs.jffs2 --roo=
t=3D/OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minim=
al-initramfs/1.0-r0/rootfs --faketime --output=3D/OE/shr-core/tmp-eglibc/de=
ploy/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om-gta02.roo=
tfs.jffs2 -n --little-endian --eraseblock=3D0x20000 --pagesize=3D0x800 --no=
-cleanmarkers --pad; mv /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-=
core-image-minimal-initramfs-20111211-om-gta02.rootfs.jffs2 /OE/shr-core/tm=
p-eglibc/deploy/images/om-gta02/shr-core-image-minimal-initramfs-20111211-o=
m-gta02.rootfs.jffs2.nosummary; && sumtool -i /OE/shr-core/tmp-eglibc/deplo=
y/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om-gta02.rootfs=
=2Ejffs2 \t-o /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-core-image=
-minimal-initramfs-20111211-om-gta02.rootfs.sum.jffs2 -n --eraseblock=3D0x2=
0000 --no-cleanmarkers --littleendian --pad \n\tcd /OE/shr-core/tmp-eglibc/=
deploy/images/om-gta02/\n\trm -f /OE/shr-core/tmp-eglibc/deploy/images/om-g=
ta02/core-image-minimal-initramfs-om-gta02.sum.jffs2\n\tln -s shr-core-imag=
e-minimal-initramfs-20111211-om-gta02.rootfs.sum.jffs2 /OE/shr-core/tmp-egl=
ibc/deploy/images/om-gta02/core-image-minimal-initramfs-om-gta02.sum.jffs2\=
n\n\n\t   do_testlab ;\n\n\t\n', eof=3DTrue, debug=3DFalse):
             debug =3D 2
    >    return yacc.parse(lexer=3Dlexer, debug=3Ddebug), remaining

  File "/usr/lib64/python2.7/site-packages/ply/yacc.py", line 265, in LRPar=
ser.parse(input=3DNone, lexer=3D<bb.pysh.pyshlex.PLYLexer instance at 0x963=
8248>, debug=3DFalse, tracking=3D0, tokenfunc=3DNone):
             else:
    >            return self.parseopt_notrack(input,lexer,debug,tracking,to=
kenfunc)

  File "/usr/lib64/python2.7/site-packages/ply/yacc.py", line 1047, in LRPa=
rser.parseopt_notrack(input=3DNone, lexer=3D<bb.pysh.pyshlex.PLYLexer insta=
nce at 0x9638248>, debug=3DFalse, tracking=3D0, tokenfunc=3DNone):
                                 errtoken.lexer =3D lexer
    >                        tok =3D self.errorfunc(errtoken)
                             del errok, token, restart   # Delete special f=
unctions
  File "/usr/lib64/python2.7/site-packages/bb/pysh/pyshyacc.py", line 646, =
in p_error(p=3DLexToken(AND_IF,'&&',0,0)):
             w('  %r\n' % n)
    >    raise sherrors.ShellSyntaxError(''.join(msg))

ShellSyntaxError: LexToken(AND_IF,'&&',0,0)
followed by:
  LexToken(TOKEN,'sumtool',0,0)
  LexToken(TOKEN,'-i',0,0)
  LexToken(TOKEN,'/OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-core-i=
mage-minimal-initramfs-20111211-om-gta02.rootfs.jffs2',0,0)
  LexToken(TOKEN,'-o',0,0)
  LexToken(TOKEN,'/OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-core-i=
mage-minimal-initramfs-20111211-om-gta02.rootfs.sum.jffs2',0,0)



>=20
> Cheers
>=20
> Andrea
>=20
> >
> > But other than that it looks fine and will make my IMAGE_DEPENDS_jffs2 a
> > bit shorter.
> >
> > Regards,
> >
> >>
> >> Acked-by: Tom Rini <tom.rini@gmail.com>
> >>
> >> > ---
> >> > =A0meta/classes/image_types.bbclass | =A0 =A05 ++++-
> >> > =A01 files changed, 4 insertions(+), 1 deletions(-)
> >> >
> >> > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_t=
ypes.bbclass
> >> > index 29b6380..bd4b7bc 100644
> >> > --- a/meta/classes/image_types.bbclass
> >> > +++ b/meta/classes/image_types.bbclass
> >> > @@ -35,6 +35,8 @@ XZ_COMPRESSION_LEVEL ?=3D "-e -9"
> >> > =A0XZ_INTEGRITY_CHECK ?=3D "crc32"
> >> >
> >> > =A0IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketi=
me --output=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGEC=
MD}"
> >> > +IMAGE_CMD_sum.jffs2 =3D "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_=
DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
> >> > + =A0 =A0 =A0 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 =
${EXTRA_IMAGECMD}"
> >> >
> >> > =A0IMAGE_CMD_cramfs =3D "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE=
}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
> >> >
> >> > @@ -138,6 +140,7 @@ EXTRA_IMAGECMD_btrfs ?=3D ""
> >> >
> >> > =A0IMAGE_DEPENDS =3D ""
> >> > =A0IMAGE_DEPENDS_jffs2 =3D "mtd-utils-native"
> >> > +IMAGE_DEPENDS_sum.jffs2 =3D "mtd-utils-native"
> >> > =A0IMAGE_DEPENDS_cramfs =3D "cramfs-native"
> >> > =A0IMAGE_DEPENDS_ext2 =3D "genext2fs-native"
> >> > =A0IMAGE_DEPENDS_ext2.gz =3D "genext2fs-native"
> >> > @@ -157,4 +160,4 @@ IMAGE_DEPENDS_ubi =3D "mtd-utils-native"
> >> > =A0IMAGE_DEPENDS_ubifs =3D "mtd-utils-native"
> >> >
> >> > =A0# This variable is available to request which values are suitable=
 for IMAGE_FSTYPES
> >> > -IMAGE_TYPES =3D "jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ex=
t2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio=
=2Egz cpio.xz cpio.lzma"
> >> > +IMAGE_TYPES =3D "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 =
ext3.gz ext2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz=
 cpio cpio.gz cpio.xz cpio.lzma"
> >> > --
> >> > 1.7.3.4
> >> >
> >> >
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>
> >>
> >>
> >> --
> >> Tom
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7kf+0ACgkQN1Ujt2V2gByCzgCfb7nZsVrumLftfH+jivvr+fTT
hf4An3AsDu/rfWYWyByNwZsowxIUlpIE
=gV+k
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--
