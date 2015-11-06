Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 70B2F60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 09:33:11 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0224.002; Fri, 6 Nov 2015 10:33:06 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "Maxin B. John" <maxin.john@intel.com>
Thread-Topic: [OE-core] [PATCH 2/5] bbclass: fix spelling mistakes
Thread-Index: AQHRF+FqvbmFA1n6NUWx6V+Y3VMhLJ6OuovA
Date: Fri, 6 Nov 2015 09:33:06 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E4825A85206@SESTOEX04.enea.se>
References: <1446738498-19155-1-git-send-email-maxin.john@intel.com>
In-Reply-To: <1446738498-19155-1-git-send-email-maxin.john@intel.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] bbclass: fix spelling mistakes
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
X-List-Received-Date: Fri, 06 Nov 2015 09:33:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Maxin,

I think the warning below " bb.warn" is incorrect, it should be " dirname" =
instead of " patch",  see below:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/spdx.bbcla=
ss (master)

def get_ver_code(dirname):
    chksums =3D []
    for f_dir, f in list_files(dirname):
        hash =3D hash_file(os.path.join(dirname, f_dir, f))
        if not hash is None:
            chksums.append(hash)
        else:
            bb.warn("SPDX: Could not hash file: " + patch) <<< dirname

Could you please have a look at this as well?

