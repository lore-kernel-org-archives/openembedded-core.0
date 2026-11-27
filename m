Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8251.1795740225738824718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kjiuYsbA;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c0bd676eeso5287132d50.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 16:43:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795740225; cv=none;
        d=google.com; s=arc-20260327;
        b=iWLpKOAo1fJVZZN8+8o3D2ECi18/EJ4YiMFF3Lu+CgWLGG/7t8Wa6LFEbvTYoSibgQ
         9PbBMLxVcRwy93EXaxqcAv2b1V8wVjRxZ+X7l37WswQuOzq096A5Ux5pktXIgwsGvCnm
         lf6U9QuNYD9Za9iblsOtXBJF1B1KLTNyPbkt3vTD5UCPmRRlk2u58oWc1FRwgmFaF/27
         I15sPSpnd2Bo38OkJckX71XCG9ANdaEBnHp713J53XkIkAlq5/GPmQOt4kZHOve4H4Z4
         01ixI3WzRFKUNVQaSnwTYMqYMW7fVqZBMcpZH6luGz7Y2rc3s5UAsxG2cALOWz4c3qsp
         sK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xqxeinUlXsNhZdAkOV2JrndegYZIk6NeoaL4mKrsuzo=;
        fh=AWwAWlfEKOzZV6TGFtAX82g/LCt1RjwB3huL/z+fmjs=;
        b=jwje63EskCN/8+XN2p8POGorN3bQblb0UawkHLsr/rhGChvX1t6AjrXUQsie2yJDlk
         NlfM8V1EVsuYRzD9P/TeLTqnXSLRLFwDjCEWrF8TUSCPeQbSdI4L2EXwI8brklRM77u0
         /vqQ38JgSRJB135wNmFubMdfHG8Aj6toV9oIwrtisgi7bb8p91Hm/QImFReBbf0VInAI
         0JnV/nWVtnZOW4sTP+GVMNTtUS3ninXUhJTmRt9hqz7KkvSv9lIfuoSKcml00B6pS+qC
         0gCPMIIq6X1Vh/qPSgJ/2S5F29mi/pC/aLRiaczOF1MhaIx8ELy4DzQfZxsFgjGoneWK
         0utw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795740225; x=1796345025; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqxeinUlXsNhZdAkOV2JrndegYZIk6NeoaL4mKrsuzo=;
        b=kjiuYsbAlwnLOfSPyBSAbhiqRFht2BLp7OjzFkr0NWPpOmiHzTSLQPTYsFks5ckeGZ
         FPS2/4AyuM8aTXf5GGdmsIEszdv+UfhcYoYtU9lj8G/jTMlIrjjsd2iwoNH3gsITyOMh
         jrl/iEVIVOj9/sVOIsu0mT9wrTKgX/aC8LKJdd6+s46xD1Nv+XTXiG9G9ZcVJ6Ma3UiB
         x2n/fW541ZVL6vGz4pjwy6VtzPo84M5+hE08QAUILAhIQrUm3/ZNvjyuaLMz7pAKwMAT
         R59LgsrH+ZPrPIuL18UXigEY9FNYHOEpWoTF64cxLg7MrCnMGqbnq3fUrXrPdqpg417t
         ZwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795740225; x=1796345025;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xqxeinUlXsNhZdAkOV2JrndegYZIk6NeoaL4mKrsuzo=;
        b=e+mWUXLOORrQAsV0F83HU8LuV7h9eLk4stMPKBz54aJSZW1feQaZiYZv7+LbVl0vnG
         ex0WEm7GMHXz+28mKA6azTbLtqlee8LkhMYvErRrWI0Hgxg/OUDfqJUoxElMUd0xBh8w
         wWnNDAKHuWAUUFOgQiYEYWxjeShDkg2a2ZlL6ucg0BjkDkeR+wnas7rz1nZALYifjivE
         QglBKhhyLyRvWwJwq19bxQd5s+CNY+X+K00kuemctQQGG8gMVmAfFhQVABIc2AzIP+Bm
         Xs7PO5zvkV51PfVcrJxPHV7MuWe39+YGp7Tpx4ISqcRfv4f0qvG/2PXb19uNFrMZLdv1
         kQFg==
