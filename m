Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3058674D0D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 19:29:39 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id p4-v6so3146782wrh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G+LjTNidh/1LZ0lQfLPeMZ/jxXgtHOgw8KHOQWo0RSM=;
	b=BKJkjAqcg5ICtrW9BL2JWdvN1qybE9qzxK5+b5D3Ki/opa8jU6aFDMdqmmSAblXMtX
	kCliAWkS9lAcm6g9C++aXB81XScJohNQrvjIrdvsOG54PAvHNSXt9qlUKGqKS7X5Y4CZ
	rfjpu6d2p7rc+TeHX336cY8aToDjTN2ys5I8iPSSGiYga01luCZWQt3X07P6zlKK+6Ao
	XHxCe2gwavYS3jXibfEjqhiqd+0ia3+DGArx3canvmGMCU9Fvy1dlKCn7WMXATni1O3S
	LYYXZi+fY3bSi3U3HSjOqxrvH+RCPfweguxWb0FEGk+O4p5sgiym4tgd88yEztbgR5IS
	WqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G+LjTNidh/1LZ0lQfLPeMZ/jxXgtHOgw8KHOQWo0RSM=;
	b=dwBVToKpCjyiAk6OJ3DYexOsQxphk6qFo+U2kCC07plXhJXyXjCSnbVrHJ1sUGE8BB
	wAsd/fPbkRpnxYn4uX6c47Ag5M+YV5spSG459otr/dST5oNxmo9EwxQjQUVYUjuyz2cU
	pMRfnR1zVoMnoEZBD9e7jg+VeJquKoFEFKK5cTm8ksy9bP/D1XOuYd4PDKqSOMjBRE4a
	HqkSWdcvCxMGc3q8ZVz9jPQu/kfMN//8u8fHf+Sr9NEh4uzqX26jwX/TqxJgaYbULhXW
	Qwu/L3je5G0nmYJQYTlfGc7V7LW3h2XX6xpzXPS00z6olFhKvfsDo0wGFOXk3yaU0Urg
	KPeQ==
X-Gm-Message-State: ALQs6tBfezJsycFtzl9vsB+prwWti25kT2MXLI34kLETEEDkbzXBW2jB
	1UKOhCyjAS0KWxF4W4Z7YsOFnaj5ied3SNgkBak=
X-Google-Smtp-Source: AB8JxZpbAKL3e6VLdBEeCaX0g2YfHOQZVgi8lrTbRo1qWi9SX1NjpiXnm3BNf87658sK0FctTusRD/uVvhXp2zu6zdE=
X-Received: by 2002:adf:ea8a:: with SMTP id
	s10-v6mr32456503wrm.223.1525807780605; 
	Tue, 08 May 2018 12:29:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Tue, 8 May 2018 12:29:40 -0700 (PDT)
In-Reply-To: <20180508184903.13506-2-mkelly@xevo.com>
References: <20180508184903.13506-1-mkelly@xevo.com>
	<20180508184903.13506-2-mkelly@xevo.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 8 May 2018 21:29:40 +0200
Message-ID: <CA+chaQe854jAujaBtPOP+B8QoQ3FatBFwKZBmQMgZ=Yi=cSGng@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] modemmanager: upgrade to 1.7.991
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
X-List-Received-Date: Tue, 08 May 2018 19:29:40 -0000
Content-Type: multipart/alternative; boundary="000000000000c232cf056bb6cec1"

--000000000000c232cf056bb6cec1
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

all meta-oe patches need to go to openembedded-devel ML.

Thanks

On Tue, May 8, 2018 at 8:49 PM, Martin Kelly <mkelly@xevo.com> wrote:

