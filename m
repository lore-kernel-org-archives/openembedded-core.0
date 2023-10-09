Return-Path: <cordlandwehr@kde.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E424DCD611E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 18:26:11 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web11.70531.1696875966944931801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 11:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kde.org header.s=users header.b=kx3vK77n;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from [IPV6:2003:e2:7f45:2f00:ccd9:3c5b:fe32:23ba] (p200300e27f452f00ccd93c5bfe3223ba.dip0.t-ipconnect.de [IPv6:2003:e2:7f45:2f00:ccd9:3c5b:fe32:23ba])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id B3A03320536;
	Mon,  9 Oct 2023 19:26:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1696875964; bh=AwB97z1ON8DrTf8wrVNgKfxkY0+bi+Fg1Z9KEMRMhE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kx3vK77nS+nKYjELaUkqBubAKyNGUYUNzPW5JL0NGgIyAQv+4+mYZY2iX8BDJj9mi
	 tKz6tZlyqsz+9OWVNvhWTriA7iyI7S6VPVNOk2QBFWKi8F6JPOFq0SIr+fHKhEW1gi
	 0zVjCZ8nrOfdQcQLomv4Bq51b6fBZ0j3GqK358RIhnAfHO2lA8ZlRzz2a6L+gWAzwn
	 LdQM+KlBNiXqj+pFkfeqjgXZk0XtHiU/idC5IkXiV9hJDBHoaNCysXxDi4mHBLxiFO
	 h+Nn41ixlP1v96/FQ5pfTW90UZhSmu8nn4+FoJGewmnoVXccEatSjIETH3owRUpWRK
	 CzLIYSW/Bkqhg==
Message-ID: <c6b52856-a5c8-42ef-66f2-a5c422ee77db@kde.org>
Date: Mon, 9 Oct 2023 20:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: Provide Qt6 option
 for qmlgl
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20231004160911.3030063-1-cordlandwehr@kde.org>
 <CAMKF1sqiRKyQ7sHf4-OLBkyY7XMWXbES_X7_XJPOS3fVrsRn9Q@mail.gmail.com>
 <7fcb07f0-8e69-ab0e-38c6-94ff96c074f4@kde.org>
 <286cafdd87626ede7916db899e1676484b79505c.camel@linuxfoundation.org>
 <ad4a6362-22ff-f53c-3742-e66ccb8d7183@kde.org>
 <c8566a503c49903303cbae463b33e775a16ba0b3.camel@linuxfoundation.org>
 <CAMKF1spS-petzm95Xdh2K75RSJnw1uUZWvEVLF7Q7O-Ua1smXA@mail.gmail.com>
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
In-Reply-To: <CAMKF1spS-petzm95Xdh2K75RSJnw1uUZWvEVLF7Q7O-Ua1smXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 18:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188860


On 05.10.23 23:14, Khem Raj wrote:
> On Thu, Oct 5, 2023 at 12:27=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Thu, 2023-10-05 at 21:22 +0200, Andreas Cord-Landwehr wrote:
>>> On 04.10.23 20:42, Richard Purdie wrote:
>>>> On Wed, 2023-10-04 at 20:19 +0200, Andreas Cord-Landwehr wrote:
>>>>> On 04.10.23 20:10, Khem Raj wrote:
>>>>>> On Wed, Oct 4, 2023 at 9:09=E2=80=AFAM Andreas Cord-Landwehr
>>>>>> <cordlandwehr@kde.org> wrote:
>>>>>>>
>>>>>>> Gstreamer release 1.22.0 introduced option for Qt6 API.
>>>>>>>
>>>>>>> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
>>>>>>> ---
>>>>>>>     .../gstreamer/gstreamer1.0-plugins-good_1.22.5.bb      | 10 +=
+++++++--
>>>>>>>     1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-good_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good_1.22.5.bb
>>>>>>> index 93f0e76ee9..ca1e1d6046 100644
>>>>>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good=
_1.22.5.bb
>>>>>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good=
_1.22.5.bb
>>>>>>> @@ -35,7 +35,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender=
 libxfixes libxdamage"
