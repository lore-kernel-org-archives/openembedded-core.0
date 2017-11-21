Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 87ADA785F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 12:21:32 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g130so9887016wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 04:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=lK7e+zMZEdIIrlT2jESq98y8ze7MxxijTrsqAWs+xWI=;
	b=v7Jxiub9tT21q1kuFUbCntNOWOKG58yUUhpOAa85k1lN1DTtpPABdVN9UEhkBev3tV
	ENBxvJ7sBw+2DAK65x8+HmRvFs5813agPghNiaYAxUnPDWpvI8IMJxa1y/unOQ9l70lu
	dAAF6an644kWTNEkvOCrWPReDzPoHCo6fizA5E0bx0ThhCx12DuXgt12ber52V1Hxs92
	yvHr7fSb/i+1WvTJ6yI6y99AK6HF73eGXg6lC/+boBPpfJMGJvMdlU3mmUu7z06+dkZD
	D0XSj6BEh1hc5MBckxjFlBOn7XF6AOroT7iBJcj3SPSxsrotbD5XQUEwhZn8GQtw8rNE
	mSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=lK7e+zMZEdIIrlT2jESq98y8ze7MxxijTrsqAWs+xWI=;
	b=Xoov1IqChO8I+8MFGSYGe/4tNAjnkKRjudU0N22Pdf40MZ9hcUtA69u7pFNLdTHviY
	t76FhbQuUHr/dpgErVHMr3zgUpJ3BD1jJfL8lOEPoovzltUG+uc8OOvgiSbjA4uXXoMb
	Lkx+7Cq3a99fORZqTpNKoSLdhe0fyzPPkk+S5pctdTWhT1h9Dby3rMBHI9sj0uKtV3zq
	LW984C02KI1D7+tXye9eIhJeWawxEWMqUe2r66YDyXDjKmVdPvOiTRp2jk8MzMj9O8nE
	nHc3jiQCr8xJ9Ji+PJRIk6UdoJWZfn1JaQsRqk0JTv/AxKMv67HnT2BjmtkYTJERhXVi
	CTPA==
X-Gm-Message-State: AJaThX7uChEdeUWn8btq9hoXet1a9EZn5UnG0r3pwA67dC4g39vdQEMA
	SArDtrXDAuiFSwSn6IIMAuqr
X-Google-Smtp-Source: AGs4zMbb+3icnFu85hr3eqLmQUzHtt1hPZGy6lrWh9HFf+VofoFAfKJl/LynPEZbALfrudttbdgbag==
X-Received: by 10.28.159.15 with SMTP id i15mr1115088wme.58.1511266893198;
	Tue, 21 Nov 2017 04:21:33 -0800 (PST)
Received: from pohly-mobl1 (p54BD5744.dip0.t-ipconnect.de. [84.189.87.68])
	by smtp.gmail.com with ESMTPSA id w133sm686952wmg.9.2017.11.21.04.21.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Nov 2017 04:21:32 -0800 (PST)
Message-ID: <1511266891.5979.56.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 21 Nov 2017 13:21:31 +0100
In-Reply-To: <CAP9ODKqxbnkpimHmdoYEax6Njmxfcf9KVJazzvpgn=QzRWPc4w@mail.gmail.com>
References: <cover.1486668313.git.jussi.kukkonen@intel.com>
	<3126cc0be3fdcd228a3bc73e2e58b90447c53ef2.1486668313.git.jussi.kukkonen@intel.com>
	<1511251487.5979.54.camel@intel.com>
	<CAP9ODKqxbnkpimHmdoYEax6Njmxfcf9KVJazzvpgn=QzRWPc4w@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: native CA cert bundles (was: Re: [PATCH 3/3] cve-check-tool: Use CA cert bundle in correct sysroot)
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
X-List-Received-Date: Tue, 21 Nov 2017 12:21:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-11-21 at 10:06 -0200, Otavio Salvador wrote:
> On Tue, Nov 21, 2017 at 6:04 AM, Patrick Ohly <patrick.ohly@intel.com
> > wrote:
> > On Thu, 2017-02-09 at 21:38 +0200, Jussi Kukkonen wrote:
> > There is https://bugzilla.yoctoproject.org/show_bug.cgi?id=9883
> > open
> > about some aspect of this, but it doesn't actually address the
> > underlying question about what the right behavior should be. It's
> > based
> > on the assumption that libcurl-native should always use ca-
> > certificates-native.
> > 
> > Thoughts anyone?
> 
> I agree it should use ca-certificates-native for all native; it
> allows for self-signed internal certificates to be added for internal
> development.

But that's not what bitbake itself uses. Are you saying that bitbake
fetchers etc. should also use whatever certificates are configured for
ca-certificates-native? That leads to a chicken-and-egg problem.

A solution where custom certificates need to be configured in two
different places (system for bitbake, ca-certificates-native for some
other tools) sounds sub-optimal to me.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



