Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC6F61420
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 16:14:19 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id n27so9208346vsa.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 08:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N/kzVRanDD7zX+FurwF8o30Ibu377HTHjwnOs4bqwCI=;
	b=LOR41CInF2lM47+6yXRy+/jqKdNx27w/tFEAP9tEHFzrhZTVnNAmtmr4nEM0mmlpfd
	e5hW1fC6lgCWbkldFeFW8ZAPpOp1nwhkzSPlHN56qDQFffhKByySRwpFwESwVJziU9cg
	T6Lbg3UeIXYGj/waimphqHTry7Jr7J4OiWy5Wq/Cgh1ubReq9lAPZgtw9YS5i2TQmbE1
	MXQp8MY91ETlzN/4J7OJm95hvcNRXXbtXW6q43jefEUdTXhhSKKS0hKMPNsDAWfvSvoN
	fMz/09pV3ghQyFWvo77IhHGDICHhGY/+8QHrteq2fwrLVte+Z9pQak4J37s1PEn12O8y
	0wiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N/kzVRanDD7zX+FurwF8o30Ibu377HTHjwnOs4bqwCI=;
	b=HiFYhKu6odvEUwEumu3mZfyDflIbrTXxcA99Rn0aIDTK8KTomUKKLJpbVXV51Gkdl2
	MgyWSHqaN9NveJvAy2Cb+TXFDZ+f4ci/gTg/VpLdUiXqxhaPCJPTWtrfozkVjasGZptO
	U9Kw6uz+OuHNtGED0nPqoN7TSzy5mc7iU0MCpocN4MheVGP/XGjjoNgrDmIMv88CKlbJ
	SW8AA+AiWohx++bJIdi5qIvV9SrTlTOuuVa7xoT2ToDSrR6xyrn2EPtjhJTqMZBuGu48
	QGqJHo1fG/Xe+HhmYHC1pILoQe//5Jr8fZCyKuGp/poUZQGuqF7kua9UvWNsL+MM9JnM
	Zdnw==
X-Gm-Message-State: APjAAAUoFEqV+LclsSXpi8D1IuSY2BdpEXFDpdyv3hxJbiRh4pwH4653
	Bg/g69HVbhSCUImIK7A2+pICq15hrLUebsyqoWs=
X-Google-Smtp-Source: APXvYqxJvc//4WWZ2gUeEQoEXyPsElMoJJtJpjsCJmmVCigewjQdh78vu512xfp9MA9sQlxX65YNqQE4zjgQiLGcbcs=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr6285420vsa.25.1581869660252; 
	Sun, 16 Feb 2020 08:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-8-alex.kanavin@gmail.com>
	<CA+chaQdn+YnSaeBdS_-i6zm1dZ_mAi9cvPVK3BPkgjaLqH+f7w@mail.gmail.com>
In-Reply-To: <CA+chaQdn+YnSaeBdS_-i6zm1dZ_mAi9cvPVK3BPkgjaLqH+f7w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Feb 2020 17:14:09 +0100
Message-ID: <CANNYZj-B_yqrOryM7sZV0uCRUE0Dvnf+vSjd5qZhh6xC6GG9hA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/10] webkitgtk: unbreak wayland build
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
X-List-Received-Date: Sun, 16 Feb 2020 16:14:19 -0000
Content-Type: multipart/alternative; boundary="0000000000002e2f23059eb3bb93"

--0000000000002e2f23059eb3bb93
Content-Type: text/plain; charset="UTF-8"

bitbake told me to add them (when the existing md5/sha256 checksums were
deemed incorrect), and so I did.

Alex

On Sun, 16 Feb 2020 at 17:09, Martin Jansa <martin.jansa@gmail.com> wrote:

