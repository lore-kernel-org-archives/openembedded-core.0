Return-Path: <cordlandwehr@kde.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC59E9272B
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 19:22:22 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web11.24853.1696533734464597432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 12:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kde.org header.s=users header.b=QMiau/Vd;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from [IPV6:2003:e2:7f45:2f00:231b:a83b:3afc:caa3] (p200300e27f452f00231ba83b3afccaa3.dip0.t-ipconnect.de [IPv6:2003:e2:7f45:2f00:231b:a83b:3afc:caa3])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id 08D0732CE11;
	Thu,  5 Oct 2023 20:22:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1696533733; bh=zjVt1/QJcThxDVz7EFWfbJdrvE8cRUqcOP/nwg1ykP8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QMiau/VdNkLAl4v4/UdDRJ8cSXCfqKEFkGgh90pkYyhf8JGIJ8gbko+X/yb4y+Grj
	 dtIwUUDB0NxlnD0O14KVc8bTgbvNOTk+IbuzklKcMzwC83vGROy1ViJHLQpeO5sC9l
	 ovl60c/2WlcB+pkIvhr6hEpt8dFx3dHADci76AMgUnjPEdbN8JpF3ayP0vbFYML1rN
	 2apSBSn89V4jWwTZS56oNpYqBj5S0Pmtv23a+J1f0TnhzYEEWHTsHxCdud733ixgNS
	 ngrMc2ro4xT7AIUGUFFXNN0XD5W67S0FCfAmsyW6mNvz7tIIpm6F92vHfw98AUQHXX
	 A018vQaRPsdLQ==
Message-ID: <ad4a6362-22ff-f53c-3742-e66ccb8d7183@kde.org>
Date: Thu, 5 Oct 2023 21:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: Provide Qt6 option
 for qmlgl
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231004160911.3030063-1-cordlandwehr@kde.org>
 <CAMKF1sqiRKyQ7sHf4-OLBkyY7XMWXbES_X7_XJPOS3fVrsRn9Q@mail.gmail.com>
 <7fcb07f0-8e69-ab0e-38c6-94ff96c074f4@kde.org>
 <286cafdd87626ede7916db899e1676484b79505c.camel@linuxfoundation.org>
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
In-Reply-To: <286cafdd87626ede7916db899e1676484b79505c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 19:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188730

On 04.10.23 20:42, Richard Purdie wrote:
> On Wed, 2023-10-04 at 20:19 +0200, Andreas Cord-Landwehr wrote:
>> On 04.10.23 20:10, Khem Raj wrote:
>>> On Wed, Oct 4, 2023 at 9:09=E2=80=AFAM Andreas Cord-Landwehr
>>> <cordlandwehr@kde.org> wrote:
>>>>
>>>> Gstreamer release 1.22.0 introduced option for Qt6 API.
>>>>
>>>> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
>>>> ---
>>>>    .../gstreamer/gstreamer1.0-plugins-good_1.22.5.bb      | 10 +++++=
+++--
>>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
good_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.22.5.bb
>>>> index 93f0e76ee9..ca1e1d6046 100644
>>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.=
22.5.bb
>>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.=
22.5.bb
>>>> @@ -35,7 +35,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender li=
bxfixes libxdamage"
>>>>    X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=3Denabl=
ed -Dximagesrc-xfixes=3Denabled -Dximagesrc-xdamage=3Denabled"
>>>>    X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=3Ddis=
abled -Dximagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"
>>>>
>>>> -QT5WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "way=
land", "qtwayland", "", d)}"
>>>> +QTWAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "wayl=
and", "qtwayland", "", d)}"
>>>>
>>>>    PACKAGECONFIG[asm]        =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,n=
asm-native"
>>>>    PACKAGECONFIG[bz2]        =3D "-Dbz2=3Denabled,-Dbz2=3Ddisabled,b=
zip2"
>>>> @@ -52,7 +52,8 @@ PACKAGECONFIG[libpng]     =3D "-Dpng=3Denabled,-Dp=
ng=3Ddisabled,libpng"
>>>>    PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,-Dv4l2-li=
bv4l2=3Ddisabled,v4l-utils"
>>>>    PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3Ddisa=
bled,mpg123"
>>>>    PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabl=
ed,pulseaudio"
>>>> -PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtb=
ase qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
>>>> +PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtb=
ase qtdeclarative qtbase-native ${QTWAYLANDDEPENDS}"
>>>> +PACKAGECONFIG[qt6]        =3D "-Dqt6=3Denabled,-Dqt6=3Ddisabled,qtb=
ase qtdeclarative qtbase-native qttools-native ${QTWAYLANDDEPENDS}"
>>>>    PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,,,so=
up3"
>>>>    PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,soup2"
>>>>    PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabl=
ed,speex"
>>>> @@ -79,3 +80,8 @@ EXTRA_OEMESON +=3D " \
>>>>    "
>>>>
>>>>    FILES:${PN}-equalizer +=3D "${datadir}/gstreamer-1.0/presets/*.pr=
s"
>>>> +
>>>> +do_configure:prepend() {
>>>> +    # provide path to qtwaylandscanner
>>>> +    export PATH=3D${PATH}:${STAGING_DIR_NATIVE}/${libexecdir}
>>>
>>> perhaps we should fix naitve qt6 to install qtwaylandscanner in nativ=
e
>>> bindir. Then we do not need this.
>>
>> Hi, I brought this up recently in a different discussion
>>
>> https://bugreports.qt.io/browse/QTBUG-116998
>>
>> My understanding is that the move was deliberate and the expectation i=
s
>> that everybody uses the CMake macros with internal path logic; however=
,
>> that fails when not using CMake like here with Meson.
>=20
> There isn't anything stopping OE from symlinking it in it's recipe?
>=20
> Cheers,
>=20
> Richard

Hi Richard,

thanks for you answer! Since qtwayland is part of meta-qt6, do I get=20
your comment correct that you suggest creating a symlink
/usr/bin/qtwaylandscanner -> /usr/libexec/qtwaylandscanner
for the gstreamer1.0-plugins-good recipe or do you have patching of=20
qtwayland in mind?

Cheers,
Andreas

