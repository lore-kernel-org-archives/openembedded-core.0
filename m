Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED5578288
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 18:00:24 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id n29so3960500uai.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 11:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1i9/cVPc8JCy8WdhkhjSaLpwaLt6rH7BTRZSbo6p0Ko=;
	b=LeLwU7+NN2aJA4sCx+hZvJzjc+fJxg3kVZJRhAPBKzBRKyTArF/npPYnAuzLUbPMMs
	R242DDhR4EwiBBq7LgJgkVgiDgLOG9EH3Tm9TOkLaFEczhBPV4fA4Uutx38IPzttXvcc
	2OR6DyY6UvBIIlTqGE8H1ncMGhVZqrPS+Rl/RXVzEjgHGzkc2Muf/dHVgWU7thacKKyc
	n8PAIE2d8Egq0ajLzRaKH0n6YlkxM8SIIBlqezGQE8IfnJDow8f27bHmJ028NfdaIz5l
	fFVf5wnSFMumMvZQuGgqBi7uBHhP7Aw9COVvZmmyelZ+CGeyghYI1kdwdcPHShv54s1g
	3zRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1i9/cVPc8JCy8WdhkhjSaLpwaLt6rH7BTRZSbo6p0Ko=;
	b=S9rLCf79UkekKHG/1v7DyLG6YkjbIKW7pXs42jSt/0rIV4PUenSaWPXMvDDDJQIPU7
	z0TTteJyCOkH1OqcVNi7n0aB4fkRgY+otIPIQOoss1Wh4ZD06ijq8ou42Gp7cvzQPxqV
	GTpzFuNY4EnT6bPn0QCFDSWESd9/vtdoK/46wH6ygH9aeXOJpglFyeG9uOP9+PPOxRsK
	uylb/9HxndS8ex7izWGJ7CdSF8TfkDnhXyALxplZZw/LWLBzoP/JZ/NlYGaNafC1jTgz
	LplL7Q3ikIsBYLsXo5d96K7xS6pN/p1f7yN868dDgZZSSSiqoZtX1KPoazQfNDaNlvwQ
	8LZQ==
X-Gm-Message-State: AHYfb5heGDCYcVQSSpKK2Y0VDWsV0UB8zwiTK7CFX+lddSnD6yu8IR12
	iA3C9+ESuIETln+rVOgjGV7MYNjcRg==
X-Received: by 10.176.95.85 with SMTP id z21mr855530uah.183.1503424826309;
	Tue, 22 Aug 2017 11:00:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Tue, 22 Aug 2017 11:00:25 -0700 (PDT)
In-Reply-To: <CAMKF1spLkW=57FZtm5_Xa3OGkBgj4RzvW9GKTudg1o2nDi9=9w@mail.gmail.com>
References: <1503400000-25414-1-git-send-email-rbilovol@cisco.com>
	<CAMKF1spLkW=57FZtm5_Xa3OGkBgj4RzvW9GKTudg1o2nDi9=9w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 22 Aug 2017 20:00:25 +0200
Message-ID: <CA+chaQdAOK1nfbug3kRgiv4hcck=dPbWX52x60ZHzMAD1nUPwg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] machine-sdk: oldest kernel for x86/x86_64 is 3.2.0 now
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
X-List-Received-Date: Tue, 22 Aug 2017 18:00:25 -0000
Content-Type: multipart/alternative; boundary="f403045f2860b8015105575b5e92"

--f403045f2860b8015105575b5e92
Content-Type: text/plain; charset="UTF-8"

It's pity that we won't be able to use newer SDK on older hosts, but I'm
glad that SDK_OLDEST_KERNEL is going away as it wasn't working very well
anyway as discussed here:
http://lists.openembedded.org/pipermail/openembedded-core/2016-October/127519.html

