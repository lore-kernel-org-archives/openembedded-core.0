Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id DB10B60745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 11:55:36 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id g8so18346037igr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZbHK67Ok6hiXkdDdzOvoK6UFl8cL2jmvyuvCz0ysHkw=;
	b=paQ1VZ05YtaRHWbpVlb5L6/bjCrK9f9FWycJijp1IdqMvsPsF3p0Bh5+uxdvYXUb+0
	lbwcpIqBlReV39EOqEK3XWzQxR/onEk8V0QcMa3MPcWm5g0phmVRA/D1ANW1eCvzpiu7
	slt7/HycVjEDCirY4O49xkGhVeLLQDMQmKstJpoy2MDNqfczTIjtwvqgs5IzHRLGF88T
	XdJCs9hcl3SylbmH7OQyHW7FtHiqZixlstGbpH8UnWsOPExnvmxYHosvgbVVWEjGwP0C
	mN09eqNnqR1FCgxrBhhTKU4Q47+5ebNQFgsy3ZZ+3a3Mu9+uhfXRnbrVJJG/VyrtztD5
	TJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZbHK67Ok6hiXkdDdzOvoK6UFl8cL2jmvyuvCz0ysHkw=;
	b=PZfulv/yXeDg9hcTLCLYirEtn6T5GJtVMPCCeF5dNCK0GnuKqUaPrjX5U7MGEk8W8f
	cGhjLi5/tgaI1SdSrRXfv3+uuj33e2stXtoW9lmOW4Kt+V6DRhDKA3aJ2Inhi0SzcuUB
	C/WUMprAJsnfTPhBMqjisJpOBFldRcRMT5t0lshs/wwd75OLeuQqwbQp3X6sAI7G0iin
	UZP29m2WRukChirnzDiKsH4senxOeo43EmDSxkTKWydFZSx5xGLKUvn4lMUlyelpGYR/
	DZxo/xps1uiS9FdRNhz56TqXHRewkpePyAsH3YtSR+p4lT2XceZqkdNk1D9jY4RjymHV
	7AkA==
X-Gm-Message-State: AD7BkJKNuSntgAayILXoWlTTnOLTBn0KWbnowNowhycepXasoOXH2QIAJyneRe6Fd+6Qea50CemIvQTnwq/Mfaah
X-Received: by 10.50.155.67 with SMTP id vu3mr22966865igb.52.1460462136710;
	Tue, 12 Apr 2016 04:55:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Tue, 12 Apr 2016 04:55:17 -0700 (PDT)
In-Reply-To: <CANFkWp=ynO2J38+k=mBH6Y3GFOb2kZhbM9zea2T09EL2BDZHxA@mail.gmail.com>
References: <1460106859-14007-1-git-send-email-joshua.g.lock@intel.com>
	<CANFkWp=ynO2J38+k=mBH6Y3GFOb2kZhbM9zea2T09EL2BDZHxA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Apr 2016 12:55:17 +0100
Message-ID: <CAJTo0LYFuh=jnJYkcZi6iZjFrG4k2=NtqfmZKx6aeSDuj40aMQ@mail.gmail.com>
To: Alexander Kanevskiy <kad@kad.name>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	Joshua Lock <joshua.lock@collabora.co.uk>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic/utils/partitionedfs.py: assemble .wic images as sparse files
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
X-List-Received-Date: Tue, 12 Apr 2016 11:55:37 -0000
Content-Type: multipart/alternative; boundary=001a1134dbecddf6b305304856d7

--001a1134dbecddf6b305304856d7
Content-Type: text/plain; charset=UTF-8

On 9 April 2016 at 11:36, Alexander Kanevskiy <kad@kad.name> wrote:

> This might be dangerous. Even in recent version of DD (coreutils 8.25), it
> might not detect in source file mapped/unmapped blocks properly,
> (just use is_nul() function to check if block contains only zeros, instead
> of e.g. fiemap).
> Result might be so, that in output file block which must be zeros is
> actually become unmapped. And as consequence, if it might not be written to
> destination drive.
>

Agreed, I've a revert queued.

Ross

--001a1134dbecddf6b305304856d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 April 2016 at 11:36, Alexander Kanevskiy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kad@kad.name" target=3D"_blank">kad@kad.name</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div>This might be dangerous. Even in =
recent version of DD (coreutils 8.25), it might not detect in source file m=
apped/unmapped blocks properly,=C2=A0</div><div>(just use is_nul() function=
 to check if block contains only zeros, instead of e.g. fiemap).=C2=A0</div=
><div>Result might be so, that in output file block which must be zeros is =
actually become unmapped. And as consequence, if it might not be written to=
 destination drive.</div></blockquote></div><br>Agreed, I&#39;ve a revert q=
ueued.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a1134dbecddf6b305304856d7--
