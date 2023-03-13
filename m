Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D419DC6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 17:28:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.213.1678728492714662411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 10:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LAfGimMk;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id bh21-20020a05600c3d1500b003ed1ff06fb0so3012720wmb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678728491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FS2mwV/U1mY3605bcGqDHwVyTIAG0OiblHFmhBGXdyU=;
        b=LAfGimMkV+TFFr3Dfzz/jj2093kPPwW+bZeT5UXr0AFuw4x1Kup/OIEAy8Yfb4MJ2K
         MVXmqESn/gqB+RU/RVPg3yhCB2a8cHEulO0BSCOknRz5NgNgOtl303toLl4+P2dBuXLB
         2XKbUcTjVW+VB7oSSlnWdPztgkgHq4kXF+b/F/4eDZhn+Cd+87tbBxxvTMYvSMOGlI1m
         j5QJ0gFF9tg8mggWd5M9GjxELHxoFYIF4j+F7Y4Qciw2C47FriN7CWqgz9O+XGuclKo2
         ekj9m4KzfRYPJ+Bngg5xL19NvUAX3d5sL/ZXgl0QyjDEjm4j66DA0uRMGVj5MJ/ncNH1
         Ggdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678728491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FS2mwV/U1mY3605bcGqDHwVyTIAG0OiblHFmhBGXdyU=;
        b=y+FWeMGgFrWA1IcZzOT4Toj1b3pWAQ27qzbIr0lsvb3HRPx38FNXZguIMsnqkoet5k
         6QnjEa9OndjU5yuSor1+oGrmQ/knPsAsQg8hQ6YM1SBWms6ZuruhDEh+fKi+NURelaWR
         gXPmUxkK/X1EslWrpm04RuuAvDFdK66TtNbtfBBUvUr0fTrFZLmiESufJXhxpLxsF4ll
         6NCU63NVLwYif34A3h/LAg9+gA7kmUxHG+DpPPAc5LvecGRRmtWDMSN+aFMkrFmIizGG
         MMxHtKi0+mMkUACyL+0sI+yn8RNCmdLiihJrHWc1KuxDWjy0YxlrD960oRlrnRuDbCp6
         C2VA==
X-Gm-Message-State: AO0yUKVRoxrUukTmS1dYWkiAv2WYTsuMJ0zNUxwn6BJUe0Qa5BnNLJo3
	Uio63W9HChWeJM3uma+B/eV2ZnPWv1KFj4PmaG0=
X-Google-Smtp-Source: AK7set8e2XaYDdf1paSTQYwbVVS041s9hdE1m/GVcf0ApYlyAekVxIeJVgsdtI/FEGZQMN0hWIP9nSzJtjfFUCqs9ck=
X-Received: by 2002:a7b:c2a2:0:b0:3eb:5824:f0ea with SMTP id
 c2-20020a7bc2a2000000b003eb5824f0eamr3387238wmk.3.1678728490933; Mon, 13 Mar
 2023 10:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678705654.git.Martin.Jansa@gmail.com> <CANNYZj_h7MMWxUpsiGre0Gn4_y_BB7qEfXNTotq-NjNYaB2OcQ@mail.gmail.com>
In-Reply-To: <CANNYZj_h7MMWxUpsiGre0Gn4_y_BB7qEfXNTotq-NjNYaB2OcQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Mar 2023 18:27:53 +0100
Message-ID: <CA+chaQekyms-tvqDqAmMPqFcwHFqQFTTqYH+Vj=wmUdTR35gLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/14] selftest improvements to respect IMAGE_LINK_NAME
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000060603405f6cb6f21"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 17:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178460

--00000000000060603405f6cb6f21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 6:26=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> Tests in distrodata that contact upstream servers had to be disabled
> because it's not possible to tell what is a real failure, and what is
> a transient upstream issue (with expired certificates or other network
> issues). To ensure upstream version checks don't regress, I run them
> manually every now and then.
>

Thanks, can you confirm that git-submodule-test is currently failing for
you (and probably was for long time) and
that binutils is often reporting failure?

