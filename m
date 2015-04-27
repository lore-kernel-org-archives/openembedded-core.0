Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 86B5E65CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 14:17:58 +0000 (UTC)
Received: by qkhg7 with SMTP id g7so62607804qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=tTlvIqvPXpnF/Xs3z3kYUyCuhxJMuhAI7HLtCeUrJCc=;
	b=I00VD0KHhtt7ogkT7r4sDZrK5A4bVwfPxqBzqxYhOSyakKqgImHKnB7dRB1se4YwYb
	Kw05DyOyzj0qFdMixHqJbHF2fWRG7jWU3fx02qIUw9nEnjxpLQDIgM5IXnoHRwiWFsh2
	EAH6BOR0v5dcftlrX9U7iq/yXiGpVxBrMEi3ivNls/7o9gUesuPcpfhIhVlp/529VOwe
	d4fXQMt9lJ+p5BpBmJalfUyEe/hVZa1D6Wu4HV6qdEY+lIPcKgyZiRBZyCwetuNueIfC
	cCL7mccMXSH9Pas6UdC3c6n1Fuh/reWNcFO8mLEbJAi/JSHbn123GfeG+beoWQw6GsSk
	dGAw==
X-Received: by 10.140.128.16 with SMTP id 16mr7842954qha.75.1430144279661;
	Mon, 27 Apr 2015 07:17:59 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.34 with HTTP; Mon, 27 Apr 2015 07:17:38 -0700 (PDT)
In-Reply-To: <1430118811.13022.91.camel@linuxfoundation.org>
References: <cover.1429799661.git.cristian.iorga@intel.com>
	<1a55976003e57036ced5e47dd031575508dfc87b.1429799661.git.cristian.iorga@intel.com>
	<1430085461.13022.89.camel@linuxfoundation.org>
	<CABcZAN=Xebt9XPGD_FgpsTp06nbs6OezJhsBNCTnoefCfknxzA@mail.gmail.com>
	<1430118811.13022.91.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 27 Apr 2015 07:17:38 -0700
X-Google-Sender-Auth: vvwJ1riX5ahN_l4oBCY9idjIBj0
Message-ID: <CABcZANmxyF3F6Oy2Gzq-jgYEZpTC+DpgA69htK4XQ8ZkB3H__g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 4/4] bluez5: don't exclude from world builds
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
X-List-Received-Date: Mon, 27 Apr 2015 14:18:02 -0000
Content-Type: multipart/alternative; boundary=001a1134f304c453e90514b569c3

--001a1134f304c453e90514b569c3
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 27, 2015 at 12:13 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2015-04-26 at 18:17 -0700, Christopher Larson wrote:
> >
> > On Sun, Apr 26, 2015 at 2:57 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >         On Thu, 2015-04-23 at 17:38 +0300, Cristian Iorga wrote:
> >         > As BlueZ5 will be the default Bluetooth stack,
> >         > don't exclude it from world builds.
> >         >
> >         > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> >         > ---
> >         >  meta/recipes-connectivity/bluez5/bluez5.inc | 2 --
> >         >  1 file changed, 2 deletions(-)
> >         >
> >         > diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> >         b/meta/recipes-connectivity/bluez5/bluez5.inc
> >         > index 67aafbb..bf845a8 100644
> >         > --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> >         > +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> >         > @@ -100,5 +100,3 @@ FILES_${PN}-dbg += "\
> >         >  RDEPENDS_${PN}-testtools += "python python-dbus
> >         python-pygobject"
> >         >
> >         >  SYSTEMD_SERVICE_${PN} = "bluetooth.service"
> >         > -
> >         > -EXCLUDE_FROM_WORLD = "1"
> >
> >         The reason this is there is to ensure that a bitbake world
> >         doesn't build
> >         bluez4 and 5 at the same time. Even though v4 is moving to
> >         meta-oe, it
> >         doesn't change the fact we really need this so world builds
> >         don't end up
> >         in a mess.
> >
> >         Typically, any recipe providing a vritual/xxxx PROVIDES will
> >         also end up
> >         with an EXCLUDE_FROM_WORLD as the dependency mechanism will
> >         then pull in
> >         the correct thing(s).
> >
> >         Not ideal but its what we have today.
> >
> > Originally, world was designed to only build one of any given multiple
> > provider situation, IIRC. Is that not the case, or is it the fact that
> > both get pulled in via dependencies in a world build, not directly?
>
> I'm not aware of any code that would remove things with multiple
> providers from world? Its possible that got lost when we switched to
> multiple threads of execution but that was a long time ago.


