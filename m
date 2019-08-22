Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id F3E387F274
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 16:50:55 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id u190so5767659qkh.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0ksyAFd424gmph5H9JuC4wm/TXgSTGaPO/wtQ8O+SDs=;
	b=JEw83GdrrYmGMkOgS5C7o2WObkehgiAePf8My9FvD3RYxOYts/ESM8UTqbPQiCXhQN
	OOFNC2CkYG4/WKLjagZfPe/1yZoTQzAlXa6COF1v38mJrZi4jtQOH/79WkXY2ArDXTBl
	DRJjnl5UdPcuL0hYWgrPzrYPQ3p1lgNnbWFd60Jc1uwmtLhTOpSA1KaWJleNa+vxLkxV
	8ErjZoVy6dqUe7DVtMNtHWnG1S7XkMAueZREsIneCZvKhJqTJwpP1Z5CMu4laKp2HFCT
	8QQZathbKo6Dt0ypzbKq4ht0LAvNRBlFn3PV8cPs4kfGegm2VeFvnpOxZuyii9QtOLlM
	/djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0ksyAFd424gmph5H9JuC4wm/TXgSTGaPO/wtQ8O+SDs=;
	b=CvsHLOA5UiOExcdNYFKmA4ZWbEJzNJ3oCsQQ7HJGsKglRR2/rplVsRt6fUHevu0xCw
	DlPK/CnJVPVfaPeNtRj+PhdFTYcktyyTzECsaUhOzr+LynxwTYchTKWJsiaKgn1S1Nss
	B6twPZxAV3yW+jNaIicbmJ/vnvnsQtDmAcFPbowv8nFGurHi7FYOX1Ivp9VkdD6+LTl2
	7/lim4qPosgkheHIEouxtXnkjFuaQ4y5AQ7/o0JTyceJ2JYro7g3Py2zlSqd+MqnB9uP
	VXbEht5GN9igH0vayBX/N1pXRYCaxdDJ/QaH0+WYM6BrYkG5q5BlVRTwqTkwg7ZakeCp
	curw==
X-Gm-Message-State: APjAAAUUcxfFX4roKrmOO5Nf0WSbAAnWib/BbV6LgWiEXuoz2Ug2zpEF
	OJnWvwvLsOhSdEqeejqEmUgVL1VfBhKF2+4mM9U=
X-Google-Smtp-Source: APXvYqwWf7GaxhfMQliriBEuLBqpruTbhr6D2LUU5kG8scCsm+ogvfvJKNmFwUAXrz2uEqvP/H4qx4ijtgPifE+sSfo=
X-Received: by 2002:a37:b245:: with SMTP id b66mr30936148qkf.337.1566492656486;
	Thu, 22 Aug 2019 09:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190822164414.1488-1-maxime.roussinbelanger@gmail.com>
In-Reply-To: <20190822164414.1488-1-maxime.roussinbelanger@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Aug 2019 09:50:45 -0700
Message-ID: <CAMKF1sqcEQmHjyoBwSe+01i7TSVKn9sMYy64CofUNSZHEpWpkQ@mail.gmail.com>
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH] libedit: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Thu, 22 Aug 2019 16:50:56 -0000
Content-Type: multipart/alternative; boundary="000000000000554f210590b77efb"

--000000000000554f210590b77efb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please send this patch to Oe-devel
Mailing list

On Thu, Aug 22, 2019 at 9:44 AM Maxime Roussin-B=C3=A9langer <
maxime.roussinbelanger@gmail.com> wrote:

> To keep support of meta-clang support on thud branch.
> It depends on libedit native
> ---
>  meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
> b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
> index 8cc0e959e0..60f4f5a22b 100644
> --- a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
> +++ b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
> @@ -19,3 +19,5 @@ SRC_URI[md5sum] =3D "97679319742f45d6cdcd6075511b14ac"
>  SRC_URI[sha256sum] =3D
> "c41bea8fd140fb57ba67a98ec1d8ae0b8ffa82f4aba9c35a87e5a9499e653116"
>
>  S =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000554f210590b77efb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please send this patch to Oe-devel</div></div><div d=
ir=3D"auto">Mailing list=C2=A0</div><div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 22, 2019 at 9:44 AM Maxime R=
oussin-B=C3=A9langer &lt;<a href=3D"mailto:maxime.roussinbelanger@gmail.com=
">maxime.roussinbelanger@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">To keep support of meta-clang support on thud branch.<br>
It depends on libedit native<br>
---<br>
=C2=A0meta-oe/recipes-devtools/libedit/<a href=3D"http://libedit_20180525-3=
.1.bb" rel=3D"noreferrer" target=3D"_blank">libedit_20180525-3.1.bb</a> | 2=
 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-devtools/libedit/<a href=3D"http://libedit_201=
80525-3.1.bb" rel=3D"noreferrer" target=3D"_blank">libedit_20180525-3.1.bb<=
/a> b/meta-oe/recipes-devtools/libedit/<a href=3D"http://libedit_20180525-3=
.1.bb" rel=3D"noreferrer" target=3D"_blank">libedit_20180525-3.1.bb</a><br>
index 8cc0e959e0..60f4f5a22b 100644<br>
--- a/meta-oe/recipes-devtools/libedit/<a href=3D"http://libedit_20180525-3=
.1.bb" rel=3D"noreferrer" target=3D"_blank">libedit_20180525-3.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/libedit/<a href=3D"http://libedit_20180525-3=
.1.bb" rel=3D"noreferrer" target=3D"_blank">libedit_20180525-3.1.bb</a><br>
@@ -19,3 +19,5 @@ SRC_URI[md5sum] =3D &quot;97679319742f45d6cdcd6075511b14a=
c&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c41bea8fd140fb57ba67a98ec1d8ae0b8ffa82f4=
aba9c35a87e5a9499e653116&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000554f210590b77efb--