On Mon, 13 Mar 2023 at 13:15, Martin Jansa <Martin.Jansa@gmail.com> wrote:
> >
> > These changes are preparation for the actual changes from [YOCTO #12937=
],
> > but without changing anything in current artifacts naming schema.
> >
> > Only change outside selftest was moving of INITRAMFS_IMAGE_NAME variabl=
e
> > and adding IMAGE_MACHINE_SUFFIX variable to make it easier to change
> both.
> >
> > I've run complete selftest with my other changes for [YOCTO #12937] whi=
ch
> > highlighted where the issues are and then again with only these changes
> > to make sure I didn't break it for current mickledore.
> >
> > The most dangerous is probably:
> > git-submodule-test: disable upstream version check
> > because I cannot explain why distrodata.Distrodata.test_checkpkg isn't
> failing on AB
> >
> > but maybe it's just because many (maybe all AB runs disable this
> check?), e.g.
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4948/st=
eps/14/logs/stdio
> > shows it skipped:
> > ERROR: Command . ./oe-init-build-env; ${SCRIPTSDIR}/checkvnc;
> OEQA_DEBUGGING_SAVED_OUTPUT=3D/srv/autobuilder/
> autobuilder.yocto.io/pub/repro-fail/ DISPLAY=3D:1 oe-selftest -a
> --skip-tests distrodata.Distrodata.test_checkpkg
> buildoptions.SourceMirroring.test_yocto_source_mirror reproducible -T
> machine -T toolchain-user -T toolchain-system -j 15 failed with exit code
> 1, see errors above. (1678628531.8: 4253.0)
> >
> > There were some tests which were skipped (even without --skip-tests) or
> failed in my oe-selftest -a run:
> >
> > =3D=3D SKIPPED =3D=3D
> > A) INFO -  ... skipped 'Test needs meta-oe for nodejs'
> >   due to testing without meta-oe
> >   2023-03-12 12:08:44,526 - oe-selftest - INFO - RESULTS -
> devtool.DevtoolAddTests.test_devtool_add_npm: SKIPPED (2.22s)
> >   2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS -
> recipetool.RecipetoolCreateTests.test_recipetool_create_npm: SKIPPED (2.8=
3s)
> >
> > B) INFO -  ... skipped 'No "dash" found on test system.'
> >   no dash on gentoo
> >   2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS -
> oescripts.OEGitproxyTests.test_oegitproxy_proxy_dash: SKIPPED (0.00s)
> >
> > C) INFO -  ... skipped 'Target does not use libssp'
> >   not testing on mingw32 with libssp:
> >   2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS -
> gcc.GccLibSspSelfTest.test_libssp: SKIPPED (3.47s)
> >   2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS -
> gcc.GccLibSspSelfTestSystemEmulated.test_libssp: SKIPPED (4.23s)
> >
> > D) INFO -  ... skipped 'You must set up tap devices with
> scripts/runqemu-gen-tapdevs before running this test'
> >   even when the tapdevs were correctly configured with
> runqemu-gen-tapdevs before oe-selftest was started
> >   later resolved by "touch /etc/runqemu-nosudo" and it PASSED,
> >
> https://git.openembedded.org/openembedded-core/commit/?id=3D2258345e19eff=
f7717fe19a5026ec55f1b6f90b6
> >   looks suspicious and will try to improve it (to also ignore
> >   skipped taps like /tmp/qemu-tap-locks/tap0.skip which I'm using
> >   because tap0 is already used by openvpn running on my builder)
> >   2023-03-12 12:08:44,526 - oe-selftest - INFO - RESULTS -
> devtool.DevtoolExtractTests.test_devtool_deploy_target: SKIPPED (2.33s)
> >
> > =3D=3D FAILED =3D=3D
> > 1) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS -
> distrodata.Distrodata.test_checkpkg: FAILED (146.68s)
> >
> >   2023-03-13 08:57:10,817 - oe-selftest - INFO - Traceback (most recent
> call last):
> >     File "/OE/build/poky/meta/lib/oeqa/selftest/cases/distrodata.py",
> line 40, in test_checkpkg
> >       self.assertTrue(len(regressed_failures) =3D=3D 0 and
> len(regressed_successes) =3D=3D 0, msg)
> >   AssertionError: False is not true :
> >   The following packages failed upstream version checks. Please fix the=
m
> using UPSTREAM_CHECK_URI/UPSTREAM_CHECK_REGEX
> >   (when using tarballs) or UPSTREAM_CHECK_GITTAGREGEX (when using git).
> If an upstream version check cannot be performed
> >   (for example, if upstream does not use git tags), you can set
> UPSTREAM_VERSION_UNKNOWN to '1' in the recipe to acknowledge
> >   that the check cannot be performed.
> >   binutils
> >
> >   used to show git-submodule-test as well (without the first patch here=
)
> >   I have no explanation why this isn't triggered on AB, when I've added
> >   more debug in this text, the binutils disappeared as well (so I was
> >   assuming it was just temporary network glitch, but today it returned
> >   again - with debug already removed).
> >
> > 2) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS -
> fetch.Fetch.test_git_mirrors: FAILED (24.34s)
> >
> >   This is a limitation of current selftest as discussed with RP on IRC.
> >
> >   easy to explain, but more difficult to fix, it sets
> (PRE)MIRRORS:forcevariable =3D ""
> >   and expects to trigger fetch failure from dbus-wait, but
> PREMIRRORS:prepend in my
> >   local.conf defeats it and dbus-wait is fetched successfully.
> >
> >   I can switch from prepend to =3D+ in my local.conf but that will solv=
e
> it only in my environment.
> >
> >   RP suggested to change selftest to ignore user's local.conf
> >   or pick only some specific key things from it, but current
> >   state is what it is and after removing PREMIRRORS:prepend
> >   this test PASSED as well.
> >
> > 3) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS -
> incompatible_lic.NoGPL3InImagesTests.test_core_image_full_cmdline_weston:
> FAILED (2043.13s)
> >
> >   2023-03-13 09:01:25,976 - oe-selftest - INFO -  ... FAIL
> >   2023-03-13 09:01:25,977 - oe-selftest - INFO - Traceback (most recent
> call last):
> >     File
> "/OE/build/poky/meta/lib/oeqa/selftest/cases/incompatible_lic.py", line
> 161, in test_core_image_full_cmdline_weston
> >       bitbake('-c testimage core-image-full-cmdline core-image-weston')
> >     File "/OE/build/poky/meta/lib/oeqa/utils/commands.py", line 236, in
> bitbake
> >       return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_lo=
g,
> **options)
> >
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >     File "/OE/build/poky/meta/lib/oeqa/utils/commands.py", line 214, in
> runCmd
> >       raise AssertionError("Command '%s' returned non-zero exit status
> %d:\n%s" % (command, result.status, exc_output))
> >   AssertionError: Command 'bitbake  -c testimage core-image-full-cmdlin=
e
> core-image-weston' returned non-zero exit status 1:
> >
> >   seems to run many tests succesfully with the test image:
> >
> >   core-image-weston () - Ran 71 tests in 34.038s
> >   core-image-weston - OK - All required tests passed (successes=3D14,
> skipped=3D57, failures=3D0, errors=3D0)
> >   NOTE: recipe core-image-weston-1.0-r0: task do_testimage: Succeeded
> >   NOTE: Tasks Summary: Attempted 1141 tasks of which 1139 didn't need t=
o
> be rerun and 1 failed.
> >
> >   Summary: 1 task failed:
> >
>  /OE/build/poky/meta/recipes-extended/images/core-image-full-cmdline.bb:
> do_testimage
> >   Summary: There were 2 WARNING messages.
> >   Summary: There were 3 ERROR messages, returning a non-zero exit code.
> >
> >   but there is also:
> >   runqemu - INFO - Found /tmp/qemu-tap-locks/tap0.skip, skipping tap0
> >   runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap1.lock
> failed: [Errno 11] Resource temporarily unavailable
> >
> >   I need to debug it a bit more, probably outside selftest as well, wil=
l
> try
> >   to run it when I don't need tap0 for openvpn.
> >   But it fails the same with current master without any of my changes a=
s
> well.
> >
> > 4) runqemu.RunqemuTests still fail with my other [YOCTO #12937] changes
> >   but work fine with this pull request, I have some WIP changes locally
> >   but the testimage+runqemu interaction is far from simple and will nee=
d
> >   more time to debug to cover all possible use-cases for runqemu
> >
> > runqemu.RunqemuTests.test_boot_machine_ext4.log:2023-03-13 09:03:12,008
> - oe-selftest - INFO - RESULTS -
> runqemu.RunqemuTests.test_boot_machine_ext4: FAILED (63.37s)
> > runqemu.RunqemuTests.test_boot_recipe_image.log:2023-03-13 08:31:06,400
> - oe-selftest - INFO - RESULTS -
> runqemu.RunqemuTests.test_boot_recipe_image: ERROR (47.56s)
> > runqemu.RunqemuTests.test_boot_recipe_image_vdi.log:2023-03-13
> 08:32:06,489 - oe-selftest - INFO - RESULTS -
> runqemu.RunqemuTests.test_boot_recipe_image_vdi: ERROR (46.82s)
> > runqemu.RunqemuTests.test_boot_recipe_image_vmdk.log:2023-03-13
> 08:33:07,020 - oe-selftest - INFO - RESULTS -
> runqemu.RunqemuTests.test_boot_recipe_image_vmdk: ERROR (47.30s)
> >
> > The following changes since commit
> 65ca2c4b7349a4f7dcfcc580d926a99c673deb60:
> >
> >   dhcpcd: Fix install conflict when enable multilib. (2023-03-11
> 00:08:38 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.openembedded.org/openembedded-core-contrib jansa/pull
> >
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/pul=
l
> >
> > Martin Jansa (14):
> >   git-submodule-test: disable upstream version check
> >   selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting
> >     SSTATE_MIRROR
> >   selftest: wic: respect IMAGE_LINK_NAME
> >   selftest: wic: respect IMAGE_LINK_NAME also in
> >     test_rawcopy_plugin_qemu
> >   selftest: runqemu: respect IMAGE_LINK_NAME
> >   selftest: multiconfig-image-packager: try to respect IMAGE_LINK_NAME
> >   image-artifact-names.bbclass: add INITRAMFS_IMAGE_NAME from
> >     kernel.bbclass
> >   selftest: fitimage.py: respect INITRAMFS_IMAGE_NAME and
> >     KERNEL_FIT_LINK_NAME
> >   image-artifact-names: add IMAGE_MACHINE_SUFFIX variable
> >   selftest: gdbserver.py: respect IMAGE_LINK_NAME
> >   selftest: minidebuginfo.py respect IMAGE_LINK_NAME
> >   selftest: efibootpartition.py: fix QEMU_USE_KVM usage
> >   runqemu: get_first_file() rename cmd* to glob*
> >   selftest: imagefeatures.py: respect IMAGE_LINK_NAME for debugfs and
> >     manifest as well
> >
> >  .../git-submodule-test/git-submodule-test.bb  |  2 +
> >  .../multiconfig-image-packager_0.1.bb         | 18 +++-
> >  meta-selftest/wic/test_rawcopy_plugin.wks.in  |  2 +-
> >  .../image-artifact-names.bbclass              | 16 +++-
> >  .../kernel-artifact-names.bbclass             |  2 +-
> >  meta/classes-recipe/kernel.bbclass            |  1 -
> >  meta/lib/oeqa/selftest/cases/devtool.py       |  1 +
> >  .../oeqa/selftest/cases/efibootpartition.py   |  4 +-
> >  meta/lib/oeqa/selftest/cases/fitimage.py      | 34 ++++----
> >  meta/lib/oeqa/selftest/cases/gdbserver.py     |  9 +-
> >  meta/lib/oeqa/selftest/cases/imagefeatures.py | 82 +++++++++----------
> >  meta/lib/oeqa/selftest/cases/minidebuginfo.py | 15 ++--
> >  meta/lib/oeqa/selftest/cases/runqemu.py       | 10 ++-
> >  meta/lib/oeqa/selftest/cases/wic.py           | 44 +++++-----
> >  scripts/runqemu                               | 36 ++++----
> >  15 files changed, 155 insertions(+), 121 deletions(-)
> >
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178432):
> https://lists.openembedded.org/g/openembedded-core/message/178432
> > Mute This Topic: https://lists.openembedded.org/mt/97578950/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000060603405f6cb6f21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Mar 13, 2023 at 6:26=E2=80=AFPM A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin=
@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Tests in distrodata that contact upstr=
eam servers had to be disabled<br>
because it&#39;s not possible to tell what is a real failure, and what is<b=
r>
a transient upstream issue (with expired certificates or other network<br>
issues). To ensure upstream version checks don&#39;t regress, I run them<br=
>
manually every now and then.<br></blockquote><div><br></div><div>Thanks, ca=
n you confirm that git-submodule-test is currently failing for you (and pro=
bably was for long time) and</div><div>that binutils is often reporting fai=
lure?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
On Mon, 13 Mar 2023 at 13:15, Martin Jansa &lt;<a href=3D"mailto:Martin.Jan=
sa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; These changes are preparation for the actual changes from [YOCTO #1293=
7],<br>
&gt; but without changing anything in current artifacts naming schema.<br>
&gt;<br>
&gt; Only change outside selftest was moving of INITRAMFS_IMAGE_NAME variab=
le<br>
&gt; and adding IMAGE_MACHINE_SUFFIX variable to make it easier to change b=
oth.<br>
&gt;<br>
&gt; I&#39;ve run complete selftest with my other changes for [YOCTO #12937=
] which<br>
&gt; highlighted where the issues are and then again with only these change=
s<br>
&gt; to make sure I didn&#39;t break it for current mickledore.<br>
&gt;<br>
&gt; The most dangerous is probably:<br>
&gt; git-submodule-test: disable upstream version check<br>
&gt; because I cannot explain why distrodata.Distrodata.test_checkpkg isn&#=
39;t failing on AB<br>
&gt;<br>
&gt; but maybe it&#39;s just because many (maybe all AB runs disable this c=
heck?), e.g.<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/=
builds/4948/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4948/steps/14/=
logs/stdio</a><br>
&gt; shows it skipped:<br>
&gt; ERROR: Command . ./oe-init-build-env; ${SCRIPTSDIR}/checkvnc; OEQA_DEB=
UGGING_SAVED_OUTPUT=3D/srv/autobuilder/<a href=3D"http://autobuilder.yocto.=
io/pub/repro-fail/" rel=3D"noreferrer" target=3D"_blank">autobuilder.yocto.=
io/pub/repro-fail/</a> DISPLAY=3D:1 oe-selftest -a --skip-tests distrodata.=
Distrodata.test_checkpkg buildoptions.SourceMirroring.test_yocto_source_mir=
ror reproducible -T machine -T toolchain-user -T toolchain-system -j 15 fai=
led with exit code 1, see errors above. (1678628531.8: 4253.0)<br>
&gt;<br>
&gt; There were some tests which were skipped (even without --skip-tests) o=
r failed in my oe-selftest -a run:<br>
&gt;<br>
&gt; =3D=3D SKIPPED =3D=3D<br>
&gt; A) INFO -=C2=A0 ... skipped &#39;Test needs meta-oe for nodejs&#39;<br=
>
&gt;=C2=A0 =C2=A0due to testing without meta-oe<br>
&gt;=C2=A0 =C2=A02023-03-12 12:08:44,526 - oe-selftest - INFO - RESULTS - d=
evtool.DevtoolAddTests.test_devtool_add_npm: SKIPPED (2.22s)<br>
&gt;=C2=A0 =C2=A02023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - r=
ecipetool.RecipetoolCreateTests.test_recipetool_create_npm: SKIPPED (2.83s)=
<br>
&gt;<br>
&gt; B) INFO -=C2=A0 ... skipped &#39;No &quot;dash&quot; found on test sys=
tem.&#39;<br>
&gt;=C2=A0 =C2=A0no dash on gentoo<br>
&gt;=C2=A0 =C2=A02023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - o=
escripts.OEGitproxyTests.test_oegitproxy_proxy_dash: SKIPPED (0.00s)<br>
&gt;<br>
&gt; C) INFO -=C2=A0 ... skipped &#39;Target does not use libssp&#39;<br>
&gt;=C2=A0 =C2=A0not testing on mingw32 with libssp:<br>
&gt;=C2=A0 =C2=A02023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - g=
cc.GccLibSspSelfTest.test_libssp: SKIPPED (3.47s)<br>
&gt;=C2=A0 =C2=A02023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - g=
cc.GccLibSspSelfTestSystemEmulated.test_libssp: SKIPPED (4.23s)<br>
&gt;<br>
&gt; D) INFO -=C2=A0 ... skipped &#39;You must set up tap devices with scri=
pts/runqemu-gen-tapdevs before running this test&#39;<br>
&gt;=C2=A0 =C2=A0even when the tapdevs were correctly configured with runqe=
mu-gen-tapdevs before oe-selftest was started<br>
&gt;=C2=A0 =C2=A0later resolved by &quot;touch /etc/runqemu-nosudo&quot; an=
d it PASSED,<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/=
commit/?id=3D2258345e19efff7717fe19a5026ec55f1b6f90b6" rel=3D"noreferrer" t=
arget=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=
=3D2258345e19efff7717fe19a5026ec55f1b6f90b6</a><br>
&gt;=C2=A0 =C2=A0looks suspicious and will try to improve it (to also ignor=
e<br>
&gt;=C2=A0 =C2=A0skipped taps like /tmp/qemu-tap-locks/tap0.skip which I&#3=
9;m using<br>
&gt;=C2=A0 =C2=A0because tap0 is already used by openvpn running on my buil=
der)<br>
&gt;=C2=A0 =C2=A02023-03-12 12:08:44,526 - oe-selftest - INFO - RESULTS - d=
evtool.DevtoolExtractTests.test_devtool_deploy_target: SKIPPED (2.33s)<br>
&gt;<br>
&gt; =3D=3D FAILED =3D=3D<br>
&gt; 1) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - distrodata=
.Distrodata.test_checkpkg: FAILED (146.68s)<br>
&gt;<br>
&gt;=C2=A0 =C2=A02023-03-13 08:57:10,817 - oe-selftest - INFO - Traceback (=
most recent call last):<br>
&gt;=C2=A0 =C2=A0 =C2=A0File &quot;/OE/build/poky/meta/lib/oeqa/selftest/ca=
ses/distrodata.py&quot;, line 40, in test_checkpkg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(len(regressed_failures) =3D=
=3D 0 and len(regressed_successes) =3D=3D 0, msg)<br>
&gt;=C2=A0 =C2=A0AssertionError: False is not true :<br>
&gt;=C2=A0 =C2=A0The following packages failed upstream version checks. Ple=
ase fix them using UPSTREAM_CHECK_URI/UPSTREAM_CHECK_REGEX<br>
&gt;=C2=A0 =C2=A0(when using tarballs) or UPSTREAM_CHECK_GITTAGREGEX (when =
using git). If an upstream version check cannot be performed<br>
&gt;=C2=A0 =C2=A0(for example, if upstream does not use git tags), you can =
set UPSTREAM_VERSION_UNKNOWN to &#39;1&#39; in the recipe to acknowledge<br=
>
&gt;=C2=A0 =C2=A0that the check cannot be performed.<br>
&gt;=C2=A0 =C2=A0binutils<br>
&gt;<br>
&gt;=C2=A0 =C2=A0used to show git-submodule-test as well (without the first=
 patch here)<br>
