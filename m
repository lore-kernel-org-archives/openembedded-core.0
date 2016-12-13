Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 959F771E13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 18:41:52 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id n204so125776791qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 10:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5eGG9hqSWnTtR+LnDfYbPIKO5TG+PAzC5PHpWDRFabE=;
	b=ZVI0fbLLl9aK50VWd5fOo4bf9FOtUJ0aoCN+8rxsJ2J6ib6j8C6p03DTN47k6FlobY
	EiPUFJvMp9+hvJae6eOiZNXuwHHUEmGM4IstqHt5YB4gfAP4JAWJy5BYmadiqWfuFtCd
	QYOAUhAbvyo+Ci/iTj4/CRceQkysoh6rOahTDNd/HBenX+jWuWbypTWNwP2Bac/riInV
	+sPHRAsLKyk9QHL566iKh7pZdwxOnhHwhSjDqVw2eKpyFLsca95dXYWVxRjBiKCo4i3l
	uEPMM7EXoaAtvLeyox6JgIvLKimq5kkb+0OZNfj1ChhrLHZSh8dcvANJIojT5UYFowZE
	8NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5eGG9hqSWnTtR+LnDfYbPIKO5TG+PAzC5PHpWDRFabE=;
	b=KVwI96NbSu2/UHgm6QP92Q0EHOAgVBn1ACud7/7b79O04Ohm0dlBN6esxjx4cq+or8
	pzqQ1ssCzT8xUNJN/g1AdVs8TKTMnRvWS9DT0YgIlwU/qxMUhu0N6/r9l6KM2tGTRjia
	qmWpMU3LNmeC66fu4e1MezvUsdstXgVMVCeMlkrPc/KTwCYm2dsbNlGq8tQklm+JPei5
	783ZgTdJH8DwGaDo1XqC3cJsYYl0u4Y1r7d4MONxUUUci6h+QKWXL0+9hoN5cgPSWi5c
	Grxqsy/shOLcCDYhzLf1NzijU55kj9+qtLaKwJTKM6woi2G+AH2ICV0qpYfQE1w0H+Ev
	Iqjw==
X-Gm-Message-State: AKaTC00rMlXy3NkMySLDbb3qu+QwsFoQ+leEX+JtnCHTzJDFyKq7ZnDa0QkyAKghdc9U9pvcfE4z8YFqsw3pUbr0
X-Received: by 10.55.31.157 with SMTP id n29mr15168219qkh.221.1481654514233;
	Tue, 13 Dec 2016 10:41:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 10:41:33 -0800 (PST)
In-Reply-To: <CAMKF1srCbFH5g2-RgJyYBqwH12U6zuCSrF7z-sPVqQkGUYQFiQ@mail.gmail.com>
References: <1481620141-4369-1-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1srCbFH5g2-RgJyYBqwH12U6zuCSrF7z-sPVqQkGUYQFiQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 18:41:33 +0000
Message-ID: <CAJTo0Lb8a+77q47AhskoKBTjGZe206cD5F+mufHq7UvTsSAxcw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: move to tip of Emmanuele Bassi's fork
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
X-List-Received-Date: Tue, 13 Dec 2016 18:41:57 -0000
Content-Type: multipart/alternative; boundary=001a1147f22800547305438e939f

--001a1147f22800547305438e939f
Content-Type: text/plain; charset=UTF-8

On 13 December 2016 at 17:54, Khem Raj <raj.khem@gmail.com> wrote:

> Why do we change to a different fork ? perhaps its worth mentioning in
> commit
>

Also I spoke to Emmanuele today and he is attempting to have his fork
merged back upstream, so he recommends we hold off for a few days whilst
they sort out where libepoxy is maintained going forwards.

Ross

--001a1147f22800547305438e939f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 December 2016 at 17:54, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":50x" class=3D"a3s aXj=
CH m158f953a5b930cd3">Why do we change to a different fork ? perhaps its wo=
rth mentioning in commit<br></div></blockquote><div><br></div><div>Also I s=
poke to Emmanuele today and he is attempting to have his fork merged back u=
pstream, so he recommends we hold off for a few days whilst they sort out w=
here libepoxy is maintained going forwards.</div><div><br></div><div>Ross=
=C2=A0</div></div><br></div></div>

--001a1147f22800547305438e939f--
