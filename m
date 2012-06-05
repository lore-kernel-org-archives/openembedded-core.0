Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Sbo4p-00086O-99
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 09:21:15 +0200
Received: by yenl13 with SMTP id l13so3678064yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2012 00:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PRuonzkQKX6yZ8mN3a5ENWcOUmA0dLYdFxrOMVo/qUk=;
	b=ThP9QJ7lJ7Fl6ecjSX0WFJXzgEJL5lnDjtrqJKqAJgD1/17iVQ+q9fVaS/BKyk93Yy
	WxM3ezWVjGNsXPSNM09vJE8FwHG6PcohG56eSrrr3YW6aTc++ZWPF8yY1nWaQT5C45wy
	YeO2r1Cu9i+Rf83sBAflAJCVHGBfY2R8E9O090G80UqKIVLgzvBTkd6lIMG3R7sJUATW
	nvWEz1Y7VVWxyKpGMOcFqP6It7q+4Yxr9iMRSaR2vFxya09kd4O2xWYL2IEEBlEILTCX
	wOMmAfqPGdZ9mOhSWLoniXjZxfbB1I46Vkw6AdhgNszjj5YRtmip85wSGhd3PRPc1R/p
	C8Ig==
MIME-Version: 1.0
Received: by 10.50.187.201 with SMTP id fu9mr1076266igc.5.1338880248875; Tue,
	05 Jun 2012 00:10:48 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Tue, 5 Jun 2012 00:10:48 -0700 (PDT)
In-Reply-To: <CAMKF1sotQWH+E5+28gKXfRfLJ9mQUN3EQpe2sUziBgu1CXYiZQ@mail.gmail.com>
References: <CAOHjBZukor5Cy+2N-s0rFiiwR8Epp2vDaPuw7o5B4u-BMno3LQ@mail.gmail.com>
	<CAOHjBZvFwiq97xv2kf6OjvCbPUCmX5tQ0P5NjvWXb--97oVvgg@mail.gmail.com>
	<CAMKF1sotQWH+E5+28gKXfRfLJ9mQUN3EQpe2sUziBgu1CXYiZQ@mail.gmail.com>
Date: Tue, 5 Jun 2012 09:10:48 +0200
Message-ID: <CAOHjBZu8B-A3=HZpD7eQ2A0M8t0sD1ogFdMt5OkmfZduT2AgOA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libiconv/gettetxt circular dependency on eglibc
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
X-List-Received-Date: Tue, 05 Jun 2012 07:21:15 -0000
Content-Type: multipart/alternative; boundary=14dae9340a6fa18c1604c1b459ee

--14dae9340a6fa18c1604c1b459ee
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,

indeed my previous comment was too confused.
What I meant was that TARGET_OS was set to linux-uclibc and so I catched
the errors.
Now I set it to "linux" and libiconv is correctly provided by eglibc.
Sorry for the confusion and thanks as always.

Cheers,
Giuseppe

2012/6/4 Khem Raj <raj.khem@gmail.com>

> On Mon, Jun 4, 2012 at 1:33 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
> > Solved,
> > I missed to set TARGET_OS = "eglibc" leaving it to "uclibc", my previous
> > build...
>
> thats wrong. If you are using OE-Core then the variable to set it TCLIBC
> and TARGET_OS is usually not needed to set.
>
> and libiconv is internal to eglibc so when using eglibc it should
> provide the libiconv
> package.
>
> >
> > Cheers,
> > Giuseppe
> >
> > 2012/6/4 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
> >>
> >> Hi All,
> >>
> >> I'm falling in a circular dependency error between libiconv and gettext
> >> during eglibc build.
> >> libiconv (as set in tclibc-eglibc.inc) is set to "eglibc", so the recipe
> >> for libiconv shouldn't be included
> >> in the build list (it inherits gettext and gettext depends on libiconv).
> >> Please can you clarify this?
> >>
> >> Many thanks,
> >> Giuseppe
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae9340a6fa18c1604c1b459ee
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Khem,</div><div>=A0</div><div>indeed my previous comment was too co=
nfused.</div><div>What I meant was that TARGET_OS was set to linux-uclibc a=
nd so I catched the errors.</div><div>Now I set it to &quot;linux&quot; and=
 libiconv is correctly provided by eglibc.</div>
<div>Sorry for the confusion and thanks as always.</div><div>=A0</div><div>=
Cheers,</div><div>Giuseppe<br><br></div><div class=3D"gmail_quote">2012/6/4=
 Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im">On Mon, Jun 4, 2012 at 1:33 AM, Giuseppe=
 Condorelli<br>

&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gm=
ail.com</a>&gt; wrote:<br>
&gt; Solved,<br>
&gt; I missed to set TARGET_OS =3D &quot;eglibc&quot; leaving it to &quot;u=
clibc&quot;, my previous<br>
&gt; build...<br>
<br>
</div>thats wrong. If you are using OE-Core then the variable to set it TCL=
IBC<br>
and TARGET_OS is usually not needed to set.<br>
<br>
and libiconv is internal to eglibc so when using eglibc it should<br>
provide the libiconv<br>
package.<br>
<div class=3D"im"><br>
&gt;<br>
&gt; Cheers,<br>
&gt; Giuseppe<br>
&gt;<br>
&gt; 2012/6/4 Giuseppe Condorelli &lt;<a href=3D"mailto:giuseppe.condorelli=
@gmail.com">giuseppe.condorelli@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Hi All,<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m falling in a circular dependency error between libiconv an=
d gettext<br>
&gt;&gt; during eglibc build.<br>
&gt;&gt; libiconv (as set in tclibc-eglibc.inc) is set to &quot;eglibc&quot=
;, so the recipe<br>
&gt;&gt; for libiconv shouldn&#39;t be included<br>
&gt;&gt; in the build list (it inherits gettext and gettext depends on libi=
conv).<br>
&gt;&gt; Please can you clarify this?<br>
&gt;&gt;<br>
&gt;&gt; Many thanks,<br>
&gt;&gt; Giuseppe<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
&gt;<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br>

--14dae9340a6fa18c1604c1b459ee--
