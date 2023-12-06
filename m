Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE19EC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:29:20 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.43916.1701894556409873149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hmenBZmk;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1fb40253680so157823fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 12:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701894556; x=1702499356; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54toJAGfTJEbFL7STIP/OELp9pATnBNH4/Z9NYzSC8w=;
        b=hmenBZmkbHZ1TCMTo7zoASYb5D7F5dzTKfFHtiaRFEb1DUHN/HRk6Vfh8ar9sBemDP
         dH4EhFYl+wV7ip/fJ/6sRBt5WFNOI6zNQRLbPiL58BsUHum3y8D2NApENvDA/eZaBRm2
         erEHOk7zzUcEsQSOT4B7jZ6pnYniGG/CNqIksjeU5t6KRL/TEtVkUbKXDey6whOWK/U8
         nA/5zW75GHOSB5mG5bN4sSTKBxtZ/AU9/hhYjkaY0DwBhYjjul9MynQC9kc79O5zfEvz
         uDP/ORK5Hczu3mUkaa8ahscgDinJuQlWBC1CCnB1fwJpuTACgR4zf66Vdk21hujzgSPb
         T88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701894556; x=1702499356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54toJAGfTJEbFL7STIP/OELp9pATnBNH4/Z9NYzSC8w=;
        b=DyNHkPVRaa/Wn93j7vNq2NRmNoVgdujKQzyWHxeaeBjqkyOSePzzQFlRXQYb6jedaw
         N0Zs2dvJCTSNb2texy+cDRvaj6CfSDolnqAzYtdNSiC+w/EEPGRdhpSL2shPU3EXWgro
         62SCEam/nXCZD6/oySC/+NkbkR8JQvyBgjV+qA6o5QnPaYQCokmiSdq8AyYqONe0XPSp
         Ae0JKh6tcj7G6XAvoB+fe89wZwcnzFvjyQxChenlkhjrWPBByfpoAL0agaRRuT9Ug9OU
         vixRFffyUWUrEo77IcENumZGZps4JbYLw1PgPsuEsLBPzqHzuqys5oM3+ekGL6CnV/Cy
         l9ZA==
X-Gm-Message-State: AOJu0YxJ9KnTS5pAP1tlwct3PRjzTVoxw2EWhufsWFEE0h8+KtC/ciz/
	ztp+srHABj1AUdODaoevHgeEZLo08z8EJwWW+mM=
X-Google-Smtp-Source: AGHT+IHsh7pphsum0ikMtf/Runjv8eOuURunowVj5Gz11rvo5N+yMx/lzBoUE6DmsiNl8uPSG+HBqoqcgmcP96fmEdo=
X-Received: by 2002:a05:6870:d89:b0:1fa:f3ab:d7bf with SMTP id
 mj9-20020a0568700d8900b001faf3abd7bfmr1374362oab.4.1701894555521; Wed, 06 Dec
 2023 12:29:15 -0800 (PST)
MIME-Version: 1.0
References: <20231206192207.2838077-1-pkj@axis.com> <20231206192207.2838077-9-pkj@axis.com>
In-Reply-To: <20231206192207.2838077-9-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Dec 2023 12:28:49 -0800
Message-ID: <CAMKF1sovOHQhuFPq47bYPhVJUUjn6pzo4WVA3k42h+Yj9CBrig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/9] devtool: upgrade: Update all existing
 checksums for the SRC_URI
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 20:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191922

I wonder if we should start using sha512sum along with sha256sum as
default with devtool upgrade and skip others.

