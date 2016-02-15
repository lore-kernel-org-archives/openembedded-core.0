Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 272F3731DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 12:38:05 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id z135so87553337iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 04:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8CCMyc/UbqU4IDMtzlSygzy9RjYkrwujNUP/vBmUJf4=;
	b=u83VSquojyu1UZJfQC/seqohMX9fz0F/9HICoqTfuZphcW2aZSY+do3uoWkfIxd4mM
	BnLOIpJNBCs3ZWJavJCZSRYS56npQyQNA8d4PT1D678HT4M/GmCekh5Nge98MT2ntlgi
	s9UbRmG71TY8cUd58DlCbPxpBibYFI4g9KAywr5OOb7CmvSYX2yopvvxLw1L+i42e2bV
	gkq1Ku3XA9tOlAlM/IsxHGAS0zjGyN0MLKJUs+QYRfQqB5t6iDQBRm7n1cVVGYfCdWA5
	S1YG4YPTn09s31bwBouMuFerrVPsi1qfMBEpwdZSFWh6yS/89S7xRaR+2Tx2rA+PnBY4
	aFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8CCMyc/UbqU4IDMtzlSygzy9RjYkrwujNUP/vBmUJf4=;
	b=PAFiyWZ4EmoHtjdMjPQsNRHef+xaMAPq7GCw58I+xD3SXwUETelPoxbkPCuVahrMl3
	LM5g2Ug5d5yoA6UQfPfQUvkU+6yNp4ZpPTWUOXD6bvTQf8UGyaR5heAxuDsgLmuPvjYW
	MbQzqD+YkHyqnyAMl177ImB0l5vkKyVZgJI+KN1qTvXPjJouSHMRAc96NSMuSqIFX2v/
	CajHOFL9bmg6UWvCQqK0Hick1xbPvmPS8v0ru4iaH7ABxkhMxTXrumB46tcXVGf2Mr8H
	UlPDC9QShqVLq/Albl5kHHo32qEntUy15ZrdXjgCGDTaI8Ulg4Q0DF08lnpEAsV/R1QV
	gOJw==
X-Gm-Message-State: AG10YOS9kjzyMVvMMRrM0U3gFyGVkPO5mXbW50vIP5yekRX9p+0cvbtoQd2KPeOj4Yd8+yKvd1hQqkQBXRyjbwkI
X-Received: by 10.107.164.15 with SMTP id n15mr15484724ioe.148.1455539885730; 
	Mon, 15 Feb 2016 04:38:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 15 Feb 2016 04:37:46 -0800 (PST)
In-Reply-To: <CAJ86T=WQApsnZLTAGsRv9BiitVxiKnmDd=5qEsQrogSaQu22hQ@mail.gmail.com>
References: <1455276418-4134-1-git-send-email-eu@felipetonello.com>
	<CAJ86T=WQApsnZLTAGsRv9BiitVxiKnmDd=5qEsQrogSaQu22hQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Feb 2016 12:37:46 +0000
Message-ID: <CAJTo0LaCr2LbeiKupbXzYxMWSg-MssPqwZ51zCusXKZkArweFQ@mail.gmail.com>
To: "Felipe F. Tonello" <eu@felipetonello.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-tools-profile: Enable valgrind on ARM
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
X-List-Received-Date: Mon, 15 Feb 2016 12:38:06 -0000
Content-Type: multipart/alternative; boundary=001a11377682d881ea052bce49e1

--001a11377682d881ea052bce49e1
Content-Type: text/plain; charset=UTF-8

On 13 February 2016 at 04:31, Andre McCurdy <armccurdy@gmail.com> wrote:

> $ cd openembedded-core
> $ git show af1ddab5c
> fatal: ambiguous argument 'af1ddab5c': unknown revision or path not in
> the working tree.
>

That was a poky reference, the correct oe-core ref was e5f41c22.

But yes, what Andre said.  Felipe, can you revise the patch?

Ross

--001a11377682d881ea052bce49e1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 13 February 2016 at 04:31, A=
ndre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" t=
arget=3D"_blank">armccurdy@gmail.com</a>&gt;</span> wrote:<br><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":1ts" class=3D"" style=3D"overflo=
w:hidden">$ cd openembedded-core<br>
$ git show af1ddab5c<br>
fatal: ambiguous argument &#39;af1ddab5c&#39;: unknown revision or path not=
 in<br>
the working tree.</div></blockquote></div><br>That was a poky reference, th=
e correct oe-core ref was=C2=A0e5f41c22.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">But yes, what Andre said.=C2=A0 Felipe, =
can you revise the patch?</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a11377682d881ea052bce49e1--
