Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A666FE81806
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 01:18:45 +0000 (UTC)
Subject: Re: [PATCH V5] tar: add ptest support
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 25 Sep 2023 18:18:37 -0700
References: <CANNYZj-DUDDx6e5F6XGQeqG1XDNN2w+oQWck03pDWV_aWOr0=g@mail.gmail.com>
In-Reply-To: <CANNYZj-DUDDx6e5F6XGQeqG1XDNN2w+oQWck03pDWV_aWOr0=g@mail.gmail.com>
Message-ID: <31830.1695691117951827778@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="LmZPg84mEsrAYnVNkR57"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 01:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188213

--LmZPg84mEsrAYnVNkR57
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8CAlex

>=20
> In this case, there's a fix, so please add the link to this patch:
> https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D39849e9d91f477d3fb=
839f93cd0815d0cb3273e9
>=20

The bug: There is no exclude17.at or exclude18.at file in src dir, so tests=
uite can not be compiled.

| /bin/bash '/Yocto/oe-core-test/build/tmp-glibc/work/core2-64-oe-linux/tar=
/1.35/tar-1.35/build-aux/missing' autom4te --language=3Dautotest -I ../../t=
ar-1.35/tests testsuite.at -o ../../tar-1.35/tests/testsuite.tmp | m4:../..=
/tar-1.35/tests/testsuite.at:315: cannot open `exclude17.at': No such file =
or directory | m4:../../tar-1.35/tests/testsuite.at:316: cannot open `exclu=
de18.at': No such file or directory | autom4te: error: m4 failed with exit =
status: 1
Up patch only added exclude17.at and exclude18.at into Makefile, but could =
not fix none file problem.
So, I think it is not the fix patch.

The key is that used tarball(*1) does not contain exclude17.at(*3) and excl=
ude18.at(*4).
But another tarball(*2) contains the two files.
I am not sure why the same version has diffrenent tarballs.
For *1, testsuite is exist in src without compiling, so there is no problem=
. Of course there is not any ticket or fix patch.
In oe ptest, for adding --am-fmt, recompiling testsuite is neccessary, so t=
he problem appeared.

*1: https://ftp.gnu.org/gnu/tar/tar-1.35.tar.bz2
*2: https://git.savannah.gnu.org/cgit/tar.git/snapshot/tar-1.35.tar.gz
*3: The following patch add exclude17.at.
https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D0f0722df45ec520d0dac=
7c9ad7e69165e9140931
*4:=C2=A0The following patch add exclude18.at. ( src/names.c is changed)
https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D4f814e0e4c673f86dc65=
a557f7e55f6b5efd1529

--LmZPg84mEsrAYnVNkR57
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8CAlex<br />
<blockquote><span style=3D"white-space-collapse: preserve;">In this case, t=
here's a fix, so please add the link to this patch:</span><br style=3D"whit=
e-space-collapse: preserve;" /><a style=3D"background-color: #ffffff; white=
-space-collapse: preserve;" href=3D"https://git.savannah.gnu.org/cgit/tar.g=
it/commit/?id=3D39849e9d91f477d3fb839f93cd0815d0cb3273e9" target=3D"_blank"=
 rel=3D"noopener">https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D39=
849e9d91f477d3fb839f93cd0815d0cb3273e9</a></blockquote>
<p><span style=3D"font-family: monospace; font-size: 13.3333px; white-space=
: pre;">The bug: There is no </span><span style=3D"font-family: monospace; =
font-size: 13.3333px; white-space: pre;">exclude17</span><span style=3D"fon=
t-family: monospace; font-size: 13.3333px; white-space: pre;">.at or </span=
><span style=3D"font-family: monospace; font-size: 13.3333px; white-space: =
pre;">exclude18</span><span style=3D"font-family: monospace; font-size: 13.=
3333px; white-space: pre;">.at</span><span style=3D"font-family: monospace;=
"><span style=3D"font-size: 13.3333px; white-space: pre;"> file in src dir,=
 so testsuite can not be compiled.</span></span><br /><br /><span style=3D"=
