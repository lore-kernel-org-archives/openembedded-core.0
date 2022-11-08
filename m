Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5482DC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 04:05:37 +0000 (UTC)
Subject: mesa: PACKAGECONFIG ?= "gallium-llvm .." build error
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 07 Nov 2022 20:05:29 -0800
Message-ID: <Ce8c.1667880329122292793.4npK@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="c2dFhyB6TwE1WBdCzJyS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 04:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172951

--c2dFhyB6TwE1WBdCzJyS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

There's an issues that I've run into. Haven't been able to solve on my own.
Does anyone have any pointers that they can give me?

May be python version related. So, far downgrading meson version hasn't wor=
ked out for me.
Manually checking if version string is empty in universal.py then setting i=
t to some value
by passes bellow issue, but still leads to meson configure failure.

# meson configure fails when gallium-llvm is contained PACKAGECONFIG .
# This is because python finditer() function errors out
# with bellow. For some reason an empty version string is being passed to
# in the finditer() function causing the build to fail.

*Error Message*
***************************************************************************=
***************************************************************************=
*****************************
File "/../../../mesa/2_22.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/s=
ite-packages/mesonbuild/mesonlib/universal.py", line 852, in version_compar=
e
return cmpop(Version(vstr1), Version(vstr2))
^^^^^^^^^^^^^^
File "/../../../mesa/2_22.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/s=
ite-packages/mesonbuild/mesonlib/universal.py", line 759, in __init__
sequences1 =3D re.finditer(r'(\d+|[a-zA-Z]+|[^a-zA-Z\d]+)', s)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/../../../mesa/2_22.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/r=
e/__init__.py", line 223, in finditer
return _compile(pattern, flags).finditer(string)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: expected string or bytes-like object, got 'NoneType'

../mesa-22.2.2/meson.build:1783:2: ERROR: Unhandled python exception
***************************************************************************=
***************************************************************************=
*****************************

--c2dFhyB6TwE1WBdCzJyS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

There's an issues that I've run into. Haven't been able to solve on my own.=
<br />Does anyone have any pointers that they can give me?<br /><br />May b=
e python version related. So, far downgrading meson version hasn't worked o=
ut for me.<br />Manually checking if version string is empty in universal.p=
y then setting it to some value<br />by passes bellow issue, but still lead=
s to meson configure failure.<br /><br /># meson configure fails when galli=
um-llvm is contained PACKAGECONFIG .<br /># This is because python finditer=
() function errors out<br /># with bellow. For some reason an empty version=
 string is being passed to<br /># in the finditer() function causing the bu=
ild to fail.<br /><br /><strong>Error Message</strong><br />***************=
***************************************************************************=
***************************************************************************=
**************<br />&nbsp; File "/../../../mesa/2_22.2.2-r0/recipe-sysroot-=
native/usr/lib/python3.11/site-packages/mesonbuild/mesonlib/universal.py", =
line 852, in version_compare<br />&nbsp;&nbsp;&nbsp; return cmpop(Version(v=
str1), Version(vstr2))<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^<br />&nbsp=
; File "/../../../mesa/2_22.2.2-r0/recipe-sysroot-native/usr/lib/python3.11=
/site-packages/mesonbuild/mesonlib/universal.py", line 759, in __init__<br =
/>&nbsp;&nbsp;&nbsp; sequences1 =3D re.finditer(r'(\d+|[a-zA-Z]+|[^a-zA-Z\d=
]+)', s)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^<br />&nbsp; File "/../../../mesa/2_22.2.2-r0/recipe-sysroot-native=
/usr/lib/python3.11/re/__init__.py", line 223, in finditer<br />&nbsp;&nbsp=
;&nbsp; return _compile(pattern, flags).finditer(string)<br />&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^<br />TypeError: expected string or bytes-like object, got 'N=
oneType'<br /><br />../mesa-22.2.2/meson.build:1783:2: ERROR: Unhandled pyt=
hon exception<br />********************************************************=
***************************************************************************=
************************************************

--c2dFhyB6TwE1WBdCzJyS--

