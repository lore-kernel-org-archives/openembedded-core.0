Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 79F2A7C6F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 11:21:10 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id f9so497705ual.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 03:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LiNwrRbAhdUINym5/HrX6XU00qguX0jEP7MfmPJ9PoY=;
	b=HM2qRExlF9/w7ZnXRYhRHE2GBa+M4+rE2XPdrWm3i273ijYe2XNa+CgJVFjzKt3IBD
	fmcWwe/lurloKJJBekCfk+B6L7iJS4s6Z9t8QBDOB50RScxpSiHdN4bhvTt4z4+LwY7h
	+cnxhaHvHJF0N2c4GDXHp/c3Zq918jqn9U0DBs3bYAVIL5lhNanCNht5ABEXMxOonTPq
	/RE4/meRpugl5QhAlHWrp00qZhJ1cKEl3cjANe7l8/um7gdEmz9+Bk4LEEcyk7RU7xz1
	UUdwfL2KXF03PbNnOKRsOWO0+ZbnubLUhdXOwcdbQzgdgK5b69dQiWCFqWonHLOai1OX
	OvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LiNwrRbAhdUINym5/HrX6XU00qguX0jEP7MfmPJ9PoY=;
	b=lJYBOo19CpFjnB5aRJrep/X0bX05ifNDecCuwUqeW7vcADU3k1HacaA5P7EgmrXsKm
	JMJrZiBuBjbMxZFpq2xnUGEfBk3Fr4ppG+RqGfOL05/gYUMDz/vbZa/ByESC4ohh87X2
	szB1HdbKr9PclMtJXfpqFZsQNJVN33FLHG/jOzkstoLArgPaMhVvhEaZvLvcqPKcWcUB
	DbbLozTxOcqptzfWWwJbXMnypiGIfrRsCv4Xp6d9YoMqVB/8BwuNUPlag5qxU4WuW469
	Fdhr+8D6JZum8i0qcBojYmKjFNRxiI1INYv232cjNZOlsyaO9AJ4UpFtxcZ8qUlY2pVQ
	Yzhw==
X-Gm-Message-State: APjAAAUY3GtZ0R3blO9eAtMAw23zYMpukkLSvMyt8/1YXDutf6mO2RiB
	MzANAGjta7JN9c0u/R4FrR0OH59Ij1k4m2T7peU=
X-Google-Smtp-Source: APXvYqxLPY6BbafYevJXo3srEgomb9Jzv1vRoYEgTTKN+myWlUMGRDPyDcYFJ1OwX/aZTfonctsdGLQQbuB9HRjgh/I=
X-Received: by 2002:ab0:94:: with SMTP id 20mr888222uaj.71.1576668071398; Wed,
	18 Dec 2019 03:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20191217160012.42152-1-alex.kanavin@gmail.com>
	<5b4bdd1facaee89ae67e41961ac3e9abb01004bb.camel@linuxfoundation.org>
In-Reply-To: <5b4bdd1facaee89ae67e41961ac3e9abb01004bb.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Dec 2019 12:20:59 +0100
Message-ID: <CANNYZj9Qg0XCY87kgLvexaT-C91n85MviFNxniiV6xaY94045w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] gettext-minimal-native: update to 0.20.1
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
X-List-Received-Date: Wed, 18 Dec 2019 11:21:10 -0000
Content-Type: multipart/alternative; boundary="000000000000530fbc0599f8a488"

--000000000000530fbc0599f8a488
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Dec 2019 at 11:00, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2019-12-17 at 17:00 +0100, Alexander Kanavin wrote:
> > Rather than update a tarball, I took m4 files directly from an
> > install of 0.20.1.
> >
> > The patch is dropped as guile has long been removed from oe-core.
>
> I ran this series through the autobuilder in comparative isolation.
>
> qemuarm failed:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/1368
>

This failure is due to mkfontscale proceeding to compile without doing
do_unpack (hashequiv issue):

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/qemuarm/build/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile




> native failure on centos7
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/704
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/357
>
> nspr-native failure on aarch64
>

Same here in both failures: do_compile runs without do_unpack.

Alex

--000000000000530fbc0599f8a488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 18 Dec 2019 at 11:00, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2019-12-17 at 17:00=
 +0100, Alexander Kanavin wrote:<br>
&gt; Rather than update a tarball, I took m4 files directly from an<br>
&gt; install of 0.20.1.<br>
&gt; <br>
&gt; The patch is dropped as guile has long been removed from oe-core.<br>
<br>
I ran this series through the autobuilder in comparative isolation.<br>
<br>
qemuarm failed:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/53/build=
s/1368" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/53/builds/1368</a><br></blockquote><div><br></div=
><div>This failure is due to mkfontscale proceeding to compile without doin=
g do_unpack (hashequiv issue):<br></div><div><pre class=3D"gmail-select-con=
tent gmail-log"><div class=3D"gmail-logline gmail-ng-scope"><span class=3D"=
gmail-no-wrap gmail-log_o"><span class=3D"gmail-">Summary: 1 task failed:</=
span></span></div><div class=3D"gmail-logline gmail-ng-scope"><span class=
=3D"gmail-no-wrap gmail-log_o"><span class=3D"gmail-">  virtual:native:/hom=
e/pokybuild/yocto-worker/qemuarm/build/meta/recipes-graphics/xorg-app/mkfon=
tscale_1.2.1.bb:do_compile</span></span></div><div class=3D"gmail-logline g=
mail-ng-scope"><span class=3D"gmail-no-wrap gmail-log_o"><span class=3D"gma=
il-"><br></span></span></div><div class=3D"gmail-logline gmail-ng-scope"><s=
pan class=3D"gmail-no-wrap gmail-log_o"><span class=3D"gmail-"><br></span><=
/span></div></pre></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
native failure on centos7<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/97/build=
s/704" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/97/builds/704</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/357" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/82/builds/357</a><br>
<br>
nspr-native failure on aarch64<br></blockquote><div><br></div><div>Same her=
e in both failures: do_compile runs without do_unpack.</div><div><br></div>=
<div>Alex<br></div></div></div>

--000000000000530fbc0599f8a488--
