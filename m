Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCC362252
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Aug 2014 17:31:44 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so898608wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Aug 2014 10:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=zAmdzxNu7mtr8vvroTjiJGoaj/QnWMME8NaQfSrlDgs=;
	b=A0ic/ZcSNTdF/tH6osfjk82HS//X1DSucda1rErzeXswtBus/P5YY9LgIk5hAnA07H
	rkMCd9cUYDXCKcPq+iazrHX42u3tySSddAhXOKqtIy2QrmaWgCijIYHNMZ+tSm+j81f1
	A8HbUlbZYjqnuSG1B15G4GoWBWvPTTVguG/ecpRn4sQXy2Qa9X71dWhxAPKsFaDCGJhB
	MIzbcNuaXvsATMWV5dYNMhgC4ZsJ4smJuunnosRqh7aRaZSxdhJCx+Q28m5RuV4EToi7
	wkBXdTRZm/RkEcfy4vvWx9FVRoyLdO9djUepxcFYUF3hDzNrj/6fxpXUgdEit8zZahI/
	pDAg==
X-Gm-Message-State: ALoCoQnLv1YY4bXUqdtEXnoaXdQeOfvqY3kgZeunkTCFOokVtSxJzUw91xK5zD/ZwMj9Bxy8Yygx
X-Received: by 10.194.184.101 with SMTP id et5mr12261693wjc.14.1408815104779; 
	Sat, 23 Aug 2014 10:31:44 -0700 (PDT)
Received: from ?IPv6:2001:610:612::305b:65ad:85ac:4118?
	([2001:610:612:0:305b:65ad:85ac:4118])
	by mx.google.com with ESMTPSA id es9sm84913690wjd.1.2014.08.23.10.31.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 23 Aug 2014 10:31:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1408649791.git.peter.seebach@windriver.com>
Date: Sat, 23 Aug 2014 19:32:14 +0200
Message-Id: <279BFA02-D387-4463-AF6D-F759B89A30EC@dominion.thruhere.net>
References: <cover.1408649791.git.peter.seebach@windriver.com>
To: Peter Seebach <peter.seebach@windriver.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Sat, 23 Aug 2014 17:31:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 aug. 2014, om 21:54 heeft Peter Seebach =
<peter.seebach@windriver.com> het volgende geschreven:

> The various cortex chips generally support thumb code, so the armv7at
> tunings are a better default for them than the plain armv7a tunings.

Thumb1 or thumb2? In the case of t1, it's useless on armv7a. The t2 case =
it more involved. The SoCs produced in the first ~2 years need a ton of =
erratum fixups enabled in the kernel, some of them mutually exclusive =
(e.g. enabling a work around on cortex-a8 breaks cortex-a9).

Angstrom switched to t2 builds a few months ago and a lot of devices =
didn't boot anymore (kernel) or segfaulted early (/sbin/init) without =
the appropriated kernel fixups.

So ensure everything is in place to deal with potential t2 code, all =
devices on my desk work with it, but that's just a tiny subset of =
everything out there.

regards,

Koen=