X-Gm-Message-State: APuU4Z+bFQOaWEzmb/VHo63f7RDXRusQuWyJawpU6uOzRcLP3znjQten
	D/c/uN/WOFi/SIWFOoAOKNijIgl/Mrk2QBbUWiW1kayVoUPxil0QajWEnSt5iMcXyV7b7ccOSZM
	5+D+bwx8sdRpWC+IBeUc48T0A/amgnpI=
X-Gm-Gg: AZFdTZdEujz84lmrwQX/VT4kzIXW2Tvg0anBo6E2clmIkCpw6c17KWKQxJhA8sSaW7c
	1Zg8jAH2GxtBu6uCvCz2T+HhKZtMkZtM1P65eCVDFMkFjivit4OBzfLdVkV2zYHn581IkLCY30f
	/gWQP/gGvm15/a4fR4g6e1mwicZprdXPiMEjYCdFc6znV1ia/m1qrRZ9YdBsmUR+pG9OaqDmD7f
	uND4eKD8OW2NPfI9Ng+fvHH3UWIx5sVunvt4lTPpJNlxp9VEBL38jIu89qbCnL5cXwZs0ZQOd4u
	obesuZLO1Avzzz48KE71ZrEW2MYPaEW3w80/mFzBGse5u6+Ib0GNdWcRNGbpbUHUytC2RfqbyBJ
	fOpqic82AkHEgyiiN9CtgSYFxl7fgJWYdyyd1s7d/WsGJ2zIGhXQDBJVxSjA9fyNtYKF/O0dFeo
	ZU4W35NGh0lcVZ8H9YA7TgRim5p3V4zktjzSRufcsm2QnflIYfWkn7HprI4z1rJmyEdFUlQt1Uf
	WQIvwyOaoKtlNiEyH/cop/1Z7lI8w/eci7YrV6wiWAr1T6Cjc7LvwcHAHcqq3tfS1XAcj7Zi6Gn
	wbBbIWyHhNbdaRsXrx29TxklSK6UMow5Q+91uKwewIwVsmEcKPegebmFj0xfrNmNu3RirY1h5OE
	JqMfUFrX0Ko8EtCQUQhG+eg==
X-Received: by 2002:a05:690e:12c4:b0:67d:befc:6146 with SMTP id
 956f58d0204a3-67e325178d7mr5490227d50.3.1795740224764; Thu, 26 Nov 2026
 16:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20261126212957.2477520-1-khem.raj@oss.qualcomm.com> <AS8PR10MB50736108AE7D8F72A3683EB5FD422@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50736108AE7D8F72A3683EB5FD422@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Nov 2026 16:43:18 -0800
X-Gm-Features: Aa3M54q94Ee9tjXPvKSN8OV6jNIUYkdUr0E2Bg52CTPx5aAP8oaXIr9Fm3ElKPk
Message-ID: <CAMKF1so8-Aw2yJJ94fzgVWgALobr0dcy4MCav0K-J-B02nqLuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sqlite3: Enable unlock-notify for native builds
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="00000000000034c1530661375aa6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 00:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251338

--00000000000034c1530661375aa6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 1:46=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

>
> > -----Original Message-----
> > From: Khem Raj via openembedded-core
> > <raj.khem=3Dgmail.com@lists.openembedded.org>
> > Sent: Thursday, November 26, 2026 10:30 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Khem Raj <khem.raj@oss.qualcomm.com>
> > Subject: [OE-core] [PATCH] sqlite3: Enable unlock-notify for native
> builds
> >
> > Rust crates that use sqlx with the system SQLite build their sqlx
> > proc macros for the build host, and those link sqlite3-native. sqlx
> > needs sqlite3_unlock_notify(), so without it the macros fail to load,
> > e.g. for influxdb3 in meta-oe:
> >
> >   libsqlx_macros-<hash>.so: undefined symbol: sqlite3_unlock_notify
> >
> > Enable unlock-notify for native as it already is for target.
> >
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
> >  meta/recipes-support/sqlite/sqlite3_3.54.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
> b/meta/recipes-
> > support/sqlite/sqlite3_3.54.1.bb
> > index 681b8e1e20..5daea010fe 100644
> > --- a/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
> > +++ b/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
> > @@ -32,7 +32,7 @@ CVE_PRODUCT =3D "sqlite"
> >  inherit pkgconfig siteinfo upstream-stable-release-point
> >
> >  PACKAGECONFIG ?=3D "fts4 fts5 rtree dyn_ext unlock-notify"
> > -PACKAGECONFIG:class-native ?=3D "fts4 fts5 rtree dyn_ext"
> > +PACKAGECONFIG:class-native ?=3D "fts4 fts5 rtree dyn_ext unlock-notify=
"
>
> These two PACKAGECONFIGs are now identical, so should we just remove the
> native override instead?
>

