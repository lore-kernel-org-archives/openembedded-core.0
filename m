Return-Path: <jatedev@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB097023C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 17:58:25 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id r5so3087767qcx.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 10:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Bqk5mVxt59S2tLQwQlOsGokPDDhX88IO+oG2IMHcB0w=;
	b=0+zNMSPfTpPoB3e2H2yGccyBY6KWi1jMWuz/GDkoIWykdnBSb02mx6tzpAyF5GGw0X
	vZEHoY+dt9KaQ5YBQAlK7IfAC1nae5qZOCRw0HllMZroH70kCqfF7dOyEd8o41C17ba5
	gOE6LXb0fPolcnj8QF97ZjRvgCMg/Y0iT+6HhsJyEpOQL6KJvun+my+5zPEJJpxEq4kH
	W94Bkgd8emw8aQEq+IjnOk0FJWw6mOGyV26Io9t6jzhoi4cL/Upk9SmRszXYf2uAaYkq
	9DdxHAFypEsRiuBNoDu7n/6EBBEFueKzsipfwy9uH3lzx5Q3ypwt5uyx8AA4f+2unNBE
	Hl8A==
MIME-Version: 1.0
X-Received: by 10.224.57.148 with SMTP id c20mr24868825qah.31.1405360706891;
	Mon, 14 Jul 2014 10:58:26 -0700 (PDT)
Received: by 10.140.34.76 with HTTP; Mon, 14 Jul 2014 10:58:26 -0700 (PDT)
In-Reply-To: <lyzjgchs81.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1405349203-32702-1-git-send-email-jatedev@gmail.com>
	<lyzjgchs81.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Mon, 14 Jul 2014 13:58:26 -0400
Message-ID: <CAPphmgYUX828A=6SayztArEdU9L-=Hhfkw2w3mRw1ka_AmCWsw@mail.gmail.com>
From: Jate S <jatedev@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python2: Add PACKAGECONFIG for tkinter to support tk from meta-oe
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
X-List-Received-Date: Mon, 14 Jul 2014 17:58:26 -0000
Content-Type: multipart/alternative; boundary=089e0149c578b7371404fe2b0930

--089e0149c578b7371404fe2b0930
Content-Type: text/plain; charset=UTF-8

Python 2.7.x does not use an explicit configure option for tk support.
Instead, it tries to detect the tk and tcl libraries before compiling
python-tkinter.

In PACKAGECONFIG[*], items three and four are the DEPENDS and RDEPENDS,
respectively. They are only added to the python DEPENDS/RDEPENDS when the
user adds tkinter to the PACKAGECONFIG value.

This thread contains more discussion:

https://lists.yoctoproject.org/pipermail/yocto/2014-July/thread.html#20415

- Jate S.



On Mon, Jul 14, 2014 at 11:31 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Jate Sujjavanich <jatedev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> writes:
>
> > +PACKAGECONFIG[tkinter] = ",,tk,tk tk-lib"
>
> What do you want to reach with this?  Afais, build is not more
> deterministic
> than before and requiring both 'tk' and 'tk-lib' when 'tkinter' is *not*
> enabled does not look sane to me either.
>
> You probably want something like
>
> | PACKAGECONFIG[tkinter]="--with-tkinter, --without-tkinter, tk tk-lib"
>
> although I do not know/checked whether '--with*-tkinter' is supported by
> python's configure script.
>
>
> Enrico
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0149c578b7371404fe2b0930
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Python 2.7.x does not use an explicit configure optio=
n for tk support. Instead, it tries to detect the tk and tcl libraries befo=
re compiling python-tkinter.<br><br>In PACKAGECONFIG[*], items three and fo=
ur are the DEPENDS and RDEPENDS, respectively. They are only added to the p=
ython DEPENDS/RDEPENDS when the user adds tkinter to the PACKAGECONFIG valu=
e.<br>
<br>This thread contains more discussion:<br><br><a href=3D"https://lists.y=
octoproject.org/pipermail/yocto/2014-July/thread.html#20415">https://lists.=
yoctoproject.org/pipermail/yocto/2014-July/thread.html#20415<span class=3D"=
sewz5yuip6q1dc3"></span><span class=3D"sewz5yuip6q1dc3"></span></a><br>
<br></div>- Jate S.<br><div><br></div></div><div class=3D"gmail_extra"><br>=
<br><div class=3D"gmail_quote">On Mon, Jul 14, 2014 at 11:31 AM, Enrico Sch=
olz <span dir=3D"ltr">&lt;<a href=3D"mailto:enrico.scholz@sigma-chemnitz.de=
" target=3D"_blank">enrico.scholz@sigma-chemnitz.de</a>&gt;</span> wrote:<b=
r>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Jate Sujjavanich &lt;<a href=3D"mailto:jated=
ev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">jatedev-Re5JQEeQqe8AvxtiuMwx3w@=
public.gmane.org</a>&gt;<br>

writes:<br>
<div class=3D""><br>
&gt; +PACKAGECONFIG[tkinter] =3D &quot;,,tk,tk tk-lib&quot;<br>
<br>
</div>What do you want to reach with this? =C2=A0Afais, build is not more d=
eterministic<br>
than before and requiring both &#39;tk&#39; and &#39;tk-lib&#39; when &#39;=
tkinter&#39; is *not*<br>
enabled does not look sane to me either.<br>
<br>
You probably want something like<br>
<br>
| PACKAGECONFIG[tkinter]=3D&quot;--with-tkinter, --without-tkinter, tk tk-l=
ib&quot;<br>
<br>
although I do not know/checked whether &#39;--with*-tkinter&#39; is support=
ed by<br>
python&#39;s configure script.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
Enrico<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--089e0149c578b7371404fe2b0930--
