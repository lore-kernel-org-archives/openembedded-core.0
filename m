Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id BC36473D46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 07:31:50 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id x201so11862537oif.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 00:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6QG5RUXDLaMVFWrGAmlQn+Yygwmp4Sqi5FmDrzxmDY0=;
	b=jGt1vaB0ebgmBVcdGGy/w+2jZW5Ix6JqCbAUPLQxXYDxN7p6pNu+4jkKxgCAC/pUHP
	2XUZWikSQbROLITYpxXUArZE5QVY9O84rql6dqk07P5+USc78Bs2xjV1XeDcVq/e4sir
	bUu8ObCMk8Y8VeKoDrJy6M+Aa3HrzAQ3QPqSIXi1Os2Hq9Fkc9JjNqQ81z+FsibV08X1
	RMQ4n4gplas5hTL3CvDtpjM+06oY5doDI9h7bsTCSLIW9alptIu8y9XYu/Q6yb2rQ//U
	3nqdN+t7RTGqsVVQB8QwqGX9KRN+xPiOUSRD6NZBoIOkPiVan2jd31Aq8vJb0n69lwh1
	ZXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6QG5RUXDLaMVFWrGAmlQn+Yygwmp4Sqi5FmDrzxmDY0=;
	b=m35xjl3UfPT/oD11yuOaiArjZDQz5kAElIMdIOxMSa3ZiduzA3aUgm7b5OwQur+NXf
	MQ4siq59RyQmvq4bRM4b9uNpwmUwmssTsjdlC36goVWeTmrEvLau0Q/WiDG4evHqkbnZ
	jGJ7uaUzHIPjOHm2KlZgySPKbWtzOu4sw5jovcGveGa5yIUX4jEQkQRUL1Pdbo3pSbID
	eeqQlvrfM771FP9u0LgMPYskqpZLgiicDfxdraDQBI68esa54au5hRVBkpxIrPRo/Q6g
	pm0ZvJbaY3F9WsMkfWboLa3/5S/zyJLCIS3jzFNKvxaUfDxBzqzy7E13Ma3K+5gFD2/D
	Jdeg==
X-Gm-Message-State: AOPr4FV34Qw611QFHzhBoDhLbwQ6vLH1TovAnzbHWevHJ6De3ZPBREIYPSrgP9XtNvOqhmlhTcP73uMlPNqZSczK
X-Received: by 10.202.225.84 with SMTP id y81mr20015688oig.125.1463470310692; 
	Tue, 17 May 2016 00:31:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Tue, 17 May 2016 00:31:21 -0700 (PDT)
In-Reply-To: <314BCBC6-07F6-4B6E-89E6-FA6D86C682B0@gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
	<CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
	<314BCBC6-07F6-4B6E-89E6-FA6D86C682B0@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 17 May 2016 10:31:21 +0300
Message-ID: <CAHiDW_GzrvqCkkcUMtNQTtgoit9JdJ5Y-pBP2vHsiC67+7JB-Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Tue, 17 May 2016 07:31:55 -0000
Content-Type: text/plain; charset=UTF-8

On 16 May 2016 at 18:50, Khem Raj <raj.khem@gmail.com> wrote:
>> As I said, I would work on 1.10.91 as it is close of 1.11 and easy the
>> upgrade. But all my patches are based on 1.10 now so it is fine with
>> me as well so please send the v2.
>
> If 1.11 is around the corner then why not work on 1.11 ( pre-release ) itself

There's not much to work on as far as I can tell: 1.11 should be a
simple upgrade with trivial patch changes.
As I said, I'm totally fine with waiting a couple of weeks until 1.11.
On the other hand I haven't seen any reasons to start packaging a
pre-release -- why this one if we normally don't do it?

Jussi