I think it's more prescriptive this way so I kept it in. But I am not too
tied to either way.


> Peter
>
> >
> >  PACKAGECONFIG[editline] =3D "--enable-editline --with-readline-
> > header=3D${STAGING_INCDIR}/editline/readline.h,--disable-editline,libed=
it
> ncurses"
> >  PACKAGECONFIG[readline] =3D "--enable-readline --with-readline-
> > header=3D${STAGING_INCDIR}/readline/readline.h,--disable-readline,readl=
ine
> ncurses"
>

--00000000000034c1530661375aa6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 26,=
 2026 at 1:46=E2=80=AFPM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@sie=
mens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
&gt; -----Original Message-----<br>
&gt; From: Khem Raj via openembedded-core<br>
&gt; &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;<br>
&gt; Sent: Thursday, November 26, 2026 10:30 PM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" target=
=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH] sqlite3: Enable unlock-notify for native bu=
ilds<br>
&gt; <br>
&gt; Rust crates that use sqlx with the system SQLite build their sqlx<br>
&gt; proc macros for the build host, and those link sqlite3-native. sqlx<br=
>
&gt; needs sqlite3_unlock_notify(), so without it the macros fail to load,<=
br>
&gt; e.g. for influxdb3 in meta-oe:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0libsqlx_macros-&lt;hash&gt;.so: undefined symbol: sqlite3_=
unlock_notify<br>
&gt; <br>
&gt; Enable unlock-notify for native as it already is for target.<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.54.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">sqlite3_3.54.1.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.5=
4.1.bb" rel=3D"noreferrer" target=3D"_blank">sqlite3_3.54.1.bb</a> b/meta/r=
ecipes-<br>
&gt; support/sqlite/<a href=3D"http://sqlite3_3.54.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">sqlite3_3.54.1.bb</a><br>
&gt; index 681b8e1e20..5daea010fe 100644<br>
&gt; --- a/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.54.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">sqlite3_3.54.1.bb</a><br>
&gt; +++ b/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.54.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">sqlite3_3.54.1.bb</a><br>
&gt; @@ -32,7 +32,7 @@ CVE_PRODUCT =3D &quot;sqlite&quot;<br>
&gt;=C2=A0 inherit pkgconfig siteinfo upstream-stable-release-point<br>
&gt; <br>
&gt;=C2=A0 PACKAGECONFIG ?=3D &quot;fts4 fts5 rtree dyn_ext unlock-notify&q=
uot;<br>
&gt; -PACKAGECONFIG:class-native ?=3D &quot;fts4 fts5 rtree dyn_ext&quot;<b=
r>
&gt; +PACKAGECONFIG:class-native ?=3D &quot;fts4 fts5 rtree dyn_ext unlock-=
notify&quot;<br>
<br>
These two PACKAGECONFIGs are now identical, so should we just remove the na=
tive override instead?<br></blockquote><div><br></div><div>I think it&#39;s=
 more prescriptive this way so I kept it in. But I am not too tied to eithe=
r way.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
Peter<br>
<br>
&gt; <br>
&gt;=C2=A0 PACKAGECONFIG[editline] =3D &quot;--enable-editline --with-readl=
ine-<br>
&gt; header=3D${STAGING_INCDIR}/editline/readline.h,--disable-editline,libe=
dit ncurses&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[readline] =3D &quot;--enable-readline --with-readl=
ine-<br>
&gt; header=3D${STAGING_INCDIR}/readline/readline.h,--disable-readline,read=
line ncurses&quot;<br>
</blockquote></div></div>

--00000000000034c1530661375aa6--
