Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7668FC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 14:16:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.10020.1634307387913869122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 07:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EB6401BF205;
	Fri, 15 Oct 2021 14:16:25 +0000 (UTC)
Date: Fri, 15 Oct 2021 16:16:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] python3-pip: upgrade 21.2.4 -> 21.3
Message-ID: <YWmNOW0gZStVg4fU@piout.net>
References: <1634110729-113967-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1634110729-113967-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 14:16:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156997

Hello,

On 13/10/2021 15:38:49+0800, wangmy wrote:
> Features
> Replace vendored appdirs with platformdirs. (#10202)
>=20
> Support PEP 610 to detect editable installs in pip freeze and pip list.
> The pip list column output has a new Editable project location column,
> and the JSON output has a new editable_project_location field. (#10249)
>=20
> pip freeze will now always fallback to reporting the editable project
> location when it encounters a VCS error while analyzing an editable requi=
rement.
> Before, it sometimes reported the requirement as non-editable. (#10410)
>=20
> pip show now sorts Requires and Required-By alphabetically. (#10422)
>=20
> Do not raise error when there are no files to remove with pip cache purge=
/remove.
> Instead log a warning and continue (to log that we removed 0 files). (#10=
459)
>=20
> When backtracking during dependency resolution, prefer the dependencies w=
hich
> are involved in the most recent conflict. This can significantly reduce t=
he
> amount of backtracking required. (#10479)
>=20
> Cache requirement objects, to improve performance reducing reparses of
> requirement strings. (#10550)
>=20
> Support editable installs for projects that have a pyproject.toml and
> use a build backend that supports PEP 660. (#8212)
>=20
> When a revision is specified in a Git URL, use git=E2=80=99s partial clone
> feature to speed up source retrieval. (#9086)
>=20
> Add a --debug flag, to enable a mode that doesn=E2=80=99t log errors and
> propagates them to the top level instead. This is primarily to aid with
> 1debugging pip=E2=80=99s crashes. (#9349)
>=20
> If a host is explicitly specified as trusted by the user
> (via the --trusted-host option), cache HTTP responses from it in addition
> to HTTPS ones. (#9498)
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-pip_21.2.4.bb =3D> python3-pip_21.3.bb}       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-pip_21.2.4.bb =3D> python3-=
pip_21.3.bb} (89%)
>=20
> diff --git a/meta/recipes-devtools/python/python3-pip_21.2.4.bb b/meta/re=
cipes-devtools/python/python3-pip_21.3.bb
> similarity index 89%
> rename from meta/recipes-devtools/python/python3-pip_21.2.4.bb
> rename to meta/recipes-devtools/python/python3-pip_21.3.bb
> index 1f0f707f4b..924a564f62 100644
> --- a/meta/recipes-devtools/python/python3-pip_21.2.4.bb
> +++ b/meta/recipes-devtools/python/python3-pip_21.3.bb
> @@ -10,7 +10,7 @@ inherit pypi distutils3
>=20
>  SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
>=20
> -SRC_URI[sha256sum] =3D "0eb8a1516c3d138ae8689c0c1a60fde7143310832f9dc77e=
11d8a4bc62de193b"
> +SRC_URI[sha256sum] =3D "741a61baab1dbce2d8ca415effa48a2b6a964564f81a9f4f=
1fce4c433346c034"
>=20

This fails with:

ERROR: python3-pip-native-21.3-r0 do_patch: Applying patch '0001-change-she=
bang-to-python3.patch' on target directory '/home/pokybuild/yocto-worker/bu=
ildtools/build/build/tmp/work/x86_64-linux/python3-pip-native/21.3-r0/pip-2=
1.3'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/buildtools/build/bui=
ld/tmp/work/x86_64-linux/python3-pip-native/21.3-r0/recipe-sysroot-native/e=
tc/quiltrc push', 0, 'stdout: Applying patch 0001-change-shebang-to-python3=
=2Epatch\ncan\'t find file to patch at input line 30\nPerhaps you used the =
wrong -p or --strip option?\nThe text leading up to this was:\n------------=
--------------\n|From baa85a4dab2e8d64eb25d1181b6420db25ce919a Mon Sep 17 0=
0:00:00 2001\n|From: Trevor Gamblin <trevor.gamblin@windriver.com>\n|Date: =
Tue, 22 Jun 2021 12:31:46 -0400\n|Subject: [PATCH] change shebang to python=
3\n|\n|Upstream-Status: Inappropriate (OE-specific)\n|\n|Despite no longer =
supporting python2, some files in the pip source refer\n|to "python" instea=
d of "python3", so patch them as needed to ensure that\n|they correctly ref=
erence the python3 binary.\n|\n|Signed-off-by: Trevor Gamblin <trevor.gambl=
in@windriver.com>\n|---\n| src/pip/_vendor/appdirs.py                    | =
2 +-\n| src/pip/_vendor/chardet/langbulgarianmodel.py | 2 +-\n| src/pip/_ve=
ndor/chardet/langgreekmodel.py     | 2 +-\n| src/pip/_vendor/chardet/langhe=
brewmodel.py    | 2 +-\n| src/pip/_vendor/chardet/langhungarianmodel.py | 2=
 +-\n| src/pip/_vendor/chardet/langrussianmodel.py   | 2 +-\n| src/pip/_ven=
dor/chardet/langthaimodel.py      | 2 +-\n| src/pip/_vendor/chardet/langtur=
kishmodel.py   | 2 +-\n| src/pip/_vendor/chardet/metadata/languages.py | 2 =
+-\n| src/pip/_vendor/requests/certs.py             | 2 +-\n| 10 files chan=
ged, 10 insertions(+), 10 deletions(-)\n|\n|diff --git a/src/pip/_vendor/ap=
pdirs.py b/src/pip/_vendor/appdirs.py\n|index 33a3b7741..60b9ef5f7 100644\n=
|--- a/src/pip/_vendor/appdirs.py\n|+++ b/src/pip/_vendor/appdirs.py\n-----=
---------------------\nNo file to patch.  Skipping patch.\n1 out of 1 hunk =
ignored\npatching file src/pip/_vendor/chardet/langbulgarianmodel.py\npatch=
ing file src/pip/_vendor/chardet/langgreekmodel.py\npatching file src/pip/_=
vendor/chardet/langhebrewmodel.py\npatching file src/pip/_vendor/chardet/la=
nghungarianmodel.py\npatching file src/pip/_vendor/chardet/langrussianmodel=
=2Epy\npatching file src/pip/_vendor/chardet/langthaimodel.py\npatching fil=
e src/pip/_vendor/chardet/langturkishmodel.py\npatching file src/pip/_vendo=
r/chardet/metadata/languages.py\npatching file src/pip/_vendor/requests/cer=
ts.py\nPatch 0001-change-shebang-to-python3.patch does not apply (enforce w=
ith -f)\n\nstderr: ')
ERROR: nativesdk-python3-pip-21.3-r0 do_patch: Applying patch '0001-change-=
shebang-to-python3.patch' on target directory '/home/pokybuild/yocto-worker=
/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-p=
ython3-pip/21.3-r0/pip-21.3'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/buildtools/build/bui=
ld/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pip/21.3-r0/re=
cipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-chan=
ge-shebang-to-python3.patch\ncan\'t find file to patch at input line 30\nPe=
rhaps you used the wrong -p or --strip option?\nThe text leading up to this=
 was:\n--------------------------\n|From baa85a4dab2e8d64eb25d1181b6420db25=
ce919a Mon Sep 17 00:00:00 2001\n|From: Trevor Gamblin <trevor.gamblin@wind=
river.com>\n|Date: Tue, 22 Jun 2021 12:31:46 -0400\n|Subject: [PATCH] chang=
e shebang to python3\n|\n|Upstream-Status: Inappropriate (OE-specific)\n|\n=
|Despite no longer supporting python2, some files in the pip source refer\n=
|to "python" instead of "python3", so patch them as needed to ensure that\n=
|they correctly reference the python3 binary.\n|\n|Signed-off-by: Trevor Ga=
mblin <trevor.gamblin@windriver.com>\n|---\n| src/pip/_vendor/appdirs.py   =
                 | 2 +-\n| src/pip/_vendor/chardet/langbulgarianmodel.py | =
2 +-\n| src/pip/_vendor/chardet/langgreekmodel.py     | 2 +-\n| src/pip/_ve=
ndor/chardet/langhebrewmodel.py    | 2 +-\n| src/pip/_vendor/chardet/langhu=
ngarianmodel.py | 2 +-\n| src/pip/_vendor/chardet/langrussianmodel.py   | 2=
 +-\n| src/pip/_vendor/chardet/langthaimodel.py      | 2 +-\n| src/pip/_ven=
dor/chardet/langturkishmodel.py   | 2 +-\n| src/pip/_vendor/chardet/metadat=
a/languages.py | 2 +-\n| src/pip/_vendor/requests/certs.py             | 2 =
+-\n| 10 files changed, 10 insertions(+), 10 deletions(-)\n|\n|diff --git a=
/src/pip/_vendor/appdirs.py b/src/pip/_vendor/appdirs.py\n|index 33a3b7741.=
=2E60b9ef5f7 100644\n|--- a/src/pip/_vendor/appdirs.py\n|+++ b/src/pip/_ven=
dor/appdirs.py\n--------------------------\nNo file to patch.  Skipping pat=
ch.\n1 out of 1 hunk ignored\npatching file src/pip/_vendor/chardet/langbul=
garianmodel.py\npatching file src/pip/_vendor/chardet/langgreekmodel.py\npa=
tching file src/pip/_vendor/chardet/langhebrewmodel.py\npatching file src/p=
ip/_vendor/chardet/langhungarianmodel.py\npatching file src/pip/_vendor/cha=
rdet/langrussianmodel.py\npatching file src/pip/_vendor/chardet/langthaimod=
el.py\npatching file src/pip/_vendor/chardet/langturkishmodel.py\npatching =
file src/pip/_vendor/chardet/metadata/languages.py\npatching file src/pip/_=
vendor/requests/certs.py\nPatch 0001-change-shebang-to-python3.patch does n=
ot apply (enforce with -f)\n\nstderr: ')

See for example:
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/4511/step=
s/12/logs/stdio


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

