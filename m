Return-Path: <raltherr@google.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9B42E773C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 17:47:42 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id c7so106683609itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 09:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N8t0jUIqiFrB4SnkEkpyjYs2a4erqdJq7hB2CQs+BWc=;
	b=HsJnmcwebUQXTjqVxI8TLh3/1Yv0oWzpy76CQ3hSF74eNGqBV0izBfJ9760aeEIPw8
	hp6Zbu69CkNjrxosBzyqaFpOHW4evQi+/pyIIp7wGv6jMS7u5ie0xb3osVAI+/LdHZ5T
	0Sd+3FdJH/LU2HuG9qelUiesppUUhXhd4zPcXuGNbc1x8JtSQcvquHsJOn3RF5i8K2D8
	g64iAv4RN5udd8iCU50WrrOc8UW3wmsqnIrBAitkgynE7VqLNzMfqFEdZF5OoducRwQz
	jszF27kN7rIwkKoNfMPqwFfA0HlHDkg0vA0IOH01Ig0c8aPMByTOrfJvoUo/RcDjDlNo
	UdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N8t0jUIqiFrB4SnkEkpyjYs2a4erqdJq7hB2CQs+BWc=;
	b=ZVhdrAP+LyQVb+yocTVq6D+XyPofuyeBTzWCefJhi+TicnfFkCHhKxi40FQpl8YodV
	lyFwHyqEn/woj4hhWSpQAb1fqKIFv9l+JhkQei7B0IcOtg9YnrO+ojJhC6Zb/7qj1QWh
	ICs0oTmUrdaws8f/fwL+ZMwZJ2pFaJVTBj3djQ0S+oWSzJWQfDbCaOL7huNfA4UzVIOv
	BDw4Tt8DcvKy1ZVJ3TbHuP6r1YnUXNlcSoKS00TYaTjIZRoSnfYCQGQOWW1EsQJuSdsc
	DJCcrjjYyMG0RB+6tufJlBrQ1DwkzHl2yeiZQUjow4ywo7S/awBPewD9bPlUmEjPkIxw
	vLZQ==
X-Gm-Message-State: AIkVDXJjwsh9z9sMODQ3vkwZkWZIau8Hy898LBI+gCjqtYDXJHkLucirb06VFhBXF10ZK0PqoX9EpU2zVM9B+rCn
X-Received: by 10.36.53.210 with SMTP id k201mr16159304ita.21.1485798462889;
	Mon, 30 Jan 2017 09:47:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Mon, 30 Jan 2017 09:47:42 -0800 (PST)
In-Reply-To: <20170130171832.GA7232@linux.intel.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
	<257efe25e625e8aaa0f1d435716f0c5f61071700.1485547221.git.ed.bartosh@linux.intel.com>
	<CAPLgG=niaYOrW-zw=k6Z+hWfGRutVSA3bcKk4Ln8MqQR7zpPag@mail.gmail.com>
	<20170130171832.GA7232@linux.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 30 Jan 2017 09:47:42 -0800
Message-ID: <CAPLgG=mr+cwB+5egg_+NP-eyOaR+kYx0V-t=ODA+5dCL+OfXTw@mail.gmail.com>
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
X-List-Received-Date: Mon, 30 Jan 2017 17:47:44 -0000
Content-Type: multipart/alternative; boundary=001a114a8ac496ff450547536952

--001a114a8ac496ff450547536952
Content-Type: text/plain; charset=UTF-8

Hmm.  In local.conf.sample.extended, I find:

# Additional image generation features
#
# The following is a list of classes to import to use in the generation of
images
# currently an example class is image_types_uboot
# IMAGE_CLASSES = " image_types_uboot"

Indeed, image_types_uboot isn't part of IMAGE_CLASSES by default.  I'd
expect a machine config to add wic to IMAGE_CLASSES if it needs wic output.

