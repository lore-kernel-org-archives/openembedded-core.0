Return-Path: <kergoth@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9885F719EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 21:50:40 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id e5so10163479ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 14:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=8yfMnQ+xEtWVlYSLBLj8mz6bhzcy16qeopUXcwUZtVY=;
	b=bD0K5i0eCBBLJT2uFDul3E2VsQCBedx2+FWGNSGcOG+J+c4lpGv4PzR0SRtn8/uoM6
	wXolmgN1xWVnGi08a7Z8mQrezOF5b0bMeEmOjm6BOJm8k2KuAcSItswG84kCR4nj+LjE
	6+RvOsqXLGPtYHaZ8hWoV/JOTqtvFyB8FVL4D14FyGq3A+bZQwt4/SDYTgUveRVePBpc
	9cHkhW91QQsmAixjvZR3aRqn2hVfD7+G6mnPl03kAPKsgWJkK9ChjMxmRQXH831Trk5G
	WkVBVXWD/mn9tTLRndPf/SjGjgHvanhdF47ucyqjR606UVbXddVolB7RQmEbD09RrVPL
	hhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=8yfMnQ+xEtWVlYSLBLj8mz6bhzcy16qeopUXcwUZtVY=;
	b=doK4F49PD3r+r/ZGOPS8CWkJXs+hzpi10dH+q8pU+xrABPMx9OZzWaTFvrLTQICJ2c
	FJvjwx4KV/jpwm79ldYTaOrChESadrWHZmiUG34uT55Fn8rvOrBWWkhiQM+uSMDJtSul
	Cp8jSxzPpbEQMFFY0NkNO3w+5JJj1u+0qCxI45Hes4qdWlNdIbn9DYSXIaaO1oTgA8sQ
	17Tt+qRLLDqz0ykHal0aWxUdWzEWb16MESL5gDcd6p7ljnlWZYzWw6SWPSPD5oh6o3oJ
	5ov+VWQrriyZWk0+F28C+3tn+Lb8qkgh2g/oGuQK6Ia6y9vadbFDAJ0edBAQlpl+pbIq
	NWAA==
X-Gm-Message-State: AA6/9RkC9oO+vYF7R14IYrm4vacJuLDEGqYfoyAy+mUBDuf3bgNeJoKQoylMZBqLkIBSKY0aXsTyxCJ8WYsApg==
X-Received: by 10.202.194.68 with SMTP id s65mr20900912oif.98.1477345841832;
	Mon, 24 Oct 2016 14:50:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Mon, 24 Oct 2016 14:50:21 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610241644480.15919@localhost.localdomain>
References: <alpine.LFD.2.20.1610241644480.15919@localhost.localdomain>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 24 Oct 2016 14:50:21 -0700
X-Google-Sender-Auth: ooHP6anFZetm7WEd1oEhNLh5OEk
Message-ID: <CABcZANnYLS0pfSpdzf3NVV4KEg_88b9mPark9gpstJUFHZTzxQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: most efficient way to map perl RH rpms to OE package names?
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
X-List-Received-Date: Mon, 24 Oct 2016 21:50:41 -0000
Content-Type: multipart/alternative; boundary=001a113dca6c1ced2d053fa36201

--001a113dca6c1ced2d053fa36201
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 24, 2016 at 1:53 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   i've just been handed a list of about 200 perl packages by their
> centos rpm names, and i want to map most, if not all, of them to their
> equivalent OE package names.
>
>  my first instinct (based on not having used a lot of perl OE
> packages) is to add both "perl" and "perl-modules" to IMAGE_INSTALL,
> just to fetch and build every possible module available through the OE
> perl recipe -- that will at least give me an idea of what's available.
>
>   next, i can see the pattern in some OE package names -- i've
> verified that the Time::HiRes package is available in OE as
> perl-module-time-hires, which i assume is part of the dynamic naming
> being done in perl_5.22.1.bb.
>
>  am i approaching this the right way?
>

Could also bitbake perl, then use oe-pkgdata-util to locate the actual perl
modules in the packages, i.e. */Time/HiRes.pm.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113dca6c1ced2d053fa36201
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Oct 24, 2016 at 1:53 PM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2hk"=
 class=3D"a3s aXjCH m157f88e7b04000e9">=C2=A0 i&#39;ve just been handed a l=
ist of about 200 perl packages by their<br>
centos rpm names, and i want to map most, if not all, of them to their<br>
equivalent OE package names.<br>
<br>
=C2=A0my first instinct (based on not having used a lot of perl OE<br>
packages) is to add both &quot;perl&quot; and &quot;perl-modules&quot; to I=
MAGE_INSTALL,<br>
just to fetch and build every possible module available through the OE<br>
perl recipe -- that will at least give me an idea of what&#39;s available.<=
br>
<br>
=C2=A0 next, i can see the pattern in some OE package names -- i&#39;ve<br>
verified that the Time::HiRes package is available in OE as<br>
perl-module-time-hires, which i assume is part of the dynamic naming<br>
being done in <a href=3D"http://perl_5.22.1.bb" rel=3D"noreferrer" target=
=3D"_blank">perl_5.22.1.bb</a>.<br>
<br>
=C2=A0am i approaching this the right way?</div></blockquote></div><br>Coul=
d also bitbake perl, then use oe-pkgdata-util to locate the actual perl mod=
ules in the packages, i.e. */Time/HiRes.pm.<br>-- <br><div class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson =
at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Mainta=
iner - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113dca6c1ced2d053fa36201--
