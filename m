Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6514173125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 22:33:49 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id x35so3517871qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 15:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cw77RdYXxZ7cCQiekCtypleylrtSD45e7p549BKTCGM=;
	b=gsddGQhN23PhqO/nPZnsxweApt43kR8pT5k5sCBAuF2DjqCtihVzGcTIGMY8OoP0D2
	ObhB2s/25dpE0runhoEEz7bVd0NJi0B+KW7tAZO/7eDPlooFGlOS+/a1ZVAHjI3WHhps
	x1Q8Oe7ppFwh/Ez1Bveq7EMwx2kypzVnjjKZHammhMh3psg6p5iYc5jvhSRb8uWB1XL4
	wgcBuMF7ZR+Dy2ZGEKld0Bo0CB86AY5gANIC7BHvxFs1+n+xQhVrjRzVLZz7EOSMEwf+
	9HmUWwiH0Owtke6xWtLkOMI9FT/LkewXAH8qf8dCGmYXFv+D1NjPqh7FGuVCgn9yUDSp
	3ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cw77RdYXxZ7cCQiekCtypleylrtSD45e7p549BKTCGM=;
	b=WWrY3pkfrqSDHiq//rWWKEz9M3Eq6yFIZZgxSiVPj2oNnudpFmh4I4RYpqM6hCiDo8
	PPmKShf8gEM2xrJo3+ZQXxxYRjhfZWYYtTXJrre1t82EVSgMxD73KNATvSCqm53ToJtw
	LppXeQK+Eewlkm2wqZK5sMBSlDPL4TAVnZfmc+T3djjYWm36SwHA9BxEgLdur6amRFXr
	JvKNFUrlLBLmebMMyScP+0U2aOmVylkoCQvQC33YMojEY5UVJJChefnzKNtGB7G+7K6T
	FxprAqoVbCuKH0B397JPp6BSIXnN1NDTuWNHNgdo+AnNLOZSAZ3pc/K1LQrW7oNskLKd
	MDWA==
X-Gm-Message-State: AFeK/H07cnCRo31K27YweQuj53XmqLTLsWZ8q81ceAtKOwSs18IH1w/1OIHKsqcnG24rEJcqxBPQsi0fzso1oQ==
X-Received: by 10.237.48.37 with SMTP id 34mr30986586qte.117.1491431630936;
	Wed, 05 Apr 2017 15:33:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Wed, 5 Apr 2017 15:33:50 -0700 (PDT)
In-Reply-To: <1491398474.17200.13.camel@linuxfoundation.org>
References: <1491395972-25386-1-git-send-email-bruce.ashfield@windriver.com>
	<1491398474.17200.13.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Apr 2017 00:33:50 +0200
Message-ID: <CADkTA4M3=Tk7J51LHieVsrkwR38wrYWXvMiC-QiFa5aT+xa+Ag@mail.gmail.com>
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
X-List-Received-Date: Wed, 05 Apr 2017 22:33:50 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c9bbe919e5e054c72fcbc

--94eb2c0c9bbe919e5e054c72fcbc
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 5, 2017 at 3:21 PM, Richard Purdie <richard.purdie@
linuxfoundation.org> wrote:

> On Wed, 2017-04-05 at 08:39 -0400, Bruce Ashfield wrote:
> > We don't make a linux-yocto version available unless it boots
> > on all qemu targets, hence there is no reason to specify a
> > specific version .. the latest is always fine.
> >
> > Also, the other qemu machines don't have this specification, so
> > this makes x86 and ARM consistent.
> >
> >
> > diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/
> qemuarm.conf
> > index f9d6dd7e364e..b9b640f974f3 100644
> > --- a/meta/conf/machine/qemuarm.conf
> > +++ b/meta/conf/machine/qemuarm.conf
> > @@ -16,5 +16,4 @@ QB_MACHINE = "-machine versatilepb"
> >  QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
> >  # Add the 'virtio-rng-pci' device otherwise the guest may run out of
> entropy
> >  QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device
> virtio-rng-pci"
> > -PREFERRED_VERSION_linux-yocto ??= "4.8%"
> >  QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto',
> '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>
> Note the line below the line you're removing here. This is why we   need
> this one...
>

I had noticed that, but since the newest version is well above that, I
figured it
would be ok.

I can spin another patch that leaves it in place for ARM, but drops it for
x86.

Bruce


>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c0c9bbe919e5e054c72fcbc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Apr 5, 2017 at 3:21 PM, Richard Purdie <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@<wbr>linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><span>On Wed, 2017-04-05 at 08:39 -0400, Bruce Ashfield wro=
te:<br>
&gt; We don&#39;t make a linux-yocto version available unless it boots<br>
&gt; on all qemu targets, hence there is no reason to specify a<br>
&gt; specific version .. the latest is always fine.<br>
&gt;<br>
&gt; Also, the other qemu machines don&#39;t have this specification, so<br=
>
&gt; this makes x86 and ARM consistent.<br>
&gt;<br>
&gt;=C2=A0<br>
</span><span>&gt; diff --git a/meta/conf/machine/<a href=3D"http://qemuarm.=
co">qemuarm.co</a><wbr>nf b/meta/conf/machine/<a href=3D"http://qemuarm.co"=
>qemuarm.co</a><wbr>nf<br>
&gt; index f9d6dd7e364e..b9b640f974f3 100644<br>
&gt; --- a/meta/conf/machine/<a href=3D"http://qemuarm.co">qemuarm.co</a><w=
br>nf<br>
&gt; +++ b/meta/conf/machine/<a href=3D"http://qemuarm.co">qemuarm.co</a><w=
br>nf<br>
&gt; @@ -16,5 +16,4 @@ QB_MACHINE =3D &quot;-machine versatilepb&quot;<br>
&gt; =C2=A0QB_KERNEL_CMDLINE_APPEND =3D &quot;console=3DttyAMA0,115200 cons=
ole=3Dtty&quot;<br>
&gt; =C2=A0# Add the &#39;virtio-rng-pci&#39; device otherwise the guest ma=
y run out of entropy<br>
&gt; =C2=A0QB_OPT_APPEND =3D &quot;-show-cursor -usb -usbdevice tablet -dev=
ice virtio-rng-pci&quot;<br>
&gt; -PREFERRED_VERSION_linux-yocto ??=3D &quot;4.8%&quot;<br>
&gt; =C2=A0QB_DTB =3D &quot;${@base_version_less_or_equal<wbr>(&#39;PREFERR=
ED_VERSION_linux-<wbr>yocto&#39;, &#39;4.7&#39;, &#39;&#39;, &#39;zImage-ve=
rsatile-pb.dtb&#39;, d)}&quot;<br>
<br>
</span>Note the line below the line you&#39;re removing here. This is why w=
e =C2=A0 need<br>
this one...<br></blockquote><div><br></div><div>I had noticed that, but sin=
ce the newest version is well above that, I figured it</div><div>would be o=
k.</div><div><br></div><div>I can spin another patch that leaves it in plac=
e for ARM, but drops it for x86.</div><div><br></div><div>Bruce</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"m_8920471195440976830HOEnZb"><div class=3D"m_8920471195440976=
830h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"m_8920471195440976830gmail_signature" data-smartmail=3D"gmail=
_signature">&quot;Thou shalt not follow the NULL pointer, for chaos and mad=
ness await thee at its end&quot;</div>
</div></div>

--94eb2c0c9bbe919e5e054c72fcbc--
