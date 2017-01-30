Return-Path: <raltherr@google.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0F577394
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 17:27:54 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c7so106234400itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 09:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zLKK7cs/3VnkeDjZE0bQjjKhHGUAhkFHkmLKeHVd5uQ=;
	b=f/7pRscH/ilDgi+WPhVbxamzCcRwUJdUpNzmgopAu3jxqOw3tlxppfEHCC2FrvGUVf
	lt0DkYz7pfSMipnY4/gwCJCOE8KprFzfPbNv5PJmC89WtP++iJjg1W/HrAcaV+06PqBk
	QH3csqkC4fKyRfntj1C0Dt3Ub3iOPnNoQqd9tAraxO3CfUykFl+AdyMMmrFrnrsWJooS
	M8SV2Zl5MziU2swvQv/77YN/9lT4BlVjMZ6SSSkPlX8YOfcNpQ/MPamxLZ25aa3VnefT
	drMX+BQyVoG5pltOoZxVhO8+bzXVi7GP921zFb04BPSYxxEKeivW6Y1oyEPP5fkEwRGW
	mT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zLKK7cs/3VnkeDjZE0bQjjKhHGUAhkFHkmLKeHVd5uQ=;
	b=ent9m0bsL5sJeSxY1X9qRhAuwBU5fVzATkH4BNmK71oknht9+eixCrJfArBIaaENgl
	L8/yaK0RN4wqeaiQ3+xm5iMrRXSvbWCIeSh1iUAFaPAR7eM3Q43PKCMmUFG3NDQyVTnp
	odF4lpUOlD2PsMl6eYnTjvI0d0gIn4UoVchTEExU6aA4jpJj6iiVE7Yk9K994GDtQVa0
	x9hoz845u5INNK47perDJ/HeYwxREMSim6eW0PfhWzSVEd1PzvmlImN4TjyTQojAWwjb
	Jb7+yhE+X1rnemgjuLU0Rcf1Xjkfj18EiZbr8Zyd5Y9JGiE2nlvoWyF4GqcrTUghYu44
	fJtQ==
X-Gm-Message-State: AIkVDXK24Smgk2pwWYYX+ct7p5lp+6POOEmk+cBJ2rzRFsy0LrqtN+ok6otUT/NTGT9x/ZIbeexYDcQvfutD76H+
X-Received: by 10.36.48.208 with SMTP id q199mr17147827itq.28.1485797275073;
	Mon, 30 Jan 2017 09:27:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Mon, 30 Jan 2017 09:27:54 -0800 (PST)
In-Reply-To: <257efe25e625e8aaa0f1d435716f0c5f61071700.1485547221.git.ed.bartosh@linux.intel.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
	<257efe25e625e8aaa0f1d435716f0c5f61071700.1485547221.git.ed.bartosh@linux.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 30 Jan 2017 09:27:54 -0800
Message-ID: <CAPLgG=niaYOrW-zw=k6Z+hWfGRutVSA3bcKk4Ln8MqQR7zpPag@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 01/11] image-wic: move wic code to image-wic.bbclass
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
X-List-Received-Date: Mon, 30 Jan 2017 17:27:55 -0000
Content-Type: multipart/alternative; boundary=001a1140aa84ca64ce0547532230

--001a1140aa84ca64ce0547532230
Content-Type: text/plain; charset=UTF-8

Why didn't you make this image_types_wic.bbclass and use IMAGE_CLASSES to
load it?

