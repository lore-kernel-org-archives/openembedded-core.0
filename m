Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC546E630;
	Thu, 18 Aug 2016 10:43:48 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so4852532wmf.3;
	Thu, 18 Aug 2016 03:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Pkr0PYdC4m5ttqstWoH82SFKneRUDZ3YTCFl3VgnIRk=;
	b=ZPFEgeNMYnHrKbxl/LTidlGhF5LkTADHWCU2oOvke8kmPueZdwO8rjVQ0nma/UvmKg
	klpp5quZQwYe4INX7xM3erOqenC1Icwr8A/3xVcLLFlyxd9fTW4JR2SkNGkBX9ye79cy
	wC5T4Sz+0prPhD7vY5KJfbXeGeC8iIPAyz9Y3lhofiEXOPZJGsVTrJ4IqrigNPb7yfC5
	6zPg5HRKJXujWd6wbQJNmtj3rxUA5YY/rezwzdFTyKDfvCxOgz/IHwt07hLe+DWOg54X
	Sin0fNPL2BIS49cIf5Q5rPRc/SRnRzOWLG036mxl923WiP+mjIdZWbklfUZhHTFXpbv0
	7P6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Pkr0PYdC4m5ttqstWoH82SFKneRUDZ3YTCFl3VgnIRk=;
	b=BPFWbc6it2CD1EJPL45VJWanViam0m7+p0H2pvq6tdSVfF4WH5Fgo9uR610qvGQRFL
	5NzbG85LVEAkptBlW0wCiPCZDyKc/kFj+eof1YTB0XnfTwzJkmQy7l9AXZSxhcSX2mE1
	hi0uVmc0gpbN5eiSoDZA94JjhbYobnihZgMc3YNBIe1ThClsQFasWLqb2zAoAxF+KCad
	0wZ2lLN6wEpg9fMPX49ztrFt0MPo4RD89EwTz/F89h0RPC6lsvRkyFNJtjO31STN2JJo
	0GkJJ9dGmOFXST5njSkJE0qbE2FNRIVDDtjUjCtjF7jI0RL8v4EcMJcnFo92oaZuwgXr
	TCSQ==
X-Gm-Message-State: AEkoousortmH+fKv+dIsRxvDFZFtrV6Otk8uQrcq2LGrGs8IUINzRkT1tiX4ZNKw95YDNA==
X-Received: by 10.194.43.9 with SMTP id s9mr1633653wjl.46.1471517028195;
	Thu, 18 Aug 2016 03:43:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	pm1sm1614579wjb.40.2016.08.18.03.43.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Aug 2016 03:43:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Aug 2016 12:43:45 +0200
To: openembedded-core@lists.openembedded.org,
	Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20160818104345.phhq2zb6sipghcps@jama>
References: <20160818082830.23452.83948@opal.openembedded.org>
	<20160818082834.126FB50357@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160818082834.126FB50357@opal.openembedded.org>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 15/20: image.bbclass: rename COMPRESS(ION) to CONVERSION
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
X-List-Received-Date: Thu, 18 Aug 2016 10:43:49 -0000
X-Groupsio-MsgNum: 85882
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fvx7lvdic6bgip5w"
Content-Disposition: inline

--fvx7lvdic6bgip5w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 08:28:45AM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit 9d68c024790850cab72ead1e3372a5fcec4ef7b0
> Author: Patrick Ohly <patrick.ohly@intel.com>
> AuthorDate: Fri Jul 29 17:58:52 2016 +0300
>=20
>     image.bbclass: rename COMPRESS(ION) to CONVERSION
>    =20
>     With the enhanced functionality, the term "compression" is no longer
>     accurate, because the mechanism also gets used for conversion
>     operations that do not actually compress data.
>    =20
>     It is possible to remove this naming problem in a backward-compatible
>     manner by including COMPRESSIONTYPES in CONVERSIONTYPES and checking =
for
>     the old COMPRESS_CMD/DEPENDS as fallbacks.

This doesn't seem to work:

Parsing recipes...ERROR: meta-foo/recipes-core/images/foo-image-devel.bb: N=
o IMAGE_CMD defined for IMAGE_FSTYPES entry 'squashfs.epk' - possibly inval=
id type name or missing support class

Either fix the backward-compatibility or maybe better add bb.error when
COMPRESSIONTYPES is defined asking user to migrate to CONVERSION
variables.

