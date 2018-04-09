Return-Path: <koen@dominion.thruhere.net>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id E4A1F7510F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 12:33:22 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id x144-v6so11602475itc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I3oxDTw3yAK2ayZkwma9/4OGwKlPRXQV/i/XRgAmm10=;
	b=K1NdEPU1OrdD1x6WdBce6Z/X3At7C8MrcFmDp5oHCwUxVAfyOeBIsHNcFFqM1s5boD
	SSUs2FRHnECMnKxF/M6EmVaFW7yQSwyjHfZ0Hu6VzpsmvKa510guKiuK0nYADXFfHwxa
	GJun6VLQ2EljDKOnxVXtPvgLr+z8/r6kA+4rOl6flCAlsVtOkL5lW5VNfGTfIUWFkcOa
	t5JFkbqfMkswSFGl0fDL2EllowT98vlKQTiK8BQueuFVP6FxCgXWaiFYkQ6xectiGn6B
	FW0dyGGqmE6Ss4gR8qRDiqyQDHbXm7BKXL+5hAi7+7cc3orexAkf9M6AgLS7KV8FxEs6
	u2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I3oxDTw3yAK2ayZkwma9/4OGwKlPRXQV/i/XRgAmm10=;
	b=OGb+fvqiyRwYnEdMNeQCYtz3F0PF+uhvz3ZJ/7wgVqEaWSgOEV00xzUMlnH9lIYuaK
	qCZRUnVKXgyPOwSgHzfFT/pgW5vt7cEhafDFw3uOa/xXviRS8vjbKtd0/3mFAwq+z2KS
	RUa2JneMXyGfAkch9lZj5zbiCntuf07WWEK+uSotpZac5lL8L95IEZ/nJcmTWE9pdTu2
	qSDqjUGbm9NudsLiyvSKC6Rrk7WwH8VHqHYAhS4OENI94CuHTmSJmlLfb9MYTnPDgvQ1
	pC1ziBJRdVdUa7HoxV4Gx+6p+yyg14oiyzVp0CAFPcW4YVVk7BX09d83K143RXGxEcXW
	5eBw==
X-Gm-Message-State: ALQs6tBELfOBbq2EQw+ZIc8hnwLs2SUJQzpMLooOxGaP3uS8/ugFOws5
	umbTveQeW/Jg9VmnthisMxh8CZ2RjFowdhI5KU3bpQdx
X-Google-Smtp-Source: AIpwx48lv/DfniDd1m4DZoJjnRCKPwxahOTsylvU2ObPvyYFUhHakNOQ+mb1XqS27GJ42VkVPbODAEi0xfg6/jhYBKk=
X-Received: by 2002:a24:1308:: with SMTP id 8-v6mr27308941itz.96.1523277203473;
	Mon, 09 Apr 2018 05:33:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.17.134 with HTTP; Mon, 9 Apr 2018 05:33:23 -0700 (PDT)
In-Reply-To: <20180409115657.16651-3-koen.kooi@linaro.org>
References: <20180409115657.16651-1-koen.kooi@linaro.org>
	<20180409115657.16651-3-koen.kooi@linaro.org>
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 9 Apr 2018 14:33:23 +0200
Message-ID: <CAL+dQr2m=sAcConhpH1nTP-MTK5GciDgkaxqEvtWOJ_OZd0sjw@mail.gmail.com>
To: "openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH 3/3] python 2.7: fix multilib patch to accept multiarch style paths
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
X-List-Received-Date: Mon, 09 Apr 2018 12:33:23 -0000
Content-Type: multipart/alternative; boundary="0000000000009b9f890569699c3c"

--0000000000009b9f890569699c3c
Content-Type: text/plain; charset="UTF-8"

Please ignore "[PATCH 3/3] python 2.7: fix multilib patch to accept
multiarch style paths" for now, a rebuild from scratch shows a build
failure :/

2018-04-09 13:56 GMT+02:00 Koen Kooi <koen@dominion.thruhere.net>:
>
> Using 'basename' to strip the prefix fails when using multiarch style
paths.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta/recipes-devtools/python/python/multilib.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python/multilib.patch
b/meta/recipes-devtools/python/python/multilib.patch
> index 1116dd5..3577eda 100644
> --- a/meta/recipes-devtools/python/python/multilib.patch
> +++ b/meta/recipes-devtools/python/python/multilib.patch
> @@ -11,7 +11,7 @@ Index: Python-2.7.14/configure.ac
>
>  +AC_SUBST(LIB)
>  +AC_MSG_CHECKING(LIB)
> -+LIB=`basename ${libdir}`
> ++LIB=`echo ${libdir} | sed -e 's:${prefix}::'`
>  +AC_MSG_RESULT($LIB)
>
>   AC_SUBST(LIBRARY)
> --
> 2.9.5
>

--0000000000009b9f890569699c3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please ignore &quot;[PATCH 3/3] python 2.7: fix multilib p=
atch to accept multiarch style paths&quot; for now, a rebuild from scratch =
shows a build failure :/<br><br>2018-04-09 13:56 GMT+02:00 Koen Kooi &lt;<a=
 href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.net</a>&=
gt;:<br>&gt;<br>&gt; Using &#39;basename&#39; to strip the prefix fails whe=
n using multiarch style paths.<br>&gt;<br>&gt; Signed-off-by: Koen Kooi &lt=
;<a href=3D"mailto:koen.kooi@linaro.org">koen.kooi@linaro.org</a>&gt;<br>&g=
t; ---<br>&gt; =C2=A0meta/recipes-devtools/python/python/multilib.patch | 2=
 +-<br>&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>&gt;<br>=
&gt; diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta=
/recipes-devtools/python/python/multilib.patch<br>&gt; index 1116dd5..3577e=
da 100644<br>&gt; --- a/meta/recipes-devtools/python/python/multilib.patch<=
br>&gt; +++ b/meta/recipes-devtools/python/python/multilib.patch<br>&gt; @@=
 -11,7 +11,7 @@ Index: Python-2.7.14/<a href=3D"http://configure.ac">config=
ure.ac</a><br>&gt;<br>&gt; =C2=A0+AC_SUBST(LIB)<br>&gt; =C2=A0+AC_MSG_CHECK=
ING(LIB)<br>&gt; -+LIB=3D`basename ${libdir}`<br>&gt; ++LIB=3D`echo ${libdi=
r} | sed -e &#39;s:${prefix}::&#39;`<br>&gt; =C2=A0+AC_MSG_RESULT($LIB)<br>=
&gt;<br>&gt; =C2=A0 AC_SUBST(LIBRARY)<br>&gt; --<br>&gt; 2.9.5<br>&gt;<br><=
/div>

--0000000000009b9f890569699c3c--
