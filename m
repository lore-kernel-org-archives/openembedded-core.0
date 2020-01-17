Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 809667FBE2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:04:24 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id u14so14766805vsu.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 05:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oxKIDQ0GnP8+JfGM7aLTlE2EFAmelIBGkaWobgHqn1Q=;
	b=SWdaCKdGMolCafPHltK09II+8+8SO+Vwo2ZE0ARp4BbEJaatZ644Rt7Px/foi0aB9p
	V5jXduIbWBvYB6FW+FEJAsTKz2VE+43rF+o/DZIgEtrtDkZgZnGvnqUB2eZsHy1f5Pdg
	eMh+5Ojt2fZNdw4W7NKbB6lMi/RozDSmR1jeLWd8pXMA5OK5ySbwn2GHymnJAz4qyyLr
	w6CFVQmjSZB0QRc3Hn2m3Dzk9d55X1lW1Cd+IxP/LLk8tIG8GMUi3uIPLOMIju7AgNPz
	oyDp1h37S3MjHZVI+4ElxcaEePl++cepu+wbSjraIByAtCQTBf2sAaEGYjkNNIv5u3gH
	u0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oxKIDQ0GnP8+JfGM7aLTlE2EFAmelIBGkaWobgHqn1Q=;
	b=qJqLPtHsaqJqNr9Lbiq+NlF0OKIvFKg/9Jyw+/TE9n3HjSC9jBULckKNAx5afTkAqc
	L3jDqbPksPk3eOO/VbZou+sYzu6HPwrxPKeoKPtj1mjMzKwtanV1cvD++uoJah7XcjPC
	L0f04PUyKFHds1RjWwsIlXS0o+7lJgm7p4X4pu2eav5s53cXtWSSaJY8N5lqF7duZlC9
	jUUCTVaiLer+WjhrGlo2KYzb0TQUmC2fgtcb0bhZsMEDUoRY5JVO+d9pR2KojW3hqffJ
	IpFU3yKxUYK0KGMO21bubHpzop3XGiMpNgeHM4weGhZq61Pysf9rY5clde/l+PrD1Eic
	fXAQ==
X-Gm-Message-State: APjAAAVsQoM7EYvyrKi1Abfg6DWC5J9v47Un9eW7l1Isw/pW0D9KG/iR
	CiKdX9S6NtDfKH3c+Jr9e2jcRLLwmuph8sn8ABg=
X-Google-Smtp-Source: APXvYqxOdH7EmUbcV7Cwe3bmA/cj3BZ4KIXeLP7Ur1AYQPKGRf4Qts/bs++4kk872iV1vnzLRfN9QC4uYbwGVndeCuA=
X-Received: by 2002:a67:314e:: with SMTP id x75mr4570781vsx.35.1579266265336; 
	Fri, 17 Jan 2020 05:04:25 -0800 (PST)
MIME-Version: 1.0
References: <1579244354-13596-1-git-send-email-sumit.garg@linaro.org>
	<b21d1a39c0c1e5585e72586ca806967bae37decf.camel@linuxfoundation.org>
	<CAFA6WYOm4a8_mqyNA+zkFHPznN10SyKb4atiCtmS=qabZzyM+A@mail.gmail.com>
	<CANNYZj9tcgw0KZeqZRQdL5etBdAEPP+S29S4YWkE94jhVQbLNw@mail.gmail.com>
	<CAFA6WYO-fHRo4e7aYr5V8QkNus6hB9=ZWjQ7snRRPEijU5oa6Q@mail.gmail.com>
In-Reply-To: <CAFA6WYO-fHRo4e7aYr5V8QkNus6hB9=ZWjQ7snRRPEijU5oa6Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Jan 2020 14:04:14 +0100
Message-ID: <CANNYZj-bN7uU-wASdvTKznrt=mtFdxSy5LLawHax8vNnCrMMdw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Fri, 17 Jan 2020 13:04:24 -0000
Content-Type: multipart/alternative; boundary="000000000000c04fac059c5594c3"

