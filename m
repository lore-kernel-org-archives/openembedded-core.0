Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 85F1160232
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Dec 2014 01:38:53 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id v63so2051312oia.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Dec 2014 17:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=EmkmzNZNmnIadTRQbEjxROy743mTorAU9lnPJ8eRAxw=;
	b=xEKO4s5RUIpb3yY0rFeXf1YdqMX8jegDKU7MSr0q1S0tsLfCt/MxUEM/kyDisjWyZs
	qwZWA8FfEvBQnmxm1zFSAvwwTQGv5HOivP8n553o4S6sAHHELETHP9c8zzBL+GHkYuJw
	d+5KTCKtj3NNmJzUi0yM3KWSSRr3hiE6oygjwGjalpLDRXDUUo4Eh4k2Q78jzHp9G5yl
	nQ42T9pMxUhAINd32Z1+GljsUrU0QmxmEs24Ms0CrBOxJTX1iq1o5+yUp4/bNniWEzEX
	OkBdYJwmtrB+84ouctw/BGca8ctR7XkXudwBVLUYNyBvfbFG/fa0ElVu8vuHzpDwlpbt
	SlXg==
X-Received: by 10.182.92.167 with SMTP id cn7mr15402594obb.53.1417916333354;
	Sat, 06 Dec 2014 17:38:53 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.76.102.14 with HTTP; Sat, 6 Dec 2014 17:38:32 -0800 (PST)
In-Reply-To: <C1929A84-C95C-4584-B64F-D09C7F71D656@dominion.thruhere.net>
References: <1417812364-14923-1-git-send-email-ross.burton@intel.com>
	<C1929A84-C95C-4584-B64F-D09C7F71D656@dominion.thruhere.net>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 6 Dec 2014 18:38:32 -0700
X-Google-Sender-Auth: Jy0m0IeCXHPjmOrr4tQg4aMcPmc
Message-ID: <CABcZAN=y7exSY-8x=iXo_-g9nL5zzRL3yYSa+7NR0m11fwmGOA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dtc: don't use autotools as this doesn't use autotools
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
X-List-Received-Date: Sun, 07 Dec 2014 01:38:57 -0000
Content-Type: multipart/alternative; boundary=001a11c325625ef5690509965fca

--001a11c325625ef5690509965fca
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 6, 2014 at 4:00 AM, Koen Kooi <koen@dominion.thruhere.net>
wrote:

> > Op 5 dec. 2014, om 21:46 heeft Ross Burton <ross.burton@intel.com> het
> volgende geschreven:
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> > meta/recipes-kernel/dtc/dtc.inc |    8 +++++---
> > 1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/dtc/dtc.inc
> b/meta/recipes-kernel/dtc/dtc.inc
> > index 95023b6..0c409b0 100644
> > --- a/meta/recipes-kernel/dtc/dtc.inc
> > +++ b/meta/recipes-kernel/dtc/dtc.inc
>
> [..]
>
> > +do_install () {
> > +     oe_runmake install
> > +}
>
> I'm wondering if it makes sense to have base.bbclass do this the default
> do_install. Having a virtually empty recipe with only a do_install always
> makes me a bit uneasy.
>

The problem with that is DESTDIR is an automake convention.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c325625ef5690509965fca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sat, Dec 6, 2014 at 4:00 AM, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"=
mailto:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere=
.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1i=
w" class=3D"a3s" style=3D"overflow:hidden">&gt; Op 5 dec. 2014, om 21:46 he=
eft Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@in=
tel.com</a>&gt; het volgende geschreven:<br>
<span class=3D"">&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/recipes-kernel/dtc/dtc.inc |=C2=A0 =C2=A0 8 +++++---<br>
&gt; 1 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc=
/dtc.inc<br>
&gt; index 95023b6..0c409b0 100644<br>
&gt; --- a/meta/recipes-kernel/dtc/dtc.inc<br>
&gt; +++ b/meta/recipes-kernel/dtc/dtc.inc<br>
<br>
</span>[..]<br>
<span class=3D""><br>
&gt; +do_install () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0oe_runmake install<br>
&gt; +}<br>
<br>
</span>I&#39;m wondering if it makes sense to have base.bbclass do this the=
 default do_install. Having a virtually empty recipe with only a do_install=
 always makes me a bit uneasy.</div></blockquote></div><br>The problem with=
 that is DESTDIR is an automake convention.<br>-- <br><div class=3D"gmail_s=
ignature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - Bit=
Bake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Eng=
ineer, Mentor Graphics</div>
</div></div>

--001a11c325625ef5690509965fca--
