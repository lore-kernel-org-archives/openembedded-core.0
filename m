Return-Path: <kergoth@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2524D7F87E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 21:33:57 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z12so715360pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 14:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:message-id:in-reply-to:references:subject:mime-version; 
	bh=daunIhoE2Mt3NpUJ6cJ6RAChe7h23lyUmlTTU4rs8l4=;
	b=kiiH6zn+ukUp0KuLmyGKvI8ZW7bleBE0ftk1rTcUsdiQFp25qwXuZA3yUzyvr7OeAF
	y6KFgwVbxombH2Jb9Zyuhybl6e7XHTfG58Yb3Tt1nSoeCh2fqkH5FfLWuQwi4B6axYme
	Z6KkoxiG2OQK7kHhtE4WxHCQ4eH9cmhFZBcHJA3hbnr37PjHuiDi6895vLNR8guOq4sj
	QZLnxoAwE7s9Owf3REAh8G4JHsA3F+87cYzvJoVhO/9nkMZF0dGEYWhIVH8w101xIFGq
	jQmY5XqUVnkQKXWsfRF8q8cvnYo5udpGX0aMJm0yI9tS7lgS6160TEA9WKLReIGKqMYr
	SVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:message-id:in-reply-to:references
	:subject:mime-version;
	bh=daunIhoE2Mt3NpUJ6cJ6RAChe7h23lyUmlTTU4rs8l4=;
	b=Al8aMZ8kQPdfE5cEDMl9P/tkp1KixgHfOQojrBclr8Cdn9XPa8qGC0e99hV+/OX9Vc
	d7K/nCtDfn/CIcm8joB3+0hJXYWqUzLlFHr6wx4f0aaxAuCy5P2paT2cm4aoovSLDlcl
	KLWbey6mMZyrnMmjqRRZoILeiRBDMv+7n/eUW4u0O0HCTxSvKrPZoh32On9QkEPUGH3K
	PKmikAGUWk+5g3TWfKIz4cItj91ix3H4sN1qyTPQzVuiF7t591rGCWYM8I8f92bE4LR+
	bXNwp6xG6pYMlfBqMAnkdO4YJTnFNM5kvHFeiVWAijjHAOCqmRniVGxUNCJqYbwlgVQS
	lYjQ==
X-Gm-Message-State: APjAAAXkSFPYkYo7J7jNvCimXUeP4lKTklbEy2QyngFo+s5gxNpdra1Z
	BWjbFaIiclX3HPZAFvIeFZKDicoKy9s=
X-Google-Smtp-Source: APXvYqyPn7lMTXDgtn0xNjY237i/8ba0SMrRERW61LeB4dPnKcRK0W9ZnrtaE+G7PgUbrHX53boReQ==
X-Received: by 2002:a63:4c64:: with SMTP id m36mr222829pgl.229.1568669638616; 
	Mon, 16 Sep 2019 14:33:58 -0700 (PDT)
Received: from [192.168.1.17] (ip70-180-21-74.ph.ph.cox.net. [70.180.21.74])
	by smtp.gmail.com with ESMTPSA id x23sm30084pfq.140.2019.09.16.14.33.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Sep 2019 14:33:57 -0700 (PDT)
Date: Mon, 16 Sep 2019 14:33:46 -0700
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org, Andre McCurdy
	<armccurdy@gmail.com>
Message-ID: <0a559d39-3699-4504-addc-89fe7252fbea@Spark>
In-Reply-To: <20190916192429.27294-4-armccurdy@gmail.com>
References: <20190916192429.27294-1-armccurdy@gmail.com>
	<20190916192429.27294-4-armccurdy@gmail.com>
X-Readdle-Message-ID: 0a559d39-3699-4504-addc-89fe7252fbea@Spark
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 16 Sep 2019 21:33:58 -0000
Content-Type: multipart/alternative; boundary="5d7fffc4_327b23c6_4c9b"

--5d7fffc4_327b23c6_4c9b
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

