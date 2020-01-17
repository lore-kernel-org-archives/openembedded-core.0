Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id A92517D65D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 12:05:11 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id l6so8833711uap.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 04:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0Zl2dPXU0VYRx3L3wgFJ3llgsWjHAd3tu9KY5T6Oz1w=;
	b=MkLvHLDY99OeYM44qeNBn5MXd1+tkbsf6MYPMM2xrLxH3xa5ad8JEhXi6bFYCsXC07
	swb1GXTVyCZ2LvIm6Hu5tNn8zGWTKW0YIAe14/kRxZVfNMue3aLHBBxSPxIGpKfscMN0
	x3APtiSt+AUkOfVuDMNaEfZN6HMDSI8T6haGM4yGtYCuBxDNDBoq/XQA8WIIdY4NXE2y
	cd5RpO5hZMcyeuk38KiP5hsZTmRelmnuuVCSQFffaeBZRnrpOGg5C8kQqs/WyqW9XeNU
	6eVQu8Q2wKSdG6MoMUEwREHIPOOlTB3Bgu6BZZ0RkaY6TFRyPFWDIUZettABtzl3d1z2
	85QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0Zl2dPXU0VYRx3L3wgFJ3llgsWjHAd3tu9KY5T6Oz1w=;
	b=nNU5EH70+icDbAgDhsA1vgMrerocsndQZhceJffw/2QZ7ClftszmGWYBR192Zjox5V
	qZImlyKORcu9QMsQ/u1FrOLMkiUsQf5yL98ZvJ1E/Lpk96focVWRWnLiHoZHR4LnkcKA
	jqmyz6dLsom6l48HCSHpMGbIewQqi6nALKRLwyDYyg4MRjE0YMLd9vCDZ3JXV6Om7ST1
	itCnf02viDbeRLtexHnDi3wDBfNJDSl0dI+wKQoC71NQb/YcUn90IBj1ZWGdPuoHmzAj
	bFWpelkAmBDjxT692nOOq+GBGF2Er6oCyNjl1ICa5m3+WkHYnPFB0X6qMXvklUXcYbTi
	pr/g==
X-Gm-Message-State: APjAAAVk77V4u6vzZYhoo729cKLi+Yf5WN3EFdj+FRYLcUbaPhkbM4oo
	Bgw5VbaIuIjQkex28twQdsF0aukq74NUkcoy010=
X-Google-Smtp-Source: APXvYqz/BZE+SsXStIxjmmYVGhC8YcKnQJ+q4catGAJWVnKkAwZ3NMr2aaGRDmfb0ORx2jtHS8m7ZaMt6faAzS+DrDg=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr22267017uak.22.1579262712494; 
	Fri, 17 Jan 2020 04:05:12 -0800 (PST)
MIME-Version: 1.0
References: <1579244354-13596-1-git-send-email-sumit.garg@linaro.org>
	<b21d1a39c0c1e5585e72586ca806967bae37decf.camel@linuxfoundation.org>
	<CAFA6WYOm4a8_mqyNA+zkFHPznN10SyKb4atiCtmS=qabZzyM+A@mail.gmail.com>
In-Reply-To: <CAFA6WYOm4a8_mqyNA+zkFHPznN10SyKb4atiCtmS=qabZzyM+A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Jan 2020 13:05:01 +0100
Message-ID: <CANNYZj9tcgw0KZeqZRQdL5etBdAEPP+S29S4YWkE94jhVQbLNw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Fri, 17 Jan 2020 12:05:11 -0000
Content-Type: multipart/alternative; boundary="000000000000fc3eb5059c54c021"

--000000000000fc3eb5059c54c021
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2020 at 12:55, Sumit Garg <sumit.garg@linaro.org> wrote:

> But looking at this failure again it seems like "autopoint" is
> provided by gettext rather than autotools. So yes, I think you are
> right and "xz-native" dependency should go in
> meta/classes/gettext.bbclass instead as follows:
>
> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> index be2ef3b311..443c9c4cb0 100644
> --- a/meta/classes/gettext.bbclass
> +++ b/meta/classes/gettext.bbclass
> @@ -2,8 +2,8 @@ def gettext_dependencies(d):
>      if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d,
> 'cross-canadian'):
>          return ""
>      if d.getVar('USE_NLS') == 'no':
> -        return "gettext-minimal-native"
> -    return "gettext-native"
> +        return "gettext-minimal-native xz-native"
> +    return "gettext-native xz-native"
>

I don't believe this is right either, at least not for the master branch.
Autopoint is specifically excluded for all autotools-based recipes; psmisc
used to be an exception to that, but no longer is with the latest master
branch and latest gettext.

Alex

--000000000000fc3eb5059c54c021
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 17 Jan 2020 at 12:55, Sumit Garg &lt;<a href=3D"mailto:sumit=
.garg@linaro.org">sumit.garg@linaro.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">But looking at this failure again it=
 seems like &quot;autopoint&quot; is<br>
provided by gettext rather than autotools. So yes, I think you are<br>
right and &quot;xz-native&quot; dependency should go in<br>
meta/classes/gettext.bbclass instead as follows:<br>
<br>
diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass<br=
>
index be2ef3b311..443c9c4cb0 100644<br>
--- a/meta/classes/gettext.bbclass<br>
+++ b/meta/classes/gettext.bbclass<br>
@@ -2,8 +2,8 @@ def gettext_dependencies(d):<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;INHIBIT_DEFAULT_DEPS&#39;) and not oe.=
utils.inherits(d,<br>
&#39;cross-canadian&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;USE_NLS&#39;) =3D=3D &#39;no&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;gettext-minimal-native&quot;<br>
-=C2=A0 =C2=A0 return &quot;gettext-native&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;gettext-minimal-native xz-native&=
quot;<br>
+=C2=A0 =C2=A0 return &quot;gettext-native xz-native&quot;<br></blockquote>=
<div><br></div><div>I don&#39;t believe this is right either, at least not =
for the master branch. Autopoint is specifically excluded for all autotools=
-based recipes; psmisc used to be an exception to that, but no longer is wi=
th the latest master branch and latest gettext.</div><div><br></div><div>Al=
ex<br></div></div></div>

--000000000000fc3eb5059c54c021--
