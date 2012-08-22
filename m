Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1T47b4-0004j4-UU
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 11:51:34 +0200
Received: by wibhq4 with SMTP id hq4so4812524wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=U8Yqz/8puqlP7j2OA6gZSRnGNyToVtlYznb/haKYpps=;
	b=UbPypHWSBhclL8rzbQFt1WGXEOacnGeDPUJMjYgvmQf+fR5jdyLRU8DEVh1DINVIiE
	FSoxQ//38d4Ncnwxi2B2dqiBKRQaI22CM0kzwK5NrjfmIV7RQEEkm0I3nlAJYsenUZQt
	z/2CNvjJJdcp/GEDauUDf24BnGUgqS8wqst+Adlb2l0oDvNM6tV99qmruhjOTwSF+q1X
	l04izT0dPowIHEK49jwWdrXf0SMcYefwYQfRcGx4HclWehd6TOFGUldO8PZEUyKE+rL3
	6oBaTThndevNXwnw2JJGgIUzP4iH8I9U9HRaSCMRfbKXnqNOD7Pqa0syHOu1Ur/T2MZc
	+aYA==
MIME-Version: 1.0
Received: by 10.180.106.97 with SMTP id gt1mr4441883wib.5.1345628370136; Wed,
	22 Aug 2012 02:39:30 -0700 (PDT)
Received: by 10.216.133.32 with HTTP; Wed, 22 Aug 2012 02:39:30 -0700 (PDT)
In-Reply-To: <5230023.n3da1VyTML@helios>
References: <CAOHjBZvqMsh4nENivZWfrGUb9sXBLE58CfacjZp5U1LWBorGAw@mail.gmail.com>
	<1631931.9ZRM3ET91W@helios>
	<CAOHjBZv+nCryVbn63BVY9J9tru0xeJ5N9teeH1b_+F8uMUtZaQ@mail.gmail.com>
	<5230023.n3da1VyTML@helios>
Date: Wed, 22 Aug 2012 11:39:30 +0200
Message-ID: <CAOHjBZtMSAV6NWQP8osAss3viENoQLrNDpe=XKsJKrRqr-fq5w@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 22 Aug 2012 09:51:35 -0000
Content-Type: multipart/alternative; boundary=f46d04428066006c7104c7d78544

--f46d04428066006c7104c7d78544
Content-Type: text/plain; charset=ISO-8859-1

2012/8/21 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Tuesday 21 August 2012 15:52:17 Giuseppe Condorelli wrote:
> > > > [****]$ bitbake core-image-minimal
> > > > Pseudo is not present but is required, building this first before the
> > >
> > > main
> > >
> > > > build
> > > > NOTE: Error expanding variable do_unpack                        |
> ETA:
> > > > 00:00:04
> > > > NOTE: Error during finalise of
> > > > /oelinux/condorg/openembedded-core/meta/recipes-sato/web/web_git.bb
> > > > ERROR: Unable to parse
> > > > /oelinux/condorg/openembedded-core/meta/recipes-sato/web/web_git.bb
> > > > ERROR: Command execution failed: Exited with 1
> > > >
> > > > I tried with bitbake version 1.15.2 and 1.15.3, the latest two
> versions.
> > > > What about the "Error expanding variable do_unpack?" I've read
> something
> > >
> > > in
> > >
> > > > previous message on mailing list
> > > > but with no understanding.
> > >
> > > This is almost certainly because of the whitespace changes in python
> > > functions.
> >
> > What type of whitespace changes you are talking about?
>
> Please see:
>
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/025962.html
>

I'm sorry, I've not read that when it was wrote. I was out for two months
and now I've to look at an huge amount of information coming from the
mailing list.

>
> > > If you use master of OE-Core, you must use BitBake 1.15.3+; if you
> > > use denzil, you need to use 1.15.2. I'm a bit confused as to how you
> could
> > > have still got this error with 1.15.2 though since that change was not
> in
> > > that version (unless you are using master of OE-Core with BitBake
> 1.15.2).
> >
> > I've pulled last two months updates for master OE-Core branch and I tried
> > with both bitbake 1.15.2 and 1.15.3 versions.
>
> I just tried BitBake 1.15.3 with OE-Core latest master and I do not see
> that
> error. Are you using latest master of OE-Core or some specific revision?
> Can
> you provide me with any other information that would help me to reproduce
> the
> issue? If you check out OE-Core in a separate new directory and use BitBake
> 1.15.3 do you still get the same issue?
>
Well, confirmed. I cloned OE-Core by scratch and all was solved trying to
build the default core-image-minimal.
I've now some issues on my own layer, but this is obvious given that it has
to be aligned (perhaps os.* entries have to be moved to subprocess.*).
Paul, as usual you are very very exhaustive in your reply. Many thanks for
this.

