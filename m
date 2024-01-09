Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760B7C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 18:53:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.25508.1704826388736616969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 10:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JDZBlqEU;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cd04078ebeso38958301fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 10:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704826386; x=1705431186; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mEp1eopKA52y7Zl3NLJcJWYfM9Epsgy8vBSdhTk30vU=;
        b=JDZBlqEUFKJZnoR2frK4U9MR4W0gGeZjCD48OdklH+uyOmSa2nvsrfakug6Xs/gwva
         0iw2Qw8yLRFG95C4sQEkk/SMs0u2dr12fnwyacfWif8kErmA+pLg/GxViyIY+FZrQ8QR
         ufwM9+JlZfAPl3AJLy6DyWrLL1TLcYPj7w6sgcI9mICp/Tv2r2cL1eqWvgEJkGnBy0qx
         8wrjvbGG0rJLgo6vZ+430Getnybu3Ysns5ilo5EwMjWkSrDJxG/RvPxdYliG0wxV0/jw
         P38wBRscC97nsXmNLPQyZm9HCIfswUTPML5pw+b3kSPg4X6igBjTEIQmY+MK8whUIm3P
         VkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704826386; x=1705431186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEp1eopKA52y7Zl3NLJcJWYfM9Epsgy8vBSdhTk30vU=;
        b=K5DRTt1MHpj2ew7gdjtX4qR10TmhRDOm6ZbKDTqgrFoIXXeu1s9qg6S5QRFd4M9LQO
         aqq0Pbt8Yqx7yHDx158/Y/h923VG7RSByKBjP1x2TEgtcW3QP4kbnmjGPq/K5B9n4Lk/
         ADreECDaBeZ3QJXhwOXw4441Mia1uyzJ58RPr7zHj00zH+9IpvOUXdGhtzq9pEoa4nAY
         L/KpVEmS4W6KeIuqYZs9LA7LpBJO3ZlkknIMtZGNYxZi/wJtZoslHTvua9Fhv9p0plvs
         ewzt2KdhN7KtsAMz1kcgVzKBw7rqzgKO0WJtRI+01bCL/Fn8PtMqThHmXeqrgQ4GmIfb
         XXng==
X-Gm-Message-State: AOJu0Yw7GcrZXPYPsp0Z7xsIA97+HjihU/I9x85oPPlx0YMGXiX6IYyv
	1WhZmNmYbSWKKC23lcRqQfNc+VzB6jfNd6tNwY8=
X-Google-Smtp-Source: AGHT+IGpDZJVqEDnEr+8KPyD0J+g21+JoRnXX0HEc6Zc9fimx8y9yrLG0G9AKsrUEr+xaKz77GxyKp9SbLWKjnyj5lE=
X-Received: by 2002:ac2:4155:0:b0:50e:7f5c:6c7f with SMTP id
 c21-20020ac24155000000b0050e7f5c6c7fmr640619lfi.17.1704826386233; Tue, 09 Jan
 2024 10:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20240109182350.1070414-1-raj.khem@gmail.com>
In-Reply-To: <20240109182350.1070414-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Jan 2024 19:52:55 +0100
Message-ID: <CANNYZj-K9QA_tq3NawT1HweX-y4Y7jp14EUc=+ckAtubHLLYng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] glib-networking: Fix ptest failures with
 openssl backend
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000027bbe5060e87d389"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 18:53:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193477

--00000000000027bbe5060e87d389
Content-Type: text/plain; charset="UTF-8"

Conditional patches complicate version updates and can silently cease to
apply if no one builds with them, please place the condition into the .c
code directly.

Alex

On Tue 9. Jan 2024 at 19.23, Khem Raj <raj.khem@gmail.com> wrote:

> Apply only when openssl is in packageconfigs, seems to work ok with
> gnutls backend.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Make the patch apply only when openssl backend is used
>
>  ...Disable-test_unclean_close_by_server.patch | 42 +++++++++++++++++++
>  .../glib-networking/glib-networking_2.78.0.bb |  5 ++-
>  2 files changed, 45 insertions(+), 2 deletions(-)
>  create mode 100644
> meta/recipes-core/glib-networking/glib-networking/0001-tests-Disable-test_unclean_close_by_server.patch
>
> diff --git
> a/meta/recipes-core/glib-networking/glib-networking/0001-tests-Disable-test_unclean_close_by_server.patch
> b/meta/recipes-core/glib-networking/glib-networking/0001-tests-Disable-test_unclean_close_by_server.patch
> new file mode 100644
> index 00000000000..44e92f52001
> --- /dev/null
> +++
> b/meta/recipes-core/glib-networking/glib-networking/0001-tests-Disable-test_unclean_close_by_server.patch
> @@ -0,0 +1,42 @@
> +From 378bb3b0bf001e66a89d100ba12ac183e8375c36 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 22 Dec 2023 09:46:36 -0800
> +Subject: [PATCH] tests: Disable test_unclean_close_by_server
> +
> +This test does not work reliably when openSSL support is enabled. This
> +is not default in OE therefore the ptest failure is not seen on AB
> +testing
> +
> +Fixes
> +
> +not ok /tls/openssl/connection/unclean-close-by-server -
> GLib-Net:ERROR:../tls/tests/connection.c:2374:test_unclean_close_by_server:
> assertion failed (test->read_error == (g-tls-error-quark, 6)): Error
> reading data from TLS socket: error:00000005:lib(0)::reason(5)
> (g-tls-error-quark, 1)
> +Bail out!
> +stderr:
> +**
> +GLib-Net:ERROR:../tls/tests/connection.c:2374:test_unclean_close_by_server:
> assertion failed (test->read_error == (g-tls-error-quark, 6)): Error
> reading data from TLS socket: error:00000005:lib(0)::reason(5)
> (g-tls-error-quark, 1)
> +
> +Issue is already reported upstream [1]
> +
> +[1] https://gitlab.gnome.org/GNOME/glib-networking/-/issues/219
> +Upstream-Status: Inappropriate [ Disabled test as a workaround until
> fixed ]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + tls/tests/connection.c | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/tls/tests/connection.c b/tls/tests/connection.c
> +index 62a7fbb..cc99645 100644
> +--- a/tls/tests/connection.c
> ++++ b/tls/tests/connection.c
> +@@ -3462,8 +3462,6 @@ main (int   argc,
> +               setup_connection, test_simultaneous_sync_rehandshake,
> teardown_connection);
> +   g_test_add ("/tls/" BACKEND "/connection/close-immediately",
> TestConnection, NULL,
> +               setup_connection, test_close_immediately,
> teardown_connection);
> +-  g_test_add ("/tls/" BACKEND "/connection/unclean-close-by-server",
> TestConnection, NULL,
> +-              setup_connection, test_unclean_close_by_server,
> teardown_connection);
> +   g_test_add ("/tls/" BACKEND "/connection/async-implicit-handshake",
> TestConnection, NULL,
> +               setup_connection, test_async_implicit_handshake,
> teardown_connection);
> +   g_test_add ("/tls/" BACKEND "/connection/output-stream-close",
> TestConnection, NULL,
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
> b/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
> index 68f9a2ed783..4576b3556c0 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
> @@ -30,8 +30,9 @@ PACKAGECONFIG[gnomeproxy] =
> "-Dgnome_proxy=enabled,-Dgnome_proxy=disabled,gsetti
>  inherit gnomebase gettext upstream-version-is-even gio-module-cache
> ptest-gnome
>
>  SRC_URI += "file://run-ptest"
> -SRC_URI += "file://eagain.patch"
> -
> +SRC_URI += "file://eagain.patch \
> +            ${@bb.utils.contains('PACKAGECONFIG', 'openssl',
> 'file://0001-tests-Disable-test_unclean_close_by_server.patch', '', d)} \
> +            "
>  FILES:${PN} += "\
>                  ${libdir}/gio/modules/libgio*.so \
>                  ${datadir}/dbus-1/services/ \
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193474):
> https://lists.openembedded.org/g/openembedded-core/message/193474
> Mute This Topic: https://lists.openembedded.org/mt/103625368/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000027bbe5060e87d389
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Conditional patches complicate version updates and can si=
lently cease to apply if no one builds with them, please place the conditio=
n into the .c code directly.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Alex=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue 9. Jan 2024 at 19.23, Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)">Apply only when openssl is in packageconfigs, seems to work ok wi=
th<br>
gnutls backend.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Make the patch apply only when openssl backend is used<br>
<br>
=C2=A0...Disable-test_unclean_close_by_server.patch | 42 ++++++++++++++++++=
+<br>
=C2=A0.../glib-networking/<a href=3D"http://glib-networking_2.78.0.bb" rel=
=3D"noreferrer" target=3D"_blank">glib-networking_2.78.0.bb</a> |=C2=A0 5 +=
+-<br>
=C2=A02 files changed, 45 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/glib-networking/glib-networking/=
0001-tests-Disable-test_unclean_close_by_server.patch<br>
<br>
diff --git a/meta/recipes-core/glib-networking/glib-networking/0001-tests-D=
isable-test_unclean_close_by_server.patch b/meta/recipes-core/glib-networki=
ng/glib-networking/0001-tests-Disable-test_unclean_close_by_server.patch<br=
>
new file mode 100644<br>
index 00000000000..44e92f52001<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glib-networking/glib-networking/0001-tests-Disable-=
test_unclean_close_by_server.patch<br>
@@ -0,0 +1,42 @@<br>
+From 378bb3b0bf001e66a89d100ba12ac183e8375c36 Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Fri, 22 Dec 2023 09:46:36 -0800<br>
+Subject: [PATCH] tests: Disable test_unclean_close_by_server<br>
+<br>
+This test does not work reliably when openSSL support is enabled. This<br>
+is not default in OE therefore the ptest failure is not seen on AB<br>
+testing<br>
+<br>
+Fixes<br>
+<br>
+not ok /tls/openssl/connection/unclean-close-by-server - GLib-Net:ERROR:..=
/tls/tests/connection.c:2374:test_unclean_close_by_server: assertion failed=
 (test-&gt;read_error =3D=3D (g-tls-error-quark, 6)): Error reading data fr=
