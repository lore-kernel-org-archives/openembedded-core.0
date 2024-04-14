Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7421C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 04:44:52 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.26637.1713069887483582560
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Apr 2024 21:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Muk384wG;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-61587aa956eso20602157b3.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 21:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713069886; x=1713674686; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XyqMGJyQFjV/Hya7nMyKqSDlGC++Fh0HZeo78PUjQrY=;
        b=Muk384wGodyxSra1rJxoad4fwhS74/LV7zuhR0r2BuugX/tEG+GexeDHgAjr7AAbV3
         Q3bD39EPv3DmBdbbxI1SY9tqoWdIGEAVYxIac1yS+XE9wzQA3CJbqjf2tfDnDdn9cYMT
         jzSldI+F+wpxuiQCN1oBK0bB+jE8EGc8+XYo50nqGBchcQpweK2z1FvOK/aIN1pBtRvy
         1c4BHAkj/3ddA93MAl+Dqw7xveuQvYO+DoQiF/n+ePhZswPY8n9ALK34DjzKK9vPYHLm
         Lehk5S7phYYyOuZ30HyJYUBGmtRP8IDmZmUvfNrzulJ5pz78VVbH2vh4cNBho+FzujdL
         CJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713069886; x=1713674686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyqMGJyQFjV/Hya7nMyKqSDlGC++Fh0HZeo78PUjQrY=;
        b=dwHRSEn7YnbIPHmE5AMGX+JgB9UvHZpka+nz1PLWUWyI1BmmQCNKA47zLxwTAEifg5
         o03eRj3ROA1cBHdnoI+vcWHFQUQWvWsHY6YZsOjTtIrku7Ewugr8jUBYDNeI+YCDg6Qz
         SeAt3fNu2yg8Lu/ZRmMUJ3bUB+thBBEBbmqNxOFgPVGUG5CcK6wT9AGTUpuAX2Px1IQw
         tefV8blQ3fyEgPb0AuTIWiYQ6vG8izA+HTclcQze9qrsviQGaZ7SwZaq51intGxFIq0q
         JFxAMG9PMs5XR0lDpZ2hZzXNcR5MN7On9D0Rhpm0qbeTmmDiyfK3QbkLNfBp8KvklrHX
         weTQ==
X-Gm-Message-State: AOJu0YywWzzLpF9O7s0VjSeDt2qGqj4gx7FLMK0hMBAKBPRntpeKYTJA
	cfpD/fOucr43Z9dD8qu/KFDhUL0BVTUoyOQJX4TDb70JkDKKSWdl7KvQJqtMYqTYv1y9jb5Y37i
	o6ySkr2AfuqoXNnS7epqBPra3p3E=
X-Google-Smtp-Source: AGHT+IF+PwOIo1lOKuBCTeY66HUsJNnjoQCQNtp7x2mQyU+NAm5/LNIJAsy+N3PKv5b9Ar8xvLmrDrkEcu2Jmx4NlOI=
X-Received: by 2002:a81:f00b:0:b0:618:1202:3222 with SMTP id
 p11-20020a81f00b000000b0061812023222mr6110827ywm.38.1713069886408; Sat, 13
 Apr 2024 21:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240413224917.1772877-1-peter.marko@siemens.com>
In-Reply-To: <20240413224917.1772877-1-peter.marko@siemens.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 13 Apr 2024 21:44:35 -0700
Message-ID: <CANx9H-C_-5WjpQnsJ3mye2UxNf_p+1Qa+nd+4aOAKqsxfg_Q4Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] openssl: openssl: patch CVE-2024-2511
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000e11510616072a57"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 04:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198204

--0000000000000e11510616072a57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like when 3.2.2 is released it will include this. So 3.2.2 should be
applied to scarthgap.

=E2=80=9Cmaster=E2=80=9D will be moving to 3.3.0 soon for styhead

