Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id C0FC260746
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Nov 2017 06:19:53 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id h34so4470118uaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Nov 2017 23:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jOBs4wxWJ9AwdRgUQILawEQpRkI+JgEA4RwbqQ4kg8Y=;
	b=t+UbEC3iQtmQQyfYwgFEkt94knLolllz60ZGn7yE3qwAn4ZK5y23B+H6Y5/x7EXsoc
	tPH/5+e5ZfLZghCEy1QPwIlbpSb2SEOd+1R5D8CThhdsqqLorAEFhMdwhb/yq+1o0sg/
	J1BPP29U1ybpuU3fiJXrGfonayzOsMqhaywTZlQFuyxZQs+guvpAWUdPPjse04hWMsN1
	xQbwLXqGjsZaGZe5a4P8zruWgpx1jfKrwuWEqJsAeoOzjuk1Z1aYXUd4LPDRH9aZQtDG
	82w13G59/Uv0a/pMrND+ly9US8Xa25C/pMFRLulE1xkqIVIn0moQbiHz5UmobX51fcL/
	h3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jOBs4wxWJ9AwdRgUQILawEQpRkI+JgEA4RwbqQ4kg8Y=;
	b=tHUKP5+zh59YG4k7qOKTmnCHqkUWuS6nJE9ENWmjW8p7fFp5vD+b1C8bkWFilX+4QV
	YOjWwhikxoWSN4rdtd7YvKxHzKlrPWsQGMKqMLc6rMjlfFoXKYL49na7e9Ms9+my2e9m
	6+r1GnKD1gKIoV3mXyILIOra+5iLUjYO4pBwr9zTnTnqcAO0lKX7RJSXqKB2C8mSsQR1
	0dZy4HOPRt7HTZPiLiOgkI2Pag91GvBIdmE7LK6kRCYg8A9HLwtNwlndp3qBVhh5wJbt
	DPhNUk4WuCmRc27XvGVFFOCqFzyvR1p6bSJEnKarqLhXFOQXni/IUJj3gS8SqpoLJm4P
	oTgg==
X-Gm-Message-State: AJaThX4a92tH4fm0JxxAsRHh12U8fcsjASVA7C1c9ZeyOH2yfD7k3B+a
	1R341JaBmBLdlfxlq5dAOJgISRUqR3/IJ7hmvGo=
X-Google-Smtp-Source: ABhQp+QuSqWFS+UI7Lp8knxDoihoW2wantwHfRuMGS2+HL+uxZPTJ7o8Nd/p3zA1Dss8v1NP+ZSZkYkzXmo4RSXGcdY=
X-Received: by 10.176.22.10 with SMTP id k10mr8319043uae.6.1509862794601; Sat,
	04 Nov 2017 23:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20171105002559.4822-1-moritz.fischer@ettus.com>
In-Reply-To: <20171105002559.4822-1-moritz.fischer@ettus.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 05 Nov 2017 06:19:44 +0000
Message-ID: <CANx9H-A2iAvLn6c=f7brT_fFF8z8LgYLRS9Zp_vYGRhxw0AAFw@mail.gmail.com>
To: Moritz Fischer <moritz.fischer@ettus.com>,
	openembedded-core@lists.openembedded.org
Cc: mdf@kernel.org
Subject: Re: [PATCH] python-mako: Add back the python2 version.
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
X-List-Received-Date: Sun, 05 Nov 2017 06:19:54 -0000
Content-Type: multipart/alternative; boundary="001a1145761a8829f8055d365312"

--001a1145761a8829f8055d365312
Content-Type: text/plain; charset="UTF-8"

Or move it to meta-python, oe-core is trying to slim down to python3 only.
On Sat, Nov 4, 2017 at 5:27 PM Moritz Fischer <moritz.fischer@ettus.com>
wrote:

> Add back the recipe for the python2 version.
>
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>
> Is it possible to get that backported into rocko? I somehow didn't see
> the patch that removed it go out on the list.
>
>
> Cheers,
>
> Moritz
>
> ---
>  meta/recipes-devtools/python/python-mako_1.0.7.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python-mako_1.0.7.bb
>
> diff --git a/meta/recipes-devtools/python/python-mako_1.0.7.bb
> b/meta/recipes-devtools/python/python-mako_1.0.7.bb
> new file mode 100644
> index 0000000000..767c7c3696
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-mako_1.0.7.bb
> @@ -0,0 +1,11 @@
> +require python-mako.inc
> +
> +inherit setuptools
> +
> +RDEPENDS_${PN} = "python-threading \
> +                  python-netclient \
> +                  python-html \
> +"
> +RDEPENDS_${PN}_class-native = ""
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1145761a8829f8055d365312
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Or move it to meta-python, oe-core is trying to slim down to python3 only.<=
br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Nov 4, 2017 at 5:27 =
PM Moritz Fischer &lt;<a href=3D"mailto:moritz.fischer@ettus.com">moritz.fi=
scher@ettus.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add =
back the recipe for the python2 version.<br>
<br>
Signed-off-by: Moritz Fischer &lt;<a href=3D"mailto:moritz.fischer@ettus.co=
m" target=3D"_blank">moritz.fischer@ettus.com</a>&gt;<br>
---<br>
<br>
Is it possible to get that backported into rocko? I somehow didn&#39;t see<=
br>
the patch that removed it go out on the list.<br>
<br>
<br>
Cheers,<br>
<br>
Moritz<br>
<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python-mako_1.0.7.bb" =
rel=3D"noreferrer" target=3D"_blank">python-mako_1.0.7.bb</a> | 11 ++++++++=
+++<br>
=C2=A01 file changed, 11 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon-mako_1.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python-mako_1.0.7.b=
b</a><br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python-mako_1.0=
.7.bb" rel=3D"noreferrer" target=3D"_blank">python-mako_1.0.7.bb</a> b/meta=
/recipes-devtools/python/<a href=3D"http://python-mako_1.0.7.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-mako_1.0.7.bb</a><br>
new file mode 100644<br>
index 0000000000..767c7c3696<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python-mako_1.0.7.bb" =
rel=3D"noreferrer" target=3D"_blank">python-mako_1.0.7.bb</a><br>
@@ -0,0 +1,11 @@<br>
+require python-mako.inc<br>
+<br>
+inherit setuptools<br>
+<br>
+RDEPENDS_${PN} =3D &quot;python-threading \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-netc=
lient \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-html=
 \<br>
+&quot;<br>
+RDEPENDS_${PN}_class-native =3D &quot;&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
--<br>
2.14.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a1145761a8829f8055d365312--
