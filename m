Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.9732.1607361238482269689
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 09:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PG4I5QzV;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: wickbergster@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id r5so14490997eda.12
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 09:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oM/8xEbYsF9p+4Q/4WRTTw3ovTRynyUxoWIgnB9g1Vw=;
        b=PG4I5QzVR/iYFW/wtAtNSvH1bj6IjQDXtisLnVbLS6hvGdDNKWFv7s2Bz692q66113
         3ZTfCS4fMXf1X5uopDB5DMnoIi6P7hzm6PKu9Pdib1Gj8cM7iaHkLU6/x9ve8b1p5FQ/
         Sp+J+grfJRkJoabxpEvlquCRw/Xx/BELSVLvNJj0mBovM1qhqeF4l4bxjR5GLUb6yCII
         hx572jLYYKL46Lky0AM1ZOq5e7hMQcE6KhUZ74W7QrwbdnYLM9Zy/gPaOTfHJeBc/Fut
         uVagtjPJqmsFCcz7weHFCDBy+Wr172fQIvMiI/Mi5CdP3gjpNVBDb85uXIAdJfC4Puch
         oVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oM/8xEbYsF9p+4Q/4WRTTw3ovTRynyUxoWIgnB9g1Vw=;
        b=Jd7yAMnoy9LBFdHtG3BXJutTxc6+8NJNKepcAz8slEOliP+PCiA8RtcL5y2VAqT30X
         G+Rk9fG4rohnIPDOu8an6OIQTu4zx0okATR1gLTWeKSt4Cjfh2yIKojv58tNOcIlWKeH
         UCLmr7Ekq8Nbtpc54EKaw5yz7txTxcP7Ho2zDibZ+FjOv6OVck0snIHT/69ZMEI34670
         ASMuYGuwgY6t/Z92HpizSCy+qCrIqBYa4oR17dOcGFyMhEzSdl1R9fTP1Dh9roWlBWXq
         BpKqeelnOJkc96S92NhUd5jA/j+pnm3GWr+XKOJ1chyKUmT2Ip7gYbDVeRzVuo96dJJm
         Kw1A==
X-Gm-Message-State: AOAM531gYSPJSxrlED1riYIzMzjwTWcQGojaIAAAM9MxOB3Ma21K9nEx
	p2faeX9OlRKaEOriSB4fZwaRJLOidH3iVQMJN+I=
X-Google-Smtp-Source: ABdhPJzgABXYHh4m6y8sqWFBDH+9JNKJiYDG9nY7IUP5p220qxdNq3ljS1Ea64TqEnpRvI8LuP1Ff8UyHWkq9MvvvuQ=
X-Received: by 2002:a50:998d:: with SMTP id m13mr20359277edb.119.1607361236819;
 Mon, 07 Dec 2020 09:13:56 -0800 (PST)
MIME-Version: 1.0
References: <164E7E3AE862D9E7.31725@lists.openembedded.org>
In-Reply-To: <164E7E3AE862D9E7.31725@lists.openembedded.org>
From: "Alexander Vickberg" <wickbergster@gmail.com>
Date: Mon, 7 Dec 2020 18:13:45 +0100
Message-ID: <CAAxSGfZaERk=5g12DbZcLJnPxzvaCZkMkVyMyyh1+mr5fbpjJw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] libwebsockets: upgrade to 4.1.6
To: Alexander Vickberg <wickbergster@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008be51205b5e2f3a4"

--0000000000008be51205b5e2f3a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oops, wrong list. Sorry for noise.

Den m=C3=A5n 7 dec. 2020 18:08Alexander Vickberg via lists.openembedded.or=
g
<wickbergster=3Dgmail.com@lists.openembedded.org> skrev:

