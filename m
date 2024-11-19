Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B12D60D1D
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 04:35:07 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.13610.1731990895252379393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 20:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X7A7DFMs;
 spf=pass (domain: mvista.com, ip: 209.85.218.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a68480164so67972266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 20:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1731990893; x=1732595693; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UEIxLmh36+rs0ckyfFDP0RqNrZDF8Jmh0O0L6e3Y/h0=;
        b=X7A7DFMsNOp4x5PCxphJZ/tQX5cIlCJgoXwoHbTv5hPcRr2bCJLQbfJXrmV8CuWKl2
         kTZjjnK2H2FrtVHMgtUbI/JtmD5280RdfaqnLnGg+kDfvz5iJNX1kpEtaDcXVScfiZd6
         iPH2VQdx6OCpD9MNoxj8o1jKuO06jpvk67gbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731990893; x=1732595693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEIxLmh36+rs0ckyfFDP0RqNrZDF8Jmh0O0L6e3Y/h0=;
        b=MnjfZ31w0L6KynyTZp/LYG65q0sYa63yQmXLIMQUCtd3wpxOIGbfc/ZAFP2uTUXPAr
         dQm4B40YT+a3UWp7EYYJ9pvaBzd4Dj5Y874RrFiHOBTFaTPqjiZ4egpPUkhIjCvBR6Lo
         NLKLMdmtID52Gjcx2K95NyM8F4giLLG5DD+ASKm5WBMdVnNNp5ZZLJWnI23SwXgwkHoD
         eso+14VizDADYrGySYnvdwtdjo5eJjEjOAMBYkGgGk4TQNCGNz5d6umRdc+1wzOuhMpi
         BBD6VMN09OZScYppdl6DGheBqHY08XQtvM/Y6FEz7HuNCndS31UIHxlO0bzK+lzJG9S+
         M23g==
X-Gm-Message-State: AOJu0YzFIi5JW3ns8PdnoVR877LMdx+qfI5/OsI+GWPzJ5K/cmHZb6O8
	Z/DbwyluDFICS61be4Vdz7OtQEKfNbVRuhK1uBktpm0oop+liCyXdGCIuyD5/P/rGtU3AuSBwuj
	DQR9Y3jQlWwBt8QVrJ04e1MhCPV4X9EtcvjBEFw==
X-Google-Smtp-Source: AGHT+IHxmKNi8nBdP7AGimQTPeZfIPQ9ISd0BZcBN9xD4mgzurGHkHGSwhGs2AHfKBCrQ4xHu6Pptuno4re00gWiY8c=
X-Received: by 2002:a17:907:7ba3:b0:a9e:b287:2813 with SMTP id
 a640c23a62f3a-aa4833f73f9mr1488570666b.5.1731990893112; Mon, 18 Nov 2024
 20:34:53 -0800 (PST)
MIME-Version: 1.0
References: <20241114123903.5013-1-vanusuri@mvista.com> <CAOSpxda14hwe7PQLGd-SsChSLNy9N3bWrL6qXx0HeoxhUuhZyA@mail.gmail.com>
In-Reply-To: <CAOSpxda14hwe7PQLGd-SsChSLNy9N3bWrL6qXx0HeoxhUuhZyA@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 19 Nov 2024 10:04:41 +0530
Message-ID: <CANQUz18-O4f4fQakw40dH6AsKZA7ZtRDHLutgew4JDLEkk-=PQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] glib-2.0: Backport fix for CVE-2024-52533
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f0718006273c8d0b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 04:35:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207375

--000000000000f0718006273c8d0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

It looks like tzdata update to 2024b causing the ptest failures for glib2.0
in the file "glib/gdatetime.test" not with CVE -2024-52533.

Below commit is missing in the kirkstone-nut

https://git.openembedded.org/openembedded-core/commit/?id=3D0c8f87d5d4ec9f2=
86b1e85d114cb9a728c1ff64b

I think we need to pull/merge the above commit along with the tzdata update
to 2024b.
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&id=3D723c32ff858ccfd5a69e63e681a57903af928fd5

