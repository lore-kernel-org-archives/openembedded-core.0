Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7992065CF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 18:53:29 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id va2so6883424obc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jul 2014 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=RUKJ4JhMRyhwXYSzK49p48RDh1lXwaFvWlDJSf0zHTc=;
	b=IiaSV4YBklymCTAQ+aNkQDvKQjn2HyuPCaLPE4qzQ+xq2MlCdWD6nM+M1z7Jf5V1rq
	IDLzJFLYiDHmamunoriZrbxNxAsPlhiDxs3gwKRJy7PyapbTeCMciGQj4YxaxlPv/yQX
	hssOI8Y33pUqdfNyJkyOqwefui8qDQoMsrEFrOXDt0ESiHpRcBdSZ+iayGkvqZnUzUgx
	1FF2/IM244X4A2hO+hyp7jlTcYg1vQhlwFXNtG4XBglujDYhimPYVbni0IINARTLP4Vo
	E75l5P0CXtxBWBa9HZoIB11lPzLmP8290grNrQvhGTKqSV+aDxJhTlYjjaOwUz5YjE2B
	ahvA==
MIME-Version: 1.0
X-Received: by 10.60.63.195 with SMTP id i3mr13376459oes.76.1404845610831;
	Tue, 08 Jul 2014 11:53:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.84.164 with HTTP; Tue, 8 Jul 2014 11:53:30 -0700 (PDT)
In-Reply-To: <337dfbdfa91ac843566cbb9e014db36a8b197878.1404812342.git.hongxu.jia@windriver.com>
References: <cover.1404812342.git.hongxu.jia@windriver.com>
	<337dfbdfa91ac843566cbb9e014db36a8b197878.1404812342.git.hongxu.jia@windriver.com>
Date: Tue, 8 Jul 2014 15:53:30 -0300
X-Google-Sender-Auth: rQYf8ZptFBbn-Moi9uzU6l7u6us
Message-ID: <CAP9ODKqRqwKL4=QzNrmHuCCJq-KCnf+cBJqA1KWJ6GpNfmSOkw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] xserver-xorg.inc: enable xmlto
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jul 2014 18:53:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

The commit log needs to be way more detailed. Without a reasoning this
just increases build time so for now, NAK!

On Tue, Jul 8, 2014 at 6:48 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
> [YOCTO #2416]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
> index b9b9ac4..ac76b01 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -25,7 +25,7 @@ inherit autotools pkgconfig
>
>  PROTO_DEPS =3D "randrproto renderproto fixesproto damageproto xextproto =
xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordpro=
to resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbprot=
o inputproto bigreqsproto xcmiscproto presentproto"
>  LIB_DEPS =3D "pixman libxfont xtrans libxau libxext libxdmcp libdrm libx=
kbfile libpciaccess openssl libgcrypt"
> -DEPENDS =3D "${PROTO_DEPS} ${LIB_DEPS} font-util"
> +DEPENDS =3D "${PROTO_DEPS} ${LIB_DEPS} font-util xmlto-native"
>
>  # Split out some modules and extensions from the main package
>  # These aren't needed for basic operations and only take up space:
> @@ -99,7 +99,7 @@ FILES_${PN}-module-libxf1bpp =3D "${libdir}/xorg/module=
s/libxf1bpp.so"
>  FILES_${PN}-module-libxf4bpp =3D "${libdir}/xorg/modules/libxf4bpp.so"
>
>  EXTRA_OECONF +=3D "--with-fop=3Dno \
> -                 --without-xmlto \
> +                 --with-xmlto \
>                   --with-pic \
>                   --disable-static \
>                   --disable-xinerama \
> --
> 1.8.1.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