On Mon, Jan 30, 2017 at 9:18 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> On Mon, Jan 30, 2017 at 09:27:54AM -0800, Rick Altherr wrote:
> > Why didn't you make this image_types_wic.bbclass and use IMAGE_CLASSES to
> > load it?
>
> Because of the following:
> - IMAGE_CLASSES[doc] = "A list of classes that all images should
>   inherit." I'm not sure all images should include wic class. I'll probably
>   make this inheritance conditional.
> - so far IMAGE_CLASSES is used for qemuboot, image_types,
>   image_types_uboot and testimage,
>   so the usage is more or less follows the description. wic is out of
>   that usage scenario, I believe.
> - 'inherit image_wic' is more explicit than IMAGE_CLASSES +=
>   "image_types"\n inherit ${IMAGE_CLASSES}
>
>
> >
> > On Fri, Jan 27, 2017 at 12:19 PM, Ed Bartosh <ed.bartosh@linux.intel.com
> >
> > wrote:
> >
> > > There is a lot of wic code in image.bbclass and image_types.bbclass
> > > Having all code separated in one file should make it more readable
> > > and easier to maintain.
> > >
> > > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > > ---
> > >  meta/classes/image-wic.bbclass   | 120 ++++++++++++++++++++++++++++++
> > > +++++++++
> > >  meta/classes/image.bbclass       |  25 +-------
> > >  meta/classes/image_types.bbclass |  95 ------------------------------
> -
> > >  3 files changed, 122 insertions(+), 118 deletions(-)
> > >  create mode 100644 meta/classes/image-wic.bbclass
> > >
> > > diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-wic.
> > > bbclass
> > > new file mode 100644
> > > index 0000000..2acfd65
> > > --- /dev/null
> > > +++ b/meta/classes/image-wic.bbclass
> > > @@ -0,0 +1,120 @@
> > > +# The WICVARS variable is used to define list of bitbake variables
> used
> > > in wic code
> > > +# variables from this list is written to <image>.env file
> > > +WICVARS ?= "\
> > > +           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD HDDDIR
> > > IMAGE_BASENAME IMAGE_BOOT_FILES \
> > > +           IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD
> ISODIR
> > > MACHINE_ARCH RECIPE_SYSROOT_NATIVE \
> > > +           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR
> > > TARGET_SYS"
> > > +
> > > +WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
> > > +WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
> > > +WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in
> > > '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks'
> % l
> > > for l in '${BBPATH}:${COREBASE}'.split(':'))}"
> > > +WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(),
> > > '${WKS_SEARCH_PATH}') or ''}"
> > > +
> > > +def wks_search(files, search_path):
> > > +    for f in files:
> > > +        if os.path.isabs(f):
> > > +            if os.path.exists(f):
> > > +                return f
> > > +        else:
> > > +            searched = bb.utils.which(search_path, f)
> > > +            if searched:
> > > +                return searched
> > > +
> > > +WIC_CREATE_EXTRA_ARGS ?= ""
> > > +
> > > +IMAGE_CMD_wic () {
> > > +       out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
> > > +       wks="${WKS_FULL_PATH}"
> > > +       if [ -z "$wks" ]; then
> > > +               bbfatal "No kickstart files from WKS_FILES were found:
> > > ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> > > +       fi
> > > +
> > > +       BUILDDIR="${TOPDIR}" wic create "$wks" --vars
> > > "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
> > > ${WIC_CREATE_EXTRA_ARGS}
> > > +       mv "$out/$(basename "${wks%.wks}")"*.direct
> > > "$out${IMAGE_NAME_SUFFIX}.wic"
> > > +       rm -rf "$out/"
> > > +}
> > > +IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
> > > +
> > > +# Rebuild when the wks file or vars in WICVARS change
> > > +USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + '
> > > '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '',
> d)}"
> > > +WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> > > os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
> > > +do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> > > +do_image_wic[depends] += "wic-tools:do_build"
> > > +
> > > +python () {
> > > +    if d.getVar('USING_WIC') and 'do_bootimg' in d:
> > > +        bb.build.addtask('do_image_wic', '', 'do_bootimg', d)
> > > +}
> > > +
> > > +python do_write_wks_template () {
> > > +    """Write out expanded template contents to WKS_FULL_PATH."""
> > > +    import re
> > > +
> > > +    template_body = d.getVar('_WKS_TEMPLATE')
> > > +
> > > +    # Remove any remnant variable references left behind by the
> expansion
> > > +    # due to undefined variables
> > > +    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
> > > +    while True:
> > > +        new_body = re.sub(expand_var_regexp, '', template_body)
> > > +        if new_body == template_body:
> > > +            break
> > > +        else:
> > > +            template_body = new_body
> > > +
> > > +    wks_file = d.getVar('WKS_FULL_PATH')
> > > +    with open(wks_file, 'w') as f:
> > > +        f.write(template_body)
> > > +}
> > > +
> > > +python () {
> > > +    if d.getVar('USING_WIC'):
> > > +        wks_file_u = d.getVar('WKS_FULL_PATH', False)
> > > +        wks_file = d.expand(wks_file_u)
> > > +        base, ext = os.path.splitext(wks_file)
> > > +        if ext == '.in' and os.path.exists(wks_file):
> > > +            wks_out_file = os.path.join(d.getVar('WORKDIR'),
> > > os.path.basename(base))
> > > +            d.setVar('WKS_FULL_PATH', wks_out_file)
> > > +            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> > > +            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
> > > +
> > > +            # We need to re-parse each time the file changes, and
> bitbake
> > > +            # needs to be told about that explicitly.
> > > +            bb.parse.mark_dependency(d, wks_file)
> > > +
> > > +            try:
> > > +                with open(wks_file, 'r') as f:
> > > +                    body = f.read()
> > > +            except (IOError, OSError) as exc:
> > > +                pass
> > > +            else:
> > > +                # Previously, I used expandWithRefs to get the
> dependency
> > > list
> > > +                # and add it to WICVARS, but there's no point
> re-parsing
> > > the
> > > +                # file in process_wks_template as well, so just put
> it in
> > > +                # a variable and let the metadata deal with the deps.
> > > +                d.setVar('_WKS_TEMPLATE', body)
> > > +                bb.build.addtask('do_write_wks_template',
> > > 'do_image_wic', None, d)
> > > +}
> > > +
> > > +#
> > > +# Write environment variables used by wic
> > > +# to tmp/sysroots/<machine>/imgdata/<image>.env
> > > +#
> > > +python do_rootfs_wicenv () {
> > > +    wicvars = d.getVar('WICVARS')
> > > +    if not wicvars:
> > > +        return
> > > +
> > > +    stdir = d.getVar('STAGING_DIR')
> > > +    outdir = os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
> > > +    bb.utils.mkdirhier(outdir)
> > > +    basename = d.getVar('IMAGE_BASENAME')
> > > +    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> > > +        for var in wicvars.split():
> > > +            value = d.getVar(var)
> > > +            if value:
> > > +                envf.write('%s="%s"\n' % (var, value.strip()))
> > > +}
> > > +addtask do_rootfs_wicenv after do_image before do_image_wic
> > > +do_rootfs_wicenv[vardeps] += "${WICVARS}"
> > > +do_rootfs_wicenv[prefuncs] = 'set_image_size'
> > > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > > index 13fd996..1a549e9 100644
> > > --- a/meta/classes/image.bbclass
> > > +++ b/meta/classes/image.bbclass
> > > @@ -192,6 +192,8 @@ python () {
> > >  IMAGE_CLASSES += "image_types"
> > >  inherit ${IMAGE_CLASSES}
> > >
> > > +inherit image-wic
> > > +
> > >  IMAGE_POSTPROCESS_COMMAND ?= ""
> > >
> > >  # some default locales
> > > @@ -332,29 +334,6 @@ fakeroot python do_image_qa () {
> > >  }
> > >  addtask do_image_qa after do_image_complete before do_build
> > >
> > > -#
> > > -# Write environment variables used by wic
> > > -# to tmp/sysroots/<machine>/imgdata/<image>.env
> > > -#
> > > -python do_rootfs_wicenv () {
> > > -    wicvars = d.getVar('WICVARS')
> > > -    if not wicvars:
> > > -        return
> > > -
> > > -    stdir = d.getVar('STAGING_DIR')
> > > -    outdir = os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
> > > -    bb.utils.mkdirhier(outdir)
> > > -    basename = d.getVar('IMAGE_BASENAME')
> > > -    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> > > -        for var in wicvars.split():
> > > -            value = d.getVar(var)
> > > -            if value:
> > > -                envf.write('%s="%s"\n' % (var, value.strip()))
> > > -}
> > > -addtask do_rootfs_wicenv after do_image before do_image_wic
> > > -do_rootfs_wicenv[vardeps] += "${WICVARS}"
> > > -do_rootfs_wicenv[prefuncs] = 'set_image_size'
> > > -
> > >  def setup_debugfs_variables(d):
> > >      d.appendVar('IMAGE_ROOTFS', '-dbg')
> > >      d.appendVar('IMAGE_LINK_NAME', '-dbg')
> > > diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.
> > > bbclass
> > > index ad95dc6..e2ecf93 100644
> > > --- a/meta/classes/image_types.bbclass
> > > +++ b/meta/classes/image_types.bbclass
> > > @@ -192,97 +192,6 @@ IMAGE_CMD_ubi () {
> > >
> > >  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> > > ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs
> ${MKUBIFS_ARGS}"
> > >
> > > -WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
> > > -WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
> > > -WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in
> > > '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks'
> % l
> > > for l in '${BBPATH}:${COREBASE}'.split(':'))}"
> > > -WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(),
> > > '${WKS_SEARCH_PATH}') or ''}"
> > > -
> > > -def wks_search(files, search_path):
> > > -    for f in files:
> > > -        if os.path.isabs(f):
> > > -            if os.path.exists(f):
> > > -                return f
> > > -        else:
> > > -            searched = bb.utils.which(search_path, f)
> > > -            if searched:
> > > -                return searched
> > > -
> > > -WIC_CREATE_EXTRA_ARGS ?= ""
> > > -
> > > -IMAGE_CMD_wic () {
> > > -       out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
> > > -       wks="${WKS_FULL_PATH}"
> > > -       if [ -z "$wks" ]; then
> > > -               bbfatal "No kickstart files from WKS_FILES were found:
> > > ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> > > -       fi
> > > -
> > > -       BUILDDIR="${TOPDIR}" wic create "$wks" --vars
> > > "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
> > > ${WIC_CREATE_EXTRA_ARGS}
> > > -       mv "$out/$(basename "${wks%.wks}")"*.direct
> > > "$out${IMAGE_NAME_SUFFIX}.wic"
> > > -       rm -rf "$out/"
> > > -}
> > > -IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
> > > -
> > > -# Rebuild when the wks file or vars in WICVARS change
> > > -USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + '
> > > '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '',
> d)}"
> > > -WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> > > os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
> > > -do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> > > -do_image_wic[depends] += "wic-tools:do_build"
> > > -
> > > -python () {
> > > -    if d.getVar('USING_WIC') and 'do_bootimg' in d:
> > > -        bb.build.addtask('do_image_wic', '', 'do_bootimg', d)
> > > -}
> > > -
> > > -python do_write_wks_template () {
> > > -    """Write out expanded template contents to WKS_FULL_PATH."""
> > > -    import re
> > > -
> > > -    template_body = d.getVar('_WKS_TEMPLATE')
> > > -
> > > -    # Remove any remnant variable references left behind by the
> expansion
> > > -    # due to undefined variables
> > > -    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
> > > -    while True:
> > > -        new_body = re.sub(expand_var_regexp, '', template_body)
> > > -        if new_body == template_body:
> > > -            break
> > > -        else:
> > > -            template_body = new_body
> > > -
> > > -    wks_file = d.getVar('WKS_FULL_PATH')
> > > -    with open(wks_file, 'w') as f:
> > > -        f.write(template_body)
> > > -}
> > > -
> > > -python () {
> > > -    if d.getVar('USING_WIC'):
> > > -        wks_file_u = d.getVar('WKS_FULL_PATH', False)
> > > -        wks_file = d.expand(wks_file_u)
> > > -        base, ext = os.path.splitext(wks_file)
> > > -        if ext == '.in' and os.path.exists(wks_file):
> > > -            wks_out_file = os.path.join(d.getVar('WORKDIR'),
> > > os.path.basename(base))
> > > -            d.setVar('WKS_FULL_PATH', wks_out_file)
> > > -            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> > > -            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
> > > -
> > > -            # We need to re-parse each time the file changes, and
> bitbake
> > > -            # needs to be told about that explicitly.
> > > -            bb.parse.mark_dependency(d, wks_file)
> > > -
> > > -            try:
> > > -                with open(wks_file, 'r') as f:
> > > -                    body = f.read()
> > > -            except (IOError, OSError) as exc:
> > > -                pass
> > > -            else:
> > > -                # Previously, I used expandWithRefs to get the
> dependency
> > > list
> > > -                # and add it to WICVARS, but there's no point
> re-parsing
> > > the
> > > -                # file in process_wks_template as well, so just put
> it in
> > > -                # a variable and let the metadata deal with the deps.
> > > -                d.setVar('_WKS_TEMPLATE', body)
> > > -                bb.build.addtask('do_write_wks_template',
> > > 'do_image_wic', None, d)
> > > -}
> > > -
> > >  EXTRA_IMAGECMD = ""
> > >
> > >  inherit siteinfo
> > > @@ -380,7 +289,3 @@ IMAGE_EXTENSION_live = "hddimg iso"
> > >  # The IMAGE_TYPES_MASKED variable will be used to mask out from the
> > > IMAGE_FSTYPES,
> > >  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2,
> > > hdddirect, hddimg, iso, etc.
> > >  IMAGE_TYPES_MASKED ?= ""
> > > -
> > > -# The WICVARS variable is used to define list of bitbake variables
> used
> > > in wic code
> > > -# variables from this list is written to <image>.env file
> > > -WICVARS ?= "BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD HDDDIR
> > > IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS
> > > INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH RECIPE_SYSROOT_NATIVE
> > > ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS"
> > > --
> > > 2.1.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
>
> --
> --
> Regards,
> Ed
>

