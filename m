Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53072C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 21:58:35 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.5250.1633989512221461915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 14:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FpNJXjXq;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id j5so79334380lfg.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 14:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gQm4cwI8XLE88C2B6hslcHck+7srFRIu8KB0cy5p2FA=;
        b=FpNJXjXqObPwB7hx3ZsL8S9w3WrgJzdDoC/Q+7pq+EA3DKb/oj2mitYDirBu2LoPxt
         QP5BNJgGOOig+YnbB8MjYBzczge+mAhA2Fb4DYB0kxHOX7hMUA3qcxfDUYWXN1UF8rhA
         02AIviUx+fqVgELvnHqcCJrZaad+T4BL7ynNxuN4iFhXEEWmtFcZIv2MX4DB5c3n+k/s
         RaYVvmWPEz3wc/WwJoYQ77PkPONXD+kuoTTvIJbigF41s21OTfJ7DWQvzpGt4H/VXjBx
         30BcnWT9Z2Lx/ur8BXV1URQz2T5R7POzfIiDFp2SgXvMQO8j/LnMV/KEwY+mz9OClvXW
         xZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gQm4cwI8XLE88C2B6hslcHck+7srFRIu8KB0cy5p2FA=;
        b=D7zuYK7fDDfgqGITmAIwY+ILJ1ZdKB5QIEtyDHt+hW5jr+szOTXdip1fVmTSRWZKs+
         izgpuRi+ktsy/33t2pgfbEWMzJ1pxxJZ930XnfJZibniZpqs43cCRdyjN71/6EKsRrW5
         iaeVgRuiOK+I6xPbahrRNrqte5M5rVOQ1LfoqvtuAUsv2jVQkm6ZROOzH+dwtEnC9tUb
         G133/+ngUp8hlM5cNRwHHJ6KjCfm3twXOFEMmozFzafmHdGni38BXBQbtoECC3MxTtFI
         sbTHp6fUXFjAU/Nu3FHYzAKJ8wQSfTRF3JuZ89vst6CGqNiEEy0hNdembl6VHDmrbhSM
         UZ/w==
X-Gm-Message-State: AOAM5308fdO36WmzcwrvqWpv1hFRDe1x4KaEovPlc3gU5l3PjIE1lB8J
	TvHyS8i3NUtuHRdHUYACXbRVm3ce0DJGZ5vJ2Q0=
X-Google-Smtp-Source: 
 ABdhPJw5BoUr2Pd37VwQHcDJBE8FnXd2hFOmlRIzNIwkK0h6eiCF5FtxMn+ChHUNiEb7qUzuhrpUN6RvvlmvZuF7enM=
X-Received: by 2002:ac2:5484:: with SMTP id t4mr5486588lfk.94.1633989510268;
 Mon, 11 Oct 2021 14:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211011171208.3632459-1-hkleynhans@fb.com>
 <20211011171208.3632459-2-hkleynhans@fb.com>
In-Reply-To: <20211011171208.3632459-2-hkleynhans@fb.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 11 Oct 2021 22:58:19 +0100
Message-ID: 
 <CANPvuRkg+F4TjPvLbvTAGq+Vr_94rUTwVaixmAr==1sqNq41Xw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: Switch to ZStandard compressor support
To: Henry Kleynhans <henry.kleynhans@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 poky@lists.yoctoproject.org,
	hkleynhans@fb.com, rmikey@fb.com
Content-Type: multipart/alternative; boundary="000000000000538a2b05ce1ad42f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 21:58:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156849

--000000000000538a2b05ce1ad42f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

Henry Kleynhans <henry.kleynhans@gmail.com> escreveu no dia segunda,
11/10/2021 =C3=A0(s) 18:12:

> From: Henry Kleynhans <hkleynhans@fb.com>
>
> This patch switches the compressor from Gzip to ZStandard for ssate cache
> files.
>
> Zstandard compression provides a significant improvement in
> decompression speed as well as improvement in compression speed and disk
> usage over the 'tgz' format in use.  Furthermore, its configurable
> compression level offers a trade-off between time spent compressing
> sstate cache files and disk space used by those files.  The reduced disk
> usage also contributes to saving network traffic for those sharing their
> sstate cache with others.
>
> Zstandard should therefore be a good choice when:
> * disk space is at a premium
> * network speed / resources are limited
> * the CI server can sstate packages can be created at high compression
> * less CPU on the build server should be used for sstate decompression
>
> Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
> ---
>  meta/classes/sstate.bbclass                 | 29 +++++++++------
>  meta/lib/oeqa/selftest/cases/signing.py     |  8 ++---
>  meta/lib/oeqa/selftest/cases/sstatetests.py | 24 ++++++-------
>  scripts/sstate-cache-management.sh          | 40 ++++++++++-----------
>  4 files changed, 55 insertions(+), 46 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 7f4b1f6804..3a5195267a 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -1,17 +1,19 @@
>  SSTATE_VERSION =3D "5"
>
> +SSTATE_ZSTD_CLEVEL =3D "8"
>

Giving the user the ability to adjust the compression level can be useful.

Using a weak default value (?? =3D "8") gives the possibility to use a
default value (?=3D) in local.conf
that can be overwritten at recipe level.

Sets only a default value on the class can be more appropriate and fits
most use cases.

SSTATE_ZSTD_CLEVEL ?=3D "8"