On Tue, Aug 22, 2017 at 6:35 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Aug 22, 2017 at 4:06 AM, Ruslan Bilovol <rbilovol@cisco.com>
> wrote:
> > With glibc upgrade to 2.26 release (commit d6a0bc57fa07
> > "glibc: Upgrade to 2.26 final release") it's not possible
> > to build x86/x86_64 SDK for kernels lower than 3.2.0
> > (see glibc commit 139ace95756a "Require Linux kernel 3.2
> > or later on x86 / x86_64.")
> >
> > Thus drop SDK_OLDEST_KERNEL overrides from machine-specific
> > conf files, so default version 3.2.0 from conf/bitbake.conf
> > will be picked up.
> >
>
> this is ok
>
> > Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> > ---
> >  meta/conf/machine-sdk/i586.conf   | 1 -
> >  meta/conf/machine-sdk/i686.conf   | 1 -
> >  meta/conf/machine-sdk/x86_64.conf | 1 -
> >  3 files changed, 3 deletions(-)
> >
> > diff --git a/meta/conf/machine-sdk/i586.conf
> b/meta/conf/machine-sdk/i586.conf
> > index 99083fb..41e5e15 100644
> > --- a/meta/conf/machine-sdk/i586.conf
> > +++ b/meta/conf/machine-sdk/i586.conf
> > @@ -1,5 +1,4 @@
> >  SDK_ARCH = "i586"
> >  SDK_CC_ARCH = "-march=i586"
> >  ABIEXTENSION_class-nativesdk = ""
> > -SDK_OLDEST_KERNEL = "2.6.32"
> >
> > diff --git a/meta/conf/machine-sdk/i686.conf
> b/meta/conf/machine-sdk/i686.conf
> > index cf22784..fe40697 100644
> > --- a/meta/conf/machine-sdk/i686.conf
> > +++ b/meta/conf/machine-sdk/i686.conf
> > @@ -1,4 +1,3 @@
> >  SDK_ARCH = "i686"
> >  SDK_CC_ARCH = "-march=i686"
> >  ABIEXTENSION_class-nativesdk = ""
> > -SDK_OLDEST_KERNEL = "2.6.32"
> > diff --git a/meta/conf/machine-sdk/x86_64.conf
> b/meta/conf/machine-sdk/x86_64.conf
> > index 7d2e717..61439b4 100644
> > --- a/meta/conf/machine-sdk/x86_64.conf
> > +++ b/meta/conf/machine-sdk/x86_64.conf
> > @@ -1,3 +1,2 @@
> >  SDK_ARCH = "x86_64"
> >  ABIEXTENSION_class-nativesdk = ""
> > -SDK_OLDEST_KERNEL = "2.6.32"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045f2860b8015105575b5e92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s pity that we won&#39;t be able to use newer SDK o=
n older hosts, but I&#39;m glad that SDK_OLDEST_KERNEL is going away as it =
wasn&#39;t working very well anyway as discussed here:<div><a href=3D"http:=
//lists.openembedded.org/pipermail/openembedded-core/2016-October/127519.ht=
ml">http://lists.openembedded.org/pipermail/openembedded-core/2016-October/=
127519.html</a><br></div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On Tue, Aug 22, 2017 at 6:35 PM, Khem Raj <span dir=3D"ltr">&=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
>On Tue, Aug 22, 2017 at 4:06 AM, Ruslan Bilovol &lt;<a href=3D"mailto:rbil=
ovol@cisco.com">rbilovol@cisco.com</a>&gt; wrote:<br>
&gt; With glibc upgrade to 2.26 release (commit d6a0bc57fa07<br>
&gt; &quot;glibc: Upgrade to 2.26 final release&quot;) it&#39;s not possibl=
e<br>
&gt; to build x86/x86_64 SDK for kernels lower than 3.2.0<br>
&gt; (see glibc commit 139ace95756a &quot;Require Linux kernel 3.2<br>
&gt; or later on x86 / x86_64.&quot;)<br>
&gt;<br>
&gt; Thus drop SDK_OLDEST_KERNEL overrides from machine-specific<br>
&gt; conf files, so default version 3.2.0 from conf/bitbake.conf<br>
&gt; will be picked up.<br>
&gt;<br>
<br>
</span>this is ok<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Signed-off-by: Ruslan Bilovol &lt;<a href=3D"mailto:rbilovol@cisco.com=
">rbilovol@cisco.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/machine-sdk/i586.<wbr>conf=C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 meta/conf/machine-sdk/i686.<wbr>conf=C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 meta/conf/machine-sdk/x86_64.<wbr>conf | 1 -<br>
&gt;=C2=A0 3 files changed, 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/machine-sdk/i586.<wbr>conf b/meta/conf/machine-=
sdk/i586.<wbr>conf<br>
&gt; index 99083fb..41e5e15 100644<br>
&gt; --- a/meta/conf/machine-sdk/i586.<wbr>conf<br>
&gt; +++ b/meta/conf/machine-sdk/i586.<wbr>conf<br>
&gt; @@ -1,5 +1,4 @@<br>
&gt;=C2=A0 SDK_ARCH =3D &quot;i586&quot;<br>
&gt;=C2=A0 SDK_CC_ARCH =3D &quot;-march=3Di586&quot;<br>
&gt;=C2=A0 ABIEXTENSION_class-nativesdk =3D &quot;&quot;<br>
&gt; -SDK_OLDEST_KERNEL =3D &quot;2.6.32&quot;<br>
&gt;<br>
&gt; diff --git a/meta/conf/machine-sdk/i686.<wbr>conf b/meta/conf/machine-=
sdk/i686.<wbr>conf<br>
&gt; index cf22784..fe40697 100644<br>
&gt; --- a/meta/conf/machine-sdk/i686.<wbr>conf<br>
&gt; +++ b/meta/conf/machine-sdk/i686.<wbr>conf<br>
&gt; @@ -1,4 +1,3 @@<br>
&gt;=C2=A0 SDK_ARCH =3D &quot;i686&quot;<br>
&gt;=C2=A0 SDK_CC_ARCH =3D &quot;-march=3Di686&quot;<br>
&gt;=C2=A0 ABIEXTENSION_class-nativesdk =3D &quot;&quot;<br>
&gt; -SDK_OLDEST_KERNEL =3D &quot;2.6.32&quot;<br>
&gt; diff --git a/meta/conf/machine-sdk/x86_<wbr>64.conf b/meta/conf/machin=
e-sdk/x86_<wbr>64.conf<br>
&gt; index 7d2e717..61439b4 100644<br>
&gt; --- a/meta/conf/machine-sdk/x86_<wbr>64.conf<br>
&gt; +++ b/meta/conf/machine-sdk/x86_<wbr>64.conf<br>
&gt; @@ -1,3 +1,2 @@<br>
&gt;=C2=A0 SDK_ARCH =3D &quot;x86_64&quot;<br>
&gt;=C2=A0 ABIEXTENSION_class-nativesdk =3D &quot;&quot;<br>
&gt; -SDK_OLDEST_KERNEL =3D &quot;2.6.32&quot;<br>
&gt; --<br>
&gt; 1.9.1<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--f403045f2860b8015105575b5e92--
