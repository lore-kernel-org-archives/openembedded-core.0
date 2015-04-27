Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2B29273C48
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 01:17:52 +0000 (UTC)
Received: by qgeb100 with SMTP id b100so43978515qge.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Apr 2015 18:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=GICkCwYlmE4SxSVJSwFbN/3OyDvWGqpA25kjFZB33CY=;
	b=FSzYB3mhuFitTAkAR+hl2UtN29Vvc1cXwg5TmPj/A9vsMHZ8YDSTCr4OibfCeS9d8X
	STiLdG3pEsvJIQ6LXkaZTTK2lyEPVeKgyP6tFMW+gwtmq3eiXkMUANSHGYzzy0TvE/yy
	oV96s0yCun8Nv//Z9IvqgQy+3Wu2wlQTbkH/RJQK3L6CtNKuoU1BoPYZ8LDNOMtSgdec
	zwfO5lW6HEaAl3mpZExvbtizBgdx1AvllJJmUfjfb56kO6DfsGcgrHzLanU1aMRjKCLz
	wVbyd6557GVYQ5z+8tp5eNfb1a1rSAFNjGgzXsdldKaToTueafyhFt2tZFaXONarRWx2
	6R+Q==
X-Received: by 10.229.54.196 with SMTP id r4mr6305484qcg.15.1430097474144;
	Sun, 26 Apr 2015 18:17:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.34 with HTTP; Sun, 26 Apr 2015 18:17:33 -0700 (PDT)
In-Reply-To: <1430085461.13022.89.camel@linuxfoundation.org>
References: <cover.1429799661.git.cristian.iorga@intel.com>
	<1a55976003e57036ced5e47dd031575508dfc87b.1429799661.git.cristian.iorga@intel.com>
	<1430085461.13022.89.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 26 Apr 2015 18:17:33 -0700
X-Google-Sender-Auth: WmXKa3232SuUQFDMV9Arh2yUjF0
Message-ID: <CABcZAN=Xebt9XPGD_FgpsTp06nbs6OezJhsBNCTnoefCfknxzA@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 Apr 2015 01:17:55 -0000
Content-Type: multipart/alternative; boundary=001a1134d624f0ce0f0514aa8326

--001a1134d624f0ce0f0514aa8326
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 26, 2015 at 2:57 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2015-04-23 at 17:38 +0300, Cristian Iorga wrote:
> > As BlueZ5 will be the default Bluetooth stack,
> > don't exclude it from world builds.
> >
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > ---
> >  meta/recipes-connectivity/bluez5/bluez5.inc | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> b/meta/recipes-connectivity/bluez5/bluez5.inc
> > index 67aafbb..bf845a8 100644
> > --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> > +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> > @@ -100,5 +100,3 @@ FILES_${PN}-dbg += "\
> >  RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
> >
> >  SYSTEMD_SERVICE_${PN} = "bluetooth.service"
> > -
> > -EXCLUDE_FROM_WORLD = "1"
>
> The reason this is there is to ensure that a bitbake world doesn't build
> bluez4 and 5 at the same time. Even though v4 is moving to meta-oe, it
> doesn't change the fact we really need this so world builds don't end up
> in a mess.
>
> Typically, any recipe providing a vritual/xxxx PROVIDES will also end up
> with an EXCLUDE_FROM_WORLD as the dependency mechanism will then pull in
> the correct thing(s).
>
> Not ideal but its what we have today.


Originally, world was designed to only build one of any given multiple
provider situation, IIRC. Is that not the case, or is it the fact that both
get pulled in via dependencies in a world build, not directly?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1134d624f0ce0f0514aa8326
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Apr 26, 2015 at 2:57 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">On Thu, 2015-04-23 at 17:38 +0300, Cristian Iorga =
wrote:<br>
&gt; As BlueZ5 will be the default Bluetooth stack,<br>
&gt; don&#39;t exclude it from world builds.<br>
&gt;<br>
&gt; Signed-off-by: Cristian Iorga &lt;<a href=3D"mailto:cristian.iorga@int=
el.com">cristian.iorga@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/bluez5/bluez5.inc | 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipe=
s-connectivity/bluez5/bluez5.inc<br>
&gt; index 67aafbb..bf845a8 100644<br>
&gt; --- a/meta/recipes-connectivity/bluez5/bluez5.inc<br>
&gt; +++ b/meta/recipes-connectivity/bluez5/bluez5.inc<br>
&gt; @@ -100,5 +100,3 @@ FILES_${PN}-dbg +=3D &quot;\<br>
&gt;=C2=A0 RDEPENDS_${PN}-testtools +=3D &quot;python python-dbus python-py=
gobject&quot;<br>
&gt;<br>
&gt;=C2=A0 SYSTEMD_SERVICE_${PN} =3D &quot;bluetooth.service&quot;<br>
&gt; -<br>
&gt; -EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
<br>
</span>The reason this is there is to ensure that a bitbake world doesn&#39=
;t build<br>
bluez4 and 5 at the same time. Even though v4 is moving to meta-oe, it<br>
doesn&#39;t change the fact we really need this so world builds don&#39;t e=
nd up<br>
in a mess.<br>
<br>
Typically, any recipe providing a vritual/xxxx PROVIDES will also end up<br=
>
with an EXCLUDE_FROM_WORLD as the dependency mechanism will then pull in<br=
>
the correct thing(s).<br>
<br>
Not ideal but its what we have today.</blockquote></div><br>Originally, wor=
ld was designed to only build one of any given multiple provider situation,=
 IIRC. Is that not the case, or is it the fact that both get pulled in via =
dependencies in a world build, not directly?<br>-- <br><div class=3D"gmail_=
signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - Bi=
tBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software En=
gineer, Mentor Graphics</div>
</div></div>

--001a1134d624f0ce0f0514aa8326--
