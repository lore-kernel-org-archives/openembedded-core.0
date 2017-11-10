Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3B387785D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:11:02 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id 72so1409463itl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bb+uqrMgRGnnA+qwtp6X7qYhzlW+6/icwJf4BRS0A2s=;
	b=MK0lS5C69SLHLVskCHkhAMIwzMz7aJgE8k7atAVDbAeHmZWeSUrdC+gq8n5k0HAiGt
	sRI+1wUdWwYKgmT1Z13n1/71jwGzQ4upr5ClzxsUAVXIzaLtVH8LnBNjH3XPjQww1GQJ
	Vt3gVxaRrqelvOrJly+awdb0ebYiN/gGnXlvp/iwSY2wCV4yLw/wybjjyhdAYOt0r3Xe
	xi4+HVePbjuRcw5vavRb3wQ8V1aqR0d/tg+T15lzp1BoOXmGj7tW9gsoqlZgc41vvJZY
	8xRhfU0w90wuC8Tm0yX0tKogVdNBf0htOKT2WmoxiD0YLjJZTG1ufKn2CYyeSI+rGZwj
	8PpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bb+uqrMgRGnnA+qwtp6X7qYhzlW+6/icwJf4BRS0A2s=;
	b=qSknoHwjG8wfNpYNelua7/lqCfQYwJxKfo8qdKAdg1e19FWfgNdHqLL/sCk3aWzOaa
	k1zslXYi2OUAxPYcrRayjXF3e/WhMybAXQzmnnyyta8+Zu9r1Uf3Czlk/XKrzJPbTqGx
	sEpksQeeACDA83ct7+MYl6zZJxmbwwO2/3Smw5HtnWpKLSIADMsN2wx9LlwwZ8i1aFKA
	Hcr0WXd9WsxY3Mz0HbtIut6DzJE49CLO/mPDRhgukyppHi6SPWyEXSchGjSIDlQrIC5F
	/fAkEksauSfKpqwceshTcvEW/MH7A54lsA0+ac2ysvDoNhBuK1smBomvGeyvlRLtyWhb
	vv7g==
X-Gm-Message-State: AJaThX4bgLvj9wYg9I1YeTG4cAKaSRwHU1aR5PEtQnndiXdJIdOIYgaP
	PYbzFsizO6FC9P7Ze6Dbq+i5BJTYrmPPktBTrTRErA==
X-Google-Smtp-Source: AGs4zMa67ClYBtOH5HC5OjN3e0Uu9j4oF7K9DdclQATlMHLgCLDFpFFTph+8gHXYNV3IOZo49f3x8iXWXxlfAO0jp7E=
X-Received: by 10.36.147.198 with SMTP id y189mr179488itd.6.1510315864310;
	Fri, 10 Nov 2017 04:11:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Fri, 10 Nov 2017 04:10:43 -0800 (PST)
In-Reply-To: <4473a2c3-cec7-31ec-55d5-2b5ae03f3883@siemens.com>
References: <20171109132529.26285-1-nathan@nathanrossi.com>
	<d7759440-3eef-7974-85d8-cae3b44a894d@siemens.com>
	<CAJTo0LZCG0mtCT+253Srp=Z9nqP2KNp8GvV_VepzPbfPqfFx5A@mail.gmail.com>
	<4473a2c3-cec7-31ec-55d5-2b5ae03f3883@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Nov 2017 12:10:43 +0000
Message-ID: <CAJTo0Lad-3G8kC=xL+M_1ZktY2z7tqRe8PKC2DrwSGhNz90m8A@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox.inc: Add sanity check to test if the suid binary provides sh
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
X-List-Received-Date: Fri, 10 Nov 2017 12:11:03 -0000
Content-Type: multipart/alternative; boundary="94eb2c089e14978e33055d9fd052"

--94eb2c089e14978e33055d9fd052
Content-Type: text/plain; charset="UTF-8"

*Nobody* wants /bin/sh to be suid root, and its been a recurring theme of
previous upgrades that a misconfiguration would result in just that.

Ross

On 10 November 2017 at 12:07, Andrej Valek <andrej.valek@siemens.com> wrote:

> Of course, I don't think so, that /bin/sh > /bin/busybox.suid is a good
> think. I am just thinking, why is necessary to cast a fatal message and
> stop build for some, who wants this.
>
> Andrej
>
> On 11/10/2017 12:57 PM, Burton, Ross wrote:
> > How is /bin/sh being busybox.suid a good thing?
> >
> > Ross
> >
> > On 10 November 2017 at 07:17, Andrej Valek <andrej.valek@siemens.com
> > <mailto:andrej.valek@siemens.com>> wrote:
> >
> >     I don't think so, that adding bbfatal into this recipe is a good
> >     solution. Someone could build the busybox with /bin/sh linking into
> >     .suid eg. for more secure. We can leave live with this one as before.
> >
> >     Andrej
> >
> >     On 11/09/2017 02:25 PM, Nathan Rossi wrote:
> >      > Add a sanity check during the do_compile task to fail if the suid
> >      > busybox provides /bin/sh. This is considered as a hard fail since
> not
> >      > only is providing sh as suid problematic for security reasons but
> also
> >      > because the sh configured for suid is less functional than the
> nosuid
> >      > configured sh and breaks a number of required features (e.g.
> 64-bit
> >      > test).
> >      >
> >      > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com
> >     <mailto:nathan@nathanrossi.com>>
> >      > Cc: Ross Burton <ross.burton@intel.com <mailto:
> ross.burton@intel.com>>
> >      > ---
> >      >  meta/recipes-core/busybox/busybox.inc | 6 ++++++
> >      >  1 file changed, 6 insertions(+)
> >      >
> >      > diff --git a/meta/recipes-core/busybox/busybox.inc
> >     b/meta/recipes-core/busybox/busybox.inc
> >      > index 4012f921c6..157aea3968 100644
> >      > --- a/meta/recipes-core/busybox/busybox.inc
> >      > +++ b/meta/recipes-core/busybox/busybox.inc
> >      > @@ -183,6 +183,12 @@ do_compile() {
> >      >                       oe_runmake busybox.links
> >      >                       mv busybox.links busybox.links.$s
> >      >               done
> >      > +
> >      > +             # hard fail if sh is being linked to the suid
> busybox
> >     (detects bug 10346)
> >      > +             if grep -q -x "/bin/sh" busybox.links.suid; then
> >      > +                     bbfatal "busybox suid binary incorrectly
> provides
> >     /bin/sh"
> >      > +             fi
> >      > +
> >      >               # copy .config.orig back to .config, because the
> install
> >     process may check this file
> >      >               cp .config.orig .config
> >      >               # cleanup
> >      >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> >
> >
>

--94eb2c089e14978e33055d9fd052
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">*Nobody* wants /bin/sh to be suid root, and its been a rec=
urring theme of previous upgrades that a misconfiguration would result in j=
ust that.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 10 November 2017 at 12:07, Andrej Valek <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_bl=
ank">andrej.valek@siemens.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">Of course, I don&#39;t think so, that /bin/sh &gt; /bin/busybox.=
suid is a good<br>
think. I am just thinking, why is necessary to cast a fatal message and<br>
stop build for some, who wants this.<br>
<br>
Andrej<br>
<span class=3D""><br>
On 11/10/2017 12:57 PM, Burton, Ross wrote:<br>
&gt; How is /bin/sh being busybox.suid a good thing?<br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
&gt; On 10 November 2017 at 07:17, Andrej Valek &lt;<a href=3D"mailto:andre=
j.valek@siemens.com">andrej.valek@siemens.com</a><br>
</span><span class=3D"">&gt; &lt;mailto:<a href=3D"mailto:andrej.valek@siem=
ens.com">andrej.valek@siemens.<wbr>com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t think so, that adding bbfatal into this=
 recipe is a good<br>
&gt;=C2=A0 =C2=A0 =C2=A0solution. Someone could build the busybox with /bin=
/sh linking into<br>
&gt;=C2=A0 =C2=A0 =C2=A0.suid eg. for more secure. We can leave live with t=
his one as before.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Andrej<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 11/09/2017 02:25 PM, Nathan Rossi wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Add a sanity check during the do_compile task=
 to fail if the suid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; busybox provides /bin/sh. This is considered =
as a hard fail since not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; only is providing sh as suid problematic for =
security reasons but also<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; because the sh configured for suid is less fu=
nctional than the nosuid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; configured sh and breaks a number of required=
 features (e.g. 64-bit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; test).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Nathan Rossi &lt;<a href=3D"ma=
ilto:nathan@nathanrossi.com">nathan@nathanrossi.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:nathan@nathanro=
ssi.com">nathan@nathanrossi.com</a><wbr>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Cc: Ross Burton &lt;<a href=3D"mailto:ross.bu=
rton@intel.com">ross.burton@intel.com</a> &lt;mailto:<a href=3D"mailto:ross=
.burton@intel.com">ross.burton@intel.com</a>&gt;<wbr>&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 meta/recipes-core/busybox/<wbr>busybox.=
inc | 6 ++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-core/busybox/<wbr>b=
usybox.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-core/busybox/<wbr>busybox.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 4012f921c6..157aea3968 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-core/busybox/<wbr>busybox.=
inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-core/busybox/<wbr>busybox.=
inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -183,6 +183,12 @@ do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake busybox.links<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv busybox.links busybox.links.$s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# hard fail if sh is being linked to the suid busybox<br>
&gt;=C2=A0 =C2=A0 =C2=A0(detects bug 10346)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if grep -q -x &quot;/bin/sh&quot; busybox.links.suid; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;busybox suid binary incorre=
ctly provides<br>
&gt;=C2=A0 =C2=A0 =C2=A0/bin/sh&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# copy .config.orig back to .config, because the install<br>
&gt;=C2=A0 =C2=A0 =C2=A0process may check this file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cp .config.orig .config<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# cleanup<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0______________________________<wbr>________________=
_<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedd=
ed-core@lists.openembedded.org">Openembedded-core@<wbr>lists.openembedded.o=
rg</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.openembedded.<wbr>org/mailman/listinfo/<wbr>openembedded-core</a>&gt;<=
br>
&gt;<br>
&gt;<br>
</blockquote></div><br></div>

--94eb2c089e14978e33055d9fd052--
