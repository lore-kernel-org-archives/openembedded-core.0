Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5778C65D56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 12:11:00 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so2531750wgh.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5k2gdWhtf6//JH7A2Qc4W3HRmhTRh5QpniscZ5ofzFE=;
	b=y6SVRfkWlv60uaUKVse5memEBJWsYDPKLwVa8HHGV6yhcI6GjhDVWYZbQ6o0vaOuCF
	pPRvOMVYjfES2i5LBBn8et70qwuOnMSkZ+MFWlVDJYB9gZYAw7yZUQKZ7tmMllG4dxsq
	FBgoSqcmGOFKR4IytI86twmB/MCN5mbRAKXh8qIHrT3UZnd72v9/1wfbGMPVnPlmufIi
	SiY6G5etkrNTEdFZhdHiu8RjgOcwxKC58zamH+ft0GQpZagEGda6XGFRI6JhJj4giw49
	/tg71QnzTf13cL1o2tEeZA8sKqvnhNWip3s1egiWFf1Xv+SLaKCrddnx1/HIokxQ7GLt
	219g==
X-Received: by 10.194.89.168 with SMTP id bp8mr15442445wjb.73.1407327061557;
	Wed, 06 Aug 2014 05:11:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w1sm15817743wiz.14.2014.08.06.05.11.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 05:11:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 14:11:30 +0200
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20140806121130.GH14848@jama>
References: <alpine.LFD.2.11.1408060743510.5032@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1408060743510.5032@localhost>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bbclass files: Fix typos/grammar in numerous .bbclass comments.
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
X-List-Received-Date: Wed, 06 Aug 2014 12:11:04 -0000
X-Groupsio-MsgNum: 56048
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WRT3RXLOp/bBMgTI"
Content-Disposition: inline

--WRT3RXLOp/bBMgTI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 07:51:55AM -0400, Robert P. J. Day wrote:
>=20
> Various non-functional changes to a number of .bbclass files:

