Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2203974197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:45:29 +0000 (UTC)
Received: by iod35 with SMTP id 35so40775229iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0DckuKBI+lkYMWgFk1Rt1+oa1SAGQgbafmhhF2h2wss=;
	b=emydPEMEnkXSCe/s+RG3I/GC8Cf8AFwJPpfDdWQ7HE4GHJ30ZrwBb+nk/xoDERYFXr
	dQllcnPHtECVLDPXhRpS+hGPp1UrMU5/csPegcG9lP29lx+GiPO6yfFjhekipebkxUDt
	RI3Z05LVp3ogJciqdCPzyu8j8NdW1hGxdUHKuM9TUJbHRdE1rZ0nw5ubI1/sK9T5IThp
	qdyA9MMctMEHdB86SDxef85FDWjy+oTgzVmlolAbCi5ChfxwQ/U0rzDFmGcXi30hk1IR
	VNCzxx6KbdlL4iKgWYyjSifA4JFe5BN/DMX5PC7XtsdYuYDEN3s/CpRgCu1xGyc5QcxQ
	Vhzw==
MIME-Version: 1.0
X-Received: by 10.107.40.200 with SMTP id o191mr25139111ioo.83.1441050329545; 
	Mon, 31 Aug 2015 12:45:29 -0700 (PDT)
Received: by 10.79.100.71 with HTTP; Mon, 31 Aug 2015 12:45:29 -0700 (PDT)
In-Reply-To: <20150831184113.GF2465@jama>
References: <20150830114819.3628250369@opal.openembedded.org>
	<20150831184113.GF2465@jama>
Date: Mon, 31 Aug 2015 12:45:29 -0700
Message-ID: <CABcZANmoHZM=p5Y_TYoUhHLDY1sboz8t_i=ShCu9dyNLeVUdPg@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Christopher Larson : update-rc.d.bbclass: explicitly dep on initscripts
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
X-List-Received-Date: Mon, 31 Aug 2015 19:45:32 -0000
Content-Type: multipart/alternative; boundary=001a1141cf8cff0f7f051ea0ac8d

--001a1141cf8cff0f7f051ea0ac8d
Content-Type: text/plain; charset=UTF-8

On Monday, August 31, 2015, Martin Jansa <martin.jansa@gmail.com
<javascript:_e(%7B%7D,'cvml','martin.jansa@gmail.com');>> wrote:

> On Sun, Aug 30, 2015 at 11:48:19AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 833302761df924bb503cc2ad04ecae1023381f8f
> > URL:
> http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=833302761df924bb503cc2ad04ecae1023381f8f
> >
> > Author: Christopher Larson <chris_larson@mentor.com>
> > Date:   Mon Aug 24 15:18:34 2015 -0700
> >
> > update-rc.d.bbclass: explicitly dep on initscripts
> >
> > update-rc.d doesn't just want an initscripts package, it wants
> > initscripts-functions. In the case where VIRTUAL-RUNTIME_initscripts is
> set to
> > nothing, update-rc.d still needs initscripts-functions to satisfy its
> runtime
> > dependencies. Further, we shouldn't be using a *runtime* virtual in a
> *build
> > time* variable. This should resolve image creation failures with
> > configurations without sysv initscripts when a recipe inherits
> update-rc.d and
> > doesn't inherit systemd.
> >
> > (From OE-Core rev: e6642ae0849e5ac3174c643a7693af25d829d6d1)
>
> Unfortunately this means that I cannot PNBLACKLIST initscripts recipe in
> DISTRO which provides own initscripts implementation (which also
> provides initscripts-functions).
>
> What's even worse is that I'll have to overlay whole bbclass to get rid
> of this dependency :/


Of course you can. This is a build dependency. Add a PROVIDES +=
"initscripts" + appropriate preferences (or keep your PNBLACKLIST). This is
precisely what provides is for. Alternatively, we could introduce a
virtual/initscripts-functions rather than using 'initscripts' for this. In
either case, you don't need to override anything.


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141cf8cff0f7f051ea0ac8d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Monday, August 31, 2015, Martin Jansa &lt;<a href=3D"ja=
vascript:_e(%7B%7D,&#39;cvml&#39;,&#39;martin.jansa@gmail.com&#39;);" targe=
t=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">On Sun, Aug 30, 2015 at 11:48:19AM +0000, <a>git@git.openembedded=
.org</a> wrote:<br>
&gt; Module: openembedded-core.git<br>
&gt; Branch: master<br>
&gt; Commit: 833302761df924bb503cc2ad04ecae1023381f8f<br>
&gt; URL:=C2=A0 =C2=A0 <a href=3D"http://git.openembedded.org/?p=3Dopenembe=
dded-core.git&amp;a=3Dcommit;h=3D833302761df924bb503cc2ad04ecae1023381f8f" =
target=3D"_blank">http://git.openembedded.org/?p=3Dopenembedded-core.git&am=
p;a=3Dcommit;h=3D833302761df924bb503cc2ad04ecae1023381f8f</a><br>
&gt;<br>
&gt; Author: Christopher Larson &lt;<a>chris_larson@mentor.com</a>&gt;<br>
&gt; Date:=C2=A0 =C2=A0Mon Aug 24 15:18:34 2015 -0700<br>
&gt;<br>
&gt; update-rc.d.bbclass: explicitly dep on initscripts<br>
&gt;<br>
&gt; update-rc.d doesn&#39;t just want an initscripts package, it wants<br>
&gt; initscripts-functions. In the case where VIRTUAL-RUNTIME_initscripts i=
s set to<br>
&gt; nothing, update-rc.d still needs initscripts-functions to satisfy its =
runtime<br>
&gt; dependencies. Further, we shouldn&#39;t be using a *runtime* virtual i=
n a *build<br>
&gt; time* variable. This should resolve image creation failures with<br>
&gt; configurations without sysv initscripts when a recipe inherits update-=
rc.d and<br>
&gt; doesn&#39;t inherit systemd.<br>
&gt;<br>
&gt; (From OE-Core rev: e6642ae0849e5ac3174c643a7693af25d829d6d1)<br>
<br>
Unfortunately this means that I cannot PNBLACKLIST initscripts recipe in<br=
>
DISTRO which provides own initscripts implementation (which also<br>
provides initscripts-functions).<br>
<br>
What&#39;s even worse is that I&#39;ll have to overlay whole bbclass to get=
 rid<br>
of this dependency :/</blockquote><div><br></div><div><font size=3D"2"><spa=
n style=3D"background-color:rgba(255,255,255,0)">Of course you can. This is=
 a build dependency. Add a PROVIDES +=3D &quot;initscripts&quot; + appropri=
ate preferences (or keep your PNBLACKLIST). This is precisely what provides=
 is for. Alternatively, we could introduce a virtual/initscripts-functions =
rather than using &#39;initscripts&#39; for this. In either case, you don&#=
39;t need to override anything.<span></span></span></font></div>
</div>
<br><br>-- <br><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br=
>Senior Software Engineer, Mentor Graphics</div><br>

--001a1141cf8cff0f7f051ea0ac8d--
