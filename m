Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB906FE5C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 14:25:55 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id l4so1999007lbv.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 07:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=GIi1I63610uea58H/gIDoM7kraqgTcp3+4UDFHAIUaw=;
	b=sU/Jp/4GdZ9YhJ0WoTRMwrJNUAadsinBVU6T4CRjLlneEZ0gHHH5z5m9Vgb0CcZewX
	OpSLZdxsIqjiAxef+dS+ozAUB8aak5SCzvk9Z2+RZKeJ3HvPwf1dhvh2a4EZNSHPhUOA
	v1nS9Ll5v/l45g0l3A1VBjAG2FG7DllbqV1EHCrQ/eX6orbdjkcpjuJiwh3XJ6bvdP13
	rMIcj6A+I2GjBuOGenHHu6KMULyS7xOIGamAvdz9zuSfiN4J3/q0JJSwlpWq4H/WL3fW
	9DHBe3OWuWCKMDjNz3PeG21Z/Sxv6340HQ2g2iyEpMBxj3PCjSFt5LfhmpIY1hZGiabV
	5PAA==
X-Received: by 10.152.3.65 with SMTP id a1mr2266126laa.76.1407507956080; Fri,
	08 Aug 2014 07:25:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Fri, 8 Aug 2014 07:25:35 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1408080629500.13627@localhost>
References: <alpine.LFD.2.11.1408080629500.13627@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 8 Aug 2014 07:25:35 -0700
X-Google-Sender-Auth: tUCFXxYCaphUIQshWmMx-5X83bk
Message-ID: <CABcZANn2DUaCHavWVPhFnoOgEQM9nF8fiWAyfNcD4e5i89xB8A@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how does SCR_URI_OVERRIDES_PACKAGE_ARCH affect building tslib?
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
X-List-Received-Date: Fri, 08 Aug 2014 14:26:03 -0000
Content-Type: multipart/alternative; boundary=089e0141a0a8bda76605001efb05

--089e0141a0a8bda76605001efb05
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 8, 2014 at 3:35 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   looking at SRC_URI_OVERRIDES_PACKAGE_ARCH variable, and i notice
> first that there is only one usage of it in all of oe-core (tslib),
> but i'm confused as to what value it has.
>
>   the ref manual reads:
>
> "By default, the OpenEmbedded build system automatically detects
> whether SRC_URI contains files that are machine-specific. If so, the
> build system automatically changes PACKAGE_ARCH. Setting this variable
> to "0" disables this behavior."
>
>   first, i'm not sure what about the tslib SRC_URI appears to be
> machine-specific. also, just for fun, i commented out that line in the
> tslib .bb file, and did a global "bb show" to see what difference it
> made, and i saw no difference at all. so what exactly is the purpose
> of that line in that recipe? what difference should i be able to see
> with versus without it? thanks.


Any file:// file in an SRC_URI can become machine specific if placed in a
machine subdir in the search path. That said, I don't know why the
automatic behavior of setting package_arch in that case is something that
needs to be disabled for tslib. I'd suggest using git-blame to examine the
commits which added this variable.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0141a0a8bda76605001efb05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Aug 8, 2014 at 3:35 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.c=
a</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"adM"><br></div>
=C2=A0 looking at SRC_URI_OVERRIDES_PACKAGE_ARCH variable, and i notice<br>
first that there is only one usage of it in all of oe-core (tslib),<br>
but i&#39;m confused as to what value it has.<br>
<br>
=C2=A0 the ref manual reads:<br>
<br>
&quot;By default, the OpenEmbedded build system automatically detects<br>
whether SRC_URI contains files that are machine-specific. If so, the<br>
build system automatically changes PACKAGE_ARCH. Setting this variable<br>
to &quot;0&quot; disables this behavior.&quot;<br>
<br>
=C2=A0 first, i&#39;m not sure what about the tslib SRC_URI appears to be<b=
r>
machine-specific. also, just for fun, i commented out that line in the<br>
tslib .bb file, and did a global &quot;bb show&quot; to see what difference=
 it<br>
made, and i saw no difference at all. so what exactly is the purpose<br>
of that line in that recipe? what difference should i be able to see<br>
with versus without it? thanks.</blockquote></div><br></div><div class=3D"g=
mail_extra">Any file:// file in an SRC_URI can become machine specific if p=
laced in a machine subdir in the search path. That said, I don&#39;t know w=
hy the automatic behavior of setting package_arch in that case is something=
 that needs to be disabled for tslib. I&#39;d suggest using git-blame to ex=
amine the commits which added this variable.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e0141a0a8bda76605001efb05--