>
> Cheers,
> Paul
>
Cheers,
Giuseppe

>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--f46d04428066006c7104c7d78544
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/8/21 Paul Eggleton <span dir=3D"ltr=
">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">pa=
ul.eggleton@linux.intel.com</a>&gt;</span><br><blockquote style=3D"margin:0=
px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border=
-left-width:1px;border-left-style:solid" class=3D"gmail_quote">
<div class=3D"im">On Tuesday 21 August 2012 15:52:17 Giuseppe Condorelli wr=
ote:<br>
&gt; &gt; &gt; [****]$ bitbake core-image-minimal<br>
&gt; &gt; &gt; Pseudo is not present but is required, building this first b=
efore the<br>
&gt; &gt;<br>
&gt; &gt; main<br>
&gt; &gt;<br>
&gt; &gt; &gt; build<br>
&gt; &gt; &gt; NOTE: Error expanding variable do_unpack =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0| ETA:<br>
&gt; &gt; &gt; 00:00:04<br>
&gt; &gt; &gt; NOTE: Error during finalise of<br>
&gt; &gt; &gt; /oelinux/condorg/openembedded-core/meta/recipes-sato/web/<a =
href=3D"http://web_git.bb" target=3D"_blank">web_git.bb</a><br>
&gt; &gt; &gt; ERROR: Unable to parse<br>
&gt; &gt; &gt; /oelinux/condorg/openembedded-core/meta/recipes-sato/web/<a =
href=3D"http://web_git.bb" target=3D"_blank">web_git.bb</a><br>
&gt; &gt; &gt; ERROR: Command execution failed: Exited with 1<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I tried with bitbake version 1.15.2 and 1.15.3, the latest t=
wo versions.<br>
&gt; &gt; &gt; What about the &quot;Error expanding variable do_unpack?&quo=
t; I&#39;ve read something<br>
&gt; &gt;<br>
&gt; &gt; in<br>
&gt; &gt;<br>
&gt; &gt; &gt; previous message on mailing list<br>
&gt; &gt; &gt; but with no understanding.<br>
&gt; &gt;<br>
&gt; &gt; This is almost certainly because of the whitespace changes in pyt=
hon<br>
&gt; &gt; functions.<br>
&gt;<br>
&gt; What type of whitespace changes you are talking about?<br>
<br>
</div>Please see:<br>
<a href=3D"http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July=
/025962.html" target=3D"_blank">http://lists.linuxtogo.org/pipermail/openem=
bedded-core/2012-July/025962.html</a><br></blockquote><div>=A0</div><div>I&=
#39;m sorry, I&#39;ve not read that when it was wrote. I was out for two mo=
nths and now I&#39;ve to look at an huge amount of information coming from =
the mailing list.</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
<div class=3D"im"><br>
&gt; &gt; If you use master of OE-Core, you must use BitBake 1.15.3+; if yo=
u<br>
&gt; &gt; use denzil, you need to use 1.15.2. I&#39;m a bit confused as to =
how you could<br>
&gt; &gt; have still got this error with 1.15.2 though since that change wa=
s not in<br>
&gt; &gt; that version (unless you are using master of OE-Core with BitBake=
 1.15.2).<br>
&gt;<br>
&gt; I&#39;ve pulled last two months updates for master OE-Core branch and =
I tried<br>
&gt; with both bitbake 1.15.2 and 1.15.3 versions.<br>
<br>
</div>I just tried BitBake 1.15.3 with OE-Core latest master and I do not s=
ee that<br>
error. Are you using latest master of OE-Core or some specific revision? Ca=
n<br>
you provide me with any other information that would help me to reproduce t=
he<br>
issue? If you check out OE-Core in a separate new directory and use BitBake=
<br>
1.15.3 do you still get the same issue?<br></blockquote><div>Well,=A0confir=
med. I cloned=A0OE-Core by scratch and all was solved trying to build the d=
efault core-image-minimal.</div><div>I&#39;ve now some issues on my own lay=
er, but this is obvious given that it has to be aligned (perhaps os.* entri=
es have to be moved to subprocess.*).</div>
<div>Paul, as usual you are very very=A0exhaustive in your reply. Many than=
ks for this.=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-=
left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-le=
ft-style:solid" class=3D"gmail_quote">

<div class=3D"HOEnZb"><div class=3D"h5"><br>
Cheers,<br>
Paul<br></div></div></blockquote><div>Cheers,</div><div>Giuseppe=A0</div><b=
lockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-co=
lor:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
<div class=3D"HOEnZb"><div class=3D"h5">
<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</div></div></blockquote></div><br>

--f46d04428066006c7104c7d78544--
