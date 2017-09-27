Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4F78571CA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 22:15:00 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u18so10529722pgo.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 15:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tS+Zey26kHPxnCTW/i9AWN6P4hpjJF7r8kghRl8VH44=;
	b=h1Uu1Erb6TLHomEgyaSnAY1N9RPGZKHSoz1M8Eu39Zx68GzK3hICO5Z2/mez8bwGVR
	Lvd8vL8gPtlOMPaCOqbdb6dPMf3m6DZUwCN9dIEvkhaB4Tcmerfx/l4xORt8gQJe54g0
	g/+OZOntsdHicxAciiF9KyPI9OkSMuUw6fgwILwFv2TEqNZZz17kWBA1CBZ7ck/z42R0
	Les7N8e+gZSl6/jyn3e8EZ7IEBmcQGcKcqTvLdakoREkbGb/5HP5eTgM+02lf3yn+dFX
	Ec+KMbZU+LQZ3Slj3LzwOpLtIEXCESsU8WpaODQq+Szom0dKPBqZbaqftQBObIb4+Lz3
	YBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tS+Zey26kHPxnCTW/i9AWN6P4hpjJF7r8kghRl8VH44=;
	b=Y0GbxMFcknBbDJcSzvTOdZDh+ddUhqk3ljxfuPITsIAYdZO4gph7dRJhueJi6yJKuY
	ooubsJpbgiNL+98NfbGyJPYBG3fzjWKS13znHQhBydr/7HvQQc8+EkyDGYp/XoiTaOHQ
	2OThLzlC+MUb3FVrO3hrZl9KaL6ng2kTFZNU+BKC3dTf/ZuOPB7T6pxPNVpEt43fFTkb
	AOAC0eomYE0V80UVCavxxVoLthHAh3ChQJqFH2VceKK3+2E91q4A0tIKKSlt8rSNEZo6
	sJY8MHI0lQUks66Njnis2ncUpfPI/y59duTghcy2KktExcvtrUa8zjEiUp89qZ2QqF0d
	WsTQ==
X-Gm-Message-State: AHPjjUgpmLLsFbTBTeScWtaxPZIfA35oBXTSSHd6vBFkRi5DvTAOGa5P
	aXjJ08HRhjggJF5lXZdNddwGtL/XXhwGO8wLNNM=
X-Google-Smtp-Source: AOwi7QC71lxDAv83GunzuFFfwSjOr57q6DPItHf3BsPFaencLFXjQMVeNBwPnRmf8Qe7t/2EWiT9rl4419wP6ZtGURc=
X-Received: by 10.98.156.152 with SMTP id u24mr2432182pfk.255.1506550502316;
	Wed, 27 Sep 2017 15:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
	<CAMKF1srXi9mNZejjSK2+1irS4neRHbK+BQyka-czvjPLsc8E2Q@mail.gmail.com>
	<20170927215300.GD3112@bill-the-cat>
In-Reply-To: <20170927215300.GD3112@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2017 22:14:51 +0000
Message-ID: <CAMKF1soatZ5fjbaD6fWmXN7nyw+Hz1T0QJDj176_W6Vrx5LoXw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Wed, 27 Sep 2017 22:15:01 -0000
Content-Type: multipart/alternative; boundary="94eb2c0a4a7e86e161055a331f5f"

--94eb2c0a4a7e86e161055a331f5f
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 27, 2017 at 2:52 PM Tom Rini <trini@konsulko.com> wrote:

> On Wed, Sep 27, 2017 at 02:01:43PM -0700, Khem Raj wrote:
> > On Wed, Sep 27, 2017 at 10:00 AM, Tom Rini <trini@konsulko.com> wrote:
> > > With RSS we need to ensure that when making a bmap image that the
> > > python3 that we created is found via /usr/bin/env rather than the host
> > > python3.  Otherwise we're relying on the build host to have bmaptool
> > > support installed.


Who is staging python3 native here may be that's where it could be added