Regrads
//Sona

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Maxin B. John
> Sent: den 5 november 2015 16:48
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/5] bbclass: fix spelling mistakes
>=20
> Fix some spelling mistakes in bbclass files
>=20
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/classes/allarch.bbclass             | 2 +-
>  meta/classes/archiver.bbclass            | 2 +-
>  meta/classes/buildhistory.bbclass        | 2 +-
>  meta/classes/chrpath.bbclass             | 4 ++--
>  meta/classes/crosssdk.bbclass            | 2 +-
>  meta/classes/module-base.bbclass         | 2 +-
>  meta/classes/package.bbclass             | 4 ++--
>  meta/classes/package_deb.bbclass         | 2 +-
>  meta/classes/siteinfo.bbclass            | 2 +-
>  meta/classes/spdx.bbclass                | 2 +-
>  meta/classes/tinderclient.bbclass        | 2 +-
>  meta/classes/update-alternatives.bbclass | 2 +-
>  12 files changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass =
index
> 2fea7c0..3826643 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -1,5 +1,5 @@
>  #
> -# This class is used for architecture independent recipes/data files (us=
ally
> scripts)
> +# This class is used for architecture independent recipes/data files
> +(usually scripts)
>  #
>=20
>  # Expand STAGING_DIR_HOST since for cross-canadian/native/nativesdk, thi=
s
> will diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.b=
bclass
> index 41a552c..f4a34df 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -254,7 +254,7 @@ python do_unpack_and_patch() {
>      ar_outdir =3D d.getVar('ARCHIVER_OUTDIR', True)
>      d.setVar('WORKDIR', ar_outdir)
>=20
> -    # The changed 'WORKDIR' also casued 'B' changed, create dir 'B' for =
the
> +    # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for
> + the
>      # possibly requiring of the following tasks (such as some recipes's
>      # do_patch required 'B' existed).
>      bb.utils.mkdirhier(d.getVar('B', True)) diff --git
> a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 4db0441..c3da773 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -24,7 +24,7 @@ sstate_install[vardepsexclude] +=3D
> "buildhistory_emit_pkghistory"
>  SSTATEPOSTINSTFUNCS[vardepvalueexclude] .=3D "|
> buildhistory_emit_pkghistory"
>=20
>  #
> -# Write out metadata about this package for comparision when writing fut=
ure
> packages
> +# Write out metadata about this package for comparison when writing
> +future packages
>  #
>  python buildhistory_emit_pkghistory() {
>      if not d.getVar('BB_CURRENTTASK', True) in ['packagedata',
> 'packagedata_setscene']:
> diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass =
index
> e9160af..9c68855 100644
> --- a/meta/classes/chrpath.bbclass
> +++ b/meta/classes/chrpath.bbclass
> @@ -6,7 +6,7 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix,
> tmpdir, d):
>=20
>      p =3D sub.Popen([cmd, '-l', fpath],stdout=3Dsub.PIPE,stderr=3Dsub.PI=
PE)
>      err, out =3D p.communicate()
> -    # If returned succesfully, process stderr for results
> +    # If returned successfully, process stderr for results
>      if p.returncode !=3D 0:
>          return
>=20
> @@ -45,7 +45,7 @@ def process_file_darwin(cmd, fpath, rootdir, baseprefix=
,
> tmpdir, d):
>=20
>      p =3D sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L',
> fpath],stdout=3Dsub.PIPE,stderr=3Dsub.PIPE)
>      err, out =3D p.communicate()
> -    # If returned succesfully, process stderr for results
> +    # If returned successfully, process stderr for results
>      if p.returncode !=3D 0:
>          return
>      for l in err.split("\n"):
> diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclas=
s
> index 87d5cf5..7315c38 100644
> --- a/meta/classes/crosssdk.bbclass
> +++ b/meta/classes/crosssdk.bbclass
> @@ -30,7 +30,7 @@ baselib =3D "lib"
>  do_populate_sysroot[stamp-extra-info] =3D ""
>  do_packagedata[stamp-extra-info] =3D ""
>=20
> -# Need to force this to ensure consitency accross architectures
> +# Need to force this to ensure consitency across architectures
>  EXTRA_OECONF_GCC_FLOAT =3D ""
>=20
>  USE_NLS =3D "no"
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-
> base.bbclass
> index 8be26c4..cdff0a5 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -19,7 +19,7 @@ KERNEL_OBJECT_SUFFIX =3D ".ko"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
>  # Function to ensure the kernel scripts are created. Expected to -# be c=
alled
> before do_compile. See module.bbclass for an exmaple.
> +# be called before do_compile. See module.bbclass for an example.
>  do_make_scripts() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>  	make CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" AR=3D"${KERNEL_AR}" \
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index a86b680..2bae341 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1513,7 +1513,7 @@ python package_do_shlibs() {
>              rpath =3D []
>              p =3D sub.Popen([d.expand("${HOST_PREFIX}otool"), '-l',
> file],stdout=3Dsub.PIPE,stderr=3Dsub.PIPE)
>              err, out =3D p.communicate()
> -            # If returned succesfully, process stderr for results
> +            # If returned successfully, process stderr for results
>              if p.returncode =3D=3D 0:
>                  for l in err.split("\n"):
>                      l =3D l.strip()
> @@ -1522,7 +1522,7 @@ python package_do_shlibs() {
>=20
>          p =3D sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L',
> file],stdout=3Dsub.PIPE,stderr=3Dsub.PIPE)
>          err, out =3D p.communicate()
> -        # If returned succesfully, process stderr for results
> +        # If returned successfully, process stderr for results
>          if p.returncode =3D=3D 0:
>              for l in err.split("\n"):
>                  l =3D l.strip()
> diff --git a/meta/classes/package_deb.bbclass
> b/meta/classes/package_deb.bbclass
> index d2fea4f..5feeeb0 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -21,7 +21,7 @@ APT_ARGS =3D "${@['', '--no-install-
> recommends'][d.getVar("NO_RECOMMENDATIONS", Tr  #
> INSTALL_BASEARCH_DEB - install base architecutre  # INSTALL_ARCHS_DEB -
> list of available archs  # INSTALL_PACKAGES_NORMAL_DEB - packages to be
> installed -# INSTALL_PACKAGES_ATTEMPTONLY_DEB - packages attemped to
> be installed only
> +# INSTALL_PACKAGES_ATTEMPTONLY_DEB - packages attempted to be
> installed
> +only
>  # INSTALL_PACKAGES_LINGUAS_DEB - additional packages for uclibc  #
> INSTALL_TASK_DEB - task name
>=20
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclas=
s index
> 9f6eac4..b715b6c 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -8,7 +8,7 @@
>  #
>  # 'what' can be one of
>  # * target: Returns the target name ("<arch>-<os>") -# * endianess: Retu=
rn
> "be" for big endian targets, "le" for little endian
> +# * endianness: Return "be" for big endian targets, "le" for little
> +endian
>  # * bits: Returns the bit size of the target, either "32" or "64"
>  # * libc: Returns the name of the c library used by the target  # diff -=
-git
> a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass index
> 454c53e..0c92765 100644
> --- a/meta/classes/spdx.bbclass
> +++ b/meta/classes/spdx.bbclass
> @@ -232,7 +232,7 @@ def run_fossology(foss_command, full_spdx):
>      # Package info
>      package_info =3D {}
>      if full_spdx:
> -        # All mandatory, only one occurance
> +        # All mandatory, only one occurrence
>          package_info['PackageCopyrightText'] =3D
> re.findall('PackageCopyrightText: (.*?</text>)', foss_output, re.S)[0]
>          package_info['PackageLicenseDeclared'] =3D
> re.findall('PackageLicenseDeclared: (.*)', foss_output)[0]
>          package_info['PackageLicenseConcluded'] =3D
> re.findall('PackageLicenseConcluded: (.*)', foss_output)[0] diff --git
> a/meta/classes/tinderclient.bbclass b/meta/classes/tinderclient.bbclass
> index 6984efd..2bc75fc 100644
> --- a/meta/classes/tinderclient.bbclass
> +++ b/meta/classes/tinderclient.bbclass
> @@ -142,7 +142,7 @@ def tinder_send_http(d, status, _log):
>=20
>      selector =3D url + "/xml/build_status.pl"
>=20
> -    # now post it - in chunks of 10.000 charachters
> +    # now post it - in chunks of 10.000 characters
>      new_log =3D _log
>      while len(new_log) > 0:
>          content_type, body =3D
> tinder_format_http_post(d,status,new_log[0:18000])
> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/upda=
te-
> alternatives.bbclass
> index a3c1657..825cc88 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -61,7 +61,7 @@
>  ALTERNATIVE_PRIORITY =3D "10"
>=20
>  # We need special processing for vardeps because it can not work on -#
> modified flag values.  So we agregate the flags into a new variable
> +# modified flag values.  So we aggregate the flags into a new variable
>  # and include that vairable in the set.
>  UPDALTVARS  =3D "ALTERNATIVE ALTERNATIVE_LINK_NAME
> ALTERNATIVE_TARGET ALTERNATIVE_PRIORITY"
>=20
> --
> 2.4.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

