Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id EE86260746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 19:52:07 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id u186so151363177ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 12:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W7jGLBJZmJRBOKUiifNZ8+ehIXNldQB98MxtKYNXlzw=;
	b=0z6n1blue3aNlP8aIQ7z38r7/ga53I/TcOx76uqiEHTR4AdS0fRnAk3XwA37C2P8Vs
	+D1la0vVZqccHo8BOlrFX8OXA+X2oQrag9fjzuc5KqJ3dXoGHU/o4JUaSXDbnKkSybdz
	HSB1qjCheh2FhLbfCGcl+qYT8j1Kgwm24+jYYO5l50I+V/CokdQKRQA4W0lCErvBJN64
	glE011CDnHJsIo8gLMMW2BoJhAZta1BObmWzeEUNGf3uVt3P25xVWBte6GnrQeyjX/rf
	2vj4Iq8S6VRgm+x95qKw9dqjU4DVMIxGD2gtzBzLhqGaAyoU6bu61kxbmTZ1pkbHZoAK
	xV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W7jGLBJZmJRBOKUiifNZ8+ehIXNldQB98MxtKYNXlzw=;
	b=Oe4IzEYmfPO8ccpFvCEEbpolJ+EemDKqSflEQOzidxIZfBWizeaRmRkF/Sr2dx2oW5
	O6nDmW7oVFuFMEvLwv06QpIJ6nbbsHDCYcF82c+QRjmGfCgDv2RQeV/ag9iC9/4M2mk4
	RmA5x2U3sG/gboazqiNPkt5sgKyvH0YqoWLEH+/eRmMareWDeMexYS1PBnJs0/SJu3Jd
	rrMskvcPElbzRLrqp6b2UUU+Sft4GaplNaqDV0oOSjssKIxq6+xt0ZBstdU5zoU7fy6i
	abWULAKuVJGorrZInxaKS6eJQBSDHZdzdkuMCYuqCEjsCuDddN9RiKBwU7hm2eNGnBRM
	49Ww==
X-Gm-Message-State: AEkoouuHp5pETu/lczX4hnbJ+Hgopl32ugepjibGwXUtRazWjzR9auK4HNKJ3+KAoq3HJwn9DgipRpyuwHB9kbGZ
X-Received: by 10.36.87.140 with SMTP id u134mr36449654ita.38.1469649128161;
	Wed, 27 Jul 2016 12:52:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 27 Jul 2016 12:51:48 -0700 (PDT)
In-Reply-To: <20160727170756.aridi4qzmmuyedyt@jama>
References: <1469637177-2657-1-git-send-email-ross.burton@intel.com>
	<20160727170756.aridi4qzmmuyedyt@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Jul 2016 20:51:48 +0100
Message-ID: <CAJTo0LZxbYTwvv0ywOwaBSVxaCJ82TAejikPefPh1F+Q1zvFkQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: add missing wayland-native dependency
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
X-List-Received-Date: Wed, 27 Jul 2016 19:52:14 -0000
Content-Type: multipart/alternative; boundary=001a1135018c3a900a0538a35a5a

--001a1135018c3a900a0538a35a5a
Content-Type: text/plain; charset=UTF-8

On 27 July 2016 at 18:07, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Jul 27, 2016 at 05:32:57PM +0100, Ross Burton wrote:
> > The wayland support requires wayland-scanner, so add a dependency on
> > wayland-native.
>
> Why is this needed when wayland already depends on wayland-native?
>

Because builds from sstate won't pull in all the build dependencies
transitively, just enough to do the required tasks. The requirements are
the wayland runtime libraries (wayland) and the native tooling
(wayland-native).

Ross

--001a1135018c3a900a0538a35a5a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 July 2016 at 18:07, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, =
Jul 27, 2016 at 05:32:57PM +0100, Ross Burton wrote:<br>
&gt; The wayland support requires wayland-scanner, so add a dependency on<b=
r>
&gt; wayland-native.<br>
<br>
</span>Why is this needed when wayland already depends on wayland-native?<b=
r></blockquote><div><br></div><div>Because builds from sstate won&#39;t pul=
l in all the build dependencies transitively, just enough to do the require=
d tasks. The requirements are the wayland runtime libraries (wayland) and t=
he native tooling (wayland-native).</div><div><br></div><div>Ross=C2=A0</di=
v></div><br></div></div>

--001a1135018c3a900a0538a35a5a--
