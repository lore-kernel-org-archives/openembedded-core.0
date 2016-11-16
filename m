Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7823E71978
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 17:26:23 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id x190so184313080qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 09:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hDQdafuYYHS7hRLm+4mdfLTXtEafrv70bgxdKSQLB4c=;
	b=AIVyEs6z4YhjhU3odwZjpaC04fvcv6QMRLocjO3a6TAHIZ5GwmupLSgRSLNvMBf0y/
	IlJ7sxNqyq9/YCJIAD7Q0P2i+M0JdllwbAAEV78iEJMhpxCprt+1OHRV+/TPJCDJ1kNT
	V6leV7EPCPHHR1YKNV9hqxQGDLx8HbPJ7bouQJ3m83aPZx+8yZjEbbiQMN0hAb79P/LF
	T9QYbxJOqBKzEP0Bj0lU8aYhwqSE6WMMgN/pzsTPIOYxOyp/eDhjF1F8U1WVIFOvkN1k
	52/qe5LgPbTrzvXWI85dpJqsA5LdFDtNNGS2Re1EfNBwxKLg1YvJMcatZvvsgbdZFJkY
	DfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hDQdafuYYHS7hRLm+4mdfLTXtEafrv70bgxdKSQLB4c=;
	b=V6gesQkWdB0AeXJK8bI3HKl0HsSZ7tFJ0x5TXufVIVnTBqSVqqkr6MPyKbZN2Elr0W
	plCXRatkjumSNuLtpOzTZz9ksUf8b/hQXEg5G5spuQnz0seyuuSQnrZDFMa0oMlNhLGx
	nQcFY5D6zEySxHMBiRjxRGTYpZEq3QZ4yoG0WSgnfnrc8MfR1YighSomVkCCw7omyDf5
	KgfrE1tJS/sOWNGYvQYGs3Gu0m8mpWGgRC9oVixfxGgs9DHqgwY3PTujMs7W7EWBBfQu
	tNjo0OPQVvwTIpkSJkkoIZCrFgPlhYybuysALZB5H0wkuVIJo4If3nZ6DbJBJxiQQ8Mc
	iRag==
X-Gm-Message-State: AKaTC00U/Cf3oc+FejeYcWsYBQkP+FjAgzaSTApL85BxbzkGrRv8vE1uWNZ6mwmVklf3NbnC5ABoyWlcmw0PobvR
X-Received: by 10.55.8.20 with SMTP id 20mr5259972qki.3.1479317184853; Wed, 16
	Nov 2016 09:26:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 16 Nov 2016 09:26:04 -0800 (PST)
In-Reply-To: <22d481e0-2b32-2959-522f-0ed7dbf71889@gmail.com>
References: <0e379627-328b-cd37-0310-67a14156d90e@embed.me.uk>
	<CAJTo0LaY5K8gY97hXbLgGkaRNbKGv-DwvLU0H1jt8oSkXg+rug@mail.gmail.com>
	<be2d8fe9-686b-b174-48a3-f609f36f0969@embed.me.uk>
	<CAJTo0LZoieB7vWei+fM=3vWzm1j4wgGmvyxE_5X0H-ZYdsZmaw@mail.gmail.com>
	<977eace4-b716-70f8-c9f3-837f0b6c239a@embed.me.uk>
	<22d481e0-2b32-2959-522f-0ed7dbf71889@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Nov 2016 17:26:04 +0000
Message-ID: <CAJTo0LZZR73+uoC6zC2u9btouQhEm8tKsz0svf0NvBqyVhQu9g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libtool --with-libtool-sysroot
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
X-List-Received-Date: Wed, 16 Nov 2016 17:26:24 -0000
Content-Type: multipart/alternative; boundary=001a114c9d6050a09a05416e5fd0

--001a114c9d6050a09a05416e5fd0
Content-Type: text/plain; charset=UTF-8

On 16 November 2016 at 17:22, Khem Raj <raj.khem@gmail.com> wrote:

> what us autotools bbclass doing in this case ?
>

The class is passing --force, so this only happens if you're running
autoreconf manually.

Ross

--001a114c9d6050a09a05416e5fd0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 November 2016 at 17:22, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":605" class=3D"a3s aXj=
CH m1586e29d40b75ae1">what us autotools bbclass doing in this case ?<br></d=
iv></blockquote></div><br>The class is passing --force, so this only happen=
s if you&#39;re running autoreconf manually.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c9d6050a09a05416e5fd0--
