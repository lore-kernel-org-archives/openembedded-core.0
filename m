Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 18C547017B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:04:22 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id j124so26828741ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9OTr3sgqHGEDiEfUAvb7jPhUqMeKNka/thm/OxGq6cc=;
	b=Z7UcUgaLtqj9sr5IhAbX8KWH9dxglzF2A57qrpnVLnYjQFzpRLjJYkX3AGq0OLdIqW
	Z7U4ycgXLFwSL6K8rTPHXF2lEAyruZYng2JVSjBTN7TvC3q4EaMUZfhrCC+h1q2XoFvh
	evvQZXHFTX1HWaAwJCzLUoJqqSy/N/pFWquN2ENAI8aXx5sPx70fLG4MFOOI+Ya0s/zh
	bA19dhR9u85kuwO8QcEH//Q4Euss/pQSONuXh4A5g95Ozy+qz5Ydv4XTCebsDeW86tPq
	hJHqDV0RKdCINvKq8nzpXWfx4yt7MQ8CQIFTTipY6H4EWIX8C/px6YUcmUSfro34moVA
	PSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9OTr3sgqHGEDiEfUAvb7jPhUqMeKNka/thm/OxGq6cc=;
	b=GhWct0Kpd59GzNQ95sdVUQXLucVoY90L/bhTpclz2vdOw5q6/x6VyiA9JORfBFIxYI
	PrBEjIve+vnQi6MAHfns8v/Pvda+ZCT+k7/fhsO2hlmRW4CIoqww1yIWcs6g36uuT1Um
	4bacN4EUriCGHiRKmzBmvRSLFe3XgTknJsTGXtHukIkxQ98f5uszUGe+P2SrlMA6sbU8
	hvPKFXgmldTy2m5wKZ0AR2U2i6QAIDWJL5AQTDUGp4/557X+7YWYPEIz4z+2keAFAft4
	NyFJOHNdj9jEmBW/qJMOfb5apsy8ij8JOdkz1c7W0Fa5O76VZ4mrbjFHf2mJJyeWZX4b
	eJyw==
X-Gm-Message-State: AEkoouuN9wyZmQQeE2iw90wNFWAlzmlvDmILa5feKP51f0JBKjZXc0JA4eQWGpljnCUkFWy9fSX2wSK/XxCIOIP+
X-Received: by 10.36.121.204 with SMTP id z195mr5042708itc.22.1470409462912;
	Fri, 05 Aug 2016 08:04:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 5 Aug 2016 08:04:02 -0700 (PDT)
In-Reply-To: <025b44d4-076f-747e-7d39-15209a3d3df5@gmail.com>
References: <cover.1469337362.git.liezhi.yang@windriver.com>
	<07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
	<CAJTo0LYCEP1nkeZ9-1i+K3YsK0OMAt+axx-4ezQsbxu+VwvyVA@mail.gmail.com>
	<57980BC4.80208@windriver.com>
	<BF50BCD4-DC5E-478D-9AF3-24C9E99C36A7@gmail.com>
	<CAJTo0LZ_9sp6+tWgoY1NSeh3H-KVWrCJfyCp0LW1YaF6AMS1tg@mail.gmail.com>
	<57A3FE58.8010704@windriver.com>
	<CAJTo0LbsdQVQ3yCsYdEFOoHSRSbSOmV6dSzAPLsH9P252=Zagw@mail.gmail.com>
	<025b44d4-076f-747e-7d39-15209a3d3df5@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Aug 2016 16:04:02 +0100
Message-ID: <CAJTo0LZqzBdKZCRpLX8Zizw_n-OE9yn=Bjup=Mv=FRqyBK1TPA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] epiphany: inherit perlnative
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
X-List-Received-Date: Fri, 05 Aug 2016 15:04:24 -0000
Content-Type: multipart/alternative; boundary=001a114aa466b630a40539546178

--001a114aa466b630a40539546178
Content-Type: text/plain; charset=UTF-8

On 5 August 2016 at 15:49, Khem Raj <raj.khem@gmail.com> wrote:

> > Just discovered that ephy for some reason ships its own copies of
> > intltool.m4 (and a few others).  We'll need to delete those.  Patch
> > incoming.
>
> ah good find. I was still seeing the errors on my boxes.
>

I've now a few patches locally that I'll send shortly, and want to change
autoconf a little too.

Ross

--001a114aa466b630a40539546178
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 August 2016 at 15:49, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; Just discovere=
d that ephy for some reason ships its own copies of<br>
&gt; intltool.m4 (and a few others).=C2=A0 We&#39;ll need to delete those.=
=C2=A0 Patch<br>
&gt; incoming.<br>
<br>
</span>ah good find. I was still seeing the errors on my boxes.<br></blockq=
uote></div><br>I&#39;ve now a few patches locally that I&#39;ll send shortl=
y, and want to change autoconf a little too.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114aa466b630a40539546178--