On Wed, Dec 6, 2023 at 11:22=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Rather than only updating the sha256sum and removing the md5sum, update
> all existing checksums. If the only existing checksum is md5sum, then
> replace it with the default expected checksums.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../devtool/devtool-upgrade-test3_1.5.3.bb    | 16 ++++++
>  .../devtool-upgrade-test3_1.5.3.bb.upgraded   | 15 ++++++
>  .../devtool/devtool-upgrade-test4_1.5.3.bb    | 22 ++++++++
>  .../devtool-upgrade-test4_1.5.3.bb.upgraded   | 19 +++++++
>  meta/lib/oeqa/selftest/cases/devtool.py       | 48 +++++++++++++++++
>  scripts/lib/devtool/upgrade.py                | 51 ++++++++++---------
>  6 files changed, 148 insertions(+), 23 deletions(-)
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-te=
st3_1.5.3.bb
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-te=
st3_1.5.3.bb.upgraded
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-te=
st4_1.5.3.bb
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-te=
st4_1.5.3.bb.upgraded
>
> diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5=
.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
> new file mode 100644
> index 0000000000..69c0d351ec
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Pipe viewer test recipe for devtool upgrade test"
> +LICENSE =3D "Artistic-2.0"
> +LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D9c50db2589ee3ef10a9b7b2e5=
0ce1d02"
> +
> +SRC_URI =3D "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
> +UPSTREAM_CHECK_URI =3D "http://www.ivarch.com/programs/pv.shtml"
> +RECIPE_NO_UPDATE_REASON =3D "This recipe is used to test devtool upgrade=
 feature"
> +
> +SRC_URI[md5sum] =3D "9365d86bd884222b4bf1039b5a9ed1bd"
> +
> +S =3D "${WORKDIR}/pv-${PV}"
> +
> +EXCLUDE_FROM_WORLD =3D "1"
> +
> +inherit autotools
> +
> diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5=
.3.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1=
.5.3.bb.upgraded
> new file mode 100644
> index 0000000000..3ce7e85e10
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.u=
pgraded
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Pipe viewer test recipe for devtool upgrade test"
> +LICENSE =3D "Artistic-2.0"
> +LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D9c50db2589ee3ef10a9b7b2e5=
0ce1d02"
> +
> +SRC_URI[sha256sum] =3D "9dd45391806b0ed215abee4c5ac1597d018c386fe9c1f5af=
d2f6bc3b07fd82c3"
> +SRC_URI =3D "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
> +UPSTREAM_CHECK_URI =3D "http://www.ivarch.com/programs/pv.shtml"
> +RECIPE_NO_UPDATE_REASON =3D "This recipe is used to test devtool upgrade=
 feature"
> +
> +S =3D "${WORKDIR}/pv-${PV}"
> +
> +EXCLUDE_FROM_WORLD =3D "1"
> +
> +inherit autotools
> +
> diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5=
.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
> new file mode 100644
> index 0000000000..9abf80e6ed
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Pipe viewer test recipe for devtool upgrade test"
> +LICENSE =3D "Artistic-2.0"
> +LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D9c50db2589ee3ef10a9b7b2e5=
0ce1d02"
> +
> +SRC_URI =3D "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
> +UPSTREAM_CHECK_URI =3D "http://www.ivarch.com/programs/pv.shtml"
> +RECIPE_NO_UPDATE_REASON =3D "This recipe is used to test devtool upgrade=
 feature"
> +
> +SRC_URI[md5sum] =3D "9365d86bd884222b4bf1039b5a9ed1bd"
> +SRC_URI[sha1sum] =3D "63a0801350e812541c7f8e9ad74e0d6b629d0b39"
> +SRC_URI[sha256sum] =3D "681bcca9784bf3cb2207e68236d1f68e2aa7b80f999b5750=
dc77dcd756e81fbc"
> +SRC_URI[sha384sum] =3D "5fff6390465ff23dbf573fcf39dfad3aed2f92074a35e6c0=
2abe58b7678858d90fa6572ff4cb56df8b3e217c739cdbe3"
> +SRC_URI[sha512sum] =3D "32efe7071a363f547afc74e96774f711795edda1d2702823=
a347d0f9953e859b7d8c45b3e63e18ffb9e0d5ed5910be652d7d727c8676e81b6cb3aed0b13=
aec00"
> +
> +PR =3D "r5"
> +
> +S =3D "${WORKDIR}/pv-${PV}"
> +
> +EXCLUDE_FROM_WORLD =3D "1"
> +
> +inherit autotools
> +
> diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5=
.3.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1=
.5.3.bb.upgraded
> new file mode 100644
> index 0000000000..cd2a0842f4
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.u=
pgraded
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "Pipe viewer test recipe for devtool upgrade test"
> +LICENSE =3D "Artistic-2.0"
> +LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D9c50db2589ee3ef10a9b7b2e5=
0ce1d02"
> +
> +SRC_URI =3D "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
> +UPSTREAM_CHECK_URI =3D "http://www.ivarch.com/programs/pv.shtml"
> +RECIPE_NO_UPDATE_REASON =3D "This recipe is used to test devtool upgrade=
 feature"
