Return-Path: <raltherr@google.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9209177404
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 19:07:23 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id r185so108705902ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 11:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/Qulhmh2edwwx2lnZ3uIuIf59DfMwX8sQM0JFRkdGkQ=;
	b=KM82v8uEUpjPWAyrHvjRrjIrEY1g/vkjAAGgzZHPqH+tAi9+N4OJHjrPGXj+SygXt0
	C7U0z5vOKinZ+BDvrVqzjDitsZC2cpFt5ltcV0+jwcRqYB4NC/cIKTPG6+nr4ABK0k+t
	n2z2ECVXYENK2t5L5NWxYpvkKev4xmtFClP9a8BCF9AwV+x7iP3yu01xMLFWL0RHAhK/
	1c1dgHKEb5idrScaVJv/S8vFSsksqInDMETC3pf+O2EPC7SQUGnqgVJIRVXfgBisAw29
	JK4PAjDzBOwzcyc4qDUIMj1Ad9hxEMbt90yED6nQhZZ2kBpX/ekLykGlm0Qq5lgHZXg1
	d3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/Qulhmh2edwwx2lnZ3uIuIf59DfMwX8sQM0JFRkdGkQ=;
	b=BfpP8Vn+Znb4TBoR38yt6qHCjfSdGNgc9p15vTGFeZ9ljVrLCjh25eUUHQ/2XR0yVQ
	8Xz6ubjzqru2XbzrKKXtNd6EQPIB4SNbcapypqVVy4DsxshntFHDCWOKWMP0QX9Q5roR
	QqttTV+Wat4GsyqZ5R2RGoF7sXEvxUG6jCRl3KlUPtidKuSsvbgaTIOiyPVTVpyXy0zf
	eGyzqeN2zqxl12lVzfd+vy75CtgpI2MhTPhjY8wZ9oMbUmkIVs24BP1dPirVljqzMQN/
	0uGMagDS/mqMgYR7eahXQWsHGYSufYofqP+D7w6+FILSdrRrbMPxEqOrfS4KnKyp9qRH
	SrIg==
X-Gm-Message-State: AIkVDXJGMddzyVdZ9C87NhjfSKNzo5jHZbLbeUOSonMdIE+LuLwwEUT6DCELfA0AnBhu9zui9DlyGGvhoD1Vxu7k
X-Received: by 10.36.64.70 with SMTP id n67mr16299448ita.21.1485803243381;
	Mon, 30 Jan 2017 11:07:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Mon, 30 Jan 2017 11:07:22 -0800 (PST)
In-Reply-To: <20170130184254.GA10554@linux.intel.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
	<257efe25e625e8aaa0f1d435716f0c5f61071700.1485547221.git.ed.bartosh@linux.intel.com>
	<CAPLgG=niaYOrW-zw=k6Z+hWfGRutVSA3bcKk4Ln8MqQR7zpPag@mail.gmail.com>
	<20170130171832.GA7232@linux.intel.com>
	<CAPLgG=mr+cwB+5egg_+NP-eyOaR+kYx0V-t=ODA+5dCL+OfXTw@mail.gmail.com>
	<20170130174514.GA19307@linux.intel.com>
	<CAPLgG=kRKruYtVmU2ugRwwmJUm9MT+HirNm-83N72QDvMm7rbw@mail.gmail.com>
	<20170130181533.GA14744@linux.intel.com>
	<CAPLgG==1uuW6R_21gCpzAgDpwKswDRx-apC_gEL5mjD9R_rjwg@mail.gmail.com>
	<20170130184254.GA10554@linux.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 30 Jan 2017 11:07:22 -0800
Message-ID: <CAPLgG=nChvVyg9thDQp43yW1irnBZWUdxgbz8LsM5a-vcy1yPA@mail.gmail.com>
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
X-List-Received-Date: Mon, 30 Jan 2017 19:07:23 -0000
Content-Type: multipart/alternative; boundary=001a1135a57a87a1ca05475486c9

--001a1135a57a87a1ca05475486c9
Content-Type: text/plain; charset=UTF-8

LGTM

