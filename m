Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5827760A88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 23:23:56 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w6so5923279lbh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 16:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=0CT9fibctUopVX9Z0Gn+k3XB43foIdOTmtjcenJ4AjU=;
	b=0BfVVpXMmOhf2yud983KYFLbtcwThkFa5JjaQFoDohxXYJ8II2tB/g/feAUL3Mpp6Y
	jy1xjBTTpeuIh0bqXVFnjpWxCm4pUEC/Eylzw+sR1uFGcWMyUlsVkWZlMlsRBVBk23rS
	tNw2P2BJgK6jkpe+pU3vbkLWpXGaxkTArfdG/5VRp6RXGefaSAzGWrc+dobCcsJ4/f6a
	RqNEah7/zVMgCJ/Hnwcv/q79i29Z9jqxuIzPm+QuLecIZ9FooXeU6p4Yal6pQjqhGe5D
	xsTg3fprtJt1LjdtugcwAE7fhbiVCqrjAf6eS6xwckU0bhGkgcO3SniP3V/L8OEasTSN
	xV3A==
X-Received: by 10.112.149.197 with SMTP id uc5mr31342413lbb.19.1379460236724; 
	Tue, 17 Sep 2013 16:23:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.53.197 with HTTP; Tue, 17 Sep 2013 16:23:36 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 17 Sep 2013 16:23:36 -0700
Message-ID: <CABcZANkGd7riMtRE2KfAz+WufoMjr=GYxXHsO2tFSaxXXxS7BQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] Common code/framework for automatic runtime dependencies
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
X-List-Received-Date: Tue, 17 Sep 2013 23:23:57 -0000
Content-Type: multipart/alternative; boundary=047d7b343cd264503e04e69c9d77

--047d7b343cd264503e04e69c9d77
Content-Type: text/plain; charset=UTF-8

Greetings,

I recently found myself wanting to implement a prototype of automatic
python dependencies. In so doing, I realized that there's a certain pattern
followed by each of these (shlibs, pkgconfig, kernel modules, ..), so I'd
like to propose, in the 1.6 timeframe, consolidating this into common core
code to make it easier to implement additional types of automatic rdepends
where appopriate. This would also make it easy to enable a sanity check
across all types to warn/fail if an automatic rdepend was generated for a
recipe which isn't also explicitly included in the depends, to catch
non-deterministic build issues.

Does this concept seem relatively sane? I have a prototype of this in a
layer that I've been playing with. I have so far added two modules for it,
a pkg-config one that I've confirmed is behaving the same as the existing
pkg-config dep handling, and a prototype python one which works for the
most part, but is still a work-in-progress. I'd appreciate any comments on
this. If folks don't think this is a good approach, I'm open to that too,
but it seemed silly to have these things reimplemented or duplicated when
the logic appears to be the same.

See https://github.com/kergoth/meta-package-auto-deps for the prototype.
https://github.com/kergoth/meta-package-auto-deps/blob/master/TODO.md shows
my next steps.

Thanks for your time,
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b343cd264503e04e69c9d77
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings,<div><br></div><div>I recently found myself want=
ing to implement a prototype of automatic python dependencies. In so doing,=
 I realized that there&#39;s a certain pattern followed by each of these (s=
hlibs, pkgconfig, kernel modules, ..), so I&#39;d like to propose, in the 1=
.6 timeframe, consolidating this into common core code to make it easier to=
 implement additional types of automatic rdepends where appopriate. This wo=
uld also make it easy to enable a sanity check across all types to warn/fai=
l if an automatic rdepend was generated for a recipe which isn&#39;t also e=
xplicitly included in the depends, to catch non-deterministic build issues.=
</div>

<div><br></div><div>Does this concept seem relatively sane? I have a protot=
ype of this in a layer that I&#39;ve been playing with. I have so far added=
 two modules for it, a pkg-config one that I&#39;ve confirmed is behaving t=
he same as the existing pkg-config dep handling, and a prototype python one=
 which works for the most part, but is still a work-in-progress. I&#39;d ap=
preciate any comments on this. If folks don&#39;t think this is a good appr=
oach, I&#39;m open to that too, but it seemed silly to have these things re=
implemented or duplicated when the logic appears to be the same.</div>

<div><br></div><div style>See=C2=A0<a href=3D"https://github.com/kergoth/me=
ta-package-auto-deps">https://github.com/kergoth/meta-package-auto-deps</a>=
=C2=A0for the prototype.=C2=A0<a href=3D"https://github.com/kergoth/meta-pa=
ckage-auto-deps/blob/master/TODO.md">https://github.com/kergoth/meta-packag=
e-auto-deps/blob/master/TODO.md</a>=C2=A0shows my next steps.</div>

<div><br></div><div>Thanks for your time,<br>-- <br>Christopher Larson<br>c=
larson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br=
>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics

</div></div>

--047d7b343cd264503e04e69c9d77--
