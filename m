Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51453C77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 04:11:50 +0000 (UTC)
Subject: Re: [PATCH V1] kbd: Add ptest support
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 15 May 2023 21:11:43 -0700
References: <E1737A70-1D11-48CF-B895-2AA89FC205A4@arm.com>
In-Reply-To: <E1737A70-1D11-48CF-B895-2AA89FC205A4@arm.com>
Message-ID: <22447.1684210303061290743@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1D4quZeWK2fDJCBIbX08"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 04:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181398

--1D4quZeWK2fDJCBIbX08
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8CRoss

>=20
>=20
>> +# create atconfig
>> +if [[ ! -f "atconfig" ]]; then
>> + echo 'abs_builddir=3D"@PTEST_PATH@/tests/"' > atconfig
>> + echo 'abs_srcdir=3D"@PTEST_PATH@/tests/"' >> atconfig
>> + echo 'abs_top_builddir=3D"@PTEST_PATH@/"' >> atconfig
>> +fi
>=20
> You can generate this file when the package is built, surely.
>=20

When the package is built, this file is created, but the directory is not P=
TEST_PATH.
So, I create a new file for ptest.
Of course, there is no problem using the built file.
I will try to modify this patch.

>=20
>=20
>> +RDEPENDS:${PN}-ptest +=3D "bash"
>=20
> Did you try to port the test suite away from bash?

No, I didn't.
I will try to delete it.

--1D4quZeWK2fDJCBIbX08
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8CRoss<br />
<blockquote>
<blockquote style=3D"white-space: pre-wrap;">+# create atconfig<br />+if [[=
 ! -f "atconfig" ]]; then<br />+ echo 'abs_builddir=3D"@PTEST_PATH@/tests/"=
' &gt; atconfig<br />+ echo 'abs_srcdir=3D"@PTEST_PATH@/tests/"' &gt;&gt; a=
tconfig<br />+ echo 'abs_top_builddir=3D"@PTEST_PATH@/"' &gt;&gt; atconfig<=
br />+fi</blockquote>
<span style=3D"white-space: pre-wrap;">You can generate this file when the =
package is built, surely.<br /></span></blockquote>
When the package is built, this file is created, but the directory is not&n=
bsp;<span style=3D"white-space: pre-wrap;">PTEST_PATH.<br /></span>So, I cr=
eate a new file for ptest.<br />Of course, there is no problem using the bu=
ilt file.<br />I will try to modify this patch.<br />
<blockquote>
<blockquote style=3D"white-space: pre-wrap;">+RDEPENDS:${PN}-ptest +=3D "ba=
sh"</blockquote>
<span style=3D"white-space: pre-wrap;">Did you try to port the test suite a=
way from bash?</span></blockquote>
No, I didn't.<br />I will try to delete it.

--1D4quZeWK2fDJCBIbX08--

