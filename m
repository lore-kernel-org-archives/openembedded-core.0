Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id C9BE560169
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 00:46:45 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id h18so3497233igc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KhY8Qwds1gQlBmcVolDLB4YzoIKaCAqxjSSkA/lwbos=;
	b=idmoGigremYlXgK902/d+ZGPZK9A+B5bU/LIUZGHI3THNIowAbTlSmgC/uWZB5BajX
	wUCutK46jk1V3Z5XGRps1Qj49R/nef8IdzbAkUPUXO3lsjcQex9DVbhOtB1ZoefoPjCZ
	v9vYqOmCrKtsOQ0jSguuOQhpg9kTWnfsKrHxfFEZYC0xPgxSFAziPCJBzVRzQN7h6Jer
	zZo5hKeaRiPxo1AdpBMBJ3GqhJ+Ikmvtii/vqs/jhbgwyQ3HjZxX/MGQSLFF7Bn/aoH2
	ftGXunoT2/G5VJG0vPNT99tJFH5XSiT4aO5ZU05pjPj/Te1cTxHqkG3JTK38NOI1Fk7t
	ZRkw==
MIME-Version: 1.0
X-Received: by 10.43.70.66 with SMTP id yf2mr7813543icb.36.1407977206595; Wed,
	13 Aug 2014 17:46:46 -0700 (PDT)
Received: by 10.50.126.103 with HTTP; Wed, 13 Aug 2014 17:46:46 -0700 (PDT)
In-Reply-To: <CAP9ODKpND6P-x7ZKE9SuZ6vbfFF8RxoVSL3X9UDzj-WhV9yTpw@mail.gmail.com>
References: <53EBD780.9060005@mlbassoc.com>
	<CAP9ODKpND6P-x7ZKE9SuZ6vbfFF8RxoVSL3X9UDzj-WhV9yTpw@mail.gmail.com>
Date: Wed, 13 Aug 2014 17:46:46 -0700
Message-ID: <CAMKF1soYYaAQ9tY7462=zEgo9urFaaAV-qDk6qhO=8_n0xdDyA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC 4.9 considered evil
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
X-List-Received-Date: Thu, 14 Aug 2014 00:46:49 -0000
Content-Type: multipart/alternative; boundary=bcaec51b1b0f404c2105008c3d7f

--bcaec51b1b0f404c2105008c3d7f
Content-Type: text/plain; charset=UTF-8

On Wednesday, August 13, 2014, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> On Wed, Aug 13, 2014 at 6:24 PM, Gary Thomas <gary@mlbassoc.com
> <javascript:;>> wrote:
> > I've found that the latest GCC doesn't work very well, at
> > least not on ARM (and obviously other architectures as well [1])
> > When I build Google Chromium browser for my i.MX boards using
> > GCC-4.9.x, no pages can be rendered - massive bloodshed and
> > failures are shown on the console.  If I use the older GCC 4.8.2,
> > everything else the same, all is well.
> >
> > Here's my configuration:
> > BB_VERSION        = "1.23.1"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "Ubuntu-13.10"
> > TARGET_SYS        = "arm-amltd-linux-gnueabi"
> > MACHINE           = "teton-p0382"
> > DISTRO            = "amltd"
> > DISTRO_VERSION    = "1.6+snapshot-20140812"
> > TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa9"
> > TARGET_FPU        = "vfp-neon"
> > meta              = "master:86afd7eb7c679eb065706137f28f44248f3fbc5a"
> > meta-amltd        = "master:899529b4184dc9e3e291e7fcdbbf157233db056d"
> > meta-teton-imx6-p0382 = "master:9188e2f8fafd203c95dcd7a3c79cb38a1568e9b5"
> > meta-fsl-arm      = "master:b0cf5c78c5f98c5977ae556d331e7495648f154c"
> > meta-fsl-arm-extra = "master:12e560967b7136222c325d11633295fe3a0c701c"
> > meta-browser      = "master:da93c8e386133a15eff1414d9307c8f2c7a44787"
> >
> > Should this be filed as a bug?  I don't have much data other than it
> > simply breaks (and chrome is not the easiest thing to debug!).  Other
> > applications seem OK, but I am loathe to trust it...
> >
> > I'm going to hold onto GCC-4.8.x for my $DISTRO at least (and I hope
> > it doesn't vanish like 4.7.x did too quickly).
> >
> > [1]
> >
> http://slashdot.org/story/14/07/27/1838219/linus-torvalds-gcc-490-seems-to-be-terminally-broken
> >
> > Note: I've also tried this on qemux86 (a totally different
> > architecture) and chrome bombs just as badly!
>
> I confirm that GCC 4.9 does NOT work for Chromium 35. At this moment I
> am not aware of any fix for it.


