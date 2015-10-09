Return-Path: <logan.buchy@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8A70D76E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 20:47:56 +0000 (UTC)
Received: by ykba192 with SMTP id a192so85794552ykb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 13:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=U/BDL/dSQ1lIJERcz3wkV8RJocKQxTpAYBJr72fuxTM=;
	b=XGcKSv8gMTQAiacPe4Rb+2MNGqnfyKgTLvZDnQdWYohUMs8kGbr4kaQWerh36xngN4
	qjIjxbLepATJU388b5uFdXbdpBfFRTqh71sBtPp1ledBpZJjoA1AMfWiWzmSs/oqhCd8
	hXTbJ40j+cfzsBo9vF2jV3WoyxiQpBmufAfBVdaV5VmUf/z1S4mZikDRhj7Snux/AkGB
	4RU8MI0oxWvb7Jw67wZLUcROARQeE0PsSb6TPjk8GuB1e/Kp4zrPKJFMbFWMJBav76Kz
	mQo9Q1F99TPu/K4uEadG4G09/8dUCo5dLOD1X0oH7ykJMpbN5jFE4VO3IDVD1X0ItYjQ
	wKEw==
MIME-Version: 1.0
X-Received: by 10.129.109.142 with SMTP id i136mr10715426ywc.50.1444423676199; 
	Fri, 09 Oct 2015 13:47:56 -0700 (PDT)
Received: by 10.13.233.197 with HTTP; Fri, 9 Oct 2015 13:47:56 -0700 (PDT)
Date: Fri, 9 Oct 2015 13:47:56 -0700
Message-ID: <CAH=96PHKBTZ3M1gvgsr8meT67NvB4Hp808jSnBvjMgAG6QqR1g@mail.gmail.com>
From: Logan Buchy <logan.buchy@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Question regarding project organization with OE
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
X-List-Received-Date: Fri, 09 Oct 2015 20:48:00 -0000
Content-Type: multipart/alternative; boundary=001a114daee0200d5a0521b21891

--001a114daee0200d5a0521b21891
Content-Type: text/plain; charset=UTF-8

Hi,

It's my first time posting here, I hope I have the right mailing list!

I've been looking into OE in the last few days as a candidate to replace
the ageing build scripts in a project I am involved with.  I've been really
impressed with OE's feature list - it ticks off a lot of boxes for our
requirements.

I am still working out some of the workflows though before we go ahead and
make the switch, I was hoping someone could help me out.

The project I am working on consists of several embedded targets.  All
targets currently run on the same system-on-chip and are built with the
same toolchain, though this will note be the case in the near future. The
majority of the project exists as a monolithic application that is built
with different DEFINEs in order to customize the application's behaviour.
Each target also has a unique rootfs layout (different init scripts mostly).

For the sake of clarity, lets call this application 'Foo', and two targets
'alpha' and 'beta'.

I am trying to figure out the best was to setup recipes in order to
maintain this structure.

I'm thinking that managing the targets is best left to image-recipes in a
separate layer.  Essentially adding:
* recipes-core/images/target-alpha.bb
* recipes-core/images/target-beta.bb

Managing the 'Foo' application is currently done with a regular package
recipe:
* recipes-core/Foo/foo.bb

However, I am not sure if the image recipes can dictate how to build Foo,
the dependent recipe.  Is this possible? Is there an alternative workflow?

Would it be better if 'targets' were managed as separate distros instead?
Currently some targets use different kernel versions than others, and all
targets use different kernel configs.  I haven't yet figured out if this is
possible to specify from within an image recipe.

Any help is appreciated!

Thanks,
Logan

--001a114daee0200d5a0521b21891
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hi,<br><br></div>It&#39;s my=
 first time posting here, I hope I have the right mailing list!=C2=A0 <br><=
br>I&#39;ve
 been looking into OE in the last few days as a candidate to replace the
 ageing build scripts in a project I am involved with.=C2=A0 I&#39;ve been =
really
 impressed with OE&#39;s feature list - it ticks off a lot of boxes for our=
=20
requirements.<br><br></div>I am still working out some of the workflows=20
though before we go ahead and make the switch, I was hoping someone=20
could help me out.<br><br></div>The project I am working on consists of=20
several embedded targets.=C2=A0 All targets currently run on the same=20
system-on-chip and are built with the same toolchain, though this will=20
note be the case in the near future. The majority of the project exists=20
as a monolithic application that is built with different DEFINEs in=20
order to customize the application&#39;s behaviour.=C2=A0 Each target also =
has a=20
unique rootfs layout (different init scripts mostly).<br><br></div><div>For=
 the sake of clarity, lets call this application &#39;Foo&#39;, and two tar=
gets &#39;alpha&#39; and &#39;beta&#39;.<br></div><div><br></div>I am tryin=
g to figure out the best was to setup recipes in order to maintain this str=
ucture.<br><br></div>I&#39;m thinking that managing the targets is best lef=
t to image-recipes in a separate layer.=C2=A0 Essentially adding:<br>* reci=
pes-core/images/<a href=3D"http://target-alpha.bb" target=3D"_blank">target=
-alpha.bb</a><br>* recipes-core/images/<a href=3D"http://target-beta.bb" ta=
rget=3D"_blank">target-beta.bb</a><br><br></div><div>Managing the &#39;Foo&=
#39; application is currently done with a regular package recipe:<br></div>=
<div>* recipes-core/Foo/<a href=3D"http://foo.bb" target=3D"_blank">foo.bb<=
/a><br><br></div><div>However,
 I am not sure if the image recipes can dictate how to build Foo, the=20
dependent recipe.=C2=A0 Is this possible? Is there an alternative workflow?=
<br><br></div><div>Would
 it be better if &#39;targets&#39; were managed as separate distros instead=
?=C2=A0=20
Currently some targets use different kernel versions than others, and=20
all targets use different kernel configs.=C2=A0 I haven&#39;t yet figured o=
ut if=20
this is possible to specify from within an image recipe.<br><br></div><div>=
Any help is appreciated!<br></div><div><br></div><div>Thanks,<br></div>Loga=
n</div>

--001a114daee0200d5a0521b21891--
