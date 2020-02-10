Return-Path: <persaur@gmail.com>
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
	[209.85.219.179])
	by mail.openembedded.org (Postfix) with ESMTP id D9A5F601E6;
	Mon, 10 Feb 2020 17:10:52 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id q190so909188ybg.3;
	Mon, 10 Feb 2020 09:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=content-transfer-encoding:from:mime-version:subject:message-id:date
	:cc:to; bh=EwFSk5rCNPF14V7Hol66+lTrsPUHo8hlHGKF3ApDk1Q=;
	b=gfQZjs5nyYFe9Zo9PXfxtfYty1VsHgYFUIziaEOulAOeo1bB4by4/3h/QiVISIY+rX
	XSXiCdLbGIDl9K+s9MLWsD0iezS19rJbJMQrMsHO4P5hL5XggqLFmqwcAhjiZEE5bXVc
	98AdtKUeYMxfJ7Kbkv7cpkIhOo4nmCVcX5X9OUc5LFs7IlzwRDEX87Y1R3huY+qXwxV8
	A/pau7YJlqm4kN0iTiS+pnVjISUQDX8y1376eEIf+IUSkMa1fKja9QVhLc3cqeKHDh9/
	bj2jDe95sQN1EhPuJoJhu6KMrr/PBZ+pqogMKOt/XXOhniEQUDR7fKNL1r3NyylIUpM3
	ATTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:message-id:date:cc:to;
	bh=EwFSk5rCNPF14V7Hol66+lTrsPUHo8hlHGKF3ApDk1Q=;
	b=kve06n/thC6MM1FIH5K4M+LfWypvriSHrTwbPjcUy5S8m1gU9ttJepZlVCuQVxAPD4
	d04PhBEL7IGTF4W806nSximAbO/75cuiX8cl4J/ehDNw5PawmLgia2b0UpC+ad0q4wqD
	KC8CrWSHSnQ/PbRgqB2NPTBMSeNJKKqL8nr9NO94VxWMXWHdb1pLnV7H5qQFyFOvSDOp
	ecmYR8ps5J0W/b/FcjmtivJKIRq0MfVmp8900MublXyGQmO7tqxbt2+U7yNzysjKuPFw
	c/qBTPANaclVAz2NmgwsiLwPeXRQWXVfqKU7Yi2hZ2hWY56A9qZ8ZNAYCqKhK6lN2Txx
	/imw==
X-Gm-Message-State: APjAAAUn0uxjp2VdhiLm8fLP9MPy89gAZcwzi7GBAown3AXb8Dwp4/46
	ZygrhxN+ti3BQHNHEkptVho=
X-Google-Smtp-Source: APXvYqyL2dvmcJwCv5gWJHxrKp2/YV9QFnUg47H3dXtUhsPYUJxOOMnYES+aAEiJvV009rO/VDLvcw==
X-Received: by 2002:a5b:14d:: with SMTP id c13mr2158833ybp.240.1581354653670; 
	Mon, 10 Feb 2020 09:10:53 -0800 (PST)
Received: from [100.64.72.61] ([173.245.215.240])
	by smtp.gmail.com with ESMTPSA id
	p204sm500611ywp.14.2020.02.10.09.10.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 10 Feb 2020 09:10:53 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <30A4CC9D-603A-458A-8ACD-EEC71389434A@gmail.com>
Date: Mon, 10 Feb 2020 12:10:52 -0500
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
X-Mailer: iPad Mail (17D50)
Cc: Mark Hatle <mark.hatle@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross.burton@intel.com>
Subject: Re: [Openembedded-architecture] Incorporating deploy artefacts from one multiconfig in another multiconfig
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
X-List-Received-Date: Mon, 10 Feb 2020 17:10:53 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-ACC1D051-30EE-4599-9DFA-A41E38A8CBBB
Content-Transfer-Encoding: 7bit