>>>>>>>     X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=3De=
nabled -Dximagesrc-xfixes=3Denabled -Dximagesrc-xdamage=3Denabled"
>>>>>>>     X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=3D=
disabled -Dximagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"
>>>>>>>
>>>>>>> -QT5WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "=
wayland", "qtwayland", "", d)}"
>>>>>>> +QTWAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "w=
ayland", "qtwayland", "", d)}"
>>>>>>>
>>>>>>>     PACKAGECONFIG[asm]        =3D "-Dasm=3Denabled,-Dasm=3Ddisabl=
ed,nasm-native"
>>>>>>>     PACKAGECONFIG[bz2]        =3D "-Dbz2=3Denabled,-Dbz2=3Ddisabl=
ed,bzip2"
>>>>>>> @@ -52,7 +52,8 @@ PACKAGECONFIG[libpng]     =3D "-Dpng=3Denabled,=
-Dpng=3Ddisabled,libpng"
>>>>>>>     PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,-Dv4l=
2-libv4l2=3Ddisabled,v4l-utils"
>>>>>>>     PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3D=
disabled,mpg123"
>>>>>>>     PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddi=
sabled,pulseaudio"
>>>>>>> -PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,=
qtbase qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
>>>>>>> +PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,=
qtbase qtdeclarative qtbase-native ${QTWAYLANDDEPENDS}"
>>>>>>> +PACKAGECONFIG[qt6]        =3D "-Dqt6=3Denabled,-Dqt6=3Ddisabled,=
qtbase qtdeclarative qtbase-native qttools-native ${QTWAYLANDDEPENDS}"
>>>>>>>     PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,=
,,soup3"
>>>>>>>     PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,so=
up2"
>>>>>>>     PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddi=
sabled,speex"
>>>>>>> @@ -79,3 +80,8 @@ EXTRA_OEMESON +=3D " \
>>>>>>>     "
>>>>>>>
>>>>>>>     FILES:${PN}-equalizer +=3D "${datadir}/gstreamer-1.0/presets/=
*.prs"
>>>>>>> +
>>>>>>> +do_configure:prepend() {
>>>>>>> +    # provide path to qtwaylandscanner
>>>>>>> +    export PATH=3D${PATH}:${STAGING_DIR_NATIVE}/${libexecdir}
>>>>>>
>>>>>> perhaps we should fix naitve qt6 to install qtwaylandscanner in na=
tive
>>>>>> bindir. Then we do not need this.
>>>>>
>>>>> Hi, I brought this up recently in a different discussion
>>>>>
>>>>> https://bugreports.qt.io/browse/QTBUG-116998
>>>>>
>>>>> My understanding is that the move was deliberate and the expectatio=
n is
>>>>> that everybody uses the CMake macros with internal path logic; howe=
ver,
>>>>> that fails when not using CMake like here with Meson.
>>>>
>>>> There isn't anything stopping OE from symlinking it in it's recipe?
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>
>>> Hi Richard,
>>>
>>> thanks for you answer! Since qtwayland is part of meta-qt6, do I get
>>> your comment correct that you suggest creating a symlink
>>> /usr/bin/qtwaylandscanner -> /usr/libexec/qtwaylandscanner
>>> for the gstreamer1.0-plugins-good recipe or do you have patching of
>>> qtwayland in mind?
>>
>> I was suggesting you ask meta-qt6 about the idea of the symlink in
>> their recipe. I didn't know if meta-qt6 was being handled by qt.io or
>> not though. I may have misunderstood and it is the meta-qt6 people
>> saying gstreamer are doing it "wrong" in which case this is indeed mor=
e
>> tricky :(.
>=20
> yeah creating a symlink in meta-qt6 should be quick and easy solution.

Hi, a short update: I figured out that Meson actually has code to handle=20
exactly this situation to detect Qt's tools in libexec. Not sure yet=20
what is happening there and why the detection fails. By the way, this=20
detection problem holds for further Qt tools (moc, lrelease, rcc...)

Currently looking into this.

Cheers,
Andreas

