Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vijaykumar.pulluri@gmail.com>) id 1S8VtN-0002mY-U4
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 13:04:22 +0100
Received: by vcbfl13 with SMTP id fl13so4721430vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 04:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=P87A2Mjzb96H7QzbBeoUs6IisZNcOMCHxfvgdJkRY4A=;
	b=MhY91BXGh119kPOo+4cfI2vzh8JSguh+RdQeDbyvdGdXQtxc+/zz1qpgkVjOH7v8e+
	eWq5oZKqYP748NY/csJhDfVd95EIv8QtYOxVm4Gz4yTKOUSC4IxgmNuAjE2pr0rj8vKN
	DLDg1fAhqtEVIV6kFjKj2RQ/KJd79JiimyVP5LPGWaUOJbIMwgc+nzcTSQ7gg+kgyVMX
	X3aNHtGUebbja8QGJ35onbFWmX6to/9JygZrsJOx4cSNu450QsYWtMb+u7BSH0tkd277
	3FsUD4nqECpm1odEpQkYl87fKGdve6Dkt7YP6GKI+u2ZUssXAzr2pbLF3NHPciPY8b63
	ZZtw==
MIME-Version: 1.0
Received: by 10.220.141.145 with SMTP id m17mr138315vcu.38.1331898933910; Fri,
	16 Mar 2012 04:55:33 -0700 (PDT)
Received: by 10.52.158.202 with HTTP; Fri, 16 Mar 2012 04:55:33 -0700 (PDT)
In-Reply-To: <1481997.vT15FBqihJ@helios>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<665936693.QMobc8r8oH@helios> <4F62875C.60303@opendreambox.org>
	<1481997.vT15FBqihJ@helios>
Date: Fri, 16 Mar 2012 17:25:33 +0530
Message-ID: <CAD=xvPuzd-S-kf-5Ns_95J8Sjpo=S0ygY7VnZtvMx3ppfP8UVg@mail.gmail.com>
From: VIJAY KUMAR <vijaykumar.pulluri@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] scripts/bitbake: ensure user is in build directory
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
X-List-Received-Date: Fri, 16 Mar 2012 12:04:22 -0000
Content-Type: multipart/alternative; boundary=f46d043be050d51bc204bb5ae2db

--f46d043be050d51bc204bb5ae2db
Content-Type: text/plain; charset=ISO-8859-1

Hi paul,

   Iam not specialist in this. I am just following the steps mentioned here

     http://icedtea.classpath.org/wiki/CrossCompileOECoreTutorial

I am building from this path  vj@ubuntu:/host/coreembedded/oe-core/build$
and it contains pseudodone file.

and in vj@ubuntu:/host/coreembedded/oe-core/build/conf local.conf exits..

and the same is calling bitbake which is present in scripts..

Regards,
VJ

