Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A186F6D781
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Dec 2018 00:01:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q18so6822573wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 16:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D7MO/Xkh0YASnX/Ost9Hl/BDCGi/BVH+A6WjZKtZgmU=;
	b=ipw7jpA1F6sM3jXDw7fWdiOTMuJ1JGuQX6kQEefPbPT//q6rQoJZP+rygQ/BY+iVSM
	6T2MmxatrIEIpxIVeW5sQmkvm7+J7ytKZ0uAG6U3Z0HHcDuW9qyC/XD6MzNU9YMPCr+T
	n7VEUq+QTDA7i2D/q/OuNkNgEnKLSaEgR1TvX1dkBCsUjn2CQtYE7L3u4kfzzJ2yTCTd
	R5byIFyncTKQQNfO2m0b+9j+PUptW1TPKazBfQtCKw5kkj8P2TQ0FV1pZwhfKA3XuQEP
	XdOdEF79T3rIwbcxoDBeSwZQR6p0kvN/jZW9efuMzxPbnsxCKH+oNn7RU7rdGt67j+GN
	AkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D7MO/Xkh0YASnX/Ost9Hl/BDCGi/BVH+A6WjZKtZgmU=;
	b=OckSy/tujr3czkxwxoJFS23lSNHTKoK+pDEmmGWYS4gzj7uToxIrnXcKeHISXAXp3K
	t0FDjCF6k9b0bqWQ+ASB5vz5EB8COBtNbJ/NcUFaXaNYGKoTb2kwHgAaSqnbKPQduvd0
	RW4ARHIcr/PKN8/yNdV/C9sib1KP6pvzTBs9iLaMMd3PnOAGCglPIkdN+ISXeGGY6bBd
	6KhMk055ohfykN+6TEIgpEaeeDgURXVidKqfrRgcsehvCnzrlZquo7DZs0bbp2uOCiwX
	DNwqb8PFpgbQhoc2rkFzb6gJbXcnmb3iDhddDbexkOxIszCwGq00vmZKhpxxGNyBzxix
	ernQ==
X-Gm-Message-State: AA+aEWYLn6TDVas1Kvl7O2k3Yf+i+8lyxmfsLa/EqvaC4kFTYNOOFt0p
	BWggMFSPtB5drF3AurkCnr5hTsvgdHHrSpnXRug=
X-Google-Smtp-Source: AFSGD/UNMl30/VB5TmVM946YjitPaBHLH7p9W9poikk26xZJLdA/IA5OUI6CcXkDNewUahQy4etIsPB5NfZFdrvsF8A=
X-Received: by 2002:a5d:568c:: with SMTP id f12mr6143737wrv.101.1543622503069; 
	Fri, 30 Nov 2018 16:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20181130215537.29981-1-JPEWhacker@gmail.com>
	<CAJTo0LaNDeDGKfG9p8s8PY1RQVEQg5uDk3rLqqNiPNFXO2fiaA@mail.gmail.com>
In-Reply-To: <CAJTo0LaNDeDGKfG9p8s8PY1RQVEQg5uDk3rLqqNiPNFXO2fiaA@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 30 Nov 2018 18:01:30 -0600
Message-ID: <CAJdd5GZEM1PYnC-aENt59TpGodgdhLXv+uXgwruvzAP7UTDG4g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/waf: Fix builds when B != S
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
X-List-Received-Date: Sat, 01 Dec 2018 00:01:43 -0000
Content-Type: multipart/alternative; boundary="000000000000f67cd1057bea9e83"

--000000000000f67cd1057bea9e83
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 30, 2018, 5:00 PM Burton, Ross <ross.burton@intel.com wrote:

> On Fri, 30 Nov 2018 at 21:56, Joshua Watt <jpewhacker@gmail.com> wrote:
> > +B = "${WORKDIR}/${BPN}-${PV}"
>
> That's the default, so redundant.
>
> Does waf support out-of-tree builds sufficiently well that we can
> default  - or even mandate - out of tree?  i.e. follow meson and
> cmake, and just set B=$WORKDIR/build in the class.
>

Yes. This patch already does that by adding "-o ${B}" in do_configure. I
will change it to ${WORKDIR}/build. Out if curiosity, why is that preferred
over ${WORKDIR}/${BPN}-${PV} ?

>
> Ross
>

--000000000000f67cd1057bea9e83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Fri, Nov 30, 2018, 5:00 PM Burton, Ross &lt;<a href=3D"mailto:ross.burto=
n@intel.com" target=3D"_blank" rel=3D"noreferrer">ross.burton@intel.com</a>=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 30 Nov 2018 at 21:5=
6, Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com" rel=3D"noreferre=
r noreferrer" target=3D"_blank">jpewhacker@gmail.com</a>&gt; wrote:<br>
&gt; +B =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
<br>
That&#39;s the default, so redundant.<br>
<br>
Does waf support out-of-tree builds sufficiently well that we can<br>
default=C2=A0 - or even mandate - out of tree?=C2=A0 i.e. follow meson and<=
br>
cmake, and just set B=3D$WORKDIR/build in the class.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes. This patch already=
 does that by adding &quot;-o ${B}&quot; in do_configure. I will change it =
to ${WORKDIR}<span style=3D"font-family:sans-serif">/build. Out</span>=C2=
=A0if curiosity, why is that<span style=3D"font-family:sans-serif">=C2=A0pr=
eferred over=C2=A0</span><span style=3D"font-family:sans-serif">${WORKDIR}/=
${BPN}-${PV} ?</span></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<br>
Ross<br>
</blockquote></div></div></div>

--000000000000f67cd1057bea9e83--
