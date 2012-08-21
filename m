Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1T3p49-00068Z-Kc
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 16:04:21 +0200
Received: by vcbfy27 with SMTP id fy27so6156484vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 06:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=j2fJ7NVEfF12k6v2jIdEJxNJTKJx8hzbxBszOfzsGfs=;
	b=vHdQNJ/sMnDFySiRcLvZHGBMPLLRJw/vWC1rfsYKr4SKwuTlm8xw77KS1AKLyNBy0h
	E4oOex7Sb1GlGqJqIn4faYJrijahBXn93feyOje09ADWSe+zCwnd7+syKpSwbLr79hiQ
	xGEJ2OrTJCBONHFZWgEn/V7NF1uQcbfxph14ZYnzIh3TFjABjozpy72bp1++30Tatj5U
	XrPS8N778i7Ld9qVoedmXOXimkOkiIeDcVTXzKWNYQQPbNXNhXbZP5CT6jGc8y1HxbD4
	jtCBkyVAghzn+IG3dRbWcNRTXPAbGigaI7Gaj04NehzaHCnA+LXMbStTMIM6AABM3kIP
	JEfg==
MIME-Version: 1.0
Received: by 10.52.26.137 with SMTP id l9mr11290719vdg.62.1345557137450; Tue,
	21 Aug 2012 06:52:17 -0700 (PDT)
Received: by 10.52.161.65 with HTTP; Tue, 21 Aug 2012 06:52:17 -0700 (PDT)
In-Reply-To: <1631931.9ZRM3ET91W@helios>
References: <CAOHjBZvqMsh4nENivZWfrGUb9sXBLE58CfacjZp5U1LWBorGAw@mail.gmail.com>
	<1631931.9ZRM3ET91W@helios>
Date: Tue, 21 Aug 2012 15:52:17 +0200
Message-ID: <CAOHjBZv+nCryVbn63BVY9J9tru0xeJ5N9teeH1b_+F8uMUtZaQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: error expanding variable do_*
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
X-List-Received-Date: Tue, 21 Aug 2012 14:04:21 -0000
Content-Type: multipart/alternative; boundary=20cf307cfd3633e70004c7c6ef46

--20cf307cfd3633e70004c7c6ef46
Content-Type: text/plain; charset=ISO-8859-1

2012/8/21 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Tuesday 21 August 2012 15:15:42 Giuseppe Condorelli wrote:
> > Hi,
> >
>
Hi Paul,

many thanks for your quick reply.


> > today I restarted to work on my own OE meta layer and, after having
> pulled
> > last two months changes is OE-Core, I was able to
> > build nothing.
> > This is the error I met
> >
> > [****]$ bitbake core-image-minimal
> > Pseudo is not present but is required, building this first before the
> main
> > build
> > NOTE: Error expanding variable do_unpack                        | ETA:
> > 00:00:04
> > NOTE: Error during finalise of
> > /oelinux/condorg/openembedded-core/meta/recipes-sato/web/web_git.bb
> > ERROR: Unable to parse
> > /oelinux/condorg/openembedded-core/meta/recipes-sato/web/web_git.bb
> > ERROR: Command execution failed: Exited with 1
> >
> > I tried with bitbake version 1.15.2 and 1.15.3, the latest two versions.
> > What about the "Error expanding variable do_unpack?" I've read something
> in
> > previous message on mailing list
> > but with no understanding.
>
> This is almost certainly because of the whitespace changes in python
> functions.


What type of whitespace changes you are talking about?


> If you use master of OE-Core, you must use BitBake 1.15.3+; if you
> use denzil, you need to use 1.15.2. I'm a bit confused as to how you could
> have still got this error with 1.15.2 though since that change was not in
> that
> version (unless you are using master of OE-Core with BitBake 1.15.2).
>
>  I've pulled last two months updates for master OE-Core branch and I tried
with both bitbake 1.15.2 and 1.15.3 versions.

> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--20cf307cfd3633e70004c7c6ef46
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/8/21 Paul Eggleton <span dir=3D"ltr=
">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">pa=
ul.eggleton@linux.intel.com</a>&gt;</span><br><blockquote style=3D"margin:0=
px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border=
-left-width:1px;border-left-style:solid" class=3D"gmail_quote">
<div class=3D"HOEnZb"><div class=3D"h5">On Tuesday 21 August 2012 15:15:42 =
Giuseppe Condorelli wrote:<br>
&gt; Hi,<br>
&gt;<br></div></div></blockquote><div>Hi Paul,</div><div>=A0</div><div>many=
=A0thanks for your=A0quick reply.</div><div>=A0</div><blockquote style=3D"m=
argin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204)=
;border-left-width:1px;border-left-style:solid" class=3D"gmail_quote">
<div class=3D"HOEnZb"><div class=3D"h5">
&gt; today I restarted to work on my own OE meta layer and, after having pu=
lled<br>
&gt; last two months changes is OE-Core, I was able to<br>
&gt; build nothing.<br>
&gt; This is the error I met<br>
&gt;<br>
&gt; [****]$ bitbake core-image-minimal<br>
&gt; Pseudo is not present but is required, building this first before the =
main<br>
&gt; build<br>
&gt; NOTE: Error expanding variable do_unpack =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0| ETA:<br>
&gt; 00:00:04<br>
&gt; NOTE: Error during finalise of<br>
&gt; /oelinux/condorg/openembedded-core/meta/recipes-sato/web/<a href=3D"ht=
tp://web_git.bb" target=3D"_blank">web_git.bb</a><br>
&gt; ERROR: Unable to parse<br>
&gt; /oelinux/condorg/openembedded-core/meta/recipes-sato/web/<a href=3D"ht=
tp://web_git.bb" target=3D"_blank">web_git.bb</a><br>
&gt; ERROR: Command execution failed: Exited with 1<br>
&gt;<br>
&gt; I tried with bitbake version 1.15.2 and 1.15.3, the latest two version=
s.<br>
&gt; What about the &quot;Error expanding variable do_unpack?&quot; I&#39;v=
e read something in<br>
&gt; previous message on mailing list<br>
&gt; but with no understanding.<br>
<br>
</div></div>This is almost certainly because of the whitespace changes in p=
ython<br>
functions. </blockquote><div>=A0</div><div>What type of whitespace changes =
you are talking about?</div><div>=A0</div><blockquote style=3D"margin:0px 0=
px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-lef=
t-width:1px;border-left-style:solid" class=3D"gmail_quote">
If you use master of OE-Core, you must use BitBake 1.15.3+; if you<br>
use denzil, you need to use 1.15.2. I&#39;m a bit confused as to how you co=
uld<br>
have still got this error with 1.15.2 though since that change was not in t=
hat<br>
version (unless you are using master of OE-Core with BitBake 1.15.2).<br>
<br></blockquote><div>=A0I&#39;ve pulled last two months updates for master=
 OE-Core branch and I tried with both bitbake 1.15.2 and 1.15.3 versions.</=
div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-l=
eft-color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" c=
lass=3D"gmail_quote">

Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br>

--20cf307cfd3633e70004c7c6ef46--