--Apple-Mail-ACC1D051-30EE-4599-9DFA-A41E38A8CBBB
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Feb 21, 2019, at 18:51, Richard Purdie <richard.purdie@linuxfoundation.or=
g> wrote:
>=20
> =EF=BB=BFMulticonfig is meant to support this workflow. Unfortunately ther=
e are
> open bugs and people haven't the time to work on it so its stalled.
> That said, the key pieces are already there.
>=20
> A picture is worth a thousand words. I thought a demo might interest
> people and "prove" this can work.
>=20
> To make it work you need four patches:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t222=
&id=3Db896b2238c100d486e7c43992b49001150749d04
>=20
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t222=
&id=3De5ef6b008e85f42b5e4ffd72fae7036dd68b2ea5
>=20
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t222=
&id=3D5d2bd43d14315ef3212e0d09a16446bd74305a2f
>=20
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t222=
&id=3Dabdb83576b699448b76293294809aaa04b8e853b
>=20
> The first two are fixes from Alejandro which haven't merged as they're
> not right. The third patch was me hitting the fixes and bitbake to make
> the demo work. That proves they're not right and hints at where we have
> some problems in bitbake too. We can get those issues sorted fairly
> easily and I'm going to block 2.7 M3 on them.
>=20
> The final patch is the interesting one.
>=20
> It adds a layer, meta-multiconfig-example layer with a README about how
> to configure it. Basically you create two multiconfig configurations,
> "musl" and "tiny".
>=20
> The demo is to run "bitbake core-image-full-cmdline".
>=20
> The result is a core-image-full-cmdline image with a tiny qemux86 image
> and a musl based qemux86-64 image installed into /var/lib/machines/
>=20
> The way it does this is creative, having a recipe called image-packer
> which creates virtclass variants of itself which depend on the
> appropriate multiconfig. It pulls in the images and creates a package
> containing them which the bbappend to core-image-full-cmdline can then
> install. It'd be very easy to turn this into a list driven piece of
> code rather than the two values currently listed.
>=20
> Its late here, some of the above code is horrible. I have rushed this
> but hopefully it shows this is possible! :)
>=20
> I've love to turn this into an oe-selftest, that is my ultimate=20
> intention for this code.
>=20
> As things stand today you can't query one multiconfig from another. As
> this demo shows, that doesn't need to stop you making interesting
> things though. We will do something with such querying eventually to
> make things easier but until then, much is still possible.

For search engines: the multiconfig demo from this thread is now is an oe-se=
lftest:

https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-selftest/recipes-t=
est/multiconfig/multiconfig-image-packager_0.1.bb
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/lib/oeqa/selftest/=
cases/multiconfig.py

Are there other public examples of combining artifacts from different machin=
es into a single image via multiconfig?  We can include them in a doc update=
 for Dunfell.  A list of use cases could motivate more people to try multico=
nfig.

For developer workflows, multiconfig can accelerate multi-image builds (more=
 parallelism) but slow single-package builds (more recipe parsing).  As a wo=
rkaround, BBMULTICONFIG=3D"" restores the speed of building a target for a s=
ingle MACHINE+DISTRO config.

Is there a better way to disable multiconfig for a single bitbake invocation=
?  Bitbake currently requires a MACHINE to be specified for multiconfig buil=
ds.  It also accepts non-multiconfig target names, even when BBMULTICONFIG i=
s defined.  =46rom a usability point of view, this CLI syntax could distingu=
ish the two workflows:

  standard build:  MACHINE=3Dfoo bitbake singleconfig-image =20
  multiconfig build:  bitbake mc::multiconfig-image

Rich=

--Apple-Mail-ACC1D051-30EE-4599-9DFA-A41E38A8CBBB
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On Feb 21, 2019, at 18:51,=
 Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt; wrote:<div dir=3D=
"ltr"><blockquote type=3D"cite"><span></span><br></blockquote><blockquote ty=
pe=3D"cite"><span>=EF=BB=BFMulticonfig is meant to support this workflow. Un=
fortunately there are</span><br></blockquote><blockquote type=3D"cite"><span=
>open bugs and people haven't the time to work on it so its stalled.</span><=
br></blockquote><blockquote type=3D"cite"><span>That said, the key pieces ar=
e already there.</span><br></blockquote><blockquote type=3D"cite"><span></sp=
an><br></blockquote><blockquote type=3D"cite"><span>A picture is worth a tho=
usand words. I thought a demo might interest</span><br></blockquote><blockqu=
ote type=3D"cite"><span>people and "prove" this can work.</span><br></blockq=
uote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote typ=
e=3D"cite"><span>To make it work you need four patches:</span><br></blockquo=
te><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><span>http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dr=
purdie/t222&amp;id=3Db896b2238c100d486e7c43992b49001150749d04</span><br></bl=
ockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote=
 type=3D"cite"><span>http://git.yoctoproject.org/cgit.cgi/poky-contrib/commi=
t/?h=3Drpurdie/t222&amp;id=3De5ef6b008e85f42b5e4ffd72fae7036dd68b2ea5</span>=
<br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><bl=
ockquote type=3D"cite"><span>http://git.yoctoproject.org/cgit.cgi/poky-contr=
ib/commit/?h=3Drpurdie/t222&amp;id=3D5d2bd43d14315ef3212e0d09a16446bd74305a2=
f</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockq=
uote><blockquote type=3D"cite"><span>http://git.yoctoproject.org/cgit.cgi/po=
ky-contrib/commit/?h=3Drpurdie/t222&amp;id=3Dabdb83576b699448b76293294809aaa=
04b8e853b</span><br></blockquote><blockquote type=3D"cite"><span></span><br>=
</blockquote><blockquote type=3D"cite"><span>The first two are fixes from Al=
ejandro which haven't merged as they're</span><br></blockquote><blockquote t=
ype=3D"cite"><span>not right. The third patch was me hitting the fixes and b=
itbake to make</span><br></blockquote><blockquote type=3D"cite"><span>the de=
mo work. That proves they're not right and hints at where we have</span><br>=
</blockquote><blockquote type=3D"cite"><span>some problems in bitbake too. W=
e can get those issues sorted fairly</span><br></blockquote><blockquote type=
=3D"cite"><span>easily and I'm going to block 2.7 M3 on them.</span><br></bl=
ockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote=
 type=3D"cite"><span>The final patch is the interesting one.</span><br></blo=
ckquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote t=
ype=3D"cite"><span>It adds a layer, meta-multiconfig-example layer with a RE=
ADME about how</span><br></blockquote><blockquote type=3D"cite"><span>to con=
figure it. Basically you create two multiconfig configurations,</span><br></=
blockquote><blockquote type=3D"cite"><span>"musl" and "tiny".</span></blockq=
uote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote typ=
e=3D"cite"><span>The demo is to run "bitbake core-image-full-cmdline".</span=
><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><b=
lockquote type=3D"cite"><span>The result is a core-image-full-cmdline image w=
ith a tiny qemux86 image</span><br></blockquote><blockquote type=3D"cite"><s=
pan>and a musl based qemux86-64 image installed into /var/lib/machines/</spa=
n><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><=
blockquote type=3D"cite"><span>The way it does this is creative, having a re=
cipe called image-packer</span><br></blockquote><blockquote type=3D"cite"><s=
pan>which creates virtclass variants of itself which depend on the</span><br=
></blockquote><blockquote type=3D"cite"><span>appropriate multiconfig. It pu=
lls in the images and creates a package</span><br></blockquote><blockquote t=
ype=3D"cite"><span>containing them which the bbappend to core-image-full-cmd=
line can then</span><br></blockquote><blockquote type=3D"cite"><span>install=
. It'd be very easy to turn this into a list driven piece of</span><br></blo=
ckquote><blockquote type=3D"cite"><span>code rather than the two values curr=
ently listed.</span><br></blockquote><blockquote type=3D"cite"><span></span>=
<br></blockquote><blockquote type=3D"cite"><span>Its late here, some of the a=
bove code is horrible. I have rushed this</span><br></blockquote><blockquote=
 type=3D"cite"><span>but hopefully it shows this is possible! :)</span><br><=
/blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockqu=
ote type=3D"cite"><span>I've love to turn this into an oe-selftest, that is m=
y ultimate </span><br></blockquote><blockquote type=3D"cite"><span>intention=
 for this code.</span><br></blockquote><blockquote type=3D"cite"><span></spa=
n><br></blockquote><blockquote type=3D"cite"><span>As things stand today you=
 can't query one multiconfig from another. As</span><br></blockquote><blockq=
uote type=3D"cite"><span>this demo shows, that doesn't need to stop you maki=
ng interesting</span><br></blockquote><blockquote type=3D"cite"><span>things=
 though. We will do something with such querying eventually to</span><br></b=
lockquote><blockquote type=3D"cite"><span>make things easier but until then,=
 much is still possible.</span></blockquote><br></div><div dir=3D"ltr">For s=
earch engines: the multiconfig demo from this thread is now is an oe-selftes=
t:</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"ltr"><a href=
=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-selftest/recip=
es-test/multiconfig/multiconfig-image-packager_0.1.bb">https://git.yoctoproj=
ect.org/cgit/cgit.cgi/poky/tree/meta-selftest/recipes-test/multiconfig/multi=
config-image-packager_0.1.bb</a></div></div><div dir=3D"ltr"><a href=3D"http=
s://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/lib/oeqa/selftest/case=
s/multiconfig.py">https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/=
lib/oeqa/selftest/cases/multiconfig.py</a></div><div dir=3D"ltr"><br></div><=
div dir=3D"ltr">Are there other public examples of combining artifacts from d=
ifferent machines into a single image via multiconfig? &nbsp;We can include t=
hem in a doc update for Dunfell. &nbsp;A list of use cases could motivate mo=
re people to try multiconfig.</div><div dir=3D"ltr"><br></div><div dir=3D"lt=
r">For developer workflows, multiconfig can accelerate multi-image builds (m=
ore parallelism) but slow single-package builds (more recipe parsing). &nbsp=
;As a workaround, BBMULTICONFIG=3D"" restores the speed of building a target=
 for a single MACHINE+DISTRO config.</div><div dir=3D"ltr"><br></div><div di=
r=3D"ltr">Is there a better way to disable multiconfig for a single bitbake i=
nvocation? &nbsp;Bitbake currently requires a MACHINE to be specified for mu=
lticonfig builds. &nbsp;It also accepts non-multiconfig target names, even w=
hen BBMULTICONFIG is defined. &nbsp;=46rom a usability point of view, this C=
LI syntax could distinguish the two workflows:</div><div dir=3D"ltr"><br></d=
iv><div dir=3D"ltr">&nbsp; standard build: &nbsp;MACHINE=3Dfoo bitbake singl=
econfig-image &nbsp;</div><div dir=3D"ltr">&nbsp; multiconfig build: &nbsp;b=
itbake mc::multiconfig-image</div><div dir=3D"ltr"><br></div><div dir=3D"ltr=
">Rich</div></div></body></html>=

--Apple-Mail-ACC1D051-30EE-4599-9DFA-A41E38A8CBBB--