On Fri, Mar 16, 2012 at 4:26 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Friday 16 March 2012 01:20:44 Andreas Oberritter wrote:
> > Sorry, I messed up some details. In fact, pseudo-native doesn't get
> > rebuilt, but bitbake pseudo-native still gets executed for every
> > machine, unless $BUILDDIR/pseudodone is present and contains
> > PSEUDOBINDIR. This just wastes time and confuses users who receive a
> > message saying "Pseudo is not present but is required, building this
> > first before the main build".
>
> It takes a small amount of time just once. However if this is really an
> issue
> perhaps we could address it directly rather than hacking around it?
>
> > >> BUILDDIR doesn't seem to have any other use than pointing to the
> > >> 'pseudodone' file. I don't understand why it's required to run bitbake
> > >> from there.
> > >
> > > Well, it's required that bitbake is run from the build directory and
> when
> > > you use the setup script as intended that's where BUILDDIR points to. I
> > > hadn't anticipated that anyone would be changing BUILDDIR to point to
> > > anything other than the build dir, however I don't really think it's a
> > > good idea to support that.
> >
> > That's because BUILDDIR has no meaning outside oe-core's setup scripts.
> > In scripts/bitbake, BUILDDIR would better be called PSEUDODONEDIR or
> > similar, because that's what the variable really means in this context
>
> The naming is such that it should point to the build directory because
> that's
> where pseudodone is meant to be written. I think when it was introduced
> there
> was an idea that it might be useful in other contexts, thus the naming.
>
> > In order to verify that scripts/bitbake is called from the build
> > directory, you could as well just check whether $PWD/conf/local.conf
> exists.
>
> Unfortunately it's not that simple. bitbake.conf pulls in local.conf using
> "include" and not "require", thus it doesn't actually have to exist
> anywhere.
>
> > I'm not using oe-core's scripts, because they make assumptions about the
> > directory layout that don't fit my project's needs. I think they are
> > overly complex
>
> Could you perhaps elaborate on what needs those scripts are not fulfilling?
>
> > and they display texts that seem to suit yocto's needs but at least not
> > mine.
>
> We print these messages so that people know what to do and where to find
> further information. I don't think that's unreasonable. However if you have
> suggestions on how we might improve those messages or allow them to be
> customised if necessary, we could look at changing them.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d043be050d51bc204bb5ae2db
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi paul,<br><br>=A0=A0 Iam not specialist in this. I am just following the =
steps mentioned here<br><br>=A0=A0=A0=A0 <a href=3D"http://icedtea.classpat=
h.org/wiki/CrossCompileOECoreTutorial">http://icedtea.classpath.org/wiki/Cr=
ossCompileOECoreTutorial</a><br>
<br>I am building from this path=A0 vj@ubuntu:/host/coreembedded/oe-core/bu=
ild$ and it contains pseudodone file.<br><br>and in vj@ubuntu:/host/coreemb=
edded/oe-core/build/conf local.conf exits..<br><br>and the same is calling =
bitbake which is present in scripts..<br>
<br>Regards,<br>VJ<br><br><div class=3D"gmail_quote">On Fri, Mar 16, 2012 a=
t 4:26 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggle=
ton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
On Friday 16 March 2012 01:20:44 Andreas Oberritter wrote:<br>
&gt; Sorry, I messed up some details. In fact, pseudo-native doesn&#39;t ge=
t<br>
&gt; rebuilt, but bitbake pseudo-native still gets executed for every<br>
&gt; machine, unless $BUILDDIR/pseudodone is present and contains<br>
&gt; PSEUDOBINDIR. This just wastes time and confuses users who receive a<b=
r>
&gt; message saying &quot;Pseudo is not present but is required, building t=
his<br>
&gt; first before the main build&quot;.<br>
<br>
It takes a small amount of time just once. However if this is really an iss=
ue<br>
perhaps we could address it directly rather than hacking around it?<br>
<br>
&gt; &gt;&gt; BUILDDIR doesn&#39;t seem to have any other use than pointing=
 to the<br>
&gt; &gt;&gt; &#39;pseudodone&#39; file. I don&#39;t understand why it&#39;=
s required to run bitbake<br>
&gt; &gt;&gt; from there.<br>
&gt; &gt;<br>
&gt; &gt; Well, it&#39;s required that bitbake is run from the build direct=
ory and when<br>
&gt; &gt; you use the setup script as intended that&#39;s where BUILDDIR po=
ints to. I<br>
&gt; &gt; hadn&#39;t anticipated that anyone would be changing BUILDDIR to =
point to<br>
&gt; &gt; anything other than the build dir, however I don&#39;t really thi=
nk it&#39;s a<br>
&gt; &gt; good idea to support that.<br>
&gt;<br>
&gt; That&#39;s because BUILDDIR has no meaning outside oe-core&#39;s setup=
 scripts.<br>
&gt; In scripts/bitbake, BUILDDIR would better be called PSEUDODONEDIR or<b=
r>
&gt; similar, because that&#39;s what the variable really means in this con=
text<br>
<br>
The naming is such that it should point to the build directory because that=
&#39;s<br>
where pseudodone is meant to be written. I think when it was introduced the=
re<br>
was an idea that it might be useful in other contexts, thus the naming.<br>
<br>
&gt; In order to verify that scripts/bitbake is called from the build<br>
&gt; directory, you could as well just check whether $PWD/conf/local.conf e=
xists.<br>
<br>
Unfortunately it&#39;s not that simple. bitbake.conf pulls in local.conf us=
ing<br>
&quot;include&quot; and not &quot;require&quot;, thus it doesn&#39;t actual=
ly have to exist anywhere.<br>
<br>
&gt; I&#39;m not using oe-core&#39;s scripts, because they make assumptions=
 about the<br>
&gt; directory layout that don&#39;t fit my project&#39;s needs. I think th=
ey are<br>
&gt; overly complex<br>
<br>
Could you perhaps elaborate on what needs those scripts are not fulfilling?=
<br>
<br>
&gt; and they display texts that seem to suit yocto&#39;s needs but at leas=
t not<br>
&gt; mine.<br>
<br>
We print these messages so that people know what to do and where to find<br=
>
further information. I don&#39;t think that&#39;s unreasonable. However if =
you have<br>
suggestions on how we might improve those messages or allow them to be<br>
customised if necessary, we could look at changing them.<br>
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br>

--f46d043be050d51bc204bb5ae2db--