>
> > >
> > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > ---
> > > I played around with a few ways to try and fix this problem, and this
> > > was the best I could come up with.  Once this is in we need this in
> pyro
> > > as well as it's broken there too.
> > > ---
> > >  meta/classes/image_types.bbclass | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> > > index 61dca626311e..3ff960e3a889 100644
> > > --- a/meta/classes/image_types.bbclass
> > > +++ b/meta/classes/image_types.bbclass
> > > @@ -311,3 +311,6 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
> > >  # The IMAGE_TYPES_MASKED variable will be used to mask out from the
> IMAGE_FSTYPES,
> > >  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2,
> hdddirect, hddimg, iso, etc.
> > >  IMAGE_TYPES_MASKED ?= ""
> > > +
> > > +# bmap requires python3 to be in the PATH
> > > +EXTRANATIVEPATH += "${@'python3-native' if
> d.getVar('IMAGE_FSTYPES').find('bmap') else ''}"
> > > --
> >
> > I think somewhere inherit python3native should fix it.
>
> Yes, image_types.bbclass could also inherit python3native but that
> seemed heavy-handed.  There's not some other place that should be doing
> it as the problem is saying we want to call bmaptool, and that's handled
> here.
>
> --
> Tom
>

--94eb2c0a4a7e86e161055a331f5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Sep 27, 2017 =
at 2:52 PM Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com">trini@konsulk=
o.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Sep 27=
, 2017 at 02:01:43PM -0700, Khem Raj wrote:<br>
&gt; On Wed, Sep 27, 2017 at 10:00 AM, Tom Rini &lt;<a href=3D"mailto:trini=
@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt; &gt; With RSS we need to ensure that when making a bmap image that the=
<br>
&gt; &gt; python3 that we created is found via /usr/bin/env rather than the=
 host<br>
&gt; &gt; python3.=C2=A0 Otherwise we&#39;re relying on the build host to h=
ave bmaptool<br>
&gt; &gt; support installed.</blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Who is staging python3 native here may be that&#39;s where it c=
ould be added=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com"=
 target=3D"_blank">trini@konsulko.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; I played around with a few ways to try and fix this problem, and =
this<br>
&gt; &gt; was the best I could come up with.=C2=A0 Once this is in we need =
this in pyro<br>
&gt; &gt; as well as it&#39;s broken there too.<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes/image_types.bbclass | 3 +++<br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/image_types.bbclass b/meta/classes/imag=
e_types.bbclass<br>
&gt; &gt; index 61dca626311e..3ff960e3a889 100644<br>
&gt; &gt; --- a/meta/classes/image_types.bbclass<br>
&gt; &gt; +++ b/meta/classes/image_types.bbclass<br>
&gt; &gt; @@ -311,3 +311,6 @@ DEPLOYABLE_IMAGE_TYPES ?=3D &quot;hddimg iso&=
quot;<br>
&gt; &gt;=C2=A0 # The IMAGE_TYPES_MASKED variable will be used to mask out =
from the IMAGE_FSTYPES,<br>
&gt; &gt;=C2=A0 # images that will not be built at do_rootfs time: vmdk, vd=
i, qcow2, hdddirect, hddimg, iso, etc.<br>
&gt; &gt;=C2=A0 IMAGE_TYPES_MASKED ?=3D &quot;&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# bmap requires python3 to be in the PATH<br>
&gt; &gt; +EXTRANATIVEPATH +=3D &quot;${@&#39;python3-native&#39; if d.getV=
ar(&#39;IMAGE_FSTYPES&#39;).find(&#39;bmap&#39;) else &#39;&#39;}&quot;<br>
&gt; &gt; --<br>
&gt;<br>
&gt; I think somewhere inherit python3native should fix it.<br>
<br>
Yes, image_types.bbclass could also inherit python3native but that<br>
seemed heavy-handed.=C2=A0 There&#39;s not some other place that should be =
doing<br>
it as the problem is saying we want to call bmaptool, and that&#39;s handle=
d<br>
here.<br>
<br>
--<br>
Tom<br>
</blockquote></div></div>

--94eb2c0a4a7e86e161055a331f5f--
