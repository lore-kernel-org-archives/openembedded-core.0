Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SaTOl-0001vf-Id
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 17:04:20 +0200
Received: by yhjj56 with SMTP id j56so1740031yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0mdyoYzzTFHG7mUL14z7viNUwuJ03CUGXfaH0blqOmc=;
	b=tM6D75D9be0oZ9WZGqBGIEYn+gnIyJukVX2B2NPbbfMc98GhmexUfF13keRdZXvAWO
	Jzj41H0AmoILqXPqy7Qd7MWRU4BUDju2kNWvh0EkokZPC64eSDJrYDcvNac3gcYI6idJ
	m24mO0vCc3730y3e2MJcWfOvpTuZ9mcghtP4DKf+5qNTKxsQN9gd5FHZYLNFwodmhP52
	llLiHQbfXm+gOaGXcut2olxTOxPGsHe4lvCoClKe/4eHQBcm27BD4dQ7No5j/LCvZAS/
	a9+5AJJuzM1TBG3DOR49NFIYoUDzNAyyWGaT024Zjmg6zms9PiGD9RAzPd2Pqfj8exxE
	XSEA==
MIME-Version: 1.0
Received: by 10.50.208.34 with SMTP id mb2mr1899713igc.5.1338562437635; Fri,
	01 Jun 2012 07:53:57 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Fri, 1 Jun 2012 07:53:57 -0700 (PDT)
In-Reply-To: <CAMKF1spJ68Dv414SL4c42ntSL_wBbUVrZRNNUJw29tvFh5HTRQ@mail.gmail.com>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
	<CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
	<CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
	<CAOHjBZvGY9BWkyS+9V4OtGFcQpCC2SdzKwG9pQ0wq_oeqU=uTw@mail.gmail.com>
	<CAMKF1so8aA=s7wfo9k9wGNSwyuGYXmd5Ec9x=5Bp0YJbaiJoFA@mail.gmail.com>
	<CAOHjBZvZmXugpmxypMamZbm1LYdOqTAp4Z+1CBPn1DyohjO3Yw@mail.gmail.com>
	<4FC7818E.3030704@mlbassoc.com>
	<CAOHjBZsD06ABMP5VRRcmXd-8jiF7VDD=UJUrswPJyGDqObPV2Q@mail.gmail.com>
	<CAMKF1soREavpCfcGKqZM_hQwNVXydjzKg3qHRjTzJbP9Y-N5hg@mail.gmail.com>
	<CAOHjBZtLxfsE6mMn3tQneJaTmAktGxbwGtsWqEbQ+vKJyLe_=g@mail.gmail.com>
	<CAMKF1spJ68Dv414SL4c42ntSL_wBbUVrZRNNUJw29tvFh5HTRQ@mail.gmail.com>
Date: Fri, 1 Jun 2012 16:53:57 +0200
Message-ID: <CAOHjBZvgSimGJk237WwOeoii9CM0FOcp3fA2=7GHsbenC-TSyQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Jun 2012 15:04:20 -0000
Content-Type: multipart/alternative; boundary=14dae9340cad9adc6204c16a5a7c

--14dae9340cad9adc6204c16a5a7c
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,
2012/6/1 Khem Raj <raj.khem@gmail.com>

> On Fri, Jun 1, 2012 at 7:07 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
> > Many thanks Khem,
> >
> > I've applied your patches to my local repository.
> > Unfortunately the uclibc setup I'm using doesn't provide support for
> mcheck,
> > so I'm falling in the same error.
>
> hmm strange. Are you using OE-Core provided uclibc or something else ?
> I could compile rpm successfully after I used the patch
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=44ecbebf17d18471becaccd37733e6b0e806c80d
>
> No I don't, I'm using an own uclibc included as new recipe in the meta
layer I've created for my scope.
I'll have to extend it supporting mcheck.


> > However I have in mind also to build the glibc version of the whole image
> > and so here I will haven't problem building rpm.
> >
> > But regarding glibc support I can see there is eglibc support and not
> glibc.
> > I'm not deep informed about differencies, in oe-classis I had glibc and
> in
> > oe-core it seems not supported.
> > Please can you make light to this point?
> > I need glibc also, how can I obtain it?
>
> well there are no differences as far as ABI is concerned. eglibc has
> additional bit to help cross building
> and testing rest it is glibc only. You should be fine using eglibc
> version provided by OE-Core and it should interoperate well
> with glibc based system
>
>
That's great.

Cheers,
Giuseppe

>
>
>
> > Best Regards,
> > Giuseppe
> >
> > 2012/6/1 Khem Raj <raj.khem@gmail.com>
> >>
> >> On Thu, May 31, 2012 at 7:47 AM, Giuseppe Condorelli
> >> <giuseppe.condorelli@gmail.com> wrote:
> >> > Have new suggestions?
> >>
> >> I found a bit of time and fixed rpm compilation on uclibc. Its only
> >> compiling though I don't know if it will run on target. Try it out.
> >> The patch is here
> >>
> >>
> >>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=3b7ab8bbaca0c7ce122e897a11370dd215b0eddd
> >>
> >> This should get you going. Please test it out and I would prefer if you
> >> can
> >> also try it out on target and see if it really runs too.
> >>
> >> -Khem
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
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

