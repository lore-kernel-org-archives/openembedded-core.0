Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2ADB878635
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:30:44 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id q24so18818870ioh.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+a8GUUiOkmtFuBMOAou79dQQKeo+z4OiYnn4PvvSGwQ=;
	b=vzLXhEne2PB+287NspLRsW9KmL1VML9POklHXpkI1u3MhduvjnkcEmwV1llL3uQid7
	HPLoV+ZUR7jeq+kMl6jJaltD7QXSpKe1Y9JBOSYgvy9NZ/7/w8ItKiGwQMTo32ImXY3D
	vYCjQz5BCibjXufQ7nBCnZky0pi7Xa6bnEJgnAcprFj65VKB+ndAoPzOtncMiitbPuXf
	SCobNXiaQGM/agXewEEVciLU/HaoNGSa8tVoaaDQdXlcklxJ5hJzDStY2ruDVs18iGvF
	SEuXHaes2qmLOyoMa3szBHMAKJv4mREsDYNeMc9xJ8I6f5PSeayI+i2E8UosIjT88Wl9
	daJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+a8GUUiOkmtFuBMOAou79dQQKeo+z4OiYnn4PvvSGwQ=;
	b=toM8CbDZTo4LEDNZ/PyFMEcvNQPrZfsNrjXlXGWYQyoCQMPDCbXqGvgyN/Wd/e1k+e
	2SJb1Bnzx2ejr9tKMxNdbqJW+WKiEc4gqL/q57vcYNJC99wXTTReRsUGBPsd/cb9+4MV
	ZGS43eoZQsegjXyIgGPYZGaPdL9XqYIBpMojklR01ZXgiEvVhnetrHhj5S/0EufOt9Yc
	0vtz0zvaaXCoEUTFkb+XSeFvVjqCLCuk+qMQ9OifMSZb+0Z42UFicu//qHSNcYCgs+Yi
	uaXMg0NvaR1MatNzHIthoFR2VIUzqN4I359B9gJeqSV6bD8o1lbQKbtVx+82L6NhaVZW
	jvAQ==
X-Gm-Message-State: APf1xPDUir4iRe090TZvANMjpxbByt4levTJ5KhYH158rFH+JCCaB2A/
	FtClTFwVrIV4e13LlgILa9cyn/ZQ6ID+w8NzVreBzg==
X-Google-Smtp-Source: AG47ELtDkL/9JuxOTDjpFlQOjUwBDzJtqcssUHju5cPJAKlc0VTSS14D5CBzaoPz3bzkumuH0wmJcDHOIVjf/uOACFM=
X-Received: by 10.107.7.87 with SMTP id 84mr18454897ioh.216.1520271045863;
	Mon, 05 Mar 2018 09:30:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 5 Mar 2018 09:30:25 -0800 (PST)
In-Reply-To: <30b5b54b-c330-5bdf-9f3c-454ddde92353@gmail.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
	<20180305172046.21729-2-ross.burton@intel.com>
	<30b5b54b-c330-5bdf-9f3c-454ddde92353@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Mar 2018 17:30:25 +0000
Message-ID: <CAJTo0LZ0uoDi5Ant3zM4T4ZgR07JExQ=ZBqRszvBdRpFFKUCqQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/29] dbus-glib: refresh patch
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
X-List-Received-Date: Mon, 05 Mar 2018 17:30:45 -0000
Content-Type: multipart/alternative; boundary="001a113ecdf4a6e1a40566adafce"

--001a113ecdf4a6e1a40566adafce
Content-Type: text/plain; charset="UTF-8"

I was about to write a long email explaining all this but my dinner is
almost ready.

Short version: patch fuzz is dangerous, we've had patches apply using fuzz
which actually break the code, or doing something else stupid like repeat a
statement.

We'd like to eventually have do_patch rejecting any fuzz on these grounds,
so I wrote a nasty script to rebase all the patches and am reviewing them
bit by bit.  Note that two of these patches are deleting patches that we've
been applying although upstream have already applied the same fix...

Ross

