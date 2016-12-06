Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE66719BD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 09:14:45 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id x190so373444835qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 01:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zCK1aPIqd44e2JdEXjqh3nr8kSFdenF5X4iIlEDx//I=;
	b=TL2azDu6GyjpwqHTq30T7gBm3pmxZC4FkA/Ltm5GdZImuVJcKLPsDrJueWYK5UuufP
	xqJj3HzkPGMAv+Rr8j1az3D3yrKyY/qEuBwyZnSO5241R2g94p0RZWEKqqLqcJnS+V02
	V2qgdi9wVjpPRldCldvP7a4XLYv7azRfQKJoKDvafDRfLtwCy/esmAJMW/mWk+bA4avW
	vVsjiEp4Ze4kP4fKqr9UbqSZbtUSjBP5qr5f3BnR6JbBKBBJP372PB0md62c/v0f4oet
	0rPoysQdzwhYORYDkc9plO3NXFyqPtyJi+HfM2nlPJu3Co1+d5GAkDQtTSsPsfCi6G4N
	9d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zCK1aPIqd44e2JdEXjqh3nr8kSFdenF5X4iIlEDx//I=;
	b=PDFZLSEr5/lUzm0rD7sAcQdPFL3i8FHVAr76NeRJcV9IrMCmuRFzl8JeX8B9jmDIyk
	zeHT6MYTRmz2AwouY3ZeGnxiDv0wyClzBzVhLEDtJYcrb0gdSkx8OnElWwusW6hdZVC5
	X0M9KwJZXjDFQXY55H2+ho23IssfwBU0/jEmqzIHxiozX53FbVMfG0Y1wqfrZ6+173Yt
	wX2IYqoazwxj/5rLyI/Gv1MFwVXCxGQ21HMz4Xp+MlqIzXXk5kvatsTcPN5w84nVsv+q
	NNl/4gHIL9G4lYpMSGgN1eBbyC7EF3ccJ1TJnv+GBzhMEtxxacQBvft4UpmRBkpAbn+p
	gZEg==
X-Gm-Message-State: AKaTC00dCOR/6qJAIV+y5fmlznmmLtFqvt5cTtffID+MrqhX3eyJlGaqIO6Rx1bq4U4MIUC3loy/AgnmHGmrT5kz
X-Received: by 10.55.75.17 with SMTP id y17mr45918459qka.26.1481015687066;
	Tue, 06 Dec 2016 01:14:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 01:14:26 -0800 (PST)
In-Reply-To: <CAFSKS=NvbpPaR038OS+uAK78HQt_DfKuNodJHTQ54Zi5aXV+Ng@mail.gmail.com>
References: <20161205163827.21941-1-george.mccollister@gmail.com>
	<CAJTo0La_rfxyJRgJgjdknqXAACkqxRB3dgqdyiOv7VCa+z8rFA@mail.gmail.com>
	<CAFSKS=NvbpPaR038OS+uAK78HQt_DfKuNodJHTQ54Zi5aXV+Ng@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 09:14:26 +0000
Message-ID: <CAJTo0Lb+Mu3ZvyyO+pZqrnZp0wr8Up1ejBkw1DC9weRCasXqDQ@mail.gmail.com>
To: George McCollister <george.mccollister@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: Depend on nativesdk-python3-misc
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
X-List-Received-Date: Tue, 06 Dec 2016 09:14:46 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8ef50090542f9d578

--001a114a88c8ef50090542f9d578
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 00:16, George McCollister <
george.mccollister@gmail.com> wrote:

> importlib is the replacement for imp (it's deprecated since version
> 3.4) so this sounds reasonable to me. Shall I send a patch to add
> imp.py to python3-importlib and another to add python3-importlib to
> PACKAGECONFIG[python] in gdb-cross-canadian.inc?
>

Yes, that sounds like the best idea to me.

Ross

--001a114a88c8ef50090542f9d578
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 00:16, George McCollister <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:george.mccollister@gmail.com" target=3D"_blank">george.mccolli=
ster@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":1j5" class=3D"a3s aXjCH m158d17d44104c791">importlib is the replace=
ment for imp (it&#39;s deprecated since version<br>
3.4) so this sounds reasonable to me. Shall I send a patch to add<br>
imp.py to python3-importlib and another to add python3-importlib to<br>
PACKAGECONFIG[python] in gdb-cross-canadian.inc?<br></div></blockquote><div=
><br></div><div>Yes, that sounds like the best idea to me.</div><div><br></=
div><div>Ross=C2=A0</div></div><br></div></div>

--001a114a88c8ef50090542f9d578--