On Sat, Apr 13, 2024 at 3:50=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> Patch:
> https://github.com/openssl/openssl/commit/e9d7083e241670332e0443da0f0d4ff=
b52829f08
> News:
> https://github.com/openssl/openssl/commit/b7acb6731a96b073d6150465bd090e2=
052a595c2
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../openssl/openssl/CVE-2024-2511.patch       | 120 ++++++++++++++++++
>  .../openssl/openssl_3.2.1.bb                  |   1 +
>  2 files changed, 121 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patc=
h
> b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
> new file mode 100644
> index 0000000000..8772f716d5
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
> @@ -0,0 +1,120 @@
> +From e9d7083e241670332e0443da0f0d4ffb52829f08 Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Tue, 5 Mar 2024 15:43:53 +0000
> +Subject: [PATCH] Fix unconstrained session cache growth in TLSv1.3
> +
> +In TLSv1.3 we create a new session object for each ticket that we send.
> +We do this by duplicating the original session. If SSL_OP_NO_TICKET is i=
n
> +use then the new session will be added to the session cache. However, if
> +early data is not in use (and therefore anti-replay protection is being
> +used), then multiple threads could be resuming from the same session
> +simultaneously. If this happens and a problem occurs on one of the
> threads,
> +then the original session object could be marked as not_resumable. When =
we
> +duplicate the session object this not_resumable status gets copied into
> the
> +new session object. The new session object is then added to the session
> +cache even though it is not_resumable.
> +
> +Subsequently, another bug means that the session_id_length is set to 0 f=
or
> +sessions that are marked as not_resumable - even though that session is
> +still in the cache. Once this happens the session can never be removed
> from
> +the cache. When that object gets to be the session cache tail object the
> +cache never shrinks again and grows indefinitely.
> +
> +CVE-2024-2511
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24043)
> +
> +CVE: CVE-2024-2511
> +Upstream-Status: Backport [
> https://github.com/openssl/openssl/commit/e9d7083e241670332e0443da0f0d4ff=
b52829f08
> ]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + ssl/ssl_lib.c            |  5 +++--
> + ssl/ssl_sess.c           | 28 ++++++++++++++++++++++------
> + ssl/statem/statem_srvr.c |  5 ++---
> + 3 files changed, 27 insertions(+), 11 deletions(-)
> +
> +diff --git a/ssl/ssl_lib.c b/ssl/ssl_lib.c
> +index 4afb43bc86e54..c51529ddab5bb 100644
> +--- a/ssl/ssl_lib.c
> ++++ b/ssl/ssl_lib.c
> +@@ -4457,9 +4457,10 @@ void ssl_update_cache(SSL_CONNECTION *s, int mode=
)
> +
> +     /*
> +      * If the session_id_length is 0, we are not supposed to cache it,
> and it
> +-     * would be rather hard to do anyway :-)
> ++     * would be rather hard to do anyway :-). Also if the session has
> already
> ++     * been marked as not_resumable we should not cache it for later
> reuse.
> +      */
> +-    if (s->session->session_id_length =3D=3D 0)
> ++    if (s->session->session_id_length =3D=3D 0 || s->session->not_resum=
able)
> +         return;
> +
> +     /*
> +diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
> +index 3dcc4d81e5bc6..1fa6d17c46863 100644
> +--- a/ssl/ssl_sess.c
> ++++ b/ssl/ssl_sess.c
> +@@ -127,16 +127,11 @@ SSL_SESSION *SSL_SESSION_new(void)
> +     return ss;
> + }
> +
> +-SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
> +-{
> +-    return ssl_session_dup(src, 1);
> +-}
> +-
> + /*
> +  * Create a new SSL_SESSION and duplicate the contents of |src| into it=
.
> If
> +  * ticket =3D=3D 0 then no ticket information is duplicated, otherwise =
it is.
> +  */
> +-SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
> ++static SSL_SESSION *ssl_session_dup_intern(const SSL_SESSION *src, int
> ticket)
> + {
> +     SSL_SESSION *dest;
> +
> +@@ -265,6 +260,27 @@ SSL_SESSION *ssl_session_dup(const SSL_SESSION *src=
,
> int ticket)
> +     return NULL;
> + }
> +
> ++SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
> ++{
> ++    return ssl_session_dup_intern(src, 1);
> ++}
> ++
> ++/*
> ++ * Used internally when duplicating a session which might be already
> shared.
> ++ * We will have resumed the original session. Subsequently we might hav=
e
> marked
> ++ * it as non-resumable (e.g. in another thread) - but this copy should
> be ok to
> ++ * resume from.
> ++ */
> ++SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
> ++{
> ++    SSL_SESSION *sess =3D ssl_session_dup_intern(src, ticket);
> ++
> ++    if (sess !=3D NULL)
> ++        sess->not_resumable =3D 0;
> ++
> ++    return sess;
> ++}
> ++
> + const unsigned char *SSL_SESSION_get_id(const SSL_SESSION *s, unsigned
> int *len)
> + {
> +     if (len)
> +diff --git a/ssl/statem/statem_srvr.c b/ssl/statem/statem_srvr.c
> +index 853af8c0aa9f9..d5f0ab091dacc 100644
> +--- a/ssl/statem/statem_srvr.c
> ++++ b/ssl/statem/statem_srvr.c
> +@@ -2445,9 +2445,8 @@ CON_FUNC_RETURN
> tls_construct_server_hello(SSL_CONNECTION *s, WPACKET *pkt)
> +      * so the following won't overwrite an ID that we're supposed
> +      * to send back.
> +      */
> +-    if (s->session->not_resumable ||
> +-        (!(SSL_CONNECTION_GET_CTX(s)->session_cache_mode &
> SSL_SESS_CACHE_SERVER)
> +-         && !s->hit))
> ++    if (!(SSL_CONNECTION_GET_CTX(s)->session_cache_mode &
> SSL_SESS_CACHE_SERVER)
> ++            && !s->hit)
> +         s->session->session_id_length =3D 0;
> +
> +     if (usetls13) {
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
> b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
> index c7134c54db..d37b68abbb 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "
> http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
>
> file://0001-Added-handshake-history-reporting-when-test-fails.patch \
>             file://bti.patch \
> +           file://CVE-2024-2511.patch \
>             "
>
>  SRC_URI:append:class-nativesdk =3D " \
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198203):
> https://lists.openembedded.org/g/openembedded-core/message/198203
> Mute This Topic: https://lists.openembedded.org/mt/105508900/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000e11510616072a57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Looks like when 3.2.2 is released it will include this. S=
o 3.2.2 should be applied to scarthgap.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">=E2=80=9Cmaster=E2=80=9D will be moving to 3.3.0 soon for s=
tyhead=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sat, Apr 13, 2024 at 3:50=E2=80=AFPM Peter Marko via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;pete=
r.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.org">siemens.com=
@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Pete=
r Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=3D"_blank">pe=
ter.marko@siemens.com</a>&gt;<br>
<br>
Patch: <a href=3D"https://github.com/openssl/openssl/commit/e9d7083e2416703=
32e0443da0f0d4ffb52829f08" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/openssl/openssl/commit/e9d7083e241670332e0443da0f0d4ffb52829f08</a>=
<br>
News: <a href=3D"https://github.com/openssl/openssl/commit/b7acb6731a96b073=
d6150465bd090e2052a595c2" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/openssl/openssl/commit/b7acb6731a96b073d6150465bd090e2052a595c2</a><=
br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../openssl/openssl/CVE-2024-2511.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
20 ++++++++++++++++++<br>
=C2=A0.../openssl/<a href=3D"http://openssl_3.2.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">openssl_3.2.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 121 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024=
-2511.patch<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch =
b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch<br>
new file mode 100644<br>
index 0000000000..8772f716d5<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch<br>
@@ -0,0 +1,120 @@<br>
+From e9d7083e241670332e0443da0f0d4ffb52829f08 Mon Sep 17 00:00:00 2001<br>
+From: Matt Caswell &lt;<a href=3D"mailto:matt@openssl.org" target=3D"_blan=
k">matt@openssl.org</a>&gt;<br>
+Date: Tue, 5 Mar 2024 15:43:53 +0000<br>
+Subject: [PATCH] Fix unconstrained session cache growth in TLSv1.3<br>
+<br>
+In TLSv1.3 we create a new session object for each ticket that we send.<br=
>
+We do this by duplicating the original session. If SSL_OP_NO_TICKET is in<=
br>
+use then the new session will be added to the session cache. However, if<b=
r>
+early data is not in use (and therefore anti-replay protection is being<br=
>
+used), then multiple threads could be resuming from the same session<br>
+simultaneously. If this happens and a problem occurs on one of the threads=
,<br>
+then the original session object could be marked as not_resumable. When we=
<br>
+duplicate the session object this not_resumable status gets copied into th=
e<br>
+new session object. The new session object is then added to the session<br=
>
+cache even though it is not_resumable.<br>
+<br>
+Subsequently, another bug means that the session_id_length is set to 0 for=
<br>
+sessions that are marked as not_resumable - even though that session is<br=
>
+still in the cache. Once this happens the session can never be removed fro=
m<br>
+the cache. When that object gets to be the session cache tail object the<b=
r>
+cache never shrinks again and grows indefinitely.<br>
+<br>
+CVE-2024-2511<br>
+<br>
+Reviewed-by: Neil Horman &lt;<a href=3D"mailto:nhorman@openssl.org" target=
=3D"_blank">nhorman@openssl.org</a>&gt;<br>
+Reviewed-by: Tomas Mraz &lt;<a href=3D"mailto:tomas@openssl.org" target=3D=
"_blank">tomas@openssl.org</a>&gt;<br>
+(Merged from <a href=3D"https://github.com/openssl/openssl/pull/24043" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openssl/pull/2=
4043</a>)<br>
+<br>
+CVE: CVE-2024-2511<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/openssl/openssl/c=
ommit/e9d7083e241670332e0443da0f0d4ffb52829f08" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/openssl/openssl/commit/e9d7083e241670332e044=
3da0f0d4ffb52829f08</a>]<br>
+Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
+---<br>
+ ssl/ssl_lib.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++--<br=
>
+ ssl/ssl_sess.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 28 +++++++++++++=
+++++++++------<br>
+ ssl/statem/statem_srvr.c |=C2=A0 5 ++---<br>
+ 3 files changed, 27 insertions(+), 11 deletions(-)<br>
+<br>
+diff --git a/ssl/ssl_lib.c b/ssl/ssl_lib.c<br>
+index 4afb43bc86e54..c51529ddab5bb 100644<br>
+--- a/ssl/ssl_lib.c<br>
++++ b/ssl/ssl_lib.c<br>
+@@ -4457,9 +4457,10 @@ void ssl_update_cache(SSL_CONNECTION *s, int mode)<=
br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 * If the session_id_length is 0, we are not supposed =
to cache it, and it<br>
+-=C2=A0 =C2=A0 =C2=A0* would be rather hard to do anyway :-)<br>
++=C2=A0 =C2=A0 =C2=A0* would be rather hard to do anyway :-). Also if the =
session has already<br>
++=C2=A0 =C2=A0 =C2=A0* been marked as not_resumable we should not cache it=
 for later reuse.<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 if (s-&gt;session-&gt;session_id_length =3D=3D 0)<br>