Reference: https://lists.openembedded.org/g/openembedded-core/message/20609=
5

Thanks & Regards,
Vijay

On Tue, Nov 19, 2024 at 2:45=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:

> Unfortunately I am getting ptest errors with this patch on both
> qemux86-64 and and qemuarm64:
>
> AssertionError: Failed ptests:
> {'glib-2.0': ['glib/gdatetime.test']}
>
> https://valkyrie.yoctoproject.org/#/builders/73/builds/403
> https://valkyrie.yoctoproject.org/#/builders/61/builds/403
>
> Steve
>
> On Thu, Nov 14, 2024 at 4:39=E2=80=AFAM Vijay Anusuri via
> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Upstream-Status: Backport from
> https://gitlab.gnome.org/GNOME/glib/-/commit/ec0b708b981af77fef8e4bbb603c=
de4de4cd2e29
> >
> > Reference: https://security-tracker.debian.org/tracker/CVE-2024-52533
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../glib-2.0/glib-2.0/CVE-2024-52533.patch    | 49 +++++++++++++++++++
> >  meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
> >  2 files changed, 50 insertions(+)
> >  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
> > new file mode 100644
> > index 0000000000..3a06a9d782
> > --- /dev/null
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
> > @@ -0,0 +1,49 @@
> > +From ec0b708b981af77fef8e4bbb603cde4de4cd2e29 Mon Sep 17 00:00:00 2001
> > +From: Michael Catanzaro <mcatanzaro@redhat.com>
> > +Date: Thu, 19 Sep 2024 18:35:53 +0100
> > +Subject: [PATCH] gsocks4aproxy: Fix a single byte buffer overflow in
> connect
> > + messages
> > +
> > +`SOCKS4_CONN_MSG_LEN` failed to account for the length of the final nu=
l
> > +byte in the connect message, which is an addition in SOCKSv4a vs
> > +SOCKSv4.
> > +
> > +This means that the buffer for building and transmitting the connect
> > +message could be overflowed if the username and hostname are both
> > +`SOCKS4_MAX_LEN` (255) bytes long.
> > +
> > +Proxy configurations are normally statically configured, so the userna=
me
> > +is very unlikely to be near its maximum length, and hence this overflo=
w
> > +is unlikely to be triggered in practice.
> > +
> > +(Commit message by Philip Withnall, diagnosis and fix by Michael
> > +Catanzaro.)
> > +
> > +Fixes: #3461
> > +
> > +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/glib/-/commit/ec0b708b981af77fef8e4bbb603c=
de4de4cd2e29
> ]
> > +CVE: CVE-2024-52533
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + gio/gsocks4aproxy.c | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gio/gsocks4aproxy.c b/gio/gsocks4aproxy.c
> > +index 3dad118eb7..b3146d08fd 100644
> > +--- a/gio/gsocks4aproxy.c
> > ++++ b/gio/gsocks4aproxy.c
> > +@@ -79,9 +79,9 @@ g_socks4a_proxy_init (GSocks4aProxy *proxy)
> > +  *
> +----+----+----+----+----+----+----+----+----+----+....+----+------+....+=
------+
> > +  * | VN | CD | DSTPORT |      DSTIP        | USERID       |NULL| HOST
> |    | NULL |
> > +  *
> +----+----+----+----+----+----+----+----+----+----+....+----+------+....+=
------+
> > +- *    1    1      2              4           variable       1
> variable
> > ++ *    1    1      2              4           variable       1
> variable    1
> > +  */
> > +-#define SOCKS4_CONN_MSG_LEN       (9 + SOCKS4_MAX_LEN * 2)
> > ++#define SOCKS4_CONN_MSG_LEN       (10 + SOCKS4_MAX_LEN * 2)
> > + static gint
> > + set_connect_msg (guint8      *msg,
> > +                const gchar *hostname,
> > +--
> > +GitLab
> > +
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> > index 35b51a3ec9..c628ac19af 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> > @@ -49,6 +49,7 @@ SRC_URI =3D
> "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> >             file://CVE-2024-34397_16.patch \
> >             file://CVE-2024-34397_17.patch \
> >             file://CVE-2024-34397_18.patch \
> > +           file://CVE-2024-52533.patch \
> >             "
> >  SRC_URI:append:class-native =3D " file://relocate-modules.patch"
> >
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#207156):
> https://lists.openembedded.org/g/openembedded-core/message/207156
> > Mute This Topic: https://lists.openembedded.org/mt/109572074/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000f0718006273c8d0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi Steve,<br><br></div>It looks l=
ike tzdata update to 2024b causing the ptest failures for glib2.0 in the fi=
le &quot;glib/gdatetime.test&quot; not with CVE -2024-52533.<br><br></div>B=
elow commit is missing in the kirkstone-nut<br><br><a href=3D"https://git.o=
penembedded.org/openembedded-core/commit/?id=3D0c8f87d5d4ec9f286b1e85d114cb=
9a728c1ff64b">https://git.openembedded.org/openembedded-core/commit/?id=3D0=
c8f87d5d4ec9f286b1e85d114cb9a728c1ff64b</a><br><br></div>I think we need to=
 pull/merge the above commit along with the tzdata update to 2024b.<br><a h=
ref=3D"https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Ds=
table/kirkstone-nut&amp;id=3D723c32ff858ccfd5a69e63e681a57903af928fd5">http=
s://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/kirks=
tone-nut&amp;id=3D723c32ff858ccfd5a69e63e681a57903af928fd5</a><br><br></div=
>Reference: <a href=3D"https://lists.openembedded.org/g/openembedded-core/m=
essage/206095">https://lists.openembedded.org/g/openembedded-core/message/2=
06095</a><br><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Nov 19, 2024 at 2:45=E2=80=AFAM Steve Sakoman &lt;<a href=3D"mailto=
:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Unfortunately I am getting ptest error=
s with this patch on both<br>
qemux86-64 and and qemuarm64:<br>
<br>
AssertionError: Failed ptests:<br>
{&#39;glib-2.0&#39;: [&#39;glib/gdatetime.test&#39;]}<br>
<br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/73/builds/403" rel=
=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctoproject.org/#/build=
ers/73/builds/403</a><br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/61/builds/403" rel=
=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctoproject.org/#/build=
ers/61/builds/403</a><br>
<br>
Steve<br>
<br>
On Thu, Nov 14, 2024 at 4:39=E2=80=AFAM Vijay Anusuri via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@=
lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Upstream-Status: Backport from <a href=3D"https://gitlab.gnome.org/GNO=
ME/glib/-/commit/ec0b708b981af77fef8e4bbb603cde4de4cd2e29" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.gnome.org/GNOME/glib/-/commit/ec0b708b9=
81af77fef8e4bbb603cde4de4cd2e29</a><br>
&gt;<br>
&gt; Reference: <a href=3D"https://security-tracker.debian.org/tracker/CVE-=
2024-52533" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.d=
ebian.org/tracker/CVE-2024-52533</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../glib-2.0/glib-2.0/CVE-2024-52533.patch=C2=A0 =C2=A0 | 49 +++=
++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.72.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.72.3.bb</a> |=C2=A0 1 +<br=
>
&gt;=C2=A0 2 files changed, 50 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-=
52533.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch =
b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..3a06a9d782<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch<br>
&gt; @@ -0,0 +1,49 @@<br>
&gt; +From ec0b708b981af77fef8e4bbb603cde4de4cd2e29 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Michael Catanzaro &lt;<a href=3D"mailto:mcatanzaro@redhat.com" =
target=3D"_blank">mcatanzaro@redhat.com</a>&gt;<br>
&gt; +Date: Thu, 19 Sep 2024 18:35:53 +0100<br>
&gt; +Subject: [PATCH] gsocks4aproxy: Fix a single byte buffer overflow in =
connect<br>
&gt; + messages<br>
&gt; +<br>
&gt; +`SOCKS4_CONN_MSG_LEN` failed to account for the length of the final n=
ul<br>
&gt; +byte in the connect message, which is an addition in SOCKSv4a vs<br>
&gt; +SOCKSv4.<br>
&gt; +<br>
&gt; +This means that the buffer for building and transmitting the connect<=
br>
&gt; +message could be overflowed if the username and hostname are both<br>
&gt; +`SOCKS4_MAX_LEN` (255) bytes long.<br>
&gt; +<br>
&gt; +Proxy configurations are normally statically configured, so the usern=
ame<br>
&gt; +is very unlikely to be near its maximum length, and hence this overfl=
ow<br>
&gt; +is unlikely to be triggered in practice.<br>
&gt; +<br>
&gt; +(Commit message by Philip Withnall, diagnosis and fix by Michael<br>
&gt; +Catanzaro.)<br>
&gt; +<br>
&gt; +Fixes: #3461<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
glib/-/commit/ec0b708b981af77fef8e4bbb603cde4de4cd2e29" rel=3D"noreferrer" =
target=3D"_blank">https://gitlab.gnome.org/GNOME/glib/-/commit/ec0b708b981a=
f77fef8e4bbb603cde4de4cd2e29</a>]<br>
&gt; +CVE: CVE-2024-52533<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + gio/gsocks4aproxy.c | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/gio/gsocks4aproxy.c b/gio/gsocks4aproxy.c<br>
&gt; +index 3dad118eb7..b3146d08fd 100644<br>
&gt; +--- a/gio/gsocks4aproxy.c<br>
&gt; ++++ b/gio/gsocks4aproxy.c<br>
&gt; +@@ -79,9 +79,9 @@ g_socks4a_proxy_init (GSocks4aProxy *proxy)<br>
&gt; +=C2=A0 * +----+----+----+----+----+----+----+----+----+----+....+----=
+------+....+------+<br>
&gt; +=C2=A0 * | VN | CD | DSTPORT |=C2=A0 =C2=A0 =C2=A0 DSTIP=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | USERID=C2=A0 =C2=A0 =C2=A0 =C2=A0|NULL| HOST |=C2=A0 =C2=
=A0 | NULL |<br>
&gt; +=C2=A0 * +----+----+----+----+----+----+----+----+----+----+....+----=
+------+....+------+<br>
&gt; +- *=C2=A0 =C2=A0 1=C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0variable=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 variable<br>
&gt; ++ *=C2=A0 =C2=A0 1=C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0variable=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 variable=C2=A0 =C2=A0 =
1<br>
&gt; +=C2=A0 */<br>
&gt; +-#define SOCKS4_CONN_MSG_LEN=C2=A0 =C2=A0 =C2=A0 =C2=A0(9 + SOCKS4_MA=
X_LEN * 2)<br>
&gt; ++#define SOCKS4_CONN_MSG_LEN=C2=A0 =C2=A0 =C2=A0 =C2=A0(10 + SOCKS4_M=
AX_LEN * 2)<br>
&gt; + static gint<br>
&gt; + set_connect_msg (guint8=C2=A0 =C2=A0 =C2=A0 *msg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const gchar *=
hostname,<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.7=
2.3.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.72.3.bb</a> b/meta/=
recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.72.3.bb" rel=3D"noreferr=
er" target=3D"_blank">glib-2.0_2.72.3.bb</a><br>
&gt; index 35b51a3ec9..c628ac19af 100644<br>
&gt; --- a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.72.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.72.3.bb</a><br>
&gt; +++ b/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.72.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.72.3.bb</a><br>
&gt; @@ -49,6 +49,7 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/glib/${SHRT_VER}/g=
lib-${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-34397_1=
6.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-34397_1=
7.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-34397_1=
8.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52533.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI:append:class-native =3D &quot; file://relocate-modules.p=
atch&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#207156): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/207156" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/207156</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10957207=
4/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/109572074/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000f0718006273c8d0b--

