Return-Path: <jahnavijha14@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3417FC3DA45
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 10:02:10 +0000 (UTC)
Subject: Yocto Python package upgradation from 3.10 to 3.11.5 version
To: openembedded-core@lists.openembedded.org
From: jahnavijha14@gmail.com
X-Originating-Location: Bengaluru, Karnataka, IN (121.241.186.82)
X-Originating-Platform: Linux Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 10 Jul 2024 03:02:08 -0700
Message-ID: <s0O2.1720605728052853271.156O@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="lIAo8bnw5Rfurwgd2ajB"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 10:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201728

--lIAo8bnw5Rfurwgd2ajB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I want to upgrade the Python package version (3.10) present in yocto Kirkst=
one build to Python-3.11.5 version.
For this I created my own layer and inside that have added Python recipe fi=
le for 3.11.5 version and its related files.

When I bitbake the recipe for python. (bitbake python3). I encounter one er=
ror related to do_configure which says:

checking for --with-build-python... configure: error: "nativepython3" has i=
ncompatible version 3.10 (expected: 3.11).

How do I link my Python 3.11.5=C2=A0 with nativepython3?

//////////////////////////////////////////////////////////////////

| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... yes
| checking for --with-build-python... configure: error: "nativepython3" has=
 incompatible version 3.10 (expected: 3.11)
| NOTE: The following config.log files may provide further information.

////////////////////////////////////////////////////////////////////////

--lIAo8bnw5Rfurwgd2ajB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />I want to upgrade the Python package version (3.10) present =
in yocto Kirkstone build to Python-3.11.5 version.<br />For this I created =
my own layer and inside that have added Python recipe file for 3.11.5 versi=
on and its related files.<br /><br />When I bitbake the recipe for python. =
(bitbake python3). I encounter one error related to do_configure which says=
:<br /><br />checking for --with-build-python... configure: error: "nativep=
ython3" has incompatible version 3.10 (expected: 3.11).<br /><br />How do I=
 link my Python 3.11.5&nbsp; with nativepython3?<br /><br />///////////////=
///////////////////////////////////////////////////<br /><br />| checking w=
hether -lc should be explicitly linked in... no<br />| checking dynamic lin=
ker characteristics... GNU/Linux ld.so<br />| checking how to hardcode libr=
ary paths into programs... immediate<br />| checking whether stripping libr=
aries is possible... yes<br />| checking if libtool supports shared librari=
es... yes<br />| checking whether to build shared libraries... yes<br />| c=
hecking whether to build static libraries... yes<br />| checking for --with=
-build-python... configure: error: "nativepython3" has incompatible version=
 3.10 (expected: 3.11)<br />| NOTE: The following config.log files may prov=
ide further information.<br /><br />///////////////////////////////////////=
/////////////////////////////////

--lIAo8bnw5Rfurwgd2ajB--

