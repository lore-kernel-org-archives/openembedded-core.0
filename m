Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD1C77220
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 16:06:59 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id b62so15837438iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q3sBHFspOOODpwkaD6A7XTjbHjz0C+WRPFuj4lkiGbU=;
	b=MZnPotNR5MBpmqWCvvSO0KAD5X+qn/TLYJzwinpd5d8jfB5OWlB6KOLx8WYZMhX8Y5
	Idpn85dMIfOSASUPXVwiw4mUyauna6HN0xtuE0VzOpWR8xIKeg0JMosF2PdWYyrtmwf0
	hg7F2IPbOceG0RHH47BoJznKZmjHV55JG+zzQZ7duJ7NhbyFj/YmplyIMq0d0/FwiTDq
	mdz2ThArdlpKlPnjIUIgGF2YTmIPvUrE/YhyQ1A8WXx5PGOnQ39csRnPaqtvU3USdhCN
	EwCL0CI5WmoFfNiqp0BlNx0zWrF6hW3eKBQR6f2CIGsPlD3ggrc7vBIuJQqUYd9iGXaE
	I49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q3sBHFspOOODpwkaD6A7XTjbHjz0C+WRPFuj4lkiGbU=;
	b=lFoOWUVWDnKE5pnwDm8//SDhliNbGY8nNFCps9WzFep7XtWCVbL2SYeR/nwAX9XHSx
	y6IIxc0UiU44bedQS0dOSy21y3rNNkuO0y3ZtfpjSeenjE8B68sUYrAa5e5BOe2LbigH
	NuMvtViICWrqx8CA66ajqUgDiElQF0jiWgNg/q9eK/dVeXciuMb0d01yDG57QTp8aBq4
	mUZQBLyaOPiAajZMZ2ijbXU3GHpVB8oGF/Qr2QhsnOhAVNhrv1y9/Z4Z9l35Ae4iBO6V
	3qDRvtCS7M1swaasXi3+pa3mWyLT08iBvxM8hPgXOCkxMV1I+dSpaPkMv1IzYiBqp/k5
	KAUg==
X-Gm-Message-State: AEkoouu2yvdM+dGfcelYC5m+k1Tlo6ynSCUzb5HPT+rcAHTcJCY2uXAHWc9nOZHyUKXyw41TcrkP+GrzqYtHfkzQ
X-Received: by 10.107.154.196 with SMTP id c187mr96319717ioe.99.1470758820211; 
	Tue, 09 Aug 2016 09:07:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 9 Aug 2016 09:06:39 -0700 (PDT)
In-Reply-To: <AMSPR04MB309A834D90712D16444EDE5E21C0@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <1470671116-1997-1-git-send-email-tom.hochstein@nxp.com>
	<CAJTo0LaWyLEPg5S3=B=H_Gb4XNuhgiAqYMMgOBdf3JRHuE0FMQ@mail.gmail.com>
	<AMSPR04MB309A834D90712D16444EDE5E21C0@AMSPR04MB309.eurprd04.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Aug 2016 17:06:39 +0100
Message-ID: <CAJTo0LYx8aDtt2K=nkePhwhNMHhSqK3yOM8OJ64c9dBZ_Bo5MA@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH] mesa-demos: Fix OpenGL ES configurability
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
X-List-Received-Date: Tue, 09 Aug 2016 16:07:02 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e078e130539a5b9ae

--001a1140e81e078e130539a5b9ae
Content-Type: text/plain; charset=UTF-8

On 9 August 2016 at 12:43, Tom Hochstein <tom.hochstein@nxp.com> wrote:

> No, master does not need this fix. The problematic patch
> 0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch does not
> exist on master because the underlying issue was addressed upstream
> (without introducing this bug).
>
>
Thanks for the clarification Tom.

Ross

--001a1140e81e078e130539a5b9ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 August 2016 at 12:43, Tom Hochstein <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:tom.hochstein@nxp.com" target=3D"_blank">tom.hochstein@nxp.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D"MsoNormal"><s=
pan style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;co=
lor:#1f497d">No, master does not need this fix. The problematic patch 0011-=
drop-demos-dependant-on-<wbr>obsolete-MESA_screen_surface.<wbr>patch does n=
ot exist on master because the
 underlying issue was addressed upstream (without introducing this bug).<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>Thanks for the clarificat=
ion Tom.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a1140e81e078e130539a5b9ae--
