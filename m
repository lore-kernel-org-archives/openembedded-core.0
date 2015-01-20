Return-Path: <ross.burton@intel.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 38F7665CAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 21:17:23 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id z11so36030685lbi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 13:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vxzveoWOSokqFDK2GNyQDe1PC1mKXiV1YZRA54+130U=;
	b=Xd5NP3WJuaJIT1AXKQBBKvLcYFsXeADgYp5dr0w6pPaq1oK9yDcmdJxN9fDsKwCf5I
	o/jeQRqEjZC2SU8TcQ3DDTlt3mHk7YQBdXxWwIvxuMbcGtlq4abEphywsWiEhcsQKIEP
	oFW21khTIzQsMMleVxNPT8QcrnMDArlNW7MVxWZUJvOjz94R0/c6gXY9qmmjjotBNyQE
	KW+Xh8GwP9PMd9SNduyyo3wp1JzBRWKFTgmeA12nGrJ++Eyd4o+0XZQsceBR9VrjAD9t
	EvNRt8Oz9hhNfW31Uctqm/rvtadJcFIiS+Fak7MFqHAepi6+3G1HoJqT3xBQxbsNcom9
	2qfg==
X-Gm-Message-State: ALoCoQmqbdiYUfgl+UlPeGMbvcayOp1XJc2EclEj4CkHDim6KwgZOgJKcdq7QOmRLcxHz1s46IiW
X-Received: by 10.152.3.195 with SMTP id e3mr40992964lae.8.1421788642008; Tue,
	20 Jan 2015 13:17:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.223.164 with HTTP; Tue, 20 Jan 2015 13:17:01 -0800 (PST)
In-Reply-To: <1418221117-12710-2-git-send-email-Martin.Jansa@gmail.com>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
	<1418221117-12710-2-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Jan 2015 21:17:01 +0000
Message-ID: <CAJTo0LaOzuaeWJ-AQO1Bragu_w36f-tRmwUHLOtKNoxQ4N0VKg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/4] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Tue, 20 Jan 2015 21:17:27 -0000
Content-Type: multipart/alternative; boundary=089e0141a012f3f143050d1bf637

--089e0141a012f3f143050d1bf637
Content-Type: text/plain; charset=UTF-8

On 10 December 2014 at 14:18, Martin Jansa <martin.jansa@gmail.com> wrote:

>  DEPENDS = "virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
>
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES = "x11"


Please drop piglit from this series, as that depending on x11 is a bug and
I've a branch that is sorting that.

But this does make me wonder why we can't make bitbake handle this for
us...  just thinking out loud... would it be possible to have a "recursive"
exception so that libx11 can say it needs the x11 DISTRO_FEATURE and
anything that depends on libx11 is cleanly handled instead of erroring?

Ross

--089e0141a012f3f143050d1bf637
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
0 December 2014 at 14:18, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=C2=A0DE=
PENDS =3D &quot;virtual/libx11 virtual/libgl libglu libxext libxi libxmu&qu=
ot;<br>
<br>
+# depends on virtual/libx11<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;<span class=3D"il">x11</span>&quot;</sp=
an></blockquote></div><br>Please drop piglit from this series, as that depe=
nding on x11 is a bug and I&#39;ve a branch that is sorting that.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">But this does m=
ake me wonder why we can&#39;t make bitbake handle this for us... =C2=A0jus=
t thinking out loud... would it be possible to have a &quot;recursive&quot;=
 exception so that libx11 can say it needs the x11 DISTRO_FEATURE and anyth=
ing that depends on libx11 is cleanly handled instead of erroring?</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--089e0141a012f3f143050d1bf637--
