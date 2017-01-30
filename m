Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id DA50A60043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 10:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C23412E2CD;
	Mon, 30 Jan 2017 11:25:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RwHop09iapWM; Mon, 30 Jan 2017 11:25:13 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id C51EE2E273;
	Mon, 30 Jan 2017 11:25:13 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B46501A069;
	Mon, 30 Jan 2017 11:25:13 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A93B01A067;
	Mon, 30 Jan 2017 11:25:13 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 30 Jan 2017 11:25:13 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 9D28F59B;
	Mon, 30 Jan 2017 11:25:13 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 30 Jan 2017 11:25:13 +0100
Received: from XBOX04.axis.com ([fe80::6c88:230d:cafd:2f2a]) by
	XBOX04.axis.com ([fe80::6c88:230d:cafd:2f2a%22]) with mapi id
	15.00.1210.000; Mon, 30 Jan 2017 11:25:13 +0100
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 01/11] image-wic: move wic code to
	image-wic.bbclass
Thread-Index: AQHSeN3tYztL797syE6sQMcOHQQ/LqFQ05EQ
Date: Mon, 30 Jan 2017 10:25:12 +0000
Message-ID: <043d99f6abaa415985974a81b31ea33c@XBOX04.axis.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
	<257efe25e625e8aaa0f1d435716f0c5f61071700.1485547221.git.ed.bartosh@linux.intel.com>
In-Reply-To: <257efe25e625e8aaa0f1d435716f0c5f61071700.1485547221.git.ed.bartosh@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v3 01/11] image-wic: move wic code to	image-wic.bbclass
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
X-List-Received-Date: Mon, 30 Jan 2017 10:25:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please name the class image_wic.bbclass instead.

As dashes are not allowed in function names, you cannot use=20
the image_wic_do_write_wks_template pattern of function=20
names if you use a class name with a dash in it.

