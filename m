Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id AF1EE7328A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:45:31 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p65so11567218wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 14:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=GtfgDNRVXctdtJS7Tq5OlDkzYY/k5zYnWnTZFKZvseI=;
	b=MtANV8tQ55yrn2rKg9p2T/5nc3cxYLneoeJSuDPp7C8CCpjaPitBMGogxr+bT6wYiI
	rvObndwR6VQbNPquygUvC0xGcrYzUx+vq7hRRp7xePhV0Y2L5HCU381tQ1A8WGIehEFk
	qgQG24ZbspctPbOG+N202ySyDj7dm/ktE5V6by6DxiOsVAAcktlB9O9EyrUaNCFHUIiR
	7yQYzlIF+sKGRBqh8x3RBjvM7wPWB9PJZbItxIR6YgyLLW/XfQ6ys1sdGbjquN5SW8Wz
	6nfTwpBueToJDtKT99L4Yeo3MqOF/LZXs2+N7i6FWITJcgRHnTRMLwMx3qBfR1wxEdYW
	gE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=GtfgDNRVXctdtJS7Tq5OlDkzYY/k5zYnWnTZFKZvseI=;
	b=URR3LPW2sK0zW9m1hEP3TcDFrJVhJqURuusVAEGFceTTqQmKxDM9064EAK4HCZPvtj
	z6h/dG5fhHGJ8RtKI+TuMtllnuOplzlzL9hfwqh4BJdzcyHQDe7uanaVxywz7NeQUYQi
	OjHBjgCJAF02EuwyHEPYbmnNJYl8DugFZlfO36MTTPwevR6ZjY7nw2PpzSq7+5b/srFC
	QhokA1d6COKzeIqqfXzwItGcQrQNfy6nxKYFTlbbjW9asy+8UFNN7hDLg+dCRMjYzRnr
	sTgvQuXK+S5U9AOkimOTXuRz80VuU9ZxGzAFzUXkoTVXtYDOZS8BKMI0iczaZDtOaBYn
	rBnQ==
X-Gm-Message-State: AD7BkJIVLZ1qHVL/tuW2Lr01LeFsI7uu1eRbv+1Xa1CdeOo6o1BHCeQIMDy1NYBP6tBUNrtu5o3FPWiN4ktP+A==
MIME-Version: 1.0
X-Received: by 10.28.60.84 with SMTP id j81mr297799wma.91.1456785931899; Mon,
	29 Feb 2016 14:45:31 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Mon, 29 Feb 2016 14:45:31 -0800 (PST)
In-Reply-To: <BLU436-SMTP13341B70B1E43FF04270322DABA0@phx.gbl>
References: <BLU436-SMTP13341B70B1E43FF04270322DABA0@phx.gbl>
Date: Mon, 29 Feb 2016 23:45:31 +0100
Message-ID: <CA+chaQehDvb+YrM0tMP49V2kH1ZmmSYqziPNmywwudEP7YQ=MA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Trobridge <christrobridge@hotmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Fix gpsd build by switching to use EXTRA_CONF_PACKAGECONFIG.
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
X-List-Received-Date: Mon, 29 Feb 2016 22:45:31 -0000
Content-Type: multipart/alternative; boundary=001a1148e18cfc1e27052cf0676f

--001a1148e18cfc1e27052cf0676f
Content-Type: text/plain; charset=UTF-8

Wrong ML, patches for meta-oe belong to openembedded-devel ML (see README
file)

On Mon, Feb 29, 2016 at 11:31 PM, Chris Trobridge <
christrobridge@hotmail.com> wrote:

> Was using EXTRA_OECONF, leading to:
>
> SCons Error: no such option: --disable-static
>
> Signed-off-by: Chris Trobridge <christrobridge@hotmail.com>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> index ff268b3..39d6470 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> @@ -45,7 +45,7 @@ EXTRA_OESCONS = " \
>      strip='false' \
>      chrpath='yes' \
>      systemd='${SYSTEMD_OESCONS}' \
> -    ${EXTRA_OECONF} \
> +    ${EXTRA_CONF_PACKAGECONFIG} \
>  "
>  # this cannot be used, because then chrpath is not found and only static
> lib is built
>  # target=${HOST_SYS}
> --
> 2.4.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1148e18cfc1e27052cf0676f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wrong ML, patches for meta-oe belong to openembedded-devel=
 ML (see README file)</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Mon, Feb 29, 2016 at 11:31 PM, Chris Trobridge <span dir=3D"lt=
r">&lt;<a href=3D"mailto:christrobridge@hotmail.com" target=3D"_blank">chri=
strobridge@hotmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Was using EXTRA_OECONF, leading to:<br>
<br>
SCons Error: no such option: --disable-static<br>
<br>
Signed-off-by: Chris Trobridge &lt;<a href=3D"mailto:christrobridge@hotmail=
.com">christrobridge@hotmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.14.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.14.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.14.bb=
" rel=3D"noreferrer" target=3D"_blank">gpsd_3.14.bb</a> b/meta-oe/recipes-n=
avigation/gpsd/<a href=3D"http://gpsd_3.14.bb" rel=3D"noreferrer" target=3D=
"_blank">gpsd_3.14.bb</a><br>
index ff268b3..39d6470 100644<br>
--- a/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.14.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.14.bb</a><br>
+++ b/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.14.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.14.bb</a><br>
@@ -45,7 +45,7 @@ EXTRA_OESCONS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0strip=3D&#39;false&#39; \<br>
=C2=A0 =C2=A0 =C2=A0chrpath=3D&#39;yes&#39; \<br>
=C2=A0 =C2=A0 =C2=A0systemd=3D&#39;${SYSTEMD_OESCONS}&#39; \<br>
-=C2=A0 =C2=A0 ${EXTRA_OECONF} \<br>
+=C2=A0 =C2=A0 ${EXTRA_CONF_PACKAGECONFIG} \<br>
=C2=A0&quot;<br>
=C2=A0# this cannot be used, because then chrpath is not found and only sta=
tic lib is built<br>
=C2=A0# target=3D${HOST_SYS}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.4.3<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1148e18cfc1e27052cf0676f--
