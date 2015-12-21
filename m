Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 551EE6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 11:32:37 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id ph11so35227336igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 03:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8jN2YvNCQbiSZGaZtOKt+svxFX3sG1VAO4uSqDog8t4=;
	b=VI9pwqABIZ8BkZhyamwKMAxO98wdvVG3ynn21YoGq9n77ea2+Q9gBEnx1LHzuM6AcM
	rpR9UabrHXf/h35ML/p+jVOFJD4m9NKfE26dj/SukCWMQX7RHpXsCUQKGPvGpV8/BQJK
	aBD9++ZbAmGRRpG3JehsZnOpXDz9EayR93z5MY/wf/L694FKsQFUG3HebQ1Oilvv7+BD
	YBvD67OZ6wuTLd0Tcj0M9eVFcwD2bBw6u0JX7OnMMqu1O+Qqa+IUy24KtDZaOaJQ0LgK
	SIjTY8rUT38HX+QVVU8Qf6z4ozfNRWAvvjpPgbLi4sd5NZMt5jCdGQX0HUDnEhHbIHYU
	Ym1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8jN2YvNCQbiSZGaZtOKt+svxFX3sG1VAO4uSqDog8t4=;
	b=RVwanaKWFV0K7xizeSS3vWX+nj+hq6fwTFceQ2XCCqX/skilt9MbzyK+OSX3AVD9aq
	6/WPJ32RNbFw6wmMonURpF3q7wEjVyU/MqXo72KXD5T826mccOtYZwuGsN+siblQZ24O
	fDsnZbbkIe/nuejH1roZFZDmn9eETppSpQCymh4Z0ceDpda0dPhupEvKrE1emNaQ8KFC
	VatjSPhxlVSd9mbXcQSCb685cHggxUFppF6p6yfbnZKds1jPv9FwY5Wt2KySLFCSIEbP
	VUmHDrsFpFUYhVe4NOIBbyVG7ZQDSi9P9D7jagr3/x+92ctLRorgTMbxhrP/4GdvPz94
	lN0A==
X-Gm-Message-State: ALoCoQlMeKu/4p/mg6sH4njvH/SYEfSzhG1FVJyQGR4bBJ9uuLWRvCDha+0/k4CDLxmXXMhcKB4VBb/7qe/x6RtHXgSCBcKVIxq5XpjYxYczCjYN0evAI80=
X-Received: by 10.50.13.100 with SMTP id g4mr16169880igc.64.1450697558537;
	Mon, 21 Dec 2015 03:32:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 21 Dec 2015 03:32:19 -0800 (PST)
In-Reply-To: <1450662122-121762-1-git-send-email-raj.khem@gmail.com>
References: <1450662122-121762-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Dec 2015 11:32:19 +0000
Message-ID: <CAJTo0LZfZAWSzrqyPvtyQn7PcPP2Crc01Nyv=oju5HGo05O8Xg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master/jethro][PATCH] libxcb: Add a workaround for gcc5 bug on mips
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
X-List-Received-Date: Mon, 21 Dec 2015 11:32:38 -0000
Content-Type: multipart/alternative; boundary=089e013c6614a751ac052766d8c4

--089e013c6614a751ac052766d8c4
Content-Type: text/plain; charset=UTF-8

On 21 December 2015 at 01:42, Khem Raj <raj.khem@gmail.com> wrote:

> This fixes build failure for libxcb on mips
>

My hero!  Thanks Khem I just looked at the logs on the AB and was wondering
why it looked like gcc was crashing.

Ross

--089e013c6614a751ac052766d8c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 December 2015 at 01:42, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":4rc" class=3D"a3s" st=
yle=3D"overflow:hidden">This fixes build failure for libxcb on mips<br></di=
v></blockquote></div><br>My hero!=C2=A0 Thanks Khem I just looked at the lo=
gs on the AB and was wondering why it looked like gcc was crashing.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--089e013c6614a751ac052766d8c4--
