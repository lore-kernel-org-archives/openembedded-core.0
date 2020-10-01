Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web10.4835.1601525722607207300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 21:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [192.168.10.3] (unknown [112.10.158.45])
	by kozue.soulik.info (Postfix) with ESMTPSA id 47F4C100BF1;
	Thu,  1 Oct 2020 13:14:08 +0900 (JST)
Subject: Re: [PATCH] meson: add sysroot property
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20200930150545.3882859-1-ayaka@soulik.info>
 <CANNYZj85ymSHGvm5E7Axtrs6B6-V4nQGCFzcCVJKCM0=wsPtkg@mail.gmail.com>
From: "Randy Li" <ayaka@soulik.info>
Message-ID: <34ad6791-d6db-4f37-a804-36df55b3472e@soulik.info>
Date: Thu, 1 Oct 2020 12:14:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj85ymSHGvm5E7Axtrs6B6-V4nQGCFzcCVJKCM0=wsPtkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 01/10/2020 00:40, Alexander Kanavin wrote:
> Wait, how does=C2=A0it work in native meson then?
>
It is the nativesdk meson has this problem, that is what cross build=20
requests for.

You can try the Intel MediaSDK, I reported this issue to Gstreamer for=20
this but it comes to the issue of OE.

Or you mean the native meson for the target system ? I don't think they=20
need a cross build file.

> Alex
>
> On Wed 30. Sep 2020 at 17.06, ayaka <ayaka@soulik.info=20
> <mailto:ayaka@soulik.info>> wrote:
>
>     I know the environment setup script would set PKG_CONFIG_PATH,
>
>     but the meson won't take that env when translate the includedir
>
>     property from the pkg-config.
>
>
>
>     Signed-off-by: ayaka <ayaka@soulik.info <mailto:ayaka@soulik.info>>
>
>     ---
>
>     =C2=A0meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
>     <http://nativesdk-meson_0.55.1.bb> | 1 +
>
>     =C2=A01 file changed, 1 insertion(+)
>
>
>
>     diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
>     <http://nativesdk-meson_0.55.1.bb>
>     b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
>     <http://nativesdk-meson_0.55.1.bb>
>
>     index 67add2c25e..7fdc4c86d9 100644
>
>     --- a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
>     <http://nativesdk-meson_0.55.1.bb>
>
>     +++ b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
>     <http://nativesdk-meson_0.55.1.bb>
>
>     @@ -40,6 +40,7 @@ c_args =3D @CFLAGS
>
>     =C2=A0c_link_args =3D @LDFLAGS
>
>     =C2=A0cpp_args =3D @CPPFLAGS
>
>     =C2=A0cpp_link_args =3D @LDFLAGS
>
>     +sys_root =3D @OECORE_TARGET_SYSROOT
>
>
>
>     =C2=A0[host_machine]
>
>     =C2=A0system =3D '${SDK_OS}'
>
>     --=20
>
>     2.25.4
>
>
>
