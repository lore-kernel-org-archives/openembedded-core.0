Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1879478923
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:53:42 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id w3so6137957uae.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QEJt28Oi3JtgN48JMl0f8W0x0RYocIeJNxbvJ0ueJFU=;
	b=o/26kW5MbLF6oHjil95so7RVSxMitlIrJcdEgTZYHNWR/O3P1F+h8wD6AnkMDQN/BE
	VxSofVk6fj/02r5UlLq7i6l24f+ZwyZSKmHykY5MhE7Rb0BGug19N9rBsJyVuMEr+eKR
	jxhtqZbLtCyVolUImnRsOkhxdxNRJzyJVxlXNdLjRQdvUvBpaxzTZAfKV/YTosk0Hl/H
	Ri2DPrpy4ePyyE93sOw+dr64gFWJcLcyoImxTQXq3e5dzWgPtx59OnsPjSJen56gM2gn
	/RNFzoklHhyptvKW50YfXxuqU12s2xWOsCwRjXL3aoJlv97mYXNfh9FuSzM1dzAhO51H
	ZQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QEJt28Oi3JtgN48JMl0f8W0x0RYocIeJNxbvJ0ueJFU=;
	b=PzBCL7mEmvix3ufjUkylZc2td2Hbh7OC4d6WWr6FKeiP9n/JFMnyxmLlkya1L4a85Q
	dRC7oBl0kRucyfQCtI6V0wN6VYEeXrqvCKuolbKLQJpB/OP/9XnblsOlVx9+bZeX0iMX
	Kej/cKQTJBCWguL+zyEew0LDEtB8Pt7qzR/yZH9gb1LEEunDUHDKRp1mEkz2zl1V7j1+
	1j48dbd087oUVPlMzMxXHUcyeNfnXYyCHUWhAinCjuLkWlW3u7VH82MWmGYt3j96aKKZ
	V0VB5TwkcD4k+efwgi9QaWMZzpMEVC4hRG71kIfEADrTh2c+JeOdlNdA5qRgZYbZoaJW
	517g==
X-Gm-Message-State: AElRT7Fl5HDxJ1orEZroBvcyDu21+fqlkBFMmIfaOLXnTYLcRIyFrQJR
	H6nxokXqALRAWSbaEJ0R6SbxfXFmcBlKkhCUQE8=
X-Google-Smtp-Source: AG47ELuJSgUht/qowbTlbc9hVwFTxCM2cU6eEqmemDapqZk3xZkui87dja0U+xR/s6ft71EpIbumdZr/fpuVqxUlbuc=
X-Received: by 10.176.78.212 with SMTP id x20mr17201571uah.194.1521741223932; 
	Thu, 22 Mar 2018 10:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzF+sVEzWbTfuYdKkVHv+ktcUU7Lxdv_2C_ArEBbDiSUsw@mail.gmail.com>
	<CAMKF1sr+NAJEDVProHEExtHZk96Zygbiwq7+5V0wTO6KRB8pMw@mail.gmail.com>
In-Reply-To: <CAMKF1sr+NAJEDVProHEExtHZk96Zygbiwq7+5V0wTO6KRB8pMw@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 22 Mar 2018 17:53:33 +0000
Message-ID: <CAPGMVzEJq6rdUemqXvDewvBDBSn1Gg7=j-=EdveosFiWgHJPrQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: package inclusion and networking
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
X-List-Received-Date: Thu, 22 Mar 2018 17:53:43 -0000
Content-Type: multipart/alternative; boundary="f403045ee48417cb20056803fd57"

--f403045ee48417cb20056803fd57
Content-Type: text/plain; charset="UTF-8"

Thanks, I'll check it out.

Can you help me setup WiFi connection to poky?
Im highly struggling with this, I have placed connman in local.conf file ,
what next is the procedure such that my poky on qemu can detect the WiFi?
Thanks

On Thu, 22 Mar 2018, 14:43 Khem Raj, <raj.khem@gmail.com> wrote:

> On Wed, Mar 21, 2018 at 9:58 PM, Rajath C S <rajathcs.1996@gmail.com>
> wrote:
> > Can i install tensorflow and h5py (since they are not there as recipes)
> > using Internet on yocto? (just the way they are installed on ubuntu or
> other
> > host OS)
> >
>
> may be you can use on device SDK and build it natively on
> your target
>
> EXTRA_IMAGE_FEATURES_append = " tools-sdk"
> IMAGE_INSTALL_append = " python coreutils findutils git zlib tar"
>
> then checkout the sources on target and build it. You might need more
> packages then keep adding them to IMAGE_INSTALL and rebuilding image
>

--f403045ee48417cb20056803fd57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, I&#39;ll check it out.=C2=A0<div dir=3D"auto"><br=
></div><div dir=3D"auto"><span style=3D"font-family:sans-serif;font-size:12=
.8px">Can you help me setup WiFi connection to poky?=C2=A0</span><div dir=
=3D"auto" style=3D"font-family:sans-serif;font-size:12.8px">Im highly strug=
gling with this, I have placed connman in local.conf file , what next is th=
e procedure such that my poky on qemu can detect the WiFi?</div><div dir=3D=
"auto" style=3D"font-family:sans-serif;font-size:12.8px">Thanks</div></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 22 Mar 2018, =
14:43 Khem Raj, &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Mar 21, 20=
18 at 9:58 PM, Rajath C S &lt;<a href=3D"mailto:rajathcs.1996@gmail.com" ta=
rget=3D"_blank" rel=3D"noreferrer">rajathcs.1996@gmail.com</a>&gt; wrote:<b=
r>
&gt; Can i install tensorflow and h5py (since they are not there as recipes=
)<br>
&gt; using Internet on yocto? (just the way they are installed on ubuntu or=
 other<br>
&gt; host OS)<br>
&gt;<br>
<br>
may be you can use on device SDK and build it natively on<br>
your target<br>
<br>
EXTRA_IMAGE_FEATURES_append =3D &quot; tools-sdk&quot;<br>
IMAGE_INSTALL_append =3D &quot; python coreutils findutils git zlib tar&quo=
t;<br>
<br>
then checkout the sources on target and build it. You might need more<br>
packages then keep adding them to IMAGE_INSTALL and rebuilding image<br>
</blockquote></div>

--f403045ee48417cb20056803fd57--
