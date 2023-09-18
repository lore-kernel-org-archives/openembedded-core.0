Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0C4CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 08:28:32 +0000 (UTC)
Subject: Re: [PATCH V3] tar: add ptest support
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 18 Sep 2023 01:28:23 -0700
References: <CANNYZj8T8_iW0mh4ct1OX33cxihSE0O2bZOzG3ra1GTy08w-fw@mail.gmail.com>
In-Reply-To: <CANNYZj8T8_iW0mh4ct1OX33cxihSE0O2bZOzG3ra1GTy08w-fw@mail.gmail.com>
Message-ID: <31570.1695025703079386511@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="bSv7ClAC6SA3X4xxhgxk"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 08:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187821

--bSv7ClAC6SA3X4xxhgxk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C Alex

Thanks for your reply.
There are two ways to add markers. Which one is better?
1. add one marker for the hole test of tar (as your suggestion)
2. add markers(PASS, FAIL, SKIP) for every case
sample:
PASS: 1: tar version
FAIL: 5: TAR_OPTIONS with string arguments
SKIP: 11: --pax-option compatibility

When try to run 'bitbake -c testimage core-image-ptest-tar' command , my co=
mpiling env can not find the testimage task. ( ERROR: Task do_testimage doe=
s not exist for target core-image-ptest-tar)
Maybe my compiling env has problems, so c ould you show me the correct step=
s for running the command ?

my steps :
1. download bitbake and install
cd ${WORK_DIR}
git clone https://git.openembedded.org/bitbake bitbake export BITBAKEDIR=3D=
${WORK_DIR}/bitbake/
2. download openembedded-core and apply this patch
git clone https://git.openembedded.org/openembedded-core oe-core
cd oe-core
patch -p1 < ${THIS_PATCH}
3. compile image
source ./oe-init-build-env
echo 'DISTRO_FEATURES:append =3D " ptest"' >>=C2=A0=C2=A0conf/local.conf
bitbake core-image-ptest-tar
4. run command
bitbake -c testimage core-image-ptest-tar

--bSv7ClAC6SA3X4xxhgxk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi=EF=BC=8C<span style=3D"white-space-collapse: preserve;">Alex<br /><=
br />Thanks for your reply.<br />There are two ways to add markers. </span>=
Which one is better?<br /><span style=3D"white-space-collapse: preserve;"> =
1. add one marker for the hole test of tar (as your suggestion)</span><br /=
><span style=3D"white-space-collapse: preserve;"> 2. add markers(PASS, FAIL=
, SKIP) for every case<br />sample:<br /></span><span style=3D"white-space-=
collapse: preserve;"> PASS: 1: tar version</span><br /><span style=3D"white=
-space-collapse: preserve;"> FAIL: 5: TAR_OPTIONS with string arguments</sp=
an><br />&nbsp; &nbsp; &nbsp; SKIP: 11: --pax-option compatibility<br /><br=
 /><span style=3D"white-space-collapse: preserve;">When try to run 'bitbake=
 -c testimage core-image-ptest-tar' </span><span style=3D"white-space-colla=
pse: preserve;">command </span><span style=3D"white-space-collapse: preserv=
e;">, my </span><span style=3D"white-space-collapse: preserve;">compiling <=
/span><span style=3D"white-space-collapse: preserve;">env can not find the =
testimage task. (</span>ERROR: Task do_testimage does not exist for target =
core-image-ptest-tar)</div>
<div><span style=3D"white-space-collapse: preserve;">Maybe my </span><span =
style=3D"white-space-collapse: preserve;">compiling </span><span style=3D"w=
hite-space-collapse: preserve;">env has problems, so c</span><span style=3D=
"white-space-collapse: preserve;">ould you show me the correct steps for ru=
nning the </span><span style=3D"white-space-collapse: preserve;">command</s=
pan><span style=3D"white-space-collapse: preserve;">?</span></div>
<br /><span style=3D"white-space-collapse: preserve;">my steps</span><span =
style=3D"white-space-collapse: preserve;">:<br />1. download bitbake and in=
stall<br /></span>&nbsp; &nbsp; cd&nbsp;<span style=3D"white-space-collapse=
: preserve;">${WORK_DIR}</span><br /><span style=3D"white-space-collapse: p=
reserve;"> git clone https://git.openembedded.org/bitbake bitbake export BI=
TBAKEDIR=3D${WORK_DIR}/bitbake/<br />2. download </span>openembedded-core a=
nd apply this patch<br />&nbsp; &nbsp; git clone https://git.openembedded.o=
rg/openembedded-core oe-core<span style=3D"white-space-collapse: preserve;"=
><br /></span>&nbsp; &nbsp; cd oe-core<br />&nbsp; &nbsp; patch -p1 &lt; ${=
THIS_PATCH}<br />3.&nbsp;<span style=3D"white-space-collapse: preserve;">co=
mpile image</span><br />&nbsp; &nbsp; source ./oe-init-build-env<br />&nbsp=
; &nbsp; echo 'DISTRO_FEATURES:append =3D " ptest"' &gt;&gt;&nbsp;&nbsp;con=
f/local.conf<br />&nbsp; &nbsp; bitbake core-image-ptest-tar<br />4. run co=
mmand<br />&nbsp; &nbsp;&nbsp;<span style=3D"white-space-collapse: preserve=
;">bitbake -c testimage core-image-ptest-tar</span>

--bSv7ClAC6SA3X4xxhgxk--

