Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id A986B7851F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 21:42:58 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id q76so6988848pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 14:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2vonHVF+8zBJbD0MDQ5gFsDxzbEC0kC8dnYQfoQZPFI=;
	b=YzQXohvSxh7YUkYQcd6An30xEy6JfYt7XHX3cZF4n97n8iYvj/RDzJRYURVkLT1z1k
	BxbDY3RPgXtf5CJE8r3b8ZAPoVkh60Qe0NFvb4G54XDwEvryoA0IKJ4jM6p9kpoHwlG3
	8bDgWMBI2ZlbG/SDVQU04A7E3WXDjzi5AmYa7HV2tvD3B5pdyMAujrLzz9Mrz3ITvO+Y
	60WoYpHNncsManDLD5ESJJ8oXV0JSOPGLr19J0OFwF6iwnhC5xzZDJIlutRhI6zv5hX/
	dvANT+WbvJbHT3/rcSmAYesjpVvEmCH2F65w2rX3J8EpdELZPp7S9PsGvxHndmb6lyzr
	Z5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2vonHVF+8zBJbD0MDQ5gFsDxzbEC0kC8dnYQfoQZPFI=;
	b=PmWQuyE7sjbu5u1kh+xXY5tFozhbQ+kJcB9ONYjpXPX2S5gL7o3m1apg73R5umuxcV
	1HlptHx5SCc3+m2lBFUFsUfRPuNv6kwpPJm6emEx+7FRJU92lVdNGvWAFjccuL9VDPeo
	Yr1Dw9oKUOBRPpFFf5RSqkjacwxxk7sZwSpRofLLlHSXiGYyjaEfY53qd8JIXDsoTih2
	QHAOf+dSsIBLLg9KrS05vXRpDpkJ9xBcpc6nK/RYGY6cI4+LLeF6x/1h4gttgxMxltlc
	UEE73N9pEcVUPrp4dZxVPLWanauJPFCEdUYyie2C1WELY1ysIys+PxnBpw2NATFB9xyn
	2OMg==
X-Gm-Message-State: AHPjjUhGknGgqzhSSKjAfwVQ181sMOr4gHYOI88J0m1vPQ3c1jAHa2m7
	J2n3rh01LrijUWpeqgwE4S922S3EH9sjl2/Vnjs=
X-Google-Smtp-Source: AOwi7QCO33/JHSN6mmsYDc6U+QHMeTmssitY6K0vGIKDqDp2Yn1zopPdBNl9wUg8WljWgosnMfstsIoeQMn6XXuXruU=
X-Received: by 10.99.51.15 with SMTP id z15mr2980660pgz.287.1505252579727;
	Tue, 12 Sep 2017 14:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20170912210320.9728-1-mkelly@xevo.com>
In-Reply-To: <20170912210320.9728-1-mkelly@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Sep 2017 21:42:48 +0000
Message-ID: <CAMKF1sqWbzaDZsrUtuvKH3ieDLVPXfzG5y-1vO-p0GU0Xg-DdQ@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python*native.bbclass: suppress user site dirs
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
X-List-Received-Date: Tue, 12 Sep 2017 21:42:58 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b46324fdef7055904edd2"

--94eb2c0b46324fdef7055904edd2
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 2:03 PM Martin Kelly <mkelly@xevo.com> wrote:

> Currently, $HOME/.local is being added into sys.path for the native
> Python, causing subtle host contamination. Suppress this by exporting
> PYTHONNOUSERSITE = "1" as documented in PEP 370.
>

LGTM

>
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  meta/classes/python3native.bbclass | 3 +++
>  meta/classes/pythonnative.bbclass  | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/meta/classes/python3native.bbclass
> b/meta/classes/python3native.bbclass
> index ef468b3fde..89665efee8 100644
> --- a/meta/classes/python3native.bbclass
> +++ b/meta/classes/python3native.bbclass
> @@ -9,5 +9,8 @@ DEPENDS_append = " ${PYTHON_PN}-native "
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
>
> +# suppress host user's site-packages dirs.
> +export PYTHONNOUSERSITE = "1"
> +
>  # autoconf macros will use their internal default preference otherwise
>  export PYTHON
> diff --git a/meta/classes/pythonnative.bbclass
> b/meta/classes/pythonnative.bbclass
> index 4e0381b568..4cc8b2769c 100644
> --- a/meta/classes/pythonnative.bbclass
> +++ b/meta/classes/pythonnative.bbclass
> @@ -12,5 +12,8 @@ DEPENDS_append = " ${PYTHON_PN}-native "
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
>
> +# suppress host user's site-packages dirs.
> +export PYTHONNOUSERSITE = "1"
> +
>  # autoconf macros will use their internal default preference otherwise
>  export PYTHON
> --
> 2.11.0
>
>

--94eb2c0b46324fdef7055904edd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Tue, Sep 12, 2017 =
at 2:03 PM Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com">mkelly@xevo.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Currently, $HOME=
/.local is being added into sys.path for the native<br>
Python, causing subtle host contamination. Suppress this by exporting<br>
PYTHONNOUSERSITE =3D &quot;1&quot; as documented in PEP 370.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">LGTM</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br>
Signed-off-by: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com" target=
=3D"_blank">mkelly@xevo.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/python3native.bbclass | 3 +++<br>
=C2=A0meta/classes/pythonnative.bbclass=C2=A0 | 3 +++<br>
=C2=A02 files changed, 6 insertions(+)<br>
<br>
diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3nativ=
e.bbclass<br>
index ef468b3fde..89665efee8 100644<br>
--- a/meta/classes/python3native.bbclass<br>
+++ b/meta/classes/python3native.bbclass<br>
@@ -9,5 +9,8 @@ DEPENDS_append =3D &quot; ${PYTHON_PN}-native &quot;<br>
=C2=A0export STAGING_INCDIR<br>
=C2=A0export STAGING_LIBDIR<br>
<br>
+# suppress host user&#39;s site-packages dirs.<br>
+export PYTHONNOUSERSITE =3D &quot;1&quot;<br>
+<br>
=C2=A0# autoconf macros will use their internal default preference otherwis=
e<br>
=C2=A0export PYTHON<br>
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.=
bbclass<br>
index 4e0381b568..4cc8b2769c 100644<br>
--- a/meta/classes/pythonnative.bbclass<br>
+++ b/meta/classes/pythonnative.bbclass<br>
@@ -12,5 +12,8 @@ DEPENDS_append =3D &quot; ${PYTHON_PN}-native &quot;<br>
=C2=A0export STAGING_INCDIR<br>
=C2=A0export STAGING_LIBDIR<br>
<br>
+# suppress host user&#39;s site-packages dirs.<br>
+export PYTHONNOUSERSITE =3D &quot;1&quot;<br>
+<br>
=C2=A0# autoconf macros will use their internal default preference otherwis=
e<br>
=C2=A0export PYTHON<br>
--<br>
2.11.0<br>
<br>
</blockquote></div></div>

--94eb2c0b46324fdef7055904edd2--
