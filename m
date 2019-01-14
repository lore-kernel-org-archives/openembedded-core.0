Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 757FA6BCD6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 10:51:56 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id b23so17222275ios.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 02:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AzX+qt56Qb8H8WHNpXFPNLa8ACKBCAvW9YQ9D/NaZC0=;
	b=FKkbvy8Y3mDcgQsZVEMASZZ7JCdMO+WEWXvaeft2JsxTLYqATDrXmI8y3haIe3a6rZ
	LXTEfVksqgfghNum06MZ9/1aZhWipyhApQCCpb+Lzx0AGF1hox9vc3Frs1NvPL9Z8O1j
	W35ex/8V6WnZUkreaNsMr4uUu9Zc3Yndb/HFFgKISi/oXBGmQSaO4Tw2ZtQp7P48ZG25
	wGbT5l1ohvzh0fmrm4ujTgx5bRD/BPHjb2Czm+S7vS0HCB04fR9Hg8ByxVORoPmvybih
	IkhiVvrzuXMKPhpjd/srRhJq5r/cx3p98CgyTNR7QdE6ONiTWUnENHmOt9eV1l2IbB4J
	0gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AzX+qt56Qb8H8WHNpXFPNLa8ACKBCAvW9YQ9D/NaZC0=;
	b=MWNFCm6DLwzDqtxxk9mqMrP5wIDO4jO0MyOyJ5sw5vtze4QEdBkhD+IxxO8Rjz0YT6
	yz4c0WVZkcHpEHjnfWk3YdlOeNzl4dur2wss5Wel0e6E9JTc7kbqyTU+jrxu8iYIPUyB
	AhMZyxv8R4jhkpZ9mt/lv2fQV8AWURyoEsmRw7FthZkJ9IuuuNKhiQRlTe1FaApmO4S7
	3Rss/dCnglRloUpFdnjqw8gWOel6glEtxzVJJQAvq75Ao5NYybnsvErp3vkqsYQAhzcV
	VOQwEWEN7ZA13HomisHgF6f3o1fTk/B4Onwr1g0CgB8etCFWhxI/zrIkWcAcQProenMA
	U9lA==
X-Gm-Message-State: AJcUukecbs283OF8dxFpPmEG/yL03gIHQcC4+WN3MINd2Co8MHAYjy19
	a8KfzQSk/MFexQNpgkgymgAhoxQ+ZFlZXhNMB9q/jQ==
X-Google-Smtp-Source: ALg8bN62dYMKzbBzn/bH7BRwCshYjwGbGyI1V/g5aDK87xJBzulZfZTaK+wPa1my+7TdbJqkY/m4E1aYQ4XrnNGU+is=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr13989756iog.270.1547463117457;
	Mon, 14 Jan 2019 02:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20190111101609.5587-1-samuli.piippo@qt.io>
In-Reply-To: <20190111101609.5587-1-samuli.piippo@qt.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jan 2019 10:51:46 +0000
Message-ID: <CAJTo0Lazeqsrp7EUoX0uZHRf5k6_yfy=M2anyFDenMAbS-iYZw@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@qt.io>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sdl2: fix sdl2.pc include paths
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
X-List-Received-Date: Mon, 14 Jan 2019 10:51:56 -0000
Content-Type: multipart/alternative; boundary="0000000000006b608f057f68d5b7"

--0000000000006b608f057f68d5b7
Content-Type: text/plain; charset="UTF-8"

Would it be easier to just remove @SDL_CFLAGS@ from sdl.pc.in?  Does that
contain other values that are needed, or are they all spurious?

Ross

On Sat, 12 Jan 2019 at 08:43, Samuli Piippo <samuli.piippo@qt.io> wrote:

> SDL2 dumps all cflags to the sdl2.pc, which might then contain paths
> to the recipe sysroot include dirs.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> index 812a9abf3c..a9c5d8a443 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> @@ -64,6 +64,10 @@ do_configure_prepend() {
>          export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
>  }
>
> +do_install_append() {
> +    sed -i -e "s|${STAGING_INCDIR}|$\{includedir}|g"
> ${D}${libdir}/pkgconfig/sdl2.pc
> +}
> +
>  FILES_${PN}-dev += "${libdir}/cmake"
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006b608f057f68d5b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would it be easier to just remove=C2=A0@SDL_CFLAGS@ from <=
a href=3D"http://sdl.pc.in">sdl.pc.in</a>?=C2=A0 Does that contain other va=
lues that are needed, or are they all spurious?<div><br></div><div>Ross</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, 12 Jan 2019=
 at 08:43, Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@qt.io">samuli.=
piippo@qt.io</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;border-left-color:rgb(204,204,204);padding-left:1ex">SDL2 dumps all cflags=
 to the sdl2.pc, which might then contain paths<br>
to the recipe sysroot include dirs.<br>
<br>
Signed-off-by: Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@qt.io" tar=
get=3D"_blank">samuli.piippo@qt.io</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.8.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.8.=
bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.8.bb</a> b/meta/recipe=
s-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libsdl2_2.0.8.bb</a><br>
index 812a9abf3c..a9c5d8a443 100644<br>
--- a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.8.bb</a><br>
+++ b/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.8.bb</a><br>
@@ -64,6 +64,10 @@ do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR<=
br>
=C2=A0}<br>
<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 sed -i -e &quot;s|${STAGING_INCDIR}|$\{includedir}|g&quot; $=
{D}${libdir}/pkgconfig/sdl2.pc<br>
+}<br>
+<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/cmake&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
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

--0000000000006b608f057f68d5b7--
