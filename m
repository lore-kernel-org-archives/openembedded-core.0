Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3079F77F90
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 20:54:29 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id c10so49177849qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 13:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fF7Sj1bR6MNNVWEoXfNT391eXJTE42cre69+JC6PBVM=;
	b=qscxuhyr+Jtxefoc5GVNP4ZaytXIwi8OlL7+OavtUUcP5nh883OoPceRNqpwe5Ao5E
	pQ0EuvQNcAD0G2VhOd1T6u66744PbMm+Ih16CfLaC0Rhbhy1MNbywb8+FuKafr+QSjrr
	aIXKhq2vDWefLRd5+i75hybCkqiqC2ld9xcQquxi1bX6D8oq7mntZ4NZLx6uIttiAV0f
	MuvxQf4i4s0mo08vmLqBpGuUqveofjEE1W8vHUHrCRqis4czRF24kytKEtrAyrkprgpc
	IB/rP+2jX6A/BSPjqMB6GTrBd2y0Sj4Y6WRMPHGIEPZI50FZxBdReD2mg6qG9hSv9tsN
	ddkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fF7Sj1bR6MNNVWEoXfNT391eXJTE42cre69+JC6PBVM=;
	b=Zqg6oGH3ICW3+qSScfUn2v3DkZCMZcBw1FnrzULGVY2XZv5mCCAqieg0N5RZ5pBGDD
	NSP9SMHhW81i9W9DSkt1khZtm/fkqefqPW7WRW4lL5lLiVLThD0FrnfbyxivhKNFBzZe
	wf0hGbuI8Km5yVC1kklC8m8XzN+92k3hxNpdxRhQXvUv0mvFiw1EelTepCSrISgUmrWX
	WpEInl66u4CHr2CWI+z80vA9ydeDfyCMxNSiZ5XbDtK20i6n+gcUfbDm0+GXsxsWbUZ8
	BWvXc73r8ahstN/4b/eC5wD0DcCRAbNHpy7Bl6v4hTMXRqBhI0SOsm102ENWHWyK6ayp
	ChMg==
X-Gm-Message-State: AKS2vOy7VkgL0FNdJktW394ZPG+KDeDjAO27CkEhQKE+NEu74uFkUov/
	RqFOOkaMc/vlgEqBFzkR33nCyxtIbA5T
X-Received: by 10.55.221.24 with SMTP id n24mr6315574qki.46.1496696070990;
	Mon, 05 Jun 2017 13:54:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Mon, 5 Jun 2017 13:54:10 -0700 (PDT)
In-Reply-To: <501d2419-3401-4c9f-e80d-b2c33e2b01bc@windriver.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
	<f48b227d578d9b712347d7329714105a33e54bd8.1492777818.git.alexander.kanavin@linux.intel.com>
	<6d5ae07d-880f-388f-432e-5da89aa07e24@windriver.com>
	<501d2419-3401-4c9f-e80d-b2c33e2b01bc@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Jun 2017 21:54:10 +0100
Message-ID: <CAJTo0Lbvf1s5vg49nxX1gxYb05tdisPonZ4Fvo6Lj2g4rTutJw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] libunwind: update to 1.2
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
X-List-Received-Date: Mon, 05 Jun 2017 20:54:30 -0000
Content-Type: multipart/alternative; boundary="001a11466c48a6011505513cb59d"

--001a11466c48a6011505513cb59d
Content-Type: text/plain; charset="UTF-8"

On 2 June 2017 at 01:00, Randy MacLeod <randy.macleod@windriver.com> wrote:

> Upstream is going to release a new tarball "soon"
>
>    On 2017-06-01 12:18 PM, Dave Watson wrote:
>    > The fix is in v1.2-stable and master, of which the next releases
>    > will be v1.2.1 and v1.3, neither of which have been released yet.
>    > I haven't seen any other fixes to go in v1.2.1 for a while, so
>    > I'll roll that one out shortly.  Thanks
>

Patch on the list to make it build.

Ross

--001a11466c48a6011505513cb59d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 June 2017 at 01:00, Randy MacLeod <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1zg=
" class=3D"a3s aXjCH m15c661bbc3042193">Upstream is going to release a new =
tarball &quot;soon&quot;<br>
<br>
=C2=A0 =C2=A0On 2017-06-01 12:18 PM, Dave Watson wrote:<br>
=C2=A0 =C2=A0&gt; The fix is in v1.2-stable and master, of which the next r=
eleases<br>
=C2=A0 =C2=A0&gt; will be v1.2.1 and v1.3, neither of which have been relea=
sed yet.<br>
=C2=A0 =C2=A0&gt; I haven&#39;t seen any other fixes to go in v1.2.1 for a =
while, so<br>
=C2=A0 =C2=A0&gt; I&#39;ll roll that one out shortly.=C2=A0 Thanks<br></div=
></blockquote></div><br>Patch on the list to make it build.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11466c48a6011505513cb59d--
