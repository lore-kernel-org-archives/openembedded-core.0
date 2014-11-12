Return-Path: <andrei@gherzan.ro>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2583165C91
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 10:28:38 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id x12so13797433wgg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=KxwdK86WMPzThuhOwXqEbG+zBy/6bBYDJKbA7YAgDpk=;
	b=M4yc/t2s4tFNcrcgmkh9qvDwyF1FElSZT7+Zr+8nto/omGsSgK5U45Ksf9R4YpjtcE
	44pNiCCw+oFHuJtfSTvf14YlBSaoBmcvku+DxUNI6c40up3O8LfOOzU5c7pBV+9D0/gG
	2jPrpDF4afqa6IWFX0GwcMgfY5C44RI/JMRIdUl8lNKoxL27JChKTuuFVUKLb9WFr47A
	Y9I1wMrT74jYtNlAZhjpWf0mdxX5YzVdEWjD0q9Ij+B+HmtAf+j72LFgJu/278yOLRzI
	NGU5JWTB8+7s+pb7xcXfcjNIr04wJe/ZN/w1qRbjccnyKXIoHaVzYA7rXSRup+KWMqI/
	p4Ew==
X-Gm-Message-State: ALoCoQlppQPVduPXYSGSOfFXav85T2joOQIvvshVJnxJSBEsM9QLvr8dfzZQys05HvHboxPHY2gk
X-Received: by 10.194.236.232 with SMTP id ux8mr62823006wjc.96.1415788118948; 
	Wed, 12 Nov 2014 02:28:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.75.70 with HTTP; Wed, 12 Nov 2014 02:28:18 -0800 (PST)
X-Originating-IP: [195.249.189.34]
In-Reply-To: <1415377424-2639-1-git-send-email-andrei.gherzan@windriver.com>
References: <1415377424-2639-1-git-send-email-andrei.gherzan@windriver.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 12 Nov 2014 11:28:18 +0100
Message-ID: <CAK18fxE0CzhZjcNM7Jf=yEZW6a9YE5J=4H-rJBV7-RACyJjokA@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [master][dizzy][PATCH] xkeyboard-config: Inherit gettext
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
X-List-Received-Date: Wed, 12 Nov 2014 10:28:39 -0000
Content-Type: multipart/alternative; boundary=089e01493f58e853410507a6dbd0

--089e01493f58e853410507a6dbd0
Content-Type: text/plain; charset=UTF-8

Ping?

On Fri, Nov 7, 2014 at 5:23 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> In a GPLv3-free build we have two different versions of gettext in sysroot
> due
> to GPLv3 restrictions. In this case we need gettext-native too so we can
> have
> the needed macros and avoid errors like:
> "error: possibly undefined macro: AM_GNU_GETTEXT"
>
> The needed dependency is added by gettext class which is prefered because
> it
> takes care of NLS flags too.
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
> index 61e3847..adac0ee 100644
> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
> @@ -23,7 +23,7 @@ EXTRA_OECONF = "--with-xkb-rules-symlink=xorg
> --disable-runtime-deps"
>
>  FILES_${PN} += "${datadir}/X11/xkb"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig gettext
>
>  do_install_append () {
>      install -d ${D}${datadir}/X11/xkb/compiled
> --
> 1.9.3
>
>


-- 
*Andrei Gherzan*

--089e01493f58e853410507a6dbd0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping?</div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Fri, Nov 7, 2014 at 5:23 PM, Andrei Gherzan <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:andrei@gherzan.ro" target=3D"_blank">andrei@gherzan.=
ro</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">In a GPLv3-free =
build we have two different versions of gettext in sysroot due<br>
to GPLv3 restrictions. In this case we need gettext-native too so we can ha=
ve<br>
the needed macros and avoid errors like:<br>
&quot;error: possibly undefined macro: AM_GNU_GETTEXT&quot;<br>
<br>
The needed dependency is added by gettext class which is prefered because i=
t<br>
takes care of NLS flags too.<br>
<br>
Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherzan@windrive=
r.com">andrei.gherzan@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/xorg-lib/<a href=3D"http://xkeyboard-config_2.1=
2.bb" target=3D"_blank">xkeyboard-config_2.12.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://xkeyboard-con=
fig_2.12.bb" target=3D"_blank">xkeyboard-config_2.12.bb</a> b/meta/recipes-=
graphics/xorg-lib/<a href=3D"http://xkeyboard-config_2.12.bb" target=3D"_bl=
ank">xkeyboard-config_2.12.bb</a><br>
index 61e3847..adac0ee 100644<br>
--- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://xkeyboard-config_2.1=
2.bb" target=3D"_blank">xkeyboard-config_2.12.bb</a><br>
+++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://xkeyboard-config_2.1=
2.bb" target=3D"_blank">xkeyboard-config_2.12.bb</a><br>
@@ -23,7 +23,7 @@ EXTRA_OECONF =3D &quot;--with-xkb-rules-symlink=3Dxorg --=
disable-runtime-deps&quot;<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${datadir}/X11/xkb&quot;<br>
<br>
-inherit autotools pkgconfig<br>
+inherit autotools pkgconfig gettext<br>
<br>
=C2=A0do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/X11/xkb/compiled<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.3<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature"><div dir=3D"ltr"><div style=3D"text-align:=
center"></div><div style=3D"text-align:center"><div align=3D"left"><b style=
=3D"font-family:Arial;font-size:small;color:rgb(51,51,51);text-align:center=
">Andrei Gherzan</b><br></div></div></div></div>
</div>

--089e01493f58e853410507a6dbd0--