--001a114a8ac496ff450547536952
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hmm.=C2=A0 In local.conf.sample.extended, I find:<div><div=
><br></div><div># Additional image generation features</div><div>#</div><di=
v># The following is a list of classes to import to use in the generation o=
f images</div><div># currently an example class is image_types_uboot</div><=
div># IMAGE_CLASSES =3D &quot; image_types_uboot&quot;</div><div><br></div>=
</div><div>Indeed, image_types_uboot isn&#39;t part of IMAGE_CLASSES by def=
ault.=C2=A0 I&#39;d expect a machine config to add wic to IMAGE_CLASSES if =
it needs wic output.</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Mon, Jan 30, 2017 at 9:18 AM, Ed Bartosh <span dir=3D"l=
tr">&lt;<a href=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.=
bartosh@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><span class=3D"">On Mon, Jan 30, 2017 at 09:27:54AM -0800, Rick Alther=
r wrote:<br>
&gt; Why didn&#39;t you make this image_types_wic.bbclass and use IMAGE_CLA=
SSES to<br>
&gt; load it?<br>
<br>
</span>Because of the following:<br>
- IMAGE_CLASSES[doc] =3D &quot;A list of classes that all images should<br>
=C2=A0 inherit.&quot; I&#39;m not sure all images should include wic class.=
 I&#39;ll probably<br>