--=20
Ola x Nilsson

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Ed Bartosh
> Sent: den 27 januari 2017 21:20
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3 01/11] image-wic: move wic code to image-
> wic.bbclass
>=20
> There is a lot of wic code in image.bbclass and image_types.bbclass Havin=
g all
> code separated in one file should make it more readable and easier to
> maintain.
>=20
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/image-wic.bbclass   | 120
> +++++++++++++++++++++++++++++++++++++++
>  meta/classes/image.bbclass       |  25 +-------
>  meta/classes/image_types.bbclass |  95 -------------------------------
>  3 files changed, 122 insertions(+), 118 deletions(-)  create mode 100644
> meta/classes/image-wic.bbclass
>=20
> diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-
> wic.bbclass new file mode 100644 index 0000000..2acfd65
> --- /dev/null
> +++ b/meta/classes/image-wic.bbclass
> @@ -0,0 +1,120 @@
> +# The WICVARS variable is used to define list of bitbake variables used
> +in wic code # variables from this list is written to <image>.env file
> +WICVARS ?=3D "\
> +           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD
> HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES \
> +           IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD
> ISODIR MACHINE_ARCH RECIPE_SYSROOT_NATIVE \
> +           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR
> TARGET_SYS"
> +
> +WKS_FILE ??=3D "${IMAGE_BASENAME}.${MACHINE}.wks"
> +WKS_FILES ?=3D "${WKS_FILE} ${IMAGE_BASENAME}.wks"
> +WKS_SEARCH_PATH ?=3D "${THISDIR}:${@':'.join('%s/wic' % p for p in
> '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l =
for l in
> '${BBPATH}:${COREBASE}'.split(':'))}"
> +WKS_FULL_PATH =3D "${@wks_search('${WKS_FILES}'.split(),
> '${WKS_SEARCH_PATH}') or ''}"
> +
> +def wks_search(files, search_path):
> +    for f in files:
> +        if os.path.isabs(f):
> +            if os.path.exists(f):
> +                return f
> +        else:
> +            searched =3D bb.utils.which(search_path, f)
> +            if searched:
> +                return searched
> +
> +WIC_CREATE_EXTRA_ARGS ?=3D ""
> +
> +IMAGE_CMD_wic () {
> +	out=3D"${IMGDEPLOYDIR}/${IMAGE_NAME}"
> +	wks=3D"${WKS_FULL_PATH}"
> +	if [ -z "$wks" ]; then
> +		bbfatal "No kickstart files from WKS_FILES were
> found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> +	fi
> +
> +	BUILDDIR=3D"${TOPDIR}" wic create "$wks" --vars
> "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o
> "$out/" ${WIC_CREATE_EXTRA_ARGS}
> +	mv "$out/$(basename "${wks%.wks}")"*.direct
> "$out${IMAGE_NAME_SUFFIX}.wic"
> +	rm -rf "$out/"
> +}
> +IMAGE_CMD_wic[vardepsexclude] =3D "WKS_FULL_PATH WKS_FILES"
> +
> +# Rebuild when the wks file or vars in WICVARS change USING_WIC =3D
> +"${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % =
c for
> c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
> +WKS_FILE_CHECKSUM =3D "${@'${WKS_FULL_PATH}:%s' %
> os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
> +do_image_wic[file-checksums] +=3D "${WKS_FILE_CHECKSUM}"
> +do_image_wic[depends] +=3D "wic-tools:do_build"
> +
> +python () {
> +    if d.getVar('USING_WIC') and 'do_bootimg' in d:
> +        bb.build.addtask('do_image_wic', '', 'do_bootimg', d) }
> +
> +python do_write_wks_template () {
> +    """Write out expanded template contents to WKS_FULL_PATH."""
> +    import re
> +
> +    template_body =3D d.getVar('_WKS_TEMPLATE')
> +
> +    # Remove any remnant variable references left behind by the expansio=
n
> +    # due to undefined variables
> +    expand_var_regexp =3D re.compile(r"\${[^{}@\n\t :]+}")
> +    while True:
> +        new_body =3D re.sub(expand_var_regexp, '', template_body)
> +        if new_body =3D=3D template_body:
> +            break
> +        else:
> +            template_body =3D new_body
> +
> +    wks_file =3D d.getVar('WKS_FULL_PATH')
> +    with open(wks_file, 'w') as f:
> +        f.write(template_body)
> +}
> +
> +python () {
> +    if d.getVar('USING_WIC'):
> +        wks_file_u =3D d.getVar('WKS_FULL_PATH', False)
> +        wks_file =3D d.expand(wks_file_u)
> +        base, ext =3D os.path.splitext(wks_file)
> +        if ext =3D=3D '.in' and os.path.exists(wks_file):
> +            wks_out_file =3D os.path.join(d.getVar('WORKDIR'),
> os.path.basename(base))
> +            d.setVar('WKS_FULL_PATH', wks_out_file)
> +            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> +            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
> +
> +            # We need to re-parse each time the file changes, and bitbak=
e
> +            # needs to be told about that explicitly.
> +            bb.parse.mark_dependency(d, wks_file)
> +
> +            try:
> +                with open(wks_file, 'r') as f:
> +                    body =3D f.read()
> +            except (IOError, OSError) as exc:
> +                pass
> +            else:
> +                # Previously, I used expandWithRefs to get the dependenc=
y list
> +                # and add it to WICVARS, but there's no point re-parsing=
 the
> +                # file in process_wks_template as well, so just put it i=
n
> +                # a variable and let the metadata deal with the deps.
> +                d.setVar('_WKS_TEMPLATE', body)
> +                bb.build.addtask('do_write_wks_template',
> +'do_image_wic', None, d) }
> +
> +#
> +# Write environment variables used by wic # to
> +tmp/sysroots/<machine>/imgdata/<image>.env
> +#
> +python do_rootfs_wicenv () {
> +    wicvars =3D d.getVar('WICVARS')
> +    if not wicvars:
> +        return
> +
> +    stdir =3D d.getVar('STAGING_DIR')
> +    outdir =3D os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
> +    bb.utils.mkdirhier(outdir)
> +    basename =3D d.getVar('IMAGE_BASENAME')
> +    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> +        for var in wicvars.split():
> +            value =3D d.getVar(var)
> +            if value:
> +                envf.write('%s=3D"%s"\n' % (var, value.strip())) }
> +addtask do_rootfs_wicenv after do_image before do_image_wic
> +do_rootfs_wicenv[vardeps] +=3D "${WICVARS}"
> +do_rootfs_wicenv[prefuncs] =3D 'set_image_size'
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass inde=
x
> 13fd996..1a549e9 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -192,6 +192,8 @@ python () {
>  IMAGE_CLASSES +=3D "image_types"
>  inherit ${IMAGE_CLASSES}
>=20
> +inherit image-wic
> +
>  IMAGE_POSTPROCESS_COMMAND ?=3D ""
>=20
>  # some default locales
> @@ -332,29 +334,6 @@ fakeroot python do_image_qa () {  }  addtask
> do_image_qa after do_image_complete before do_build
>=20
> -#
> -# Write environment variables used by wic -# to
> tmp/sysroots/<machine>/imgdata/<image>.env
> -#
> -python do_rootfs_wicenv () {
> -    wicvars =3D d.getVar('WICVARS')
> -    if not wicvars:
> -        return
> -
> -    stdir =3D d.getVar('STAGING_DIR')
> -    outdir =3D os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
> -    bb.utils.mkdirhier(outdir)
> -    basename =3D d.getVar('IMAGE_BASENAME')
> -    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> -        for var in wicvars.split():
> -            value =3D d.getVar(var)
> -            if value:
> -                envf.write('%s=3D"%s"\n' % (var, value.strip()))
> -}
> -addtask do_rootfs_wicenv after do_image before do_image_wic -
> do_rootfs_wicenv[vardeps] +=3D "${WICVARS}"
> -do_rootfs_wicenv[prefuncs] =3D 'set_image_size'
> -
>  def setup_debugfs_variables(d):
>      d.appendVar('IMAGE_ROOTFS', '-dbg')
>      d.appendVar('IMAGE_LINK_NAME', '-dbg') diff --git
> a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index ad95dc6..e2ecf93 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -192,97 +192,6 @@ IMAGE_CMD_ubi () {
>=20
>  IMAGE_CMD_ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs
> ${MKUBIFS_ARGS}"
>=20
> -WKS_FILE ??=3D "${IMAGE_BASENAME}.${MACHINE}.wks"
> -WKS_FILES ?=3D "${WKS_FILE} ${IMAGE_BASENAME}.wks"
> -WKS_SEARCH_PATH ?=3D "${THISDIR}:${@':'.join('%s/wic' % p for p in
> '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l =
for l in
> '${BBPATH}:${COREBASE}'.split(':'))}"
> -WKS_FULL_PATH =3D "${@wks_search('${WKS_FILES}'.split(),
> '${WKS_SEARCH_PATH}') or ''}"
> -
> -def wks_search(files, search_path):
> -    for f in files:
> -        if os.path.isabs(f):
> -            if os.path.exists(f):
> -                return f
> -        else:
> -            searched =3D bb.utils.which(search_path, f)
> -            if searched:
> -                return searched
> -
> -WIC_CREATE_EXTRA_ARGS ?=3D ""
> -
> -IMAGE_CMD_wic () {
> -	out=3D"${IMGDEPLOYDIR}/${IMAGE_NAME}"
> -	wks=3D"${WKS_FULL_PATH}"
> -	if [ -z "$wks" ]; then
> -		bbfatal "No kickstart files from WKS_FILES were
> found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> -	fi
> -
> -	BUILDDIR=3D"${TOPDIR}" wic create "$wks" --vars
> "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o
> "$out/" ${WIC_CREATE_EXTRA_ARGS}
> -	mv "$out/$(basename "${wks%.wks}")"*.direct
> "$out${IMAGE_NAME_SUFFIX}.wic"
> -	rm -rf "$out/"
> -}
> -IMAGE_CMD_wic[vardepsexclude] =3D "WKS_FULL_PATH WKS_FILES"
> -
> -# Rebuild when the wks file or vars in WICVARS change -USING_WIC =3D
> "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c=
 for c
