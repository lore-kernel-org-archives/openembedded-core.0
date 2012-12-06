Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgTAk-0000lm-Qm
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 05:34:55 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so2297521wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 20:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VeyEDAqFI+C9+BoFOidrPekusMQk8xcyqC7Ctjy/0FU=;
	b=eysViOHLKpK8j1OH5WFX8E9tcV3wc0ZxmlCUEsxKHOcWeGXAgYI3WYM4eR8GjUmPeR
	9ceciKPCkMtI7rJl+cowd7GL5cgAE7xmSv3eTQdgnhFpbQmorsGDZ++IgiJk8kw1TlCJ
	o6WyBvElix/q8PjmZcQtyRmjurU9fAIctq92YzlZ4AtqfJxqmSP6XSRttEm2vnkkDcRl
	8qHNsMHIng/Bu/78QR1uwfjoIatPlm3MXNvVT62ir1qYtATelMB5FB/J+Hdh6qV0hpIh
	Ixe7TL+RIZmZNVMx/9VsFWKtu9fBPF9rJkbOKbiVKR9X2iXpaCZ85mqF0YBTTK1sHDK9
	QXIg==
MIME-Version: 1.0
Received: by 10.216.212.131 with SMTP id y3mr83248weo.62.1354767629948; Wed,
	05 Dec 2012 20:20:29 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Wed, 5 Dec 2012 20:20:29 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Wed, 5 Dec 2012 20:20:29 -0800 (PST)
In-Reply-To: <1354721845.25268.118.camel@ted>
References: <1354716839.25268.105.camel@ted>
	<20121205144539.GA3396@jama.jama.net>
	<1354720793.25268.115.camel@ted>
	<20121205152442.GC3396@jama.jama.net>
	<1354721845.25268.118.camel@ted>
Date: Thu, 6 Dec 2012 05:20:29 +0100
Message-ID: <CA+chaQdgmi9r9H4_JKUbD+ASUba_x5L=yAikkR78dQ5v_xv4kQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Switch to PR server model for PR bumps - 1 week
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
X-List-Received-Date: Thu, 06 Dec 2012 04:34:55 -0000
Content-Type: multipart/alternative; boundary=0016e6db2bff5618da04d0276b30

--0016e6db2bff5618da04d0276b30
Content-Type: text/plain; charset=UTF-8

Ah and one more:
6) what about export of LOCALCOUNT from bb persistent cache to import it as
initial values of AUTOINC for git recipes?

Cheers,
On Dec 5, 2012 4:37 PM, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

> On Wed, 2012-12-05 at 16:24 +0100, Martin Jansa wrote:
> > On Wed, Dec 05, 2012 at 03:19:53PM +0000, Richard Purdie wrote:
> > > On Wed, 2012-12-05 at 15:45 +0100, Martin Jansa wrote:
> > > Added to the page: "As implemented, values from the PR service are
> > > included into the PR field as an addition of the form ".X" so r0
> becomes
> > > r0.1, r0.2 and so on. This allows existing PR values to be used for
> > > whatever reasons allowing manual PR bumps should it be necessary."
> > >
> > > (should cover both questions)
> > >
> > > As for removing PR, as recipes are upgraded, I'm expecting we will
> > > remove PR values so we should get a smooth transition. We can still
> have
> > > PR values, it will just become an exception rather than the rule.
> >
> > So default "hidden" r0 is still used in such cases and PRSERV adds again
> > just .X.
>
> Exactly.
>
> > Thanks for answers.
>
> They were good questions :)
>
> Cheers,
>
> Richard
>
>
>

--0016e6db2bff5618da04d0276b30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Ah and one more:<br>
6) what about export of LOCALCOUNT from bb persistent cache to import it as=
 initial values of AUTOINC for git recipes?</p>
<p dir=3D"ltr">Cheers,</p>
<div class=3D"gmail_quote">On Dec 5, 2012 4:37 PM, &quot;Richard Purdie&quo=
t; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br type=3D"attribution"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
On Wed, 2012-12-05 at 16:24 +0100, Martin Jansa wrote:<br>
&gt; On Wed, Dec 05, 2012 at 03:19:53PM +0000, Richard Purdie wrote:<br>
&gt; &gt; On Wed, 2012-12-05 at 15:45 +0100, Martin Jansa wrote:<br>
&gt; &gt; Added to the page: &quot;As implemented, values from the PR servi=
ce are<br>
&gt; &gt; included into the PR field as an addition of the form &quot;.X&qu=
ot; so r0 becomes<br>
&gt; &gt; r0.1, r0.2 and so on. This allows existing PR values to be used f=
or<br>
&gt; &gt; whatever reasons allowing manual PR bumps should it be necessary.=
&quot;<br>
&gt; &gt;<br>
&gt; &gt; (should cover both questions)<br>
&gt; &gt;<br>
&gt; &gt; As for removing PR, as recipes are upgraded, I&#39;m expecting we=
 will<br>
&gt; &gt; remove PR values so we should get a smooth transition. We can sti=
ll have<br>
&gt; &gt; PR values, it will just become an exception rather than the rule.=
<br>
&gt;<br>
&gt; So default &quot;hidden&quot; r0 is still used in such cases and PRSER=
V adds again<br>
&gt; just .X.<br>
<br>
Exactly.<br>
<br>
&gt; Thanks for answers.<br>
<br>
They were good questions :)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--0016e6db2bff5618da04d0276b30--