=C2=A0 make this inheritance conditional.<br>
- so far IMAGE_CLASSES is used for qemuboot, image_types,<br>
=C2=A0 image_types_uboot and testimage,<br>
=C2=A0 so the usage is more or less follows the description. wic is out of<=
br>
=C2=A0 that usage scenario, I believe.<br>
- &#39;inherit image_wic&#39; is more explicit than IMAGE_CLASSES +=3D<br>
=C2=A0 &quot;image_types&quot;\n inherit ${IMAGE_CLASSES}<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;<br>
&gt; On Fri, Jan 27, 2017 at 12:19 PM, Ed Bartosh &lt;<a href=3D"mailto:ed.=
bartosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; There is a lot of wic code in image.bbclass and image_types.bbcla=
ss<br>
&gt; &gt; Having all code separated in one file should make it more readabl=
e<br>
&gt; &gt; and easier to maintain.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.=
intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes/image-wic.bbclass=C2=A0 =C2=A0| 120 ++++++++++=
++++++++++++++++++++<br>
&gt; &gt; +++++++++<br>
&gt; &gt;=C2=A0 meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 25 +-------<br>
&gt; &gt;=C2=A0 meta/classes/image_types.<wbr>bbclass |=C2=A0 95 ----------=
--------------------<wbr>-<br>
&gt; &gt;=C2=A0 3 files changed, 122 insertions(+), 118 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/classes/image-wic.bbclass<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/image-wic.<wbr>bbclass b/meta/classes/i=
mage-wic.<br>
&gt; &gt; bbclass<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..2acfd65<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/classes/image-wic.<wbr>bbclass<br>
&gt; &gt; @@ -0,0 +1,120 @@<br>
&gt; &gt; +# The WICVARS variable is used to define list of bitbake variabl=
es used<br>
&gt; &gt; in wic code<br>
&gt; &gt; +# variables from this list is written to &lt;image&gt;.env file<=
br>
&gt; &gt; +WICVARS ?=3D &quot;\<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BBLAYERS IMGDEPLOYDIR D=
EPLOY_DIR_IMAGE FAKEROOTCMD HDDDIR<br>
&gt; &gt; IMAGE_BASENAME IMAGE_BOOT_FILES \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_LINK_NAME IMAGE_R=
OOTFS INITRAMFS_FSTYPES INITRD ISODIR<br>
&gt; &gt; MACHINE_ARCH RECIPE_SYSROOT_NATIVE \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ROOTFS_SIZE STAGING_DAT=
ADIR STAGING_DIR STAGING_LIBDIR<br>
&gt; &gt; TARGET_SYS&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +WKS_FILE ??=3D &quot;${IMAGE_BASENAME}.${MACHINE}.<wbr>wks&quot;=
<br>
&gt; &gt; +WKS_FILES ?=3D &quot;${WKS_FILE} ${IMAGE_BASENAME}.wks&quot;<br>
&gt; &gt; +WKS_SEARCH_PATH ?=3D &quot;${THISDIR}:${@&#39;:&#39;.join(&#39;%=
s/<wbr>wic&#39; % p for p in<br>
&gt; &gt; &#39;${BBPATH}&#39;.split(&#39;:&#39;))}:${@&#39;:<wbr>&#39;.join=
(&#39;%s/scripts/lib/wic/<wbr>canned-wks&#39; % l<br>
&gt; &gt; for l in &#39;${BBPATH}:${COREBASE}&#39;.split(<wbr>&#39;:&#39;))=
}&quot;<br>
&gt; &gt; +WKS_FULL_PATH =3D &quot;${@wks_search(&#39;${WKS_FILES}&#39;.<wb=
r>split(),<br>
&gt; &gt; &#39;${WKS_SEARCH_PATH}&#39;) or &#39;&#39;}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +def wks_search(files, search_path):<br>
&gt; &gt; +=C2=A0 =C2=A0 for f in files:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isabs(f):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(f):<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return f=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 searched =3D bb.utils.=
which(search_path, f)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if searched:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s=
earched<br>
&gt; &gt; +<br>
&gt; &gt; +WIC_CREATE_EXTRA_ARGS ?=3D &quot;&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +IMAGE_CMD_wic () {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0out=3D&quot;${IMGDEPLOYDIR}/${IMAGE_<=
wbr>NAME}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0wks=3D&quot;${WKS_FULL_PATH}&quot;<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$wks&quot; ]; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &=
quot;No kickstart files from WKS_FILES were found:<br>
&gt; &gt; ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately.&quo=
t;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILDDIR=3D&quot;${TOPDIR}&quot; wic =
create &quot;$wks&quot; --vars<br>
&gt; &gt; &quot;${STAGING_DIR}/${MACHINE}/<wbr>imgdata/&quot; -e &quot;${IM=
AGE_BASENAME}&quot; -o &quot;$out/&quot;<br>
&gt; &gt; ${WIC_CREATE_EXTRA_ARGS}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;$out/$(basename &quot;${wks%=
.wks}&quot;)&quot;*.direct<br>
&gt; &gt; &quot;$out${IMAGE_NAME_SUFFIX}.wic&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf &quot;$out/&quot;<br>
&gt; &gt; +}<br>
&gt; &gt; +IMAGE_CMD_wic[vardepsexclude] =3D &quot;WKS_FULL_PATH WKS_FILES&=
quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# Rebuild when the wks file or vars in WICVARS change<br>
&gt; &gt; +USING_WIC =3D &quot;${@bb.utils.contains_any(&#39;<wbr>IMAGE_FST=
YPES&#39;, &#39;wic &#39; + &#39;<br>
&gt; &gt; &#39;.join(&#39;wic.%s&#39; % c for c in &#39;${CONVERSIONTYPES}&=
#39;.split()), &#39;1&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; +WKS_FILE_CHECKSUM =3D &quot;${@&#39;${WKS_FULL_PATH}:%s&#39; %<b=
r>
&gt; &gt; os.path.exists(&#39;${WKS_FULL_<wbr>PATH}&#39;) if &#39;${USING_W=
IC}&#39; else &#39;&#39;}&quot;<br>
&gt; &gt; +do_image_wic[file-checksums] +=3D &quot;${WKS_FILE_CHECKSUM}&quo=
t;<br>
&gt; &gt; +do_image_wic[depends] +=3D &quot;wic-tools:do_build&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +python () {<br>
&gt; &gt; +=C2=A0 =C2=A0 if d.getVar(&#39;USING_WIC&#39;) and &#39;do_booti=
mg&#39; in d:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_image_<wbr>=
wic&#39;, &#39;&#39;, &#39;do_bootimg&#39;, d)<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +python do_write_wks_template () {<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Write out expanded template cont=
ents to WKS_FULL_PATH.&quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 import re<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 template_body =3D d.getVar(&#39;_WKS_TEMPLATE&#39;=
)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 # Remove any remnant variable references left behi=
nd by the expansion<br>
&gt; &gt; +=C2=A0 =C2=A0 # due to undefined variables<br>
&gt; &gt; +=C2=A0 =C2=A0 expand_var_regexp =3D re.compile(r&quot;\${[^{}@\n=
\t :]+}&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 while True:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_body =3D re.sub(expand_var_regex=
p, &#39;&#39;, template_body)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if new_body =3D=3D template_body:<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 template_body =3D new_=
body<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 wks_file =3D d.getVar(&#39;WKS_FULL_PATH&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 with open(wks_file, &#39;w&#39;) as f:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(template_body)<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +python () {<br>
&gt; &gt; +=C2=A0 =C2=A0 if d.getVar(&#39;USING_WIC&#39;):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file_u =3D d.getVar(&#39;WKS_FUL=
L_PATH&#39;, False)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file =3D d.expand(wks_file_u)<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 base, ext =3D os.path.splitext(wks_f=
ile)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ext =3D=3D &#39;.in&#39; and os.p=
ath.exists(wks_file):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_out_file =3D os.pa=
th.join(d.getVar(&#39;<wbr>WORKDIR&#39;),<br>
&gt; &gt; os.path.basename(base))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_FULL=
_PATH&#39;, wks_out_file)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_TEMP=
LATE_PATH&#39;, wks_file_u)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_FILE=
_CHECKSUM&#39;, &#39;${WKS_TEMPLATE_PATH}:True&#39;)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to re-parse =
each time the file changes, and bitbake<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # needs to be told abo=
ut that explicitly.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.parse.mark_dependen=
cy(d, wks_file)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ope=
n(wks_file, &#39;r&#39;) as f:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 body =3D f.read()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (IOError, OSErr=
or) as exc:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Previo=
usly, I used expandWithRefs to get the dependency<br>
&gt; &gt; list<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # and ad=
d it to WICVARS, but there&#39;s no point re-parsing<br>
&gt; &gt; the<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # file i=
n process_wks_template as well, so just put it in<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # a vari=
able and let the metadata deal with the deps.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar=
(&#39;_WKS_TEMPLATE&#39;, body)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build=
.addtask(&#39;do_write_<wbr>wks_template&#39;,<br>
&gt; &gt; &#39;do_image_wic&#39;, None, d)<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +#<br>
&gt; &gt; +# Write environment variables used by wic<br>
&gt; &gt; +# to tmp/sysroots/&lt;machine&gt;/<wbr>imgdata/&lt;image&gt;.env=
<br>
&gt; &gt; +#<br>
&gt; &gt; +python do_rootfs_wicenv () {<br>
&gt; &gt; +=C2=A0 =C2=A0 wicvars =3D d.getVar(&#39;WICVARS&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 if not wicvars:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 stdir =3D d.getVar(&#39;STAGING_DIR&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 outdir =3D os.path.join(stdir, d.getVar(&#39;MACHI=
NE&#39;), &#39;imgdata&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 bb.utils.mkdirhier(outdir)<br>
&gt; &gt; +=C2=A0 =C2=A0 basename =3D d.getVar(&#39;IMAGE_BASENAME&#39;)<br=
>
&gt; &gt; +=C2=A0 =C2=A0 with open(os.path.join(outdir, basename) + &#39;.e=
nv&#39;, &#39;w&#39;) as envf:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in wicvars.split():<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D d.getVar(var=
)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if value:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 envf.wri=
te(&#39;%s=3D&quot;%s&quot;\n&#39; % (var, value.strip()))<br>
&gt; &gt; +}<br>
&gt; &gt; +addtask do_rootfs_wicenv after do_image before do_image_wic<br>
&gt; &gt; +do_rootfs_wicenv[vardeps] +=3D &quot;${WICVARS}&quot;<br>
&gt; &gt; +do_rootfs_wicenv[prefuncs] =3D &#39;set_image_size&#39;<br>
&gt; &gt; diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbcl=
ass<br>
&gt; &gt; index 13fd996..1a549e9 100644<br>
&gt; &gt; --- a/meta/classes/image.bbclass<br>
&gt; &gt; +++ b/meta/classes/image.bbclass<br>
&gt; &gt; @@ -192,6 +192,8 @@ python () {<br>
&gt; &gt;=C2=A0 IMAGE_CLASSES +=3D &quot;image_types&quot;<br>
&gt; &gt;=C2=A0 inherit ${IMAGE_CLASSES}<br>
&gt; &gt;<br>
&gt; &gt; +inherit image-wic<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 IMAGE_POSTPROCESS_COMMAND ?=3D &quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # some default locales<br>
&gt; &gt; @@ -332,29 +334,6 @@ fakeroot python do_image_qa () {<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;=C2=A0 addtask do_image_qa after do_image_complete before do_build=
<br>
&gt; &gt;<br>
&gt; &gt; -#<br>
&gt; &gt; -# Write environment variables used by wic<br>
&gt; &gt; -# to tmp/sysroots/&lt;machine&gt;/<wbr>imgdata/&lt;image&gt;.env=
<br>
&gt; &gt; -#<br>
&gt; &gt; -python do_rootfs_wicenv () {<br>
&gt; &gt; -=C2=A0 =C2=A0 wicvars =3D d.getVar(&#39;WICVARS&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 if not wicvars:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 stdir =3D d.getVar(&#39;STAGING_DIR&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 outdir =3D os.path.join(stdir, d.getVar(&#39;MACHI=
NE&#39;), &#39;imgdata&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 bb.utils.mkdirhier(outdir)<br>
&gt; &gt; -=C2=A0 =C2=A0 basename =3D d.getVar(&#39;IMAGE_BASENAME&#39;)<br=
>
&gt; &gt; -=C2=A0 =C2=A0 with open(os.path.join(outdir, basename) + &#39;.e=
nv&#39;, &#39;w&#39;) as envf:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in wicvars.split():<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D d.getVar(var=
)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if value:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 envf.wri=
te(&#39;%s=3D&quot;%s&quot;\n&#39; % (var, value.strip()))<br>
&gt; &gt; -}<br>
&gt; &gt; -addtask do_rootfs_wicenv after do_image before do_image_wic<br>
&gt; &gt; -do_rootfs_wicenv[vardeps] +=3D &quot;${WICVARS}&quot;<br>
&gt; &gt; -do_rootfs_wicenv[prefuncs] =3D &#39;set_image_size&#39;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 def setup_debugfs_variables(d):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;IMAGE_ROOTFS&#39;, &#39;-dbg=
&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;IMAGE_LINK_NAME&#39;, &#39;-=
dbg&#39;)<br>
&gt; &gt; diff --git a/meta/classes/image_types.<wbr>bbclass b/meta/classes=
/image_types.<br>
&gt; &gt; bbclass<br>
&gt; &gt; index ad95dc6..e2ecf93 100644<br>
&gt; &gt; --- a/meta/classes/image_types.<wbr>bbclass<br>
&gt; &gt; +++ b/meta/classes/image_types.<wbr>bbclass<br>
&gt; &gt; @@ -192,97 +192,6 @@ IMAGE_CMD_ubi () {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 IMAGE_CMD_ubifs =3D &quot;mkfs.ubifs -r ${IMAGE_ROOTFS} -o<=
br>
&gt; &gt; ${IMGDEPLOYDIR}/${IMAGE_NAME}$<wbr>{IMAGE_NAME_SUFFIX}.ubifs ${MK=
UBIFS_ARGS}&quot;<br>
&gt; &gt;<br>
&gt; &gt; -WKS_FILE ??=3D &quot;${IMAGE_BASENAME}.${MACHINE}.<wbr>wks&quot;=
<br>
&gt; &gt; -WKS_FILES ?=3D &quot;${WKS_FILE} ${IMAGE_BASENAME}.wks&quot;<br>
&gt; &gt; -WKS_SEARCH_PATH ?=3D &quot;${THISDIR}:${@&#39;:&#39;.join(&#39;%=
s/<wbr>wic&#39; % p for p in<br>
&gt; &gt; &#39;${BBPATH}&#39;.split(&#39;:&#39;))}:${@&#39;:<wbr>&#39;.join=
(&#39;%s/scripts/lib/wic/<wbr>canned-wks&#39; % l<br>
&gt; &gt; for l in &#39;${BBPATH}:${COREBASE}&#39;.split(<wbr>&#39;:&#39;))=
}&quot;<br>
&gt; &gt; -WKS_FULL_PATH =3D &quot;${@wks_search(&#39;${WKS_FILES}&#39;.<wb=
r>split(),<br>
&gt; &gt; &#39;${WKS_SEARCH_PATH}&#39;) or &#39;&#39;}&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -def wks_search(files, search_path):<br>
&gt; &gt; -=C2=A0 =C2=A0 for f in files:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isabs(f):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(f):<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return f=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 searched =3D bb.utils.=
which(search_path, f)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if searched:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s=
earched<br>
&gt; &gt; -<br>
&gt; &gt; -WIC_CREATE_EXTRA_ARGS ?=3D &quot;&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -IMAGE_CMD_wic () {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0out=3D&quot;${IMGDEPLOYDIR}/${IMAGE_<=
wbr>NAME}&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0wks=3D&quot;${WKS_FULL_PATH}&quot;<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$wks&quot; ]; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &=
quot;No kickstart files from WKS_FILES were found:<br>
&gt; &gt; ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately.&quo=
t;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILDDIR=3D&quot;${TOPDIR}&quot; wic =
create &quot;$wks&quot; --vars<br>
&gt; &gt; &quot;${STAGING_DIR}/${MACHINE}/<wbr>imgdata/&quot; -e &quot;${IM=
AGE_BASENAME}&quot; -o &quot;$out/&quot;<br>
&gt; &gt; ${WIC_CREATE_EXTRA_ARGS}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;$out/$(basename &quot;${wks%=
.wks}&quot;)&quot;*.direct<br>
&gt; &gt; &quot;$out${IMAGE_NAME_SUFFIX}.wic&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf &quot;$out/&quot;<br>
&gt; &gt; -}<br>
&gt; &gt; -IMAGE_CMD_wic[vardepsexclude] =3D &quot;WKS_FULL_PATH WKS_FILES&=
quot;<br>
&gt; &gt; -<br>
&gt; &gt; -# Rebuild when the wks file or vars in WICVARS change<br>
&gt; &gt; -USING_WIC =3D &quot;${@bb.utils.contains_any(&#39;<wbr>IMAGE_FST=
YPES&#39;, &#39;wic &#39; + &#39;<br>
&gt; &gt; &#39;.join(&#39;wic.%s&#39; % c for c in &#39;${CONVERSIONTYPES}&=
#39;.split()), &#39;1&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; -WKS_FILE_CHECKSUM =3D &quot;${@&#39;${WKS_FULL_PATH}:%s&#39; %<b=
r>
&gt; &gt; os.path.exists(&#39;${WKS_FULL_<wbr>PATH}&#39;) if &#39;${USING_W=
IC}&#39; else &#39;&#39;}&quot;<br>
&gt; &gt; -do_image_wic[file-checksums] +=3D &quot;${WKS_FILE_CHECKSUM}&quo=
t;<br>
&gt; &gt; -do_image_wic[depends] +=3D &quot;wic-tools:do_build&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -python () {<br>
&gt; &gt; -=C2=A0 =C2=A0 if d.getVar(&#39;USING_WIC&#39;) and &#39;do_booti=
mg&#39; in d:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_image_<wbr>=
wic&#39;, &#39;&#39;, &#39;do_bootimg&#39;, d)<br>
&gt; &gt; -}<br>
&gt; &gt; -<br>
&gt; &gt; -python do_write_wks_template () {<br>
&gt; &gt; -=C2=A0 =C2=A0 &quot;&quot;&quot;Write out expanded template cont=
ents to WKS_FULL_PATH.&quot;&quot;&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 import re<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 template_body =3D d.getVar(&#39;_WKS_TEMPLATE&#39;=
)<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 # Remove any remnant variable references left behi=
nd by the expansion<br>
&gt; &gt; -=C2=A0 =C2=A0 # due to undefined variables<br>
&gt; &gt; -=C2=A0 =C2=A0 expand_var_regexp =3D re.compile(r&quot;\${[^{}@\n=
\t :]+}&quot;)<br>
&gt; &gt; -=C2=A0 =C2=A0 while True:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_body =3D re.sub(expand_var_regex=
p, &#39;&#39;, template_body)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if new_body =3D=3D template_body:<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 template_body =3D new_=
body<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 wks_file =3D d.getVar(&#39;WKS_FULL_PATH&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 with open(wks_file, &#39;w&#39;) as f:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(template_body)<br>
&gt; &gt; -}<br>
&gt; &gt; -<br>
&gt; &gt; -python () {<br>
&gt; &gt; -=C2=A0 =C2=A0 if d.getVar(&#39;USING_WIC&#39;):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file_u =3D d.getVar(&#39;WKS_FUL=
L_PATH&#39;, False)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file =3D d.expand(wks_file_u)<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 base, ext =3D os.path.splitext(wks_f=
ile)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ext =3D=3D &#39;.in&#39; and os.p=
ath.exists(wks_file):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_out_file =3D os.pa=
th.join(d.getVar(&#39;<wbr>WORKDIR&#39;),<br>
&gt; &gt; os.path.basename(base))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_FULL=
_PATH&#39;, wks_out_file)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_TEMP=
LATE_PATH&#39;, wks_file_u)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_FILE=
_CHECKSUM&#39;, &#39;${WKS_TEMPLATE_PATH}:True&#39;)<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to re-parse =
each time the file changes, and bitbake<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # needs to be told abo=
ut that explicitly.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.parse.mark_dependen=
cy(d, wks_file)<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ope=
n(wks_file, &#39;r&#39;) as f:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 body =3D f.read()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (IOError, OSErr=
or) as exc:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Previo=
usly, I used expandWithRefs to get the dependency<br>
&gt; &gt; list<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # and ad=
d it to WICVARS, but there&#39;s no point re-parsing<br>
&gt; &gt; the<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # file i=
n process_wks_template as well, so just put it in<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # a vari=
able and let the metadata deal with the deps.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar=
(&#39;_WKS_TEMPLATE&#39;, body)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build=
.addtask(&#39;do_write_<wbr>wks_template&#39;,<br>
&gt; &gt; &#39;do_image_wic&#39;, None, d)<br>
&gt; &gt; -}<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 EXTRA_IMAGECMD =3D &quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit siteinfo<br>
&gt; &gt; @@ -380,7 +289,3 @@ IMAGE_EXTENSION_live =3D &quot;hddimg iso&quo=
t;<br>
&gt; &gt;=C2=A0 # The IMAGE_TYPES_MASKED variable will be used to mask out =
from the<br>
&gt; &gt; IMAGE_FSTYPES,<br>
&gt; &gt;=C2=A0 # images that will not be built at do_rootfs time: vmdk, vd=
i, qcow2,<br>
&gt; &gt; hdddirect, hddimg, iso, etc.<br>
&gt; &gt;=C2=A0 IMAGE_TYPES_MASKED ?=3D &quot;&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -# The WICVARS variable is used to define list of bitbake variabl=
es used<br>
&gt; &gt; in wic code<br>
&gt; &gt; -# variables from this list is written to &lt;image&gt;.env file<=
br>
&gt; &gt; -WICVARS ?=3D &quot;BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKERO=
OTCMD HDDDIR<br>
&gt; &gt; IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS<br>
&gt; &gt; INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH RECIPE_SYSROOT_NATIV=
E<br>
&gt; &gt; ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS=
&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.1.4<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; ______________________________<wbr>_________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.<wbr>openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt; &gt;<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
--<br>
Regards,<br>
Ed<br>
</font></span></blockquote></div><br></div>

--001a114a8ac496ff450547536952--