This seems like something that could do with a =E2=80=98why=E2=80=99 in t=
he commit message and/or comments, to me.
On Sep 16, 2019, 12:25 PM -0700, Andre McCurdy <armccurdy=40gmail.com>, w=
rote:
> Signed-off-by: Andre McCurdy <armccurdy=40gmail.com>
> ---
> meta/recipes-multimedia/ffmpeg/ffmpeg=5F4.2.bb =7C 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg=5F4.2.bb b/meta/reci=
pes-multimedia/ffmpeg/ffmpeg=5F4.2.bb
> index 307e37e3fe..c4261248b6 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg=5F4.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg=5F4.2.bb
> =40=40 -114,10 +114,19 =40=40 EXTRA=5FOECON=46 =3D =22 =5C
> --pkg-config=3Dpkg-config =5C
> =22
>
> +=23 Do not trust configure to determine if ARM vfp or neon are availab=
le.
> +=23
> +EXTRA=5FOECON=46=5FARM =3D =22 =5C
> + =24=7B=40bb.utils.contains('TUNE=5F=46EATURES','vfp','--enable-vfp','=
--disable-vfp', d)=7D =5C
> + =24=7B=40bb.utils.contains(=22TUNE=5F=46EATURES=22,'neon','--enable-n=
eon','--disable-neon',d)=7D =5C
> +=22
> +EXTRA=5FOECON=46=5Fappend=5Farm =3D =22 =24=7BEXTRA=5FOECON=46=5FARM=7D=
=22
> +EXTRA=5FOECON=46=5Fappend=5Farmeb =3D =22 =24=7BEXTRA=5FOECON=46=5FARM=
=7D=22
> +
> EXTRA=5FOECON=46=5Fappend=5Flinux-gnux32 =3D =22 --disable-asm=22
> +
> =23 gold crashes on x86, another solution is to --disable-asm but thats=
 more hacky
> =23 ld.gold: internal error in relocate=5Fsection, at ../../gold/i386.c=
c:3684
> -
> LD=46LAGS=5Fappend=5Fx86 =3D =22=24=7B=40bb.utils.contains('DISTRO=5F=46=
EATURES', 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)=7D=22
>
> do=5Fconfigure() =7B
> --
> 2.23.0
>
> --
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Openembedded-core mailing list
> Openembedded-core=40lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--5d7fffc4_327b23c6_4c9b
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>This seems like something that could do with a =E2=80=
=98why=E2=80=99 in the commit message and/or comments, to me.</div>
</div>
<div name=3D=22messageReplySection=22>On Sep 16, 2019, 12:25 PM -0700, An=
dre McCurdy &lt;armccurdy=40gmail.com&gt;, wrote:<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =231abc9c;=22>Si=
gned-off-by: Andre McCurdy &lt;armccurdy=40gmail.com&gt;<br />
---<br />
meta/recipes-multimedia/ffmpeg/ffmpeg=5F4.2.bb =7C 11 ++++++++++-<br />
1 file changed, 10 insertions(+), 1 deletion(-)<br />
<br />
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg=5F4.2.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg=5F4.2.bb<br />
index 307e37e3fe..c4261248b6 100644<br />
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg=5F4.2.bb<br />
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg=5F4.2.bb<br />
=40=40 -114,10 +114,19 =40=40 EXTRA=5FOECON=46 =3D =22 =5C<br />
--pkg-config=3Dpkg-config =5C<br />
=22<br />
<br />
+=23 Do not trust configure to determine if ARM vfp or neon are available=
.<br />
+=23<br />
+EXTRA=5FOECON=46=5FARM =3D =22 =5C<br />
+ =24=7B=40bb.utils.contains('TUNE=5F=46EATURES','vfp','--enable-vfp','--=
disable-vfp', d)=7D =5C<br />
+ =24=7B=40bb.utils.contains(=22TUNE=5F=46EATURES=22,'neon','--enable-neo=
n','--disable-neon',d)=7D =5C<br />
+=22<br />
+EXTRA=5FOECON=46=5Fappend=5Farm =3D =22 =24=7BEXTRA=5FOECON=46=5FARM=7D=22=
<br />
+EXTRA=5FOECON=46=5Fappend=5Farmeb =3D =22 =24=7BEXTRA=5FOECON=46=5FARM=7D=
=22<br />
+<br />
EXTRA=5FOECON=46=5Fappend=5Flinux-gnux32 =3D =22 --disable-asm=22<br />
+<br />
=23 gold crashes on x86, another solution is to --disable-asm but thats m=
ore hacky<br />
=23 ld.gold: internal error in relocate=5Fsection, at ../../gold/i386.cc:=
3684<br />
-<br />
LD=46LAGS=5Fappend=5Fx86 =3D =22=24=7B=40bb.utils.contains('DISTRO=5F=46E=
ATURES', 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)=7D=22<br />
<br />
do=5Fconfigure() =7B<br />
--<br />
2.23.0<br />
<br />
--<br />
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br />
Openembedded-core mailing list<br />
Openembedded-core=40lists.openembedded.org<br />
http://lists.openembedded.org/mailman/listinfo/openembedded-core<br /></b=
lockquote>
</div>
</body>
</html>

--5d7fffc4_327b23c6_4c9b--
