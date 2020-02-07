Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
	[209.85.222.54])
	by mail.openembedded.org (Postfix) with ESMTP id DDFF960634
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 22:09:25 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id c7so431448uaf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 14:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WsKRlGON7/XKt8rkCHaKpfayqcZ7XCQcgHx3eZ152iE=;
	b=rdfglJvrEEbXyYWgelXLgRyzpgsj76l7VMTKFdtsFX+2oNsbcM0eJ0aJTOqB6P7TLv
	3vrdtmz6PSmyLmoCMT6aVI6N7kADnkgogwW4bcNk+xbB6EiVT+tYzWjXoypn+SCfWaEX
	EoiHtQTffxlYxulsIh/5TDBpJfZqTcTdEmYukmDfLsLT1JzRpR09qMJjzIUI0azBMoeG
	lcCi+98U0B462k9Jkj8UhvM8zki0PnjxxjpuSBSwxHNhrtmB0K7gHil+dEtIWxWzYTJB
	9z7v2jAhOHdiGWNH3FPq8HD+WvUOm4x9lbVJFPWSPS2drh9jDcTY3IidWtyq47eDpFrQ
	LOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WsKRlGON7/XKt8rkCHaKpfayqcZ7XCQcgHx3eZ152iE=;
	b=L4t282SSSsSnG7cA+Cu1fnfuSvX5Y4KppKfxqamqHVU0O+rzhF7UxQP3k6DLOdWuRN
	iX7hi7RXOSNL+vB0MTguHHFXcQLCWPLY91tlkCvjTRpn27jiyWmtaOEN5yhGkmZCGsjY
	EY3veAs0JodiNFhN2ar/zfEcCCuXyJJsA6AQFUi2WSuaikd7HLgp/H1e0qqHiRbaEzXn
	9JLakP/j7p6o8L9xGSL2LKSHTD+xbppswq5ujBa7d1NVHEPNnNVdPJbzGUD4g2NkY/y2
	PdU1AIEXfgGXjRttGKps+xOIEHMPIKof+8vkgFcMjhHobSxSkbH3QrVhdsElMvUWX+0z
	7Tjg==
X-Gm-Message-State: APjAAAXWclCgdTXZsM5mJnhe+verlTfJxUCtjPxpEoxq971S09wBjsqS
	ZdoQcgUfUeyr9QaOZU5YfUL/WQ0d/66WKpbFYlY=
X-Google-Smtp-Source: APXvYqwMBUB8z2RKCj8zHAU5Y1V5y84x8NGVlIsi8zDwnZSfab/7L2bOF9y/p9b/HbKhyZyhTAEJ6+Oz76+OdO56AIw=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr564137uak.22.1581113366785;
	Fri, 07 Feb 2020 14:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20200207213440.10462-1-scott.branden@broadcom.com>
In-Reply-To: <20200207213440.10462-1-scott.branden@broadcom.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Feb 2020 23:09:15 +0100
Message-ID: <CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x265: add x265 recipe
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
X-List-Received-Date: Fri, 07 Feb 2020 22:09:26 -0000
Content-Type: multipart/alternative; boundary="00000000000093b0f5059e03a472"

--00000000000093b0f5059e03a472
Content-Type: text/plain; charset="UTF-8"

Can you also enable x265 in ffmpeg and gstreamer plugins recipes, so there
would be actual users of the codec in oe-core?

Also, x265 git repo does have tagged releases, and so PV/SRCREV in recipe
should be set to match a release tag.

Alex

On Fri, 7 Feb 2020 at 22:35, Scott Branden via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> Add x265 recipe from latest revision of stable branch.
>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  meta/recipes-multimedia/x265/x265_git.bb | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>
> diff --git a/meta/recipes-multimedia/x265/x265_git.bb
> b/meta/recipes-multimedia/x265/x265_git.bb
> new file mode 100644
> index 0000000000..7c230e2b1e
> --- /dev/null
> +++ b/meta/recipes-multimedia/x265/x265_git.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "H.265/HEVC video encoder"
> +DESCRIPTION = "A free software library and application for encoding video
> streams into the H.265/HEVC format."
> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
> +
> +LICENSE = "GPLv2"
> +LICENSE_FLAGS = "commercial"
> +LIC_FILES_CHKSUM =
> "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
> +
> +DEPENDS = "nasm-native"
> +DEPENDS = "gnutls zlib libpcre"
> +
> +SRC_URI = "git://github.com/videolan/x265;branch=stable \
> +          "
> +
> +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
> +
> +S = "${WORKDIR}/git/source"
> +
> +inherit lib_package pkgconfig cmake
> +
> +AS[unexport] = "1"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000093b0f5059e03a472
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you also enable x265 in ffmpeg and gstreamer plug=
ins recipes, so there would be actual users of the codec in oe-core?</div><=
div><br></div><div>Also, x265 git repo does have tagged releases, and so PV=
/SRCREV in recipe should be set to match a release tag.<br></div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, 7 Feb 2020 at 22:35, Scott Branden via Open=
embedded-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.or=
g">openembedded-core@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Add x265 recipe from latest revi=
sion of stable branch.<br>
<br>
Signed-off-by: Scott Branden &lt;<a href=3D"mailto:scott.branden@broadcom.c=
om" target=3D"_blank">scott.branden@broadcom.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/x265/<a href=3D"http://x265_git.bb" rel=3D"no=
referrer" target=3D"_blank">x265_git.bb</a> | 21 +++++++++++++++++++++<br>
=C2=A01 file changed, 21 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/x265/<a href=3D"http://x26=
5_git.bb" rel=3D"noreferrer" target=3D"_blank">x265_git.bb</a><br>
<br>
diff --git a/meta/recipes-multimedia/x265/<a href=3D"http://x265_git.bb" re=
l=3D"noreferrer" target=3D"_blank">x265_git.bb</a> b/meta/recipes-multimedi=
a/x265/<a href=3D"http://x265_git.bb" rel=3D"noreferrer" target=3D"_blank">=
x265_git.bb</a><br>
new file mode 100644<br>
index 0000000000..7c230e2b1e<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/x265/<a href=3D"http://x265_git.bb" rel=3D"no=
referrer" target=3D"_blank">x265_git.bb</a><br>
@@ -0,0 +1,21 @@<br>
+SUMMARY =3D &quot;H.265/HEVC video encoder&quot;<br>
+DESCRIPTION =3D &quot;A free software library and application for encoding=
 video streams into the H.265/HEVC format.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.videolan.org/developers/x265.html=
" rel=3D"noreferrer" target=3D"_blank">http://www.videolan.org/developers/x=
265.html</a>&quot;<br>
+<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LICENSE_FLAGS =3D &quot;commercial&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://../COPYING;md5=3Dc9e0427bc58f129f99728c6=
2d4ad4091&quot;<br>
+<br>
+DEPENDS =3D &quot;nasm-native&quot;<br>
+DEPENDS =3D &quot;gnutls zlib libpcre&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/videolan/x265;branch=
=3Dstable" rel=3D"noreferrer" target=3D"_blank">github.com/videolan/x265;br=
anch=3Dstable</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+SRCREV =3D &quot;4ef6b67fd46e1584e52a11a264812edcaef02526&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git/source&quot;<br>
+<br>
+inherit lib_package pkgconfig cmake<br>
+<br>
+AS[unexport] =3D &quot;1&quot;<br>
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
</blockquote></div>

--00000000000093b0f5059e03a472--
