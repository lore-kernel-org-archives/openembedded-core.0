Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id DE76A75D41
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 13:05:05 +0000 (UTC)
Received: by qkei195 with SMTP id i195so116235977qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 06:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oEqqEpEMzbiHmRq36mAiUQ7VYSXITFsPK86aTpe6jY4=;
	b=eAWpn4OxJ8XY76DakEMMU8fk+aFYNivYLToxih+5XyQZEDexmMWC+iAzkrki8cqQ8Z
	sFyIbdL7BihTfTkIygO9PUqxwfG0Eqe6bNdOgKrwGgJ9txnejepNaR/E/R2GbsHqLfS0
	UoJpDBvRI8ldVskNHMyRGSdjlxRUHHoaVvVMBQ9CIUQD6jZjOKnnHetlV6MlotuiaYdW
	jhnRgX4djaKTVqfP8C/BS0I8tfBLAUAZVtbYj1Xso57K7XeTzTIKcX4KG6+Vem0EjrsZ
	OCvS7TOlEZ6ko26Bx1Tu6sekwk5YUkfTdTTA7ujBRkXDVWEtfuTLpUrLYuZjPjviUlUJ
	M88g==
X-Gm-Message-State: ALoCoQk+f3XkRlcDhPFw9yY1qvGfM6yn3SND7sAPWK8dUHxZUmAxVQkmIJUXrCTZFk419soszvJo
X-Received: by 10.140.231.19 with SMTP id b19mr72378494qhc.22.1436187905821;
	Mon, 06 Jul 2015 06:05:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 6 Jul 2015 06:04:46 -0700 (PDT)
In-Reply-To: <1548004.RNEmCtHdiu@peggleto-mobl.ger.corp.intel.com>
References: <cover.1435497302.git.akuster808@gmail.com>
	<20150703070716.GA21416@ad.chargestorm.se>
	<5597048E.40401@gmail.com>
	<1548004.RNEmCtHdiu@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Jul 2015 14:04:46 +0100
Message-ID: <CAJTo0LYcEcQfGQTKhq9tkRJNLJTw=LQHEp65e9NqMf7xtPCgMQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Mon, 06 Jul 2015 13:05:07 -0000
Content-Type: multipart/alternative; boundary=001a11c12f00f522a0051a348d26

--001a11c12f00f522a0051a348d26
Content-Type: text/plain; charset=UTF-8

On 4 July 2015 at 12:38, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Well, at minimum for our purposes LGPLv3 (or LGPLv3+?) needs to be added to
> LICENSE in the nettle recipe (with &). Whether or not someone chooses to
> exclude that license in their configuration through INCOMPATIBLE_LICENSE
> is a
> completely separate matter (and that is, as you allude to, a distinct
> license
> from GPLv3).
>

FWIW the YP documentation states to mark GPL LGPL and AGPL v3 in
INCOMPATIBLE_LICENSE to build a GPLv3 image, on the rationale that the
usual clauses that upset people are not specific to the GPL variation.  The
autobuilder just excludes GPL right now, but there's a bug to fix this.

Of course IANAL and the opinion of someone who actually does use
INCOMPATIBLE_LICENSE to remove GPLv3 software would be appreciated!

Ross

--001a11c12f00f522a0051a348d26
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 July 2015 at 12:38, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:1ge" class=3D"a3s" style=3D"overflow:hidden">Well, at minimum for our purp=
oses LGPLv3 (or LGPLv3+?) needs to be added to<br>
LICENSE in the nettle recipe (with &amp;). Whether or not someone chooses t=
o<br>
exclude that license in their configuration through INCOMPATIBLE_LICENSE is=
 a<br>
completely separate matter (and that is, as you allude to, a distinct licen=
se<br>
from GPLv3).</div></blockquote></div><br>FWIW the YP documentation states t=
o mark GPL LGPL and AGPL v3 in INCOMPATIBLE_LICENSE to build a GPLv3 image,=
 on the rationale that the usual clauses that upset people are not specific=
 to the GPL variation.=C2=A0 The autobuilder just excludes GPL right now, b=
ut there&#39;s a bug to fix this.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Of course IANAL and the opinion of someone who =
actually does use INCOMPATIBLE_LICENSE to remove GPLv3 software would be ap=
preciated!</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a11c12f00f522a0051a348d26--
