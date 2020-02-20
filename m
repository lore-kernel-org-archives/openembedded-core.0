Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 53C7D60ADE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:55:41 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id m195so1370531vkh.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IIfil3nP9K9WRgRhflWLiKSqs+E4FrEGZ1vKWY5sLzI=;
	b=gEeGOKlrneuk/i2K1kx5rgYN7k05tIi5elWRdCEVum3zDcvLDWB6onZsmZyltxnDTT
	b2h/alQ8RIgb3bCvko197kbodYuV3dTNL6169EP88wVJ5Cdj9I55XS5aGbddFhoit3Vo
	dYl0hdM/zXngVBuEDqqASsUxzjsx56OSCetACobwSniXNspW96xuc2IG7DC66JH/AbWa
	GXWJiKv1n7Kpz4hM3aaeC+p6BkbwjmPWCK+8oJGX2hyhY+kwx/SSFGjzCx5+BhMLD7OP
	QysuSU172LBfXzKr+b2vCOsTvfNz3mIoM8LyLp2Mou/r33YLVwVy9YOzDUkqPTzTUc8Q
	TW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IIfil3nP9K9WRgRhflWLiKSqs+E4FrEGZ1vKWY5sLzI=;
	b=iRj7wT28KRdWaor/SqFUtwzVCA8LjHfIi3+50dTP19JOcP+9GZrWtOXE3xbfzJnId3
	5J0c449rEHaHYLAIWvupGZGohHL3IIXgSEt2LUC+tyjs6Hzi//PjM8Hth6oK6ZXk14ue
	dYv3md3/Re2E4YZy5+eGw+DM602BkR0lnqlRqcPV2ukM1Cyta/CFdO8Ma0RHgz3/zAI8
	fRDeTTNtrnMNGrD4VYeh0osSOXKt5e7NAfP2KOCiDjA0zr7yfpUu6mL0TgjWP9v5vu7f
	PMt3T6J+g++TykSUvqT/ECnpNW/1rOh6Kd/gCHTwBT8bxY1JLWacFWWbEuYExEsqeG0v
	uj1Q==
X-Gm-Message-State: APjAAAV/xVf5zb762ykeCt0uY7a5+8CEM3rX94FXFx1DLPELE50hrBn7
	l+Ywk2j9OEEuxZ4Mj7fGtiiEVnVFWOzKCy2aok8=
X-Google-Smtp-Source: APXvYqzKiFMiaDFFkSv0vqJCZO710pRJoFjvQaOreXK/F+5MjCZU+yEE9joXGT89s+2zid7O3DKkWz5ER4LFjUw5mro=
X-Received: by 2002:a1f:738c:: with SMTP id o134mr5571721vkc.9.1582217742255; 
	Thu, 20 Feb 2020 08:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20200220165318.3677793-1-raj.khem@gmail.com>
	<20200220165318.3677793-2-raj.khem@gmail.com>
In-Reply-To: <20200220165318.3677793-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Feb 2020 17:56:05 +0100
Message-ID: <CANNYZj8sZta1yKnGct46t+QhL4y3egBhjuOqXoY+-LHKj8wEyA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 20 Feb 2020 16:55:41 -0000
Content-Type: multipart/alternative; boundary="0000000000007c0a27059f04c69b"

--0000000000007c0a27059f04c69b
Content-Type: text/plain; charset="UTF-8"

Can you add "...due to missing rpm support in libsolv" to the reasoning
string please?

Alex

On Thu, 20 Feb 2020 at 17:53, Khem Raj <raj.khem@gmail.com> wrote:

> dnf does not work with opkg or dpkg/apt anyway
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> index f38167f1ad..220f1aabbd 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> @@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service
> dnf-makecache.timer \
>                           dnf-automatic-notifyonly.service
> dnf-automatic-notifyonly.timer \
>  "
>  SYSTEMD_AUTO_ENABLE ?= "disable"
> +
> +PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES',
> 'package_rpm', '', 'does not build correctly without package_rpm in
> PACKAGE_CLASSES', d)}"
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> index 882c435b32..49afa04812 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> @@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
>  EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
>
>  BBCLASSEXTEND = "native nativesdk"
> +PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES',
> 'package_rpm', '', 'does not build correctly without package_rpm in
> PACKAGE_CLASSES', d)}"
>
> --
> 2.25.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007c0a27059f04c69b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you add &quot;...due to missing rpm support in libsolv=
&quot; to the reasoning string please?<div><br></div><div>Alex</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 20 Feb 2020 at 17:53, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">r=
aj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex">dnf does not wor=
k with opkg or dpkg/apt anyway<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">dnf_4.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +=
+<br>
=C2=A0meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> | 1 +<br>
=C2=A02 files changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=
=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a> b/meta/recipes-devtools/=
dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank">dn=
f_4.2.2.bb</a><br>
index f38167f1ad..220f1aabbd 100644<br>
--- a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
+++ b/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
@@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} =3D &quot;dnf-makecache.service dnf=
-makecache.timer \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dnf-automatic-notifyonly.service dnf-automatic-notifyonly=
.timer \<br>
=C2=A0&quot;<br>
=C2=A0SYSTEMD_AUTO_ENABLE ?=3D &quot;disable&quot;<br>
+<br>
+PNBLACKLIST[dnf] ?=3D &quot;${@bb.utils.contains(&#39;PACKAGE_CLASSES&#39;=
, &#39;package_rpm&#39;, &#39;&#39;, &#39;does not build correctly without =
package_rpm in PACKAGE_CLASSES&#39;, d)}&quot;<br>
diff --git a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> b/meta/recipes=
-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libdnf_0.28.1.bb</a><br>
index 882c435b32..49afa04812 100644<br>
--- a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
+++ b/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
@@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native =3D &quot; -DWITH_GIR=
=3DOFF&quot;<br>
=C2=A0EXTRA_OECMAKE_append_class-nativesdk =3D &quot; -DWITH_GIR=3DOFF&quot=
;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+PNBLACKLIST[libdnf] ?=3D &quot;${@bb.utils.contains(&#39;PACKAGE_CLASSES&#=
39;, &#39;package_rpm&#39;, &#39;&#39;, &#39;does not build correctly witho=
ut package_rpm in PACKAGE_CLASSES&#39;, d)}&quot;<br>
<br>
-- <br>
2.25.1<br>
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

--0000000000007c0a27059f04c69b--
