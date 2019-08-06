Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 221D47ED64
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 21:55:18 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u14so42253001pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 14:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=vD6Zt3kv8d68IGl1OaFmkvfb4OXm3gJzB/fbVzUcb4s=;
	b=EadVuhCPNumV/W6gsGqCFlf8wCChuDcYGQouFb4jOdPk4ejr8jFWkyiF8hKUkFbkeF
	vkDsbqzLvIBqA9HMmCO5OoaCU0Xs6L4pn5FVMmbTBCIoysruPngGKioXar0vBIjLop3Q
	8X6Lt8HNTiAtL+5Lmfv5LieecICYj5vIUwLK16jqev1GTKkytE+sv0hB58E6XbcntqQF
	r8qIMTYnaCe5JGG5C+Q8VPYJktroqSk6NtZUW7hmxgNpH3l3ecHEtjiMGieu9U/JyfwK
	eD90wwnFeKlBUyYXbFJYpTzmogJpeZgJU01LtuK/tyyN3x6Gt5E3Ls+OAej4HkGgo3p6
	Rp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=vD6Zt3kv8d68IGl1OaFmkvfb4OXm3gJzB/fbVzUcb4s=;
	b=iB3NXylo9yTsKi146ZnI28QVfTRMVPcZozLBKibekxZPO0thPEp/PWwv9IP50+jAdZ
	kd56nDHhPacaj4GeNPw2k1FiFdswvkFM7pUrcP3cdHMIdlNEv4MoCRudqeA/+6ry0XEr
	MqGL8GjmrzJL76BIPEXZom7BnrfwDRfD1qVUOdfDI5WavNxYNFJ/cXRbpR6Xecl9kQ5r
	/RaT9WTHMYP4P7AfzxX/GciCmU4upgHVhPWvQLVGDt1XI+4DMF11gUUW1Fodw8KCGiTL
	NG0JHXO9pW2Nr5wcLGqidj+GtHdRek3F/7Yd4RNaoS90rsdxBpC+yoZhRzRyonJwZDrH
	7oqw==
X-Gm-Message-State: APjAAAUSk3GlxvQO/LOrsJGhLi2Ikgw27GcUFY5JN3VD6XFH2+1kL/GP
	AKq7a+FqXIGwH8ZDIlKESD3oq59+Mio=
X-Google-Smtp-Source: APXvYqwdNO8W7rIY6krsVooXmSZyWVKZr8r5aCovstw0yx3BIKkOdRLmQ3yQmZw42YeNzSbMpA+Qsg==
X-Received: by 2002:a17:90a:bf02:: with SMTP id
	c2mr5266390pjs.73.1565128519736; 
	Tue, 06 Aug 2019 14:55:19 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::baaf? ([2601:646:8500:6bc6::baaf])
	by smtp.gmail.com with ESMTPSA id
	o128sm94767598pfb.42.2019.08.06.14.55.17
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 14:55:19 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190806213951.13098-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <0b374ac5-afff-3f93-1329-8d4bde5fe43f@gmail.com>
Date: Tue, 6 Aug 2019 14:55:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806213951.13098-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] gstreamer: Add fix for glibc 2.30
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
X-List-Received-Date: Tue, 06 Aug 2019 21:55:19 -0000
X-Groupsio-MsgNum: 127609
Content-Type: multipart/mixed; boundary="------------48E41EB828B1F83D6EC7750B"
Content-Language: en-US

--------------48E41EB828B1F83D6EC7750B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 8/6/19 2:39 PM, Richard Purdie wrote:
> Fix a header overlap/redefinition issue with glibc 2.30.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../gstreamer1.0-plugins-good/headerfix.patch | 43 +++++++++++++++++++=

>  .../gstreamer1.0-plugins-good_1.16.0.bb       |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plug=
ins-good/headerfix.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d/headerfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/headerfix.patch
> new file mode 100644
> index 00000000000..34d25a0a49e
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/heade=
rfix.patch
> @@ -0,0 +1,43 @@
> +Things break with overlapping defines between glib and gstreamer with =
glibc 2.30.
> +
> +Discussion in the link below, basically internal __ prefixed variables=
=20
> +shouldn't be redefined.
> +

this fix is good.


> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/g=
st-plugins-good/issues/635]
> +RP 2019/8/6
> +
> +Index: gst-plugins-good-1.16.0/sys/v4l2/ext/types-compat.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gst-plugins-good-1.16.0.orig/sys/v4l2/ext/types-compat.h
> ++++ gst-plugins-good-1.16.0/sys/v4l2/ext/types-compat.h
> +@@ -24,29 +24,6 @@
> + #ifndef __TYPES_COMPAT_H__
> + #define __TYPES_COMPAT_H__
> +=20
> +-/* From linux/types.h */
> +-#ifndef __bitwise__
> +-#  ifdef __CHECKER__
> +-#    define __bitwise__ __attribute__((bitwise))
> +-#  else
> +-#    define __bitwise__
> +-#  endif
> +-#endif
> +-
> +-#ifndef __bitwise
> +-#  ifdef __CHECK_ENDIAN__
> +-#    define __bitwise __bitwise__
> +-#  else
> +-#    define __bitwise
> +-#  endif
> +-#endif
> +-
> +-#define __u64 guint64
> +-#define __u32 guint32
> +-#define __u16 guint16
> +-#define __u8 guint8
> +-#define __s64 gint64
> +-#define __s32 gint32
> +-#define __le32 guint32 __bitwise
> ++#include <linux/types.h>
> +=20
> + #endif /* __TYPES_COMPAT_H__ */
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good=
_1.16.0.bb
> index ad831ed25ce..5751467db13 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.=
0.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.=
0.bb
> @@ -4,6 +4,7 @@ SRC_URI =3D " \
>              http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-=
plugins-good-${PV}.tar.xz \
>              file://0001-scaletempo-Advertise-interleaved-layout-in-cap=
s-temp.patch \
>              file://0001-introspection.m4-prefix-pkgconfig-paths-with-P=
KG_CON.patch \
> +            file://headerfix.patch \
>              "
> =20
>  SRC_URI[md5sum] =3D "d1a7b442994d9522418de4af4330e034"

--------------48E41EB828B1F83D6EC7750B
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------48E41EB828B1F83D6EC7750B--