Again Its a broad brush statement. Something concrete is needed if
some.action is to taken

>
> IIRC the Chromium 37 works though.
>
>
Well then its less chance.that someone will fix 35

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--bcaec51b1b0f404c2105008c3d7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, August 13, 2014, Otavio Salvador &lt;<a href=3D"mailt=
o:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt; wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
On Wed, Aug 13, 2014 at 6:24 PM, Gary Thomas &lt;<a href=3D"javascript:;" o=
nclick=3D"_e(event, &#39;cvml&#39;, &#39;gary@mlbassoc.com&#39;)">gary@mlba=
ssoc.com</a>&gt; wrote:<br>
&gt; I&#39;ve found that the latest GCC doesn&#39;t work very well, at<br>
&gt; least not on ARM (and obviously other architectures as well [1])<br>
&gt; When I build Google Chromium browser for my i.MX boards using<br>
&gt; GCC-4.9.x, no pages can be rendered - massive bloodshed and<br>
&gt; failures are shown on the console. =C2=A0If I use the older GCC 4.8.2,=
<br>
&gt; everything else the same, all is well.<br>
&gt;<br>
&gt; Here&#39;s my configuration:<br>
&gt; BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.23.1&quot;<br>
&gt; BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot;<br>
&gt; NATIVELSBSTRING =C2=A0 =3D &quot;Ubuntu-13.10&quot;<br>
&gt; TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-amltd-linux-gnueab=
i&quot;<br>
&gt; MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;teton-p0382&quot;=
<br>
&gt; DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;amltd&quot;<=
br>
&gt; DISTRO_VERSION =C2=A0 =C2=A0=3D &quot;1.6+snapshot-20140812&quot;<br>
&gt; TUNE_FEATURES =C2=A0 =C2=A0 =3D &quot;arm armv7a vfp neon callconventi=
on-hard cortexa9&quot;<br>
&gt; TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vfp-neon&quot;<br>
&gt; meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;master:=
86afd7eb7c679eb065706137f28f44248f3fbc5a&quot;<br>
&gt; meta-amltd =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;master:899529b4184dc9e=
3e291e7fcdbbf157233db056d&quot;<br>
&gt; meta-teton-imx6-p0382 =3D &quot;master:9188e2f8fafd203c95dcd7a3c79cb38=
a1568e9b5&quot;<br>
&gt; meta-fsl-arm =C2=A0 =C2=A0 =C2=A0=3D &quot;master:b0cf5c78c5f98c5977ae=
556d331e7495648f154c&quot;<br>
&gt; meta-fsl-arm-extra =3D &quot;master:12e560967b7136222c325d11633295fe3a=
0c701c&quot;<br>
&gt; meta-browser =C2=A0 =C2=A0 =C2=A0=3D &quot;master:da93c8e386133a15eff1=
414d9307c8f2c7a44787&quot;<br>
&gt;<br>
&gt; Should this be filed as a bug? =C2=A0I don&#39;t have much data other =
than it<br>
&gt; simply breaks (and chrome is not the easiest thing to debug!). =C2=A0O=
ther<br>
&gt; applications seem OK, but I am loathe to trust it...<br>
&gt;<br>
&gt; I&#39;m going to hold onto GCC-4.8.x for my $DISTRO at least (and I ho=
pe<br>
&gt; it doesn&#39;t vanish like 4.7.x did too quickly).<br>
&gt;<br>
&gt; [1]<br>
&gt; <a href=3D"http://slashdot.org/story/14/07/27/1838219/linus-torvalds-g=
cc-490-seems-to-be-terminally-broken" target=3D"_blank">http://slashdot.org=
/story/14/07/27/1838219/linus-torvalds-gcc-490-seems-to-be-terminally-broke=
n</a><br>

&gt;<br>
&gt; Note: I&#39;ve also tried this on qemux86 (a totally different<br>
&gt; architecture) and chrome bombs just as badly!<br>
<br>
I confirm that GCC 4.9 does NOT work for Chromium 35. At this moment I<br>
am not aware of any fix for it.</blockquote><div><br></div><div>Again Its a=
 broad brush statement. Something concrete is needed if some.action is to t=
aken</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">

<br>
IIRC the Chromium 37 works though.<br>
<br></blockquote><div><br></div><div>Well then its less chance.that someone=
 will fix 35=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
--<br>
Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.=
com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile:=
 +1 (347) 903-9750<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--bcaec51b1b0f404c2105008c3d7f--
