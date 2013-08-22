Return-Path: <raj.khem@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id D15926B3F6
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 21:44:44 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id l20so4695445oag.31
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5CKuCaROZRa6IS0eq8s2OaAvrdMRhmVUvY+YPjyz2O0=;
	b=Pnjdxn71ZXLFtwnfbs62noAAOSzn17iip+s42s4rsAuQP5Uxe2q9YFkHfiuPYVZZmj
	NysqnwarwZAHOxvBWeBljEzDk1AyFiaSIb4SVnGhAyh9n4JTKB2Sm1ceW1ECWzHlDCnj
	hKdC481t/PwoAbv+Is7KWpzDDIg2ozR8uoNK4+J80EevanCpAfRj0cIwKuwKibQk0HoL
	EY/tNdxuBD0T3NwhuG/bo9h1z4P9mSjbWK1hVKVwTgqGIMNOFwF7KhIHhw39OKtgN/h0
	Voz1OIKEigcRn850yPadxspFYKFZjI/aDq+vKhXLblSQWQOHvFs7noYO+v2knseNGv1x
	RpVA==
MIME-Version: 1.0
X-Received: by 10.50.61.179 with SMTP id q19mr6816162igr.33.1377207885036;
	Thu, 22 Aug 2013 14:44:45 -0700 (PDT)
Received: by 10.50.216.195 with HTTP; Thu, 22 Aug 2013 14:44:44 -0700 (PDT)
In-Reply-To: <CAJTo0LZ-NCuuE0hQYpgzx0GXhikAUVzRrVaDFayg-OLnt1o7TA@mail.gmail.com>
References: <739A9EF8-4ABD-419C-978B-29006E185238@gmail.com>
	<CAJTo0LZ-NCuuE0hQYpgzx0GXhikAUVzRrVaDFayg-OLnt1o7TA@mail.gmail.com>
Date: Thu, 22 Aug 2013 14:44:44 -0700
Message-ID: <CAMKF1so-cn+7cjPJZKCkRTYA8xFEEm8PxjcH0EMaak2-jgfEng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: World build on OE-Core
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
X-List-Received-Date: Thu, 22 Aug 2013 21:44:45 -0000
Content-Type: multipart/alternative; boundary=047d7bdc109ec560f504e4903263

--047d7bdc109ec560f504e4903263
Content-Type: text/plain; charset=UTF-8

On Thursday, August 22, 2013, Burton, Ross <ross.burton@intel.com> wrote:
> On 22 August 2013 22:24, Khem Raj <raj.khem@gmail.com> wrote:
>> x86_64
>> ======
>>
>> Summary: 17 tasks failed:
>>
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-lib/
libxft_2.3.1.bb, do_compile
>>
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/cairo/
cairo_1.12.14.bb, do_compile
>>
/builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/gstreamer/
gst-plugins-base_0.10.36.bb, do_compile
> ...
>
> The majority of your failures on x86-64 get autobuilt every night, so
> I'd be curious to see the your logs if you still have them.

I have them once I get to my computer I will share. My build enables
multilib and uses systemd as default so its not default out of box
>
> Ross
>

--047d7bdc109ec560f504e4903263
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, August 22, 2013, Burton, Ross &lt;<a href=3D"mailto:ro=
ss.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>&gt; On 22 Aug=
ust 2013 22:24, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt; wrote:<br>
&gt;&gt; x86_64<br>&gt;&gt; =3D=3D=3D=3D=3D=3D<br>&gt;&gt;<br>&gt;&gt; Summ=
ary: 17 tasks failed:<br>&gt;&gt; =C2=A0 /builds1/angstrom/sources/openembe=
dded-core/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxft_2.3.1.bb"=
>libxft_2.3.1.bb</a>, do_compile<br>
&gt;&gt; =C2=A0 /builds1/angstrom/sources/openembedded-core/meta/recipes-gr=
aphics/cairo/<a href=3D"http://cairo_1.12.14.bb">cairo_1.12.14.bb</a>, do_c=
ompile<br>&gt;&gt; =C2=A0 /builds1/angstrom/sources/openembedded-core/meta/=
recipes-multimedia/gstreamer/<a href=3D"http://gst-plugins-base_0.10.36.bb"=
>gst-plugins-base_0.10.36.bb</a>, do_compile<br>
&gt; ...<br>&gt;<br>&gt; The majority of your failures on x86-64 get autobu=
ilt every night, so<br>&gt; I&#39;d be curious to see the your logs if you =
still have them.<br><br>I have them once I get to my computer I will share.=
 My build enables multilib and uses systemd as default so its not default o=
ut of box<br>
&gt;<br>&gt; Ross<br>&gt;

--047d7bdc109ec560f504e4903263--
