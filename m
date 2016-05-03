Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 57B447317D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 15:19:33 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id v145so29752290oie.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=vR67XMepaVfdnmUr0MdUwKg7E0nhoZYw/KMC4kWui8g=;
	b=M4NZnC4mwU6GSmXXM2G5s90CbUvSmGP0LsnBXg6pE7qsXx9NlHcorStr4hRm/GBqD7
	/3I2d68MeYDUjbjWoJeeR1KDKBYcOCqmdiRVYUJBBwTTXPWk+AF8aBPWpvsdp5so4P9f
	veuYmjHzvpm6B/+Sj9Bzuq7CbCcfafzFOO87NravMzfUqzpKeW2QT84NTmpYZCLDGJUI
	XDwsxRZNyXDOz/E0EUXt/2vzFbkRAE+ozanUFLwqDzZZoVT1jy9O48tVnVdoM9gpPnGB
	0VlJwhVgCcG+8J8bSgcRyRrKcSkQVUqzS559/kynCeVxKdyN/om7GxRhf6pGOlJCsDTn
	mCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=vR67XMepaVfdnmUr0MdUwKg7E0nhoZYw/KMC4kWui8g=;
	b=m0ReiCOTSOU7zuTJG/piQjjIxZrPYs3f8+5Ek8qatf30Il0FECrnNlACLp69tgmXK4
	o6AeGV/CYT+9B4jNm9ZhJb0SoKcKkRMmsSPsKTy/wBMw3IqWwZ8XjVquq4oP6Y9BTp81
	hcgxwEDx6zx9PEGBdbRGwWXC7JooP/9Oe7L+p2Ju9RBTFtlIPOkBnm2eeKK6vJnMnmYZ
	aSulNP7/jiJb5QpI1HRUllQ9Lnl3KXSPImX3Vn4ci1eFd0oTfpzP3OEAQts20L7WBAf9
	6FKzbCIxLYnLHIa1tLBYzuF262ttyg/aCwmes69VavrttTRX1dRn62rUmY7oT+2qeTRn
	QtrA==
X-Gm-Message-State: AOPr4FW8v/dM1A9dWs3Zbb35aQx9lxHt4Z/rufuyI3pLpF7vf86tI5cjXSpC6Rj+YRA8V5mbVFqlUxh2v/bjlA==
MIME-Version: 1.0
X-Received: by 10.202.170.65 with SMTP id t62mr1557758oie.60.1462288773739;
	Tue, 03 May 2016 08:19:33 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Tue, 3 May 2016 08:19:33 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1605031052360.22513@localhost.localdomain>
References: <alpine.LFD.2.20.1605030649490.20066@localhost.localdomain>
	<CADkTA4OwEaX6pCpuuiXxuMqY_++NLS+W6pnH0siNvXD0SwhWOg@mail.gmail.com>
	<alpine.LFD.2.20.1605030912110.17898@localhost.localdomain>
	<CADkTA4N+LvCos+qNDuANxEisezP3kZ9_DgtPTF4gNGhaKcoHXQ@mail.gmail.com>
	<alpine.LFD.2.20.1605031052360.22513@localhost.localdomain>
Date: Tue, 3 May 2016 11:19:33 -0400
Message-ID: <CADkTA4O8t8-Q2HKz2zM2OwQvWjVXqj-tzBdLADuYk+eZ5GXdnQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how can i tell which default kernel config OE started with?
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
X-List-Received-Date: Tue, 03 May 2016 15:19:33 -0000
Content-Type: multipart/alternative; boundary=001a113c352ceb05a40531f1a21b

--001a113c352ceb05a40531f1a21b
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 11:13 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Tue, 3 May 2016, Bruce Ashfield wrote:
>
> > If you are not supplying a defconfig, and are inheriting the
> > standard kernel options, then yes, you'd be getting those fragments
> > as well.
>
>   ah, this actually leads me into my next question -- what is magic
> about a "defconfig" file that changes the normal processing?\
>

It's the existing kernel.bbclass mechanism, and a well known convention
used in the kernel. So it is used to trigger the core kernel configuration,
and when I was extending things for kernel fragments it was similarly used
as a sentinel value.


>
>   in the YP kernel dev manual, section 2.2.3, one reads:
>
> "If you have a complete, working Linux kernel .config file you want to
> use for the configuration, as before, copy that file to the
> appropriate ${PN} directory in your layer's recipes-kernel/linux
> directory, and rename the copied file to "defconfig". Then, add the
> following lines to the linux-yocto .bbappend file in your layer:
>
>      FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>      SRC_URI += "file://defconfig"
>
> so the idea here is that a "defconfig" file is, in some sense, a
> "complete, working" config file that requires no extra processing, is
> that correct? does that mean that if you explicitly use a SRC_URI
> "defconfig" reference, all that extra normal processing won't be done?
>