> Event lib support is now built into dynamically loaded plugins so
> package them separately and include them in RDEPENDS if enabled.
>
> Building minimal-examples with generated SDK failed due to cmake
> configuration had static enabled but not included into SDK. Solve
> this by adding static as PACKAGECONFIG option and adding
> ${PN}-staticdev to RDEPENDS_${PN}-dev if enabled.
>
> Remove CFLAGS_append with -Wno-error for fixing building with Os.
> This looks like it's fixed in upstream.
>
> Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
> ---
>  ...ckets_4.0.20.bb =3D> libwebsockets_4.1.6.bb} | 20 +++++++++++++-----=
-
>  1 file changed, 14 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-connectivity/libwebsockets/{
> libwebsockets_4.0.20.bb =3D> libwebsockets_4.1.6.bb} (51%)
>
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/
> libwebsockets_4.0.20.bb b/meta-oe/recipes-connectivity/libwebsockets/
> libwebsockets_4.1.6.bb
> similarity index 51%
> rename from meta-oe/recipes-connectivity/libwebsockets/
> libwebsockets_4.0.20.bb
> rename to meta-oe/recipes-connectivity/libwebsockets/
> libwebsockets_4.1.6.bb
> index 5427daac4..e922d681f 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c47b078124308a4e1354e8d59f606b7"
>  DEPENDS =3D "zlib"
>
>  S =3D "${WORKDIR}/git"
> -SRCREV =3D "ec9e8ab892f2dc569ae09336c80c2796fd14a6ff"
> -SRC_URI =3D "git://
> github.com/warmcat/libwebsockets.git;protocol=3Dhttps;branch=3Dv4.0-stab=
le"
> +SRCREV =3D "736f0739ed8c75db0e29c7678b5a9194e957c347"
> +SRC_URI =3D "git://
> github.com/warmcat/libwebsockets.git;protocol=3Dhttps;branch=3Dv4.1-stab=
le"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/warmcat/${BPN}/releases"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> @@ -18,18 +18,26 @@ PACKAGECONFIG ?=3D "libuv client server http2 ssl"
>  PACKAGECONFIG[client] =3D
> "-DLWS_WITHOUT_CLIENT=3DOFF,-DLWS_WITHOUT_CLIENT=3DON,"
>  PACKAGECONFIG[http2] =3D "-DLWS_WITH_HTTP2=3DON,-DLWS_WITH_HTTP2=3DOFF,=
"
>  PACKAGECONFIG[ipv6] =3D "-DLWS_IPV6=3DON,-DLWS_IPV6=3DOFF,"
> +PACKAGECONFIG[libevent] =3D
> "-DLWS_WITH_LIBEVENT=3DON,-DLWS_WITH_LIBEVENT=3DOFF,libevent"
>  PACKAGECONFIG[libev] =3D "-DLWS_WITH_LIBEV=3DON,-DLWS_WITH_LIBEV=3DOFF,=
libev"
>  PACKAGECONFIG[libuv] =3D "-DLWS_WITH_LIBUV=3DON,-DLWS_WITH_LIBUV=3DOFF,=
libuv"
>  PACKAGECONFIG[server] =3D
> "-DLWS_WITHOUT_SERVER=3DOFF,-DLWS_WITHOUT_SERVER=3DON,"
>  PACKAGECONFIG[ssl] =3D "-DLWS_WITH_SSL=3DON,-DLWS_WITH_SSL=3DOFF,openss=
l"
> -PACKAGECONFIG[testapps] =3D
> "-DLWS_WITHOUT_TESTAPPS=3DOFF,-DLWS_WITHOUT_TESTAPPS=3DON,"
> +PACKAGECONFIG[static] =3D "-DLWS_WITH_STATIC=3DON,-DLWS_WITH_STATIC=3DO=
FF
> -DLWS_LINK_TESTAPPS_DYNAMIC=3DON,"
>
>  EXTRA_OECMAKE +=3D " \
>      -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
>  "
>
> -PACKAGES =3D+ "${PN}-testapps"
> +PACKAGES =3D+ "${PN}-testapps ${PN}-evlib_event ${PN}-evlib_uv
> ${PN}-evlib_ev"
>
> -FILES_${PN}-testapps +=3D "${datadir}/libwebsockets-test-server/*"
> +FILES_${PN}-testapps +=3D "${datadir}/libwebsockets-test-server/*
> ${bindir}/libwebsockets-test-*"
> +FILES_${PN}-evlib_event +=3D "${libdir}/libwebsockets-evlib_event.so"
> +FILES_${PN}-evlib_uv +=3D "${libdir}/libwebsockets-evlib_uv.so"
> +FILES_${PN}-evlib_ev +=3D "${libdir}/libwebsockets-evlib_ev.so"
>
> -CFLAGS_append =3D " -Wno-error"
> +RDEPENDS_${PN} +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'libevent',
> '${PN}-evlib_event', '', d)}"
> +RDEPENDS_${PN} +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'libuv',
> '${PN}-evlib_uv', '', d)}"
> +RDEPENDS_${PN} +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'libev',
> '${PN}-evlib_ev', '', d)}"
> +
> +RDEPENDS_${PN}-dev +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'static=
',
> '${PN}-staticdev', '', d)}"
> --
> 2.25.1
>
>
>=20
>
>

