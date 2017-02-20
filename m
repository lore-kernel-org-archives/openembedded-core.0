Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0E90A71C54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 11:46:37 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id x71so26714722qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 03:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hN6cpAlCYVJv8/UtoQCYu5jl7i+vdjvPkUa4dP8VzRM=;
	b=GHSdl2tPx4mo8WnDn5wARGoxoE7rSmtkZLTJkz/f1Ez4ZcfTboX4p5y97GkvelE2XU
	fHwRAfIsUCha2S3daJ+MEcJS5vJjEAglbhuFUTaUGAo8vsh3lPpfCrhZxZejMouxHdU7
	5A25KYpwlQ8oNbbWTtGBTW/vuqAHWobrHi+cmNo8UILYS86Foew+b1PsdhpHCVhjbR48
	uFNc3NQCAL6aA9rfRSjb8pNMXI2UU0OGXfWh9bSRSymBieiYeGG6o+CHmlZAX95jn5AL
	+I5Q/j688bFK3b/j/n86mCkEqy+UCcyX5YZWL95JdJjDHu4O++vzJcAdIMgBoksouvMV
	8HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hN6cpAlCYVJv8/UtoQCYu5jl7i+vdjvPkUa4dP8VzRM=;
	b=nUMPdyUrphq7Mzle+5g2wbqxxbZn/NKQeeMFikoHqdbpK/NiRXKnElIgxso9bLPgVP
	+x60rzgFdcpMfHzUuo4e0NX8kdcoPl2868SBJNlWTaxlug5PaDPxt7LhbWQHajnpRCr/
	5XPGO5fmvC1FnZopBR5/At0v1PbTPNXH5/OTm0gciHwYnyZQolN9971VTo7RjmTolaML
	QYpSw+pDyk2LBnwvZpV+oKlVLDuM5MNypMznvITrE9pNZ8wghBUxAkZAQUQaCLXUVIU8
	l+RCoUv5MJ43Sp19puWxZd3t2kpfWDCKaIrFXezoxma9Sfn/Fhxz+HLDvUPV5qzLv2I+
	Nf7A==
X-Gm-Message-State: AMke39npzTYDRXd2ZU3t2NksqasA6Pj4d5x+GpHO/Iho9O1Z+meflcjhWpcyHxRpXVfN1j1SBqWigSVU0JzDlboX
X-Received: by 10.55.3.18 with SMTP id 18mr18365605qkd.244.1487591198198; Mon,
	20 Feb 2017 03:46:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 20 Feb 2017 03:46:17 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702191313250.8096@localhost.localdomain>
References: <alpine.LFD.2.20.1702191313250.8096@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Feb 2017 11:46:17 +0000
Message-ID: <CAJTo0LbM=BKU5CEcr5mVV0cw_VJS_NsCR992Q5RgpH_x8LRHOw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: something seems to have happened to "gpgme" in latest oe-core
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
X-List-Received-Date: Mon, 20 Feb 2017 11:46:38 -0000
Content-Type: multipart/alternative; boundary=001a114c8328f0a8c10548f4d0c9

--001a114c8328f0a8c10548f4d0c9
Content-Type: text/plain; charset=UTF-8

On 19 February 2017 at 18:15, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   building core-image-minimal for qemuppc using latest poky checkout,
> and:
>
> ERROR: gpgme-1.8.0-r0 do_configure: This autoconf log indicates
> errors, it looked at host include and/or library paths while
> determining system capabilities.
> Rerun configure task after fixing this.
>
> i don't ever remember seeing this before, and i see some very recent
> changes to that recipe.
>

Can you attach the config.log please?

Ross

--001a114c8328f0a8c10548f4d0c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 February 2017 at 18:15, Robert P. J. Day <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":9j" cla=
ss=3D"a3s aXjCH m15a579657a523463">=C2=A0 building core-image-minimal for q=
emuppc using latest poky checkout,<br>
and:<br>
<br>
ERROR: gpgme-1.8.0-r0 do_configure: This autoconf log indicates<br>
errors, it looked at host include and/or library paths while<br>
determining system capabilities.<br>
Rerun configure task after fixing this.<br>
<br>
i don&#39;t ever remember seeing this before, and i see some very recent<br=
>
changes to that recipe.</div></blockquote></div><br>Can you attach the conf=
ig.log please?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a114c8328f0a8c10548f4d0c9--