> +
>  SSTATE_MANIFESTS ?=3D "${TMPDIR}/sstate-control"
>  SSTATE_MANFILEPREFIX =3D
> "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
>
>  def generate_sstatefn(spec, hash, taskname, siginfo, d):
>      if taskname is None:
>         return ""
> -    extension =3D ".tgz"
> +    extension =3D ".tar.zst"
>      # 8 chars reserved for siginfo
>      limit =3D 254 - 8
>      if siginfo:
>          limit =3D 254
> -        extension =3D ".tgz.siginfo"
> +        extension =3D ".tar.zst.siginfo"
>      if not hash:
>          hash =3D "INVALID"
>      fn =3D spec + hash + "_" + taskname + extension
> @@ -37,7 +39,7 @@ SSTATE_PKGNAME    =3D
> "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PK
>  SSTATE_PKG        =3D "${SSTATE_DIR}/${SSTATE_PKGNAME}"
>  SSTATE_EXTRAPATH   =3D ""
>  SSTATE_EXTRAPATHWILDCARD =3D ""
> -SSTATE_PATHSPEC   =3D
> "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE=
_PATH_CURRTASK}.tgz*"
> +SSTATE_PATHSPEC   =3D
> "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE=
_PATH_CURRTASK}.tar.zst*"
>
>  # explicitly make PV to depend on evaluated value of PV variable
>  PV[vardepvalue] =3D "${PV}"
> @@ -832,23 +834,24 @@ sstate_create_package () {
>         mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`
>         TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
>
> -       # Use pigz if available
> -       OPT=3D"-czS"
> -       if [ -x "$(command -v pigz)" ]; then
> -               OPT=3D"-I pigz -cS"
> +       OPT=3D"-cS"
> +       ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
> +       # Use pzstd if available
> +       if [ -x "$(command -v pzstd)" ]; then
> +               ZSTD=3D"pzstd -${SSTATE_ZSTD_CLEVEL} -p ${ZSTD_THREADS}"
>         fi
>
>         # Need to handle empty directories
>         if [ "$(ls -A)" ]; then
>                 set +e
> -               tar $OPT -f $TFILE *
> +               tar -I "$ZSTD" $OPT -f $TFILE *
>                 ret=3D$?
>                 if [ $ret -ne 0 ] && [ $ret -ne 1 ]; then
>                         exit 1
>                 fi
>                 set -e
>         else
> -               tar $OPT --file=3D$TFILE --files-from=3D/dev/null
> +               tar -I "$ZSTD" $OPT --file=3D$TFILE --files-from=3D/dev/n=
ull
>         fi
>         chmod 0664 $TFILE
>         # Skip if it was already created by some other process
> @@ -887,7 +890,13 @@ python sstate_report_unihash() {
>  # Will be run from within SSTATE_INSTDIR.
>  #
>  sstate_unpack_package () {
> -       tar -xvzf ${SSTATE_PKG}
> +       ZSTD=3D"zstd -T${ZSTD_THREADS}"
> +       # Use pzstd if available
> +       if [ -x "$(command -v pzstd)" ]; then
> +               ZSTD=3D"pzstd -p ${ZSTD_THREADS}"
> +       fi
> +
> +       tar -I "$ZSTD" -xvf ${SSTATE_PKG}
>         # update .siginfo atime on local/NFS mirror
>         [ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [
> -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
>         # Use "! -w ||" to return true for read only files
> diff --git a/meta/lib/oeqa/selftest/cases/signing.py
> b/meta/lib/oeqa/selftest/cases/signing.py
> index af7a0b8b45..6f3d4aeae9 100644
> --- a/meta/lib/oeqa/selftest/cases/signing.py
> +++ b/meta/lib/oeqa/selftest/cases/signing.py
> @@ -159,13 +159,13 @@ class Signing(OESelftestTestCase):
>              bitbake('-c clean %s' % test_recipe)
>              bitbake('-c populate_lic %s' % test_recipe)
>
> -            recipe_sig =3D glob.glob(sstatedir +
> '/*/*/*:ed:*_populate_lic.tgz.sig')
> -            recipe_tgz =3D glob.glob(sstatedir +
> '/*/*/*:ed:*_populate_lic.tgz')
> +            recipe_sig =3D glob.glob(sstatedir +
> '/*/*/*:ed:*_populate_lic.tar.zst.sig')
> +            recipe_archive =3D glob.glob(sstatedir +
> '/*/*/*:ed:*_populate_lic.tar.zst')
>
>              self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig
> file.')
> -            self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz
> file.')
> +            self.assertEqual(len(recipe_archive), 1, 'Failed to find
> .tar.zst file.')
>
> -            ret =3D runCmd('gpg --homedir %s --verify %s %s' %
> (self.gpg_dir, recipe_sig[0], recipe_tgz[0]))
> +            ret =3D runCmd('gpg --homedir %s --verify %s %s' %
> (self.gpg_dir, recipe_sig[0], recipe_archive[0]))
>              # gpg: Signature made Thu 22 Oct 2015 01:45:09 PM EEST using
> RSA key ID 61EEFB30
>              # gpg: Good signature from "testuser (nocomment) <
> testuser@email.com>"
>              self.assertIn('gpg: Good signature from', ret.output,
> 'Package signed incorrectly.')
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py
> b/meta/lib/oeqa/selftest/cases/sstatetests.py
> index 874f439282..3dab607eeb 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -68,7 +68,7 @@ class SStateTests(SStateBase):
>          results =3D self.search_sstate('|'.join(map(str, targets)),
> distro_specific, distro_nonspecific)
>          if distro_nonspecific:
>              for r in results:
> -                if r.endswith(("_populate_lic.tgz",
> "_populate_lic.tgz.siginfo", "_fetch.tgz.siginfo", "_unpack.tgz.siginfo",
> "_patch.tgz.siginfo")):
> +                if r.endswith(("_populate_lic.tar.zst",
> "_populate_lic.tar.zst.siginfo", "_fetch.tar.zst.siginfo",
> "_unpack.tar.zst.siginfo", "_patch.tar.zst.siginfo")):
>                      continue
>                  file_tracker.append(r)
>          else:
> @@ -98,15 +98,15 @@ class SStateTests(SStateBase):
>          bitbake(['-ccleansstate'] + targets)
>
>          bitbake(targets)
> -        tgz_created =3D self.search_sstate('|'.join(map(str, [s +
> r'.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
> -        self.assertTrue(tgz_created, msg=3D"Could not find sstate .tgz
> files for: %s (%s)" % (', '.join(map(str, targets)), str(tgz_created)))
> +        archives_created =3D self.search_sstate('|'.join(map(str, [s +
> r'.*?\.tar.zst$' for s in targets])), distro_specific, distro_nonspecific=
)
> +        self.assertTrue(archives_created, msg=3D"Could not find sstate
> .tar.zst files for: %s (%s)" % (', '.join(map(str, targets)),
> str(archives_created)))
>
>          siginfo_created =3D self.search_sstate('|'.join(map(str, [s +
> r'.*?\.siginfo$' for s in targets])), distro_specific, distro_nonspecific=
)
>          self.assertTrue(siginfo_created, msg=3D"Could not find sstate
> .siginfo files for: %s (%s)" % (', '.join(map(str, targets)),
> str(siginfo_created)))
>
>          bitbake(['-ccleansstate'] + targets)
> -        tgz_removed =3D self.search_sstate('|'.join(map(str, [s +
> r'.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
> -        self.assertTrue(not tgz_removed, msg=3D"do_cleansstate didn't
> remove .tgz sstate files for: %s (%s)" % (', '.join(map(str, targets)),
> str(tgz_removed)))
> +        archives_removed =3D self.search_sstate('|'.join(map(str, [s +
> r'.*?\.tar.zst$' for s in targets])), distro_specific, distro_nonspecific=
)
> +        self.assertTrue(not archives_removed, msg=3D"do_cleansstate didn=
't
> remove .tar.zst sstate files for: %s (%s)" % (', '.join(map(str, targets)=
),
> str(archives_removed)))
>
>      def test_cleansstate_task_distro_specific_nonspecific(self):
>          targets =3D ['binutils-cross-'+ self.tune_arch, 'binutils-native=
']
> @@ -129,14 +129,14 @@ class SStateTests(SStateBase):
>          bitbake(['-ccleansstate'] + targets)
>
>          bitbake(targets)
> -        results =3D self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz=
$'
> for s in targets])), distro_specific=3DFalse, distro_nonspecific=3DTrue)
> +        results =3D self.search_sstate('|'.join(map(str, [s +
> r'.*?\.tar.zst$' for s in targets])), distro_specific=3DFalse,
> distro_nonspecific=3DTrue)
>          filtered_results =3D []
>          for r in results:
> -            if r.endswith(("_populate_lic.tgz",
> "_populate_lic.tgz.siginfo")):
> +            if r.endswith(("_populate_lic.tar.zst",
> "_populate_lic.tar.zst.siginfo")):
>                  continue
>              filtered_results.append(r)
>          self.assertTrue(filtered_results =3D=3D [], msg=3D"Found distro
> non-specific sstate for: %s (%s)" % (', '.join(map(str, targets)),
> str(filtered_results)))
> -        file_tracker_1 =3D self.search_sstate('|'.join(map(str, [s +
> r'.*?\.tgz$' for s in targets])), distro_specific=3DTrue,
> distro_nonspecific=3DFalse)
> +        file_tracker_1 =3D self.search_sstate('|'.join(map(str, [s +
> r'.*?\.tar.zst$' for s in targets])), distro_specific=3DTrue,
> distro_nonspecific=3DFalse)
>          self.assertTrue(len(file_tracker_1) >=3D len(targets), msg =3D "=
Not
> all sstate files were created for: %s" % ', '.join(map(str, targets)))
>
>          self.track_for_cleanup(self.distro_specific_sstate + "_old")
> @@ -145,7 +145,7 @@ class SStateTests(SStateBase):
>
>          bitbake(['-cclean'] + targets)
>          bitbake(targets)
> -        file_tracker_2 =3D self.search_sstate('|'.join(map(str, [s +
> r'.*?\.tgz$' for s in targets])), distro_specific=3DTrue,
> distro_nonspecific=3DFalse)
> +        file_tracker_2 =3D self.search_sstate('|'.join(map(str, [s +
> r'.*?\.tar.zst$' for s in targets])), distro_specific=3DTrue,
> distro_nonspecific=3DFalse)
>          self.assertTrue(len(file_tracker_2) >=3D len(targets), msg =3D "=
Not
> all sstate files were created for: %s" % ', '.join(map(str, targets)))
>
>          not_recreated =3D [x for x in file_tracker_1 if x not in
> file_tracker_2]
> @@ -188,18 +188,18 @@ class SStateTests(SStateBase):
>              if not sstate_arch in sstate_archs_list:
>                  sstate_archs_list.append(sstate_arch)
>              if target_config[idx] =3D=3D target_config[-1]:
> -                target_sstate_before_build =3D self.search_sstate(target=
 +
> r'.*?\.tgz$')
> +                target_sstate_before_build =3D self.search_sstate(target=
 +
> r'.*?\.tar.zst$')
>              bitbake("-cclean %s" % target)
>              result =3D bitbake(target, ignore_status=3DTrue)
>              if target_config[idx] =3D=3D target_config[-1]:
> -                target_sstate_after_build =3D self.search_sstate(target =
+
> r'.*?\.tgz$')
> +                target_sstate_after_build =3D self.search_sstate(target =
+
> r'.*?\.tar.zst$')
>                  expected_remaining_sstate +=3D [x for x in
> target_sstate_after_build if x not in target_sstate_before_build if not
> any(pattern in x for pattern in ignore_patterns)]
>              self.remove_config(global_config[idx])
>              self.remove_recipeinc(target, target_config[idx])
>              self.assertEqual(result.status, 0, msg =3D "build of %s fail=
ed
> with %s" % (target, result.output))
>
>          runCmd("sstate-cache-management.sh -y --cache-dir=3D%s
> --remove-duplicated --extra-archs=3D%s" % (self.sstate_path,
> ','.join(map(str, sstate_archs_list))))
> -        actual_remaining_sstate =3D [x for x in self.search_sstate(targe=
t +
> r'.*?\.tgz$') if not any(pattern in x for pattern in ignore_patterns)]
> +        actual_remaining_sstate =3D [x for x in self.search_sstate(targe=
t +
> r'.*?\.tar.zst$') if not any(pattern in x for pattern in ignore_patterns)=
]
>
>          actual_not_expected =3D [x for x in actual_remaining_sstate if x
> not in expected_remaining_sstate]
>          self.assertFalse(actual_not_expected, msg=3D"Files should have b=
een
> removed but were not: %s" % ', '.join(map(str, actual_not_expected)))
> diff --git a/scripts/sstate-cache-management.sh
> b/scripts/sstate-cache-management.sh
> index f1706a2229..d39671f7c6 100755
> --- a/scripts/sstate-cache-management.sh
> +++ b/scripts/sstate-cache-management.sh
> @@ -114,7 +114,7 @@ echo_error () {
>  # * Add .done/.siginfo to the remove list
>  # * Add destination of symlink to the remove list
>  #
> -# $1: output file, others: sstate cache file (.tgz)
> +# $1: output file, others: sstate cache file (.tar.zst)
>  gen_rmlist (){
>    local rmlist_file=3D"$1"
>    shift
> @@ -131,13 +131,13 @@ gen_rmlist (){
>                dest=3D"`readlink -e $i`"
>                if [ -n "$dest" ]; then
>                    echo $dest >> $rmlist_file
> -                  # Remove the .siginfo when .tgz is removed
> +                  # Remove the .siginfo when .tar.zst is removed
>                    if [ -f "$dest.siginfo" ]; then
>                        echo $dest.siginfo >> $rmlist_file
>                    fi
>                fi
>            fi
> -          # Add the ".tgz.done" and ".siginfo.done" (may exist in the
> future)
> +          # Add the ".tar.zst.done" and ".siginfo.done" (may exist in th=
e
> future)
>            base_fn=3D"${i##/*/}"
>            t_fn=3D"$base_fn.done"
>            s_fn=3D"$base_fn.siginfo.done"
> @@ -188,10 +188,10 @@ remove_duplicated () {
>    total_files=3D`find $cache_dir -name 'sstate*' | wc -l`
>    # Save all the sstate files in a file
>    sstate_files_list=3D`mktemp` || exit 1
> -  find $cache_dir -name 'sstate:*:*:*:*:*:*:*.tgz*' >$sstate_files_list
> +  find $cache_dir -iname 'sstate:*:*:*:*:*:*:*.tar.zst*'
> >$sstate_files_list
>
>    echo "Figuring out the suffixes in the sstate cache dir ... "
> -  sstate_suffixes=3D"`sed
> 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\=
1%g'
> $sstate_files_list | sort -u`"
> +  sstate_suffixes=3D"`sed
> 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zs=
t.*%\1%g'
> $sstate_files_list | sort -u`"
>    echo "Done"
>    echo "The following suffixes have been found in the cache dir:"
>    echo $sstate_suffixes
> @@ -200,10 +200,10 @@ remove_duplicated () {
>    # Using this SSTATE_PKGSPEC definition it's 6th colon separated field
>    # SSTATE_PKGSPEC    =3D
> "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${=
SSTATE_PKGARCH}:${SSTATE_VERSION}:"
>    for arch in $all_archs; do
> -      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$=
"
> $sstate_files_list
> +      grep -q
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tar\.zst$"
> $sstate_files_list
>        [ $? -eq 0 ] && ava_archs=3D"$ava_archs $arch"
>        # ${builder_arch}_$arch used by toolchain sstate
> -      grep -q
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${builder_arch}_$arch:[^:]*:[^:]*\.tgz=
$"
> $sstate_files_list
> +      grep -q
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${builder_arch}_$arch:[^:]*:[^:]*\.tar=
\.zst$"
> $sstate_files_list
>        [ $? -eq 0 ] && ava_archs=3D"$ava_archs ${builder_arch}_$arch"
>    done
>    echo "Done"
> @@ -219,13 +219,13 @@ remove_duplicated () {
>            continue
>        fi
>        # Total number of files including .siginfo and .done files
> -      total_files_suffix=3D`grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*"
> $sstate_files_list | wc -l 2>/dev/null`
> -      total_tgz_suffix=3D`grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz$"
> $sstate_files_list | wc -l 2>/dev/null`
> +      total_files_suffix=3D`grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst.*=
"
> $sstate_files_list | wc -l 2>/dev/null`
> +      total_archive_suffix=3D`grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst$"
> $sstate_files_list | wc -l 2>/dev/null`
>        # Save the file list to a file, some suffix's file may not exist
> -      grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*"
> $sstate_files_list >$list_suffix 2>/dev/null
> -      local deleted_tgz=3D0
> +      grep
> ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst.*=
"
> $sstate_files_list >$list_suffix 2>/dev/null
> +      local deleted_archives=3D0
>        local deleted_files=3D0
> -      for ext in tgz tgz.siginfo tgz.done; do
> +      for ext in tar.zst tar.zst.siginfo tar.zst.done; do
>            echo "Figuring out the sstate:xxx_$suffix.$ext ... "
>            # Uniq BPNs
>            file_names=3D`for arch in $ava_archs ""; do
> @@ -268,19 +268,19 @@ remove_duplicated () {
>                done
>            done
>        done
> -      deleted_tgz=3D`cat $rm_list.* 2>/dev/null | grep ".tgz$" | wc -l`
> +      deleted_archives=3D`cat $rm_list.* 2>/dev/null | grep "\.tar\.zst$=
" |
> wc -l`
>        deleted_files=3D`cat $rm_list.* 2>/dev/null | wc -l`
>        [ "$deleted_files" -gt 0 -a $debug -gt 0 ] && cat $rm_list.*
> -      echo "($deleted_tgz out of $total_tgz_suffix .tgz files for $suffi=
x
> suffix will be removed or $deleted_files out of $total_files_suffix when
> counting also .siginfo and .done files)"
> +      echo "($deleted_archives out of $total_archives_suffix .tar.zst
> files for $suffix suffix will be removed or $deleted_files out of
> $total_files_suffix when counting also .siginfo and .done files)"
>        let total_deleted=3D$total_deleted+$deleted_files
>    done
> -  deleted_tgz=3D0
> +  deleted_archives=3D0
>    rm_old_list=3D$remove_listdir/sstate-old-filenames
> -  find $cache_dir -name 'sstate-*.tgz' >$rm_old_list
> -  [ -s "$rm_old_list" ] && deleted_tgz=3D`cat $rm_old_list | grep ".tgz$=
" |
> wc -l`
> +  find $cache_dir -name 'sstate-*.tar.zst' >$rm_old_list
> +  [ -s "$rm_old_list" ] && deleted_archives=3D`cat $rm_old_list | grep
> "\.tar\.zst$" | wc -l`
>    [ -s "$rm_old_list" ] && deleted_files=3D`cat $rm_old_list | wc -l`
>    [ -s "$rm_old_list" -a $debug -gt 0 ] && cat $rm_old_list
> -  echo "($deleted_tgz .tgz files with old sstate-* filenames will be
> removed or $deleted_files when counting also .siginfo and .done files)"
> +  echo "($deleted_archives or .tar.zst files with old sstate-* filenames
> will be removed or $deleted_files when counting also .siginfo and .done
> files)"
>    let total_deleted=3D$total_deleted+$deleted_files
>
>    rm -f $list_suffix
> @@ -289,7 +289,7 @@ remove_duplicated () {
>        read_confirm
>        if [ "$confirm" =3D "y" -o "$confirm" =3D "Y" ]; then
>            for list in `ls $remove_listdir/`; do
> -              echo "Removing $list.tgz (`cat $remove_listdir/$list | wc
> -w` files) ... "
> +              echo "Removing $list.tar.zst archive (`cat
> $remove_listdir/$list | wc -w` files) ... "
>                # Remove them one by one to avoid the argument list too
> long error
>                for i in `cat $remove_listdir/$list`; do
>                    rm -f $verbose $i
> @@ -322,7 +322,7 @@ rm_by_stamps (){
>    find $cache_dir -type f -name 'sstate*' | sort -u -o $cache_list
>
>    echo "Figuring out the suffixes in the sstate cache dir ... "
> -  local sstate_suffixes=3D"`sed
> 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\=
1%g'
> $cache_list | sort -u`"
> +  local sstate_suffixes=3D"`sed
> 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zs=
t.*%\1%g'
> $cache_list | sort -u`"
>    echo "Done"
>    echo "The following suffixes have been found in the cache dir:"
>    echo $sstate_suffixes
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156845):
> https://lists.openembedded.org/g/openembedded-core/message/156845
> Mute This Topic: https://lists.openembedded.org/mt/86242479/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000538a2b05ce1ad42f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"color:rgb(0,0,0)">Hi Henry=
,</span><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Henry Kleynhans &lt;<a href=3D"mailto:henry.kleynhans@gmail.com=
">henry.kleynhans@gmail.com</a>&gt; escreveu no dia segunda, 11/10/2021 =C3=
=A0(s) 18:12:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Henry Kleynhans &lt;<a href=3D"mailto:hkleynhans@fb.com" target=3D"_bla=
nk">hkleynhans@fb.com</a>&gt;<br>
<br>
This patch switches the compressor from Gzip to ZStandard for ssate cache<b=
r>
files.<br>
<br>
Zstandard compression provides a significant improvement in<br>
decompression speed as well as improvement in compression speed and disk<br=
>
usage over the &#39;tgz&#39; format in use.=C2=A0 Furthermore, its configur=
able<br>
compression level offers a trade-off between time spent compressing<br>
sstate cache files and disk space used by those files.=C2=A0 The reduced di=
sk<br>
usage also contributes to saving network traffic for those sharing their<br=
>
sstate cache with others.<br>
<br>
Zstandard should therefore be a good choice when:<br>
* disk space is at a premium<br>
* network speed / resources are limited<br>
* the CI server can sstate packages can be created at high compression<br>
* less CPU on the build server should be used for sstate decompression<br>
<br>
Signed-off-by: Henry Kleynhans &lt;<a href=3D"mailto:hkleynhans@fb.com" tar=
get=3D"_blank">hkleynhans@fb.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sstate.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 29 +++++++++------<br>
=C2=A0meta/lib/oeqa/selftest/cases/signing.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 =
++---<br>
=C2=A0meta/lib/oeqa/selftest/cases/sstatetests.py | 24 ++++++-------<br>
=C2=A0scripts/sstate-cache-management.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 40 ++++++++++-----------<br>
=C2=A04 files changed, 55 insertions(+), 46 deletions(-)<br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 7f4b1f6804..3a5195267a 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -1,17 +1,19 @@<br>
=C2=A0SSTATE_VERSION =3D &quot;5&quot;<br>
<br>
+SSTATE_ZSTD_CLEVEL =3D &quot;8&quot;<br></blockquote><div><br></div><div>G=
iving the user the ability to adjust the compression level=C2=A0can be usef=
ul.<br></div><div><br></div><div>Using a weak default value (?? =3D &quot;8=
&quot;) gives the possibility to use a default value (?=3D) in local.conf<b=
r></div><div>that can be overwritten at recipe=C2=A0level.</div><div><br></=
div><div>Sets only a default value on the class can be more appropriate and=
 fits most use cases.</div><div><br></div><div>SSTATE_ZSTD_CLEVEL ?=3D &quo=
t;8&quot;<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
=C2=A0SSTATE_MANIFESTS ?=3D &quot;${TMPDIR}/sstate-control&quot;<br>
=C2=A0SSTATE_MANFILEPREFIX =3D &quot;${SSTATE_MANIFESTS}/manifest-${SSTATE_=
MANMACH}-${PN}&quot;<br>
<br>
=C2=A0def generate_sstatefn(spec, hash, taskname, siginfo, d):<br>
=C2=A0 =C2=A0 =C2=A0if taskname is None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;<br>
-=C2=A0 =C2=A0 extension =3D &quot;.tgz&quot;<br>
+=C2=A0 =C2=A0 extension =3D &quot;.tar.zst&quot;<br>
=C2=A0 =C2=A0 =C2=A0# 8 chars reserved for siginfo<br>
=C2=A0 =C2=A0 =C2=A0limit =3D 254 - 8<br>
=C2=A0 =C2=A0 =C2=A0if siginfo:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0limit =3D 254<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extension =3D &quot;.tgz.siginfo&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extension =3D &quot;.tar.zst.siginfo&quot;<br>
=C2=A0 =C2=A0 =C2=A0if not hash:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hash =3D &quot;INVALID&quot;<br>
=C2=A0 =C2=A0 =C2=A0fn =3D spec + hash + &quot;_&quot; + taskname + extensi=
on<br>
@@ -37,7 +39,7 @@ SSTATE_PKGNAME=C2=A0 =C2=A0 =3D &quot;${SSTATE_EXTRAPATH}=
${@generate_sstatefn(d.getVar(&#39;SSTATE_PK<br>
=C2=A0SSTATE_PKG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${SSTATE_DIR}/${SSTAT=
E_PKGNAME}&quot;<br>
=C2=A0SSTATE_EXTRAPATH=C2=A0 =C2=A0=3D &quot;&quot;<br>
=C2=A0SSTATE_EXTRAPATHWILDCARD =3D &quot;&quot;<br>
-SSTATE_PATHSPEC=C2=A0 =C2=A0=3D &quot;${SSTATE_DIR}/${SSTATE_EXTRAPATHWILD=
CARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tgz*&quot;<br>
+SSTATE_PATHSPEC=C2=A0 =C2=A0=3D &quot;${SSTATE_DIR}/${SSTATE_EXTRAPATHWILD=
CARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*&quot;<br>
<br>
=C2=A0# explicitly make PV to depend on evaluated value of PV variable<br>
=C2=A0PV[vardepvalue] =3D &quot;${PV}&quot;<br>
@@ -832,23 +834,24 @@ sstate_create_package () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Use pigz if available<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0OPT=3D&quot;-czS&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x &quot;$(command -v pigz)&quot; ]; then<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPT=3D&quot;-I pigz=
 -cS&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0OPT=3D&quot;-cS&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ZSTD=3D&quot;zstd -${SSTATE_ZSTD_CLEVEL} -T${ZS=
TD_THREADS}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Use pzstd if available<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x &quot;$(command -v pzstd)&quot; ]; then=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ZSTD=3D&quot;pzstd =
-${SSTATE_ZSTD_CLEVEL} -p ${ZSTD_THREADS}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Need to handle empty directories<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$(ls -A)&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set +e<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar $OPT -f $TFILE =
*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -I &quot;$ZSTD&=
quot; $OPT -f $TFILE *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=3D$?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $ret -ne 0 ] &=
amp;&amp; [ $ret -ne 1 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exit 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set -e<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar $OPT --file=3D$=
TFILE --files-from=3D/dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -I &quot;$ZSTD&=
quot; $OPT --file=3D$TFILE --files-from=3D/dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 0664 $TFILE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Skip if it was already created by some other =
process<br>
@@ -887,7 +890,13 @@ python sstate_report_unihash() {<br>
=C2=A0# Will be run from within SSTATE_INSTDIR.<br>
=C2=A0#<br>
=C2=A0sstate_unpack_package () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tar -xvzf ${SSTATE_PKG}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ZSTD=3D&quot;zstd -T${ZSTD_THREADS}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Use pzstd if available<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x &quot;$(command -v pzstd)&quot; ]; then=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ZSTD=3D&quot;pzstd =
-p ${ZSTD_THREADS}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tar -I &quot;$ZSTD&quot; -xvf ${SSTATE_PKG}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # update .siginfo atime on local/NFS mirror<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -O ${SSTATE_PKG}.siginfo ] &amp;&amp; [ -w ${=
SSTATE_PKG}.siginfo ] &amp;&amp; [ -h ${SSTATE_PKG}.siginfo ] &amp;&amp; to=
uch -a ${SSTATE_PKG}.siginfo<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use &quot;! -w ||&quot; to return true for re=
ad only files<br>
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selfte=
st/cases/signing.py<br>
index af7a0b8b45..6f3d4aeae9 100644<br>
--- a/meta/lib/oeqa/selftest/cases/signing.py<br>
+++ b/meta/lib/oeqa/selftest/cases/signing.py<br>
@@ -159,13 +159,13 @@ class Signing(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&#39;-c clean %s&#3=
9; % test_recipe)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&#39;-c populate_li=
c %s&#39; % test_recipe)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe_sig =3D glob.glob(sstated=
ir + &#39;/*/*/*:ed:*_populate_lic.tgz.sig&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe_tgz =3D glob.glob(sstated=
ir + &#39;/*/*/*:ed:*_populate_lic.tgz&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe_sig =3D glob.glob(sstated=
ir + &#39;/*/*/*:ed:*_populate_lic.tar.zst.sig&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe_archive =3D glob.glob(sst=
atedir + &#39;/*/*/*:ed:*_populate_lic.tar.zst&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(len(recipe=
_sig), 1, &#39;Failed to find .sig file.&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(recipe_tgz)=
, 1, &#39;Failed to find .tgz file.&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(recipe_arch=
ive), 1, &#39;Failed to find .tar.zst file.&#39;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D runCmd(&#39;gpg --homedi=
r %s --verify %s %s&#39; % (self.gpg_dir, recipe_sig[0], recipe_tgz[0]))<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D runCmd(&#39;gpg --homedi=
r %s --verify %s %s&#39; % (self.gpg_dir, recipe_sig[0], recipe_archive[0])=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# gpg: Signature made Thu 2=
2 Oct 2015 01:45:09 PM EEST using RSA key ID 61EEFB30<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# gpg: Good signature from =
&quot;testuser (nocomment) &lt;<a href=3D"mailto:testuser@email.com" target=
=3D"_blank">testuser@email.com</a>&gt;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn(&#39;gpg: Goo=
d signature from&#39;, ret.output, &#39;Package signed incorrectly.&#39;)<b=
r>
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/se=
lftest/cases/sstatetests.py<br>
index 874f439282..3dab607eeb 100644<br>
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py<br>
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py<br>
@@ -68,7 +68,7 @@ class SStateTests(SStateBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0results =3D self.search_sstate(&#39;|&#39=
;.join(map(str, targets)), distro_specific, distro_nonspecific)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if distro_nonspecific:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for r in results:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if r.endswith((&qu=
ot;_populate_lic.tgz&quot;, &quot;_populate_lic.tgz.siginfo&quot;, &quot;_f=
etch.tgz.siginfo&quot;, &quot;_unpack.tgz.siginfo&quot;, &quot;_patch.tgz.s=
iginfo&quot;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if r.endswith((&qu=
ot;_populate_lic.tar.zst&quot;, &quot;_populate_lic.tar.zst.siginfo&quot;, =
&quot;_fetch.tar.zst.siginfo&quot;, &quot;_unpack.tar.zst.siginfo&quot;, &q=
uot;_patch.tar.zst.siginfo&quot;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file_tracker.=
append(r)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
@@ -98,15 +98,15 @@ class SStateTests(SStateBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake([&#39;-ccleansstate&#39;] + targe=
ts)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(targets)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tgz_created =3D self.search_sstate(&#39;|&#39;=
.join(map(str, [s + r&#39;.*?\.tgz$&#39; for s in targets])), distro_specif=
ic, distro_nonspecific)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(tgz_created, msg=3D&quot;Could=
 not find sstate .tgz files for: %s (%s)&quot; % (&#39;, &#39;.join(map(str=
, targets)), str(tgz_created)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 archives_created =3D self.search_sstate(&#39;|=
&#39;.join(map(str, [s + r&#39;.*?\.tar.zst$&#39; for s in targets])), dist=
ro_specific, distro_nonspecific)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(archives_created, msg=3D&quot;=
Could not find sstate .tar.zst files for: %s (%s)&quot; % (&#39;, &#39;.joi=
n(map(str, targets)), str(archives_created)))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0siginfo_created =3D self.search_sstate(&#=
39;|&#39;.join(map(str, [s + r&#39;.*?\.siginfo$&#39; for s in targets])), =
distro_specific, distro_nonspecific)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(siginfo_created, msg=3D&q=
uot;Could not find sstate .siginfo files for: %s (%s)&quot; % (&#39;, &#39;=
.join(map(str, targets)), str(siginfo_created)))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake([&#39;-ccleansstate&#39;] + targe=
ts)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tgz_removed =3D self.search_sstate(&#39;|&#39;=
.join(map(str, [s + r&#39;.*?\.tgz$&#39; for s in targets])), distro_specif=
ic, distro_nonspecific)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(not tgz_removed, msg=3D&quot;d=
o_cleansstate didn&#39;t remove .tgz sstate files for: %s (%s)&quot; % (&#3=
9;, &#39;.join(map(str, targets)), str(tgz_removed)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 archives_removed =3D self.search_sstate(&#39;|=
&#39;.join(map(str, [s + r&#39;.*?\.tar.zst$&#39; for s in targets])), dist=
ro_specific, distro_nonspecific)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(not archives_removed, msg=3D&q=
uot;do_cleansstate didn&#39;t remove .tar.zst sstate files for: %s (%s)&quo=
t; % (&#39;, &#39;.join(map(str, targets)), str(archives_removed)))<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_cleansstate_task_distro_specific_nonspecific(s=
elf):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targets =3D [&#39;binutils-cross-&#39;+ s=
elf.tune_arch, &#39;binutils-native&#39;]<br>
@@ -129,14 +129,14 @@ class SStateTests(SStateBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake([&#39;-ccleansstate&#39;] + targe=
ts)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(targets)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 results =3D self.search_sstate(&#39;|&#39;.joi=
n(map(str, [s + r&#39;.*?\.tgz$&#39; for s in targets])), distro_specific=
=3DFalse, distro_nonspecific=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 results =3D self.search_sstate(&#39;|&#39;.joi=
n(map(str, [s + r&#39;.*?\.tar.zst$&#39; for s in targets])), distro_specif=
ic=3DFalse, distro_nonspecific=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filtered_results =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for r in results:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if r.endswith((&quot;_populate_l=
ic.tgz&quot;, &quot;_populate_lic.tgz.siginfo&quot;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if r.endswith((&quot;_populate_l=
ic.tar.zst&quot;, &quot;_populate_lic.tar.zst.siginfo&quot;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filtered_results.append(r)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(filtered_results =3D=3D [=
], msg=3D&quot;Found distro non-specific sstate for: %s (%s)&quot; % (&#39;=
, &#39;.join(map(str, targets)), str(filtered_results)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file_tracker_1 =3D self.search_sstate(&#39;|&#=
39;.join(map(str, [s + r&#39;.*?\.tgz$&#39; for s in targets])), distro_spe=
cific=3DTrue, distro_nonspecific=3DFalse)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file_tracker_1 =3D self.search_sstate(&#39;|&#=
39;.join(map(str, [s + r&#39;.*?\.tar.zst$&#39; for s in targets])), distro=
_specific=3DTrue, distro_nonspecific=3DFalse)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(len(file_tracker_1) &gt;=
=3D len(targets), msg =3D &quot;Not all sstate files were created for: %s&q=
uot; % &#39;, &#39;.join(map(str, targets)))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.track_for_cleanup(self.distro_specif=
ic_sstate + &quot;_old&quot;)<br>
@@ -145,7 +145,7 @@ class SStateTests(SStateBase):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake([&#39;-cclean&#39;] + targets)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(targets)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file_tracker_2 =3D self.search_sstate(&#39;|&#=
39;.join(map(str, [s + r&#39;.*?\.tgz$&#39; for s in targets])), distro_spe=
cific=3DTrue, distro_nonspecific=3DFalse)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file_tracker_2 =3D self.search_sstate(&#39;|&#=
39;.join(map(str, [s + r&#39;.*?\.tar.zst$&#39; for s in targets])), distro=
_specific=3DTrue, distro_nonspecific=3DFalse)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(len(file_tracker_2) &gt;=
=3D len(targets), msg =3D &quot;Not all sstate files were created for: %s&q=
uot; % &#39;, &#39;.join(map(str, targets)))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0not_recreated =3D [x for x in file_tracke=
r_1 if x not in file_tracker_2]<br>
@@ -188,18 +188,18 @@ class SStateTests(SStateBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not sstate_arch in sstat=
e_archs_list:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sstate_archs_=
list.append(sstate_arch)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if target_config[idx] =3D=
=3D target_config[-1]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_sstate_befo=
re_build =3D self.search_sstate(target + r&#39;.*?\.tgz$&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_sstate_befo=
re_build =3D self.search_sstate(target + r&#39;.*?\.tar.zst$&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&quot;-cclean %s&qu=
ot; % target)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D bitbake(target, =
ignore_status=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if target_config[idx] =3D=
=3D target_config[-1]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_sstate_afte=
r_build =3D self.search_sstate(target + r&#39;.*?\.tgz$&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_sstate_afte=
r_build =3D self.search_sstate(target + r&#39;.*?\.tar.zst$&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected_rema=
ining_sstate +=3D [x for x in target_sstate_after_build if x not in target_=
sstate_before_build if not any(pattern in x for pattern in ignore_patterns)=
]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.remove_config(global_c=
onfig[idx])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.remove_recipeinc(targe=
t, target_config[idx])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(result.sta=
tus, 0, msg =3D &quot;build of %s failed with %s&quot; % (target, result.ou=
tput))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runCmd(&quot;sstate-cache-management.sh -=
y --cache-dir=3D%s --remove-duplicated --extra-archs=3D%s&quot; % (self.sst=
ate_path, &#39;,&#39;.join(map(str, sstate_archs_list))))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 actual_remaining_sstate =3D [x for x in self.s=
earch_sstate(target + r&#39;.*?\.tgz$&#39;) if not any(pattern in x for pat=
tern in ignore_patterns)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 actual_remaining_sstate =3D [x for x in self.s=
earch_sstate(target + r&#39;.*?\.tar.zst$&#39;) if not any(pattern in x for=
 pattern in ignore_patterns)]<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0actual_not_expected =3D [x for x in actua=
l_remaining_sstate if x not in expected_remaining_sstate]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertFalse(actual_not_expected, msg=
=3D&quot;Files should have been removed but were not: %s&quot; % &#39;, &#3=
9;.join(map(str, actual_not_expected)))<br>
diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-mana=
gement.sh<br>
index f1706a2229..d39671f7c6 100755<br>
--- a/scripts/sstate-cache-management.sh<br>
+++ b/scripts/sstate-cache-management.sh<br>
@@ -114,7 +114,7 @@ echo_error () {<br>
=C2=A0# * Add .done/.siginfo to the remove list<br>
=C2=A0# * Add destination of symlink to the remove list<br>
=C2=A0#<br>
-# $1: output file, others: sstate cache file (.tgz)<br>
+# $1: output file, others: sstate cache file (.tar.zst)<br>
=C2=A0gen_rmlist (){<br>
=C2=A0 =C2=A0local rmlist_file=3D&quot;$1&quot;<br>
=C2=A0 =C2=A0shift<br>
@@ -131,13 +131,13 @@ gen_rmlist (){<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dest=3D&quot;`readli=
nk -e $i`&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$dest&=
quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $=
dest &gt;&gt; $rmlist_file<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove th=
e .siginfo when .tgz is removed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove th=
e .siginfo when .tar.zst is removed<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -=
f &quot;$dest.siginfo&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo $dest.siginfo &gt;&gt; $rmlist_file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add the &quot;.tgz.done&quot; and &qu=
ot;.siginfo.done&quot; (may exist in the future)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add the &quot;.tar.zst.done&quot; and=
 &quot;.siginfo.done&quot; (may exist in the future)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_fn=3D&quot;${i##/*/}&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t_fn=3D&quot;$base_fn.done&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s_fn=3D&quot;$base_fn.siginfo.done=
&quot;<br>
@@ -188,10 +188,10 @@ remove_duplicated () {<br>
=C2=A0 =C2=A0total_files=3D`find $cache_dir -name &#39;sstate*&#39; | wc -l=
`<br>
=C2=A0 =C2=A0# Save all the sstate files in a file<br>
=C2=A0 =C2=A0sstate_files_list=3D`mktemp` || exit 1<br>
-=C2=A0 find $cache_dir -name &#39;sstate:*:*:*:*:*:*:*.tgz*&#39; &gt;$ssta=
te_files_list<br>
+=C2=A0 find $cache_dir -iname &#39;sstate:*:*:*:*:*:*:*.tar.zst*&#39; &gt;=
$sstate_files_list<br>
<br>
=C2=A0 =C2=A0echo &quot;Figuring out the suffixes in the sstate cache dir .=
.. &quot;<br>
-=C2=A0 sstate_suffixes=3D&quot;`sed &#39;s%.*/sstate:[^:]*:[^:]*:[^:]*:[^:=
]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g&#39; $sstate_files_list | sort -=
u`&quot;<br>
+=C2=A0 sstate_suffixes=3D&quot;`sed &#39;s%.*/sstate:[^:]*:[^:]*:[^:]*:[^:=
]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zst.*%\1%g&#39; $sstate_files_list | s=
ort -u`&quot;<br>
=C2=A0 =C2=A0echo &quot;Done&quot;<br>
=C2=A0 =C2=A0echo &quot;The following suffixes have been found in the cache=
 dir:&quot;<br>
=C2=A0 =C2=A0echo $sstate_suffixes<br>
@@ -200,10 +200,10 @@ remove_duplicated () {<br>
=C2=A0 =C2=A0# Using this SSTATE_PKGSPEC definition it&#39;s 6th colon sepa=
rated field<br>
=C2=A0 =C2=A0# SSTATE_PKGSPEC=C2=A0 =C2=A0 =3D &quot;sstate:${PN}:${PACKAGE=
_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_=
VERSION}:&quot;<br>
=C2=A0 =C2=A0for arch in $all_archs; do<br>
-=C2=A0 =C2=A0 =C2=A0 grep -q &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch=
:[^:]*:[^:]*\.tgz$&quot; $sstate_files_list<br>
+=C2=A0 =C2=A0 =C2=A0 grep -q &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch=
:[^:]*:[^:]*\.tar\.zst$&quot; $sstate_files_list<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0[ $? -eq 0 ] &amp;&amp; ava_archs=3D&quot;$ava_a=
rchs $arch&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0# ${builder_arch}_$arch used by toolchain sstate=
<br>
-=C2=A0 =C2=A0 =C2=A0 grep -q &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${bui=
lder_arch}_$arch:[^:]*:[^:]*\.tgz$&quot; $sstate_files_list<br>
+=C2=A0 =C2=A0 =C2=A0 grep -q &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${bui=
lder_arch}_$arch:[^:]*:[^:]*\.tar\.zst$&quot; $sstate_files_list<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0[ $? -eq 0 ] &amp;&amp; ava_archs=3D&quot;$ava_a=
rchs ${builder_arch}_$arch&quot;<br>
=C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0echo &quot;Done&quot;<br>
@@ -219,13 +219,13 @@ remove_duplicated () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0# Total number of files including .siginfo and .=
done files<br>
-=C2=A0 =C2=A0 =C2=A0 total_files_suffix=3D`grep &quot;.*/sstate:[^:]*:[^:]=
*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*&quot; $sstate_files_list | =
wc -l 2&gt;/dev/null`<br>
-=C2=A0 =C2=A0 =C2=A0 total_tgz_suffix=3D`grep &quot;.*/sstate:[^:]*:[^:]*:=
[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz$&quot; $sstate_files_list | wc =
-l 2&gt;/dev/null`<br>
+=C2=A0 =C2=A0 =C2=A0 total_files_suffix=3D`grep &quot;.*/sstate:[^:]*:[^:]=
*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst.*&quot; $sstate_files_li=
st | wc -l 2&gt;/dev/null`<br>
+=C2=A0 =C2=A0 =C2=A0 total_archive_suffix=3D`grep &quot;.*/sstate:[^:]*:[^=
:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tar\.zst$&quot; $sstate_files_l=
ist | wc -l 2&gt;/dev/null`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0# Save the file list to a file, some suffix&#39;=
s file may not exist<br>
-=C2=A0 =C2=A0 =C2=A0 grep &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^=
:]*:[^:_]*_$suffix\.tgz.*&quot; $sstate_files_list &gt;$list_suffix 2&gt;/d=
ev/null<br>
-=C2=A0 =C2=A0 =C2=A0 local deleted_tgz=3D0<br>
+=C2=A0 =C2=A0 =C2=A0 grep &quot;.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^=
:]*:[^:_]*_$suffix\.tar\.zst.*&quot; $sstate_files_list &gt;$list_suffix 2&=
gt;/dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 local deleted_archives=3D0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0local deleted_files=3D0<br>
-=C2=A0 =C2=A0 =C2=A0 for ext in tgz tgz.siginfo tgz.done; do<br>
+=C2=A0 =C2=A0 =C2=A0 for ext in tar.zst tar.zst.siginfo tar.zst.done; do<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Figuring out the sstate=
:xxx_$suffix.$ext ... &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Uniq BPNs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file_names=3D`for arch in $ava_arc=
hs &quot;&quot;; do<br>
@@ -268,19 +268,19 @@ remove_duplicated () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0 =C2=A0 deleted_tgz=3D`cat $rm_list.* 2&gt;/dev/null | grep &=
quot;.tgz$&quot; | wc -l`<br>
+=C2=A0 =C2=A0 =C2=A0 deleted_archives=3D`cat $rm_list.* 2&gt;/dev/null | g=
rep &quot;\.tar\.zst$&quot; | wc -l`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0deleted_files=3D`cat $rm_list.* 2&gt;/dev/null |=
 wc -l`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;$deleted_files&quot; -gt 0 -a $debug -gt=
 0 ] &amp;&amp; cat $rm_list.*<br>
-=C2=A0 =C2=A0 =C2=A0 echo &quot;($deleted_tgz out of $total_tgz_suffix .tg=
z files for $suffix suffix will be removed or $deleted_files out of $total_=
files_suffix when counting also .siginfo and .done files)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 echo &quot;($deleted_archives out of $total_archives_=
suffix .tar.zst files for $suffix suffix will be removed or $deleted_files =
out of $total_files_suffix when counting also .siginfo and .done files)&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0let total_deleted=3D$total_deleted+$deleted_file=
s<br>
=C2=A0 =C2=A0done<br>
-=C2=A0 deleted_tgz=3D0<br>
+=C2=A0 deleted_archives=3D0<br>
=C2=A0 =C2=A0rm_old_list=3D$remove_listdir/sstate-old-filenames<br>
-=C2=A0 find $cache_dir -name &#39;sstate-*.tgz&#39; &gt;$rm_old_list<br>
-=C2=A0 [ -s &quot;$rm_old_list&quot; ] &amp;&amp; deleted_tgz=3D`cat $rm_o=
ld_list | grep &quot;.tgz$&quot; | wc -l`<br>
+=C2=A0 find $cache_dir -name &#39;sstate-*.tar.zst&#39; &gt;$rm_old_list<b=
r>
+=C2=A0 [ -s &quot;$rm_old_list&quot; ] &amp;&amp; deleted_archives=3D`cat =
$rm_old_list | grep &quot;\.tar\.zst$&quot; | wc -l`<br>
=C2=A0 =C2=A0[ -s &quot;$rm_old_list&quot; ] &amp;&amp; deleted_files=3D`ca=
t $rm_old_list | wc -l`<br>
=C2=A0 =C2=A0[ -s &quot;$rm_old_list&quot; -a $debug -gt 0 ] &amp;&amp; cat=
 $rm_old_list<br>
-=C2=A0 echo &quot;($deleted_tgz .tgz files with old sstate-* filenames wil=
l be removed or $deleted_files when counting also .siginfo and .done files)=
&quot;<br>
+=C2=A0 echo &quot;($deleted_archives or .tar.zst files with old sstate-* f=
ilenames will be removed or $deleted_files when counting also .siginfo and =
.done files)&quot;<br>
=C2=A0 =C2=A0let total_deleted=3D$total_deleted+$deleted_files<br>
<br>
=C2=A0 =C2=A0rm -f $list_suffix<br>
@@ -289,7 +289,7 @@ remove_duplicated () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0read_confirm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$confirm&quot; =3D &quot;y&quot; -o &=
quot;$confirm&quot; =3D &quot;Y&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for list in `ls $remove_listdir/`;=
 do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Removing $list=
.tgz (`cat $remove_listdir/$list | wc -w` files) ... &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Removing $list=
.tar.zst archive (`cat $remove_listdir/$list | wc -w` files) ... &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove them one by=
 one to avoid the argument list too long error<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in `cat $remov=
e_listdir/$list`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f =
$verbose $i<br>
@@ -322,7 +322,7 @@ rm_by_stamps (){<br>
=C2=A0 =C2=A0find $cache_dir -type f -name &#39;sstate*&#39; | sort -u -o $=
cache_list<br>
<br>
=C2=A0 =C2=A0echo &quot;Figuring out the suffixes in the sstate cache dir .=
.. &quot;<br>
-=C2=A0 local sstate_suffixes=3D&quot;`sed &#39;s%.*/sstate:[^:]*:[^:]*:[^:=
]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g&#39; $cache_list | sort -u=
`&quot;<br>
+=C2=A0 local sstate_suffixes=3D&quot;`sed &#39;s%.*/sstate:[^:]*:[^:]*:[^:=
]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tar\.zst.*%\1%g&#39; $cache_list | so=
rt -u`&quot;<br>
=C2=A0 =C2=A0echo &quot;Done&quot;<br>
=C2=A0 =C2=A0echo &quot;The following suffixes have been found in the cache=
 dir:&quot;<br>
=C2=A0 =C2=A0echo $sstate_suffixes<br>
-- <br>
2.31.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156845): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156845" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156845</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86242479/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86242479/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000538a2b05ce1ad42f--

