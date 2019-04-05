Return-Path: <just.another.mariano@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 930B77D5A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 18:49:56 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id h39so8617233qte.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gSwUZ5H76lZY5VwL6dkU+Hxgk/u7RRwkb7oAkEO5o04=;
	b=AQP8rkD7Z2zcqHpmieQqpqrAvyo7/bfrAUsrzAPWWODDSndbmU5qRDxtKTAXb8x0Va
	Qm3IJktQq5PDWCCXpgTQnz9zERA75FLa8N/dosaNmTD/aFwyze+e+IEa2l4+srNHHTzl
	qITZS7mlNmftP1NKkc8weACHXWi36DZwgHvHh8HwK/ktxEWMr+11lNf+eNbjZxeJ1S+o
	kOnnLQyr5gz/A7dLavxh1lJ2kHP+C0D9xBxnuXDFo3vu6nUV01pdjkgoOqgqFFzDpBWX
	fNkmH+/Jsje/ErPI3QdxC/ow5h3pEg1UVIH8aOuH0gt7lptB75RHXofBjxTrTlJ3jmvw
	i8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gSwUZ5H76lZY5VwL6dkU+Hxgk/u7RRwkb7oAkEO5o04=;
	b=R3d4TxPicH6H8T2XRKLgWi/NSUbfR44UBbRjrAXEToJsHx4KMvxU1yt2KtL4qF8iqO
	SsDq17GXRsaj4St2Kyw7Yj1jEZiKDUf3cafAWi+rJ1rlG1gr81hfpqBlI165t87Tzqv1
	fq+cLZ30asTqBull2xmL1aMplIh46NthIAx8cmqhv7lAW8gLSa16CMU+48wd/t2PhrNk
	E2ZChbqsR+bRuVNtiH+jGQrnCaZvjs4yWTGIGtI6VeAhVdm4LWZeMOOX87OgF/koGFrq
	iVfxlBuokefXNKTWBTJCm9SOHThiQA6GMQYqG/agrx7oXTaGH4+n3q+tdumGs/OfrDMz
	k7Ew==
X-Gm-Message-State: APjAAAUMQcmejAzfPdBo71OyrXZfKzfBi9g8HsV2kaYAybWW/T7W0yLc
	ZnR4JwgJyMTGahdAjH3uaUtEIaCB4NZbgxloPGM=
X-Google-Smtp-Source: APXvYqxoNGcT+pGEqdbuJNx7X//sf1eXHn8t8tS46dqtWecu7OmOjYGxM50L0G9BKXdv6Wg8GTKh1v9RCmpert2RQkU=
X-Received: by 2002:a0c:b018:: with SMTP id k24mr11721206qvc.218.1554490197498;
	Fri, 05 Apr 2019 11:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554391453.git.just.another.mariano@gmail.com>
	<CAJTo0LYVNgEkkhmv9j=hOE8bzn5KCzWZLSdrngG4UVrNBfaf+g@mail.gmail.com>
In-Reply-To: <CAJTo0LYVNgEkkhmv9j=hOE8bzn5KCzWZLSdrngG4UVrNBfaf+g@mail.gmail.com>
From: Mariano Lopez <just.another.mariano@gmail.com>
Date: Fri, 5 Apr 2019 13:49:46 -0500
Message-ID: <CA+TmX=OWwJxVcrGoCaBHEJCj1QtEMHiZrUu=gudw86hwn-WMxg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Feature to use symbolic links to binaries for ptest
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
X-List-Received-Date: Fri, 05 Apr 2019 18:49:56 -0000
Content-Type: multipart/alternative; boundary="00000000000007606d0585ccf4f0"

--00000000000007606d0585ccf4f0
Content-Type: text/plain; charset="UTF-8"

Sure, can you integrate this in the while I work on the busybox one? I'll
do it as part of bug 12597 that is also assigned to me

Mariano

On Fri, Apr 5, 2019 at 9:37 AM Burton, Ross <ross.burton@intel.com> wrote:

> Can you also port busybox to this instead of its own hand-coded logic?
>
> Ross
>
> On Fri, 5 Apr 2019 at 15:27, Mariano Lopez
> <just.another.mariano@gmail.com> wrote:
> >
> > Some binaries are renamed by update-alternatives class at build time
> > and some ptest run against a binary belonging to another package. Take
> > for example busybox or util-linux.
> >
> > This series adds a directory within the ptest path with symlinks to the
> > binaries produced by the package, so just adding this directory to the
> > PATH will test the correct binaries.
> >
> > To use this feature just add PTEST_BINDIR = "1" to the recipe.
> >
> > This will help to solve bug 13238.
> >
> > [YOCTO #13238]
> >
> > The following changes since commit
> ffa5a1bda6741f5dc9f1b8db1bb37b0c6f103c99:
> >
> >   asciidoc: specify XML catalogue to use (2019-04-03 14:56:27 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/justanotherboy/poky bug12597
> >   https://github.com/justanotherboy/poky/tree/bug12597
> >
> > Mariano Lopez (3):
> >   update-alternatives.bbclass: Add function to get renamed binaries
> >   ptest.bbclass: Add feature to populate a binary directory
> >   util-linux: Use PTEST binary directory
> >
> >
> > --
> > 2.19.2
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000007606d0585ccf4f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sure, can you integrate this in the while I work on t=
he busybox one? I&#39;ll do it as part of bug 12597 that is also assigned t=
o me<br> </div><div><br></div><div>Mariano<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 5, 2019 at 9:37 A=
M Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@int=
el.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Can you also port busybox to this instead of its own hand-coded logic=
?<br>
<br>
Ross<br>
<br>
On Fri, 5 Apr 2019 at 15:27, Mariano Lopez<br>
&lt;<a href=3D"mailto:just.another.mariano@gmail.com" target=3D"_blank">jus=
t.another.mariano@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Some binaries are renamed by update-alternatives class at build time<b=
r>
&gt; and some ptest run against a binary belonging to another package. Take=
<br>
&gt; for example busybox or util-linux.<br>
&gt;<br>
&gt; This series adds a directory within the ptest path with symlinks to th=
e<br>
&gt; binaries produced by the package, so just adding this directory to the=
<br>
&gt; PATH will test the correct binaries.<br>
&gt;<br>
&gt; To use this feature just add PTEST_BINDIR =3D &quot;1&quot; to the rec=
ipe.<br>
&gt;<br>
&gt; This will help to solve bug 13238.<br>
&gt;<br>
&gt; [YOCTO #13238]<br>
&gt;<br>
&gt; The following changes since commit ffa5a1bda6741f5dc9f1b8db1bb37b0c6f1=
03c99:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0asciidoc: specify XML catalogue to use (2019-04-03 14:56:2=
7 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://github.com/justanotherboy/poky" re=
l=3D"noreferrer" target=3D"_blank">github.com/justanotherboy/poky</a> bug12=
597<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/justanotherboy/poky/tree/bug=
12597" rel=3D"noreferrer" target=3D"_blank">https://github.com/justanotherb=
oy/poky/tree/bug12597</a><br>
&gt;<br>
&gt; Mariano Lopez (3):<br>
&gt;=C2=A0 =C2=A0update-alternatives.bbclass: Add function to get renamed b=
inaries<br>
&gt;=C2=A0 =C2=A0ptest.bbclass: Add feature to populate a binary directory<=
br>
&gt;=C2=A0 =C2=A0util-linux: Use PTEST binary directory<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; 2.19.2<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000007606d0585ccf4f0--