--0000000000008be51205b5e2f3a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Oops, wrong list. Sorry for noise.</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den m=C3=A5n 7 dec. 202=
0 18:08Alexander Vickberg via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;wickbergster=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; skrev:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Event lib support is now built into dynami=
cally loaded plugins so<br>
package them separately and include them in RDEPENDS if enabled.<br>
<br>
Building minimal-examples with generated SDK failed due to cmake<br>
configuration had static enabled but not included into SDK. Solve<br>
this by adding static as PACKAGECONFIG option and adding<br>
${PN}-staticdev to RDEPENDS_${PN}-dev if enabled.<br>
<br>
Remove CFLAGS_append with -Wno-error for fixing building with Os.<br>
This looks like it&#39;s fixed in upstream.<br>
<br>
Signed-off-by: Alexander Vickberg &lt;<a href=3D"mailto:wickbergster@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">wickbergster@gmail.com</a>&gt;<b=
r>
---<br>
=C2=A0...<a href=3D"http://ckets_4.0.20.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">ckets_4.0.20.bb</a> =3D&gt; <a href=3D"http://libwebsocke=
ts_4.1.6.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libwebsockets_=
4.1.6.bb</a>} | 20 +++++++++++++------<br>
=C2=A01 file changed, 14 insertions(+), 6 deletions(-)<br>
=C2=A0rename meta-oe/recipes-connectivity/libwebsockets/{<a href=3D"http:/=
/libwebsockets_4.0.20.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">l=
ibwebsockets_4.0.20.bb</a> =3D&gt; <a href=3D"http://libwebsockets_4.1.6.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">libwebsockets_4.1.6.bb</a=
>} (51%)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://=
libwebsockets_4.0.20.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">li=
bwebsockets_4.0.20.bb</a> b/meta-oe/recipes-connectivity/libwebsockets/<a h=
ref=3D"http://libwebsockets_4.1.6.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">libwebsockets_4.1.6.bb</a><br>
similarity index 51%<br>
rename from meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://l=
ibwebsockets_4.0.20.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">lib=
websockets_4.0.20.bb</a><br>
rename to meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://lib=
websockets_4.1.6.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libweb=
sockets_4.1.6.bb</a><br>
index 5427daac4..e922d681f 100644<br>
--- a/meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://libwebs=
ockets_4.0.20.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libwebsoc=
kets_4.0.20.bb</a><br>
+++ b/meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://libwebs=
ockets_4.1.6.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libwebsock=
ets_4.1.6.bb</a><br>
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c47b07812=
4308a4e1354e8d59f606b7&quot;<br>
=C2=A0DEPENDS =3D &quot;zlib&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-SRCREV =3D &quot;ec9e8ab892f2dc569ae09336c80c2796fd14a6ff&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/warmcat/libwebsocket=
s.git;protocol=3Dhttps;branch=3Dv4.0-stable" rel=3D"noreferrer noreferrer" =
target=3D"_blank">github.com/warmcat/libwebsockets.git;protocol=3Dhttps;bra=
nch=3Dv4.0-stable</a>&quot;<br>
+SRCREV =3D &quot;736f0739ed8c75db0e29c7678b5a9194e957c347&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/warmcat/libwebsocket=
s.git;protocol=3Dhttps;branch=3Dv4.1-stable" rel=3D"noreferrer noreferrer" =
target=3D"_blank">github.com/warmcat/libwebsockets.git;protocol=3Dhttps;bra=
nch=3Dv4.1-stable</a>&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/warmcat/$=
%7BBPN%7D/releases" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/github.com/warmcat/${BPN}/releases</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&qu=
ot;<br>
@@ -18,18 +18,26 @@ PACKAGECONFIG ?=3D &quot;libuv client server http2 ssl=
&quot;<br>
=C2=A0PACKAGECONFIG[client] =3D &quot;-DLWS_WITHOUT_CLIENT=3DOFF,-DLWS_WIT=
HOUT_CLIENT=3DON,&quot;<br>
=C2=A0PACKAGECONFIG[http2] =3D &quot;-DLWS_WITH_HTTP2=3DON,-DLWS_WITH_HTTP=
2=3DOFF,&quot;<br>
=C2=A0PACKAGECONFIG[ipv6] =3D &quot;-DLWS_IPV6=3DON,-DLWS_IPV6=3DOFF,&quot=
;<br>
+PACKAGECONFIG[libevent] =3D &quot;-DLWS_WITH_LIBEVENT=3DON,-DLWS_WITH_LIB=
EVENT=3DOFF,libevent&quot;<br>
=C2=A0PACKAGECONFIG[libev] =3D &quot;-DLWS_WITH_LIBEV=3DON,-DLWS_WITH_LIBE=
V=3DOFF,libev&quot;<br>
=C2=A0PACKAGECONFIG[libuv] =3D &quot;-DLWS_WITH_LIBUV=3DON,-DLWS_WITH_LIBU=
V=3DOFF,libuv&quot;<br>
=C2=A0PACKAGECONFIG[server] =3D &quot;-DLWS_WITHOUT_SERVER=3DOFF,-DLWS_WIT=
HOUT_SERVER=3DON,&quot;<br>
=C2=A0PACKAGECONFIG[ssl] =3D &quot;-DLWS_WITH_SSL=3DON,-DLWS_WITH_SSL=3DOF=
F,openssl&quot;<br>
-PACKAGECONFIG[testapps] =3D &quot;-DLWS_WITHOUT_TESTAPPS=3DOFF,-DLWS_WITH=
OUT_TESTAPPS=3DON,&quot;<br>
+PACKAGECONFIG[static] =3D &quot;-DLWS_WITH_STATIC=3DON,-DLWS_WITH_STATIC=
=3DOFF -DLWS_LINK_TESTAPPS_DYNAMIC=3DON,&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-DLIB_SUFFIX=3D${@d.getVar(&#39;baselib&#39;).replace(=
&#39;lib&#39;, &#39;&#39;)} \<br>
=C2=A0&quot;<br>
<br>
-PACKAGES =3D+ &quot;${PN}-testapps&quot;<br>
+PACKAGES =3D+ &quot;${PN}-testapps ${PN}-evlib_event ${PN}-evlib_uv ${PN}=
-evlib_ev&quot;<br>
<br>
-FILES_${PN}-testapps +=3D &quot;${datadir}/libwebsockets-test-server/*&qu=
ot;<br>
+FILES_${PN}-testapps +=3D &quot;${datadir}/libwebsockets-test-server/* ${=
bindir}/libwebsockets-test-*&quot;<br>
+FILES_${PN}-evlib_event +=3D &quot;${libdir}/libwebsockets-evlib_event.so=
&quot;<br>
+FILES_${PN}-evlib_uv +=3D &quot;${libdir}/libwebsockets-evlib_uv.so&quot;=
<br>
+FILES_${PN}-evlib_ev +=3D &quot;${libdir}/libwebsockets-evlib_ev.so&quot;=
<br>
<br>
-CFLAGS_append =3D &quot; -Wno-error&quot;<br>
+RDEPENDS_${PN} +=3D &quot; ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, =
&#39;libevent&#39;, &#39;${PN}-evlib_event&#39;, &#39;&#39;, d)}&quot;<br>
+RDEPENDS_${PN} +=3D &quot; ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, =
&#39;libuv&#39;, &#39;${PN}-evlib_uv&#39;, &#39;&#39;, d)}&quot;<br>
+RDEPENDS_${PN} +=3D &quot; ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, =
&#39;libev&#39;, &#39;${PN}-evlib_ev&#39;, &#39;&#39;, d)}&quot;<br>
+<br>
+RDEPENDS_${PN}-dev +=3D &quot; ${@bb.utils.contains(&#39;PACKAGECONFIG&#3=
9;, &#39;static&#39;, &#39;${PN}-staticdev&#39;, &#39;&#39;, d)}&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000008be51205b5e2f3a4--
