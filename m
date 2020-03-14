Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 03F3861C45
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 20:33:17 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id j4so2629010qkc.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9IQhpOK+gWLXRIHvQ0awB2RqAMp+TV5ojPa5evkIEYk=;
	b=IhLywzL/WnMDUd7KWh2BDGvEmcox6g3DrGGW0U5ctxDAqy101Dw1Dh2BD4olL+br9+
	fy1ulRpdhRcZQYzm3ivt3INB1zH9VDUWc6w0kFcxwKtbgHZB5c2Rst4Nc7QVNEz6mfQS
	Sg8K18mdF2/uZWfqPQeEDW6o3sgOa/TOdwCcFpDDL7lnlr/0x0Wk6CXyjhyMoZQ2JcTO
	a/A3CwNJ9jdkU/hdFQbNQnKdCVE+MuTWk2qoP0+PK3IlSS4p8lfHLEGtKIpYmRUJUV7y
	qUICSa0BV4hjeR6Yy/3g+3ytRWpQ6XGrR2e4BrLfmx99PvwqskXtJ/+VNjhMQGp8JmnU
	GKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9IQhpOK+gWLXRIHvQ0awB2RqAMp+TV5ojPa5evkIEYk=;
	b=FCEDMGJ8vKNNXY6rTteCMRjLVJvpyn+q0iVbmPRo3hAnXqdJgi12DNv+ffakrzVwcP
	hA5CzoCFRPDLXx4mTsbOrMMRuKmpm5qn3e8i5IY1SO6Agq83wgm7SN6wYQACmETAWRZi
	5en9grKWROox+ei0YBvSKvHNlZLfdwpYZ9RBI/gCMNth6qr4X0bH/YgLU9HAUV2/py36
	Lo50CnqL4DT785autZ0l52VKxXQRsBWiPoXS02fVFO6BPJnXR4Mvwn5itIsaCnIQQY6s
	K7sxZq6bmHdfsFNS+EdtpzVlrZhdXjPPPAMCzYyipbKOLFFZvBsJGJ6E1/WO3aokzy+Q
	i9zg==
X-Gm-Message-State: ANhLgQ2dT+yqYdzMpXgAgbe+yL/r11kPEaeREXzFuGtA8Mhp9tjMm8fF
	T5qwUE1KKxOWMLdBfMCsMKolFF18nd1wsLcD8cs=
X-Google-Smtp-Source: ADFU+vtlLKGMD3eXD2MWq3NgeB7XXFQKylt8eCgKFihFtITc6E+SGZ0d9WQpK2lK5ntBAXa/bYKc2wHftkFHNejEW6M=
X-Received: by 2002:a05:620a:22b:: with SMTP id
	u11mr19324678qkm.225.1584217998527; 
	Sat, 14 Mar 2020 13:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200314160706.2796013-1-raj.khem@gmail.com>
	<247f037c-10bd-0eac-68d9-09155b51c81f@gmail.com>
In-Reply-To: <247f037c-10bd-0eac-68d9-09155b51c81f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Mar 2020 13:33:07 -0700
Message-ID: <CAMKF1sr5hrRpy1D3AnRyOvTuhsNBPFhPEb_6hkttwVM8yQoeTw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bison: Update to 3.5.3
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
X-List-Received-Date: Sat, 14 Mar 2020 20:33:18 -0000
Content-Type: multipart/alternative; boundary="0000000000000c924605a0d67fbb"

--0000000000000c924605a0d67fbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2020 at 11:27 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 3/14/20 9:07 AM, Khem Raj wrote:
> > bugfix release [1]
> >
> > [1]
> https://lists.gnu.org/archive/html/bison-announce/2020-03/msg00000.html
>
> does this fix the issue you reported on IRC?


No sadly it does not I am still trying to see what can fix it it=E2=80=99s =
a race
that is very consistent on first build from scratch but a rebuild fixes it

>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-devtools/bison/{bison_3.5.2.bb =3D> bison_3.5.3.bb} | 4 +-=
--
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >  rename meta/recipes-devtools/bison/{bison_3.5.2.bb =3D> bison_3.5.3.bb=
}
> (90%)
> >
> > diff --git a/meta/recipes-devtools/bison/bison_3.5.2.bb
> b/meta/recipes-devtools/bison/bison_3.5.3.bb
> > similarity index 90%
> > rename from meta/recipes-devtools/bison/bison_3.5.2.bb
> > rename to meta/recipes-devtools/bison/bison_3.5.3.bb
> > index b5b4a8ef76..09e4b18f9e 100644
> > --- a/meta/recipes-devtools/bison/bison_3.5.2.bb
> > +++ b/meta/recipes-devtools/bison/bison_3.5.3.bb
> > @@ -13,13 +13,11 @@ SRC_URI =3D "${GNU_MIRROR}/bison/bison-${PV}.tar.xz=
 \
