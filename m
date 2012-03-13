Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1S7Wxw-0000dV-Oz
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 20:01:00 +0100
Received: by eaae1 with SMTP id e1so516019eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 11:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:x-originating-ip:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=6s/Jgf5g2rXbANoawZD4sbbpH4KbpFbIlCy0jCdlPF4=;
	b=jFLi5lOioqg8kRG59dWbFTw7ZZ6H3kLPVJmn1Dl2rdeN0Kt0jPBSn0YL0nLDYaonGN
	JSorBUXL1IQ2jxpQ+ySEfxaf4XzsWXra2fpWsLZDqUmCAKbuwK6WrLGMPWc9W7yRDjep
	wMHFgBg+pV/7OhdWVSTXodGHZobjqZdSMtqDMAmjTOUptxAvZB9nPrXm8sNxiywZ+QTM
	6yI1lu7LTw4ilHU5b+he0inMI4YDHTx0+gbwwNzNqYfHugMnW9FYUq5kcdT+RcWoryx3
	XdajntLYhhZgPl4may0PhElpc0utNSSMxbvx43GKsJidD88+ZFJUgpssaUHulibSUQmu
	LeAA==
Received: by 10.213.20.212 with SMTP id g20mr1365635ebb.148.1331664736330;
	Tue, 13 Mar 2012 11:52:16 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.213.4.15 with HTTP; Tue, 13 Mar 2012 11:51:56 -0700 (PDT)
X-Originating-IP: [2.94.168.161]
In-Reply-To: <CAHod+Ge8QmNp5TXhoKnqLR_2s+eGg=jOWLG2keAoCYFjTs3ByA@mail.gmail.com>
References: <CAHod+Ge8QmNp5TXhoKnqLR_2s+eGg=jOWLG2keAoCYFjTs3ByA@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Tue, 13 Mar 2012 21:51:56 +0300
X-Google-Sender-Auth: UvuXJwYvIFsNdM4Mm_yfU23LUG0
Message-ID: <CAJG6M_PNKiaTT9HcCFNdo1d2cSON98nY=OQ+p1RvB0VkcT=ZOw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmF1wpOm0eR0gX7NaqYo3MuUvigfqZzsPwL6Sh4naJn66bD4ZueG8DOQhf5W29oK/XO9+Xd
Subject: Re: [PATCH 1/5] Split xcb-util into separate packages.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2012 19:01:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/3/10 Marko Kati=C4=87 <dromede@gmail.com>:
> xcb-util was split into separate packages during the 0.3.6 -> 0.3.8
> transition.
> Change xcb-util.inc to reflect that.
>
>
>
> diff --git a/meta/recipes-graphics/xcb/xcb-util.inc
> b/meta/recipes-graphics/xcb/xcb-util.inc
> index cd9923d..5e77a22 100644
> --- a/meta/recipes-graphics/xcb/xcb-util.inc
> +++ b/meta/recipes-graphics/xcb/xcb-util.inc
> @@ -18,20 +18,6 @@ DEPENDS +=3D "gperf-native"
>
> =C2=A0PARALLEL_MAKE =3D ""

BTW, I haven't seen any trouble with PARALLEL_MAKE and
xcb-util_0.3.8.bb. So we may try to remove this line.

>
> -SRC_URI =3D "http://xcb.freedesktop.org/dist/xcb-util-${PV}.tar.bz2"
> -
> -PACKAGES =3D+ "libxcbatom libxcbaux libxcbevent libxcbicccm \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxcbimage libxcbkeysyms lib=
xcbproperty \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxcbreply libxcbwm"
> -
> -FILES_libxcbatom =3D "${libdir}/libXCBAtom.so.*"
> -FILES_libxcbaux =3D "${libdir}/libXCBAux.so.*"
> -FILES_libxcbevent =3D "${libdir}/libXCBEvent.so.*"
> -FILES_libxcbicccm =3D "${libdir}/libXCBICCCM.so.*"
> -FILES_libxcbimage =3D "${libdir}/libXCBImage.so.*"
> -FILES_libxcbkeysyms =3D "${libdir}/libXCBKeysyms.so.*"
> -FILES_libxcbproperty =3D "${libdir}/libXCBProperty.so.*"
> -FILES_libxcbreply =3D "${libdir}/libXCBReply.so.*"
> -FILES_libxcbwm =3D "${libdir}/libXCBWM.so.*"
> +SRC_URI =3D "http://xcb.freedesktop.org/dist/${PN}-${PV}.tar.bz2"
>
> =C2=A0inherit autotools pkgconfig
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Yury Bushmelev


