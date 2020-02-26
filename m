Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6544D60635
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 02:04:53 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z1so1546893iom.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SEnOCHwqiwPPgEw2070iaYxcTc9PCDsZyTGln2ZZT7c=;
	b=QiFpipJFkxwyWl2OxSvc3vVNIapF+Kwiw5IjjyPaStmSGtRvZCgpH7ROCyATxauld+
	4+LcFLB4pr2Djp8KInsW+5qMFuEEeEVOVJ9Cnq5WHwnT/qgYzMantGRJ2lR7ukXPK7In
	DKulheEyqnokhuKvXOlynWig/yviZ1En9x0lwYeQCQRjqmqgzHIJbwMNdMVLwx4/Zcs2
	Q5yVHf9inpPxItCqpicoovCB80ZHDUxCrD3JRqH8A80H6CXAOJjGRUU06ox+ouctD3rP
	5WIRHihuHeD6gNYh57rffnLFI9Twxx6hKLP8fSVk/wDCyoM8CHMILL4z4rT6XtJ2ABqK
	KMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SEnOCHwqiwPPgEw2070iaYxcTc9PCDsZyTGln2ZZT7c=;
	b=IxyFkadpzMnPbKWQ7BlEfvylsBeepiSTgR3p5Z+p6LM//lr93zyfkcia9ADNsB2vIn
	95QkK3AWdWFmHBut07KTNKaBS0NEpV6ePpxvWq/tVLDt34J5ca1G2p08WHv8+vB3YxLu
	qo+R8qV3WK0Z27AWKYLvPFTbR2XHMi3ziyRbPq9sGhIvg3oWSVUULYEVQhNh+EuZD36o
	Y147/gY3wCcb5MWa0eGx6EcNWI6yL+5gVsnOvbUyuBNTIXbUwnX+ex4xttGa6J4KfT5E
	ls/b2OIlD5i3HecNMk1YKjdVEb12/nXZr7VpH3YDdM5uTvkooimxlgLXSHnsj1XLyz4e
	3PZQ==
X-Gm-Message-State: APjAAAVq4fxVwbL8pP7pNvuYt2OvRE0ZdPKLlsEDJx9Jpr/oQKw5M8Jk
	t+oj7UpvzL+77NiiCAvhVps1u1atR+DyiI7cHb4=
X-Google-Smtp-Source: APXvYqz63HFkQpLDMXOyFRP0DVCK7m6c9zosVxzAWxzldaskHLlqYorC8bwB1X1T+hCcGplCaXOWabVzAHWSfnPFm0k=
X-Received: by 2002:a6b:700e:: with SMTP id l14mr1959101ioc.170.1582682694301; 
	Tue, 25 Feb 2020 18:04:54 -0800 (PST)
MIME-Version: 1.0
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 25 Feb 2020 18:04:43 -0800
Message-ID: <CANx9H-CEZfBsHZJP1S0eoepOqVc8S=qSRhgyvewRWwJ-RB1qQQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/12] libmodule-build-perl: upgrade 0.4229 -> 0.4231
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
X-List-Received-Date: Wed, 26 Feb 2020 02:04:53 -0000
Content-Type: multipart/alternative; boundary="000000000000c93a17059f710722"

--000000000000c93a17059f710722
Content-Type: text/plain; charset="UTF-8"

The V2 I sent earlier today should be used instead, as it improves ptests.

The V1 I sent should be shredded and burned.

On Tue, Feb 25, 2020 at 10:54 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...-build-perl_0.4229.bb => libmodule-build-perl_0.4231.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/perl/{libmodule-build-perl_0.4229.bb =>
> libmodule-build-perl_0.4231.bb} (95%)
>
> diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
> b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
> similarity index 95%
> rename from meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
> rename to meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
> index e3ba40d96c..b3bc314ee7 100644
> --- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
> +++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
> @@ -15,9 +15,9 @@ LIC_FILES_CHKSUM =
> "file://README;beginline=949;endline=954;md5=624c06db56a2af4d
>
>  SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz
> \
>             file://run-ptest \
> -          "
> -SRC_URI[md5sum] = "1447d9e02e63f7a1643986789a8f1ba9"
> -SRC_URI[sha256sum] =
> "1fe491a6cda914b01bc8e592faa2b5404e9f35915ca15322f8f2a8d8f9008c18"
> +           "
> +SRC_URI[md5sum] = "066b193e461d7dfe1eca17a139353001"
> +SRC_URI[sha256sum] =
> "7e0f4c692c1740c1ac84ea14d7ea3d8bc798b2fb26c09877229e04f430b2b717"
>
>  S = "${WORKDIR}/Module-Build-${PV}"
>
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c93a17059f710722
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">The V2 I sent earlier today should be used instead, =
as it improves ptests.</div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">The V1 I sent should be shredded and burned.</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 25, 2020=
 at 10:54 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0...-<a href=3D"http://build-perl_0.4229.bb" rel=3D"noreferrer" target=
=3D"_blank">build-perl_0.4229.bb</a> =3D&gt; <a href=3D"http://libmodule-bu=
ild-perl_0.4231.bb" rel=3D"noreferrer" target=3D"_blank">libmodule-build-pe=
rl_0.4231.bb</a>} | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/perl/{<a href=3D"http://libmodule-build-=
perl_0.4229.bb" rel=3D"noreferrer" target=3D"_blank">libmodule-build-perl_0=
.4229.bb</a> =3D&gt; <a href=3D"http://libmodule-build-perl_0.4231.bb" rel=
=3D"noreferrer" target=3D"_blank">libmodule-build-perl_0.4231.bb</a>} (95%)=
<br>
<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://libmodule-build-p=
erl_0.4229.bb" rel=3D"noreferrer" target=3D"_blank">libmodule-build-perl_0.=
4229.bb</a> b/meta/recipes-devtools/perl/<a href=3D"http://libmodule-build-=
perl_0.4231.bb" rel=3D"noreferrer" target=3D"_blank">libmodule-build-perl_0=
.4231.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-devtools/perl/<a href=3D"http://libmodule-build-pe=
rl_0.4229.bb" rel=3D"noreferrer" target=3D"_blank">libmodule-build-perl_0.4=
229.bb</a><br>
rename to meta/recipes-devtools/perl/<a href=3D"http://libmodule-build-perl=
_0.4231.bb" rel=3D"noreferrer" target=3D"_blank">libmodule-build-perl_0.423=
1.bb</a><br>
index e3ba40d96c..b3bc314ee7 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://libmodule-build-perl_0.4=
229.bb" rel=3D"noreferrer" target=3D"_blank">libmodule-build-perl_0.4229.bb=
</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://libmodule-build-perl_0.4=
231.bb" rel=3D"noreferrer" target=3D"_blank">libmodule-build-perl_0.4231.bb=
</a><br>
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM =3D &quot;file://README;beginline=3D949;=
endline=3D954;md5=3D624c06db56a2af4d<br>
<br>
=C2=A0SRC_URI =3D &quot;${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-$=
{PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;1447d9e02e63f7a1643986789a8f1ba9&quot;<br>
-SRC_URI[sha256sum] =3D &quot;1fe491a6cda914b01bc8e592faa2b5404e9f35915ca15=
322f8f2a8d8f9008c18&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRC_URI[md5sum] =3D &quot;066b193e461d7dfe1eca17a139353001&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7e0f4c692c1740c1ac84ea14d7ea3d8bc798b2fb26c09=
877229e04f430b2b717&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/Module-Build-${PV}&quot;<br>
<br>
-- <br>
2.25.0<br>
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

--000000000000c93a17059f710722--
