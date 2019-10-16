Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 77C747C7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 01:08:02 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id z67so21140646qkb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 18:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rZVVVObC9lBS6C1XDuSjdo0wukARRzA8tdHByJxQlnM=;
	b=NfBXlNJma+VRNbDNQAXBIiCLOcICSEl6YFs5/bSW7CE9bVh6YUzf5T+xjqOdM+kHzk
	B3ziH7c4NDyjceAqAxUbKA9KW852inOYWcQag27dLsgp5Ibigv6beSFgQok0s1qKV3SY
	aRVS0G1CFvX/RWhFvanYZvjuDtX/2DRkYxWL/0+URyO7DwVV2yWcepAr43SyvQdJcdZ9
	hNdyN+WocZXhRlfOgxWLkBtfvcz88Di9g05FDVT4tJW0a4WGiK3t3nrObIbErLGUrEzg
	68qxCBbLucA5MN0eC/03ZjfCj71eZClri4Ci4xTH63sceHPITf+umVGtMRtI+b4/etz7
	/3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rZVVVObC9lBS6C1XDuSjdo0wukARRzA8tdHByJxQlnM=;
	b=MPd4kIVF4dH8tupYwZakERvX/vF6E54gV1+fefB0W+KAtNQbu+bOHM8FYywQ47htiJ
	diylsaAVZ9rHBGaMyNvEp8uaKjAfXVdJlVjgtxQAVyiN1CLN+ctbZOBLa6YprxuwDRL1
	dBpMt5fBLiKXbEE0B/VDGBN+UDAnDLAKIlD2jgW7+e6waYO69GgAq0MaWiF5wBpBQgLq
	r654rQFb6ugMFufJL8yoVLZd8KnDSLwkjzJwzd/b2ZrSCICwy1L1yoJIhNnAeBqe39rs
	Y+yCxSyJyLU73zBG+sGIYdAIjA/2sVFn8JHQZuWjGeyxfzVWrfOTFLlXPGnusBOpqW+r
	OGzA==
X-Gm-Message-State: APjAAAWsMaExzzk83ApCnAaRHwkcZw3oL8xN3f+8cl0UL9XNB4nXqRtE
	IFm+IWz7WRIbctj2vdqFsImhtprsEF3iDW+SC8E=
X-Google-Smtp-Source: APXvYqwXLm6rQ1Vi0PPXlh/EojXfpEwtmxPC7PEkXXwXQoTgoUX1Pp1SJ/oaWauvHb+6Nm2Tr8bXJ4wbSrFQObsmGTk=
X-Received: by 2002:ae9:f30e:: with SMTP id p14mr37189668qkg.71.1571188082510; 
	Tue, 15 Oct 2019 18:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191014151549.30432-1-aatrapps@gmail.com>
In-Reply-To: <20191014151549.30432-1-aatrapps@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Oct 2019 18:07:51 -0700
Message-ID: <CAMKF1spEp6ko=De1RmoxUAYBBi_rVeq2RwZ=UsicnJAbpY-cXg@mail.gmail.com>
To: Aatir <aatrapps@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: nlohmann-fifo
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
X-List-Received-Date: Wed, 16 Oct 2019 01:08:03 -0000
Content-Type: multipart/alternative; boundary="000000000000888fdf0594fcbb20"

--000000000000888fdf0594fcbb20
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 14, 2019 at 8:46 PM Aatir <aatrapps@gmail.com> wrote:

> From: Tekkub <aatrapps@gmail.com>
>
> Adding the nlohmann-fifo, c++ library for fifo maps.
>
> Signed-off-by: Aatir <aatrapps@gmail.com>
> ---
>  .../nlohmann-fifo/nlohmann-fifo_git.bb        | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/nlohmann-fifo/
> nlohmann-fifo_git.bb
>
> diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> new file mode 100644
> index 000000000..afab2eac4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "fifo maps for c++"
> +HOMEPAGE = "/"


This needs to point to a valid url

>
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.MIT;md5=b67209a1e36b682a8226de19d265b1e0"
> +
> +SRC_URI = "git://github.com/nlohmann/fifo_map.git"
> +
> +PV = "1.0.0+git${SRCPV}"
> +
> +SRCREV = "0dfbf5dacbb15a32c43f912a7e66a54aae39d0f9"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN}-dev = ""


Why is this needed ?


> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +do_install() {
> +    install -d ${D}${includedir}


Delete this line


> +    install -m 0644 ${S}/src/fifo_map.hpp ${D}${includedir}/fifo_map.hpp


Use install -D -m

>
> +}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000888fdf0594fcbb20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 14, 2019 at 8:46 PM Aatir &lt;<a href=3D"mailto=
:aatrapps@gmail.com">aatrapps@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">From: Tekkub &lt;<a href=3D"mailto:aatrapps@gmail.com" =
target=3D"_blank">aatrapps@gmail.com</a>&gt;<br>
<br>
Adding the nlohmann-fifo, c++ library for fifo maps.<br>
<br>
Signed-off-by: Aatir &lt;<a href=3D"mailto:aatrapps@gmail.com" target=3D"_b=
lank">aatrapps@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../nlohmann-fifo/<a href=3D"http://nlohmann-fifo_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">nlohmann-fifo_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 22 +++++++++++++++++++<br>
=C2=A01 file changed, 22 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/nlohmann-fifo/<a href=3D"=
http://nlohmann-fifo_git.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-=
fifo_git.bb</a><br>
<br>
diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/<a href=3D"http://nlohm=
ann-fifo_git.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-fifo_git.bb<=
/a> b/meta-oe/recipes-devtools/nlohmann-fifo/<a href=3D"http://nlohmann-fif=
o_git.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-fifo_git.bb</a><br>
new file mode 100644<br>
index 000000000..afab2eac4<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/<a href=3D"http://nlohmann-fif=
o_git.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-fifo_git.bb</a><br>
@@ -0,0 +1,22 @@<br>
+SUMMARY =3D &quot;fifo maps for c++&quot;<br>
+HOMEPAGE =3D &quot;/&quot;</blockquote><div dir=3D"auto"><br></div><div di=
r=3D"auto">This needs to point to a valid url=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
+SECTION =3D &quot;libs&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.MIT;md5=3Db67209a1e36b682a8226de=
19d265b1e0&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/nlohmann/fifo_map.git=
" rel=3D"noreferrer" target=3D"_blank">github.com/nlohmann/fifo_map.git</a>=
&quot;<br>
+<br>
+PV =3D &quot;1.0.0+git${SRCPV}&quot;<br>
+<br>
+SRCREV =3D &quot;0dfbf5dacbb15a32c43f912a7e66a54aae39d0f9&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+RDEPENDS_${PN}-dev =3D &quot;&quot;</blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Why is this needed ?</div><div dir=3D"auto"><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -d ${D}${includedir}</blockquote><div dir=3D"auto"><=
br></div><div dir=3D"auto">Delete this line=C2=A0</div><div dir=3D"auto"><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br>
+=C2=A0 =C2=A0 install -m 0644 ${S}/src/fifo_map.hpp ${D}${includedir}/fifo=
_map.hpp</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Use inst=
all -D -m=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
+}<br>
-- <br>
2.17.1<br>
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

--000000000000888fdf0594fcbb20--