8262012a90273a4726ebaaf5c4da61262542e69d in bitbake added the initial
'world' implementation, which didn't do such a removal, but did explicitly
skip virtual/*, and it looks like aff3227b5e4a3dee9bceb120aac11f4bf3ac6409
implemented the first naive handling of it, beyond the virtual/ prefix,
from a quick perusal of bitbake history. It skipped the non-preferred
selections of every multiple provider.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1134f304c453e90514b569c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Apr 27, 2015 at 12:13 AM, Richard Purdie <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard=
.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div =
class=3D""><div class=3D"h5">On Sun, 2015-04-26 at 18:17 -0700, Christopher=
 Larson wrote:<br>
&gt;<br>
&gt; On Sun, Apr 26, 2015 at 2:57 PM, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Thu, 2015-04-23 at 17:38 +0300, Cr=
istian Iorga wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; As BlueZ5 will be the default Bl=
uetooth stack,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; don&#39;t exclude it from world =
builds.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Cristian Iorga &l=
t;<a href=3D"mailto:cristian.iorga@intel.com">cristian.iorga@intel.com</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 meta/recipes-connectivity/=
bluez5/bluez5.inc | 2 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 1 file changed, 2 deletion=
s(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; diff --git a/meta/recipes-connec=
tivity/bluez5/bluez5.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-connectivity/bluez5/bl=
uez5.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; index 67aafbb..bf845a8 100644<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; --- a/meta/recipes-connectivity/=
bluez5/bluez5.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; +++ b/meta/recipes-connectivity/=
bluez5/bluez5.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; @@ -100,5 +100,3 @@ FILES_${PN}-=
dbg +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 RDEPENDS_${PN}-testtools +=
=3D &quot;python python-dbus<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pygobject&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 SYSTEMD_SERVICE_${PN} =3D =
&quot;bluetooth.service&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -EXCLUDE_FROM_WORLD =3D &quot;1&=
quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The reason this is there is to ensure=
 that a bitbake world<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0doesn&#39;t build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bluez4 and 5 at the same time. Even t=
hough v4 is moving to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-oe, it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0doesn&#39;t change the fact we really=
 need this so world builds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0don&#39;t end up<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in a mess.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Typically, any recipe providing a vri=
tual/xxxx PROVIDES will<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0also end up<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with an EXCLUDE_FROM_WORLD as the dep=
endency mechanism will<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then pull in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the correct thing(s).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Not ideal but its what we have today.=
<br>
&gt;<br>
&gt; Originally, world was designed to only build one of any given multiple=
<br>
&gt; provider situation, IIRC. Is that not the case, or is it the fact that=
<br>
&gt; both get pulled in via dependencies in a world build, not directly?<br=
>
<br>
</div></div>I&#39;m not aware of any code that would remove things with mul=
tiple<br>
providers from world? Its possible that got lost when we switched to<br>
multiple threads of execution but that was a long time ago.</blockquote></d=
iv><br>8262012a90273a4726ebaaf5c4da61262542e69d in bitbake added the initia=
l &#39;world&#39; implementation, which didn&#39;t do such a removal, but d=
id explicitly skip virtual/*, and it looks like=C2=A0aff3227b5e4a3dee9bceb1=
20aac11f4bf3ac6409 implemented the first naive handling of it, beyond the v=
irtual/ prefix, from a quick perusal of bitbake history. It skipped the non=
-preferred selections of every multiple provider.<br>-- <br><div class=3D"g=
mail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder=
 - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softwa=
re Engineer, Mentor Graphics</div>
</div></div>

--001a1134f304c453e90514b569c3--