> Do we need sha384sum, sha512sum, sha1sum checksums for these 2 for
> whatever reason?
>
> On Sun, Feb 16, 2020 at 4:52 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> webkit nowadays requires a couple of supplementary libraries for this,
>> so bring them in (courtesy of meta-browser, which will hopefully
>> adjust without a lot of trouble).
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  meta/recipes-sato/webkit/libwpe_1.4.0.1.bb    | 19 +++++++++++++++++++
>>  meta/recipes-sato/webkit/webkitgtk_2.26.4.bb  |  2 +-
>>  .../webkit/wpebackend-fdo_1.4.1.bb            | 19 +++++++++++++++++++
>>  3 files changed, 39 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
>>  create mode 100644 meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
>>
>> diff --git a/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
>> b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
>> new file mode 100644
>> index 0000000000..b9c71f9dc5
>> --- /dev/null
>> +++ b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
>> @@ -0,0 +1,19 @@
>> +SUMMARY = "General-purpose library specifically developed for the
>> WPE-flavored port of WebKit."
>> +HOMEPAGE = "https://github.com/WebPlatformForEmbedded/libwpe"
>> +BUGTRACKER = "https://github.com/WebPlatformForEmbedded/libwpe/issues"
>> +
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=371a616eb4903c6cb79e9893a5f615cc"
>> +DEPENDS = "virtual/egl libxkbcommon"
>> +
>> +# Workaround build issue with RPi userland EGL libraries.
>> +CFLAGS_append_rpi = " ${@bb.utils.contains('MACHINE_FEATURES',
>> 'vc4graphics', '', '-D_GNU_SOURCE', d)}"
>> +
>> +inherit cmake
>> +
>> +SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
>> +SRC_URI[md5sum] = "1d4d38413ee0d0043f74d0445cab906f"
>> +SRC_URI[sha256sum] =
>> "09849dfb34877354f34f318e138971cf22e677b2179e1f0a8ea00ab0b7bd8e9b"
>> +SRC_URI[sha1sum] = "a41480a0a85cfa11b3f87f801b7c37bc3410e060"
>> +SRC_URI[sha384sum] =
>> "30488e375d956809a84b0d8af7b386a332541c77dcbd53496a896f894dbf39ac34534e935d6bc7a75c1b536f04f7f0a0"
>> +SRC_URI[sha512sum] =
>> "cbbe6b8e9bbb864d7f96bbdb56db262bbd341c86bc7bedfcc51be8077c0ea58a4e88c61b7b7bec937d5476e6cb81c093229bf80e3ee99452829287bd26175670"
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
>> b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
>> index 4aa8533b42..8d87ad49a3 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
>> @@ -44,7 +44,7 @@ PACKAGECONFIG ??=
>> "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
>>                     libsecret \
>>                    "
>>
>> -PACKAGECONFIG[wayland] =
>> "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland"
>> +PACKAGECONFIG[wayland] =
>> "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe
>> wpebackend-fdo wayland-native"
>>  PACKAGECONFIG[x11] =
>> "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11"
>>  PACKAGECONFIG[geoclue] =
>> "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
>>  PACKAGECONFIG[enchant] =
>> "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
>> diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
>> b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
>> new file mode 100644
>> index 0000000000..84df0c2535
>> --- /dev/null
>> +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
>> @@ -0,0 +1,19 @@
>> +SUMMARY = "WPE's backend based on a freedesktop.org stack."
>> +HOMEPAGE = "https://github.com/Igalia/WPEBackend-fdo"
>> +BUGTRACKER = "https://github.com/Igalia/WPEBackend-fdo/issues"
>> +
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=1f62cef2e3645e3e74eb05fd389d7a66"
>> +DEPENDS = "glib-2.0 libxkbcommon wayland virtual/egl libwpe"
>> +
>> +DEPENDS_append_class-target = " wayland-native"
>> +
>> +inherit cmake
>> +
>> +SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
>> +SRC_URI[md5sum] = "c6362491a4a38ddac42b66f140e1cff2"
>> +SRC_URI[sha256sum] =
>> "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
>> +SRC_URI[sha1sum] = "9217c8a5511bc53544b42cb23390256580ac4b0c"
>> +SRC_URI[sha384sum] =
>> "79f3a28bc8e0a8240dc9962a6a245276d39dd8112a753d5ada39e98332d857eb9fc9c2879a702060807a10ea60be796d"
>> +SRC_URI[sha512sum] =
>> "8fdd13843c77b95b96b3feffea463bce565620997680e209a0cdcc09314a1469f2f1cb4744dceb2cf6c8d6ce5cb2bbdb4c7fbaf0451a687640c3f63bbdbfc4d4"
>> +
>> --
>> 2.25.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--0000000000002e2f23059eb3bb93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>bitbake told me to add them (when the existing md5/sh=
a256 checksums were deemed incorrect), and so I did.</div><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sun, 16 Feb 2020 at 17:09, Martin Jansa &lt;<a href=3D"=
mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Do we=
 need sha384sum, sha512sum, sha1sum checksums for these 2 for whatever reas=
