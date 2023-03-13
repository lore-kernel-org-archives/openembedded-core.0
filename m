Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D30CC6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 17:26:11 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.157.1678728362934568139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 10:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jYzAZS/M;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id ek18so20612501edb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 10:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678728361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQEdhiSNcawSPz3qKX8+HYrlFE2hYzU5IaNdKHxF4Qc=;
        b=jYzAZS/Mg6itkBJRai0im3BYqm46dQnX6KocRxdzoaMSnt298ksvhXmXO501Xv937g
         tttbP/7D/DS77UbvZbLkpTAIFCZxyb1IFCfKSoUVDLFU8Lxq4TuWdqwiHadW+bw9gvxR
         BtkU4osAhM/FPM4TNYPXUXJ7L8As2X9pjDzttIrBnjbNpqHtl3Do9IU5bxVGoGgYHryX
         bl2rfVGBO6bmmYIgqy+3xdiPckoNLtQif9/JKo4v8qKJjfcCwBF0mPnzHNd6z2OF84As
         TO1X0lN3h+XmPHyIbnZSpCu50Hf0YLGtqposVD9OaB7XqQnPRzutLziQwV95sdMN8Axq
         rp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678728361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQEdhiSNcawSPz3qKX8+HYrlFE2hYzU5IaNdKHxF4Qc=;
        b=NziNy0Bg+O3K7iw9Xt6A8yLEUeh8hCyBU5Bh7dHUPlaiXR9wN5BIyOUlJTT5aCMMBH
         u7haqNJbkw1V7cqqjAAxj4WYMUye2S7RbvSCYe/+wlbzUZ/Em4DYQxujnKPPu3rCJfvd
         jchNGUCa8Q96eAjvinO8CiUpj7THh9iDsmTdv0woftRa+Hg4668GlRp1zbSmkQk6v03W
         JabN+hgVlva+EnHyy15Xr219HBekVOleMqf9M+zgj+G9IkYrQ9Z+VoOsRsm0QGE+WAM/
         Z1Qrd0Yt5HY3vr4ylm3TBrJCmdSXCk58bRrlEJxX2YKUdsaxH5Zw/0jtYnbmhzbXh456
         8QQA==
X-Gm-Message-State: AO0yUKWpL1rP5CTwLfaAYIS2ihgHHwsJ7vhDP4Gv8vJBRAnMtILnWbB/
	K4sAkr03N/8K0s8ls9+M6Fe8XtDXZRoZgH4AKAA=
X-Google-Smtp-Source: AK7set8k3TWV2LJF6jfuoJWT+kgPeEj0hEFwim03ILjeg7rY2TOy/JiZ1tm6nh5yURTqBMHyc3+soTLxtTjRupoO/lg=
X-Received: by 2002:a17:906:3090:b0:8ea:a647:ae5d with SMTP id
 16-20020a170906309000b008eaa647ae5dmr17033311ejv.13.1678728360901; Mon, 13
 Mar 2023 10:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678705654.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1678705654.git.Martin.Jansa@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Mar 2023 18:25:49 +0100
Message-ID: <CANNYZj_h7MMWxUpsiGre0Gn4_y_BB7qEfXNTotq-NjNYaB2OcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/14] selftest improvements to respect IMAGE_LINK_NAME
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 17:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178459

Tests in distrodata that contact upstream servers had to be disabled
because it's not possible to tell what is a real failure, and what is
a transient upstream issue (with expired certificates or other network
issues). To ensure upstream version checks don't regress, I run them
manually every now and then.

Alex

