Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id B82687E478
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 00:18:53 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e5so266395iok.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 17:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sUsDjEgcYGL+FhxR9j+rHDIM6rVsmSWEICFu1JPedvo=;
	b=MVHFurv1KPL3uc6roiRBrvt6OVdB+lOxhHXwmB/JOS2iSs5qWrdlK3NC/W7L0Q7DhY
	arvsOJ/JyxzB6bU8klrCUHH4OP1+myZhECOpxwPi1emnDog3vukUV9Ao0Mp+UaFRteQI
	zOwp+G5oQ92MHnj8U2JqSrqLNlb8j0TgpgADVlXNS9S+OZq0Hbd0oqaQ5ppDk1iN/lOu
	/xhRDdeKogDVi2PgNjWDXHhek+vLKvulGJXDbFX6zLTYkADFmC+1bxSTWSsaA+jAh6XZ
	psd75SNF2k2CpOktwyDu1n/XNeUXw9bHSywU5UrbL0KIanGOxjhUfC9w5b0+8KaPT8Mw
	LB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sUsDjEgcYGL+FhxR9j+rHDIM6rVsmSWEICFu1JPedvo=;
	b=UqHMsgkGe8Yp24E4IfNUnMLF9aV49um5eaLeJ9889xjtn+LoWM1DP7NKZW975aqdkY
	L+c3Qqoyo/063AuQDFYVp2KupX9jXl41YAedy2iSKmJZ8d+FBh5ebfS5dVuoL6sxTN2A
	nqbHl64byfYBaAnnaGlgKTUR7GGBgH4NIJ0xlgSwPXcCjhTUg8brDppP02pcHfcMyx5W
	ykho4qPTD5fQK1/Kw6Q3RpKnNSGaq2oLi4Qy50hDOsaRCFT4VzjwujAmhF7qXj1bH+Ba
	NHe3DuCGB5c48GJgyhW/GTTWpKcMLmDc5rD0YQPOknoNcbss/1gCX3USM8bDBEzmTV9g
	zfPg==
X-Gm-Message-State: APjAAAWBW2Rr7Rsenfvh8YfIJUBWDwj0PrMwaBErjHANKXnL25Ju2kKS
	ZTzSIbfGwUGVXZzqBYm9zAWv6XbioBoitpWWQZw=
X-Google-Smtp-Source: APXvYqx6yHX3LylYKbO+kP11lyllQrdVUR76ZIpxg2Yb6+T6GcCvEejgV24NG6kTeBbXBfX28a+OrRSsvUvZf9MV+4A=
X-Received: by 2002:a02:ce52:: with SMTP id y18mr4193450jar.78.1561076334814; 
	Thu, 20 Jun 2019 17:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
	<CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
In-Reply-To: <CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 20 Jun 2019 17:18:43 -0700
Message-ID: <CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] scons.bbclass: use python3-scons
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
X-List-Received-Date: Fri, 21 Jun 2019 00:18:54 -0000
Content-Type: multipart/alternative; boundary="000000000000676977058bca68ff"

--000000000000676977058bca68ff
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 20, 2019 at 6:37 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Jun 7, 2019 at 5:50 PM Tim Orling
> <timothy.t.orling@linux.intel.com> wrote:
> >
> > SCons has supported python3 since 3.0.0 release, use it.
> >
> > [YOCTO #13381]
> >
> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> > ---
> >  meta/classes/scons.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
> > index 9ee7d1587d..a8ddae35f7 100644
> > --- a/meta/classes/scons.bbclass
> > +++ b/meta/classes/scons.bbclass
> > @@ -1,4 +1,4 @@
> > -DEPENDS += "python-scons-native"
> > +DEPENDS += "python3-scons-native"
> >
>
> some packages haven't upgraded to py3 but use scons see
> https://errors.yoctoproject.org/Errors/Details/249271/
>


Thank you for reporting this. I was of course expecting some breakage and
am committed to fixes. Please do report any other issues.

Latest mongo release appears to be 4.3.0 and appears to support python3:

https://github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555d83e0f/SConstruct

Is this an aceptable upgrade? I am not savvy on which versions are
desirable.


> >  EXTRA_OESCONS ?= ""
> >
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000676977058bca68ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jun 20, 2019 at 6:37 AM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Fri, Jun 7, 2019 at 5:50 PM Tim Orling<br>
&lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank">t=
imothy.t.orling@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; SCons has supported python3 since 3.0.0 release, use it.<br>
&gt;<br>
&gt; [YOCTO #13381]<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linux=
.intel.com" target=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/scons.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass<b=
r>
&gt; index 9ee7d1587d..a8ddae35f7 100644<br>
&gt; --- a/meta/classes/scons.bbclass<br>
&gt; +++ b/meta/classes/scons.bbclass<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -DEPENDS +=3D &quot;python-scons-native&quot;<br>
&gt; +DEPENDS +=3D &quot;python3-scons-native&quot;<br>
&gt;<br>
<br>
some packages haven&#39;t upgraded to py3 but use scons see<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/249271/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/249271/</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Thank you for reporting this. I was of course expecting some br=
eakage and am committed to fixes. Please do report any other issues.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Latest mongo release appears t=
o be 4.3.0 and appears to support python3:</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div><a href=3D"https://github.com/mongodb/mongo/blob/89=
e7419a897b2270931c9c029abf6de555d83e0f/SConstruct">https://github.com/mongo=
db/mongo/blob/89e7419a897b2270931c9c029abf6de555d83e0f/SConstruct</a></div>=
<br></div><div dir=3D"auto">Is this an aceptable upgrade? I am not savvy on=
 which versions are desirable.</div><div dir=3D"auto"><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><br>
&gt;=C2=A0 EXTRA_OESCONS ?=3D &quot;&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000676977058bca68ff--