&gt;=C2=A0 =C2=A0I have no explanation why this isn&#39;t triggered on AB, =
when I&#39;ve added<br>
&gt;=C2=A0 =C2=A0more debug in this text, the binutils disappeared as well =
(so I was<br>
&gt;=C2=A0 =C2=A0assuming it was just temporary network glitch, but today i=
t returned<br>
&gt;=C2=A0 =C2=A0again - with debug already removed).<br>
&gt;<br>
&gt; 2) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - fetch.Fetc=
h.test_git_mirrors: FAILED (24.34s)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0This is a limitation of current selftest as discussed with=
 RP on IRC.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0easy to explain, but more difficult to fix, it sets (PRE)M=
IRRORS:forcevariable =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0and expects to trigger fetch failure from dbus-wait, but P=
REMIRRORS:prepend in my<br>
&gt;=C2=A0 =C2=A0local.conf defeats it and dbus-wait is fetched successfull=
y.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0I can switch from prepend to =3D+ in my local.conf but tha=
t will solve it only in my environment.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0RP suggested to change selftest to ignore user&#39;s local=
.conf<br>
&gt;=C2=A0 =C2=A0or pick only some specific key things from it, but current=
<br>
&gt;=C2=A0 =C2=A0state is what it is and after removing PREMIRRORS:prepend<=
br>
&gt;=C2=A0 =C2=A0this test PASSED as well.<br>
&gt;<br>
&gt; 3) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - incompatib=
le_lic.NoGPL3InImagesTests.test_core_image_full_cmdline_weston: FAILED (204=
3.13s)<br>
&gt;<br>
&gt;=C2=A0 =C2=A02023-03-13 09:01:25,976 - oe-selftest - INFO -=C2=A0 ... F=
AIL<br>
&gt;=C2=A0 =C2=A02023-03-13 09:01:25,977 - oe-selftest - INFO - Traceback (=
most recent call last):<br>
&gt;=C2=A0 =C2=A0 =C2=A0File &quot;/OE/build/poky/meta/lib/oeqa/selftest/ca=
ses/incompatible_lic.py&quot;, line 161, in test_core_image_full_cmdline_we=
ston<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&#39;-c testimage core-image-full-cm=
dline core-image-weston&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0File &quot;/OE/build/poky/meta/lib/oeqa/utils/comma=
nds.py&quot;, line 236, in bitbake<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return runCmd(cmd, ignore_status, timeout, o=
utput_log=3Doutput_log, **options)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt;=C2=A0 =C2=A0 =C2=A0File &quot;/OE/build/poky/meta/lib/oeqa/utils/comma=
nds.py&quot;, line 214, in runCmd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0raise AssertionError(&quot;Command &#39;%s&#=
39; returned non-zero exit status %d:\n%s&quot; % (command, result.status, =
exc_output))<br>
&gt;=C2=A0 =C2=A0AssertionError: Command &#39;bitbake=C2=A0 -c testimage co=
re-image-full-cmdline core-image-weston&#39; returned non-zero exit status =
1:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0seems to run many tests succesfully with the test image:<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0core-image-weston () - Ran 71 tests in 34.038s<br>
&gt;=C2=A0 =C2=A0core-image-weston - OK - All required tests passed (succes=
ses=3D14, skipped=3D57, failures=3D0, errors=3D0)<br>
&gt;=C2=A0 =C2=A0NOTE: recipe core-image-weston-1.0-r0: task do_testimage: =
Succeeded<br>
&gt;=C2=A0 =C2=A0NOTE: Tasks Summary: Attempted 1141 tasks of which 1139 di=
dn&#39;t need to be rerun and 1 failed.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Summary: 1 task failed:<br>
&gt;=C2=A0 =C2=A0 =C2=A0/OE/build/poky/meta/recipes-extended/images/core-im=
age-full-cmdline.bb:do_testimage<br>
&gt;=C2=A0 =C2=A0Summary: There were 2 WARNING messages.<br>
&gt;=C2=A0 =C2=A0Summary: There were 3 ERROR messages, returning a non-zero=
 exit code.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0but there is also:<br>