font-family: monospace;"><span style=3D"font-size: 13.3333px; white-space: =
pre;">| /bin/bash '/Yocto/oe-core-test/build/tmp-glibc/work/core2-64-oe-lin=
ux/tar/1.35/tar-1.35/build-aux/missing' autom4te --language=3Dautotest -I .=
./../tar-1.35/tests testsuite.at -o ../../tar-1.35/tests/testsuite.tmp | m4=
:../../tar-1.35/tests/testsuite.at:315: cannot open `exclude17.at': No such=
 file or directory | m4:../../tar-1.35/tests/testsuite.at:316: cannot open =
`exclude18.at': No such file or directory | autom4te: error: m4 failed with=
 exit status: 1 </span></span><br />Up patch only added&nbsp;<span style=3D=
"font-family: monospace; font-size: 13.3333px; white-space: pre;">exclude17=
</span><span style=3D"font-family: monospace; font-size: 13.3333px; white-s=
pace: pre;">.at and </span><span style=3D"font-family: monospace; font-size=
: 13.3333px; white-space: pre;">exclude18</span><span style=3D"font-family:=
 monospace; font-size: 13.3333px; white-space: pre;">.at into Makefile, but=
 could not fix none file problem.<br />So, I think it is not the fix patch.=
</span></p>
The key is that used tarball(*1) does not contain&nbsp;<span style=3D"font-=
family: monospace; font-size: 13.3333px; white-space: pre;">exclude17</span=
><span style=3D"font-family: monospace; font-size: 13.3333px; white-space: =
pre;">.at(*3) and </span><span style=3D"font-family: monospace; font-size: =
13.3333px; white-space: pre;">exclude18</span><span style=3D"font-family: m=
onospace; font-size: 13.3333px; white-space: pre;">.at(*4).<br />But anothe=
r tarball(*2) contains the two files.<br /></span>I am not sure why the sam=
e version has diffrenent tarballs.<br />For *1, testsuite is exist in src w=
ithout compiling, so there is no problem. Of course there is not any ticket=
 or fix patch.<br />In oe ptest, for adding --am-fmt, recompiling testsuite=
 is neccessary, so the problem appeared.<br /><span style=3D"font-family: m=
onospace; font-size: 13.3333px; white-space: pre;"><br /></span>*1:&nbsp;<a=
 href=3D"https://ftp.gnu.org/gnu/tar/tar-1.35.tar.bz2" target=3D"_blank" re=
l=3D"noopener">https://ftp.gnu.org/gnu/tar/tar-1.35.tar.bz2</a><br />*2:&nb=
sp;<a href=3D"https://git.savannah.gnu.org/cgit/tar.git/snapshot/tar-1.35.t=
ar.gz" target=3D"_blank" rel=3D"noopener">https://git.savannah.gnu.org/cgit=
/tar.git/snapshot/tar-1.35.tar.gz</a><br />*3: The following patch add&nbsp=
;<span style=3D"font-family: monospace; font-size: 13.3333px; white-space: =
pre;">exclude17.at.</span><br /><a href=3D"https://git.savannah.gnu.org/cgi=
t/tar.git/commit/?id=3D0f0722df45ec520d0dac7c9ad7e69165e9140931" target=3D"=
_blank" rel=3D"noopener">https://git.savannah.gnu.org/cgit/tar.git/commit/?=
id=3D0f0722df45ec520d0dac7c9ad7e69165e9140931</a><br />*4:&nbsp;The followi=
ng patch add&nbsp;<span style=3D"font-family: monospace;"><span style=3D"fo=
nt-size: 13.3333px; white-space: pre;">exclude18.at. (</span></span><span s=
tyle=3D"color: #000000; font-family: monospace; font-size: 13.3333px; font-=
weight: bold; white-space: pre;">src/names.c is changed)</span><br /><span =
style=3D"font-family: monospace;"><span style=3D"font-size: 13.3333px; whit=
e-space: pre;"><a href=3D"https://git.savannah.gnu.org/cgit/tar.git/commit/=
?id=3D4f814e0e4c673f86dc65a557f7e55f6b5efd1529" target=3D"_blank" rel=3D"no=
opener">https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D4f814e0e4c67=
3f86dc65a557f7e55f6b5efd1529</a><br /></span></span>

--LmZPg84mEsrAYnVNkR57--

