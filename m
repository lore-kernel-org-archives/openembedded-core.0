Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2307FE5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:46:39 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id k188so6713652vsc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jzACIFqGENogNIKvbObXYJ0KCxDyH+XLvUmfDel8zs4=;
	b=be5suTyneRpRxBWw0a0+qLwiaf4bBqque+Yi2IVvWBxcg23WmYOkc9B9HhqP7Q8Z2f
	5tw3HDxrTHYHG8qDdRiyDre2t0+HafklzWW8wtLuwr0jpoZuzhqtxQqpqm5sBBf0wBgw
	dDjipk2rWlEKSJKP4KZkXd7S6N2dI+Hvu3CNRSn/NcMEsC0wpZpVPJ+oRaCx8JWUokUl
	yqNogOjOWXQDiy+MdDFQ6yLefE67isT4MBrwdIulvQyJXGyMsUN2TuNZeMw//61aEpd9
	s4/1i2MbulZ825+vVgBQTZzDkCvDLExuIs2VLfoqSSSczuKo3VApu4U7CPIrGhWApzZs
	Anww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jzACIFqGENogNIKvbObXYJ0KCxDyH+XLvUmfDel8zs4=;
	b=d+mUpJBJB0sDWtgh/z3cmeDAPXOQ2Y7zXeEuEg7ErBP3MGQD9fDPBXdmRQIrKBLJIG
	xRwDs7qoJVS+NAzwIkYBxYNpHuDmFGaqBd4TbVMysL8reIIhKoQc1I4mxWedAWpdwhTm
	EUPTC4psQmXLPLwn3ucTinlGh7WuHEDdcpKl2CMBfqSYENb6NsrBgnTkXeV95sd3kjl6
	hz0mzkVHNV/XOYaIVobMGIx4kJPu4zzhfU0eO16b+zoerE4+7pSSNSKqScVIyaxb5ItN
	YEgux6IagyG80B5hcXKz8GQplc9EkYtIKzUyctr8mA1jiQGTV8rLMNtipCombeswfCdc
	/K6w==
X-Gm-Message-State: APjAAAW1SxW6yJK0VZWVdIqfeaO3NjwI3UJRL8HZdpu1RcuG64eClOtT
	41Q9EAdEfaFI2mh3NZIydzlaCcnTZbwg9OSTSG0=
X-Google-Smtp-Source: APXvYqwQXFkRzkruc70R/v8oeas7Dx9NI0kZ58yjQlpZIDTqTw9S0dBF/z+FGfK0qWmU9Y9l9Wfswx9titeb3GixK3Y=
X-Received: by 2002:a05:6102:2437:: with SMTP id
	l23mr12116960vsi.23.1580161600133; 
	Mon, 27 Jan 2020 13:46:40 -0800 (PST)
MIME-Version: 1.0
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
	<20200127141908.84922-7-alex.kanavin@gmail.com>
	<CAMKF1sooYU9dr5nkmgoW0cPjd3L_QJYtQBUMOpJAABTJ=mqrzA@mail.gmail.com>
	<CANNYZj8Ak0gFwAnupcWJ9eDXP6_hV2hT0u0E4pastRMt+QanZQ@mail.gmail.com>
	<CAMKF1sp39i6szYyZJe7gyhVyU-jJ+ABX2dboZz7DevjN5DZ5Fw@mail.gmail.com>
In-Reply-To: <CAMKF1sp39i6szYyZJe7gyhVyU-jJ+ABX2dboZz7DevjN5DZ5Fw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Jan 2020 22:46:28 +0100
Message-ID: <CANNYZj8d7ByK_Y+=du1GSExD3Zb_kfEyWA=Ljc0fPPxaQfqiVg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] core-image-sato-sdk-ptest: use 2G of RAM
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
X-List-Received-Date: Mon, 27 Jan 2020 21:46:39 -0000
Content-Type: multipart/alternative; boundary="000000000000dd2107059d260ae4"

--000000000000dd2107059d260ae4
Content-Type: text/plain; charset="UTF-8"

This would be over-engineering; I highly doubt anyone would want to run
this in qemu for any other architecture than those two. Without kvm or
other HW accelerated virtualization many of those ptests will simply fail
on timeout, and if not, they'll still be running when the heat death of the
universe occurs.

