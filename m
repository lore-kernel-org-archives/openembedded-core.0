Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53DAC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 19:55:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.1499.1670356542779861716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 11:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pBFOIy/H;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8A196E0002;
	Tue,  6 Dec 2022 19:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670356541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5YcBI+BfRinkqk/fiV0LAzGIOgQ1XoUAebyBo1Rkkw=;
	b=pBFOIy/HZ69li03tYskbS7Jc4Qs3BYwKmies50h20rnCO32VshCCpjyRYwNkmbp+WUTLxU
	b2kCMbD8dan6qEFb/fIfMQ0eY6N5PsVu2BpJRrxezy68eWJd+YPUbS5motF7G4ZHgIOnZe
	HKoVQBsWIQI9sgZbNBClTDYGsXxDuYGeoPw4oK0IAcbXpak2xE5XNEvt8E9aoHB9mjPB/G
	lDKMxbyDoyhalMDrqZDPJuGJ8+WSJWBERyS7mhPupHftprO+sKYJX8jHdlY4W4F+UrfjTP
	liv8ecjcAduFkfTTCjmk2A8EoCPLGiJ3rpZ/OPO6ukGAddz57kq6kd+aDyTHvg==
Date: Tue, 6 Dec 2022 20:55:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] oeqa/selftest/externalsrc: add test for
 srctree_hash_files
Message-ID: <Y4+ePE1/BGRK5j1D@mail.local>
References: <20221205213815.460409-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221205213815.460409-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 19:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174331

Hello,

The submodule test fails on the autobuilders:

