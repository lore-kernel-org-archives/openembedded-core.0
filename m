Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 92B317C85C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 02:36:45 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id v139so1013241qkb.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 18:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XJUaUqe7Xdbwokpr+pW9mjXK1ft9r5wBSc37nuruMZs=;
	b=WtSqNH3hB0yRwcgSNiGowI0ghbP9KLr+6Hd1xyBM1Cg8KYl9VnIaaZk7zBcG8bwU0t
	e768CWNDZc/bTn92mvJgy68mxy6F4pBlnHNExjfFXcS22NY0S9FjsCCHgeRdZrZ+aFFO
	S8nWkEp5X6gt/ZgnfvhULxief52p8o8OQBTXxwb4r5KDaX+64lXjU2H65DJsHl49UVtB
	yfMdQiQ1NokXFzgxF10MjRp2FJTtGl23pdJS+djqX554rZmMaI+IjzkTpDSDGJtaWTGG
	1XWPU/LomHl4PsyZ/40tPV6XpH3bpOmiZYqANVRizaziy7+I539yJKVkVKGn7BPoELiU
	wM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XJUaUqe7Xdbwokpr+pW9mjXK1ft9r5wBSc37nuruMZs=;
	b=tZwHYikwbP0F6gdGG0EdEF+FI+xnswMmpPy1oh7b+RfqC2O5opLsS9jTIq7se0Dnnp
	FqLx7d1J/JRUJ0jZIWHlXXuCYGY9yPmtM+o+936Py1dnH5EaHS1iex03w3w0Em8umsT0
	o5x1OAoM3eS6ZDXt4rWafLCZOt1oPT5aWCURVRWO52X09v2jtfVWg5+AWPEZPwFpWW13
	E9IWyEI1ZUAdwGpVUqlQCYpC0wmEc3xn0lTfbvJCxGbDe3E7/U7QM2PFan6cg+xld58G
	CgX2weKcMMSeuin0eqaMdQvx+wN51CbOFa2EDmWsK93+Vn+sl9BDkjAJV6DPQTGY95rM
	RBaQ==
X-Gm-Message-State: APjAAAWrInT3dHh//gva9Ky53RuWpCWxB2KSUkJOp3fBpdERrzBSVefp
	WaOAJadZs6oLkdZo59tAyPsKjkyJC4WRsWZqH4U=
X-Google-Smtp-Source: APXvYqw8/FnJ2z+1OMWPLhebAXw3jKjZCnThKvZwvokezkJ9+dzQKjw73PNA+kDjJWWYVm/IATLxzgpa9kB8lgKggBU=
X-Received: by 2002:a37:3d6:: with SMTP id 205mr9150583qkd.223.1551580606120; 
	Sat, 02 Mar 2019 18:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20190303003834.44637-1-raj.khem@gmail.com>
	<96553c6e-dfe3-7074-99a0-f5770c72a4f2@gmail.com>
In-Reply-To: <96553c6e-dfe3-7074-99a0-f5770c72a4f2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Mar 2019 18:36:35 -0800
Message-ID: <CAMKF1sp8XhQ+PfJcMDejw5YL-tUC+4k92+PHftbhHLwbekKZjw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] grub: Enhance Waddress-of-packed-member patch to cover x86_64 testcase
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
X-List-Received-Date: Sun, 03 Mar 2019 02:36:45 -0000
Content-Type: multipart/alternative; boundary="000000000000de478f05832782f0"

--000000000000de478f05832782f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 2, 2019 at 5:57 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 3/2/19 4:38 PM, Khem Raj wrote:
> > This was not compiled last time when testing aarch64
>
> The subject and body have conflicting archs.
> is it both?



That=E2=80=99s just for history since last time I tested it with
Aarch64/Gcc9 and now I got to test x86_64/gcc9
And saw that the patch was not taking care of additional test cases that
were getting built for x86

>
> - armin
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../files/disable-address-of-packed-member.patch    | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git
> a/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch
> b/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch
> > index 4af6a599d5..415f52ebe3 100644
> > --- a/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patc=
h
> > +++ b/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patc=
h
> > @@ -247,3 +247,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> >   static grub_dl_t my_mod;
> >
> > +--- a/grub-core/commands/usbtest.c
> > ++++ b/grub-core/commands/usbtest.c
> > +@@ -63,6 +63,10 @@ static const char *usb_devspeed[] =3D
> > +     "High"
> > +   };
> > +
> > ++#if __GNUC__ >=3D 9
> > ++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
> > ++#endif
> > ++
> > + static grub_usb_err_t
> > + grub_usb_get_string (grub_usb_device_t dev, grub_uint8_t index, int
> langid,
> > +                  char **string)
>
>
>

--000000000000de478f05832782f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Mar 2, 2019 at 5:57 PM akuster808 &lt;<a href=3D"ma=
ilto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
<br>
On 3/2/19 4:38 PM, Khem Raj wrote:<br>
&gt; This was not compiled last time when testing aarch64<br>
<br>
The subject and body have conflicting archs.<br>
is it both?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">That=E2=80=99s just for history since last time I te=
sted it with=C2=A0</div><div dir=3D"auto">Aarch64/Gcc9 and now I got to tes=
t x86_64/gcc9</div><div dir=3D"auto">And saw that the patch was not taking =
care of additional test cases that were getting built for x86</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><br>
- armin<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../files/disable-address-of-packed-member.patch=C2=A0 =C2=A0 | =
13 +++++++++++++<br>
&gt;=C2=A0 1 file changed, 13 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-bsp/grub/files/disable-address-of-packed-mem=
ber.patch b/meta/recipes-bsp/grub/files/disable-address-of-packed-member.pa=
tch<br>
&gt; index 4af6a599d5..415f52ebe3 100644<br>
&gt; --- a/meta/recipes-bsp/grub/files/disable-address-of-packed-member.pat=
ch<br>
&gt; +++ b/meta/recipes-bsp/grub/files/disable-address-of-packed-member.pat=
ch<br>
&gt; @@ -247,3 +247,16 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static grub_dl_t my_mod;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +--- a/grub-core/commands/usbtest.c<br>
&gt; ++++ b/grub-core/commands/usbtest.c<br>
&gt; +@@ -63,6 +63,10 @@ static const char *usb_devspeed[] =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;High&quot;<br>
&gt; +=C2=A0 =C2=A0};<br>
&gt; + <br>
&gt; ++#if __GNUC__ &gt;=3D 9<br>
&gt; ++#pragma GCC diagnostic ignored &quot;-Waddress-of-packed-member&quot=
;<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; + static grub_usb_err_t<br>
&gt; + grub_usb_get_string (grub_usb_device_t dev, grub_uint8_t index, int =
langid,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *=
*string)<br>
<br>
<br>
</blockquote></div></div>

--000000000000de478f05832782f0--
