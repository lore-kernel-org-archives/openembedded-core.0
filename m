Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 36FF37E6B2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 11:31:40 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id q186so9710526oia.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 04:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9y3zdE7Fb1ZRbRD/eKiX9h9rtpuF3UXrQ+UmG+TNsDU=;
	b=K0qL3Vnjqoe2ArqsHOecoYVHEKOrstC1yTA/+F2R4U5aPnVCgD587F3p1OiK6g+Pnt
	/q6z2AYs+DW3VobR0MHSE6Tbjm+rgFtZlHqX6rUOmmsIZ4qIEJ26zmw/GOxqGhNOv465
	v/BqgVMV7gKzVP1kKJ4Q+CiSKUzIp78cg87G08Dr5WJgRDwOOH1R+PW4pitvICrfuFO9
	7Z9y9Vcc+F+q78QP0XrY44ALpwddGZDrKxIS0qJb8TsAUzvgCj0emw8J4XrZ6UgEw+uU
	LO83cCrH7T4TiP0rO/YVhzCqCUpmdwN7GuyY+gc3o4eyXq1b4763oVGpJ2L0WT+F8qRO
	wDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9y3zdE7Fb1ZRbRD/eKiX9h9rtpuF3UXrQ+UmG+TNsDU=;
	b=n6tjrK34LnbgquuaAS89Zi5gjTL1XR1u66RgWr1HteRYqXj7LdUR7H+s6dK7U3MwNH
	L2QyAA5ZIsQ/Dq++COi4A00xFau0UWJnzfZ+1zfvfh2a1immUNJNLiJaJjriNZhFdBp4
	GNYVGm+9tOxI58fxiTfeUmLiMgKrRUehRB2JSfF6LHgr6wN5ujjOekRPWtHoqmhye5k4
	3LoEGAgAASYtcvT3KseCs1wFosgxUo1vtZ9+iRMEyDGVq3Q0WbpVPZGQQPiNsdYdN+c4
	FxbkM37oANSadXe1hve6SGDblRw3OEuaSKirL8QmOysDt01343zAtSe0hD5HXQqi8S1d
	OACQ==
X-Gm-Message-State: APjAAAWTEXb/narhz1mYxwsw7nB2wbzD8D2VzHKkLIN6viQs4FbfWrWO
	bLTSk8F49LVbVgwh6os3VtOb5hj/+YfxCImgiOk=
X-Google-Smtp-Source: APXvYqxyzjZ88+prjTpf2GFv9/UDjmFjXwUxziLlMkutODzGauoNk2oPfgRzLnP0LbuJ1ZLZDhw5NQecHLF3bpF1SKA=
X-Received: by 2002:aca:6087:: with SMTP id u129mr1685639oib.70.1559388701968; 
	Sat, 01 Jun 2019 04:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190531155612.75663-1-alex.kanavin@gmail.com>
	<20190531155612.75663-7-alex.kanavin@gmail.com>
	<b22d487548905237681a0d8ea2c18a17da1714c2.camel@linuxfoundation.org>
	<CAJTo0LYzkjafKZ9uiY493gFSq_YgsRdMMQnUNN12cj0yKtOxJA@mail.gmail.com>
In-Reply-To: <CAJTo0LYzkjafKZ9uiY493gFSq_YgsRdMMQnUNN12cj0yKtOxJA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 1 Jun 2019 13:31:26 +0200
Message-ID: <CANNYZj8fi-utM5vBb4Bx90EuW7Sft1iBLFr7knR6bNhkk6CcqA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] mesa: switch over to official git
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
X-List-Received-Date: Sat, 01 Jun 2019 11:31:41 -0000
Content-Type: multipart/alternative; boundary="000000000000a5ce29058a4179ff"

--000000000000a5ce29058a4179ff
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 May 2019 at 18:27, Burton, Ross <ross.burton@intel.com> wrote:

> On Fri, 31 May 2019 at 17:25, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2019-05-31 at 17:56 +0200, Alexander Kanavin wrote:
> > > The tarballs for all versions prior to 18.x have been moved to
> > > https://mesa.freedesktop.org/archive/older-versions/
> > >
> > > To avoid this practice causing fetching failures in the future,
> > > let's use the git.
> >
> > I'm really not sure we want to move things over to git, it does end up
> > making the build process slower as they take longer to fetch, unpack
> > and clean up :/.
>
> Maybe explain to upstream that this older-versions/ thing is just a
> bit annoying for distros and they'll remove it?
>
> The alternative is to do what libpng already does for this situation:
>
> recipes-multimedia/libpng/libpng_1.6.37.bb:
> MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/
> ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
>
> Not pretty, but it works.
>

Anyway, I dropped the patches, and updated mesa-demos to 8.4.0 instead.
They published the 8.4.0 tarball where upstream version checker didn't
look, and so 8.3.0 was reported as latest :-( It's this lack of consistency
about where mesa upstream places tarballs which makes me reluctant to add
the MIRRORS hack.

Alex

--000000000000a5ce29058a4179ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 31 May 2019 at 18:27, Burton, Ross &lt;<a href=3D"mailto:ros=
s.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Fri, 31 May 2019 at 17:25, Rich=
ard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; On Fri, 2019-05-31 at 17:56 +0200, Alexander Kanavin wrote:<br>
&gt; &gt; The tarballs for all versions prior to 18.x have been moved to<br=
>
&gt; &gt; <a href=3D"https://mesa.freedesktop.org/archive/older-versions/" =
rel=3D"noreferrer" target=3D"_blank">https://mesa.freedesktop.org/archive/o=
lder-versions/</a><br>
&gt; &gt;<br>
&gt; &gt; To avoid this practice causing fetching failures in the future,<b=
r>
&gt; &gt; let&#39;s use the git.<br>
&gt;<br>
&gt; I&#39;m really not sure we want to move things over to git, it does en=
d up<br>
&gt; making the build process slower as they take longer to fetch, unpack<b=
r>
&gt; and clean up :/.<br>
<br>
Maybe explain to upstream that this older-versions/ thing is just a<br>
bit annoying for distros and they&#39;ll remove it?<br>
<br>
The alternative is to do what libpng already does for this situation:<br>
<br>
recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.37.bb" rel=3D"norefe=
rrer" target=3D"_blank">libpng_1.6.37.bb</a>:<br>
MIRRORS +=3D &quot;${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}=
/<br>
${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/&qu=
ot;<br>
<br>
Not pretty, but it works.<br>
</blockquote><br></div><div class=3D"gmail_quote">Anyway, I dropped the pat=
ches, and updated mesa-demos to 8.4.0 instead. They published the 8.4.0 tar=
ball where upstream version checker didn&#39;t look, and so 8.3.0 was repor=
ted as latest :-( It&#39;s this lack of consistency about where mesa upstre=
am places tarballs which makes me reluctant to add the MIRRORS hack.</div><=
div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></di=
v></div>

--000000000000a5ce29058a4179ff--
