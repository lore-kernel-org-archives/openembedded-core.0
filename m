Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id B5B197718D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 18:45:00 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b134-v6so11031140vke.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YXd60Iy+woRIfhrWbDnsUm01iI8LPVRvbIknmZGwmO0=;
	b=u7mxMiJ2dmQoGzFT3zLPERCw1ECwOqBvKN3Esklm5+olPNfbTiVu4D9zwxI3hKzPsR
	lf5kMav5X6jtedx4nrXeRUU3lbprK7rAXx0tqMQ4/qR6yUnTcNOYCnw0KDvt4tMrFshh
	XYgXsaRMW1V19RTWOuVnLmy9hDs1Xk01ErMtyrwaw7mfRPx9sKYzrg3NDI6ysyn290xO
	qBd3jix9o2ku5K0ZTKZW/tKTRTbd3Y41D8jbU/k9yaxIqlya9VX+5AV7voV0VEmjFtr+
	CUVtD/YU2Fa1lXFUx7rqT2Tu7dlQPQECRvDnBuEt+tpCRIrDeuEXg5l8/b3nV3NF9mm1
	I6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YXd60Iy+woRIfhrWbDnsUm01iI8LPVRvbIknmZGwmO0=;
	b=d7XjzsN17ZNhsyxQ2JhX/y7xql0HtF1SmgnS1Q1CQ72l7aeiWlCkD1vHJ2iLG7eIYq
	qRC5Fv5/HhpiDovCIMaMvEN6rLFnbK0Cs2xlH7SCQk7HdmXVLbSk+BmdRYz0/8LDigZ3
	xWTHkOdTvmlu3+VTCMG8kQ6+QfvKNnMK/nrlTFURHly0UUilsIqDx5nVgnbm18vDnJGd
	H3y9mTporIPAX3skEgmg2EMkp0DaWcvnKH6dYb41T7J5ufi0AdO9/XnHhoHozg2RUaEq
	1b3M0HrxN/GJoRr3flXLn07eRNl7yfkvIj5U74vqZIIw0zuu9uOMJ97cfhTyXbwNJc6M
	uZuw==
X-Gm-Message-State: APt69E3P/DiHRwXdTqXd2oaSTvKObmiU1Ll89k+tEkQDznegvFQzw6f6
	rxZFlU2riEF5Q5ATr5Ny4vdmHz1Z9a5oDywSAdNOAw==
X-Google-Smtp-Source: ADUXVKIEEoEOFIMyZOy6//m+Io0bh1rmPhhfBBdQRYqtKEEa9Q46+R2huc8cRv7LWqXtwbWp0vlTJbb8e0z8ll95Zoo=
X-Received: by 2002:a1f:3df:: with SMTP id f92-v6mr8632453vki.98.1528656301373;
	Sun, 10 Jun 2018 11:45:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:4b48:0:0:0:0:0 with HTTP; Sun, 10 Jun 2018 11:45:00
	-0700 (PDT)
In-Reply-To: <1528557877-22037-1-git-send-email-liu.ming50@gmail.com>
References: <1528557877-22037-1-git-send-email-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Sun, 10 Jun 2018 20:45:00 +0200
Message-ID: <CALatG=4e_7nvpG6spimG5a=5e8iX8J4JTB73uJ9zFQOPosL0Eg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: Re: [PATCH] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
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
X-List-Received-Date: Sun, 10 Jun 2018 18:45:01 -0000
Content-Type: multipart/alternative; boundary="000000000000d3bc2b056e4e07fb"

--000000000000d3bc2b056e4e07fb
Content-Type: text/plain; charset="UTF-8"

Hi, Richard:

I saw your comment as follows:

> This adds "" in OVERRIDES in the default case. Whilst I think (but am not
100% sure) we fixed bitbake not to break on such a value, I'm not convinced
adding empty elements to it is a good idea and this did used to break
things.

No, it will add "default" to OVERRIDES in the default case.

//Ming Liu


2018-06-09 17:24 GMT+02:00 <liu.ming50@gmail.com>:

> From: Ming Liu <liu.ming50@gmail.com>
>
> This is useful when the users want different variables/tasks when using
> multiconfig.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3b2ef9f..8b2555b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -731,7 +731,7 @@ DISTRO_NAME ??= "OpenEmbedded"
>  # And finally '<foo>_forcevariable' overrides any standard variable, with
> the highest priority.
>  # This works for functions as well, they are really just variables.
>  #
> -OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${
> MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:
> forcevariable"
> +OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${
> MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:
> ${BB_CURRENT_MC}:forcevariable"
>  LIBCOVERRIDE ?= ""
>  CLASSOVERRIDE ?= "class-target"
>  DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
> --
> 2.7.4
>
>

--000000000000d3bc2b056e4e07fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Richard:<div><br></div><div>I saw your comment as foll=
ows:</div><div><br></div><div>&gt;=C2=A0<span style=3D"font-size:14px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline">This adds &quot;&quot; in OVERRIDE=
S in the default case. Whilst I think (but am=C2=A0</span><span style=3D"fo=
nt-size:14px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">not 100% sure) w=
e fixed bitbake not to break on such a value, I&#39;m not=C2=A0</span><span=
 style=3D"font-size:14px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">conv=
inced adding empty elements to it is a good idea and this did used=C2=A0</s=
pan><span style=3D"font-size:14px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">to break things.</span></div><div><br></div><div>No, it will add &quot=
;default&quot; to=C2=A0<span style=3D"font-size:14px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">OVERRIDES in the default case.</span></div><div><sp=
an style=3D"font-size:14px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline"><b=
r></span></div><div><span style=3D"font-size:14px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">//Ming Liu</span></div><div><br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-06-09 17:24 GMT+02:00 =
 <span dir=3D"ltr">&lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_b=
lank">liu.ming50@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gma=
il.com</a>&gt;<br>
<br>
This is useful when the users want different variables/tasks when using<br>
multiconfig.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.min=
g50@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 3b2ef9f..8b2555b 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -731,7 +731,7 @@ DISTRO_NAME ??=3D &quot;OpenEmbedded&quot;<br>
=C2=A0# And finally &#39;&lt;foo&gt;_forcevariable&#39; overrides any stand=
ard variable, with the highest priority.<br>
=C2=A0# This works for functions as well, they are really just variables.<b=
r>
=C2=A0#<br>
-OVERRIDES =3D &quot;${TARGET_OS}:${TRANSLATED_<wbr>TARGET_ARCH}:pn-${PN}:$=
{<wbr>MACHINEOVERRIDES}:${<wbr>DISTROOVERRIDES}:${<wbr>CLASSOVERRIDE}${LIBC=
OVERRIDE}:<wbr>forcevariable&quot;<br>
+OVERRIDES =3D &quot;${TARGET_OS}:${TRANSLATED_<wbr>TARGET_ARCH}:pn-${PN}:$=
{<wbr>MACHINEOVERRIDES}:${<wbr>DISTROOVERRIDES}:${<wbr>CLASSOVERRIDE}${LIBC=
OVERRIDE}:<wbr>${BB_CURRENT_MC}:<wbr>forcevariable&quot;<br>
=C2=A0LIBCOVERRIDE ?=3D &quot;&quot;<br>
=C2=A0CLASSOVERRIDE ?=3D &quot;class-target&quot;<br>
=C2=A0DISTROOVERRIDES ?=3D &quot;${@d.getVar(&#39;DISTRO&#39;) or &#39;&#39=
;}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--000000000000d3bc2b056e4e07fb--