&gt;=C2=A0 =C2=A0runqemu - INFO - Found /tmp/qemu-tap-locks/tap0.skip, skip=
ping tap0<br>
&gt;=C2=A0 =C2=A0runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/ta=
p1.lock failed: [Errno 11] Resource temporarily unavailable<br>
&gt;<br>
&gt;=C2=A0 =C2=A0I need to debug it a bit more, probably outside selftest a=
s well, will try<br>
&gt;=C2=A0 =C2=A0to run it when I don&#39;t need tap0 for openvpn.<br>
&gt;=C2=A0 =C2=A0But it fails the same with current master without any of m=
y changes as well.<br>
&gt;<br>
&gt; 4) runqemu.RunqemuTests still fail with my other [YOCTO #12937] change=
s<br>
&gt;=C2=A0 =C2=A0but work fine with this pull request, I have some WIP chan=
ges locally<br>
&gt;=C2=A0 =C2=A0but the testimage+runqemu interaction is far from simple a=
nd will need<br>
&gt;=C2=A0 =C2=A0more time to debug to cover all possible use-cases for run=
qemu<br>
&gt;<br>
&gt; runqemu.RunqemuTests.test_boot_machine_ext4.log:2023-03-13 09:03:12,00=
8 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_machine_e=
xt4: FAILED (63.37s)<br>
&gt; runqemu.RunqemuTests.test_boot_recipe_image.log:2023-03-13 08:31:06,40=
0 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_recipe_im=
age: ERROR (47.56s)<br>
&gt; runqemu.RunqemuTests.test_boot_recipe_image_vdi.log:2023-03-13 08:32:0=
6,489 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_recip=
e_image_vdi: ERROR (46.82s)<br>
&gt; runqemu.RunqemuTests.test_boot_recipe_image_vmdk.log:2023-03-13 08:33:=
07,020 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_reci=
pe_image_vmdk: ERROR (47.30s)<br>
&gt;<br>
&gt; The following changes since commit 65ca2c4b7349a4f7dcfcc580d926a99c673=
deb60:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0dhcpcd: Fix install conflict when enable multilib. (2023-0=
3-11 00:08:38 +0000)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/openembedded-core-=
contrib" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
openembedded-core-contrib</a> jansa/pull<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/openembedded-core-=
contrib/log/?h=3Djansa/pull" rel=3D"noreferrer" target=3D"_blank">http://cg=
it.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/pull</a><br>
&gt;<br>
&gt; Martin Jansa (14):<br>
&gt;=C2=A0 =C2=A0git-submodule-test: disable upstream version check<br>
&gt;=C2=A0 =C2=A0selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0SSTATE_MIRROR<br>
&gt;=C2=A0 =C2=A0selftest: wic: respect IMAGE_LINK_NAME<br>
&gt;=C2=A0 =C2=A0selftest: wic: respect IMAGE_LINK_NAME also in<br>
&gt;=C2=A0 =C2=A0 =C2=A0test_rawcopy_plugin_qemu<br>
&gt;=C2=A0 =C2=A0selftest: runqemu: respect IMAGE_LINK_NAME<br>
&gt;=C2=A0 =C2=A0selftest: multiconfig-image-packager: try to respect IMAGE=
_LINK_NAME<br>
&gt;=C2=A0 =C2=A0image-artifact-names.bbclass: add INITRAMFS_IMAGE_NAME fro=
m<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel.bbclass<br>
&gt;=C2=A0 =C2=A0selftest: fitimage.py: respect INITRAMFS_IMAGE_NAME and<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0KERNEL_FIT_LINK_NAME<br>
&gt;=C2=A0 =C2=A0image-artifact-names: add IMAGE_MACHINE_SUFFIX variable<br=
>
&gt;=C2=A0 =C2=A0selftest: gdbserver.py: respect IMAGE_LINK_NAME<br>
&gt;=C2=A0 =C2=A0selftest: minidebuginfo.py respect IMAGE_LINK_NAME<br>
&gt;=C2=A0 =C2=A0selftest: efibootpartition.py: fix QEMU_USE_KVM usage<br>
&gt;=C2=A0 =C2=A0runqemu: get_first_file() rename cmd* to glob*<br>
&gt;=C2=A0 =C2=A0selftest: imagefeatures.py: respect IMAGE_LINK_NAME for de=
bugfs and<br>
&gt;=C2=A0 =C2=A0 =C2=A0manifest as well<br>
&gt;<br>
&gt;=C2=A0 .../git-submodule-test/<a href=3D"http://git-submodule-test.bb" =
rel=3D"noreferrer" target=3D"_blank">git-submodule-test.bb</a>=C2=A0 |=C2=
=A0 2 +<br>
&gt;=C2=A0 .../<a href=3D"http://multiconfig-image-packager_0.1.bb" rel=3D"=
noreferrer" target=3D"_blank">multiconfig-image-packager_0.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++-<br>
&gt;=C2=A0 meta-selftest/wic/<a href=3D"http://test_rawcopy_plugin.wks.in" =
rel=3D"noreferrer" target=3D"_blank">test_rawcopy_plugin.wks.in</a>=C2=A0 |=
=C2=A0 2 +-<br>
&gt;=C2=A0 .../image-artifact-names.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 16 +++-<br>
&gt;=C2=A0 .../kernel-artifact-names.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/devtool.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt;=C2=A0 .../oeqa/selftest/cases/efibootpartition.py=C2=A0 =C2=A0|=C2=A0 =
4 +-<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/fitimage.py=C2=A0 =C2=A0 =C2=A0 | 3=
4 ++++----<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/gdbserver.py=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 9 +-<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/imagefeatures.py | 82 +++++++++----=
------<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 15 ++--<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/runqemu.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 10 ++-<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/wic.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 44 +++++-----<br>
&gt;=C2=A0 scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 36 ++++----=
<br>
&gt;=C2=A0 15 files changed, 155 insertions(+), 121 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.39.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#178432): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/178432" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/178432</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97578950=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/97578950/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--00000000000060603405f6cb6f21--