--14dae9340cad9adc6204c16a5a7c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem,<br><div class=3D"gmail_quote">2012/6/1 Khem Raj <span dir=3D"ltr">=
&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a>&gt;</span><br><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding=
-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-l=
eft-style:solid" class=3D"gmail_quote">
<div class=3D"im">On Fri, Jun 1, 2012 at 7:07 AM, Giuseppe Condorelli<br>
&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gm=
ail.com</a>&gt; wrote:<br>
&gt; Many thanks Khem,<br>
&gt;<br>
&gt; I&#39;ve applied your patches to my local repository.<br>
&gt; Unfortunately the uclibc setup I&#39;m using doesn&#39;t provide suppo=
rt for mcheck,<br>
&gt; so I&#39;m falling in the same error.<br>
<br>
</div>hmm strange. Are you using OE-Core provided uclibc or something else =
?<br>
I could compile rpm successfully after I used the patch<br>
<a href=3D"http://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dkraj/misc&amp;id=3D44ecbebf17d18471becaccd37733e6b0e806c80d" target=3D"_=
blank">http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkr=
aj/misc&amp;id=3D44ecbebf17d18471becaccd37733e6b0e806c80d</a><br>

<div class=3D"im"><br></div></blockquote><div>No I don&#39;t, I&#39;m using=
 an own uclibc included as=A0new=A0recipe in the meta layer I&#39;ve=A0crea=
ted for my scope.</div><div>I&#39;ll have to extend it supporting mcheck.=
=A0</div>
<div>=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1e=
x;border-left-color:rgb(204,204,204);border-left-width:1px;border-left-styl=
e:solid" class=3D"gmail_quote"><div class=3D"im">
&gt; However I have in mind also to build the glibc version of the whole im=
age<br>
&gt; and so here I will haven&#39;t problem building rpm.<br>
&gt;<br>
&gt; But regarding glibc support I can see there is eglibc support and not =
glibc.<br>
&gt; I&#39;m not deep informed about differencies, in oe-classis I had glib=
c and in<br>
&gt; oe-core it seems not supported.<br>
&gt; Please can you make light to this point?<br>
&gt; I need glibc also, how can I obtain it?<br>
<br>
</div></blockquote><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-le=
ft:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-left=
-style:solid" class=3D"gmail_quote">well there are no differences as far as=
 ABI is concerned. eglibc has<br>

additional bit to help cross building<br>
and testing rest it is glibc only. You should be fine using eglibc<br>
version provided by OE-Core and it should interoperate well<br>
with glibc based system<br>
<div class=3D"HOEnZb"><div class=3D"h5">=A0</div></div></blockquote><div>Th=
at&#39;s great.=A0</div><div>=A0</div><div>Cheers,</div><div>Giuseppe</div>=
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
<div class=3D"HOEnZb"><div class=3D"h5">=A0</div></div></blockquote><blockq=
uote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:r=
gb(204,204,204);border-left-width:1px;border-left-style:solid" class=3D"gma=
il_quote">
<div class=3D"HOEnZb"><div class=3D"h5">
&gt;<br>
&gt; Best Regards,<br>
&gt; Giuseppe<br>
&gt;<br>
&gt; 2012/6/1 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@g=
mail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Thu, May 31, 2012 at 7:47 AM, Giuseppe Condorelli<br>
&gt;&gt; &lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.cond=
orelli@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; Have new suggestions?<br>
&gt;&gt;<br>
&gt;&gt; I found a bit of time and fixed rpm compilation on uclibc. Its onl=
y<br>
&gt;&gt; compiling though I don&#39;t know if it will run on target. Try it=
 out.<br>
&gt;&gt; The patch is here<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"http://git.openembedded.org/openembedded-core-contrib/c=
ommit/?h=3Dkraj/misc&amp;id=3D3b7ab8bbaca0c7ce122e897a11370dd215b0eddd" tar=
get=3D"_blank">http://git.openembedded.org/openembedded-core-contrib/commit=
/?h=3Dkraj/misc&amp;id=3D3b7ab8bbaca0c7ce122e897a11370dd215b0eddd</a><br>

&gt;&gt;<br>
&gt;&gt; This should get you going. Please test it out and I would prefer i=
f you<br>
&gt;&gt; can<br>
&gt;&gt; also try it out on target and see if it really runs too.<br>
&gt;&gt;<br>
&gt;&gt; -Khem<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/ope=
nembedded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailma=
n/listinfo/openembedded-core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
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
</div></div></blockquote></div><br>

--14dae9340cad9adc6204c16a5a7c--