>     [YOCTO #9346]
>    =20
>     Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>     Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/image.bbclass             |  9 +++---
>  meta/classes/image_types.bbclass       | 50 +++++++++++++++++-----------=
------
>  meta/classes/image_types_uboot.bbclass | 18 ++++++------
>  3 files changed, 39 insertions(+), 38 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index af789f4..c06dee2 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -118,7 +118,7 @@ def rootfs_variables(d):
>                   'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','=
IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_IN=
STALL_COMPLEMENTARY','IMAGE_LINGUAS',
>                   'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB=
_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIAN=
TS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
>                   'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARG=
ET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI=
','INTERCEPT_DIR','USE_DEVFS',
> -                 'COMPRESSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNN=
EEDED']
> +                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNE=
EDED']
>      variables.extend(rootfs_command_variables(d))
>      variables.extend(variable_depends(d))
>      return " ".join(variables)
> @@ -343,7 +343,7 @@ python setup_debugfs () {
> =20
>  python () {
>      vardeps =3D set()
> -    # We allow COMPRESSIONTYPES to have duplicates. That avoids breaking
> +    # We allow CONVERSIONTYPES to have duplicates. That avoids breaking
>      # derived distros when OE-core or some other layer independently adds
>      # the same type. There is still only one command for each type, but
>      # presumably the commands will do the same when the type is the same,
> @@ -351,7 +351,7 @@ python () {
>      #
>      # Without de-duplication, gen_conversion_cmds() below
>      # would create the same compression command multiple times.
> -    ctypes =3D set(d.getVar('COMPRESSIONTYPES', True).split())
> +    ctypes =3D set(d.getVar('CONVERSIONTYPES', True).split())
>      old_overrides =3D d.getVar('OVERRIDES', 0)
> =20
>      def _image_base_type(type):
> @@ -456,9 +456,10 @@ python () {
>                      # Create input image first.
>                      gen_conversion_cmds(type)
>                      localdata.setVar('type', type)
> -                    cmd =3D "\t" + localdata.getVar("COMPRESS_CMD_" + ct=
ype, True)
> +                    cmd =3D "\t" + (localdata.getVar("CONVERSION_CMD_" +=
 ctype, True) or localdata.getVar("COMPRESS_CMD_" + ctype, True))
>                      if cmd not in cmds:
>                          cmds.append(cmd)
> +                    vardeps.add('CONVERSION_CMD_' + ctype)
>                      vardeps.add('COMPRESS_CMD_' + ctype)
>                      subimage =3D type + "." + ctype
>                      if subimage not in subimages:
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
> index 2b97397..4d92866 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -29,7 +29,7 @@ def imagetypes_getdepends(d):
>          for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True=
) or "").split():
>              adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True) , de=
ps)
>          for ctype in resttypes:
> -            adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
> +            adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype, True), deps)
> =20
>      # Sort the set so that ordering is consistant
>      return " ".join(sorted(deps))
> @@ -214,7 +214,7 @@ IMAGE_CMD_wic () {
>  IMAGE_CMD_wic[vardepsexclude] =3D "WKS_FULL_PATH WKS_FILES"
> =20
>  # Rebuild when the wks file or vars in WICVARS change
> -USING_WIC =3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.jo=
in('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '', d)}"
> +USING_WIC =3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.jo=
in('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
>  WKS_FILE_CHECKSUM =3D "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_=
FULL_PATH}') if '${USING_WIC}' else ''}"
>  do_image_wic[file-checksums] +=3D "${WKS_FILE_CHECKSUM}"
> =20
> @@ -316,29 +316,29 @@ IMAGE_TYPES =3D " \
>      wic wic.gz wic.bz2 wic.lzma \
>  "
> =20
> -COMPRESSIONTYPES =3D "gz bz2 lzma xz lz4 zip sum md5sum sha1sum sha224su=
m sha256sum sha384sum sha512sum bmap"
> -COMPRESS_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type}"
> -COMPRESS_CMD_gz =3D "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> -COMPRESS_CMD_bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype}"
> -COMPRESS_CMD_xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} -=
-check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > =
${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> -COMPRESS_CMD_lz4 =3D "lz4c -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${typ=
e} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
> -COMPRESS_CMD_zip =3D "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_=
NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -COMPRESS_CMD_sum =3D "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${typ=
e} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
> -COMPRESS_CMD_md5sum =3D "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type=
} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
> -COMPRESS_CMD_sha1sum =3D "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
> -COMPRESS_CMD_sha224sum =3D "sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.=
${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
> -COMPRESS_CMD_sha256sum =3D "sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.=
${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
> -COMPRESS_CMD_sha384sum =3D "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.=
${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
> -COMPRESS_CMD_sha512sum =3D "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.=
${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
> -COMPRESS_CMD_bmap =3D "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
=2E${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
> -COMPRESS_DEPENDS_lzma =3D "xz-native"
> -COMPRESS_DEPENDS_gz =3D ""
> -COMPRESS_DEPENDS_bz2 =3D "pbzip2-native"
> -COMPRESS_DEPENDS_xz =3D "xz-native"
> -COMPRESS_DEPENDS_lz4 =3D "lz4-native"
> -COMPRESS_DEPENDS_zip =3D "zip-native"
> -COMPRESS_DEPENDS_sum =3D "mtd-utils-native"
> -COMPRESS_DEPENDS_bmap =3D "bmap-tools-native"
> +CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 zip sum md5sum sha1sum sha224sum=
 sha256sum sha384sum sha512sum bmap"
> +CONVERSION_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
=2E${type}"
> +CONVERSION_CMD_gz =3D "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> +CONVERSION_CMD_bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type}"
> +CONVERSION_CMD_xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS}=
 --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} =
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> +CONVERSION_CMD_lz4 =3D "lz4c -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
> +CONVERSION_CMD_zip =3D "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAG=
E_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> +CONVERSION_CMD_sum =3D "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARG=
S}"
> +CONVERSION_CMD_md5sum =3D "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
> +CONVERSION_CMD_sha1sum =3D "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${=
type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
> +CONVERSION_CMD_sha224sum =3D "sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
> +CONVERSION_CMD_sha256sum =3D "sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
> +CONVERSION_CMD_sha384sum =3D "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
> +CONVERSION_CMD_sha512sum =3D "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
> +CONVERSION_CMD_bmap =3D "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFI=
X}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
> +CONVERSION_DEPENDS_lzma =3D "xz-native"
> +CONVERSION_DEPENDS_gz =3D ""
> +CONVERSION_DEPENDS_bz2 =3D "pbzip2-native"
> +CONVERSION_DEPENDS_xz =3D "xz-native"
> +CONVERSION_DEPENDS_lz4 =3D "lz4-native"
> +CONVERSION_DEPENDS_zip =3D "zip-native"
> +CONVERSION_DEPENDS_sum =3D "mtd-utils-native"
> +CONVERSION_DEPENDS_bmap =3D "bmap-tools-native"
> =20
>  RUNNABLE_IMAGE_TYPES ?=3D "ext2 ext3 ext4"
>  RUNNABLE_MACHINE_PATTERNS ?=3D "qemu"
> diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_=
types_uboot.bbclass
> index 19e4aa2..f72d9b2 100644
> --- a/meta/classes/image_types_uboot.bbclass
> +++ b/meta/classes/image_types_uboot.bbclass
> @@ -8,19 +8,19 @@ oe_mkimage () {
>      fi
>  }
> =20
> -COMPRESSIONTYPES +=3D "gz.u-boot bz2.u-boot lzma.u-boot u-boot"
> +CONVERSIONTYPES +=3D "gz.u-boot bz2.u-boot lzma.u-boot u-boot"
> =20
> -COMPRESS_DEPENDS_u-boot =3D "u-boot-mkimage-native"
> -COMPRESS_CMD_u-boot      =3D "oe_mkimage ${IMAGE_NAME}.rootfs.${type} no=
ne"
> +CONVERSION_DEPENDS_u-boot =3D "u-boot-mkimage-native"
> +CONVERSION_CMD_u-boot      =3D "oe_mkimage ${IMAGE_NAME}.rootfs.${type} =
none"
> =20
> -COMPRESS_DEPENDS_gz.u-boot =3D "u-boot-mkimage-native"
> -COMPRESS_CMD_gz.u-boot      =3D "${COMPRESS_CMD_gz}; oe_mkimage ${IMAGE_=
NAME}.rootfs.${type}.gz gzip clean"
> +CONVERSION_DEPENDS_gz.u-boot =3D "u-boot-mkimage-native"
> +CONVERSION_CMD_gz.u-boot      =3D "${CONVERSION_CMD_gz}; oe_mkimage ${IM=
AGE_NAME}.rootfs.${type}.gz gzip clean"
> =20
> -COMPRESS_DEPENDS_bz2.u-boot =3D "u-boot-mkimage-native"
> -COMPRESS_CMD_bz2.u-boot      =3D "${COMPRESS_CMD_bz2}; oe_mkimage ${IMAG=
E_NAME}.rootfs.${type}.bz2 bzip2 clean"
> +CONVERSION_DEPENDS_bz2.u-boot =3D "u-boot-mkimage-native"
> +CONVERSION_CMD_bz2.u-boot      =3D "${CONVERSION_CMD_bz2}; oe_mkimage ${=
IMAGE_NAME}.rootfs.${type}.bz2 bzip2 clean"
> =20
> -COMPRESS_DEPENDS_lzma.u-boot =3D "u-boot-mkimage-native"
> -COMPRESS_CMD_lzma.u-boot      =3D "${COMPRESS_CMD_lzma}; oe_mkimage ${IM=
AGE_NAME}.rootfs.${type}.lzma lzma clean"
> +CONVERSION_DEPENDS_lzma.u-boot =3D "u-boot-mkimage-native"
> +CONVERSION_CMD_lzma.u-boot      =3D "${CONVERSION_CMD_lzma}; oe_mkimage =
${IMAGE_NAME}.rootfs.${type}.lzma lzma clean"
> =20
>  IMAGE_TYPES +=3D "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u=
-boot ext3.gz.u-boot ext4.gz.u-boot cpio.gz.u-boot"
> =20
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fvx7lvdic6bgip5w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAle1kWAACgkQN1Ujt2V2gBwLeACggwQVD6n+aaeGtUTbHjDILAKq
zCAAnRmReHCsGhIj2JcKPmDCrZ0U1SJr
=LLiI
-----END PGP SIGNATURE-----

--fvx7lvdic6bgip5w--