Alex

On Mon, 27 Jan 2020 at 22:02, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jan 27, 2020 at 12:56 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This is only used on x86_64 and arm64 by the autobuilder, so we should
> be fine.
> >
>
> OK. lets set this for those two architectures for now. The image can
> be built beyond Autobuilders for
> other arches as well. Perhaps this setting is a candidate for auto.conf on
> AB
>
> > Alex
> >
> > On Mon, 27 Jan 2020 at 21:54, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Mon, Jan 27, 2020 at 6:20 AM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > Particularly, 1G wasn't enough for lttng-tools ptests as
> >> > half of that went to /tmp, and lttng-tools needs more.
> >> >
> >> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > ---
> >> >  meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 3 ++-
> >> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> >> > index 7490b773d2e..58c257c49fb 100644
> >> > --- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> >> > +++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> >> > @@ -16,4 +16,5 @@ IMAGE_OVERHEAD_FACTOR = "1.0"
> >> >  IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
> >> >
> >> >  # ptests need more memory than standard to avoid the OOM killer
> >> > -QB_MEM = "-m 1024"
> >> > +# also lttng-tools needs /tmp that has at least 1G
> >> > +QB_MEM = "-m 2048"
> >>
> >> perhaps we need to be cautious here and check if all qemu machines can
> >> support 2G emulation.
> >>
> >> > --
> >> > 2.17.1
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000dd2107059d260ae4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This would be over-engineering; I highly doubt anyone=
 would want to run this in qemu for any other architecture than those two. =
Without kvm or other HW accelerated virtualization many of those ptests wil=
l simply fail on timeout, and if not, they&#39;ll still be running when the=
 heat death of the universe occurs.<br></div><div><br></div><div>Alex<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, 27 Jan 2020 at 22:02, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Mon, Jan 27, 2020 at 12:56 PM Alexander Kana=
vin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This is only used on x86_64 and arm64 by the autobuilder, so we should=
 be fine.<br>
&gt;<br>
<br>
OK. lets set this for those two architectures for now. The image can<br>
be built beyond Autobuilders for<br>
other arches as well. Perhaps this setting is a candidate for auto.conf on =
AB<br>
<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon, 27 Jan 2020 at 21:54, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Jan 27, 2020 at 6:20 AM Alexander Kanavin<br>
&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Particularly, 1G wasn&#39;t enough for lttng-tools ptests as<=
br>
&gt;&gt; &gt; half of that went to /tmp, and lttng-tools needs more.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-sato/images/<a href=3D"http://core-image-s=
ato-sdk-ptest.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sdk-=
ptest.bb</a> | 3 ++-<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-sato/images/<a href=3D"http://core-=
image-sato-sdk-ptest.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sa=
to-sdk-ptest.bb</a> b/meta/recipes-sato/images/<a href=3D"http://core-image=
-sato-sdk-ptest.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sd=
k-ptest.bb</a><br>
&gt;&gt; &gt; index 7490b773d2e..58c257c49fb 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-sato/images/<a href=3D"http://core-image-s=
ato-sdk-ptest.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sdk-=
ptest.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-sato/images/<a href=3D"http://core-image-s=
ato-sdk-ptest.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sdk-=
ptest.bb</a><br>
&gt;&gt; &gt; @@ -16,4 +16,5 @@ IMAGE_OVERHEAD_FACTOR =3D &quot;1.0&quot;<b=
r>
&gt;&gt; &gt;=C2=A0 IMAGE_ROOTFS_EXTRA_SPACE =3D &quot;1124288&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 # ptests need more memory than standard to avoid the OO=
M killer<br>
&gt;&gt; &gt; -QB_MEM =3D &quot;-m 1024&quot;<br>
&gt;&gt; &gt; +# also lttng-tools needs /tmp that has at least 1G<br>
&gt;&gt; &gt; +QB_MEM =3D &quot;-m 2048&quot;<br>
&gt;&gt;<br>
&gt;&gt; perhaps we need to be cautious here and check if all qemu machines=
 can<br>
&gt;&gt; support 2G emulation.<br>
&gt;&gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.17.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000dd2107059d260ae4--
