Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF526C444
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 15:38:15 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id q8so11029206qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 07:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sn8Isd+6o0jPvXOzoeK3LndDRXjJ59eDjY2gJYEE2/k=;
	b=OktCfdopTsRiTRp8aZHgR7+e+71eV2mn90AD1qx5ZQ7RdhtiSriCVlznrMKtNwTdQA
	QE8TbagQB4TDVgkESn4ej+UHP34Z0rwhWYJkjO6FWQxqdLxLeBtOHXmLeAvTqYHd9VOn
	7uVFq2zBIa0mLYRmEgc88Uy5E9rscj+VzldDQuNv+26AFMN4XTKdeZ9gIy0s9zxSQcGF
	B6xNX+PrdyWLJTZRUDXrSE98bge3pOHqqWXBLKxWco0yNxO8BqpIkCmYhuNZa4VGGBXe
	5XvmZZkXFLI3r/i8b0ITbnXrr+kzWrbCNYSRf/EWH1KmV9bfQo1PTzvkux6gk0VmcIi6
	M2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sn8Isd+6o0jPvXOzoeK3LndDRXjJ59eDjY2gJYEE2/k=;
	b=Kg/1G4k1yc12h4CifFNE+2MncRRN6dkS5reVvgd/zcJGr192XQylBG4sOsor1TGIP4
	/3g83ZjWQzlR7N6aNP1zD0/jLxkTrbQbRsqV4lCdOAx9aKxzL75MwcwiAQ9sZjlIbvYc
	ycb+3jD6u7D+1A0yYRPg5ffFVCN9gvOyU8wUEbG0mMbm8p0NBsBJxvIfucBGFaGH00D+
	jSEYLn147ZfNM4IGr8w0J1/k8+dJkcPQ0RflLwDgRkHuYfG4BSzm4S5YAgaL6G1FDZHM
	95vOOd6YaWt+3AbOHVz0sHh1WE/HzAUEuZ/mq+en1YPU9qpZSIaownz49oE1BQy3T0oN
	X0/g==
X-Gm-Message-State: AJcUukdcH8A2jb10pIiSl/5Zdj6ccDwyRR0KWu7vaHl5cAXor0hiGi1M
	Ct1XyN3SlrGn6CsJ/uG69p2TMrcanzMmJaoBHBY=
X-Google-Smtp-Source: ALg8bN7YlnxshL6Esy9aqkFyE61iPhrVptE4wwAZTNUFeh/H1uol862IWtI4UL2lX8n47iTakd30FqhG4fE4eYBFReg=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr22571856qke.2.1545925096285; 
	Thu, 27 Dec 2018 07:38:16 -0800 (PST)
MIME-Version: 1.0
References: <CAE7Z+X0fWR4LtY+iCPGqsGX8atqK+W42SL+MCha1jcjtyt-DHg@mail.gmail.com>
In-Reply-To: <CAE7Z+X0fWR4LtY+iCPGqsGX8atqK+W42SL+MCha1jcjtyt-DHg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Dec 2018 07:37:50 -0800
Message-ID: <CAMKF1sr0fWaO1EFUWR-_SF3g9mxoyipXyd-4p_WuY1kt3AH5nw@mail.gmail.com>
To: sungwon kim <sungwon.pino@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Thu, 27 Dec 2018 15:38:15 -0000
Content-Type: multipart/alternative; boundary="00000000000036a96f057e02bc39"

--00000000000036a96f057e02bc39
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 27, 2018 at 7:25 AM sungwon kim <sungwon.pino@gmail.com> wrote:

> Got errors when building SDK. Unable to find bison.
> To fix this issue add bison-native.
>
>
this is ok

> Signed-off-by: pino-kim <sungwon.pino@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> index 475e4f08ef..4977a66c32 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -5,7 +5,7 @@ SUMMARY = "GNU debugger (cross-canadian gdb for
> ${TARGET_ARCH} target)"
>  PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>  BPN = "gdb"
>
> -DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
> +DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext
> bison-native \
>             virtual/${HOST_PREFIX}gcc-crosssdk
> virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"
>
>  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
> --
> 2.17.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000036a96f057e02bc39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace"><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr">On Thu, Dec 27, 2018 at 7:25 AM sungwon kim &lt;<a href=
=3D"mailto:sungwon.pino@gmail.com">sungwon.pino@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div>Got errors when building SDK. Unable to find bison.<br></div><div>To fi=
x this issue add bison-native.</div><div><br></div></div></blockquote><div>=
<br></div><div class=3D"gmail_default" style=3D"font-family:monospace,monos=
pace">this is ok</div><div class=3D"gmail_default" style=3D"font-family:mon=
ospace,monospace"></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div></div><div>Signed-off-by: pino-kim &lt;<a href=3D"mail=
to:sungwon.pino@gmail.com" target=3D"_blank">sungwon.pino@gmail.com</a>&gt;=
</div><div>---</div><div>=C2=A0meta/recipes-devtools/gdb/gdb-cross-canadian=
.inc | 2 +-</div><div>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)</=
div><div><br></div><div>diff --git a/meta/recipes-devtools/gdb/gdb-cross-ca=
nadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc</div><div>ind=
ex 475e4f08ef..4977a66c32 100644</div><div>--- a/meta/recipes-devtools/gdb/=
gdb-cross-canadian.inc</div><div>+++ b/meta/recipes-devtools/gdb/gdb-cross-=
canadian.inc</div><div>@@ -5,7 +5,7 @@ SUMMARY =3D &quot;GNU debugger (cros=
s-canadian gdb for ${TARGET_ARCH} target)&quot;</div><div>=C2=A0PN =3D &quo=
t;gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}&quot;</div><div>=C2=A0BPN =
=3D &quot;gdb&quot;</div><div>=C2=A0</div><div>-DEPENDS =3D &quot;nativesdk=
-ncurses nativesdk-expat nativesdk-gettext \</div><div>+DEPENDS =3D &quot;n=
ativesdk-ncurses nativesdk-expat nativesdk-gettext bison-native \</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtual/${HOST_PREFIX}gcc-crosss=
dk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc&quot;</di=
v><div>=C2=A0</div><div>=C2=A0GDBPROPREFIX =3D &quot;--program-prefix=3D&#3=
9;${TARGET_PREFIX}&#39;&quot;</div><div class=3D"gmail-m_858456388936656046=
2gmail-yj6qo gmail-m_8584563889366560462gmail-ajU" style=3D"outline:none;pa=
dding:10px 0px;width:22px;margin:2px 0px 0px"><div id=3D"gmail-m_8584563889=
366560462gmail-:5c" class=3D"gmail-m_8584563889366560462gmail-ajR" style=3D=
"background-color:rgb(232,234,237);border:none;clear:both;line-height:6px;o=
utline:none;width:24px;border-radius:5.5px"><img class=3D"gmail-m_858456388=
9366560462gmail-ajT" style=3D"background: url(&quot;&quot;) 50% 50% / 20px =
no-repeat; height: 11px; opacity: 0.54; width: 24px;"></div></div><span cla=
ss=3D"gmail-m_8584563889366560462gmail-HOEnZb gmail-m_8584563889366560462gm=
ail-adL"><font color=3D"#888888"><div>--=C2=A0</div><div>2.17.1</div></font=
></span></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000036a96f057e02bc39--
