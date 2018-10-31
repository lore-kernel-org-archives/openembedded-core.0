Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA2479D4F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 16:56:53 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c1-v6so14247184ede.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 09:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NjPNRVAG0UF0k7CghjHqoGUN7OFc4/0RUgkt3oGdx+E=;
	b=j5o3n8qAJejbbhKGrGbfAtvXSu0B+6CW8fE0nqTl2POiHrROElFCztAR7quFC+4Eds
	5MMP1Qyp85Wb8XP6vkOgjBXN6il3W72MNgp80CXSL24T3QiULsWrdJ43ErEq+pua9FC3
	sXAS3OAR1BDqQGO7mQxajZv5Fsa/gOWkmXtG3Pyni930Zr+g+wWe93/XaMiz3cjC53vp
	xtHmh2khSBkJ0jdLBOaqiPPpqY+c+i9hvp68sQED5bqQWFosT9HJWBMptDtT2bfAK0Bs
	4Kp1TbtNL/u52SAtbv72XVl49FK5VkRKnkvqKcYQ8QM2O+nGWNRXGrLUVmvYNGVsPgvh
	S2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NjPNRVAG0UF0k7CghjHqoGUN7OFc4/0RUgkt3oGdx+E=;
	b=rG+qWXOxBBLuKUpMPeKe9vM5O7TPFjLoMlfwUYoyrTYSTdfBe33bdDPC8GCusQAwaX
	2/Qcv1uGMn6mQQZtc7nWjawOJGKoJSJiCqgBXwKRueNO7MDKWPNILyIydYgcedqR9TQ0
	53297dRqN/620K2W7ZybK1MjZY5Xe4TkWYmBnmRJ345I6o9bl9s/pi1wkxrt32sZNywS
	6Ft0+S0B+Nrz+NFvPfAyXrXna086zBYSsJq1dLLUyroJTno5/IJskOJ9htbh4ByONWvP
	gjUimKsOX+YFeRIVz0Dy5m9xOrs9XG53a6T0jkb8d/9hOZvBJFtWieZfBgqW9vmfP34F
	XJOQ==
X-Gm-Message-State: AGRZ1gJrmJXhwNE7bCYO+gCrL7sezG+a2CPZXDdARvH3q5DtYWjjl8hx
	nQCtktvgHX11iF694GD/f0cZ+9UDCo5ca7aDDQ8=
X-Google-Smtp-Source: AJdET5ekccpvYhbMsyqQ2yfU81PjU3op6LzV4J/0VDbIUJjt6+pBEl7DRVs7Kzos+jXSdqmwXOsA/OEPXGL9XDtglAE=
X-Received: by 2002:a17:906:b7d1:: with SMTP id
	fy17-v6mr2063394ejb.70.1541005014210; 
	Wed, 31 Oct 2018 09:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <2829165.0Ht5z2aexs@localhost.localdomain>
	<CAFNP8OvFy2n7SMe5de66EcdM3URFm-b+dpcqS09hW0CMa9rNaA@mail.gmail.com>
	<25f056c7-d6ba-499f-8bf4-b8d1470fff4b@gmail.com>
	<CAFNP8Otrxa9Zaxb=hMdZrFe-OvUcbf1noC-bMLhmzEj-CUa7CQ@mail.gmail.com>
	<78c58d5e96a03191114ccf8376344097@basmevissen.nl>
In-Reply-To: <78c58d5e96a03191114ccf8376344097@basmevissen.nl>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 31 Oct 2018 09:56:42 -0700
Message-ID: <CAFNP8OsQts3BZMDzLH68qQwMzPMo6ZSjCYwM3SirPpqaYNSqAg@mail.gmail.com>
To: abuse@basmevissen.nl
Cc: yocto.user.mailinglist@gmail.com,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto discussion list <yocto@yoctoproject.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [yocto] 2.6 migration guide
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
X-List-Received-Date: Wed, 31 Oct 2018 16:56:54 -0000
Content-Type: multipart/alternative; boundary="000000000000781c910579893059"

--000000000000781c910579893059
Content-Type: text/plain; charset="UTF-8"

Got it, thanks.

On Wed, Oct 31, 2018 at 9:02 AM Bas Mevissen <abuse@basmevissen.nl> wrote:

> On 2018-10-31 16:50, Scott Rifenbark wrote:
>
> > Can you tell me why "123456" is also not removed?  That string contains
> > instances of "123" and "456"
>
>
> Because it removes all occurrences of the list value "123" and not of
> value "123456" or any part of it. Otherwise, it would be impossible to
> use this function to only remove, say, "1" from a long list of numbers.
> (here 'value' is not limited to a number).
>
> -- Bas.
>
> >
> > Thanks,
> > Scott
> >
> > On Wed, Oct 31, 2018 at 12:15 AM Robert Berger
> > <yocto.user.mailinglist@gmail.com> wrote:
> >
> >> Hi Scott,
> >>
> >> On 31.10.18 00:06, Scott Rifenbark wrote:
> >>>
> >>> I have an initial section at
> >>>
> https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#moving-to-the-yocto-project-2.6-release
> ,
> >>> which is based on Richard's input.  I am sure there are more items.
> >>
> >> You might want to add a link to the bitbake manual or some example
> >> from
> >> there for the new functionality of _remove operator:
> >>
> >>
> http://git.openembedded.org/bitbake/tree/doc/bitbake-user-manual/bitbake-user-manual-metadata.xml?id=c0a23dd9155c50a6b7df796980bc7b612cac7994#n334
> >>
> >> FOO = "123 456 789 123456 123 456 123 456"
> >> FOO_remove = "123"
> >> FOO_remove = "456"
> >>
> >> FOO is now: "  789 123456    " instead of "789 123456"
> >>
> >>>
> >>> Thanks,
> >>> Scott
> >>
> >> Regards,
> >>
> >> Robert
>
>
>

--000000000000781c910579893059
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got it, thanks. <br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Wed, Oct 31, 2018 at 9:02 AM Bas Mevissen &lt;<a href=3D=
"mailto:abuse@basmevissen.nl">abuse@basmevissen.nl</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 2018-10-31 16:50, Scott Rifenbark wrote:<=
br>
<br>
&gt; Can you tell me why &quot;123456&quot; is also not removed?=C2=A0 That=
 string contains <br>
&gt; instances of &quot;123&quot; and &quot;456&quot;<br>
<br>
<br>
Because it removes all occurrences of the list value &quot;123&quot; and no=
t of <br>
value &quot;123456&quot; or any part of it. Otherwise, it would be impossib=
le to <br>
use this function to only remove, say, &quot;1&quot; from a long list of nu=
mbers. <br>
(here &#39;value&#39; is not limited to a number).<br>
<br>
-- Bas.<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Scott<br>
&gt; <br>
&gt; On Wed, Oct 31, 2018 at 12:15 AM Robert Berger <br>
&gt; &lt;<a href=3D"mailto:yocto.user.mailinglist@gmail.com" target=3D"_bla=
nk">yocto.user.mailinglist@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi Scott,<br>
&gt;&gt; <br>
&gt;&gt; On 31.10.18 00:06, Scott Rifenbark wrote:<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; I have an initial section at<br>
&gt;&gt;&gt; <a href=3D"https://yoctoproject.org/docs/2.6/ref-manual/ref-ma=
nual.html#moving-to-the-yocto-project-2.6-release" rel=3D"noreferrer" targe=
t=3D"_blank">https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#m=
oving-to-the-yocto-project-2.6-release</a>,<br>
&gt;&gt;&gt; which is based on Richard&#39;s input.=C2=A0 I am sure there a=
re more items.<br>
&gt;&gt; <br>
&gt;&gt; You might want to add a link to the bitbake manual or some example=
 <br>
&gt;&gt; from<br>
&gt;&gt; there for the new functionality of _remove operator:<br>
&gt;&gt; <br>
&gt;&gt; <a href=3D"http://git.openembedded.org/bitbake/tree/doc/bitbake-us=
er-manual/bitbake-user-manual-metadata.xml?id=3Dc0a23dd9155c50a6b7df796980b=
c7b612cac7994#n334" rel=3D"noreferrer" target=3D"_blank">http://git.openemb=
edded.org/bitbake/tree/doc/bitbake-user-manual/bitbake-user-manual-metadata=
.xml?id=3Dc0a23dd9155c50a6b7df796980bc7b612cac7994#n334</a><br>
&gt;&gt; <br>
&gt;&gt; FOO =3D &quot;123 456 789 123456 123 456 123 456&quot;<br>
&gt;&gt; FOO_remove =3D &quot;123&quot;<br>
&gt;&gt; FOO_remove =3D &quot;456&quot;<br>
&gt;&gt; <br>
&gt;&gt; FOO is now: &quot;=C2=A0 789 123456=C2=A0 =C2=A0 &quot; instead of=
 &quot;789 123456&quot;<br>
&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; Scott<br>
&gt;&gt; <br>
&gt;&gt; Regards,<br>
&gt;&gt; <br>
&gt;&gt; Robert<br>
<br>
<br>
</blockquote></div>

--000000000000781c910579893059--
