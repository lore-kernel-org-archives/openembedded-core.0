Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5ECAB72F45
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 22:49:15 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id k139so3669091qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 15:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DyL5TurKesc+S+zyYcspZmzUL+Yhn/G6o57cLONjT/0=;
	b=IjOmITRqU/ejbPlVlsCTj82af3uteDuZHUAONcbzxFMIumI8o9li+NQMWMBMen/4fs
	PiCudt63ZcNK/97h9eYHj73zCgAZBFUqHrM+uQRhXhXFXIYcEFCt9aHM9HAE03W7D5fU
	twFPaSK2nR9wSSY1sZni/4s9lgR8zIs+U9ar0NGSLsYaFNZyCWgGNQdEvEBX3ZrN/CkJ
	RJxsDqlMDj7n04EP0SJcMO+eMEDA7GtnRou2M/q+/23rjt8IZV8nYQ14QifqXgiw/4DB
	q5fHHrlRcTgUdZbKAFQ2NgquG4zRCKkNKUvMpFpUjMQw1cbeinr2Q+M8mYgzbnCGxHI1
	DAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DyL5TurKesc+S+zyYcspZmzUL+Yhn/G6o57cLONjT/0=;
	b=XHd+3zMURt6yo4my+KCAOuYUFbl4qneybiwFKI0RJ+su1P4cnp2YeaMJnXyQoc5l1P
	L35CorQ5jUc/OUUQey+Z5IXVvePIhY8klZNyVOgHeQc2udrNf+21ZsyiuXJiW6SrqLjo
	QInYIN8Qx7hbu1UcX0YrZmAtmoaUfo8n48Y5kG+DbweY+CMcq60FUOqtB+Tkm6EHu7Yk
	3ZB8Oq8jgWgNg0XQZMrAU1ZwxeNY8xx0IrS87fs0p6YRCn82T+V3y1hLf2Dsixv2leuc
	E2v8d17UL/J+xYR3yE0RAk6YZBOi2FzLW9u9GwefJNbgKtdow/wfscp/VA+93P8qA4I3
	lJ0w==
X-Gm-Message-State: AN3rC/6U0UOM23MB9fbV5j7RGsPsng9RtpchO/8piwoZPmSFrxoq/lYOrhWZAb81SPPTWEXLtABG69xAGBOZ4Q==
X-Received: by 10.55.217.26 with SMTP id u26mr4454698qki.287.1491432557153;
	Wed, 05 Apr 2017 15:49:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Wed, 5 Apr 2017 15:49:16 -0700 (PDT)
In-Reply-To: <1491432072.17200.26.camel@linuxfoundation.org>
References: <1491395972-25386-1-git-send-email-bruce.ashfield@windriver.com>
	<1491398474.17200.13.camel@linuxfoundation.org>
	<CADkTA4M3=Tk7J51LHieVsrkwR38wrYWXvMiC-QiFa5aT+xa+Ag@mail.gmail.com>
	<1491432072.17200.26.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Apr 2017 00:49:16 +0200
Message-ID: <CADkTA4M_BYjFQvZg5AkhzMtQ26Wwg7NY0416iqLvQv1NSywzgg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu arm/x86: drop linux-yocto preferred version
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
X-List-Received-Date: Wed, 05 Apr 2017 22:49:16 -0000
Content-Type: multipart/alternative; boundary=001a1149a5f0c696a1054c733383

--001a1149a5f0c696a1054c733383
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 6, 2017 at 12:41 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2017-04-06 at 00:33 +0200, Bruce Ashfield wrote:
> > On Wed, Apr 5, 2017 at 3:21 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > > @@ -16,5 +16,4 @@ QB_MACHINE = "-machine versatilepb"
> > > >  QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
> > > >  # Add the 'virtio-rng-pci' device otherwise the guest may run
> > > out of entropy
> > > >  QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device
> > > virtio-rng-pci"
> > > > -PREFERRED_VERSION_linux-yocto ??= "4.8%"
> > > >  QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux
> > > -yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> > >
> > > Note the line below the line you're removing here. This is why we
> > > need
> > > this one...
> > I had noticed that, but since the newest version is well above that,
> > I figured it would be ok.
>
> An unset variable returns "None", not sure
> what base_version_less_or_equal makes of that...
>
> > I can spin another patch that leaves it in place for ARM, but drops
> > it for x86.
>
> I took Martin's patch moving things to 4.10, quite happy to take a
> second one removing the x86 version. Removing the arm one too would be
> nice but I'm not sure we can yet.
>

Sounds good. I'll rebase onto those changes and follow up.

Bruce


>
> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1149a5f0c696a1054c733383
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 6, 2017 at 12:41 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Thu, 2017-04-06 at 00:33 +0200, Bruce Ash=
field wrote:<br>
&gt; On Wed, Apr 5, 2017 at 3:21 PM, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@<wbr>linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;=C2=A0<br>
</span><span class=3D"">&gt; &gt; &gt; @@ -16,5 +16,4 @@ QB_MACHINE =3D &qu=
ot;-machine versatilepb&quot;<br>
&gt; &gt; &gt; =C2=A0QB_KERNEL_CMDLINE_APPEND =3D &quot;console=3DttyAMA0,1=
15200 console=3Dtty&quot;<br>
&gt; &gt; &gt; =C2=A0# Add the &#39;virtio-rng-pci&#39; device otherwise th=
e guest may run<br>
&gt; &gt; out of entropy<br>
&gt; &gt; &gt; =C2=A0QB_OPT_APPEND =3D &quot;-show-cursor -usb -usbdevice t=
ablet -device<br>
&gt; &gt; virtio-rng-pci&quot;<br>
&gt; &gt; &gt; -PREFERRED_VERSION_linux-yocto ??=3D &quot;4.8%&quot;<br>
&gt; &gt; &gt; =C2=A0QB_DTB =3D &quot;${@base_version_less_or_<wbr>equal(&#=
39;PREFERRED_VERSION_linux<br>
&gt; &gt; -yocto&#39;, &#39;4.7&#39;, &#39;&#39;, &#39;zImage-versatile-pb.=
dtb&#39;, d)}&quot;<br>
&gt; &gt;<br>
&gt; &gt; Note the line below the line you&#39;re removing here. This is wh=
y we =C2=A0<br>
&gt; &gt; need<br>
&gt; &gt; this one...<br>
&gt; I had noticed that, but since the newest version is well above that,<b=
r>
&gt; I figured it would be ok.<br>
<br>
</span>An unset variable returns &quot;None&quot;, not sure<br>
what=C2=A0base_version_less_or_<wbr>equal makes of that...<br>
<span class=3D""><br>
&gt; I can spin another patch that leaves it in place for ARM, but drops<br=
>
&gt; it for x86.<br>
<br>
</span>I took Martin&#39;s patch moving things to 4.10, quite happy to take=
 a<br>
second one removing the x86 version. Removing the arm one too would be<br>
nice but I&#39;m not sure we can yet.<br></blockquote><div><br></div><div>S=
ounds good. I&#39;ll rebase onto those changes and follow up.</div><div><br=
></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a1149a5f0c696a1054c733383--