--000000000000c04fac059c5594c3
Content-Type: text/plain; charset="UTF-8"

You can send a patch for psmisc specifically for those stable branches,
using [branch name] in the subject.

Alex

On Fri, 17 Jan 2020 at 13:49, Sumit Garg <sumit.garg@linaro.org> wrote:

> On Fri, 17 Jan 2020 at 17:35, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > On Fri, 17 Jan 2020 at 12:55, Sumit Garg <sumit.garg@linaro.org> wrote:
> >>
> >> But looking at this failure again it seems like "autopoint" is
> >> provided by gettext rather than autotools. So yes, I think you are
> >> right and "xz-native" dependency should go in
> >> meta/classes/gettext.bbclass instead as follows:
> >>
> >> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> >> index be2ef3b311..443c9c4cb0 100644
> >> --- a/meta/classes/gettext.bbclass
> >> +++ b/meta/classes/gettext.bbclass
> >> @@ -2,8 +2,8 @@ def gettext_dependencies(d):
> >>      if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d,
> >> 'cross-canadian'):
> >>          return ""
> >>      if d.getVar('USE_NLS') == 'no':
> >> -        return "gettext-minimal-native"
> >> -    return "gettext-native"
> >> +        return "gettext-minimal-native xz-native"
> >> +    return "gettext-native xz-native"
> >
> >
> > I don't believe this is right either, at least not for the master
> branch. Autopoint is specifically excluded for all autotools-based recipes;
> psmisc used to be an exception to that, but no longer is with the latest
> master branch and latest gettext.
> >
>
> How would you like to handle it on stable branches for recipes (like
> psmisc) which depends on autopoint?
>
> -Sumit
>
> > Alex
>

--000000000000c04fac059c5594c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You can send a patch for psmisc specifically for thos=
e stable branches, using [branch name] in the subject. <br></div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, 17 Jan 2020 at 13:49, Sumit Garg &lt;<a hre=
f=3D"mailto:sumit.garg@linaro.org">sumit.garg@linaro.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 17 Jan 2020=
 at 17:35, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 17 Jan 2020 at 12:55, Sumit Garg &lt;<a href=3D"mailto:sumit.g=
arg@linaro.org" target=3D"_blank">sumit.garg@linaro.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; But looking at this failure again it seems like &quot;autopoint&qu=
ot; is<br>
&gt;&gt; provided by gettext rather than autotools. So yes, I think you are=
<br>
&gt;&gt; right and &quot;xz-native&quot; dependency should go in<br>
&gt;&gt; meta/classes/gettext.bbclass instead as follows:<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.b=
bclass<br>
&gt;&gt; index be2ef3b311..443c9c4cb0 100644<br>
&gt;&gt; --- a/meta/classes/gettext.bbclass<br>
&gt;&gt; +++ b/meta/classes/gettext.bbclass<br>
&gt;&gt; @@ -2,8 +2,8 @@ def gettext_dependencies(d):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if d.getVar(&#39;INHIBIT_DEFAULT_DEPS&#39;) an=
d not oe.utils.inherits(d,<br>
&gt;&gt; &#39;cross-canadian&#39;):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if d.getVar(&#39;USE_NLS&#39;) =3D=3D &#39;no&=
#39;:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;gettext-minimal-native&q=
uot;<br>
&gt;&gt; -=C2=A0 =C2=A0 return &quot;gettext-native&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;gettext-minimal-native x=
z-native&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 return &quot;gettext-native xz-native&quot;<br>
&gt;<br>
&gt;<br>
&gt; I don&#39;t believe this is right either, at least not for the master =
branch. Autopoint is specifically excluded for all autotools-based recipes;=
 psmisc used to be an exception to that, but no longer is with the latest m=
aster branch and latest gettext.<br>
&gt;<br>
<br>
How would you like to handle it on stable branches for recipes (like<br>
psmisc) which depends on autopoint?<br>
<br>
-Sumit<br>
<br>
&gt; Alex<br>
</blockquote></div>

--000000000000c04fac059c5594c3--
