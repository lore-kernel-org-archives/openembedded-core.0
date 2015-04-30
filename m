Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id F062272491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 15:32:53 +0000 (UTC)
Received: by qgej70 with SMTP id j70so26436329qge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=v6p1P3lILB98CQeYa7qQ+S+3rbLeMO9jgmHP0t5vyFg=;
	b=FKUQYOTb5xEcgwbdeZeLmr/lI049uKdNSBZsbhEJHB9zkmUktaqYoFNwgl/RFOOqUH
	89GFScTjpkL3cHakX+6D9LXSHeiBmY5PQdjSEMy/ulh3dUfuqrY7WsQkdygoymy/LOUL
	lX4CyGmeZi7OwJ4Gu6fqwYFrlSOJSc7AZQZwP6+A+79xmW1vpuTUKy5hAU70Nvsot4aQ
	VL8/BllHk4P+wyX2hwS5HwtyHbsT+WLW3EvIzA60IY8f/7PRoQPLnxugpWiW1tUh3u+l
	Z9aollcWnFlYeM2jpTqEpE57rFMekUQCmq1vwv1qAEzUoYcI2TDfSHuBcsGPWMg9x8l/
	Yj4w==
X-Received: by 10.140.23.35 with SMTP id 32mr4512844qgo.106.1430407974470;
	Thu, 30 Apr 2015 08:32:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.34 with HTTP; Thu, 30 Apr 2015 08:32:33 -0700 (PDT)
In-Reply-To: <20150430145552.GA20387@mcrowe.com>
References: <20150430142842.GA19899@mcrowe.com>
	<CABcZAN=hpf+C=2TQ+ghPktwM68Bq+T_HVMWhR94Y2K5Em4xwPw@mail.gmail.com>
	<20150430145552.GA20387@mcrowe.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 30 Apr 2015 08:32:33 -0700
X-Google-Sender-Auth: 4-kEV9OWMXU9qVtwVeSMOOd5I_k
Message-ID: <CABcZANnGJF_qXqeX71VVscjE9-qthvShOfumD57JUJyXPCDBVQ@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libcap: make -e causing trouble
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
X-List-Received-Date: Thu, 30 Apr 2015 15:32:54 -0000
Content-Type: multipart/alternative; boundary=001a11c12c6e33c8f10514f2cf73

--001a11c12c6e33c8f10514f2cf73
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 30, 2015 at 7:55 AM, Mike Crowe <mac@mcrowe.com> wrote:

> On Thursday 30 April 2015 at 07:39:25 -0700, Christopher Larson wrote:
> > On Thu, Apr 30, 2015 at 7:28 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > > Unfortunately passing "-e" subtly changes the behaviour of libcap's
> > > Make.Rules under recursive make when prefix="" (which it is for us
> since
> > > we're using meta-micro.)
>
> [snip]
>
> > Given our use of make -e (with MAKEFLAGS= to try to prevent it from
> flowing
> > into submakes) was always a hack to try to let things "just work", I
> think
> > wherever possible we should stop relying on it, and explicitly pass
> > everything the way that particular make-based buildsystem expects,
> > personally. Better to be explicit than to rely on implicit "magic".
> > Further, that behavior encourages recipe maintainers to not even read the
> > buildsystem of the project they're creating a recipe for, which often
> leads
> > to problems down the road..
>
> I completely agree, but what is the best way to avoid "-e". Is there ever
> likely to be anything else in EXTRA_OEMAKE that would need to be preserved?
>
> I notice that autotools.bbclass just sets EXTRA_OEMAKE = "" so perhaps it's
> relatively safe to just assign it directly.


Yeah, generally it's safe. The recipe knows more about a make-based
buildsystem than any of our classes do anyway, since there are no real
standards. Autotools is a different story, of course.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c12c6e33c8f10514f2cf73
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Apr 30, 2015 at 7:55 AM, Mike Crowe <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thursday 30 Ap=
ril 2015 at 07:39:25 -0700, Christopher Larson wrote:<br>
&gt; On Thu, Apr 30, 2015 at 7:28 AM, Mike Crowe &lt;<a href=3D"mailto:mac@=
mcrowe.com">mac@mcrowe.com</a>&gt; wrote:<br>
</span><span class=3D"">&gt; &gt; Unfortunately passing &quot;-e&quot; subt=
ly changes the behaviour of libcap&#39;s<br>
&gt; &gt; Make.Rules under recursive make when prefix=3D&quot;&quot; (which=
 it is for us since<br>
&gt; &gt; we&#39;re using meta-micro.)<br>
<br>
</span>[snip]<br>
<span class=3D""><br>
&gt; Given our use of make -e (with MAKEFLAGS=3D to try to prevent it from =
flowing<br>
&gt; into submakes) was always a hack to try to let things &quot;just work&=
quot;, I think<br>
&gt; wherever possible we should stop relying on it, and explicitly pass<br=
>
&gt; everything the way that particular make-based buildsystem expects,<br>
&gt; personally. Better to be explicit than to rely on implicit &quot;magic=
&quot;.<br>
&gt; Further, that behavior encourages recipe maintainers to not even read =
the<br>
&gt; buildsystem of the project they&#39;re creating a recipe for, which of=
ten leads<br>
&gt; to problems down the road..<br>
<br>
</span>I completely agree, but what is the best way to avoid &quot;-e&quot;=
. Is there ever<br>
likely to be anything else in EXTRA_OEMAKE that would need to be preserved?=
<br>
<br>
I notice that autotools.bbclass just sets EXTRA_OEMAKE =3D &quot;&quot; so =
perhaps it&#39;s<br>
relatively safe to just assign it directly.</blockquote></div><br>Yeah, gen=
erally it&#39;s safe. The recipe knows more about a make-based buildsystem =
than any of our classes do anyway, since there are no real standards. Autot=
ools is a different story, of course.<br>-- <br><div class=3D"gmail_signatu=
re">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, =
OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer,=
 Mentor Graphics</div>
</div></div>

--001a11c12c6e33c8f10514f2cf73--
