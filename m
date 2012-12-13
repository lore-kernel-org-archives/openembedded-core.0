Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TixYH-0003Zm-AO
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 02:25:29 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so1217385lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 17:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=kSupcfbjGHWmfDHCuyZdHLBOPXLvi20fvZBqaJZbDXY=;
	b=qvaYTkpEVu2AVLsQi21Xazpu7KW/oMgwnY6EYOI1KG19iYYOk7saH6ELLBiMP/ihTe
	sUDdv4ZuppTBubDIIb3hg6pVONdGJicdo+9Ugiu28ZOmNVG7YzryIxAn07UxiVHTAyce
	Kc0VyhKkV96KbhX08zXzzWWG0/pd2QGGopIgG/kGKBShRwlPILTDTuh8V7FWF6TWSJzi
	2rE8Eg+okqd4jwc3WV1UrMXRgAKWPjG4rKkN5H8rr8tIvopR2tuktCqnjAKJ2jl37OpS
	/ecbMBOkIrqAttx9vQOi8cPwhZGKjP9JLehZfwDsS73+y9dUuXDV8EFDZFut/aooDJSr
	N74g==
Received: by 10.152.111.41 with SMTP id if9mr75228lab.23.1355361055116; Wed,
	12 Dec 2012 17:10:55 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 12 Dec 2012 17:10:34 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1212121950080.363@oneiric>
References: <alpine.DEB.2.02.1212121908030.31574@oneiric>
	<20121213004147.GA3413@jama.jama.net>
	<alpine.DEB.2.02.1212121950080.363@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 12 Dec 2012 18:10:34 -0700
X-Google-Sender-Auth: O5oRpoR8Kar7krTMjqksFdCogCY
Message-ID: <CABcZAN=MjaQ4zkNnVud--hrsN5SMuf8cj=sAhwgZbqyFuS5x7g@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: remaining few uses of "pnum=" for patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 01:25:29 -0000
Content-Type: multipart/alternative; boundary=f46d040715293b8caa04d0b1964b

--f46d040715293b8caa04d0b1964b
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 12, 2012 at 5:52 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Thu, 13 Dec 2012, Martin Jansa wrote:
>
> > On Wed, Dec 12, 2012 at 07:10:46PM -0500, Robert P. J. Day wrote:
> > >
> > >   just noticed that in all of the layers i have checked out (about a
> > > dozen), the usage of the deprecated "pnum=" is down to:
> > >
> > > meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI
> += "
> http://ftp.vim.org/pub/vim/patches/7.2/7.2.001-100.gz;name=p001-100;apply=yes;patchdir=..;pnum=0
> "
> > > meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI
> += "
> http://ftp.vim.org/pub/vim/patches/7.2/7.2.101-200.gz;name=p101-200;apply=yes;patchdir=..;pnum=0
> "
> > > meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI
> += "
> http://ftp.vim.org/pub/vim/patches/7.2/7.2.201-300.gz;name=p201-300;apply=yes;patchdir=..;pnum=0
> "
> > > meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI
> += "
> http://ftp.vim.org/pub/vim/patches/7.2/7.2.301-400.gz;name=p301-400;apply=yes;patchdir=..;pnum=0
> "
> > > meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI
> += "file://401-446.diff;patchdir=..;pnum=0"
> > >
> > >   given that that's a single recipe, what about fixing that recipe,
> >
> > Good plan, please send patch.
>
>   while i'm at it, can i just ditch the "apply=yes"?  isn't that the
> default?


Nope, it's only the default for .{patch,diff}{,.gz}.
-- 
Christopher Larson

--f46d040715293b8caa04d0b1964b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Dec 1=
2, 2012 at 5:52 PM, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"im">=
On Thu, 13 Dec 2012, Martin Jansa wrote:<br>
<br>
&gt; On Wed, Dec 12, 2012 at 07:10:46PM -0500, Robert P. J. Day wrote:<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 just noticed that in all of the layers i have checked out =
(about a<br>
&gt; &gt; dozen), the usage of the deprecated &quot;pnum=3D&quot; is down t=
o:<br>
&gt; &gt;<br>
&gt; &gt; meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_=
URI +=3D &quot;<a href=3D"http://ftp.vim.org/pub/vim/patches/7.2/7.2.001-10=
0.gz;name=3Dp001-100;apply=3Dyes;patchdir=3D..;pnum=3D0" target=3D"_blank">=
http://ftp.vim.org/pub/vim/patches/7.2/7.2.001-100.gz;name=3Dp001-100;apply=
=3Dyes;patchdir=3D..;pnum=3D0</a>&quot;<br>


&gt; &gt; meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_=
URI +=3D &quot;<a href=3D"http://ftp.vim.org/pub/vim/patches/7.2/7.2.101-20=
0.gz;name=3Dp101-200;apply=3Dyes;patchdir=3D..;pnum=3D0" target=3D"_blank">=
http://ftp.vim.org/pub/vim/patches/7.2/7.2.101-200.gz;name=3Dp101-200;apply=
=3Dyes;patchdir=3D..;pnum=3D0</a>&quot;<br>


&gt; &gt; meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_=
URI +=3D &quot;<a href=3D"http://ftp.vim.org/pub/vim/patches/7.2/7.2.201-30=
0.gz;name=3Dp201-300;apply=3Dyes;patchdir=3D..;pnum=3D0" target=3D"_blank">=
http://ftp.vim.org/pub/vim/patches/7.2/7.2.201-300.gz;name=3Dp201-300;apply=
=3Dyes;patchdir=3D..;pnum=3D0</a>&quot;<br>


&gt; &gt; meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_=
URI +=3D &quot;<a href=3D"http://ftp.vim.org/pub/vim/patches/7.2/7.2.301-40=
0.gz;name=3Dp301-400;apply=3Dyes;patchdir=3D..;pnum=3D0" target=3D"_blank">=
http://ftp.vim.org/pub/vim/patches/7.2/7.2.301-400.gz;name=3Dp301-400;apply=
=3Dyes;patchdir=3D..;pnum=3D0</a>&quot;<br>


&gt; &gt; meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_=
URI +=3D &quot;file://401-446.diff;patchdir=3D..;pnum=3D0&quot;<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 given that that&#39;s a single recipe, what about fixing t=
hat recipe,<br>
&gt;<br>
&gt; Good plan, please send patch.<br>
<br>
</div></div>=C2=A0 while i&#39;m at it, can i just ditch the &quot;apply=3D=
yes&quot;? =C2=A0isn&#39;t that the<br>
default?</blockquote></div><br>Nope, it&#39;s only the default for .{patch,=
diff}{,.gz}.<br>-- <br>Christopher Larson<br>
</div>

--f46d040715293b8caa04d0b1964b--