On Mon, 13 Mar 2023 at 13:15, Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> These changes are preparation for the actual changes from [YOCTO #12937],
> but without changing anything in current artifacts naming schema.
>
> Only change outside selftest was moving of INITRAMFS_IMAGE_NAME variable
> and adding IMAGE_MACHINE_SUFFIX variable to make it easier to change both=
.
>
> I've run complete selftest with my other changes for [YOCTO #12937] which
> highlighted where the issues are and then again with only these changes
> to make sure I didn't break it for current mickledore.
>
> The most dangerous is probably:
> git-submodule-test: disable upstream version check
> because I cannot explain why distrodata.Distrodata.test_checkpkg isn't fa=
iling on AB
>
> but maybe it's just because many (maybe all AB runs disable this check?),=
 e.g.
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4948/st=
eps/14/logs/stdio
> shows it skipped:
> ERROR: Command . ./oe-init-build-env; ${SCRIPTSDIR}/checkvnc; OEQA_DEBUGG=
ING_SAVED_OUTPUT=3D/srv/autobuilder/autobuilder.yocto.io/pub/repro-fail/ DI=
SPLAY=3D:1 oe-selftest -a --skip-tests distrodata.Distrodata.test_checkpkg =
buildoptions.SourceMirroring.test_yocto_source_mirror reproducible -T machi=
ne -T toolchain-user -T toolchain-system -j 15 failed with exit code 1, see=
 errors above. (1678628531.8: 4253.0)
>
> There were some tests which were skipped (even without --skip-tests) or f=
ailed in my oe-selftest -a run:
>
> =3D=3D SKIPPED =3D=3D
> A) INFO -  ... skipped 'Test needs meta-oe for nodejs'
>   due to testing without meta-oe
>   2023-03-12 12:08:44,526 - oe-selftest - INFO - RESULTS - devtool.Devtoo=
lAddTests.test_devtool_add_npm: SKIPPED (2.22s)
>   2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - recipetool.Rec=
ipetoolCreateTests.test_recipetool_create_npm: SKIPPED (2.83s)
>
> B) INFO -  ... skipped 'No "dash" found on test system.'
>   no dash on gentoo
>   2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - oescripts.OEGi=
tproxyTests.test_oegitproxy_proxy_dash: SKIPPED (0.00s)
>
> C) INFO -  ... skipped 'Target does not use libssp'
>   not testing on mingw32 with libssp:
>   2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - gcc.GccLibSspS=
elfTest.test_libssp: SKIPPED (3.47s)
>   2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - gcc.GccLibSspS=
elfTestSystemEmulated.test_libssp: SKIPPED (4.23s)
>
> D) INFO -  ... skipped 'You must set up tap devices with scripts/runqemu-=
gen-tapdevs before running this test'
>   even when the tapdevs were correctly configured with runqemu-gen-tapdev=
s before oe-selftest was started
>   later resolved by "touch /etc/runqemu-nosudo" and it PASSED,
>   https://git.openembedded.org/openembedded-core/commit/?id=3D2258345e19e=
fff7717fe19a5026ec55f1b6f90b6
>   looks suspicious and will try to improve it (to also ignore
>   skipped taps like /tmp/qemu-tap-locks/tap0.skip which I'm using
>   because tap0 is already used by openvpn running on my builder)
>   2023-03-12 12:08:44,526 - oe-selftest - INFO - RESULTS - devtool.Devtoo=
lExtractTests.test_devtool_deploy_target: SKIPPED (2.33s)
>
> =3D=3D FAILED =3D=3D
> 1) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - distrodata.Di=
strodata.test_checkpkg: FAILED (146.68s)
>
>   2023-03-13 08:57:10,817 - oe-selftest - INFO - Traceback (most recent c=
all last):
>     File "/OE/build/poky/meta/lib/oeqa/selftest/cases/distrodata.py", lin=
e 40, in test_checkpkg
>       self.assertTrue(len(regressed_failures) =3D=3D 0 and len(regressed_=
successes) =3D=3D 0, msg)
>   AssertionError: False is not true :
>   The following packages failed upstream version checks. Please fix them =
using UPSTREAM_CHECK_URI/UPSTREAM_CHECK_REGEX
>   (when using tarballs) or UPSTREAM_CHECK_GITTAGREGEX (when using git). I=
f an upstream version check cannot be performed
>   (for example, if upstream does not use git tags), you can set UPSTREAM_=
VERSION_UNKNOWN to '1' in the recipe to acknowledge
>   that the check cannot be performed.
>   binutils
>
>   used to show git-submodule-test as well (without the first patch here)
>   I have no explanation why this isn't triggered on AB, when I've added
>   more debug in this text, the binutils disappeared as well (so I was
>   assuming it was just temporary network glitch, but today it returned
>   again - with debug already removed).
>
> 2) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - fetch.Fetch.t=
est_git_mirrors: FAILED (24.34s)
>
>   This is a limitation of current selftest as discussed with RP on IRC.
>
>   easy to explain, but more difficult to fix, it sets (PRE)MIRRORS:forcev=
ariable =3D ""
>   and expects to trigger fetch failure from dbus-wait, but PREMIRRORS:pre=
pend in my
>   local.conf defeats it and dbus-wait is fetched successfully.
>
>   I can switch from prepend to =3D+ in my local.conf but that will solve =
it only in my environment.
>
>   RP suggested to change selftest to ignore user's local.conf
>   or pick only some specific key things from it, but current
>   state is what it is and after removing PREMIRRORS:prepend
>   this test PASSED as well.
>
> 3) 2023-03-12 12:08:44,527 - oe-selftest - INFO - RESULTS - incompatible_=
lic.NoGPL3InImagesTests.test_core_image_full_cmdline_weston: FAILED (2043.1=
3s)
>
>   2023-03-13 09:01:25,976 - oe-selftest - INFO -  ... FAIL
>   2023-03-13 09:01:25,977 - oe-selftest - INFO - Traceback (most recent c=
all last):
>     File "/OE/build/poky/meta/lib/oeqa/selftest/cases/incompatible_lic.py=
", line 161, in test_core_image_full_cmdline_weston
>       bitbake('-c testimage core-image-full-cmdline core-image-weston')
>     File "/OE/build/poky/meta/lib/oeqa/utils/commands.py", line 236, in b=
itbake
>       return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log,=
 **options)
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^
>     File "/OE/build/poky/meta/lib/oeqa/utils/commands.py", line 214, in r=
unCmd
>       raise AssertionError("Command '%s' returned non-zero exit status %d=
:\n%s" % (command, result.status, exc_output))
>   AssertionError: Command 'bitbake  -c testimage core-image-full-cmdline =
core-image-weston' returned non-zero exit status 1:
>
>   seems to run many tests succesfully with the test image:
>
>   core-image-weston () - Ran 71 tests in 34.038s
>   core-image-weston - OK - All required tests passed (successes=3D14, ski=
pped=3D57, failures=3D0, errors=3D0)
>   NOTE: recipe core-image-weston-1.0-r0: task do_testimage: Succeeded
>   NOTE: Tasks Summary: Attempted 1141 tasks of which 1139 didn't need to =
be rerun and 1 failed.
>
>   Summary: 1 task failed:
>     /OE/build/poky/meta/recipes-extended/images/core-image-full-cmdline.b=
b:do_testimage
>   Summary: There were 2 WARNING messages.
>   Summary: There were 3 ERROR messages, returning a non-zero exit code.
>
>   but there is also:
>   runqemu - INFO - Found /tmp/qemu-tap-locks/tap0.skip, skipping tap0
>   runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap1.lock faile=
d: [Errno 11] Resource temporarily unavailable
>
>   I need to debug it a bit more, probably outside selftest as well, will =
try
>   to run it when I don't need tap0 for openvpn.
>   But it fails the same with current master without any of my changes as =
well.
>
> 4) runqemu.RunqemuTests still fail with my other [YOCTO #12937] changes
>   but work fine with this pull request, I have some WIP changes locally
>   but the testimage+runqemu interaction is far from simple and will need
>   more time to debug to cover all possible use-cases for runqemu
>
> runqemu.RunqemuTests.test_boot_machine_ext4.log:2023-03-13 09:03:12,008 -=
 oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_machine_ext4=
: FAILED (63.37s)
> runqemu.RunqemuTests.test_boot_recipe_image.log:2023-03-13 08:31:06,400 -=
 oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_recipe_image=
: ERROR (47.56s)
> runqemu.RunqemuTests.test_boot_recipe_image_vdi.log:2023-03-13 08:32:06,4=
89 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_recipe_i=
mage_vdi: ERROR (46.82s)
> runqemu.RunqemuTests.test_boot_recipe_image_vmdk.log:2023-03-13 08:33:07,=
020 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_recipe_=
image_vmdk: ERROR (47.30s)
>
> The following changes since commit 65ca2c4b7349a4f7dcfcc580d926a99c673deb=
60:
>
>   dhcpcd: Fix install conflict when enable multilib. (2023-03-11 00:08:38=
 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib jansa/pull
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/p=
ull
>
> Martin Jansa (14):
>   git-submodule-test: disable upstream version check
>   selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting
>     SSTATE_MIRROR
>   selftest: wic: respect IMAGE_LINK_NAME
>   selftest: wic: respect IMAGE_LINK_NAME also in
>     test_rawcopy_plugin_qemu
>   selftest: runqemu: respect IMAGE_LINK_NAME
>   selftest: multiconfig-image-packager: try to respect IMAGE_LINK_NAME
>   image-artifact-names.bbclass: add INITRAMFS_IMAGE_NAME from
>     kernel.bbclass
>   selftest: fitimage.py: respect INITRAMFS_IMAGE_NAME and
>     KERNEL_FIT_LINK_NAME
>   image-artifact-names: add IMAGE_MACHINE_SUFFIX variable
>   selftest: gdbserver.py: respect IMAGE_LINK_NAME
>   selftest: minidebuginfo.py respect IMAGE_LINK_NAME
>   selftest: efibootpartition.py: fix QEMU_USE_KVM usage
>   runqemu: get_first_file() rename cmd* to glob*
>   selftest: imagefeatures.py: respect IMAGE_LINK_NAME for debugfs and
>     manifest as well
>
>  .../git-submodule-test/git-submodule-test.bb  |  2 +
>  .../multiconfig-image-packager_0.1.bb         | 18 +++-
>  meta-selftest/wic/test_rawcopy_plugin.wks.in  |  2 +-
>  .../image-artifact-names.bbclass              | 16 +++-
>  .../kernel-artifact-names.bbclass             |  2 +-
>  meta/classes-recipe/kernel.bbclass            |  1 -
>  meta/lib/oeqa/selftest/cases/devtool.py       |  1 +
>  .../oeqa/selftest/cases/efibootpartition.py   |  4 +-
>  meta/lib/oeqa/selftest/cases/fitimage.py      | 34 ++++----
>  meta/lib/oeqa/selftest/cases/gdbserver.py     |  9 +-
>  meta/lib/oeqa/selftest/cases/imagefeatures.py | 82 +++++++++----------
>  meta/lib/oeqa/selftest/cases/minidebuginfo.py | 15 ++--
>  meta/lib/oeqa/selftest/cases/runqemu.py       | 10 ++-
>  meta/lib/oeqa/selftest/cases/wic.py           | 44 +++++-----
>  scripts/runqemu                               | 36 ++++----
>  15 files changed, 155 insertions(+), 121 deletions(-)
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178432): https://lists.openembedded.org/g/openembedde=
d-core/message/178432
> Mute This Topic: https://lists.openembedded.org/mt/97578950/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