On Mon, Jan 30, 2017 at 10:42 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> On Mon, Jan 30, 2017 at 10:41:27AM -0800, Rick Altherr wrote:
> > Agreed.  What if it was image_types_wic.bbclass and you did something
> > similar to build_uboot() in image.bbclass?
> >
>
> I can do this for now:
> IMAGE_TYPE_wic = "image_type_wic"
> inherit ${IMAGE_TYPE_wic}
>
> which is the same as 'inherit image_type_wic', just takes 2 lines, but
> looks more consistent.
>
> does this look ok?
>
> > On Mon, Jan 30, 2017 at 10:15 AM, Ed Bartosh <ed.bartosh@linux.intel.com
> >
> > wrote:
> >
> > > On Mon, Jan 30, 2017 at 10:25:59AM -0800, Rick Altherr wrote:
> > > > I'm not clear on which path is the preferred one.  There are lots of
> bits
> > > > and pieces in image_types.bbclass that implement various image types.
> > > >  uboot got added as a separate class at some point.  The comments in
> > > > local.conf.sample.extended imply IMAGE_CLASSES should be used to load
> > > > additional image_types_* classes to add support for additional image
> > > > types.  Having the wic image type implemented in a separate
> > > > image-wic.bbclass that is directly inherited by image.bbclass adds a
> 3rd
> > > > approach.  Which one do we want contributors to use in the future?
> > > >
> > >
> > > I didn't want to create even more confusion. What I wanted is stated
> in the
> > > commit message - to put existing wic code into a file for better
> > > maintenance. If this is more confusing than having wic code in
> different
> > > places of image.class and image_types.class then we can just drop this
> > > patch. However, I personally find it more maintainable this way.
> > >
> > > Suggesting people to change machine configs just because wic code is
> > > moved to separate file doesn't look good to me either.
> > >
> > > > On Mon, Jan 30, 2017 at 9:45 AM, Ed Bartosh <
> ed.bartosh@linux.intel.com>
> > > > wrote:
> > > >
> > > > > On Mon, Jan 30, 2017 at 09:47:42AM -0800, Rick Altherr wrote:
> > > > > > Hmm.  In local.conf.sample.extended, I find:
> > > > > >
> > > > > > # Additional image generation features
> > > > > > #
> > > > > > # The following is a list of classes to import to use in the
> > > generation
> > > > > of
> > > > > > images
> > > > > > # currently an example class is image_types_uboot
> > > > > > # IMAGE_CLASSES = " image_types_uboot"
> > > > > >
> > > > > > Indeed, image_types_uboot isn't part of IMAGE_CLASSES by default.
> > > I'd
> > > > > > expect a machine config to add wic to IMAGE_CLASSES if it needs
> wic
> > > > > output.
> > > > > >
> > > > >
> > > > > So far all machine configs add wic to IMAGE_TYPES and it works just
> > > > > fine. Why to change?
> > > > >
> > > > > > On Mon, Jan 30, 2017 at 9:18 AM, Ed Bartosh <
> > > ed.bartosh@linux.intel.com>
> > > > > > wrote:
> > > > > >
> > > > > > > On Mon, Jan 30, 2017 at 09:27:54AM -0800, Rick Altherr wrote:
> > > > > > > > Why didn't you make this image_types_wic.bbclass and use
> > > > > IMAGE_CLASSES to
> > > > > > > > load it?
> > > > > > >
> > > > > > > Because of the following:
> > > > > > > - IMAGE_CLASSES[doc] = "A list of classes that all images
> should
> > > > > > >   inherit." I'm not sure all images should include wic class.
> I'll
> > > > > probably
> > > > > > >   make this inheritance conditional.
> > > > > > > - so far IMAGE_CLASSES is used for qemuboot, image_types,
> > > > > > >   image_types_uboot and testimage,
> > > > > > >   so the usage is more or less follows the description. wic is
> out
> > > of
> > > > > > >   that usage scenario, I believe.
> > > > > > > - 'inherit image_wic' is more explicit than IMAGE_CLASSES +=
> > > > > > >   "image_types"\n inherit ${IMAGE_CLASSES}
> > > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > On Fri, Jan 27, 2017 at 12:19 PM, Ed Bartosh <
> > > > > ed.bartosh@linux.intel.com
> > > > > > > >
> > > > > > > > wrote:
> > > > > > > >
> > > > > > > > > There is a lot of wic code in image.bbclass and
> > > image_types.bbclass
> > > > > > > > > Having all code separated in one file should make it more
> > > readable
> > > > > > > > > and easier to maintain.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > > > > > > > > ---
> > > > > > > > >  meta/classes/image-wic.bbclass   | 120
> > > > > ++++++++++++++++++++++++++++++
> > > > > > > > > +++++++++
> > > > > > > > >  meta/classes/image.bbclass       |  25 +-------
> > > > > > > > >  meta/classes/image_types.bbclass |  95
> > > > > ------------------------------
> > > > > > > -
> > > > > > > > >  3 files changed, 122 insertions(+), 118 deletions(-)
> > > > > > > > >  create mode 100644 meta/classes/image-wic.bbclass
> > > > > > > > >
> > > > > > > > > diff --git a/meta/classes/image-wic.bbclass
> > > > > b/meta/classes/image-wic.
> > > > > > > > > bbclass
> > > > > > > > > new file mode 100644
> > > > > > > > > index 0000000..2acfd65
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/meta/classes/image-wic.bbclass
> > > > > > > > > @@ -0,0 +1,120 @@
> > > > > > > > > +# The WICVARS variable is used to define list of bitbake
> > > variables
> > > > > > > used
> > > > > > > > > in wic code
> > > > > > > > > +# variables from this list is written to <image>.env file
> > > > > > > > > +WICVARS ?= "\
> > > > > > > > > +           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE
> FAKEROOTCMD
> > > > > HDDDIR
> > > > > > > > > IMAGE_BASENAME IMAGE_BOOT_FILES \
> > > > > > > > > +           IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES
> > > INITRD
> > > > > > > ISODIR
> > > > > > > > > MACHINE_ARCH RECIPE_SYSROOT_NATIVE \
> > > > > > > > > +           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR
> > > STAGING_LIBDIR
> > > > > > > > > TARGET_SYS"
> > > > > > > > > +
> > > > > > > > > +WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
> > > > > > > > > +WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
> > > > > > > > > +WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p
> for
> > > p in
> > > > > > > > > '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/
> > > > > canned-wks'
> > > > > > > % l
> > > > > > > > > for l in '${BBPATH}:${COREBASE}'.split(':'))}"
> > > > > > > > > +WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(),
> > > > > > > > > '${WKS_SEARCH_PATH}') or ''}"
> > > > > > > > > +
> > > > > > > > > +def wks_search(files, search_path):
> > > > > > > > > +    for f in files:
> > > > > > > > > +        if os.path.isabs(f):
> > > > > > > > > +            if os.path.exists(f):
> > > > > > > > > +                return f
> > > > > > > > > +        else:
> > > > > > > > > +            searched = bb.utils.which(search_path, f)
> > > > > > > > > +            if searched:
> > > > > > > > > +                return searched
> > > > > > > > > +
> > > > > > > > > +WIC_CREATE_EXTRA_ARGS ?= ""
> > > > > > > > > +
> > > > > > > > > +IMAGE_CMD_wic () {
> > > > > > > > > +       out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
> > > > > > > > > +       wks="${WKS_FULL_PATH}"
> > > > > > > > > +       if [ -z "$wks" ]; then
> > > > > > > > > +               bbfatal "No kickstart files from WKS_FILES
> were
> > > > > found:
> > > > > > > > > ${WKS_FILES}. Please set WKS_FILE or WKS_FILES
> appropriately."
> > > > > > > > > +       fi
> > > > > > > > > +
> > > > > > > > > +       BUILDDIR="${TOPDIR}" wic create "$wks" --vars
> > > > > > > > > "${STAGING_DIR}/${MACHINE}/imgdata/" -e
> "${IMAGE_BASENAME}" -o
> > > > > "$out/"
> > > > > > > > > ${WIC_CREATE_EXTRA_ARGS}
> > > > > > > > > +       mv "$out/$(basename "${wks%.wks}")"*.direct
> > > > > > > > > "$out${IMAGE_NAME_SUFFIX}.wic"
> > > > > > > > > +       rm -rf "$out/"
> > > > > > > > > +}
> > > > > > > > > +IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
> > > > > > > > > +
> > > > > > > > > +# Rebuild when the wks file or vars in WICVARS change
> > > > > > > > > +USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES',
> 'wic
> > > ' + '
> > > > > > > > > '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()),
> > > '1',
> > > > > '',
> > > > > > > d)}"
> > > > > > > > > +WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> > > > > > > > > os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else
> ''}"
> > > > > > > > > +do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> > > > > > > > > +do_image_wic[depends] += "wic-tools:do_build"
> > > > > > > > > +
> > > > > > > > > +python () {
> > > > > > > > > +    if d.getVar('USING_WIC') and 'do_bootimg' in d:
> > > > > > > > > +        bb.build.addtask('do_image_wic', '',
> 'do_bootimg', d)
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +python do_write_wks_template () {
> > > > > > > > > +    """Write out expanded template contents to
> > > WKS_FULL_PATH."""
> > > > > > > > > +    import re
> > > > > > > > > +
> > > > > > > > > +    template_body = d.getVar('_WKS_TEMPLATE')
> > > > > > > > > +
> > > > > > > > > +    # Remove any remnant variable references left behind
> by
> > > the
> > > > > > > expansion
> > > > > > > > > +    # due to undefined variables
> > > > > > > > > +    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
> > > > > > > > > +    while True:
> > > > > > > > > +        new_body = re.sub(expand_var_regexp, '',
> > > template_body)
> > > > > > > > > +        if new_body == template_body:
> > > > > > > > > +            break
> > > > > > > > > +        else:
> > > > > > > > > +            template_body = new_body
> > > > > > > > > +
> > > > > > > > > +    wks_file = d.getVar('WKS_FULL_PATH')
> > > > > > > > > +    with open(wks_file, 'w') as f:
> > > > > > > > > +        f.write(template_body)
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +python () {
> > > > > > > > > +    if d.getVar('USING_WIC'):
> > > > > > > > > +        wks_file_u = d.getVar('WKS_FULL_PATH', False)
> > > > > > > > > +        wks_file = d.expand(wks_file_u)
> > > > > > > > > +        base, ext = os.path.splitext(wks_file)
> > > > > > > > > +        if ext == '.in' and os.path.exists(wks_file):
> > > > > > > > > +            wks_out_file = os.path.join(d.getVar('
> WORKDIR'),
> > > > > > > > > os.path.basename(base))
> > > > > > > > > +            d.setVar('WKS_FULL_PATH', wks_out_file)
> > > > > > > > > +            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> > > > > > > > > +            d.setVar('WKS_FILE_CHECKSUM',
> > > > > '${WKS_TEMPLATE_PATH}:True')
> > > > > > > > > +
> > > > > > > > > +            # We need to re-parse each time the file
> changes,
> > > and
> > > > > > > bitbake
> > > > > > > > > +            # needs to be told about that explicitly.
> > > > > > > > > +            bb.parse.mark_dependency(d, wks_file)
> > > > > > > > > +
> > > > > > > > > +            try:
> > > > > > > > > +                with open(wks_file, 'r') as f:
> > > > > > > > > +                    body = f.read()
> > > > > > > > > +            except (IOError, OSError) as exc:
> > > > > > > > > +                pass
> > > > > > > > > +            else:
> > > > > > > > > +                # Previously, I used expandWithRefs to
> get the
> > > > > > > dependency
> > > > > > > > > list
> > > > > > > > > +                # and add it to WICVARS, but there's no
> point
> > > > > > > re-parsing
> > > > > > > > > the
> > > > > > > > > +                # file in process_wks_template as well, so
> > > just
> > > > > put
> > > > > > > it in
> > > > > > > > > +                # a variable and let the metadata deal
> with
> > > the
> > > > > deps.
> > > > > > > > > +                d.setVar('_WKS_TEMPLATE', body)
> > > > > > > > > +                bb.build.addtask('do_write_wks_template',
> > > > > > > > > 'do_image_wic', None, d)
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +#
> > > > > > > > > +# Write environment variables used by wic
> > > > > > > > > +# to tmp/sysroots/<machine>/imgdata/<image>.env
> > > > > > > > > +#
> > > > > > > > > +python do_rootfs_wicenv () {
> > > > > > > > > +    wicvars = d.getVar('WICVARS')
> > > > > > > > > +    if not wicvars:
> > > > > > > > > +        return
> > > > > > > > > +
> > > > > > > > > +    stdir = d.getVar('STAGING_DIR')
> > > > > > > > > +    outdir = os.path.join(stdir, d.getVar('MACHINE'),
> > > 'imgdata')
> > > > > > > > > +    bb.utils.mkdirhier(outdir)
> > > > > > > > > +    basename = d.getVar('IMAGE_BASENAME')
> > > > > > > > > +    with open(os.path.join(outdir, basename) + '.env',
> 'w') as
> > > > > envf:
> > > > > > > > > +        for var in wicvars.split():
> > > > > > > > > +            value = d.getVar(var)
> > > > > > > > > +            if value:
> > > > > > > > > +                envf.write('%s="%s"\n' % (var,
> value.strip()))
> > > > > > > > > +}
> > > > > > > > > +addtask do_rootfs_wicenv after do_image before
> do_image_wic
> > > > > > > > > +do_rootfs_wicenv[vardeps] += "${WICVARS}"
> > > > > > > > > +do_rootfs_wicenv[prefuncs] = 'set_image_size'
> > > > > > > > > diff --git a/meta/classes/image.bbclass
> > > > > b/meta/classes/image.bbclass
> > > > > > > > > index 13fd996..1a549e9 100644
> > > > > > > > > --- a/meta/classes/image.bbclass
> > > > > > > > > +++ b/meta/classes/image.bbclass
> > > > > > > > > @@ -192,6 +192,8 @@ python () {
> > > > > > > > >  IMAGE_CLASSES += "image_types"
> > > > > > > > >  inherit ${IMAGE_CLASSES}
> > > > > > > > >
> > > > > > > > > +inherit image-wic
> > > > > > > > > +
> > > > > > > > >  IMAGE_POSTPROCESS_COMMAND ?= ""
> > > > > > > > >
> > > > > > > > >  # some default locales
> > > > > > > > > @@ -332,29 +334,6 @@ fakeroot python do_image_qa () {
> > > > > > > > >  }
> > > > > > > > >  addtask do_image_qa after do_image_complete before
> do_build
> > > > > > > > >
> > > > > > > > > -#
> > > > > > > > > -# Write environment variables used by wic
> > > > > > > > > -# to tmp/sysroots/<machine>/imgdata/<image>.env
> > > > > > > > > -#
> > > > > > > > > -python do_rootfs_wicenv () {
> > > > > > > > > -    wicvars = d.getVar('WICVARS')
> > > > > > > > > -    if not wicvars:
> > > > > > > > > -        return
> > > > > > > > > -
> > > > > > > > > -    stdir = d.getVar('STAGING_DIR')
> > > > > > > > > -    outdir = os.path.join(stdir, d.getVar('MACHINE'),
> > > 'imgdata')
> > > > > > > > > -    bb.utils.mkdirhier(outdir)
> > > > > > > > > -    basename = d.getVar('IMAGE_BASENAME')
> > > > > > > > > -    with open(os.path.join(outdir, basename) + '.env',
> 'w') as
> > > > > envf:
> > > > > > > > > -        for var in wicvars.split():
> > > > > > > > > -            value = d.getVar(var)
> > > > > > > > > -            if value:
> > > > > > > > > -                envf.write('%s="%s"\n' % (var,
> value.strip()))
> > > > > > > > > -}
> > > > > > > > > -addtask do_rootfs_wicenv after do_image before
> do_image_wic
> > > > > > > > > -do_rootfs_wicenv[vardeps] += "${WICVARS}"
> > > > > > > > > -do_rootfs_wicenv[prefuncs] = 'set_image_size'
> > > > > > > > > -
> > > > > > > > >  def setup_debugfs_variables(d):
> > > > > > > > >      d.appendVar('IMAGE_ROOTFS', '-dbg')
> > > > > > > > >      d.appendVar('IMAGE_LINK_NAME', '-dbg')
> > > > > > > > > diff --git a/meta/classes/image_types.bbclass
> > > > > > > b/meta/classes/image_types.
> > > > > > > > > bbclass
> > > > > > > > > index ad95dc6..e2ecf93 100644
> > > > > > > > > --- a/meta/classes/image_types.bbclass
> > > > > > > > > +++ b/meta/classes/image_types.bbclass
> > > > > > > > > @@ -192,97 +192,6 @@ IMAGE_CMD_ubi () {
> > > > > > > > >
> > > > > > > > >  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> > > > > > > > > ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs
> > > > > > > ${MKUBIFS_ARGS}"
> > > > > > > > >
> > > > > > > > > -WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
> > > > > > > > > -WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
> > > > > > > > > -WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p
> for
> > > p in
> > > > > > > > > '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/
> > > > > canned-wks'
> > > > > > > % l
> > > > > > > > > for l in '${BBPATH}:${COREBASE}'.split(':'))}"
> > > > > > > > > -WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(),
> > > > > > > > > '${WKS_SEARCH_PATH}') or ''}"
> > > > > > > > > -
> > > > > > > > > -def wks_search(files, search_path):
> > > > > > > > > -    for f in files:
> > > > > > > > > -        if os.path.isabs(f):
> > > > > > > > > -            if os.path.exists(f):
> > > > > > > > > -                return f
> > > > > > > > > -        else:
> > > > > > > > > -            searched = bb.utils.which(search_path, f)
> > > > > > > > > -            if searched:
> > > > > > > > > -                return searched
> > > > > > > > > -
> > > > > > > > > -WIC_CREATE_EXTRA_ARGS ?= ""
> > > > > > > > > -
> > > > > > > > > -IMAGE_CMD_wic () {
> > > > > > > > > -       out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
> > > > > > > > > -       wks="${WKS_FULL_PATH}"
> > > > > > > > > -       if [ -z "$wks" ]; then
> > > > > > > > > -               bbfatal "No kickstart files from WKS_FILES
> were
> > > > > found:
> > > > > > > > > ${WKS_FILES}. Please set WKS_FILE or WKS_FILES
> appropriately."
> > > > > > > > > -       fi
> > > > > > > > > -
> > > > > > > > > -       BUILDDIR="${TOPDIR}" wic create "$wks" --vars
> > > > > > > > > "${STAGING_DIR}/${MACHINE}/imgdata/" -e
> "${IMAGE_BASENAME}" -o
> > > > > "$out/"
> > > > > > > > > ${WIC_CREATE_EXTRA_ARGS}
> > > > > > > > > -       mv "$out/$(basename "${wks%.wks}")"*.direct
> > > > > > > > > "$out${IMAGE_NAME_SUFFIX}.wic"
> > > > > > > > > -       rm -rf "$out/"
> > > > > > > > > -}
> > > > > > > > > -IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
> > > > > > > > > -
> > > > > > > > > -# Rebuild when the wks file or vars in WICVARS change
> > > > > > > > > -USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES',
> 'wic
> > > ' + '
> > > > > > > > > '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()),
> > > '1',
> > > > > '',
> > > > > > > d)}"
> > > > > > > > > -WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> > > > > > > > > os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else
> ''}"
> > > > > > > > > -do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> > > > > > > > > -do_image_wic[depends] += "wic-tools:do_build"
> > > > > > > > > -
> > > > > > > > > -python () {
> > > > > > > > > -    if d.getVar('USING_WIC') and 'do_bootimg' in d:
> > > > > > > > > -        bb.build.addtask('do_image_wic', '',
> 'do_bootimg', d)
> > > > > > > > > -}
> > > > > > > > > -
> > > > > > > > > -python do_write_wks_template () {
> > > > > > > > > -    """Write out expanded template contents to
> > > WKS_FULL_PATH."""
> > > > > > > > > -    import re
> > > > > > > > > -
> > > > > > > > > -    template_body = d.getVar('_WKS_TEMPLATE')
> > > > > > > > > -
> > > > > > > > > -    # Remove any remnant variable references left behind
> by
> > > the
> > > > > > > expansion
> > > > > > > > > -    # due to undefined variables
> > > > > > > > > -    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
> > > > > > > > > -    while True:
> > > > > > > > > -        new_body = re.sub(expand_var_regexp, '',
> > > template_body)
> > > > > > > > > -        if new_body == template_body:
> > > > > > > > > -            break
> > > > > > > > > -        else:
> > > > > > > > > -            template_body = new_body
> > > > > > > > > -
> > > > > > > > > -    wks_file = d.getVar('WKS_FULL_PATH')
> > > > > > > > > -    with open(wks_file, 'w') as f:
> > > > > > > > > -        f.write(template_body)
> > > > > > > > > -}
> > > > > > > > > -
> > > > > > > > > -python () {
> > > > > > > > > -    if d.getVar('USING_WIC'):
> > > > > > > > > -        wks_file_u = d.getVar('WKS_FULL_PATH', False)
> > > > > > > > > -        wks_file = d.expand(wks_file_u)
> > > > > > > > > -        base, ext = os.path.splitext(wks_file)
> > > > > > > > > -        if ext == '.in' and os.path.exists(wks_file):
> > > > > > > > > -            wks_out_file = os.path.join(d.getVar('
> WORKDIR'),
> > > > > > > > > os.path.basename(base))
> > > > > > > > > -            d.setVar('WKS_FULL_PATH', wks_out_file)
> > > > > > > > > -            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> > > > > > > > > -            d.setVar('WKS_FILE_CHECKSUM',
> > > > > '${WKS_TEMPLATE_PATH}:True')
> > > > > > > > > -
> > > > > > > > > -            # We need to re-parse each time the file
> changes,
> > > and
> > > > > > > bitbake
> > > > > > > > > -            # needs to be told about that explicitly.
> > > > > > > > > -            bb.parse.mark_dependency(d, wks_file)
> > > > > > > > > -
> > > > > > > > > -            try:
> > > > > > > > > -                with open(wks_file, 'r') as f:
> > > > > > > > > -                    body = f.read()
> > > > > > > > > -            except (IOError, OSError) as exc:
> > > > > > > > > -                pass
> > > > > > > > > -            else:
> > > > > > > > > -                # Previously, I used expandWithRefs to
> get the
> > > > > > > dependency
> > > > > > > > > list
> > > > > > > > > -                # and add it to WICVARS, but there's no
> point
> > > > > > > re-parsing
> > > > > > > > > the
> > > > > > > > > -                # file in process_wks_template as well, so
> > > just
> > > > > put
> > > > > > > it in
> > > > > > > > > -                # a variable and let the metadata deal
> with
> > > the
> > > > > deps.
> > > > > > > > > -                d.setVar('_WKS_TEMPLATE', body)
> > > > > > > > > -                bb.build.addtask('do_write_wks_template',
> > > > > > > > > 'do_image_wic', None, d)
> > > > > > > > > -}
> > > > > > > > > -
> > > > > > > > >  EXTRA_IMAGECMD = ""
> > > > > > > > >
> > > > > > > > >  inherit siteinfo
> > > > > > > > > @@ -380,7 +289,3 @@ IMAGE_EXTENSION_live = "hddimg iso"
> > > > > > > > >  # The IMAGE_TYPES_MASKED variable will be used to mask out
> > > from
> > > > > the
> > > > > > > > > IMAGE_FSTYPES,
> > > > > > > > >  # images that will not be built at do_rootfs time: vmdk,
> vdi,
> > > > > qcow2,
> > > > > > > > > hdddirect, hddimg, iso, etc.
> > > > > > > > >  IMAGE_TYPES_MASKED ?= ""
> > > > > > > > > -
> > > > > > > > > -# The WICVARS variable is used to define list of bitbake
> > > variables
> > > > > > > used
> > > > > > > > > in wic code
> > > > > > > > > -# variables from this list is written to <image>.env file
> > > > > > > > > -WICVARS ?= "BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE
> FAKEROOTCMD
> > > > > HDDDIR
> > > > > > > > > IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME
> IMAGE_ROOTFS
> > > > > > > > > INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH
> > > RECIPE_SYSROOT_NATIVE
> > > > > > > > > ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR
> > > TARGET_SYS"
> > > > > > > > > --
> > > > > > > > > 2.1.4
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > _______________________________________________
> > > > > > > > > Openembedded-core mailing list
> > > > > > > > > Openembedded-core@lists.openembedded.org
> > > > > > > > > http://lists.openembedded.org/
> mailman/listinfo/openembedded-
> > > core
> > > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > --
> > > > > > > Regards,
> > > > > > > Ed
> > > > > > >
> > > > >
> > > > > --
> > > > > --
> > > > > Regards,
> > > > > Ed
> > > > >
> > >
> > > --
> > > --
> > > Regards,
> > > Ed
> > >
>
> --
> --
> Regards,
> Ed
>

--001a1135a57a87a1ca05475486c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Mon, Jan 30, 2017 at 10:42 AM, Ed Bartosh <span dir=3D"ltr">&l=
t;<a href=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartos=
h@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">On Mon, Jan 30, 2017 at 10:41:27AM -0800, Rick Altherr wrot=
e:<br>
&gt; Agreed.=C2=A0 What if it was image_types_wic.bbclass and you did somet=
hing<br>
&gt; similar to build_uboot() in image.bbclass?<br>
&gt;<br>
<br>
</span>I can do this for now:<br>
IMAGE_TYPE_wic =3D &quot;image_type_wic&quot;<br>
inherit ${IMAGE_TYPE_wic}<br>
<br>
which is the same as &#39;inherit image_type_wic&#39;, just takes 2 lines, =
but<br>
looks more consistent.<br>
<br>
does this look ok?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; On Mon, Jan 30, 2017 at 10:15 AM, Ed Bartosh &lt;<a href=3D"mailto:ed.=
bartosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Mon, Jan 30, 2017 at 10:25:59AM -0800, Rick Altherr wrote:<br>
&gt; &gt; &gt; I&#39;m not clear on which path is the preferred one.=C2=A0 =
There are lots of bits<br>
&gt; &gt; &gt; and pieces in image_types.bbclass that implement various ima=
ge types.<br>
&gt; &gt; &gt;=C2=A0 uboot got added as a separate class at some point.=C2=
=A0 The comments in<br>
&gt; &gt; &gt; local.conf.sample.extended imply IMAGE_CLASSES should be use=
d to load<br>
&gt; &gt; &gt; additional image_types_* classes to add support for addition=
al image<br>
&gt; &gt; &gt; types.=C2=A0 Having the wic image type implemented in a sepa=
rate<br>
&gt; &gt; &gt; image-wic.bbclass that is directly inherited by image.bbclas=
s adds a 3rd<br>
&gt; &gt; &gt; approach.=C2=A0 Which one do we want contributors to use in =
the future?<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I didn&#39;t want to create even more confusion. What I wanted is=
 stated in the<br>
&gt; &gt; commit message - to put existing wic code into a file for better<=
br>
&gt; &gt; maintenance. If this is more confusing than having wic code in di=
fferent<br>
&gt; &gt; places of image.class and image_types.class then we can just drop=
 this<br>
&gt; &gt; patch. However, I personally find it more maintainable this way.<=
br>
&gt; &gt;<br>
&gt; &gt; Suggesting people to change machine configs just because wic code=
 is<br>
&gt; &gt; moved to separate file doesn&#39;t look good to me either.<br>
&gt; &gt;<br>
&gt; &gt; &gt; On Mon, Jan 30, 2017 at 9:45 AM, Ed Bartosh &lt;<a href=3D"m=
ailto:ed.bartosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Jan 30, 2017 at 09:47:42AM -0800, Rick Altherr =
wrote:<br>
&gt; &gt; &gt; &gt; &gt; Hmm.=C2=A0 In local.conf.sample.extended, I find:<=
br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; # Additional image generation features<br>
&gt; &gt; &gt; &gt; &gt; #<br>
&gt; &gt; &gt; &gt; &gt; # The following is a list of classes to import to =
use in the<br>
&gt; &gt; generation<br>
&gt; &gt; &gt; &gt; of<br>
&gt; &gt; &gt; &gt; &gt; images<br>
&gt; &gt; &gt; &gt; &gt; # currently an example class is image_types_uboot<=
br>
&gt; &gt; &gt; &gt; &gt; # IMAGE_CLASSES =3D &quot; image_types_uboot&quot;=
<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Indeed, image_types_uboot isn&#39;t part of IMAGE_=
CLASSES by default.<br>
&gt; &gt; I&#39;d<br>
&gt; &gt; &gt; &gt; &gt; expect a machine config to add wic to IMAGE_CLASSE=
S if it needs wic<br>
&gt; &gt; &gt; &gt; output.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; So far all machine configs add wic to IMAGE_TYPES and i=
t works just<br>
&gt; &gt; &gt; &gt; fine. Why to change?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Mon, Jan 30, 2017 at 9:18 AM, Ed Bartosh &lt;<b=
r>
&gt; &gt; <a href=3D"mailto:ed.bartosh@linux.intel.com">ed.bartosh@linux.in=
tel.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Mon, Jan 30, 2017 at 09:27:54AM -0800, Ric=
k Altherr wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Why didn&#39;t you make this image_types=
_wic.bbclass and use<br>
&gt; &gt; &gt; &gt; IMAGE_CLASSES to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; load it?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Because of the following:<br>
&gt; &gt; &gt; &gt; &gt; &gt; - IMAGE_CLASSES[doc] =3D &quot;A list of clas=
ses that all images should<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0inherit.&quot; I&#39;m not sure a=
ll images should include wic class. I&#39;ll<br>
&gt; &gt; &gt; &gt; probably<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0make this inheritance conditional=
.<br>
&gt; &gt; &gt; &gt; &gt; &gt; - so far IMAGE_CLASSES is used for qemuboot, =
image_types,<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0image_types_uboot and testimage,<=
br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0so the usage is more or less foll=
ows the description. wic is out<br>
&gt; &gt; of<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0that usage scenario, I believe.<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; - &#39;inherit image_wic&#39; is more explici=
t than IMAGE_CLASSES +=3D<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0&quot;image_types&quot;\n inherit=
 ${IMAGE_CLASSES}<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Fri, Jan 27, 2017 at 12:19 PM, Ed Bar=
tosh &lt;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:ed.bartosh@linux.intel.com">ed.bartos=
h@linux.intel.com</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; There is a lot of wic code in image=
.bbclass and<br>
&gt; &gt; image_types.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Having all code separated in one fi=
le should make it more<br>
&gt; &gt; readable<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; and easier to maintain.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Ed Bartosh &lt;<a hr=
ef=3D"mailto:ed.bartosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 meta/classes/image-wic.bbclas=
s=C2=A0 =C2=A0| 120<br>
&gt; &gt; &gt; &gt; ++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 meta/classes/image.bbclass=C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +-------<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 meta/classes/image_types.<wbr=
>bbclass |=C2=A0 95<br>
&gt; &gt; &gt; &gt; ------------------------------<br>
&gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 3 files changed, 122 insertio=
ns(+), 118 deletions(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta/class=
es/image-wic.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/classes/image-wic=
.<wbr>bbclass<br>
&gt; &gt; &gt; &gt; b/meta/classes/image-wic.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; index 0000000..2acfd65<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/classes/image-wic.<wbr>b=
bclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -0,0 +1,120 @@<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +# The WICVARS variable is used to =
define list of bitbake<br>
&gt; &gt; variables<br>
&gt; &gt; &gt; &gt; &gt; &gt; used<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; in wic code<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +# variables from this list is writ=
ten to &lt;image&gt;.env file<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +WICVARS ?=3D &quot;\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD<br>
&gt; &gt; &gt; &gt; HDDDIR<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; IMAGE_BASENAME IMAGE_BOOT_FILES \<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES<br>
&gt; &gt; INITRD<br>
&gt; &gt; &gt; &gt; &gt; &gt; ISODIR<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; MACHINE_ARCH RECIPE_SYSROOT_NATIVE =
\<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ROOTFS_SIZE STAGING_DATADIR STAGING_DIR<br>
&gt; &gt; STAGING_LIBDIR<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; TARGET_SYS&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +WKS_FILE ??=3D &quot;${IMAGE_BASEN=
AME}.${MACHINE}.<wbr>wks&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +WKS_FILES ?=3D &quot;${WKS_FILE} $=
{IMAGE_BASENAME}.wks&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +WKS_SEARCH_PATH ?=3D &quot;${THISD=
IR}:${@&#39;:&#39;.join(&#39;%s/<wbr>wic&#39; % p for<br>
&gt; &gt; p in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &#39;${BBPATH}&#39;.split(&#39;:&#3=
9;))}:${@&#39;:<wbr>&#39;.join(&#39;%s/scripts/lib/wic/<br>
&gt; &gt; &gt; &gt; canned-wks&#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; % l<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; for l in &#39;${BBPATH}:${COREBASE}=
&#39;.split(<wbr>&#39;:&#39;))}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +WKS_FULL_PATH =3D &quot;${@wks_sea=
rch(&#39;${WKS_FILES}&#39;.<wbr>split(),<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &#39;${WKS_SEARCH_PATH}&#39;) or &#=
39;&#39;}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +def wks_search(files, search_path)=
:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 for f in files:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.=
path.isabs(f):<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if os.path.exists(f):<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 return f<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 searched =3D bb.utils.which(search_path, f)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if searched:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 return searched<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +WIC_CREATE_EXTRA_ARGS ?=3D &quot;&=
quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +IMAGE_CMD_wic () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0out=3D&=
quot;${IMGDEPLOYDIR}/${IMAGE_<wbr>NAME}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0wks=3D&=
quot;${WKS_FULL_PATH}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z=
 &quot;$wks&quot; ]; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;No kickstart files from WKS_FILES were<b=
r>
&gt; &gt; &gt; &gt; found:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ${WKS_FILES}. Please set WKS_FILE o=
r WKS_FILES appropriately.&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILDDI=
R=3D&quot;${TOPDIR}&quot; wic create &quot;$wks&quot; --vars<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &quot;${STAGING_DIR}/${MACHINE}/<wb=
r>imgdata/&quot; -e &quot;${IMAGE_BASENAME}&quot; -o<br>
&gt; &gt; &gt; &gt; &quot;$out/&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ${WIC_CREATE_EXTRA_ARGS}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quo=
t;$out/$(basename &quot;${wks%.wks}&quot;)&quot;*.direct<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &quot;$out${IMAGE_NAME_SUFFIX}.wic&=
quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf =
&quot;$out/&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +IMAGE_CMD_wic[vardepsexclude] =3D =
&quot;WKS_FULL_PATH WKS_FILES&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +# Rebuild when the wks file or var=
s in WICVARS change<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +USING_WIC =3D &quot;${@bb.utils.co=
ntains_any(&#39;<wbr>IMAGE_FSTYPES&#39;, &#39;wic<br>
&gt; &gt; &#39; + &#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &#39;.join(&#39;wic.%s&#39; % c for=
 c in &#39;${CONVERSIONTYPES}&#39;.split()),<br>
&gt; &gt; &#39;1&#39;,<br>
&gt; &gt; &gt; &gt; &#39;&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &gt; d)}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +WKS_FILE_CHECKSUM =3D &quot;${@&#3=
9;${WKS_FULL_PATH}:%s&#39; %<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; os.path.exists(&#39;${WKS_FULL_<wbr=
>PATH}&#39;) if &#39;${USING_WIC}&#39; else &#39;&#39;}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +do_image_wic[file-checksums] +=3D =
&quot;${WKS_FILE_CHECKSUM}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +do_image_wic[depends] +=3D &quot;w=
ic-tools:do_build&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +python () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if d.getVar(&#39;USI=
NG_WIC&#39;) and &#39;do_bootimg&#39; in d:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.bui=
ld.addtask(&#39;do_image_<wbr>wic&#39;, &#39;&#39;, &#39;do_bootimg&#39;, d=
)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +python do_write_wks_template () {<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Wr=
ite out expanded template contents to<br>
&gt; &gt; WKS_FULL_PATH.&quot;&quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 import re<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 template_body =3D d.=
getVar(&#39;_WKS_TEMPLATE&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 # Remove any remnant=
 variable references left behind by<br>
&gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; expansion<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 # due to undefined v=
ariables<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 expand_var_regexp =
=3D re.compile(r&quot;\${[^{}@\n\t :]+}&quot;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 while True:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_bo=
dy =3D re.sub(expand_var_regexp, &#39;&#39;,<br>
&gt; &gt; template_body)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if new=
_body =3D=3D template_body:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 template_body =3D new_body<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 wks_file =3D d.getVa=
r(&#39;WKS_FULL_PATH&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 with open(wks_file, =
&#39;w&#39;) as f:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.writ=
e(template_body)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +python () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if d.getVar(&#39;USI=
NG_WIC&#39;):<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_fi=
le_u =3D d.getVar(&#39;WKS_FULL_PATH&#39;, False)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_fi=
le =3D d.expand(wks_file_u)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 base, =
ext =3D os.path.splitext(wks_file)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ext=
 =3D=3D &#39;.in&#39; and os.path.exists(wks_file):<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 wks_out_file =3D os.path.join(d.getVar(&#39;<wbr>WORKDIR&#39;),<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; os.path.basename(base))<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 d.setVar(&#39;WKS_FULL_PATH&#39;, wks_out_file)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 d.setVar(&#39;WKS_TEMPLATE_PATH&#39;, wks_file_u)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 d.setVar(&#39;WKS_FILE_CHECKSUM&#39;,<br>
&gt; &gt; &gt; &gt; &#39;${WKS_TEMPLATE_PATH}:True&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 # We need to re-parse each time the file changes,<br>
&gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; bitbake<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 # needs to be told about that explicitly.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 bb.parse.mark_dependency(d, wks_file)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 try:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 with open(wks_file, &#39;r&#39;) as f:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 body =3D f.read()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 except (IOError, OSError) as exc:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 else:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 # Previously, I used expandWithRefs to get the<br>
&gt; &gt; &gt; &gt; &gt; &gt; dependency<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; list<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 # and add it to WICVARS, but there&#39;s no point<br>
&gt; &gt; &gt; &gt; &gt; &gt; re-parsing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 # file in process_wks_template as well, so<br>
&gt; &gt; just<br>
&gt; &gt; &gt; &gt; put<br>
&gt; &gt; &gt; &gt; &gt; &gt; it in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 # a variable and let the metadata deal with<br>
&gt; &gt; the<br>
&gt; &gt; &gt; &gt; deps.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;_WKS_TEMPLATE&#39;, body)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_write_<wbr>wks_template&#39;=
,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &#39;do_image_wic&#39;, None, d)<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +#<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +# Write environment variables used=
 by wic<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +# to tmp/sysroots/&lt;machine&gt;/=
<wbr>imgdata/&lt;image&gt;.env<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +#<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +python do_rootfs_wicenv () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 wicvars =3D d.getVar=
(&#39;WICVARS&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if not wicvars:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 stdir =3D d.getVar(&=
#39;STAGING_DIR&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 outdir =3D os.path.j=
oin(stdir, d.getVar(&#39;MACHINE&#39;),<br>
&gt; &gt; &#39;imgdata&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 bb.utils.mkdirhier(o=
utdir)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 basename =3D d.getVa=
r(&#39;IMAGE_BASENAME&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 with open(os.path.jo=
in(outdir, basename) + &#39;.env&#39;, &#39;w&#39;) as<br>
&gt; &gt; &gt; &gt; envf:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for va=
r in wicvars.split():<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 value =3D d.getVar(var)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if value:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 envf.write(&#39;%s=3D&quot;%s&quot;\n&#39; % (var, va=
lue.strip()))<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +addtask do_rootfs_wicenv after do_=
image before do_image_wic<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +do_rootfs_wicenv[vardeps] +=3D &qu=
ot;${WICVARS}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +do_rootfs_wicenv[prefuncs] =3D &#3=
9;set_image_size&#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/classes/image.bbc=
lass<br>
&gt; &gt; &gt; &gt; b/meta/classes/image.bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; index 13fd996..1a549e9 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/meta/classes/image.bbclass<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/classes/image.bbclass<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -192,6 +192,8 @@ python () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 IMAGE_CLASSES +=3D &quot;imag=
e_types&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 inherit ${IMAGE_CLASSES}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +inherit image-wic<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 IMAGE_POSTPROCESS_COMMAND ?=
=3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 # some default locales<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -332,29 +334,6 @@ fakeroot pytho=
n do_image_qa () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 addtask do_image_qa after do_=
image_complete before do_build<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -#<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -# Write environment variables used=
 by wic<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -# to tmp/sysroots/&lt;machine&gt;/=
<wbr>imgdata/&lt;image&gt;.env<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -#<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -python do_rootfs_wicenv () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 wicvars =3D d.getVar=
(&#39;WICVARS&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 if not wicvars:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 stdir =3D d.getVar(&=
#39;STAGING_DIR&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 outdir =3D os.path.j=
oin(stdir, d.getVar(&#39;MACHINE&#39;),<br>
&gt; &gt; &#39;imgdata&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 bb.utils.mkdirhier(o=
utdir)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 basename =3D d.getVa=
r(&#39;IMAGE_BASENAME&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 with open(os.path.jo=
in(outdir, basename) + &#39;.env&#39;, &#39;w&#39;) as<br>
&gt; &gt; &gt; &gt; envf:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for va=
r in wicvars.split():<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 value =3D d.getVar(var)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if value:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 envf.write(&#39;%s=3D&quot;%s&quot;\n&#39; % (var, va=
lue.strip()))<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -addtask do_rootfs_wicenv after do_=
image before do_image_wic<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -do_rootfs_wicenv[vardeps] +=3D &qu=
ot;${WICVARS}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -do_rootfs_wicenv[prefuncs] =3D &#3=
9;set_image_size&#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 def setup_debugfs_variables(d=
):<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 d.appendVar(&#3=
9;IMAGE_ROOTFS&#39;, &#39;-dbg&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 d.appendVar(&#3=
9;IMAGE_LINK_NAME&#39;, &#39;-dbg&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/classes/image_typ=
es.<wbr>bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; b/meta/classes/image_types.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; index ad95dc6..e2ecf93 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/meta/classes/image_types.<wbr=
>bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/classes/image_types.<wbr=
>bbclass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -192,97 +192,6 @@ IMAGE_CMD_ubi =
() {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 IMAGE_CMD_ubifs =3D &quot;mkf=
s.ubifs -r ${IMAGE_ROOTFS} -o<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ${IMGDEPLOYDIR}/${IMAGE_NAME}$<wbr>=
{IMAGE_NAME_SUFFIX}.ubifs<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${MKUBIFS_ARGS}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -WKS_FILE ??=3D &quot;${IMAGE_BASEN=
AME}.${MACHINE}.<wbr>wks&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -WKS_FILES ?=3D &quot;${WKS_FILE} $=
{IMAGE_BASENAME}.wks&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -WKS_SEARCH_PATH ?=3D &quot;${THISD=
IR}:${@&#39;:&#39;.join(&#39;%s/<wbr>wic&#39; % p for<br>
&gt; &gt; p in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &#39;${BBPATH}&#39;.split(&#39;:&#3=
9;))}:${@&#39;:<wbr>&#39;.join(&#39;%s/scripts/lib/wic/<br>
&gt; &gt; &gt; &gt; canned-wks&#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; % l<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; for l in &#39;${BBPATH}:${COREBASE}=
&#39;.split(<wbr>&#39;:&#39;))}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -WKS_FULL_PATH =3D &quot;${@wks_sea=
rch(&#39;${WKS_FILES}&#39;.<wbr>split(),<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &#39;${WKS_SEARCH_PATH}&#39;) or &#=
39;&#39;}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -def wks_search(files, search_path)=
:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 for f in files:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.=
path.isabs(f):<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if os.path.exists(f):<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 return f<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 searched =3D bb.utils.which(search_path, f)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if searched:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 return searched<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -WIC_CREATE_EXTRA_ARGS ?=3D &quot;&=
quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -IMAGE_CMD_wic () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0out=3D&=
quot;${IMGDEPLOYDIR}/${IMAGE_<wbr>NAME}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0wks=3D&=
quot;${WKS_FULL_PATH}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z=
 &quot;$wks&quot; ]; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;No kickstart files from WKS_FILES were<b=
r>
&gt; &gt; &gt; &gt; found:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ${WKS_FILES}. Please set WKS_FILE o=
r WKS_FILES appropriately.&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILDDI=
R=3D&quot;${TOPDIR}&quot; wic create &quot;$wks&quot; --vars<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &quot;${STAGING_DIR}/${MACHINE}/<wb=
r>imgdata/&quot; -e &quot;${IMAGE_BASENAME}&quot; -o<br>
&gt; &gt; &gt; &gt; &quot;$out/&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ${WIC_CREATE_EXTRA_ARGS}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quo=
t;$out/$(basename &quot;${wks%.wks}&quot;)&quot;*.direct<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &quot;$out${IMAGE_NAME_SUFFIX}.wic&=
quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf =
&quot;$out/&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -IMAGE_CMD_wic[vardepsexclude] =3D =
&quot;WKS_FULL_PATH WKS_FILES&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -# Rebuild when the wks file or var=
s in WICVARS change<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -USING_WIC =3D &quot;${@bb.utils.co=
ntains_any(&#39;<wbr>IMAGE_FSTYPES&#39;, &#39;wic<br>
&gt; &gt; &#39; + &#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &#39;.join(&#39;wic.%s&#39; % c for=
 c in &#39;${CONVERSIONTYPES}&#39;.split()),<br>
&gt; &gt; &#39;1&#39;,<br>
&gt; &gt; &gt; &gt; &#39;&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &gt; d)}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -WKS_FILE_CHECKSUM =3D &quot;${@&#3=
9;${WKS_FULL_PATH}:%s&#39; %<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; os.path.exists(&#39;${WKS_FULL_<wbr=
>PATH}&#39;) if &#39;${USING_WIC}&#39; else &#39;&#39;}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -do_image_wic[file-checksums] +=3D =
&quot;${WKS_FILE_CHECKSUM}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -do_image_wic[depends] +=3D &quot;w=
ic-tools:do_build&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -python () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 if d.getVar(&#39;USI=
NG_WIC&#39;) and &#39;do_bootimg&#39; in d:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.bui=
ld.addtask(&#39;do_image_<wbr>wic&#39;, &#39;&#39;, &#39;do_bootimg&#39;, d=
)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -python do_write_wks_template () {<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 &quot;&quot;&quot;Wr=
ite out expanded template contents to<br>
&gt; &gt; WKS_FULL_PATH.&quot;&quot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 import re<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 template_body =3D d.=
getVar(&#39;_WKS_TEMPLATE&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 # Remove any remnant=
 variable references left behind by<br>
&gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; expansion<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 # due to undefined v=
ariables<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 expand_var_regexp =
=3D re.compile(r&quot;\${[^{}@\n\t :]+}&quot;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 while True:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_bo=
dy =3D re.sub(expand_var_regexp, &#39;&#39;,<br>
&gt; &gt; template_body)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if new=
_body =3D=3D template_body:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 template_body =3D new_body<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 wks_file =3D d.getVa=
r(&#39;WKS_FULL_PATH&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 with open(wks_file, =
&#39;w&#39;) as f:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.writ=
e(template_body)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -python () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 if d.getVar(&#39;USI=
NG_WIC&#39;):<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_fi=
le_u =3D d.getVar(&#39;WKS_FULL_PATH&#39;, False)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_fi=
le =3D d.expand(wks_file_u)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 base, =
ext =3D os.path.splitext(wks_file)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ext=
 =3D=3D &#39;.in&#39; and os.path.exists(wks_file):<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 wks_out_file =3D os.path.join(d.getVar(&#39;<wbr>WORKDIR&#39;),<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; os.path.basename(base))<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 d.setVar(&#39;WKS_FULL_PATH&#39;, wks_out_file)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 d.setVar(&#39;WKS_TEMPLATE_PATH&#39;, wks_file_u)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 d.setVar(&#39;WKS_FILE_CHECKSUM&#39;,<br>
&gt; &gt; &gt; &gt; &#39;${WKS_TEMPLATE_PATH}:True&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 # We need to re-parse each time the file changes,<br>
&gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; bitbake<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 # needs to be told about that explicitly.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 bb.parse.mark_dependency(d, wks_file)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 try:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 with open(wks_file, &#39;r&#39;) as f:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 body =3D f.read()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 except (IOError, OSError) as exc:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 else:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 # Previously, I used expandWithRefs to get the<br>
&gt; &gt; &gt; &gt; &gt; &gt; dependency<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; list<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 # and add it to WICVARS, but there&#39;s no point<br>
&gt; &gt; &gt; &gt; &gt; &gt; re-parsing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 # file in process_wks_template as well, so<br>
&gt; &gt; just<br>
&gt; &gt; &gt; &gt; put<br>
&gt; &gt; &gt; &gt; &gt; &gt; it in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 # a variable and let the metadata deal with<br>
&gt; &gt; the<br>
&gt; &gt; &gt; &gt; deps.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;_WKS_TEMPLATE&#39;, body)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_write_<wbr>wks_template&#39;=
,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &#39;do_image_wic&#39;, None, d)<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 EXTRA_IMAGECMD =3D &quot;&quo=
t;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 inherit siteinfo<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -380,7 +289,3 @@ IMAGE_EXTENSION=
_live =3D &quot;hddimg iso&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 # The IMAGE_TYPES_MASKED vari=
able will be used to mask out<br>
&gt; &gt; from<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; IMAGE_FSTYPES,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 # images that will not be bui=
lt at do_rootfs time: vmdk, vdi,<br>
&gt; &gt; &gt; &gt; qcow2,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; hdddirect, hddimg, iso, etc.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 IMAGE_TYPES_MASKED ?=3D &quot=
;&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -# The WICVARS variable is used to =
define list of bitbake<br>
&gt; &gt; variables<br>
&gt; &gt; &gt; &gt; &gt; &gt; used<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; in wic code<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -# variables from this list is writ=
ten to &lt;image&gt;.env file<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -WICVARS ?=3D &quot;BBLAYERS IMGDEP=
LOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD<br>
&gt; &gt; &gt; &gt; HDDDIR<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; IMAGE_BASENAME IMAGE_BOOT_FILES IMA=
GE_LINK_NAME IMAGE_ROOTFS<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; INITRAMFS_FSTYPES INITRD ISODIR MAC=
HINE_ARCH<br>
&gt; &gt; RECIPE_SYSROOT_NATIVE<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ROOTFS_SIZE STAGING_DATADIR STAGING=
_DIR STAGING_LIBDIR<br>
&gt; &gt; TARGET_SYS&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; 2.1.4<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ______________________________<wbr>=
_________________<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:Openembedded-core=
@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedde=
d.org/mailman/listinfo/openembedded-" rel=3D"noreferrer" target=3D"_blank">=
http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-</a><br>
&gt; &gt; core<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; &gt; &gt; &gt; Ed<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; &gt; Ed<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; --<br>
&gt; &gt; Regards,<br>
&gt; &gt; Ed<br>
&gt; &gt;<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
--<br>
Regards,<br>
Ed<br>
</font></span></blockquote></div><br></div>

--001a1135a57a87a1ca05475486c9--