> +
> +SRC_URI[sha1sum] =3D "395ce62f4f3e035b86c77038f04b96c5aa233595"
> +SRC_URI[sha256sum] =3D "9dd45391806b0ed215abee4c5ac1597d018c386fe9c1f5af=
d2f6bc3b07fd82c3"
> +SRC_URI[sha384sum] =3D "218c8d2d097aeba5310be759bc20573f18ffa0b11701eac6=
dd2e7e14ddf13c6e0e094ca7ca026eaa05ef92a056402e36"
> +SRC_URI[sha512sum] =3D "1cf9d7376fceefcd594d0a8b591afc8e11ce89f7210d10ad=
74438974ecebe9cc5d9ec4db9cc79e0566bfd2b0278c0cc263c07547803e7536432cd1ffd32=
d8a45"
> +
> +S =3D "${WORKDIR}/pv-${PV}"
> +
> +EXCLUDE_FROM_WORLD =3D "1"
> +
> +inherit autotools
> +
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
> index e01ab01869..4e65484d81 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -1883,6 +1883,54 @@ class DevtoolUpgradeTests(DevtoolBase):
>          self.assertNotIn(recipe, result.output)
>          self.assertNotExists(os.path.join(self.workspacedir, 'recipes', =
recipe), 'Recipe directory should not exist after resetting')
>
> +    def test_devtool_upgrade_drop_md5sum(self):
> +        # Check preconditions
> +        self.assertTrue(not os.path.exists(self.workspacedir), 'This tes=
t cannot be run with a workspace directory under the build directory')
> +        self.track_for_cleanup(self.workspacedir)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')
> +        # For the moment, we are using a real recipe.
> +        recipe =3D 'devtool-upgrade-test3'
> +        version =3D '1.6.0'
> +        oldrecipefile =3D get_bb_var('FILE', recipe)
> +        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
> +        self.track_for_cleanup(tempdir)
> +        # Check upgrade. Code does not check if new PV is older or newer=
 that current PV, so, it may be that
> +        # we are downgrading instead of upgrading.
> +        result =3D runCmd('devtool upgrade %s %s -V %s' % (recipe, tempd=
ir, version))
> +        # Check new recipe file is present
> +        newrecipefile =3D os.path.join(self.workspacedir, 'recipes', rec=
ipe, '%s_%s.bb' % (recipe, version))
> +        self.assertExists(newrecipefile, 'Recipe file should exist after=
 upgrade')
> +        # Check recipe got changed as expected
> +        with open(oldrecipefile + '.upgraded', 'r') as f:
> +            desiredlines =3D f.readlines()
> +        with open(newrecipefile, 'r') as f:
> +            newlines =3D f.readlines()
> +        self.assertEqual(desiredlines, newlines)
> +
> +    def test_devtool_upgrade_all_checksums(self):
> +        # Check preconditions
> +        self.assertTrue(not os.path.exists(self.workspacedir), 'This tes=
t cannot be run with a workspace directory under the build directory')
> +        self.track_for_cleanup(self.workspacedir)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')
> +        # For the moment, we are using a real recipe.
> +        recipe =3D 'devtool-upgrade-test4'
> +        version =3D '1.6.0'
> +        oldrecipefile =3D get_bb_var('FILE', recipe)
> +        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
> +        self.track_for_cleanup(tempdir)
> +        # Check upgrade. Code does not check if new PV is older or newer=
 that current PV, so, it may be that
> +        # we are downgrading instead of upgrading.
> +        result =3D runCmd('devtool upgrade %s %s -V %s' % (recipe, tempd=
ir, version))
> +        # Check new recipe file is present
> +        newrecipefile =3D os.path.join(self.workspacedir, 'recipes', rec=
ipe, '%s_%s.bb' % (recipe, version))
> +        self.assertExists(newrecipefile, 'Recipe file should exist after=
 upgrade')
> +        # Check recipe got changed as expected
> +        with open(oldrecipefile + '.upgraded', 'r') as f:
> +            desiredlines =3D f.readlines()
> +        with open(newrecipefile, 'r') as f:
> +            newlines =3D f.readlines()
> +        self.assertEqual(desiredlines, newlines)
> +
>      def test_devtool_layer_plugins(self):
>          """Test that devtool can use plugins from other layers.
>
> diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade=
.py
> index 10827a762b..a98370bc10 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -192,8 +192,7 @@ def _extract_new_source(newpv, srctree, no_patch, src=
rev, srcbranch, branch, kee
>          __run('git submodule foreach \'git tag -f devtool-base-new\'')
>          (stdout, _) =3D __run('git submodule --quiet foreach \'echo $sm_=
path\'')
>          paths +=3D [os.path.join(srctree, p) for p in stdout.splitlines(=
)]
> -        md5 =3D None
> -        sha256 =3D None
> +        checksums =3D {}
>          _, _, _, _, _, params =3D bb.fetch2.decodeurl(uri)
>          srcsubdir_rel =3D params.get('destsuffix', 'git')
>          if not srcbranch:
> @@ -226,9 +225,6 @@ def _extract_new_source(newpv, srctree, no_patch, src=
rev, srcbranch, branch, kee
>          if ftmpdir and keep_temp:
>              logger.info('Fetch temp directory is %s' % ftmpdir)
>
> -        md5 =3D checksums['md5sum']
> -        sha256 =3D checksums['sha256sum']
> -
>          tmpsrctree =3D _get_srctree(tmpdir)
>          srctree =3D os.path.abspath(srctree)
>          srcsubdir_rel =3D os.path.relpath(tmpsrctree, tmpdir)
> @@ -297,7 +293,7 @@ def _extract_new_source(newpv, srctree, no_patch, src=
rev, srcbranch, branch, kee
>              if tmpdir !=3D tmpsrctree:
>                  shutil.rmtree(tmpdir)
>
> -    return (revs, md5, sha256, srcbranch, srcsubdir_rel)
> +    return (revs, checksums, srcbranch, srcsubdir_rel)
>
>  def _add_license_diff_to_recipe(path, diff):
>      notice_text =3D """# FIXME: the LIC_FILES_CHKSUM values have been up=
dated by 'devtool upgrade'.
> @@ -318,7 +314,7 @@ def _add_license_diff_to_recipe(path, diff):
>          f.write("\n#\n\n".encode())
>          f.write(orig_content)
>
> -def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_=
old, srcsubdir_new, workspace, tinfoil, rd, license_diff, new_licenses, src=
tree, keep_failure):
> +def _create_new_recipe(newpv, checksums, srcrev, srcbranch, srcsubdir_ol=
d, srcsubdir_new, workspace, tinfoil, rd, license_diff, new_licenses, srctr=
ee, keep_failure):
>      """Creates the new recipe under workspace"""
>
>      bpn =3D rd.getVar('BPN')
> @@ -390,30 +386,39 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, =
srcbranch, srcsubdir_old, src
>                  addnames.append(params['name'])
>      # Find what's been set in the original recipe
>      oldnames =3D []
> +    oldsums =3D []
>      noname =3D False
>      for varflag in rd.getVarFlags('SRC_URI'):
> -        if varflag.endswith(('.md5sum', '.sha256sum')):
> -            name =3D varflag.rsplit('.', 1)[0]
> -            if name not in oldnames:
> -                oldnames.append(name)
> -        elif varflag in ['md5sum', 'sha256sum']:
> -            noname =3D True
> +        for checksum in checksums:
> +            if varflag.endswith('.' + checksum):
> +                name =3D varflag.rsplit('.', 1)[0]
> +                if name not in oldnames:
> +                    oldnames.append(name)
> +                oldsums.append(checksum)
> +            elif varflag =3D=3D checksum:
> +                noname =3D True
> +                oldsums.append(checksum)
>      # Even if SRC_URI has named entries it doesn't have to actually use =
the name
>      if noname and addnames and addnames[0] not in oldnames:
>          addnames =3D []
>      # Drop any old names (the name actually might include ${PV})
>      for name in oldnames:
>          if name not in newnames:
> -            newvalues['SRC_URI[%s.md5sum]' % name] =3D None
> -            newvalues['SRC_URI[%s.sha256sum]' % name] =3D None
> +            for checksum in oldsums:
> +                newvalues['SRC_URI[%s.%s]' % (name, checksum)] =3D None
>
> -    if sha256:
> -        if addnames:
> -            nameprefix =3D '%s.' % addnames[0]
> -        else:
> -            nameprefix =3D ''
> +    nameprefix =3D '%s.' % addnames[0] if addnames else ''
> +
> +    # md5sum is deprecated, remove any traces of it. If it was the only =
old
> +    # checksum, then replace it with the default checksums.
> +    if 'md5sum' in oldsums:
>          newvalues['SRC_URI[%smd5sum]' % nameprefix] =3D None
> -        newvalues['SRC_URI[%ssha256sum]' % nameprefix] =3D sha256
> +        oldsums.remove('md5sum')
> +        if not oldsums:
> +            oldsums =3D ["%ssum" % s for s in bb.fetch2.SHOWN_CHECKSUM_L=
IST]
> +
> +    for checksum in oldsums:
> +        newvalues['SRC_URI[%s%s]' % (nameprefix, checksum)] =3D checksum=
s[checksum]
>
>      if srcsubdir_new !=3D srcsubdir_old:
>          s_subdir_old =3D os.path.relpath(os.path.abspath(rd.getVar('S'))=
, rd.getVar('WORKDIR'))
> @@ -571,12 +576,12 @@ def upgrade(args, config, basepath, workspace):
>              rev1, srcsubdir1 =3D standard._extract_source(srctree, False=
, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd,=
 tinfoil, no_overrides=3Dargs.no_overrides)
>              old_licenses =3D _extract_licenses(srctree_s, (rd.getVar('LI=
C_FILES_CHKSUM') or ""))
>              logger.info('Extracting upgraded version source...')
> -            rev2, md5, sha256, srcbranch, srcsubdir2 =3D _extract_new_so=
urce(args.version, srctree, args.no_patch,
> +            rev2, checksums, srcbranch, srcsubdir2 =3D _extract_new_sour=
ce(args.version, srctree, args.no_patch,
>                                                      args.srcrev, args.sr=
cbranch, args.branch, args.keep_temp,
>                                                      tinfoil, rd)
>              new_licenses =3D _extract_licenses(srctree_s, (rd.getVar('LI=
C_FILES_CHKSUM') or ""))
>              license_diff =3D _generate_license_diff(old_licenses, new_li=
censes)
> -            rf, copied =3D _create_new_recipe(args.version, md5, sha256,=
 args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tin=
foil, rd, license_diff, new_licenses, srctree, args.keep_failure)
> +            rf, copied =3D _create_new_recipe(args.version, checksums, a=
rgs.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfo=
il, rd, license_diff, new_licenses, srctree, args.keep_failure)
>          except (bb.process.CmdError, DevtoolError) as e:
>              recipedir =3D os.path.join(config.workspace_path, 'recipes',=
 rd.getVar('BPN'))
>              _upgrade_error(e, recipedir, srctree, args.keep_failure)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191913): https://lists.openembedded.org/g/openembedde=
d-core/message/191913
> Mute This Topic: https://lists.openembedded.org/mt/103019944/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