On Fri, Jan 27, 2017 at 12:19 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> There is a lot of wic code in image.bbclass and image_types.bbclass
> Having all code separated in one file should make it more readable
> and easier to maintain.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/image-wic.bbclass   | 120 ++++++++++++++++++++++++++++++
> +++++++++
>  meta/classes/image.bbclass       |  25 +-------
>  meta/classes/image_types.bbclass |  95 -------------------------------
>  3 files changed, 122 insertions(+), 118 deletions(-)
>  create mode 100644 meta/classes/image-wic.bbclass
>
> diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-wic.
> bbclass
> new file mode 100644
> index 0000000..2acfd65
> --- /dev/null
> +++ b/meta/classes/image-wic.bbclass
> @@ -0,0 +1,120 @@
> +# The WICVARS variable is used to define list of bitbake variables used
> in wic code
> +# variables from this list is written to <image>.env file
> +WICVARS ?= "\
> +           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD HDDDIR
> IMAGE_BASENAME IMAGE_BOOT_FILES \
> +           IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR
> MACHINE_ARCH RECIPE_SYSROOT_NATIVE \
> +           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR
> TARGET_SYS"
> +
> +WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
> +WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
> +WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in
> '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l
> for l in '${BBPATH}:${COREBASE}'.split(':'))}"
> +WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(),
> '${WKS_SEARCH_PATH}') or ''}"
> +
> +def wks_search(files, search_path):
> +    for f in files:
> +        if os.path.isabs(f):
> +            if os.path.exists(f):
> +                return f
> +        else:
> +            searched = bb.utils.which(search_path, f)
> +            if searched:
> +                return searched
> +
> +WIC_CREATE_EXTRA_ARGS ?= ""
> +
> +IMAGE_CMD_wic () {
> +       out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
> +       wks="${WKS_FULL_PATH}"
> +       if [ -z "$wks" ]; then
> +               bbfatal "No kickstart files from WKS_FILES were found:
> ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> +       fi
> +
> +       BUILDDIR="${TOPDIR}" wic create "$wks" --vars
> "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
> ${WIC_CREATE_EXTRA_ARGS}
> +       mv "$out/$(basename "${wks%.wks}")"*.direct
> "$out${IMAGE_NAME_SUFFIX}.wic"
> +       rm -rf "$out/"
> +}
> +IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
> +
> +# Rebuild when the wks file or vars in WICVARS change
> +USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + '
> '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
> +WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
> +do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> +do_image_wic[depends] += "wic-tools:do_build"
> +
> +python () {
> +    if d.getVar('USING_WIC') and 'do_bootimg' in d:
> +        bb.build.addtask('do_image_wic', '', 'do_bootimg', d)
> +}
> +
> +python do_write_wks_template () {
> +    """Write out expanded template contents to WKS_FULL_PATH."""
> +    import re
> +
> +    template_body = d.getVar('_WKS_TEMPLATE')
> +
> +    # Remove any remnant variable references left behind by the expansion
> +    # due to undefined variables
> +    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
> +    while True:
> +        new_body = re.sub(expand_var_regexp, '', template_body)
> +        if new_body == template_body:
> +            break
> +        else:
> +            template_body = new_body
> +
> +    wks_file = d.getVar('WKS_FULL_PATH')
> +    with open(wks_file, 'w') as f:
> +        f.write(template_body)
> +}
> +
> +python () {
> +    if d.getVar('USING_WIC'):
> +        wks_file_u = d.getVar('WKS_FULL_PATH', False)
> +        wks_file = d.expand(wks_file_u)
> +        base, ext = os.path.splitext(wks_file)
> +        if ext == '.in' and os.path.exists(wks_file):
> +            wks_out_file = os.path.join(d.getVar('WORKDIR'),
> os.path.basename(base))
> +            d.setVar('WKS_FULL_PATH', wks_out_file)
> +            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> +            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
> +
> +            # We need to re-parse each time the file changes, and bitbake
> +            # needs to be told about that explicitly.
> +            bb.parse.mark_dependency(d, wks_file)
> +
> +            try:
> +                with open(wks_file, 'r') as f:
> +                    body = f.read()
> +            except (IOError, OSError) as exc:
> +                pass
> +            else:
> +                # Previously, I used expandWithRefs to get the dependency
> list
> +                # and add it to WICVARS, but there's no point re-parsing
> the
> +                # file in process_wks_template as well, so just put it in
> +                # a variable and let the metadata deal with the deps.
> +                d.setVar('_WKS_TEMPLATE', body)
> +                bb.build.addtask('do_write_wks_template',
> 'do_image_wic', None, d)
> +}
> +
> +#
> +# Write environment variables used by wic
> +# to tmp/sysroots/<machine>/imgdata/<image>.env
> +#
> +python do_rootfs_wicenv () {
> +    wicvars = d.getVar('WICVARS')
> +    if not wicvars:
> +        return
> +
> +    stdir = d.getVar('STAGING_DIR')
> +    outdir = os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
> +    bb.utils.mkdirhier(outdir)
> +    basename = d.getVar('IMAGE_BASENAME')
> +    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> +        for var in wicvars.split():
> +            value = d.getVar(var)
> +            if value:
> +                envf.write('%s="%s"\n' % (var, value.strip()))
> +}
> +addtask do_rootfs_wicenv after do_image before do_image_wic
> +do_rootfs_wicenv[vardeps] += "${WICVARS}"
> +do_rootfs_wicenv[prefuncs] = 'set_image_size'
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 13fd996..1a549e9 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -192,6 +192,8 @@ python () {
>  IMAGE_CLASSES += "image_types"
>  inherit ${IMAGE_CLASSES}
>
> +inherit image-wic
> +
>  IMAGE_POSTPROCESS_COMMAND ?= ""
>
>  # some default locales
> @@ -332,29 +334,6 @@ fakeroot python do_image_qa () {
>  }
>  addtask do_image_qa after do_image_complete before do_build
>
> -#
> -# Write environment variables used by wic
> -# to tmp/sysroots/<machine>/imgdata/<image>.env
> -#
> -python do_rootfs_wicenv () {
> -    wicvars = d.getVar('WICVARS')
> -    if not wicvars:
> -        return
> -
> -    stdir = d.getVar('STAGING_DIR')
> -    outdir = os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
> -    bb.utils.mkdirhier(outdir)
> -    basename = d.getVar('IMAGE_BASENAME')
> -    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> -        for var in wicvars.split():
> -            value = d.getVar(var)
> -            if value:
> -                envf.write('%s="%s"\n' % (var, value.strip()))
> -}
> -addtask do_rootfs_wicenv after do_image before do_image_wic
> -do_rootfs_wicenv[vardeps] += "${WICVARS}"
> -do_rootfs_wicenv[prefuncs] = 'set_image_size'
> -
>  def setup_debugfs_variables(d):
>      d.appendVar('IMAGE_ROOTFS', '-dbg')
>      d.appendVar('IMAGE_LINK_NAME', '-dbg')
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.
> bbclass
> index ad95dc6..e2ecf93 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -192,97 +192,6 @@ IMAGE_CMD_ubi () {
>
>  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
>
> -WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
> -WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
> -WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in
> '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l
> for l in '${BBPATH}:${COREBASE}'.split(':'))}"
> -WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(),
> '${WKS_SEARCH_PATH}') or ''}"
> -
> -def wks_search(files, search_path):
> -    for f in files:
> -        if os.path.isabs(f):
> -            if os.path.exists(f):
> -                return f
> -        else:
> -            searched = bb.utils.which(search_path, f)
> -            if searched:
> -                return searched
> -
> -WIC_CREATE_EXTRA_ARGS ?= ""
> -
> -IMAGE_CMD_wic () {
> -       out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
> -       wks="${WKS_FULL_PATH}"
> -       if [ -z "$wks" ]; then
> -               bbfatal "No kickstart files from WKS_FILES were found:
> ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> -       fi
> -
> -       BUILDDIR="${TOPDIR}" wic create "$wks" --vars
> "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
> ${WIC_CREATE_EXTRA_ARGS}
> -       mv "$out/$(basename "${wks%.wks}")"*.direct
> "$out${IMAGE_NAME_SUFFIX}.wic"
> -       rm -rf "$out/"
> -}
> -IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
> -
> -# Rebuild when the wks file or vars in WICVARS change
> -USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + '
> '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
> -WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
> -do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> -do_image_wic[depends] += "wic-tools:do_build"
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
> -    template_body = d.getVar('_WKS_TEMPLATE')
> -
> -    # Remove any remnant variable references left behind by the expansion
> -    # due to undefined variables
> -    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
> -    while True:
> -        new_body = re.sub(expand_var_regexp, '', template_body)
> -        if new_body == template_body:
> -            break
> -        else:
> -            template_body = new_body
> -
> -    wks_file = d.getVar('WKS_FULL_PATH')
> -    with open(wks_file, 'w') as f:
> -        f.write(template_body)
> -}
> -
> -python () {
> -    if d.getVar('USING_WIC'):
> -        wks_file_u = d.getVar('WKS_FULL_PATH', False)
> -        wks_file = d.expand(wks_file_u)
> -        base, ext = os.path.splitext(wks_file)
> -        if ext == '.in' and os.path.exists(wks_file):
> -            wks_out_file = os.path.join(d.getVar('WORKDIR'),
> os.path.basename(base))
> -            d.setVar('WKS_FULL_PATH', wks_out_file)
> -            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> -            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
> -
> -            # We need to re-parse each time the file changes, and bitbake
> -            # needs to be told about that explicitly.
> -            bb.parse.mark_dependency(d, wks_file)
> -
> -            try:
> -                with open(wks_file, 'r') as f:
> -                    body = f.read()
> -            except (IOError, OSError) as exc:
> -                pass
> -            else:
> -                # Previously, I used expandWithRefs to get the dependency
> list
> -                # and add it to WICVARS, but there's no point re-parsing
> the
> -                # file in process_wks_template as well, so just put it in
> -                # a variable and let the metadata deal with the deps.
> -                d.setVar('_WKS_TEMPLATE', body)
> -                bb.build.addtask('do_write_wks_template',
> 'do_image_wic', None, d)
> -}
> -
>  EXTRA_IMAGECMD = ""
>
>  inherit siteinfo
> @@ -380,7 +289,3 @@ IMAGE_EXTENSION_live = "hddimg iso"
>  # The IMAGE_TYPES_MASKED variable will be used to mask out from the
> IMAGE_FSTYPES,
>  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2,
> hdddirect, hddimg, iso, etc.
>  IMAGE_TYPES_MASKED ?= ""
> -
> -# The WICVARS variable is used to define list of bitbake variables used
> in wic code
> -# variables from this list is written to <image>.env file
> -WICVARS ?= "BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD HDDDIR
> IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS
> INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH RECIPE_SYSROOT_NATIVE
> ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140aa84ca64ce0547532230
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why didn&#39;t you make this image_types_wic.bbclass and u=
se IMAGE_CLASSES to load it?</div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Fri, Jan 27, 2017 at 12:19 PM, Ed Bartosh <span dir=3D"=
ltr">&lt;<a href=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed=
.bartosh@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">There is a lot of wic code in image.bbclass and image_types.bbclass<b=
r>
Having all code separated in one file should make it more readable<br>
and easier to maintain.<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image-wic.bbclass=C2=A0 =C2=A0| 120 ++++++++++++++++++++=
++++++++++<wbr>+++++++++<br>
=C2=A0meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +----=
---<br>
=C2=A0meta/classes/image_types.<wbr>bbclass |=C2=A0 95 --------------------=
----------<wbr>-<br>
=C2=A03 files changed, 122 insertions(+), 118 deletions(-)<br>
=C2=A0create mode 100644 meta/classes/image-wic.bbclass<br>
<br>
diff --git a/meta/classes/image-wic.<wbr>bbclass b/meta/classes/image-wic.<=
wbr>bbclass<br>
new file mode 100644<br>
index 0000000..2acfd65<br>
--- /dev/null<br>
+++ b/meta/classes/image-wic.<wbr>bbclass<br>
@@ -0,0 +1,120 @@<br>
+# The WICVARS variable is used to define list of bitbake variables used in=
 wic code<br>