++=C2=A0 =C2=A0 if (s-&gt;session-&gt;session_id_length =3D=3D 0 || s-&gt;s=
ession-&gt;not_resumable)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0/*<br>
+diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c<br>
+index 3dcc4d81e5bc6..1fa6d17c46863 100644<br>
+--- a/ssl/ssl_sess.c<br>
++++ b/ssl/ssl_sess.c<br>
+@@ -127,16 +127,11 @@ SSL_SESSION *SSL_SESSION_new(void)<br>
+=C2=A0 =C2=A0 =C2=A0return ss;<br>
+ }<br>
+ <br>
+-SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)<br>
+-{<br>
+-=C2=A0 =C2=A0 return ssl_session_dup(src, 1);<br>
+-}<br>
+-<br>
+ /*<br>
+=C2=A0 * Create a new SSL_SESSION and duplicate the contents of |src| into=
 it. If<br>
+=C2=A0 * ticket =3D=3D 0 then no ticket information is duplicated, otherwi=
se it is.<br>
+=C2=A0 */<br>
+-SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)<br>
++static SSL_SESSION *ssl_session_dup_intern(const SSL_SESSION *src, int ti=
cket)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0SSL_SESSION *dest;<br>
+ <br>
+@@ -265,6 +260,27 @@ SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, =
int ticket)<br>
+=C2=A0 =C2=A0 =C2=A0return NULL;<br>
+ }<br>
+ <br>
++SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)<br>
++{<br>
++=C2=A0 =C2=A0 return ssl_session_dup_intern(src, 1);<br>
++}<br>
++<br>
++/*<br>
++ * Used internally when duplicating a session which might be already shar=
ed.<br>
++ * We will have resumed the original session. Subsequently we might have =
marked<br>
++ * it as non-resumable (e.g. in another thread) - but this copy should be=
 ok to<br>
++ * resume from.<br>
++ */<br>
++SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)<br>
++{<br>
++=C2=A0 =C2=A0 SSL_SESSION *sess =3D ssl_session_dup_intern(src, ticket);<=
br>
++<br>
++=C2=A0 =C2=A0 if (sess !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sess-&gt;not_resumable =3D 0;<br>
++<br>
++=C2=A0 =C2=A0 return sess;<br>
++}<br>
++<br>
+ const unsigned char *SSL_SESSION_get_id(const SSL_SESSION *s, unsigned in=
t *len)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0if (len)<br>
+diff --git a/ssl/statem/statem_srvr.c b/ssl/statem/statem_srvr.c<br>
+index 853af8c0aa9f9..d5f0ab091dacc 100644<br>
+--- a/ssl/statem/statem_srvr.c<br>
++++ b/ssl/statem/statem_srvr.c<br>
+@@ -2445,9 +2445,8 @@ CON_FUNC_RETURN tls_construct_server_hello(SSL_CONNE=
CTION *s, WPACKET *pkt)<br>
+=C2=A0 =C2=A0 =C2=A0 * so the following won&#39;t overwrite an ID that we&=
#39;re supposed<br>
+=C2=A0 =C2=A0 =C2=A0 * to send back.<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 if (s-&gt;session-&gt;not_resumable ||<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (!(SSL_CONNECTION_GET_CTX(s)-&gt;session_cach=
e_mode &amp; SSL_SESS_CACHE_SERVER)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; !s-&gt;hit))<br>
++=C2=A0 =C2=A0 if (!(SSL_CONNECTION_GET_CTX(s)-&gt;session_cache_mode &amp=
; SSL_SESS_CACHE_SERVER)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !s-&gt;hit)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;session-&gt;session_id_length =3D =
0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (usetls13) {<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.2.1.bb</a> b/meta/re=
cipes-connectivity/openssl/<a href=3D"http://openssl_3.2.1.bb" rel=3D"noref=
errer" target=3D"_blank">openssl_3.2.1.bb</a><br>
index c7134c54db..d37b68abbb 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.2.1.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.2.1.bb</a><br>
@@ -13,6 +13,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/sourc=
e/openssl-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www=
.openssl.org/source/openssl-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Configure-do-not-twea=
k-mips-cflags.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Added-handshake-histo=
ry-reporting-when-test-fails.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://bti.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-2511.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; \<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198203): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198203" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198203</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105508900/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105508900/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000e11510616072a57--