On 5 March 2018 at 17:24, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 03/05/2018 09:20 AM, Ross Burton wrote:
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Why do this patches need to be refreshed?
>
> - armin
> > ---
> >  meta/recipes-core/dbus/dbus-glib/no-examples.patch | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-core/dbus/dbus-glib/no-examples.patch
> b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
> > index fbb49678282..32e76117188 100644
> > --- a/meta/recipes-core/dbus/dbus-glib/no-examples.patch
> > +++ b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
> > @@ -5,11 +5,13 @@ Upstream-Status: Inappropriate [disable feature]
> >  Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> >  Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> >
> > ---- dbus-glib-0.70/dbus/Makefile.am.orig     2006-07-23
> 16:04:43.000000000 +0200
> > -+++ dbus-glib-0.70/dbus/Makefile.am  2006-07-23 16:04:52.000000000
> +0200
> > +Index: dbus-glib-0.108/dbus/Makefile.am
> > +===================================================================
> > +--- dbus-glib-0.108.orig/dbus/Makefile.am
> > ++++ dbus-glib-0.108/dbus/Makefile.am
> >  @@ -1,4 +1,4 @@
> >  -SUBDIRS = . examples
> >  +SUBDIRS = .
> >
> > - INCLUDES=-I$(top_srcdir) $(DBUS_CFLAGS) $(DBUS_GLIB_CFLAGS)
> $(DBUS_GLIB_TOOL_CFLAGS) -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"$(prefix)/@
> DATADIRNAME@/locale\"
> > -
> > + AM_CPPFLAGS = \
> > +     -I$(top_srcdir)                                         \
>
>

--001a113ecdf4a6e1a40566adafce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was about to write a long email explaining all this but =
my dinner is almost ready.<div><br></div><div>Short version: patch fuzz is =
dangerous, we&#39;ve had patches apply using fuzz which actually break the =
code, or doing something else stupid like repeat a statement.</div><div><br=
></div><div>We&#39;d like to eventually have do_patch rejecting any fuzz on=
 these grounds, so I wrote a nasty script to rebase all the patches and am =
reviewing them bit by bit.=C2=A0 Note that two of these patches are deletin=
g patches that we&#39;ve been applying although upstream have already appli=
ed the same fix...</div><div><br></div><div>Ross</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 5 March 2018 at 17:24, akuste=
r808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=
=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
<br>
On 03/05/2018 09:20 AM, Ross Burton wrote:<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
<br>
Why do this patches need to be refreshed?<br>
<br>
- armin<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch | 10 +++=
+++----<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch b=
/meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch<br>
&gt; index fbb49678282..32e76117188 100644<br>
&gt; --- a/meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch<br>
&gt; +++ b/meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch<br>
&gt; @@ -5,11 +5,13 @@ Upstream-Status: Inappropriate [disable feature]<br>
&gt;=C2=A0 Signed-off-by: Kevin Tian &lt;<a href=3D"mailto:kevin.tian@intel=
.com">kevin.tian@intel.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman=
@intel.com">scott.a.garman@intel.com</a>&gt;<br>
&gt;<br>
&gt; ---- dbus-glib-0.70/dbus/Makefile.<wbr>am.orig=C2=A0 =C2=A0 =C2=A02006=
-07-23 16:04:43.000000000 +0200<br>
&gt; -+++ dbus-glib-0.70/dbus/Makefile.<wbr>am=C2=A0 2006-07-23 16:04:52.00=
0000000 +0200<br>
&gt; +Index: dbus-glib-0.108/dbus/Makefile.<wbr>am<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- dbus-glib-0.108.orig/dbus/<wbr>Makefile.am<br>
&gt; ++++ dbus-glib-0.108/dbus/Makefile.<wbr>am<br>
&gt;=C2=A0 @@ -1,4 +1,4 @@<br>
&gt;=C2=A0 -SUBDIRS =3D . examples<br>
&gt;=C2=A0 +SUBDIRS =3D .<br>
&gt;<br>
&gt; - INCLUDES=3D-I$(top_srcdir) $(DBUS_CFLAGS) $(DBUS_GLIB_CFLAGS) $(DBUS=
_GLIB_TOOL_CFLAGS) -DDBUS_COMPILATION=3D1 -DDBUS_LOCALEDIR=3D\&quot;$(prefi=
x)/@<wbr>DATADIRNAME@/locale\&quot;<br>
&gt; -<br>
&gt; + AM_CPPFLAGS =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-I$(top_srcdir)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
<br>
</div></div></blockquote></div><br></div>

--001a113ecdf4a6e1a40566adafce--
