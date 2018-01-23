Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 26B3F7822B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 13:12:16 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id y5so274623pff.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 05:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=brw7F6NqVHyGhgTiq5UfzTXIpA2zdra+Q7xPZ1PJx/g=;
	b=NNvswxkJmM6Sk2Yktqr45QIF5EKq5mNnUgmkLP+nIEj6vaCw5DClQJrxHySh+Y9CcD
	Ps4ExQUdgp1fHqNLE1l+Dkn938Q6HmhEJweqLC4PoUyztVTgiK4Tso6FXZ1YyaC/xshT
	tmzXXdvcX3bgwDwofNkLfy1M8y9e7bRkbVroUX3eUc0zdAFib6Skl/VL5Fmtl8QL9qe6
	S3Fwa1S5w8TFXERQb3Tvx2O2yK6wuvUWy8O2fOvL2D2zsBOXxhqP+alUa02HERjxVAxU
	bjL/dFBMCl6W4IXE6xinqu/CuihoO94GoL2J5twhcf/s5uRFWzHOWFalJiTpKRNnKwR4
	1N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=brw7F6NqVHyGhgTiq5UfzTXIpA2zdra+Q7xPZ1PJx/g=;
	b=EeUAqll3POY0A6itdnLvIo62gAEQrbrKdRpq0Jc2AyHaiQBktyr3OG4LPj16/CoOhO
	8s5DirOkmD5VvkXDEPd1nhapzkOydlqDYc+8QOFc2yxvvUi9vOnpa5NbHRweGO+6JJT4
	T2qFpaQHVkRU03svZubHVs/VIkPZiqQblLdoDR0mGNjG9Pv8LHZDPHzDZvOso2y0Nz5S
	Xu+QfP4zyaZl+mO25aKFs9d6H8U/daxrs9C/ZUKgyn7iaIkAq/4027xFQtdUv6skvF2j
	hFHWD1nQcNKmNk0eAmPJs2AK81Kba8v0Eyx33bD1hQjiiHc0iQf5D2tcbqwMCq+Paftn
	q+Fw==
X-Gm-Message-State: AKwxyteQS6TQ53WhJ6p9SWEP7p4pfz2gQYK5Fv2LNzRBf9Cqx/7fEAaz
	ng31P8fF5wrW+oTbhn67OS7VX86nEPyiDoocYtY=
X-Google-Smtp-Source: AH8x224TOV42eoOf3CIFgUK3fbwqbPhc/8b8UlpRWxea10ERRrAehjdjGcQnGgwleA0C0gQbaiT/jQtwl80HOA68CK4=
X-Received: by 10.99.181.13 with SMTP id y13mr4387026pge.196.1516713138324;
	Tue, 23 Jan 2018 05:12:18 -0800 (PST)
MIME-Version: 1.0
References: <1516667706-44706-1-git-send-email-juro.bystricky@intel.com>
In-Reply-To: <1516667706-44706-1-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jan 2018 13:12:07 +0000
Message-ID: <CAMKF1soJseyFgHpj9EntbhE1PDuB7YFgN3UKdS5u-p1FNedp_w@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glibc-locale.inc: avoid duplicate packages
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
X-List-Received-Date: Tue, 23 Jan 2018 13:12:17 -0000
Content-Type: multipart/alternative; boundary="94eb2c1bec64d60bc20563714b67"

--94eb2c1bec64d60bc20563714b67
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 22, 2018 at 6:34 PM Juro Bystricky <juro.bystricky@intel.com>
wrote:

> PACKAGES_DYNAMIC contained an identical set of packages twice.
> I suspect this was a result of global search/replace when moving
> recipes from eglibc to glibc long time ago.


Looks ok to apply

>
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-core/glibc/glibc-locale.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc
> b/meta/recipes-core/glibc/glibc-locale.inc
> index 1a629fc..b3cb10b 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -39,7 +39,6 @@ PACKAGES = "localedef ${PN}-dbg"
>
>  PACKAGES_DYNAMIC = "^locale-base-.* \
>                      ^glibc-gconv-.* ^glibc-charmap-.*
> ^glibc-localedata-.* ^glibc-binary-localedata-.* \
> -                    ^glibc-gconv-.*  ^glibc-charmap-.*
> ^glibc-localedata-.*  ^glibc-binary-localedata-.* \
>                      ^${MLPREFIX}glibc-gconv$"
>
>  # Create a glibc-binaries package
> --
> 2.7.4
>
>

--94eb2c1bec64d60bc20563714b67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mon, Jan 22, 2018 =
at 6:34 PM Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com">j=
uro.bystricky@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">PACKAGES_DYNAMIC contained an identical set of packages twice.<br>
I suspect this was a result of global search/replace when moving<br>
recipes from eglibc to glibc long time ago.</blockquote><div dir=3D"auto"><=
br></div><div dir=3D"auto">Looks ok to apply</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><br>
<br>
Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.co=
m" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-locale.inc | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/g=
libc/glibc-locale.inc<br>
index 1a629fc..b3cb10b 100644<br>
--- a/meta/recipes-core/glibc/glibc-locale.inc<br>
+++ b/meta/recipes-core/glibc/glibc-locale.inc<br>
@@ -39,7 +39,6 @@ PACKAGES =3D &quot;localedef ${PN}-dbg&quot;<br>
<br>
=C2=A0PACKAGES_DYNAMIC =3D &quot;^locale-base-.* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^glibc-gconv-.* ^glibc-charmap-.* ^glibc-localedata-.* ^glibc-binary-loc=
aledata-.* \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^gli=
bc-gconv-.*=C2=A0 ^glibc-charmap-.*=C2=A0 ^glibc-localedata-.*=C2=A0 ^glibc=
-binary-localedata-.* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^${MLPREFIX}glibc-gconv$&quot;<br>
<br>
=C2=A0# Create a glibc-binaries package<br>
--<br>
2.7.4<br>
<br>
</blockquote></div></div>

--94eb2c1bec64d60bc20563714b67--
