Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id A7C236FFC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 08:12:50 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id e72so15586879oib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 01:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZuTKNcygp+Mil0gaEzV0vPJvUpA++cWgqvkIZPj2Njo=;
	b=nruOLYxwIbjSd5ARInGjY96AvNXw6xOaHj6lpNucRQtTorVBpGlSspjtfcXLetLX97
	OBAZOOR/mn9/DcRI071Nl4uI1w5F0Cs1sKfV009Tvq84GQNOs51cQ5Oh7/FItqDdzCli
	2oHnY4NNy6b048s1OYpvmoIyQB9E56NAn+1xlaFC9Vh+N2Qq7QOKRgIvk02QYzfFLW6A
	0Zx6FwEn5xMU+V5MUW07WmW+Zbszz9/qdCga3jBFz4knbB9GKXNTMFS7RT3nEOTijB4S
	mgA208XiDclJNZHPoD1L5w/RLsu0AmgmNr+8u4HeLsMo70oygBOauUQFH4nACG46OpQV
	4x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZuTKNcygp+Mil0gaEzV0vPJvUpA++cWgqvkIZPj2Njo=;
	b=AyaI/0wnjh6DTyW6g2rVQMmtydubmGsY/vIfDbZJUvEYdnJRbQj1yKvh4mnxYEvvv+
	iKqCcznPdVgnTnlWloyNy7loFKgRERlmTA65XRCKq8fnhajkntPCTd3BGFW7zeJHvgcR
	BybM1b5iQlSz8M7lDyXnd8iy5VX+i11VE4Jjq5tQcVFPFW6QlVinDS+Kf0D9Kn97pjL+
	iDl3q9PD7tpau3Mq/apFhfMelsUluCgV+AWEDErcrhrfqN6ZVfJJlLm8J6llp/nv9JEs
	M61y3+0tod+qhWmlhwTzvtzZbP/4MpF0M7sdcnp/m4ypAFWI8dl6StwaCzcA8P7UsXny
	jBTw==
X-Gm-Message-State: ALyK8tJc32gf+Xp9IvkyOdHIRrkOQBqTkKx6qK1Ky14ac34JEDgJKsjDi3ni2l/9SNvRlZTGE3KNA0bRjue4LtOM
X-Received: by 10.202.56.70 with SMTP id f67mr2489931oia.154.1464682371335;
	Tue, 31 May 2016 01:12:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Tue, 31 May 2016 01:12:21 -0700 (PDT)
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 31 May 2016 11:12:21 +0300
Message-ID: <CAHiDW_H7EpNa6cPQxinNdq5WHvjxOQ81bEOZTWVECTOprU+8zg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/42] gcc: Add gcc6 recipes
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
X-List-Received-Date: Tue, 31 May 2016 08:12:52 -0000
Content-Type: multipart/alternative; boundary=001a113cc33e73dcb905341ef0da

--001a113cc33e73dcb905341ef0da
Content-Type: text/plain; charset=UTF-8

On 11 May 2016 at 20:35, Khem Raj <raj.khem@gmail.com> wrote:

> +#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
> +BASEURI ?= "git://
> github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
>

I guess this is where git2_github.com.gcc-mirror.gcc.tar.gz download comes
from? It increased the size of my downloads-directory by >30% -- and I must
have quite a bit of old junk in that directory already.

Is there no other solution to this than a 2.5G git copy (honest question, I
don't know gcc)?

Jussi

--001a113cc33e73dcb905341ef0da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
1 May 2016 at 20:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204)=
;padding-left:1ex">+#BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${P=
V}.tar.bz2&quot;<br>
+BASEURI ?=3D &quot;git://<a href=3D"http://github.com/gcc-mirror/gcc;branc=
h=3Dgcc-6-branch;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/gcc-mirror/gcc;branch=3Dgcc-6-branch;protocol=3Dgit</a>&quot;<br>
</blockquote><div><br></div><div>I guess this is where git2_github.com.gcc-=
mirror.gcc.tar.gz download comes from? It increased the size of my download=
s-directory by &gt;30% -- and I must have quite a bit of old junk in that d=
irectory already.=C2=A0</div><div><br></div><div>Is there no other solution=
 to this than a 2.5G git copy (honest question, I don&#39;t know gcc)?</div=
><div><br></div><div>Jussi</div></div></div></div>

--001a113cc33e73dcb905341ef0da--