> >             file://dont-depend-on-help2man.patch.patch \
> >             file://add-with-bisonlocaledir.patch \
> >  "
> > +SRC_URI[sha256sum] =3D
> "2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97e59c713e3906e5fdd982a7c4"
> no md5sum ?
>
> - armin
> >
> >  # No point in hardcoding path to m4, just use PATH
> >  EXTRA_OECONF +=3D "M4=3Dm4"
> >
> > -SRC_URI[md5sum] =3D "49fc2cf23e31e697d5072835e1662a97"
> > -SRC_URI[sha256sum] =3D
> "24e273db9eb6da8bbb6f0648284d0724a5cbd6268a163db402f961350a4e50dd"
> > -
> >  inherit autotools gettext texinfo
> >
> >  # The automatic m4 path detection gets confused, so force the right
> value
>
>

--0000000000000c924605a0d67fbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Mar 14, 2020 at 11:27 AM akuster808 &lt;<a href=3D"=
mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
<br>
On 3/14/20 9:07 AM, Khem Raj wrote:<br>
&gt; bugfix release [1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://lists.gnu.org/archive/html/bison-announce/2020-=
03/msg00000.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.or=
g/archive/html/bison-announce/2020-03/msg00000.html</a><br>
<br>
does this fix the issue you reported on IRC?</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">No sadly it does not I am still trying to see w=
hat can fix it it=E2=80=99s a race that is very consistent on first build f=
rom scratch but a rebuild fixes it=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-devtools/bison/{<a href=3D"http://bison_3.5.2.bb" re=
l=3D"noreferrer" target=3D"_blank">bison_3.5.2.bb</a> =3D&gt; <a href=3D"ht=
tp://bison_3.5.3.bb" rel=3D"noreferrer" target=3D"_blank">bison_3.5.3.bb</a=
>} | 4 +---<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/bison/{<a href=3D"http://bison_3.5.=
2.bb" rel=3D"noreferrer" target=3D"_blank">bison_3.5.2.bb</a> =3D&gt; <a hr=
ef=3D"http://bison_3.5.3.bb" rel=3D"noreferrer" target=3D"_blank">bison_3.5=
.3.bb</a>} (90%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.2=
.bb" rel=3D"noreferrer" target=3D"_blank">bison_3.5.2.bb</a> b/meta/recipes=
-devtools/bison/<a href=3D"http://bison_3.5.3.bb" rel=3D"noreferrer" target=
=3D"_blank">bison_3.5.3.bb</a><br>
&gt; similarity index 90%<br>
&gt; rename from meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.2.=
bb" rel=3D"noreferrer" target=3D"_blank">bison_3.5.2.bb</a><br>
&gt; rename to meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.3.bb=
" rel=3D"noreferrer" target=3D"_blank">bison_3.5.3.bb</a><br>
&gt; index b5b4a8ef76..09e4b18f9e 100644<br>
&gt; --- a/meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.2.bb" re=
l=3D"noreferrer" target=3D"_blank">bison_3.5.2.bb</a><br>
&gt; +++ b/meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.3.bb" re=
l=3D"noreferrer" target=3D"_blank">bison_3.5.3.bb</a><br>
&gt; @@ -13,13 +13,11 @@ SRC_URI =3D &quot;${GNU_MIRROR}/bison/bison-${PV}.=
tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dont-depend-on-h=
elp2man.patch.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-with-bisonlo=
caledir.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97=
e59c713e3906e5fdd982a7c4&quot;<br>
no md5sum ?<br>
<br>
- armin<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # No point in hardcoding path to m4, just use PATH<br>
&gt;=C2=A0 EXTRA_OECONF +=3D &quot;M4=3Dm4&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[md5sum] =3D &quot;49fc2cf23e31e697d5072835e1662a97&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;24e273db9eb6da8bbb6f0648284d0724a5cbd626=
8a163db402f961350a4e50dd&quot;<br>
&gt; -<br>
&gt;=C2=A0 inherit autotools gettext texinfo<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # The automatic m4 path detection gets confused, so force the ri=
ght value<br>
<br>
</blockquote></div></div>

--0000000000000c924605a0d67fbb--
