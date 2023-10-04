Return-Path: <cordlandwehr@kde.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4823AE7C4EC
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 18:19:18 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web10.975.1696443554984512246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 11:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kde.org header.s=users header.b=LcVOTlhx;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from [IPV6:2003:e2:7f45:2f00:ef80:8d2:9b6d:7c4] (p200300e27f452f00ef8008d29b6d07c4.dip0.t-ipconnect.de [IPv6:2003:e2:7f45:2f00:ef80:8d2:9b6d:7c4])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id A2D9B32CCE7;
	Wed,  4 Oct 2023 19:19:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1696443552; bh=meXKCjsda74Zf3R2ztyrqPtI26NKUWkS5WZg75Mgm8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LcVOTlhxvdS40WKkKoud9CNzO9vA66AvpoAv67OpELewXutFulhC7cAneWwwuTkzA
	 3EsF48n4i40D4NC5ArUOCT5plmBXTvb0wY8FVBCOUNr5BpQlIc7tAs46HvMOq574JQ
	 81U4VkaWCFpmRQYQne/I+iTTMhuC9wG6KFQx3GiXaRdXBQCgazRcOp0RnN6HxDx2PO
	 ieP8MvmJfCd/UsKOScjl/rV48ChXalq193eyXpWQlXcPIDTpbVVS77YuiVIVMQps8d
	 my6XvyFzS4L9q1Qx/kzdZa/Q82c3zbZcTz97DZTVHn9GBpPJpl7gJDAuPgRyM50CbM
	 NibAhW3nyV8CA==
Message-ID: <7fcb07f0-8e69-ab0e-38c6-94ff96c074f4@kde.org>
Date: Wed, 4 Oct 2023 20:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: Provide Qt6 option
 for qmlgl
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231004160911.3030063-1-cordlandwehr@kde.org>
 <CAMKF1sqiRKyQ7sHf4-OLBkyY7XMWXbES_X7_XJPOS3fVrsRn9Q@mail.gmail.com>
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
In-Reply-To: <CAMKF1sqiRKyQ7sHf4-OLBkyY7XMWXbES_X7_XJPOS3fVrsRn9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 18:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188695

On 04.10.23 20:10, Khem Raj wrote:
> On Wed, Oct 4, 2023 at 9:09=E2=80=AFAM Andreas Cord-Landwehr
> <cordlandwehr@kde.org> wrote:
>>
>> Gstreamer release 1.22.0 introduced option for Qt6 API.
>>
>> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
>> ---
>>   .../gstreamer/gstreamer1.0-plugins-good_1.22.5.bb      | 10 ++++++++=
--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.22.5.bb
>> index 93f0e76ee9..ca1e1d6046 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22=
.5.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22=
.5.bb
>> @@ -35,7 +35,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender libx=
fixes libxdamage"
>>   X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=3Denabled =
-Dximagesrc-xfixes=3Denabled -Dximagesrc-xdamage=3Denabled"
>>   X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=3Ddisabl=
ed -Dximagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"
>>
>> -QT5WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "wayla=
nd", "qtwayland", "", d)}"
>> +QTWAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "waylan=
d", "qtwayland", "", d)}"
>>
>>   PACKAGECONFIG[asm]        =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm=
-native"
>>   PACKAGECONFIG[bz2]        =3D "-Dbz2=3Denabled,-Dbz2=3Ddisabled,bzip=
2"
>> @@ -52,7 +52,8 @@ PACKAGECONFIG[libpng]     =3D "-Dpng=3Denabled,-Dpng=
=3Ddisabled,libpng"
>>   PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,-Dv4l2-libv4=
l2=3Ddisabled,v4l-utils"
>>   PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3Ddisable=
d,mpg123"
>>   PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,=
pulseaudio"
>> -PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbas=
e qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
>> +PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbas=
e qtdeclarative qtbase-native ${QTWAYLANDDEPENDS}"
>> +PACKAGECONFIG[qt6]        =3D "-Dqt6=3Denabled,-Dqt6=3Ddisabled,qtbas=
e qtdeclarative qtbase-native qttools-native ${QTWAYLANDDEPENDS}"
>>   PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,,,soup3=
"
>>   PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,soup2"
>>   PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabled,=
speex"
>> @@ -79,3 +80,8 @@ EXTRA_OEMESON +=3D " \
>>   "
>>
>>   FILES:${PN}-equalizer +=3D "${datadir}/gstreamer-1.0/presets/*.prs"
>> +
>> +do_configure:prepend() {
>> +    # provide path to qtwaylandscanner
>> +    export PATH=3D${PATH}:${STAGING_DIR_NATIVE}/${libexecdir}
>=20
> perhaps we should fix naitve qt6 to install qtwaylandscanner in native
> bindir. Then we do not need this.

Hi, I brought this up recently in a different discussion

https://bugreports.qt.io/browse/QTBUG-116998

My understanding is that the move was deliberate and the expectation is=20
that everybody uses the CMake macros with internal path logic; however,=20
that fails when not using CMake like here with Meson.

>=20
>> +}
>> --
>> 2.39.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#188689): https://lists.openembedded.org/g/openembe=
dded-core/message/188689
>> Mute This Topic: https://lists.openembedded.org/mt/101758538/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