> This version has a ublox plugin for expanded modem support. The underlying
> issue
> that enum-conversion.patch fixes appears to already have been fixed
> upstream, so
> we can drop the patch.
>
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  .../modemmanager/modemmanager/enum-conversion.patch | 21
> ---------------------
>  ...odemmanager_1.6.4.bb => modemmanager_1.7.991.bb} |  9 ++++-----
>  2 files changed, 4 insertions(+), 26 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/
> modemmanager/modemmanager/enum-conversion.patch
>  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.6.4.bb
> => modemmanager_1.7.991.bb} (88%)
>
> diff --git a/meta-oe/recipes-connectivity/modemmanager/
> modemmanager/enum-conversion.patch b/meta-oe/recipes-
> connectivity/modemmanager/modemmanager/enum-conversion.patch
> deleted file mode 100644
> index a3fb0f3eb..000000000
> --- a/meta-oe/recipes-connectivity/modemmanager/
> modemmanager/enum-conversion.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Fixes errors found bt Clang
> -
> -| ../../ModemManager-1.6.4/src/mm-bearer-qmi.c:774:50: error: implicit
> conversion from enumeration type 'MMBearerStatus' to different enumeration
> type 'MMBearerConnectionStatus' [-Werror,-Wenum-conversion]
> -|         MMBearerConnectionStatus bearer_status =
> mm_base_bearer_get_status (MM_BASE_BEARER (self));
> -|                                  ~~~~~~~~~~~~~
>  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -| 1 error generated.
> -
> -
> -Index: ModemManager-1.6.4/src/mm-bearer-qmi.c
> -===================================================================
> ---- ModemManager-1.6.4.orig/src/mm-bearer-qmi.c
> -+++ ModemManager-1.6.4/src/mm-bearer-qmi.c
> -@@ -771,7 +771,7 @@ packet_service_status_indication_cb (Qmi
> -             &connection_status,
> -             NULL,
> -             NULL)) {
> --        MMBearerConnectionStatus bearer_status =
> mm_base_bearer_get_status (MM_BASE_BEARER (self));
> -+        MMBearerConnectionStatus bearer_status =
> (MMBearerConnectionStatus)mm_base_bearer_get_status (MM_BASE_BEARER
> (self));
> -
> -         if (connection_status == QMI_WDS_CONNECTION_STATUS_DISCONNECTED
> &&
> -             bearer_status != MM_BEARER_CONNECTION_STATUS_DISCONNECTED &&
> diff --git a/meta-oe/recipes-connectivity/modemmanager/mode
> mmanager_1.6.4.bb b/meta-oe/recipes-connectivity/modemmanager/mode
> mmanager_1.7.991.bb
> similarity index 88%
> rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.
> 4.bb
> rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.
> 991.bb
> index e60cd4b74..4f9400169 100644
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
> @@ -11,11 +11,10 @@ inherit gnomebase gettext systemd vala
> gobject-introspection bash-completion
>
>  DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native"
>
> -SRC_URI = "http://www.freedesktop.org/software/ModemManager/
> ModemManager-${PV}.tar.xz \
> -           file://enum-conversion.patch \
> -"
> -SRC_URI[md5sum] = "06488186c7dd53f8104183b86f7a1568"
> -SRC_URI[sha256sum] = "cdd5b4cb1e4d7643643a28ccbfc4bb
> 354bfa9cb89a77ea160ebdf7926171c668"
> +SRC_URI = "http://www.freedesktop.org/software/ModemManager/
> ModemManager-${PV}.tar.xz"
> +
> +SRC_URI[md5sum] = "4efe6a240cef212bf8855c95424e7c7f"
> +SRC_URI[sha256sum] = "4e366243bd4983f2e6efe35cb901cf
> 5da51939307b5d6299fe622a9fcf411745"
>
>  S = "${WORKDIR}/ModemManager-${PV}"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c232cf056bb6cec1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Martin,<div><br></div><div>all meta-oe patches need to =
go to openembedded-devel ML.</div><div><br></div><div>Thanks</div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, May 8, 2018 =
at 8:49 PM, Martin Kelly <span dir=3D"ltr">&lt;<a href=3D"mailto:mkelly@xev=
o.com" target=3D"_blank">mkelly@xevo.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">This version has a ublox plugin for expanded modem su=
pport. The underlying issue<br>
that enum-conversion.patch fixes appears to already have been fixed upstrea=
m, so<br>
we can drop the patch.<br>
<br>
Signed-off-by: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com">mkelly@x=
evo.com</a>&gt;<br>
---<br>
=C2=A0.../modemmanager/modemmanager/<wbr>enum-conversion.patch | 21 -------=
--------------<br>
=C2=A0...<a href=3D"http://odemmanager_1.6.4.bb" rel=3D"noreferrer" target=
=3D"_blank">odemmanager_1.6.4.bb</a> =3D&gt; <a href=3D"http://modemmanager=
_1.7.991.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_1.7.991.bb</=
a>} |=C2=A0 9 ++++-----<br>
=C2=A02 files changed, 4 insertions(+), 26 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-connectivity/<wbr>modemmanager/mod=
emmanager/<wbr>enum-conversion.patch<br>
=C2=A0rename meta-oe/recipes-connectivity/<wbr>modemmanager/{<a href=3D"htt=
p://modemmanager_1.6.4.bb" rel=3D"noreferrer" target=3D"_blank">modemmanage=
r_1.<wbr>6.4.bb</a> =3D&gt; <a href=3D"http://modemmanager_1.7.991.bb" rel=
=3D"noreferrer" target=3D"_blank">modemmanager_1.7.991.bb</a>} (88%)<br>
<br>
diff --git a/meta-oe/recipes-<wbr>connectivity/modemmanager/<wbr>modemmanag=
er/enum-conversion.<wbr>patch b/meta-oe/recipes-<wbr>connectivity/modemmana=
ger/<wbr>modemmanager/enum-conversion.<wbr>patch<br>
deleted file mode 100644<br>
index a3fb0f3eb..000000000<br>
--- a/meta-oe/recipes-<wbr>connectivity/modemmanager/<wbr>modemmanager/enum=
-conversion.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-Fixes errors found bt Clang<br>
-<br>
-| ../../ModemManager-1.6.4/src/<wbr>mm-bearer-qmi.c:774:50: error: implici=
t conversion from enumeration type &#39;MMBearerStatus&#39; to different en=
umeration type &#39;MMBearerConnectionStatus&#39; [-Werror,-Wenum-conversio=
n]<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMBearerConnectionStatus bearer_status =
=3D mm_base_bearer_get_status (MM_BASE_BEARER (self));<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~=C2=A0 =C2=A0^~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~~~~~~~~<br>
-| 1 error generated.<br>
-<br>
-<br>
-Index: ModemManager-1.6.4/src/mm-<wbr>bearer-qmi.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- ModemManager-1.6.4.orig/src/<wbr>mm-bearer-qmi.c<br>
-+++ ModemManager-1.6.4/src/mm-<wbr>bearer-qmi.c<br>
-@@ -771,7 +771,7 @@ packet_service_status_<wbr>indication_cb (Qmi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;connection_status,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 MMBearerConnectionStatus bearer_status =3D mm=
_base_bearer_get_status (MM_BASE_BEARER (self));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MMBearerConnectionStatus bearer_status =3D (M=
MBearerConnectionStatus)mm_<wbr>base_bearer_get_status (MM_BASE_BEARER (sel=
f));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (connection_status =3D=3D QMI_WDS_CON=
NECTION_STATUS_<wbr>DISCONNECTED &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bearer_status !=3D MM_BEAR=
ER_CONNECTION_STATUS_<wbr>DISCONNECTED &amp;&amp;<br>
diff --git a/meta-oe/recipes-<wbr>connectivity/modemmanager/<a href=3D"http=
://modemmanager_1.6.4.bb" rel=3D"noreferrer" target=3D"_blank">mode<wbr>mma=
nager_1.6.4.bb</a> b/meta-oe/recipes-<wbr>connectivity/modemmanager/<a href=
=3D"http://modemmanager_1.7.991.bb" rel=3D"noreferrer" target=3D"_blank">mo=
de<wbr>mmanager_1.7.991.bb</a><br>
similarity index 88%<br>
rename from meta-oe/recipes-connectivity/<wbr>modemmanager/<a href=3D"http:=
//modemmanager_1.6.4.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_=
1.6.<wbr>4.bb</a><br>
rename to meta-oe/recipes-connectivity/<wbr>modemmanager/<a href=3D"http://=
modemmanager_1.7.991.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_=
1.7.<wbr>991.bb</a><br>
index e60cd4b74..4f9400169 100644<br>
--- a/meta-oe/recipes-<wbr>connectivity/modemmanager/<a href=3D"http://mode=
mmanager_1.6.4.bb" rel=3D"noreferrer" target=3D"_blank">mode<wbr>mmanager_1=
.6.4.bb</a><br>
+++ b/meta-oe/recipes-<wbr>connectivity/modemmanager/<a href=3D"http://mode=
mmanager_1.7.991.bb" rel=3D"noreferrer" target=3D"_blank">mode<wbr>mmanager=
_1.7.991.bb</a><br>
@@ -11,11 +11,10 @@ inherit gnomebase gettext systemd vala gobject-introspe=
ction bash-completion<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0 libgudev dbus-glib intltool-native&quot;<b=
r>
<br>
-SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/software/ModemMana=
ger/ModemManager-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://=
www.freedesktop.org/<wbr>software/ModemManager/<wbr>ModemManager-${PV}.tar.=
xz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://enum-conversion.patch \<br=
>
-&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>06488186c7dd53f8104183b86f7a15<wbr>68&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>cdd5b4cb1e4d7643643a28ccbfc4bb<wbr>354bf=
a9cb89a77ea160ebdf7926171<wbr>c668&quot;<br>
+SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/software/ModemMana=
ger/ModemManager-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://=
www.freedesktop.org/<wbr>software/ModemManager/<wbr>ModemManager-${PV}.tar.=
xz</a>&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>4efe6a240cef212bf8855c95424e7c<wbr>7f&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>4e366243bd4983f2e6efe35cb901cf<wbr>5da51=
939307b5d6299fe622a9fcf41<wbr>1745&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/ModemManager-${PV}<wbr>&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">=C2=A0<br>
-- <br>
2.11.0<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--000000000000c232cf056bb6cec1--