+# variables from this list is written to &lt;image&gt;.env file<br>
+WICVARS ?=3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_=
IMAGE FAKEROOTCMD HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_LINK_NAME IMAGE_ROOTFS INIT=
RAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH RECIPE_SYSROOT_NATIVE \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ROOTFS_SIZE STAGING_DATADIR STAGI=
NG_DIR STAGING_LIBDIR TARGET_SYS&quot;<br>
+<br>
+WKS_FILE ??=3D &quot;${IMAGE_BASENAME}.${MACHINE}.<wbr>wks&quot;<br>
+WKS_FILES ?=3D &quot;${WKS_FILE} ${IMAGE_BASENAME}.wks&quot;<br>
+WKS_SEARCH_PATH ?=3D &quot;${THISDIR}:${@&#39;:&#39;.join(&#39;%s/<wbr>wic=
&#39; % p for p in &#39;${BBPATH}&#39;.split(&#39;:&#39;))}:${@&#39;:<wbr>&=
#39;.join(&#39;%s/scripts/lib/wic/<wbr>canned-wks&#39; % l for l in &#39;${=
BBPATH}:${COREBASE}&#39;.split(<wbr>&#39;:&#39;))}&quot;<br>
+WKS_FULL_PATH =3D &quot;${@wks_search(&#39;${WKS_FILES}&#39;.<wbr>split(),=
 &#39;${WKS_SEARCH_PATH}&#39;) or &#39;&#39;}&quot;<br>
+<br>
+def wks_search(files, search_path):<br>
+=C2=A0 =C2=A0 for f in files:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isabs(f):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(f):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 searched =3D bb.utils.which(sear=
ch_path, f)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if searched:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return searched<br=
>
+<br>
+WIC_CREATE_EXTRA_ARGS ?=3D &quot;&quot;<br>
+<br>
+IMAGE_CMD_wic () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0out=3D&quot;${IMGDEPLOYDIR}/${IMAGE_<wbr>NAME}&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wks=3D&quot;${WKS_FULL_PATH}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$wks&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;No ki=
ckstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE =
or WKS_FILES appropriately.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILDDIR=3D&quot;${TOPDIR}&quot; wic create &qu=
ot;$wks&quot; --vars &quot;${STAGING_DIR}/${MACHINE}/<wbr>imgdata/&quot; -e=
 &quot;${IMAGE_BASENAME}&quot; -o &quot;$out/&quot; ${WIC_CREATE_EXTRA_ARGS=
}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;$out/$(basename &quot;${wks%.wks}&quot=
;)&quot;*.direct &quot;$out${IMAGE_NAME_SUFFIX}.wic&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf &quot;$out/&quot;<br>
+}<br>
+IMAGE_CMD_wic[vardepsexclude] =3D &quot;WKS_FULL_PATH WKS_FILES&quot;<br>
+<br>
+# Rebuild when the wks file or vars in WICVARS change<br>
+USING_WIC =3D &quot;${@bb.utils.contains_any(&#39;<wbr>IMAGE_FSTYPES&#39;,=
 &#39;wic &#39; + &#39; &#39;.join(&#39;wic.%s&#39; % c for c in &#39;${CON=
VERSIONTYPES}&#39;.split()), &#39;1&#39;, &#39;&#39;, d)}&quot;<br>
+WKS_FILE_CHECKSUM =3D &quot;${@&#39;${WKS_FULL_PATH}:%s&#39; % os.path.exi=
sts(&#39;${WKS_FULL_<wbr>PATH}&#39;) if &#39;${USING_WIC}&#39; else &#39;&#=
39;}&quot;<br>
+do_image_wic[file-checksums] +=3D &quot;${WKS_FILE_CHECKSUM}&quot;<br>
+do_image_wic[depends] +=3D &quot;wic-tools:do_build&quot;<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;USING_WIC&#39;) and &#39;do_bootimg&#39; in=
 d:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_image_<wbr>wic&#39;, =
&#39;&#39;, &#39;do_bootimg&#39;, d)<br>
+}<br>
+<br>
+python do_write_wks_template () {<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Write out expanded template contents to WK=
S_FULL_PATH.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 import re<br>
+<br>
+=C2=A0 =C2=A0 template_body =3D d.getVar(&#39;_WKS_TEMPLATE&#39;)<br>
+<br>
+=C2=A0 =C2=A0 # Remove any remnant variable references left behind by the =
expansion<br>
+=C2=A0 =C2=A0 # due to undefined variables<br>
+=C2=A0 =C2=A0 expand_var_regexp =3D re.compile(r&quot;\${[^{}@\n\t :]+}&qu=
ot;)<br>
+=C2=A0 =C2=A0 while True:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_body =3D re.sub(expand_var_regexp, &#39;&#=
39;, template_body)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if new_body =3D=3D template_body:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 template_body =3D new_body<br>
+<br>
+=C2=A0 =C2=A0 wks_file =3D d.getVar(&#39;WKS_FULL_PATH&#39;)<br>
+=C2=A0 =C2=A0 with open(wks_file, &#39;w&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(template_body)<br>
+}<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;USING_WIC&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file_u =3D d.getVar(&#39;WKS_FULL_PATH&#39=
;, False)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file =3D d.expand(wks_file_u)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 base, ext =3D os.path.splitext(wks_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ext =3D=3D &#39;.in&#39; and os.path.exists=
(wks_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_out_file =3D os.path.join(d.=
getVar(&#39;<wbr>WORKDIR&#39;), os.path.basename(base))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_FULL_PATH&#39;=
, wks_out_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_TEMPLATE_PATH&=
#39;, wks_file_u)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_FILE_CHECKSUM&=
#39;, &#39;${WKS_TEMPLATE_PATH}:True&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to re-parse each time =
the file changes, and bitbake<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # needs to be told about that ex=
plicitly.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.parse.mark_dependency(d, wks_=
file)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(wks_file=
, &#39;r&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 body=
 =3D f.read()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (IOError, OSError) as exc=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Previously, I us=
ed expandWithRefs to get the dependency list<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # and add it to WI=
CVARS, but there&#39;s no point re-parsing the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # file in process_=
wks_template as well, so just put it in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # a variable and l=
et the metadata deal with the deps.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;_WKS=
_TEMPLATE&#39;, body)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&=
#39;do_write_<wbr>wks_template&#39;, &#39;do_image_wic&#39;, None, d)<br>
+}<br>
+<br>
+#<br>
+# Write environment variables used by wic<br>
+# to tmp/sysroots/&lt;machine&gt;/<wbr>imgdata/&lt;image&gt;.env<br>
+#<br>
+python do_rootfs_wicenv () {<br>
+=C2=A0 =C2=A0 wicvars =3D d.getVar(&#39;WICVARS&#39;)<br>
+=C2=A0 =C2=A0 if not wicvars:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 stdir =3D d.getVar(&#39;STAGING_DIR&#39;)<br>
+=C2=A0 =C2=A0 outdir =3D os.path.join(stdir, d.getVar(&#39;MACHINE&#39;), =
&#39;imgdata&#39;)<br>
+=C2=A0 =C2=A0 bb.utils.mkdirhier(outdir)<br>
+=C2=A0 =C2=A0 basename =3D d.getVar(&#39;IMAGE_BASENAME&#39;)<br>
+=C2=A0 =C2=A0 with open(os.path.join(outdir, basename) + &#39;.env&#39;, &=
#39;w&#39;) as envf:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in wicvars.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D d.getVar(var)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if value:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 envf.write(&#39;%s=
=3D&quot;%s&quot;\n&#39; % (var, value.strip()))<br>
+}<br>
+addtask do_rootfs_wicenv after do_image before do_image_wic<br>
+do_rootfs_wicenv[vardeps] +=3D &quot;${WICVARS}&quot;<br>
+do_rootfs_wicenv[prefuncs] =3D &#39;set_image_size&#39;<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 13fd996..1a549e9 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -192,6 +192,8 @@ python () {<br>
=C2=A0IMAGE_CLASSES +=3D &quot;image_types&quot;<br>
=C2=A0inherit ${IMAGE_CLASSES}<br>
<br>
+inherit image-wic<br>
+<br>
=C2=A0IMAGE_POSTPROCESS_COMMAND ?=3D &quot;&quot;<br>
<br>
=C2=A0# some default locales<br>
@@ -332,29 +334,6 @@ fakeroot python do_image_qa () {<br>
=C2=A0}<br>
=C2=A0addtask do_image_qa after do_image_complete before do_build<br>
<br>
-#<br>
-# Write environment variables used by wic<br>
-# to tmp/sysroots/&lt;machine&gt;/<wbr>imgdata/&lt;image&gt;.env<br>
-#<br>
-python do_rootfs_wicenv () {<br>
-=C2=A0 =C2=A0 wicvars =3D d.getVar(&#39;WICVARS&#39;)<br>
-=C2=A0 =C2=A0 if not wicvars:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
-<br>
-=C2=A0 =C2=A0 stdir =3D d.getVar(&#39;STAGING_DIR&#39;)<br>
-=C2=A0 =C2=A0 outdir =3D os.path.join(stdir, d.getVar(&#39;MACHINE&#39;), =
&#39;imgdata&#39;)<br>
-=C2=A0 =C2=A0 bb.utils.mkdirhier(outdir)<br>
-=C2=A0 =C2=A0 basename =3D d.getVar(&#39;IMAGE_BASENAME&#39;)<br>
-=C2=A0 =C2=A0 with open(os.path.join(outdir, basename) + &#39;.env&#39;, &=
#39;w&#39;) as envf:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in wicvars.split():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D d.getVar(var)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if value:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 envf.write(&#39;%s=
=3D&quot;%s&quot;\n&#39; % (var, value.strip()))<br>
-}<br>
-addtask do_rootfs_wicenv after do_image before do_image_wic<br>
-do_rootfs_wicenv[vardeps] +=3D &quot;${WICVARS}&quot;<br>
-do_rootfs_wicenv[prefuncs] =3D &#39;set_image_size&#39;<br>
-<br>
=C2=A0def setup_debugfs_variables(d):<br>
=C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;IMAGE_ROOTFS&#39;, &#39;-dbg&#39;)<br>
=C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;IMAGE_LINK_NAME&#39;, &#39;-dbg&#39;)<=
br>
diff --git a/meta/classes/image_types.<wbr>bbclass b/meta/classes/image_typ=
es.<wbr>bbclass<br>
index ad95dc6..e2ecf93 100644<br>
--- a/meta/classes/image_types.<wbr>bbclass<br>
+++ b/meta/classes/image_types.<wbr>bbclass<br>
@@ -192,97 +192,6 @@ IMAGE_CMD_ubi () {<br>
<br>
=C2=A0IMAGE_CMD_ubifs =3D &quot;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLO=
YDIR}/${IMAGE_NAME}$<wbr>{IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}&quot;<br=
>
<br>
-WKS_FILE ??=3D &quot;${IMAGE_BASENAME}.${MACHINE}.<wbr>wks&quot;<br>
-WKS_FILES ?=3D &quot;${WKS_FILE} ${IMAGE_BASENAME}.wks&quot;<br>
-WKS_SEARCH_PATH ?=3D &quot;${THISDIR}:${@&#39;:&#39;.join(&#39;%s/<wbr>wic=
&#39; % p for p in &#39;${BBPATH}&#39;.split(&#39;:&#39;))}:${@&#39;:<wbr>&=
#39;.join(&#39;%s/scripts/lib/wic/<wbr>canned-wks&#39; % l for l in &#39;${=
BBPATH}:${COREBASE}&#39;.split(<wbr>&#39;:&#39;))}&quot;<br>
-WKS_FULL_PATH =3D &quot;${@wks_search(&#39;${WKS_FILES}&#39;.<wbr>split(),=
 &#39;${WKS_SEARCH_PATH}&#39;) or &#39;&#39;}&quot;<br>
-<br>
-def wks_search(files, search_path):<br>
-=C2=A0 =C2=A0 for f in files:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isabs(f):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(f):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return f<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 searched =3D bb.utils.which(sear=
ch_path, f)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if searched:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return searched<br=
>
-<br>
-WIC_CREATE_EXTRA_ARGS ?=3D &quot;&quot;<br>
-<br>
-IMAGE_CMD_wic () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0out=3D&quot;${IMGDEPLOYDIR}/${IMAGE_<wbr>NAME}&=
quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wks=3D&quot;${WKS_FULL_PATH}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$wks&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;No ki=
ckstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE =
or WKS_FILES appropriately.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILDDIR=3D&quot;${TOPDIR}&quot; wic create &qu=
ot;$wks&quot; --vars &quot;${STAGING_DIR}/${MACHINE}/<wbr>imgdata/&quot; -e=
 &quot;${IMAGE_BASENAME}&quot; -o &quot;$out/&quot; ${WIC_CREATE_EXTRA_ARGS=
}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;$out/$(basename &quot;${wks%.wks}&quot=
;)&quot;*.direct &quot;$out${IMAGE_NAME_SUFFIX}.wic&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf &quot;$out/&quot;<br>
-}<br>
-IMAGE_CMD_wic[vardepsexclude] =3D &quot;WKS_FULL_PATH WKS_FILES&quot;<br>
-<br>
-# Rebuild when the wks file or vars in WICVARS change<br>
-USING_WIC =3D &quot;${@bb.utils.contains_any(&#39;<wbr>IMAGE_FSTYPES&#39;,=
 &#39;wic &#39; + &#39; &#39;.join(&#39;wic.%s&#39; % c for c in &#39;${CON=
VERSIONTYPES}&#39;.split()), &#39;1&#39;, &#39;&#39;, d)}&quot;<br>
-WKS_FILE_CHECKSUM =3D &quot;${@&#39;${WKS_FULL_PATH}:%s&#39; % os.path.exi=
sts(&#39;${WKS_FULL_<wbr>PATH}&#39;) if &#39;${USING_WIC}&#39; else &#39;&#=
39;}&quot;<br>
-do_image_wic[file-checksums] +=3D &quot;${WKS_FILE_CHECKSUM}&quot;<br>
-do_image_wic[depends] +=3D &quot;wic-tools:do_build&quot;<br>
-<br>
-python () {<br>
-=C2=A0 =C2=A0 if d.getVar(&#39;USING_WIC&#39;) and &#39;do_bootimg&#39; in=
 d:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_image_<wbr>wic&#39;, =
&#39;&#39;, &#39;do_bootimg&#39;, d)<br>
-}<br>
-<br>
-python do_write_wks_template () {<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;Write out expanded template contents to WK=
S_FULL_PATH.&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 import re<br>
-<br>
-=C2=A0 =C2=A0 template_body =3D d.getVar(&#39;_WKS_TEMPLATE&#39;)<br>
-<br>
-=C2=A0 =C2=A0 # Remove any remnant variable references left behind by the =
expansion<br>
-=C2=A0 =C2=A0 # due to undefined variables<br>
-=C2=A0 =C2=A0 expand_var_regexp =3D re.compile(r&quot;\${[^{}@\n\t :]+}&qu=
ot;)<br>
-=C2=A0 =C2=A0 while True:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_body =3D re.sub(expand_var_regexp, &#39;&#=
39;, template_body)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if new_body =3D=3D template_body:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 template_body =3D new_body<br>
-<br>
-=C2=A0 =C2=A0 wks_file =3D d.getVar(&#39;WKS_FULL_PATH&#39;)<br>
-=C2=A0 =C2=A0 with open(wks_file, &#39;w&#39;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(template_body)<br>
-}<br>
-<br>
-python () {<br>
-=C2=A0 =C2=A0 if d.getVar(&#39;USING_WIC&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file_u =3D d.getVar(&#39;WKS_FULL_PATH&#39=
;, False)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file =3D d.expand(wks_file_u)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 base, ext =3D os.path.splitext(wks_file)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ext =3D=3D &#39;.in&#39; and os.path.exists=
(wks_file):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_out_file =3D os.path.join(d.=
getVar(&#39;<wbr>WORKDIR&#39;), os.path.basename(base))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_FULL_PATH&#39;=
, wks_out_file)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_TEMPLATE_PATH&=
#39;, wks_file_u)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_FILE_CHECKSUM&=
#39;, &#39;${WKS_TEMPLATE_PATH}:True&#39;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to re-parse each time =
the file changes, and bitbake<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # needs to be told about that ex=
plicitly.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.parse.mark_dependency(d, wks_=
file)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(wks_file=
, &#39;r&#39;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 body=
 =3D f.read()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (IOError, OSError) as exc=
:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Previously, I us=
ed expandWithRefs to get the dependency list<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # and add it to WI=
CVARS, but there&#39;s no point re-parsing the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # file in process_=
wks_template as well, so just put it in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # a variable and l=
et the metadata deal with the deps.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;_WKS=
_TEMPLATE&#39;, body)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&=
#39;do_write_<wbr>wks_template&#39;, &#39;do_image_wic&#39;, None, d)<br>
-}<br>
-<br>
=C2=A0EXTRA_IMAGECMD =3D &quot;&quot;<br>
<br>
=C2=A0inherit siteinfo<br>
@@ -380,7 +289,3 @@ IMAGE_EXTENSION_live =3D &quot;hddimg iso&quot;<br>
=C2=A0# The IMAGE_TYPES_MASKED variable will be used to mask out from the I=
MAGE_FSTYPES,<br>
=C2=A0# images that will not be built at do_rootfs time: vmdk, vdi, qcow2, =
hdddirect, hddimg, iso, etc.<br>
=C2=A0IMAGE_TYPES_MASKED ?=3D &quot;&quot;<br>
-<br>
-# The WICVARS variable is used to define list of bitbake variables used in=
 wic code<br>
-# variables from this list is written to &lt;image&gt;.env file<br>
-WICVARS ?=3D &quot;BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD HDDD=
IR IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_F=
STYPES INITRD ISODIR MACHINE_ARCH RECIPE_SYSROOT_NATIVE ROOTFS_SIZE STAGING=
_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
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

--001a1140aa84ca64ce0547532230--
