Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id D13437F93B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:08:11 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id k12so417945uan.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NQby9XC5PK7b6zpw4IbHwGYm9HI8MkW4IgZRhkzOuSs=;
	b=B7HgSO0DXetwuJm16dAdgYnh10YjsBrG+nJevrzkJKwCskQjRPT26BrUvB2jd5NHn/
	ALT9JpeLw+QgIh2A5CFMBVCIX+y55FmAFNsW5XYbrSHqtxSxchv6PWNIDAetDfzxI3TJ
	lAT+8PjJG6fXIw9471DcmHamFOBq0AYF+oINIwlt8RmgmR4/5zu4i6aL+xO6iVy/uvv+
	ovNoenqMOn+clBm/Gl5O65UHV4Z3G0O7x4xPWaYh1wcTEpDbxg6OPv355jlcUKeJw11P
	nRMwQgTIAyTcKW3kdw0sTLwJFNUFt9jEV7GrIvvIWpVnyIJoVRbBb5OxnpV4g7IoK96w
	QGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NQby9XC5PK7b6zpw4IbHwGYm9HI8MkW4IgZRhkzOuSs=;
	b=Y0aTAvioX7HJApdCWg0Ifjh2yDy8iL/CgXyDcuLS0t/4Cs+DlLlUkp4YoMoWuneSta
	8fUoUIjQosaTr7solnkY9z/NKCn5VoC8NmkqS8y7vZPgRn3VnXI+mnNYXfqbgioHgIQQ
	skwayeAhawLbvbGU6L8lHqR3AWGeMML7WSOnbAWF2ZMIH4D3NHCRWpI2ZTMJDaqAR8QS
	W695qB4u7IYNOzRa7Oj586/et4BaUQKxuUC7blCRp6UAKUmMFpLosAkjpMb4i3k6gH2x
	6apeEk6ZEDhdcVakMP/JJS3aJlihPakAepKQTnMB4jNbs3C6VAEq76LZv9L1F3jwudCi
	vyeg==
X-Gm-Message-State: APjAAAV2geuNkJRWhyR2c+Zx2tvS3ALwG7RyPBWcAFvBitKgaoY+hCnI
	Z4Ae/sYO+J9MZQ8VcD0OKfKEC9xJ3kNFWbLUu/c=
X-Google-Smtp-Source: APXvYqwyg+7E1ld+JY9PegqBuAtSOCEQjIjHorTVaXcixwpOctEllt9OEAhOivnz0W03zBKwwN7rUgFOZQcIDFtOV9A=
X-Received: by 2002:a9f:3f06:: with SMTP id h6mr212320uaj.106.1568671692638;
	Mon, 16 Sep 2019 15:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190916192429.27294-1-armccurdy@gmail.com>
	<20190916192429.27294-4-armccurdy@gmail.com>
	<0a559d39-3699-4504-addc-89fe7252fbea@Spark>
In-Reply-To: <0a559d39-3699-4504-addc-89fe7252fbea@Spark>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 16 Sep 2019 15:08:01 -0700
Message-ID: <CAJ86T=UOKYMh-r1kmO2xjyu6aKDe1E3x8MVOd6J96qCfUNo_yA@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] ffmpeg: don't rely on configure to correctly detect ARM vfp or neon
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
X-List-Received-Date: Mon, 16 Sep 2019 22:08:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 2:33 PM Christopher Larson <kergoth@gmail.com> wrot=
e:
>
> This seems like something that could do with a =E2=80=98why=E2=80=99 in t=
he commit message and/or comments, to me.

To be consistent with:

  https://git.openembedded.org/openembedded-core/commit/?id=3D1a563214caf6b=
d5b3a026ebe953f8c692ebd640a

> On Sep 16, 2019, 12:25 PM -0700, Andre McCurdy <armccurdy@gmail.com>, wro=
te:
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_4.2.bb
> index 307e37e3fe..c4261248b6 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
> @@ -114,10 +114,19 @@ EXTRA_OECONF =3D " \
> --pkg-config=3Dpkg-config \
> "
>
> +# Do not trust configure to determine if ARM vfp or neon are available.
> +#
> +EXTRA_OECONF_ARM =3D " \
> + ${@bb.utils.contains('TUNE_FEATURES','vfp','--enable-vfp','--disable-vf=
p', d)} \
> + ${@bb.utils.contains("TUNE_FEATURES",'neon','--enable-neon','--disable-=
neon',d)} \
> +"
> +EXTRA_OECONF_append_arm =3D " ${EXTRA_OECONF_ARM}"
> +EXTRA_OECONF_append_armeb =3D " ${EXTRA_OECONF_ARM}"
> +
> EXTRA_OECONF_append_linux-gnux32 =3D " --disable-asm"
> +
> # gold crashes on x86, another solution is to --disable-asm but thats mor=
e hacky
> # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
> -
> LDFLAGS_append_x86 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-go=
ld', ' -fuse-ld=3Dbfd ', '', d)}"
>
> do_configure() {
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

