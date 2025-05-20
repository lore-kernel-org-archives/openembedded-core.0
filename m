Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CEAC2D0CD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 00:36:28 +0000 (UTC)
Subject: Re: [PATCH v2] linux-yocto: build out-of-tree drivers with SDK
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Detroit, Michigan, US (68.49.9.200)
X-Originating-Platform: Linux Firefox 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 19 May 2025 17:36:13 -0700
References: <CADkTA4O0-G7ZuQj=H4MqO4aYwwZvQzYPa1TPmOR+hvwTJ5SikQ@mail.gmail.com>
In-Reply-To: <CADkTA4O0-G7ZuQj=H4MqO4aYwwZvQzYPa1TPmOR+hvwTJ5SikQ@mail.gmail.com>
Message-ID: <29559.1747701373120906688@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wf1JB0g5dL26Mw75twY3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 00:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216879

--wf1JB0g5dL26Mw75twY3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 12:58 PM, Bruce Ashfield wrote:

>=20
> KBUILD_USERHOSTCFLAGS

Hello this patch may be dropped. May just have been an issue with the way I=
 build
the standard SDK in my setup. Cloning poky and building bellow recipe gener=
ates
a standard SDK who's kernel source tree can be prepared for out-of-tree dri=
ver
development. Should of tried this first.

>=20
> cat >> recipes-sdk/images/base-devel-sdk.bb <<EOF
> SUMMARY =3D "Some Development Standard SDK"
> LICENSE =3D "MIT"
> inherit populate_sdk
> TOOLCHAIN_TARGET_TASK +=3D "kernel-devsrc"
> EOF
>=20

>=20
> KBUILD_USERHOSTCFLAGS=3D"${KCFLAGS}" make -e -C
> sysroots/core2-64-poky-linux/lib/modules/6.12.27-yocto-standard/build/
> modules_prepare
>=20

Appears to work for me

Thanks,
Vincent

--wf1JB0g5dL26Mw75twY3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, May 15, 2025 at 12:58 PM, Bruce Ashfield wrote:</div>
<div>
<blockquote>KBUILD_USERHOSTCFLAGS</blockquote>
</div>
<div>Hello this patch may be dropped. May just have been an issue with the =
way I build</div>
<div>the standard SDK in my setup. Cloning poky and building bellow recipe =
generates</div>
<div>a standard SDK who's kernel source tree can be prepared for out-of-tre=
e driver</div>
<div>development. Should of tried this first.</div>
<div>&nbsp;</div>
<div>
<blockquote>
<div>cat &gt;&gt; recipes-sdk/images/base-devel-sdk.bb &lt;&lt;EOF<br />SUM=
MARY =3D "Some Development Standard SDK"<br />LICENSE =3D "MIT"</div>
<div>inherit populate_sdk</div>
<div>TOOLCHAIN_TARGET_TASK +=3D "kernel-devsrc"<br />EOF</div>
</blockquote>
</div>
<blockquote>
<div>KBUILD_USERHOSTCFLAGS=3D"${KCFLAGS}" make -e -C sysroots/core2-64-poky=
-linux/lib/modules/6.12.27-yocto-standard/build/ modules_prepare</div>
</blockquote>
<div>&nbsp;</div>
<div>Appears to work for me</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Vincent</div>

--wf1JB0g5dL26Mw75twY3--

