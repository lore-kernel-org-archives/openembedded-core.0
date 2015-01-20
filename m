Return-Path: <ross.burton@intel.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id F36AB65CAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 21:19:52 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id ge10so15718891lab.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 13:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6Wq7nAAdNYAyy/d96acyB9edzZQd3rrC1oz6uvzFn4U=;
	b=Q4cQygca87d2cFbj/6yyL+evwDPFbnlCj1ALWgT8CYP4vqi69SalGMGlcRovqLIPxz
	kt2zSZkcUXIomkaP+5foA+upgKfI02KAmynK39U3OSdkEayw+SvrdKOHL0mGYjKhWbfM
	sIcLYJvqQfOgjaZb7FphFzf4PdHh3GqRr03KEEXkUgpDu86vFXG6rtTcZ7oMribtV95C
	FAIKRG2hIotZprQvYrvctyniOEWixwNGAejudrNR/AgmbV0e54kgdJMiv49q5s5sIx0R
	CpRYTN2oVgwCNJcpk6bvE+dMqC2UviobF8UMzar8XiB1bPZ1CisSHMYIipqIPMwE4JMr
	jRPw==
X-Gm-Message-State: ALoCoQnaZAGYbJtWGkPD/t+COO3f02Nf7oHnxELUvbNEZAD/BsnRI3PoQ1VXqjqSsU+DKJKRFnAH
X-Received: by 10.152.5.198 with SMTP id u6mr41467715lau.42.1421788792861;
	Tue, 20 Jan 2015 13:19:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.223.164 with HTTP; Tue, 20 Jan 2015 13:19:32 -0800 (PST)
In-Reply-To: <1418221117-12710-4-git-send-email-Martin.Jansa@gmail.com>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
	<1418221117-12710-4-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Jan 2015 21:19:32 +0000
Message-ID: <CAJTo0LamxpYW0uHzTRTjyJZgw7_meZbx5L=2mZ_LwdzRcv-vkg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/4] recipes-qt: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Tue, 20 Jan 2015 21:19:53 -0000
Content-Type: multipart/alternative; boundary=089e013d1b6ef1cb69050d1bff73

--089e013d1b6ef1cb69050d1bff73
Content-Type: text/plain; charset=UTF-8

On 10 December 2014 at 14:18, Martin Jansa <martin.jansa@gmail.com> wrote:

> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -8,6 +8,9 @@ DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft
> libxext libxrender li
>  PROVIDES += "qt4-x11"
>  QT4DEPENDS = ""
>
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
>

Isn't that redundant as qt4x11 already sets REQUIRED_DISTRO_FEATURES?

Also, if setting REQURED_DISTRO_FEATURES in a class, using += or _append
seems like a sensible idea for future-proofing.

Ross

--089e013d1b6ef1cb69050d1bff73
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 December 2014 at 14:18, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4ig" clas=
s=3D"a3s" style=3D"overflow:hidden">+++ b/meta/recipes-<span class=3D"il">q=
t</span>/qt4/qt4-<span class=3D"il">x11</span>-free.inc<br>
@@ -8,6 +8,9 @@ DEPENDS +=3D &quot;virtual/libgl virtual/libx11 fontconfig =
libxft libxext libxrender li<br>
=C2=A0PROVIDES +=3D &quot;qt4-<span class=3D"il">x11</span>&quot;<br>
=C2=A0QT4DEPENDS =3D &quot;&quot;<br>
<br>
+# depends on virtual/libx11<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;<span class=3D"il">x11</span>&quot;<br>
+=C2=A0</div></blockquote></div><br>Isn&#39;t that redundant as qt4x11 alre=
ady sets REQUIRED_DISTRO_FEATURES?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Also, if setting REQURED_DISTRO_FEATURES in a =
class, using +=3D or _append seems like a sensible idea for future-proofing=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--089e013d1b6ef1cb69050d1bff73--
