Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SaSfW-00012C-GQ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 16:17:34 +0200
Received: by ggnp4 with SMTP id p4so1786054ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=qhOkOAdkMu/2Hv4nrHrYrrhst9RjLRIO+aWo8UipobY=;
	b=AAc2U5QizreTqK2SRH44xvLA4p98Z6GLPQqwjX8I7SC6VzOMJNHXlKz8QW+6wm2k8X
	WpCSA4iCeJDsSs5POmyvLDb1cZeGo3nuR1iy7lMZ663gGbXvvqlO/Rpeq/LLkvZtSwor
	4cqFF5JCwJ50z5Ynms9+oN1pThmz+xGjw1n4xQ1Qcdz3CEsOpm9ILzknYypcT9VLDJrN
	HFcUdTQ04Du7OflGcZERimrxeQyk7Xmx7Y59jOp7T8Kmwc3A0st+yh8noJITGxQOc4Jv
	JrU9VOrkoPgRS3sQ9kcvfrCX+VUE1R9sLQtzXpeBL562uxszY9M+ZksyiWN2lDd0NXx2
	6MNA==
MIME-Version: 1.0
Received: by 10.50.207.38 with SMTP id lt6mr1615661igc.55.1338559632835; Fri,
	01 Jun 2012 07:07:12 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Fri, 1 Jun 2012 07:07:12 -0700 (PDT)
In-Reply-To: <CAMKF1soREavpCfcGKqZM_hQwNVXydjzKg3qHRjTzJbP9Y-N5hg@mail.gmail.com>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
	<CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
	<CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
	<CAOHjBZvGY9BWkyS+9V4OtGFcQpCC2SdzKwG9pQ0wq_oeqU=uTw@mail.gmail.com>
	<CAMKF1so8aA=s7wfo9k9wGNSwyuGYXmd5Ec9x=5Bp0YJbaiJoFA@mail.gmail.com>
	<CAOHjBZvZmXugpmxypMamZbm1LYdOqTAp4Z+1CBPn1DyohjO3Yw@mail.gmail.com>
	<4FC7818E.3030704@mlbassoc.com>
	<CAOHjBZsD06ABMP5VRRcmXd-8jiF7VDD=UJUrswPJyGDqObPV2Q@mail.gmail.com>
	<CAMKF1soREavpCfcGKqZM_hQwNVXydjzKg3qHRjTzJbP9Y-N5hg@mail.gmail.com>
Date: Fri, 1 Jun 2012 16:07:12 +0200
Message-ID: <CAOHjBZtLxfsE6mMn3tQneJaTmAktGxbwGtsWqEbQ+vKJyLe_=g@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: target rpm build failure
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
X-List-Received-Date: Fri, 01 Jun 2012 14:17:34 -0000
Content-Type: multipart/alternative; boundary=14dae9340e696d05b204c169b32d

--14dae9340e696d05b204c169b32d
Content-Type: text/plain; charset=ISO-8859-1

Many thanks Khem,

I've applied your patches to my local repository.
Unfortunately the uclibc setup I'm using doesn't provide support for
mcheck, so I'm falling in the same error.
However I have in mind also to build the glibc version of the whole image
and so here I will haven't problem building rpm.

But regarding glibc support I can see there is eglibc support and not glibc.
I'm not deep informed about differencies, in oe-classis I had glibc and in
oe-core it seems not supported.
Please can you make light to this point?
I need glibc also, how can I obtain it?

Best Regards,
Giuseppe

2012/6/1 Khem Raj <raj.khem@gmail.com>

> On Thu, May 31, 2012 at 7:47 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
> > Have new suggestions?
>
> I found a bit of time and fixed rpm compilation on uclibc. Its only
> compiling though I don't know if it will run on target. Try it out.
> The patch is here
>
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=3b7ab8bbaca0c7ce122e897a11370dd215b0eddd
>
> This should get you going. Please test it out and I would prefer if you can
> also try it out on target and see if it really runs too.
>
> -Khem
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae9340e696d05b204c169b32d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Many thanks Khem,</div><div>=A0</div><div>I&#39;ve applied your patche=
s to my local repository.</div><div>Unfortunately the uclibc setup I&#39;m =
using doesn&#39;t provide support for mcheck, so I&#39;m falling in the sam=
e error.</div>
<div>However I have in mind also to build the glibc version of the whole im=
age and so here I will haven&#39;t problem building rpm.</div><div>=A0</div=
><div>But regarding glibc support I can see there is eglibc support and not=
 glibc.</div>
<div>I&#39;m not deep informed about differencies, in oe-classis I had glib=
c and in oe-core it seems not supported.</div><div>Please can you make ligh=
t to this point?</div><div>I need glibc also, how can I obtain it?</div>
<div>=A0</div><div>Best Regards,</div><div>Giuseppe<br><br></div><div class=
=3D"gmail_quote">2012/6/1 Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span><br>=
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
On Thu, May 31, 2012 at 7:47 AM, Giuseppe Condorelli<br>
&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gm=
ail.com</a>&gt; wrote:<br>
&gt; Have new suggestions?<br>
<br>
I found a bit of time and fixed rpm compilation on uclibc. Its only<br>
compiling though I don&#39;t know if it will run on target. Try it out.<br>
The patch is here<br>
<br>
<a href=3D"http://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dkraj/misc&amp;id=3D3b7ab8bbaca0c7ce122e897a11370dd215b0eddd" target=3D"_=
blank">http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkr=
aj/misc&amp;id=3D3b7ab8bbaca0c7ce122e897a11370dd215b0eddd</a><br>

<br>
This should get you going. Please test it out and I would prefer if you can=
<br>
also try it out on target and see if it really runs too.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-Khem<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--14dae9340e696d05b204c169b32d--
