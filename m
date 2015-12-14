Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id F07E76FF56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:20:42 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id mv3so80422428igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 04:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2qi04M4M8nfMdBzmB2XYLfpFttqndOHy6ZIrUXgn5Kw=;
	b=TARHmZuOvt7SwXyLY1c6wam02k2cKwsbyaOcrale8n0rk/q2p3rrN6xIii/bfXtbRk
	Om3/hU9mXatbsTrbXWz+ejFB4IqGh/gO5FuUjGSFsaro2xiGdZygfNO0dqva7AgakK4w
	evzWhGQt3N6WrXc9oSSE2zIzE7ZimeX4GpKu5gaREiGBVRbP9gyfkczlD1qLFWQxcUj8
	GXwrHYKwvulFZHJBx5yE+6qk5a9sUUXQhVPW51QWqBaVh4xLfVeolvjFOXdjlq05iv0T
	YgrQq5Ax7Z/nyPtpsouxoBoQDr8+xVC/ERlhcqXI/2ci4TFAi+YvxcsPXgN8jvO4JZsh
	O7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2qi04M4M8nfMdBzmB2XYLfpFttqndOHy6ZIrUXgn5Kw=;
	b=UOx3FwxUav4Nw3BxwPqtUVl0SRMCpCEOKGolL9TaZ8Q5JNugMwI2R5672E8Ye9dFvt
	XhPFEWIdF6eSD0YjpeNK88X8PK0gv9LE049wkc/Vg+qviZcnm+0WJODCXikS7hPqPCe3
	evevnO4IXd1W8B6AcXyQMzNnMnI/DW30joUsWxotJYicy8twxz98zyqfrKh0mRTa1+Ai
	VkGHGETsv846YiIeYG4EzPiRF8ciqtd1iUivRp9Hodw5zq2XJ4+OJ7zJs45nZkHas3nw
	KtsfGdGAO2GYU3j3AW/feYVxT6uRq+ty97ArdGEj+qjFdnvrmyV5frssG2H+qxDp6i6L
	SRhg==
X-Gm-Message-State: ALoCoQlWwiFvirUU6Q84qsk57IpXuwSeQUMZ/JcbAv3k4OBqjrKfvpypUUttdAkJ5UwBIkhZFvpJp+mu6AcE7GetWPxluYjOE1ltG5Nul/WYMn3WrATQRh4=
X-Received: by 10.50.7.71 with SMTP id h7mr7520632iga.64.1450095642809; Mon,
	14 Dec 2015 04:20:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 14 Dec 2015 04:20:23 -0800 (PST)
In-Reply-To: <2ae1ec09a656b0401bdc399ac0b8fb7d488c4106.1450073907.git.raj.khem@gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
	<2ae1ec09a656b0401bdc399ac0b8fb7d488c4106.1450073907.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Dec 2015 12:20:23 +0000
Message-ID: <CAJTo0LaXYu8epz1WaQCbOB0JLrvChOS8o2LADQWcjwpx4vCxnA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] uclibc: Switch to using uclibc-ng
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
X-List-Received-Date: Mon, 14 Dec 2015 12:20:45 -0000
Content-Type: multipart/alternative; boundary=e89a8f642ed4ae33890526dab336

--e89a8f642ed4ae33890526dab336
Content-Type: text/plain; charset=UTF-8

On 14 December 2015 at 06:23, Khem Raj <raj.khem@gmail.com> wrote:

> diff --git a/meta/recipes-core/uclibc/uclibc_git.bb
> b/meta/recipes-core/uclibc/uclibc_git.bb
> index fd02b3d..81756ac 100644
> --- a/meta/recipes-core/uclibc/uclibc_git.bb
> +++ b/meta/recipes-core/uclibc/uclibc_git.bb
> @@ -13,6 +13,11 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
>             linux-libc-headers ncurses-native \
>             libgcc-initial kern-tools-native"
>
> +#do_compile_prepend () {
> +#  unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +#  oe_runmake pregen
> +#}
> +#
>

Was this for testing?  Presumably I can drop it?

Ross

--e89a8f642ed4ae33890526dab336
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 December 2015 at 06:23, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":33d" class=3D"a3s" st=
yle=3D"overflow:hidden">diff --git a/meta/recipes-core/uclibc/<a href=3D"ht=
tp://uclibc_git.bb" rel=3D"noreferrer" target=3D"_blank">uclibc_git.bb</a> =
b/meta/recipes-core/uclibc/<a href=3D"http://uclibc_git.bb" rel=3D"noreferr=
er" target=3D"_blank">uclibc_git.bb</a><br>
index fd02b3d..81756ac 100644<br>
--- a/meta/recipes-core/uclibc/<a href=3D"http://uclibc_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">uclibc_git.bb</a><br>
+++ b/meta/recipes-core/uclibc/<a href=3D"http://uclibc_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">uclibc_git.bb</a><br>
@@ -13,6 +13,11 @@ DEPENDS =3D &quot;virtual/${TARGET_PREFIX}binutils \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-libc-headers ncurses-native=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcc-initial kern-tools-native&=
quot;<br>
<br>
+#do_compile_prepend () {<br>
+#=C2=A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS<br>
+#=C2=A0 oe_runmake pregen<br>
+#}<br>
+#</div></blockquote></div><br>Was this for testing?=C2=A0 Presumably I can=
 drop it?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--e89a8f642ed4ae33890526dab336--
