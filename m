Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 070807232F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 08:38:31 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so594431wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Dec 2014 00:38:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=C0DdQahjadR9NrOvQBbzADV4VoPLgI+3uXfOTArrlF4=;
	b=k7ioSM2Wz8v8LiJCD5g+lW3iDTv7ashOHNeLEANjAupG5byeQTOhOGlYwCGmYO4dPb
	zSTLL3tUrk5NH2vmrDzmfoKLVjfZh+BX1UX62lq+b4njCV0ij4AOz70l/61riD6MjJOE
	XCUIF2AsrRyC2TvjiS9cYjOtR5izU+ogFDeWcKniWlHAt6nJujc4orBsvaEvRgj7/oZr
	aWN3YgERWkIFv4Vy3Nw6ArDkeUEtYBafrTWIb/eAzAXW9mQenEf9WTg5vCJsQGUWkugV
	Scy8iOtY4kjPs4RAjv18uZFFbIcv/M4Ssg/Lz5jpM8a5T0naVm/UCFko0Koo8Ghl/wTO
	pg5A==
X-Gm-Message-State: ALoCoQmEl4XjyLyA1f9VNn5BdI8AWM4vdTDvlz30HUjeKMJbGOSc2al4OcauPMuf+Us2EHmj0b7O
X-Received: by 10.180.7.201 with SMTP id l9mr2280572wia.80.1417768711443;
	Fri, 05 Dec 2014 00:38:31 -0800 (PST)
Received: from ?IPv6:2001:610:612::b805:a3c3:97e2:e849?
	([2001:610:612:0:b805:a3c3:97e2:e849])
	by mx.google.com with ESMTPSA id js5sm1320456wid.11.2014.12.05.00.38.30
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Dec 2014 00:38:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1417722907-1196-1-git-send-email-sgw@linux.intel.com>
Date: Fri, 5 Dec 2014 09:38:29 +0100
Message-Id: <642F9E05-91D2-4767-A786-3390265C9C3F@dominion.thruhere.net>
References: <1417722907-1196-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] procps: Upgrade to 3.3.10
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
X-List-Received-Date: Fri, 05 Dec 2014 08:38:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 4 dec. 2014, om 20:55 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:
>=20
> This is now the procps-ng version
>=20
> cleaned up patches
> added to fix up usrbin_execprefix in OE-Core
>=20
> Added --enable-skill to ensure snice and skill where built to match
> the buildhistory from the older version
>=20
> Add CPPFLAGS to allow seperate build directory works
>=20
> [YOCTO #6952]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>=20
> Double checked with buildhistory this time!

Awesome, two small nitpicks left:

> +#inherit autotools-brokensep gettext pkgconfig update-alternatives
> +inherit autotools gettext pkgconfig update-alternatives

[..]

> +inherit update-alternatives

Drop the commented line and the duplicate inherit below do_install=