2022-12-06 19:23:44,209 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2022-12-06 19:23:44,209 - oe-selftest - INFO - FAIL: externalsrc.ExternalSr=
c.test_externalsrc_srctree_hash_files (subunit.RemotedTestCase)
2022-12-06 19:23:44,209 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2022-12-06 19:23:44,209 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa=
/selftest/cases/externalsrc.py", line 34, in test_externalsrc_srctree_hash_=
files
    self.assertEqual(get_bb_var("S", test_recipe), externalsrc_dir, msg =3D=
 "S does not equal to EXTERNALSRC")
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa=
/utils/commands.py", line 288, in get_bb_var
    return get_bb_vars([var], target, postconfig)[var]
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa=
/utils/commands.py", line 250, in get_bb_vars
    bbenv =3D get_bb_env(target, postconfig=3Dpostconfig)
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa=
/utils/commands.py", line 244, in get_bb_env
    return bitbake("-e %s" % target, postconfig=3Dpostconfig).output
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa=
/utils/commands.py", line 236, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, **o=
ptions)
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa=
/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  -e git-submodule-test' returned non-zero =
exit status 1:
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...ERROR: ExpansionError during parsing /home/pokybuild/yoct=
o-worker/oe-selftest-fedora/build/build-st-3944040/meta-selftest/recipes-te=
st/git-submodule-test/git-submodule-test.bb
Traceback (most recent call last):
  File "Var <do_compile[file-checksums]>", line 1, in <module>
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/classes/=
externalsrc.bbclass", line 234, in srctree_hash_files(d=3D<bb.data_smart.Da=
taSmart object at 0x7f8809b5c310>, srcdir=3DNone):
                 if os.path.exists(".gitmodules"):
    >                submodule_helper =3D subprocess.check_output(["git", "=
config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=3Ds_dir, env=
=3Denv).decode("utf-8")
                     for line in submodule_helper.splitlines():
  File "/usr/lib64/python3.10/subprocess.py", line 421, in check_output(tim=
eout=3DNone, *popenargs=3D(['git', 'config', '--file', '.gitmodules', '--ge=
t-regexp', 'path'],), **kwargs=3D{'cwd': '/tmp/externalsrccxnk_jyq', 'env':=
 {'SHELL': '/bin/bash', 'BB_ENV_PASSTHROUGH_ADDITIONS': 'ALL_PROXY BBPATH_E=
XTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SR=
CREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_=
PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOC=
KS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp=
_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'BB_LOGCONFIG': '/home=
/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-3944040/../bitbak=
e/contrib/autobuilderlog.json', 'PWD': '/home/pokybuild/yocto-worker/oe-sel=
ftest-fedora/build/build-st-3944040', 'LOGNAME': 'pokybuild', 'ftp_proxy': =
'http://proxy.yocto.io:5187/', 'HOME': '/home/pokybuild', 'BBPATH': '/home/=
pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-3944040', 'USER': =
'pokybuild', 'FTP_PROXY': 'http://proxy.yocto.io:5187/', 'PATH': '/home/pok=
ybuild/yocto-worker/oe-selftest-fedora/build/scripts:/home/pokybuild/yocto-=
worker/oe-selftest-fedora/build/bitbake/bin:/home/pokybuild/.local/bin:/hom=
e/pokybuild/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/usr/local/sbin:/=
usr/sbin', 'LC_ALL': 'en_US.UTF-8', 'GIT_INDEX_FILE': '/tmp/oe-devtool-inde=
x18lc6e8_'}}):
    =20
    >    return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DT=
rue,
                    **kwargs).stdout
  File "/usr/lib64/python3.10/subprocess.py", line 526, in run(input=3DNone=
, capture_output=3DFalse, timeout=3DNone, check=3DTrue, *popenargs=3D(['git=
', 'config', '--file', '.gitmodules', '--get-regexp', 'path'],), **kwargs=
=3D{'stdout': -1, 'cwd': '/tmp/externalsrccxnk_jyq', 'env': {'SHELL': '/bin=
/bash', 'BB_ENV_PASSTHROUGH_ADDITIONS': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFI=
G BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DIST=
RO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO=
_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGE=
NT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_prox=
y http_proxy https_proxy no_proxy ', 'BB_LOGCONFIG': '/home/pokybuild/yocto=
-worker/oe-selftest-fedora/build/build-st-3944040/../bitbake/contrib/autobu=
ilderlog.json', 'PWD': '/home/pokybuild/yocto-worker/oe-selftest-fedora/bui=
ld/build-st-3944040', 'LOGNAME': 'pokybuild', 'ftp_proxy': 'http://proxy.yo=
cto.io:5187/', 'HOME': '/home/pokybuild', 'BBPATH': '/home/pokybuild/yocto-=
worker/oe-selftest-fedora/build/build-st-3944040', 'USER': 'pokybuild', 'FT=
P_PROXY': 'http://proxy.yocto.io:5187/', 'PATH': '/home/pokybuild/yocto-wor=
ker/oe-selftest-fedora/build/scripts:/home/pokybuild/yocto-worker/oe-selfte=
st-fedora/build/bitbake/bin:/home/pokybuild/.local/bin:/home/pokybuild/bin:=
/usr/lib64/ccache:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin', 'LC_A=
LL': 'en_US.UTF-8', 'GIT_INDEX_FILE': '/tmp/oe-devtool-index18lc6e8_'}}):
             if check and retcode:
    >            raise CalledProcessError(retcode, process.args,
                                          output=3Dstdout, stderr=3Dstderr)
bb.data_smart.ExpansionError: Failure expanding variable do_compile[file-ch=
ecksums], expression was ${@srctree_hash_files(d)} which triggered exceptio=
n CalledProcessError: Command '['git', 'config', '--file', '.gitmodules', '=
--get-regexp', 'path']' returned non-zero exit status 1.
The variable dependency chain for the failure is: do_compile[file-checksums]
ERROR: Parsing halted due to errors, see error messages above
Summary: There were 2 ERROR messages, returning a non-zero exit code.


https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4443/step=
s/14/logs/stdio

On 05/12/2022 22:38:15+0100, Peter Marko wrote:
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/lib/oeqa/selftest/cases/externalsrc.py | 44 +++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/externalsrc.py
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/externalsrc.py b/meta/lib/oeqa/=
selftest/cases/externalsrc.py
> new file mode 100644
> index 0000000000..1d800dc82c
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/externalsrc.py
> @@ -0,0 +1,44 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import os
> +import shutil
> +import tempfile
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import get_bb_var, runCmd
> +
> +class ExternalSrc(OESelftestTestCase):
> +    # test that srctree_hash_files does not crash
> +    # we should be actually checking do_compile[file-checksums] but oeqa=
 currently does not support it
> +    #     so we check only that a recipe with externalsrc can be parsed
> +    def test_externalsrc_srctree_hash_files(self):
> +        test_recipe =3D "git-submodule-test"
> +        git_url =3D "git://git.yoctoproject.org/git-submodule-test"
> +        externalsrc_dir =3D tempfile.TemporaryDirectory(prefix=3D"extern=
alsrc").name
> +
> +        self.write_config(
> +            """
> +INHERIT +=3D "externalsrc"
> +EXTERNALSRC:pn-%s =3D "%s"
> +""" % (test_recipe, externalsrc_dir)
> +        )
> +
> +        # test with git without submodules
> +        runCmd('git clone %s %s' % (git_url, externalsrc_dir))
> +        os.unlink(externalsrc_dir + "/.gitmodules")
> +        open(".gitmodules", 'w').close()  # local file .gitmodules in cw=
d should not affect externalsrc parsing
> +        self.assertEqual(get_bb_var("S", test_recipe), externalsrc_dir, =
msg =3D "S does not equal to EXTERNALSRC")
> +        os.unlink(".gitmodules")
> +
> +        # test with git with submodules
> +        runCmd('git checkout .gitmodules', cwd=3Dexternalsrc_dir)
> +        runCmd('git submodule update --init --recursive', cwd=3Dexternal=
src_dir)
> +        self.assertEqual(get_bb_var("S", test_recipe), externalsrc_dir, =
msg =3D "S does not equal to EXTERNALSRC")
> +
> +        # test without git
> +        shutil.rmtree(os.path.join(externalsrc_dir, ".git"))
> +        self.assertEqual(get_bb_var("S", test_recipe), externalsrc_dir, =
msg =3D "S does not equal to EXTERNALSRC")
> --=20
> 2.30.2
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174304): https://lists.openembedded.org/g/openembedde=
d-core/message/174304
> Mute This Topic: https://lists.openembedded.org/mt/95479820/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