Nope. Everything is still processed, the kernel version you are using,
patches, etc, all make a difference to what ends up in the .config. The
phrasing there is to point out that it is what the mainline kernel considers
a defconfig, and it is typically a complete configuration of the kernel
(that
is expected to boot your target).


>
>   also, that same section in the YP manual is slightly confusing -- if
> your SRC_URI refers to a defconfig file *and* some .cfg fragment
> files, is it necessarily true that the defconfig file is consulted
> first (no matter where it shows up in SRC_URI), after which all .cfg
> files are applied on top of that in order? it's not entirely clear
> from the manual if that's what happens.
>

Yep. If you mix the two techniques, the defconfig is first (and taken
as the settings), and then fragments are applied on top.

Note: There are some changes in defconfig that are related to features
I'm doing for the fall 2.2 release, but nothing that changes the basic
processing (so compatibility is maintained).

Bruce


>
>   predictably, a couple more kernel config questions coming ...
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113c352ceb05a40531f1a21b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 3, 2016 at 11:13 AM, Robert P. J. Day <span dir=3D"ltr">&lt=
;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcou=
rse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Tue, 3 May 2016, Bruce Ashfield wrote:<br>
<br>
</span><span class=3D"">&gt; If you are not supplying a defconfig, and are =
inheriting the<br>
&gt; standard kernel options, then yes, you&#39;d be getting those fragment=
s<br>
&gt; as well.<br>
<br>
</span>=C2=A0 ah, this actually leads me into my next question -- what is m=
agic<br>
about a &quot;defconfig&quot; file that changes the normal processing?\<br>=
</blockquote><div><br></div><div>It&#39;s the existing kernel.bbclass mecha=
nism, and a well known convention</div><div>used in the kernel. So it is us=
ed to trigger the core kernel configuration,</div><div>and when I was exten=
ding things for kernel fragments it was similarly used</div><div>as a senti=
nel value.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 in the YP kernel dev manual, section 2.2.3, one reads:<br>
<br>
&quot;If you have a complete, working Linux kernel .config file you want to=
<br>
use for the configuration, as before, copy that file to the<br>
appropriate ${PN} directory in your layer&#39;s recipes-kernel/linux<br>
directory, and rename the copied file to &quot;defconfig&quot;. Then, add t=
he<br>
following lines to the linux-yocto .bbappend file in your layer:<br>
<br>
=C2=A0 =C2=A0 =C2=A0FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0SRC_URI +=3D &quot;file://defconfig&quot;<br>
<br>
so the idea here is that a &quot;defconfig&quot; file is, in some sense, a<=
br>
&quot;complete, working&quot; config file that requires no extra processing=
, is<br>
that correct? does that mean that if you explicitly use a SRC_URI<br>
&quot;defconfig&quot; reference, all that extra normal processing won&#39;t=
 be done?<br></blockquote><div><br></div><div>Nope. Everything is still pro=
cessed, the kernel version you are using,</div><div>patches, etc, all make =
a difference to what ends up in the .config. The</div><div>phrasing there i=
s to point out that it is what the mainline kernel considers</div><div>a de=
fconfig, and it is typically a complete configuration of the kernel (that</=
div><div>is expected to boot your target).</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
=C2=A0 also, that same section in the YP manual is slightly confusing -- if=
<br>
your SRC_URI refers to a defconfig file *and* some .cfg fragment<br>
files, is it necessarily true that the defconfig file is consulted<br>
first (no matter where it shows up in SRC_URI), after which all .cfg<br>
files are applied on top of that in order? it&#39;s not entirely clear<br>
from the manual if that&#39;s what happens.<br></blockquote><div><br></div>=
<div>Yep. If you mix the two techniques, the defconfig is first (and taken<=
/div><div>as the settings), and then fragments are applied on top.</div><di=
v><br></div><div>Note: There are some changes in defconfig that are related=
 to features</div><div>I&#39;m doing for the fall 2.2 release, but nothing =
that changes the basic=C2=A0</div><div>processing (so compatibility is main=
tained).=C2=A0</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
=C2=A0 predictably, a couple more kernel config questions coming ...<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferrer" target=3D"_=
blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113c352ceb05a40531f1a21b--