on?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sun, Feb 16, 2020 at 4:52 PM Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">webkit nowa=
days requires a couple of supplementary libraries for this,<br>
so bring them in (courtesy of meta-browser, which will hopefully<br>
adjust without a lot of trouble).<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://libwpe_1.4.0.1.bb" rel=3D"=
noreferrer" target=3D"_blank">libwpe_1.4.0.1.bb</a>=C2=A0 =C2=A0 | 19 +++++=
++++++++++++++<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a>=C2=A0 |=C2=A0 2 +=
-<br>
=C2=A0.../webkit/<a href=3D"http://wpebackend-fdo_1.4.1.bb" rel=3D"noreferr=
er" target=3D"_blank">wpebackend-fdo_1.4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++++++<br>
=C2=A03 files changed, 39 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/<a href=3D"http://libwpe_=
1.4.0.1.bb" rel=3D"noreferrer" target=3D"_blank">libwpe_1.4.0.1.bb</a><br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/<a href=3D"http://wpeback=
end-fdo_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.4.1=
.bb</a><br>
<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://libwpe_1.4.0.1.bb" =
rel=3D"noreferrer" target=3D"_blank">libwpe_1.4.0.1.bb</a> b/meta/recipes-s=
ato/webkit/<a href=3D"http://libwpe_1.4.0.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libwpe_1.4.0.1.bb</a><br>
new file mode 100644<br>
index 0000000000..b9c71f9dc5<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://libwpe_1.4.0.1.bb" rel=3D"=
noreferrer" target=3D"_blank">libwpe_1.4.0.1.bb</a><br>
@@ -0,0 +1,19 @@<br>
+SUMMARY =3D &quot;General-purpose library specifically developed for the W=
PE-flavored port of WebKit.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/WebPlatformForEmbedded/li=
bwpe" rel=3D"noreferrer" target=3D"_blank">https://github.com/WebPlatformFo=
rEmbedded/libwpe</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/WebPlatformForEmbedded/=
libwpe/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/WebP=
latformForEmbedded/libwpe/issues</a>&quot;<br>
+<br>
+LICENSE =3D &quot;BSD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D371a616eb4903c6cb79e9893a5=
f615cc&quot;<br>
+DEPENDS =3D &quot;virtual/egl libxkbcommon&quot;<br>
+<br>
+# Workaround build issue with RPi userland EGL libraries.<br>
+CFLAGS_append_rpi =3D &quot; ${@bb.utils.contains(&#39;MACHINE_FEATURES&#3=
9;, &#39;vc4graphics&#39;, &#39;&#39;, &#39;-D_GNU_SOURCE&#39;, d)}&quot;<b=
r>
+<br>
+inherit cmake<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://wpewebkit.org/releases/$%7BBPN%7D-$%7=
BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://wpewebkit.org/r=
eleases/${BPN}-${PV}.tar.xz</a>&quot;<br>
+SRC_URI[md5sum] =3D &quot;1d4d38413ee0d0043f74d0445cab906f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;09849dfb34877354f34f318e138971cf22e677b2179e1=
f0a8ea00ab0b7bd8e9b&quot;<br>
+SRC_URI[sha1sum] =3D &quot;a41480a0a85cfa11b3f87f801b7c37bc3410e060&quot;<=
br>
+SRC_URI[sha384sum] =3D &quot;30488e375d956809a84b0d8af7b386a332541c77dcbd5=
3496a896f894dbf39ac34534e935d6bc7a75c1b536f04f7f0a0&quot;<br>
+SRC_URI[sha512sum] =3D &quot;cbbe6b8e9bbb864d7f96bbdb56db262bbd341c86bc7be=
dfcc51be8077c0ea58a4e88c61b7b7bec937d5476e6cb81c093229bf80e3ee99452829287bd=
26175670&quot;<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb=
" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a> b/meta/recip=
es-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">webkitgtk_2.26.4.bb</a><br>
index 4aa8533b42..8d87ad49a3 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a><br>
@@ -44,7 +44,7 @@ PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_=
FEATURES&#39;, &#39;wayland x11&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libse=
cret \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>
<br>
-PACKAGECONFIG[wayland] =3D &quot;-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAY=
LAND_TARGET=3DOFF,wayland&quot;<br>
+PACKAGECONFIG[wayland] =3D &quot;-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAY=
LAND_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native&quot;<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TA=
RGET=3DOFF,virtual/libx11&quot;<br>
=C2=A0PACKAGECONFIG[geoclue] =3D &quot;-DENABLE_GEOLOCATION=3DON,-DENABLE_G=
EOLOCATION=3DOFF,geoclue&quot;<br>
=C2=A0PACKAGECONFIG[enchant] =3D &quot;-DENABLE_SPELLCHECK=3DON,-DENABLE_SP=
ELLCHECK=3DOFF,enchant2&quot;<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo_1.4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.4.1.bb</a> b/me=
ta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo_1.4.1.bb" rel=3D"no=
referrer" target=3D"_blank">wpebackend-fdo_1.4.1.bb</a><br>
new file mode 100644<br>
index 0000000000..84df0c2535<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://wpebackend-fdo_1.4.1.bb" r=
el=3D"noreferrer" target=3D"_blank">wpebackend-fdo_1.4.1.bb</a><br>
@@ -0,0 +1,19 @@<br>
+SUMMARY =3D &quot;WPE&#39;s backend based on a <a href=3D"http://freedeskt=
op.org" rel=3D"noreferrer" target=3D"_blank">freedesktop.org</a> stack.&quo=
t;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/Igalia/WPEBackend-fdo" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/Igalia/WPEBackend-fdo=
</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/Igalia/WPEBackend-fdo/i=
ssues" rel=3D"noreferrer" target=3D"_blank">https://github.com/Igalia/WPEBa=
ckend-fdo/issues</a>&quot;<br>
+<br>
+LICENSE =3D &quot;BSD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1f62cef2e3645e3e74eb05fd38=
9d7a66&quot;<br>
+DEPENDS =3D &quot;glib-2.0 libxkbcommon wayland virtual/egl libwpe&quot;<b=
r>
+<br>
+DEPENDS_append_class-target =3D &quot; wayland-native&quot;<br>
+<br>
+inherit cmake<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://wpewebkit.org/releases/$%7BBPN%7D-$%7=
BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://wpewebkit.org/r=
eleases/${BPN}-${PV}.tar.xz</a>&quot;<br>
+SRC_URI[md5sum] =3D &quot;c6362491a4a38ddac42b66f140e1cff2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93=
468091f1dc68ddb299d&quot;<br>
+SRC_URI[sha1sum] =3D &quot;9217c8a5511bc53544b42cb23390256580ac4b0c&quot;<=
br>
+SRC_URI[sha384sum] =3D &quot;79f3a28bc8e0a8240dc9962a6a245276d39dd8112a753=
d5ada39e98332d857eb9fc9c2879a702060807a10ea60be796d&quot;<br>
+SRC_URI[sha512sum] =3D &quot;8fdd13843c77b95b96b3feffea463bce565620997680e=
209a0cdcc09314a1469f2f1cb4744dceb2cf6c8d6ce5cb2bbdb4c7fbaf0451a687640c3f63b=
bdbfc4d4&quot;<br>
+<br>
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
</blockquote></div>
</blockquote></div>

--0000000000002e2f23059eb3bb93--
