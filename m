Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Qccio-0004In-GU
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 14:21:23 +0200
Received: by gyd12 with SMTP id 12so1376447gyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 05:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=tJ4hWYvauQqnQIsaZVGpdxiKWG0JjM85iapbAdtq/hk=;
	b=HY+sFfhk7Hu242YLE/uqrf9+Qe4ZLmf/cV8yCaBdH+xSjQkzybzCHdc+YOOu+LORfN
	1yH5A6BY0bJk7ifD6R41VTER6XwIRj479Mjdiu3jGcZJMFDxa6kJTGJlRjn7Q/vz7aps
	sAoXV43dxEtonOa7MlzbJWetr/CDRmjOBLTFI=
MIME-Version: 1.0
Received: by 10.91.202.38 with SMTP id e38mr2872801agq.196.1309522656934; Fri,
	01 Jul 2011 05:17:36 -0700 (PDT)
Received: by 10.90.183.14 with HTTP; Fri, 1 Jul 2011 05:17:36 -0700 (PDT)
In-Reply-To: <1309515892.2633.42.camel@phil-desktop>
References: <1309513280.2633.28.camel@phil-desktop>
	<1309515335.20015.516.camel@rex>
	<1309515892.2633.42.camel@phil-desktop>
Date: Fri, 1 Jul 2011 14:17:36 +0200
Message-ID: <BANLkTikZ3okkb8riCH7CGi7xmwMEpGcu7w@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: PRIORITY
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jul 2011 12:21:23 -0000
Content-Type: multipart/alternative; boundary=001636af0371caba5c04a70100fa

--001636af0371caba5c04a70100fa
Content-Type: text/plain; charset=ISO-8859-1

2011/7/1 Phil Blundell <pb@pbcl.net>

> On Fri, 2011-07-01 at 11:15 +0100, Richard Purdie wrote:
> > On Fri, 2011-07-01 at 10:41 +0100, Phil Blundell wrote:
> > > We had some discussion of this a few weeks ago but I'm not sure it ever
> > > reached a firm conclusion.
> > >
> > > Is everyone agreed that the PRIORITY variable does not serve any useful
> > > purpose in oe-core and can/should be removed from the recipes?
> >
> > I think that was the conclusion, yes. I'll take a patch (or a
> > commandline I guess).
>
> I did:
>
> $ find . -regex ".*\.\(bb\|inc\)$" | xargs sed -i '/^PRIORITY = ".*"$/d'
>
> which seemed to produce the desired results.  I can send a patch if you
> like but it would be somewhat large and fairly uninteresting.
>
> I'd suggest a regex that matches for any whitespace in order also to catch
things like:
./libgpevtype/libgpevtype_0.50.bb:PRIORITY    = "optional"

Have fun! Frans

--001636af0371caba5c04a70100fa
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/1 Phil Blundell <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:pb@pbcl.net">pb@pbcl.net</a>&gt;</span><br><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1=
px solid rgb(204, 204, 204); padding-left: 1ex;">
<div class=3D"im">On Fri, 2011-07-01 at 11:15 +0100, Richard Purdie wrote:<=
br>
&gt; On Fri, 2011-07-01 at 10:41 +0100, Phil Blundell wrote:<br>
&gt; &gt; We had some discussion of this a few weeks ago but I&#39;m not su=
re it ever<br>
&gt; &gt; reached a firm conclusion.<br>
&gt; &gt;<br>
&gt; &gt; Is everyone agreed that the PRIORITY variable does not serve any =
useful<br>
&gt; &gt; purpose in oe-core and can/should be removed from the recipes?<br=
>
&gt;<br>
&gt; I think that was the conclusion, yes. I&#39;ll take a patch (or a<br>
&gt; commandline I guess).<br>
<br>
</div>I did:<br>
<br>
$ find . -regex &quot;.*\.\(bb\|inc\)$&quot; | xargs sed -i &#39;/^PRIORITY=
 =3D &quot;.*&quot;$/d&#39;<br>
<br>
which seemed to produce the desired results. =A0I can send a patch if you<b=
r>
like but it would be somewhat large and fairly uninteresting.<br>
<font color=3D"#888888"><br></font></blockquote><div>I&#39;d suggest a rege=
x that matches for any whitespace in order also to catch things like:<br>./=
libgpevtype/libgpevtype_0.50.bb:PRIORITY=A0=A0=A0 =3D &quot;optional&quot;<=
br><br>
Have fun! Frans <br></div></div><br>

--001636af0371caba5c04a70100fa--