Looks good to me

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
>  * Spelling
>  * Grammar
>  * Ridiculously long lines
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
>   while perusing numerous .bbclass files to document a few things for
> myself, i figured i might as well do some proofreading. all of this is
> strictly non-functional changes to comment lines in .bbclass files.
>=20
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index c953e7c..0a64588 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -1,5 +1,6 @@
>  #
> -# This class is used for architecture independent recipes/data files (us=
ally scripts)
> +# This class is used for architecture-independent recipes/data files, su=
ch as
> +# configuration files, media files or scripts.
>  #
>=20
>  # Expand STAGING_DIR_HOST since for cross-canadian/native/nativesdk, thi=
s will
> @@ -15,8 +16,8 @@ python () {
>          # No need for virtual/libc or a cross compiler
>          d.setVar("INHIBIT_DEFAULT_DEPS","1")
>=20
> -        # Set these to a common set of values, we shouldn't be using the=
m other that for WORKDIR directory
> -        # naming anyway
> +        # Set these to a common set of values, we shouldn't be using them
> +        # other than for WORKDIR directory naming, anyway.
>          d.setVar("TARGET_ARCH", "allarch")
>          d.setVar("TARGET_OS", "linux")
>          d.setVar("TARGET_CC_ARCH", "none")
> @@ -33,7 +34,7 @@ python () {
>          # packages.
>          d.setVar("LDFLAGS", "")
>=20
> -        # No need to do shared library processing or debug symbol handli=
ng
> +        # No need to do shared library processing or debug symbol handli=
ng.
>          d.setVar("EXCLUDE_FROM_SHLIBS", "1")
>          d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
>          d.setVar("INHIBIT_PACKAGE_STRIP", "1")
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index efd413b..7f04387 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -1,7 +1,7 @@
>  # ex:ts=3D4:sw=3D4:sts=3D4:et
>  # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
>  #
> -# This bbclass is used for creating archive for:
> +# This bbclass is used for creating archives for:
>  # 1) original (or unpacked) source: ARCHIVER_MODE[src] =3D "original"
>  # 2) patched source: ARCHIVER_MODE[src] =3D "patched" (default)
>  # 3) configured source: ARCHIVER_MODE[src] =3D "configured"
> @@ -48,7 +48,6 @@ do_ar_original[dirs] =3D "${ARCHIVER_OUTDIR} ${ARCHIVER=
_WORKDIR}"
>=20
>  # This is a convenience for the shell script to use it
>=20
> -
>  python () {
>      pn =3D d.getVar('PN', True)
>=20
> @@ -71,7 +70,7 @@ python () {
>          d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_patc=
hed' % pn)
>      elif ar_src =3D=3D "configured":
>          # We can't use "addtask do_ar_configured after do_configure" sin=
ce it
> -        # will cause the deptask of do_populate_sysroot to run not matte=
r what
> +        # will cause the deptask of do_populate_sysroot to run no matter=
 what
>          # archives we need, so we add the depends here.
>          d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure=
' % pn)
>          d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_conf=
igured' % pn)
> @@ -122,7 +121,7 @@ python () {
>              d.setVarFlag('do_unpack_and_patch', 'stamp-base-clean', flag=
_clean)
>  }
>=20
> -# Take all the sources for a recipe and puts them in WORKDIR/archiver-wo=
rk/.
> +# Take all the sources for a recipe and put them in WORKDIR/archiver-wor=
k/.
>  # Files in SRC_URI are copied directly, anything that's a directory
>  # (e.g. git repositories) is "unpacked" and then put into a tarball.
>  python do_ar_original() {
> @@ -190,8 +189,7 @@ python do_ar_configured() {
>          bb.note('Archiving the configured source...')
>          # The libtool-native's do_configure will remove the
>          # ${STAGING_DATADIR}/aclocal/libtool.m4, so we can't re-run the
> -        # do_configure, we archive the already configured ${S} to
> -        # instead of.
> +        # do_configure, we archive the already configured ${S} instead.
>          if d.getVar('PN', True) !=3D 'libtool-native':
>              # Change the WORKDIR to make do_configure run in another dir.
>              d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
> @@ -276,9 +274,9 @@ python do_unpack_and_patch() {
>      # Change the WORKDIR to make do_unpack do_patch run in another dir.
>      d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
>=20
> -    # The changed 'WORKDIR' also casued 'B' changed, create dir 'B' for =
the
> -    # possibly requiring of the following tasks (such as some recipes's
> -    # do_patch required 'B' existed).
> +    # The changed 'WORKDIR' also caused 'B' to change, create dir 'B' for
> +    # possibly requiring the following tasks (such as some recipe's
> +    # do_patch requiring that 'B' exists).
>      bb.utils.mkdirhier(d.getVar('B', True))
>=20
>      # The kernel source is ready after do_validate_branches
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 8114cf6..3c24727 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -68,7 +68,7 @@ def base_dep_prepend(d):
>      #
>=20
>      deps =3D ""
> -    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether =
or  not
> +    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether =
or not
>      # we need that built is the responsibility of the patch function / c=
lass, not
>      # the application.
>      if not d.getVar('INHIBIT_DEFAULT_DEPS'):
> @@ -81,8 +81,8 @@ BASEDEPENDS =3D "${@base_dep_prepend(d)}"
>  DEPENDS_prepend=3D"${BASEDEPENDS} "
>=20
>  FILESPATH =3D "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_D=
IRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
> -# THISDIR only works properly with imediate expansion as it has to run
> -# in the context of the location its used (:=3D)
> +# THISDIR only works properly with immediate expansion as it has to run
> +# in the context of the location where it's used (:=3D)
>  THISDIR =3D "${@os.path.dirname(d.getVar('FILE', True))}"
>=20
>  def extra_path_elements(d):
> @@ -311,8 +311,8 @@ python base_eventhandler() {
>          bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
>=20
>      # This code is to silence warnings where the SDK variables overwrite=
 the
> -    # target ones and we'd see dulpicate key names overwriting each other
> -    # for various PREFERRED_PROVIDERS
> +    # target ones and we'd see duplicate key names overwriting each other
> +    # for various PREFERRED_PROVIDERs.
>      if isinstance(e, bb.event.RecipePreFinalise):
>          if e.data.getVar("TARGET_PREFIX", True) =3D=3D e.data.getVar("SD=
K_PREFIX", True):
>              e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}bi=
nutils")
> @@ -465,7 +465,7 @@ python () {
>          else:
>              appendVar('EXTRA_OECONF', extraconf)
>=20
> -    # If PRINC is set, try and increase the PR value by the amount speci=
fied
> +    # If PRINC is set, try and increase the PR value by the amount speci=
fied.
>      # The PR server is now the preferred way to handle PR changes based =
on
>      # the checksum of the recipe (including bbappend).  The PRINC is now
>      # obsolete.  Return a warning to the user.
> @@ -495,7 +495,7 @@ python () {
>                   " whitelisted in LICENSE_FLAGS_WHITELIST")
>=20
>      # If we're building a target package we need to use fakeroot (pseudo)
> -    # in order to capture permissions, owners, groups and special files
> +    # in order to capture permissions, owners, groups and special files.
>      if not bb.data.inherits_class('native', d) and not bb.data.inherits_=
class('cross', d):
>          d.setVarFlag('do_unpack', 'umask', '022')
>          d.setVarFlag('do_configure', 'umask', '022')
> @@ -587,12 +587,12 @@ python () {
>      elif "osc://" in srcuri:
>          d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_=
sysroot')
>=20
> -    # *.lz4 should depends on lz4-native for unpacking
> +    # *.lz4 should depend on lz4-native for unpacking
>      # Not endswith because of "*.patch.lz4;patch=3D1". Need bb.fetch.dec=
odeurl in future
>      if '.lz4' in srcuri:
>          d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate=
_sysroot')
>=20
> -    # *.xz should depends on xz-native for unpacking
> +    # *.xz should depend on xz-native for unpacking
>      # Not endswith because of "*.patch.xz;patch=3D1". Need bb.fetch.deco=
deurl in future
>      if '.xz' in srcuri:
>          d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_=
sysroot')
> @@ -616,7 +616,7 @@ python () {
>          return
>=20
>      #
> -    # We always try to scan SRC_URI for urls with machine overrides
> +    # We always try to scan SRC_URI for URLs with machine overrides
>      # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=3D0
>      #
>      override =3D d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
> diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbcl=
ass
> index a0141a8..b988808 100644
> --- a/meta/classes/blacklist.bbclass
> +++ b/meta/classes/blacklist.bbclass
> @@ -1,15 +1,11 @@
> -# anonymous support class from originally from angstrom
> +# anonymous support class originally from angstrom
>  #
> -# To use the blacklist, a distribution should include this
> -# class in the INHERIT_DISTRO
> -#
> -# No longer use ANGSTROM_BLACKLIST, instead use a table of
> -# recipes in PNBLACKLIST
> +# This class is already included by default from defaultsetup.conf.
>  #
>  # Features:
>  #
>  # * To add a package to the blacklist, set:
> -#   PNBLACKLIST[pn] =3D "message"
> +#   PNBLACKLIST[pn] =3D "message explaining rejection"
>  #
>=20
>  # Cope with PNBLACKLIST flags for multilib case
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-dir=
ectdisk.bbclass
> index 995d3e7..8c8039b 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -1,19 +1,19 @@
>  # boot-directdisk.bbclass
> -# (loosly based off bootimg.bbclass Copyright (C) 2004, Advanced Micro D=
evices, Inc.)
> +# (loosely based off bootimg.bbclass Copyright (C) 2004, Advanced Micro =
Devices, Inc.)
>  #
>  # Create an image which can be placed directly onto a harddisk using dd =
and then
>  # booted.
>  #
> -# This uses syslinux. extlinux would have been nice but required the ext=
2/3
> +# This uses SYSLINUX. extlinux would have been nice but required the ext=
2/3
>  # partition to be mounted. grub requires to run itself as part of the in=
stall
>  # process.
>  #
> -# The end result is a 512 boot sector populated with an MBR and partitio=
n table
> -# followed by an msdos fat16 partition containing syslinux and a linux k=
ernel
> -# completed by the ext2/3 rootfs.
> +# The end result is a 512-byte boot sector populated with an MBR and
> +# partition table followed by an MSDOS fat16 partition containing SYSLIN=
UX
> +# and a linux kernel completed by the ext2/3 rootfs.
>  #
> -# We have to push the msdos parition table size > 16MB so fat 16 is used=
 as parted
> -# won't touch fat12 partitions.
> +# We have to push the MSDOS partition table size > 16MB so fat16 is used
> +# as parted won't touch fat12 partitions.
>=20
>  # External variables needed
>=20
> diff --git a/meta/classes/bugzilla.bbclass b/meta/classes/bugzilla.bbclass
> index 3fc8956..234d964 100644
> --- a/meta/classes/bugzilla.bbclass
> +++ b/meta/classes/bugzilla.bbclass
> @@ -1,7 +1,7 @@
>  #
>  # Small event handler to automatically open URLs and file
> -# bug reports at a bugzilla of your choiche
> -# it uses XML-RPC interface, so you must have it enabled
> +# bug reports at a bugzilla of your choice;
> +# it uses XML-RPC interface, so you must have it enabled.
>  #
>  # Before using you must define BUGZILLA_USER, BUGZILLA_PASS credentials,
>  # BUGZILLA_XMLRPC - uri of xmlrpc.cgi,
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index 20382ce..7c6d384 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -24,7 +24,7 @@ sstate_install[vardepsexclude] +=3D "buildhistory_emit_=
pkghistory"
>  SSTATEPOSTINSTFUNCS[vardepvalueexclude] .=3D "| buildhistory_emit_pkghis=
tory"
>=20
>  #
> -# Write out metadata about this package for comparision when writing fut=
ure packages
> +# Write out metadata about this package for comparison when writing futu=
re packages
>  #
>  python buildhistory_emit_pkghistory() {
>      if not d.getVar('BB_CURRENTTASK', True) in ['packagedata', 'packaged=
ata_setscene']:
> @@ -431,7 +431,8 @@ buildhistory_get_sdk_installed_target() {
>=20
>  buildhistory_list_files() {
>  	# List the files in the specified directory, but exclude date/time etc.
> -	# This awk script is somewhat messy, but handles where the size is not =
printed for device files under pseudo
> +	# This awk script is somewhat messy, but handles where the size is
> +	# not printed for device files under pseudo
>  	( cd $1 && find . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 |=
 sed 's/ * -> $//' > $2 )
>  }
>=20
> @@ -490,7 +491,8 @@ ROOTFS_POSTPROCESS_COMMAND =3D+ " buildhistory_list_i=
nstalled_image ;\
>=20
>  IMAGE_POSTPROCESS_COMMAND +=3D " buildhistory_get_imageinfo ; "
>=20
> -# We want these to be the last run so that we get called after complemen=
tary package installation
> +# We want these to be the last run so that we get called after
> +# complementary package installation.
>  POPULATE_SDK_POST_TARGET_COMMAND_append =3D " buildhistory_list_installe=
d_sdk_target ;\
>                                              buildhistory_get_sdk_install=
ed_target ; "
>  POPULATE_SDK_POST_HOST_COMMAND_append =3D " buildhistory_list_installed_=
sdk_host ;\
> @@ -505,7 +507,8 @@ def buildhistory_get_layers(d):
>      return layertext
>=20
>  def buildhistory_get_metadata_revs(d):
> -    # We want an easily machine-readable format here, so get_layers_bran=
ch_rev isn't quite what we want
> +    # We want an easily machine-readable format here, so get_layers_bran=
ch_rev
> +    # isn't quite what we want
>      layers =3D (d.getVar("BBLAYERS", True) or "").split()
>      medadata_revs =3D ["%-17s =3D %s:%s" % (os.path.basename(i), \
>          base_get_metadata_git_branch(i, None).strip(), \
> @@ -555,7 +558,8 @@ def buildhistory_get_cmdline(d):
>=20
>  buildhistory_commit() {
>  	if [ ! -d ${BUILDHISTORY_DIR} ] ; then
> -		# Code above that creates this dir never executed, so there can't be a=
nything to commit
> +		# Code above that creates this dir never executed, so there
> +		# can't be anything to commit
>  		return
>  	fi
>=20
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bb=
class
> index 1b36cba..b897c5b 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D4d=
92cd373abda3937c2bc47fbc49d
>=20
>  # IMAGE_FEATURES control content of the core reference images
>  #
> -# By default we install packagegroup-core-boot and packagegroup-base pac=
kages - this gives us
> -# working (console only) rootfs.
> +# By default we install packagegroup-core-boot and packagegroup-base pac=
kages;
> +# this gives us working (console only) rootfs.
>  #
>  # Available IMAGE_FEATURES:
>  #
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-can=
adian.bbclass
> index 6da43fe..54322b4 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -1,5 +1,5 @@
>  #
> -# NOTE - When using this class the user is repsonsible for ensuring that
> +# NOTE - When using this class the user is responsible for ensuring that
>  # TRANSLATED_TARGET_ARCH is added into PN. This ensures that if the TARG=
ET_ARCH
>  # is changed, another nativesdk xxx-canadian-cross can be installed
>  #
> @@ -114,7 +114,7 @@ do_populate_sysroot[stamp-extra-info] =3D ""
>=20
>  USE_NLS =3D "${SDKUSE_NLS}"
>=20
> -# We have to us TARGET_ARCH but we care about the absolute value
> +# We have to use TARGET_ARCH but we care about the absolute value
>  # and not any particular tune that is enabled.
>  TARGET_ARCH[vardepsexclude] =3D "TUNE_ARCH"
>=20
> diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
> index 261a374..27a3e2b 100644
> --- a/meta/classes/crosssdk.bbclass
> +++ b/meta/classes/crosssdk.bbclass
> @@ -29,7 +29,7 @@ baselib =3D "lib"
>  do_populate_sysroot[stamp-extra-info] =3D ""
>  do_packagedata[stamp-extra-info] =3D ""
>=20
> -# Need to force this to ensure consitency accross architectures
> +# Need to force this to ensure consistency accross architectures
>  EXTRA_OECONF_FPU =3D ""
>=20
>  USE_NLS =3D "no"
> diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
> index 1ddb56f..2eca2db 100644
> --- a/meta/classes/debian.bbclass
> +++ b/meta/classes/debian.bbclass
> @@ -1,7 +1,7 @@
> -# Debian package renaming only occurs when a package is built
> +# Debian package renaming only occurs when a package is built.
>  # We therefore have to make sure we build all runtime packages
> -# before building the current package to make the packages runtime
> -# depends are correct
> +# before building the current package to make sure the packages
> +# runtime depends are correct.
>  #
>  # Custom library package names can be defined setting
>  # DEBIANNAME_ + pkgname to the desired name.
> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
> index 41164a3..be994dd 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -22,8 +22,8 @@ do_devshell[nostamp] =3D "1"
>=20
>  # devshell and fakeroot/pseudo need careful handling since only the final
>  # command should run under fakeroot emulation, any X connection should
> -# be done as the normal user. We therfore carefully construct the envion=
ment
> -# manually
> +# be done as the normal user. We therefore carefully construct the envir=
onment
> +# manually.
>  python () {
>      if d.getVarFlag("do_devshell", "fakeroot"):
>         # We need to signal our code that we want fakeroot however we
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index 47bd35e..189b102 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -13,7 +13,7 @@
>  # ${LABELS} - a list of targets for the automatic config
>  # ${APPEND} - an override list of append strings for each label
>  # ${GRUB_OPTS} - additional options to add to the config, ';' delimited =
# (optional)
> -# ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
> +# ${GRUB_TIMEOUT} - timeout before executing the default label (optional)
>=20
>  do_bootimg[depends] +=3D "${MLPREFIX}grub-efi:do_deploy"
>  do_bootdirectdisk[depends] +=3D "${MLPREFIX}grub-efi:do_deploy"
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 3ec8c06..db44703 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -3,26 +3,30 @@
>  # Stages directories with symlinks from gcc/g++ to icecc, for both
>  # native and cross compilers. Depending on each configure or compile,
>  # the directories are added at the head of the PATH list and ICECC_CXX
> -# and ICEC_CC are set.
> +# and ICECC_CC are set.
>  #
>  # For the cross compiler, creates a tar.gz of our toolchain and sets
>  # ICECC_VERSION accordingly.
>  #
> -# The class now handles all 3 different compile 'stages' (i.e native ,cr=
oss-kernel and target) creating the
> -# necessary environment tar.gz file to be used by the remote machines.
> -# It also supports meta-toolchain generation
> +# The class now handles all 3 different compile 'stages' (i.e native,
> +# cross-kernel and target) creating the necessary environment tar.gz file
> +# to be used by the remote machines. It also supports meta-toolchain gen=
eration.
>  #
> -# If ICECC_PATH is not set in local.conf then the class will try to loca=
te it using 'bb.utils.which'
> -# but nothing is sure ;)
> +# If ICECC_PATH is not set in local.conf then the class will try to loca=
te it
> +# using 'bb.utils.which' but nothing is sure ;)
>  #
> -# If ICECC_ENV_EXEC is set in local.conf, then it should point to the ic=
ecc-create-env script provided by the user
> -# or the default one provided by icecc-create-env.bb will be used
> -# (NOTE that this is a modified version of the script need it and *not t=
he one that comes with icecc*
> +# If ICECC_ENV_EXEC is set in local.conf, then it should point to the
> +# icecc-create-env script provided by the user or the default one
> +# provided by icecc-create-env.bb will be used.
> +# (NOTE that this is a modified version of the script and *not the one
> +# that comes with icecc*.
>  #
> -# User can specify if specific packages or packages belonging to class s=
hould not use icecc to distribute
> -# compile jobs to remote machines, but handled locally, by defining ICEC=
C_USER_CLASS_BL and ICECC_USER_PACKAGE_BL
> -# with the appropriate values in local.conf. In addition the user can fo=
rce to enable icecc for packages
> -# which set an empty PARALLEL_MAKE variable by defining ICECC_USER_PACKA=
GE_WL.
> +# User can specify if specific packages or packages belonging to class
> +# should not use icecc to distribute compile jobs to remote machines,
> +# but handled locally, by defining ICECC_USER_CLASS_BL and ICECC_USER_PA=
CKAGE_BL
> +# with the appropriate values in local.conf. In addition, the user can
> +# force to enable icecc for packages # which set an empty PARALLEL_MAKE
> +# variable by defining ICECC_USER_PACKAGE_WL.
>  #
>  ########################################################################=
#################
>  #Error checking is kept to minimum so double check any parameters you pa=
ss to the class
> @@ -33,7 +37,7 @@ BB_HASHBASE_WHITELIST +=3D "ICECC_PARALLEL_MAKE ICECC_D=
ISABLED ICECC_USER_PACKAGE_
>  ICECC_ENV_EXEC ?=3D "${STAGING_BINDIR_NATIVE}/icecc-create-env"
>=20
>  def icecc_dep_prepend(d):
> -    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether =
or  not
> +    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether =
or not
>      # we need that built is the responsibility of the patch function / c=
lass, not
>      # the application.
>      if not d.getVar('INHIBIT_DEFAULT_DEPS'):
> @@ -66,7 +70,7 @@ def create_path(compilers, bb, d):
>      if icc_is_kernel(bb, d):
>          staging +=3D "-kernel"
>=20
> -    #check if the icecc path is set by the user
> +    # Check if the icecc path is set by the user
>      icecc =3D get_icecc(d)
>=20
>      # Create the dir if necessary
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 55bfaf2..51b1993 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -8,7 +8,7 @@
>  #  -Check the RUNTIME path for the $TMPDIR
>  #  -Check if .la files wrongly point to workdir
>  #  -Check if .pc files wrongly point to workdir
> -#  -Check if packages contains .debug directories or .so files
> +#  -Check if packages contain .debug directories or .so files
>  #   where they should be in -dev or -dbg
>  #  -Check if config.log contains traces to broken autoconf tests
>  #  -Ensure that binaries in base_[bindir|sbindir|libdir] do not link
> @@ -24,7 +24,7 @@ QADEPENDS_class-native =3D ""
>  QADEPENDS_class-nativesdk =3D ""
>  QA_SANE =3D "True"
>=20
> -# Elect whether a given type of error is a warning or error, they may
> +# Select whether a given type of error is a warning or error, they may
>  # have been set by other files.
>  WARN_QA ?=3D "ldflags useless-rpaths rpaths staticdev libdir xorg-driver=
-abi \
>              textrel already-stripped incompatible-license files-invalid \
> @@ -236,8 +236,8 @@ def package_qa_check_useless_rpaths(file, name, d, el=
f, messages):
>          if m:
>              rpath =3D m.group(1)
>              if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
> -                # The dynamic linker searches both these places anyway. =
 There is no point in
> -                # looking there again.
> +                # The dynamic linker searches both these places anyway.
> +                # There is no point in looking there again.
>                  messages["useless-rpaths"] =3D "%s: %s contains probably=
-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath)
>=20
>  QAPATHTEST[dev-so] =3D "package_qa_check_dev"
> diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.=
bbclass
> index a63f482..b9079e9 100644
> --- a/meta/classes/kernel-grub.bbclass
> +++ b/meta/classes/kernel-grub.bbclass
> @@ -4,14 +4,14 @@
>  # you to fall back to the original kernel as well.
>  #
>  # - In kernel-image's preinstall scriptlet, it backs up original kernel =
to avoid
> -#   probable confliction with the new one.
> +#   probable conflict with the new one.
>  #
>  # - In kernel-image's postinstall scriptlet, it modifies grub's config f=
ile to
>  #   updates the new kernel as the boot priority.
>  #
>=20
>  pkg_preinst_kernel-image_append () {
> -	# Parsing confliction
> +	# Parsing conflict
>  	[ -f "$D/boot/grub/menu.list" ] && grubcfg=3D"$D/boot/grub/menu.list"
>  	[ -f "$D/boot/grub/grub.cfg" ] && grubcfg=3D"$D/boot/grub/grub.cfg"
>  	if [ -n "$grubcfg" ]; then
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yoct=
o.bbclass
> index 6010dc9..8fcc7fe 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -44,7 +44,7 @@ def find_kernel_feature_dirs(d):
>=20
>      return feature_dirs
>=20
> -# find the master/machine source branch. In the same way that the fetche=
r proceses
> +# find the master/machine source branch. In the same way that the fetche=
r processes
>  # git repositories in the SRC_URI we take the first repo found, first br=
anch.
>  def get_machine_branch(d, default):
>      fetch =3D bb.fetch2.Fetch([], d)
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-packag=
e.bbclass
> index c1bc399..2d399b8 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -1,6 +1,6 @@
>  #
> -# This class knows how to package up [e]glibc. Its shared since prebuild=
 binary toolchains
> -# may need packaging and its pointless to duplicate this code.
> +# This class knows how to package up [e]glibc. It's shared since prebuil=
d binary
> +# toolchains may need packaging and it's pointless to duplicate this cod=
e.
>  #
>  # Caller should set GLIBC_INTERNAL_USE_BINARY_LOCALE to one of:
>  #  "compile" - Use QEMU to generate the binary locale files
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 601f561..1042405 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -110,7 +110,7 @@ python do_populate_lic() {
>      copy_license_files(lic_files_paths, destdir)
>  }
>=20
> -# it would be better to copy them in do_install_append, but find_license=
_filesa is python
> +# it would be better to copy them in do_install_append, but find_license=
_files is python
>  python perform_packagecopy_prepend () {
>      enabled =3D oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
>      if d.getVar('CLASSOVERRIDE', True) =3D=3D 'class-target' and enabled:
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index ad6f7af..d8450ff 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -26,7 +26,7 @@ module_do_install() {
>=20
>  EXPORT_FUNCTIONS do_compile do_install
>=20
> -# add all splitted modules to PN RDEPENDS, PN can be empty now
> +# add all split modules to PN RDEPENDS, PN can be empty now
>  KERNEL_MODULES_META_PACKAGE =3D "${PN}"
>  FILES_${PN} =3D ""
>  ALLOW_EMPTY_${PN} =3D "1"
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 6a552d9..77186f8 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -26,7 +26,7 @@
>  #    a list of affected files in FILER{PROVIDES,DEPENDS}FLIST_pkg
>  #
>  # h) package_do_shlibs - Look at the shared libraries generated and auto=
tmatically add any
> -#    depenedencies found. Also stores the package name so anyone else us=
ing this library
> +#    dependencies found. Also stores the package name so anyone else usi=
ng this library
>  #    knows which package to depend on.
>  #
>  # i) package_do_pkgconfig - Keep track of which packages need and provid=
e which .pc files
> @@ -288,7 +288,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sour=
cefile, d):
>      return 0
>=20
>  def copydebugsources(debugsrcdir, d):
> -    # The debug src information written out to sourcefile is further pro=
cecessed
> +    # The debug src information written out to sourcefile is further pro=
cessed
>      # and copied to the destination here.
>=20
>      import stat
> @@ -814,7 +814,7 @@ python split_and_strip_files () {
>                      continue
>                  if not s:
>                      continue
> -                # Check its an excutable
> +                # Check it's an excutable
>                  if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] =
& stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
>                          or ((file.startswith(libdir) or file.startswith(=
baselibdir)) and ".so" in f):
>                      # If it's a symlink, and points to an ELF file, we c=
apture the readlink target
> @@ -844,7 +844,7 @@ python split_and_strip_files () {
>                          elffiles[file] =3D elf_file
>=20
>      #
> -    # First lets process debug splitting
> +    # First, let's process debug splitting
>      #
>      if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) !=3D '1'):
>          hardlinkmap =3D {}
> @@ -1463,7 +1463,7 @@ python package_do_shlibs() {
>              rpath =3D []
>              p =3D sub.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file=
],stdout=3Dsub.PIPE,stderr=3Dsub.PIPE)
>              err, out =3D p.communicate()
> -            # If returned succesfully, process stderr for results
> +            # If returned successfully, process stderr for results
>              if p.returncode =3D=3D 0:
>                  for l in err.split("\n"):
>                      l =3D l.strip()
> @@ -1472,7 +1472,7 @@ python package_do_shlibs() {
>=20
>          p =3D sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file],st=
dout=3Dsub.PIPE,stderr=3Dsub.PIPE)
>          err, out =3D p.communicate()
> -        # If returned succesfully, process stderr for results
> +        # If returned successfully, process stderr for results
>          if p.returncode =3D=3D 0:
>              for l in err.split("\n"):
>                  l =3D l.strip()
> @@ -1938,9 +1938,9 @@ python do_package () {
>      # Optimisations
>      ####################################################################=
#######
>=20
> -    # Contunually rexpanding complex expressions is inefficient, particu=
larly when
> -    # we write to the datastore and invalidate the expansion cache. This=
 code
> -    # pre-expands some frequently used variables
> +    # Continually re-expanding complex expressions is inefficient, parti=
cularly
> +    # when we write to the datastore and invalidate the expansion cache.=
 This
> +    # code pre-expands some frequently used variables.
>=20
>      def expandVar(x, d):
>          d.setVar(x, d.getVar(x, True))
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.=
bbclass
> index 0a32b3e..b24b91a 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -7,7 +7,7 @@ RPMBUILD=3D"rpmbuild"
>=20
>  PKGWRITEDIRRPM =3D "${WORKDIR}/deploy-rpms"
>=20
> -# Maintaining the perfile dependencies has singificant overhead when wri=
ting the
> +# Maintaining the per-file dependencies has significant overhead when wr=
iting the
>  # packages. When set, this value merges them for efficiency.
>  MERGEPERFILEDEPS =3D "1"
>=20
> @@ -171,7 +171,7 @@ python write_specfile () {
>              depends =3D bb.utils.join_deps(newdeps_dict)
>              d.setVar(varname, depends.strip())
>=20
> -    # We need to change the style the dependency from BB to RPM
> +    # We need to change the style of the dependency from BB to RPM.
>      # This needs to happen AFTER the mapping_rename_hook
>      def print_deps(variable, tag, array, d):
>          depends =3D variable
> @@ -635,7 +635,7 @@ python do_package_rpm () {
>          return
>=20
>      # Construct the spec file...
> -    # If the spec file already exist, and has not been stored into
> +    # If the spec file already exists, and has not been stored into
>      # pseudo's files.db, it maybe cause rpmbuild src.rpm fail,
>      # so remove it before doing rpmbuild src.rpm.
>      srcname    =3D strip_multilib(d.getVar('PN', True), d)
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index f0f6d18..7d656de 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -1,7 +1,7 @@
>  #
>  # Removes source after build
>  #
> -# To use it add that line to conf/local.conf:
> +# To use it add this line to conf/local.conf:
>  #
>  # INHERIT +=3D "rm_work"
>  #
> @@ -31,7 +31,7 @@ do_rm_work () {
>      for dir in *
>      do
>          # Retain only logs and other files in temp, safely ignore
> -        # failures of removing pseudo folers on NFS2/3 server.
> +        # failures of removing pseudo folders on NFS2/3 server.
>          if [ $dir =3D 'pseudo' ]; then
>              rm -rf $dir 2> /dev/null || true
>          elif [ $dir !=3D 'temp' ]; then
> @@ -39,7 +39,7 @@ do_rm_work () {
>          fi
>      done
>=20
> -    # Need to add pseudo back or subsqeuent work in this workdir
> +    # Need to add pseudo back or subsequent work in this workdir
>      # might fail since setscene may not rerun to recreate it
>      mkdir -p ${WORKDIR}/pseudo/
>=20
> diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
> index 55ce3af..d6302eb 100644
> --- a/meta/classes/spdx.bbclass
> +++ b/meta/classes/spdx.bbclass
> @@ -1,5 +1,5 @@
>  # This class integrates real-time license scanning, generation of SPDX s=
tandard
> -# output and verifiying license info during the building process.
> +# output and verifying license info during the building process.
>  # It is a combination of efforts from the OE-Core, SPDX and Fossology pr=
ojects.
>  #
>  # For more information on FOSSology:
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WRT3RXLOp/bBMgTI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPiG3IACgkQN1Ujt2V2gBw6JQCffZfr4F5u0Bmc/btYVpLOaVlC
IdQAoJu8IAM9I8LSIudQz4/CRGYChyAy
=OTCS
-----END PGP SIGNATURE-----

--WRT3RXLOp/bBMgTI--