om TLS socket: error:00000005:lib(0)::reason(5) (g-tls-error-quark, 1)<br>
+Bail out!<br>
+stderr:<br>
+**<br>
+GLib-Net:ERROR:../tls/tests/connection.c:2374:test_unclean_close_by_server=
: assertion failed (test-&gt;read_error =3D=3D (g-tls-error-quark, 6)): Err=
or reading data from TLS socket: error:00000005:lib(0)::reason(5) (g-tls-er=
ror-quark, 1)<br>
+<br>
+Issue is already reported upstream [1]<br>
+<br>
+[1] <a href=3D"https://gitlab.gnome.org/GNOME/glib-networking/-/issues/219=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/glib-=
networking/-/issues/219</a><br>
+Upstream-Status: Inappropriate [ Disabled test as a workaround until fixed=
 ]<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ tls/tests/connection.c | 2 --<br>
+ 1 file changed, 2 deletions(-)<br>
+<br>
+diff --git a/tls/tests/connection.c b/tls/tests/connection.c<br>
+index 62a7fbb..cc99645 100644<br>
+--- a/tls/tests/connection.c<br>
++++ b/tls/tests/connection.c<br>
+@@ -3462,8 +3462,6 @@ main (int=C2=A0 =C2=A0argc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup_connection, t=
est_simultaneous_sync_rehandshake, teardown_connection);<br>
+=C2=A0 =C2=A0g_test_add (&quot;/tls/&quot; BACKEND &quot;/connection/close=
-immediately&quot;, TestConnection, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup_connection, t=
est_close_immediately, teardown_connection);<br>
+-=C2=A0 g_test_add (&quot;/tls/&quot; BACKEND &quot;/connection/unclean-cl=
ose-by-server&quot;, TestConnection, NULL,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_connection, test_u=
nclean_close_by_server, teardown_connection);<br>
+=C2=A0 =C2=A0g_test_add (&quot;/tls/&quot; BACKEND &quot;/connection/async=
-implicit-handshake&quot;, TestConnection, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup_connection, t=
est_async_implicit_handshake, teardown_connection);<br>
+=C2=A0 =C2=A0g_test_add (&quot;/tls/&quot; BACKEND &quot;/connection/outpu=
t-stream-close&quot;, TestConnection, NULL,<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-core/glib-networking/<a href=3D"http://glib-netwo=
rking_2.78.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.78.=
0.bb</a> b/meta/recipes-core/glib-networking/<a href=3D"http://glib-network=
ing_2.78.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.78.0.=
bb</a><br>
index 68f9a2ed783..4576b3556c0 100644<br>
--- a/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.78.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.78.0.bb</a=
><br>
+++ b/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.78.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.78.0.bb</a=
><br>
@@ -30,8 +30,9 @@ PACKAGECONFIG[gnomeproxy] =3D &quot;-Dgnome_proxy=3Denabl=
ed,-Dgnome_proxy=3Ddisabled,gsetti<br>
=C2=A0inherit gnomebase gettext upstream-version-is-even gio-module-cache p=
test-gnome<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://run-ptest&quot;<br>
-SRC_URI +=3D &quot;file://eagain.patch&quot;<br>
-<br>
+SRC_URI +=3D &quot;file://eagain.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;, &#39;openssl&#39;, &#39;file://0001-tests-Disable-test_unclea=
n_close_by_server.patch&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0FILES:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/gio=
/modules/libgio*.so \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/db=
us-1/services/ \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193474): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193474" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193474</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103625368/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103625368/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000027bbe5060e87d389--