> in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
> -WKS_FILE_CHECKSUM =3D "${@'${WKS_FULL_PATH}:%s' %
> os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
> -do_image_wic[file-checksums] +=3D "${WKS_FILE_CHECKSUM}"
> -do_image_wic[depends] +=3D "wic-tools:do_build"
> -
> -python () {
> -    if d.getVar('USING_WIC') and 'do_bootimg' in d:
> -        bb.build.addtask('do_image_wic', '', 'do_bootimg', d)
> -}
> -
> -python do_write_wks_template () {
> -    """Write out expanded template contents to WKS_FULL_PATH."""
> -    import re
> -
> -    template_body =3D d.getVar('_WKS_TEMPLATE')
> -
> -    # Remove any remnant variable references left behind by the expansio=
n
> -    # due to undefined variables
> -    expand_var_regexp =3D re.compile(r"\${[^{}@\n\t :]+}")
> -    while True:
> -        new_body =3D re.sub(expand_var_regexp, '', template_body)
> -        if new_body =3D=3D template_body:
> -            break
> -        else:
> -            template_body =3D new_body
> -
> -    wks_file =3D d.getVar('WKS_FULL_PATH')
> -    with open(wks_file, 'w') as f:
> -        f.write(template_body)
> -}
> -
> -python () {
> -    if d.getVar('USING_WIC'):
> -        wks_file_u =3D d.getVar('WKS_FULL_PATH', False)
> -        wks_file =3D d.expand(wks_file_u)
> -        base, ext =3D os.path.splitext(wks_file)
> -        if ext =3D=3D '.in' and os.path.exists(wks_file):
> -            wks_out_file =3D os.path.join(d.getVar('WORKDIR'),
> os.path.basename(base))
> -            d.setVar('WKS_FULL_PATH', wks_out_file)
> -            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> -            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
> -
> -            # We need to re-parse each time the file changes, and bitbak=
e
> -            # needs to be told about that explicitly.
> -            bb.parse.mark_dependency(d, wks_file)
> -
> -            try:
> -                with open(wks_file, 'r') as f:
> -                    body =3D f.read()
> -            except (IOError, OSError) as exc:
> -                pass
> -            else:
> -                # Previously, I used expandWithRefs to get the dependenc=
y list
> -                # and add it to WICVARS, but there's no point re-parsing=
 the
> -                # file in process_wks_template as well, so just put it i=
n
> -                # a variable and let the metadata deal with the deps.
> -                d.setVar('_WKS_TEMPLATE', body)
> -                bb.build.addtask('do_write_wks_template', 'do_image_wic'=
, None,
> d)
> -}
> -
>  EXTRA_IMAGECMD =3D ""
>=20
>  inherit siteinfo
> @@ -380,7 +289,3 @@ IMAGE_EXTENSION_live =3D "hddimg iso"
>  # The IMAGE_TYPES_MASKED variable will be used to mask out from the
> IMAGE_FSTYPES,  # images that will not be built at do_rootfs time: vmdk, =
vdi,
> qcow2, hdddirect, hddimg, iso, etc.
>  IMAGE_TYPES_MASKED ?=3D ""
> -
> -# The WICVARS variable is used to define list of bitbake variables used =
in wic
> code -# variables from this list is written to <image>.env file -WICVARS =
?=3D
> "BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD HDDDIR
> IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME
> IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH
> RECIPE_SYSROOT_NATIVE ROOTFS_SIZE STAGING_DATADIR STAGING_DIR
> STAGING_LIBDIR TARGET_SYS"
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

