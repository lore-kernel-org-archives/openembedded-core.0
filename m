Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T1GkV-000446-71
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 15:01:31 +0200
Received: by eekb57 with SMTP id b57so111216eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 05:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=o2KlSXgLGI/cF/54XFMH0L2AS/gPNjJcrbH0lAyC0KA=;
	b=dYCTA2bxWqAFHYaMYXfIEj2ESoAmor8WvgvyOonbMzmNqM/A3yqSeHHzz8VncccPHV
	xrTYYdeJy10y+0bwYLKpcHagYww+qawelKaq4WtVWu1hBQXT4K6sByRnm1cojpn0xV4X
	rtRnYKek+xXauLXS5jyYOi1L64ZTu9vGP8gLkiSvNgJJ3sPT2esJdDsx7qM/rBEjA1w3
	zrDPuxx3K5wq68GCQVJ/iPs6IQDHIdAqXmymyhOD2+TE2Ylp0uz0lduz6jx1UslbkGga
	ePvXCj01KgKAkIv+B9S1OZxmperKegyk3gAPviAtsLaMBqA0ptcuC6EtGo1ziEaqYqhi
	KyXA==
Received: by 10.14.175.8 with SMTP id y8mr14926937eel.8.1344948576405;
	Tue, 14 Aug 2012 05:49:36 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6507:c9b9:4609:2873?
	([2001:610:612:0:6507:c9b9:4609:2873])
	by mx.google.com with ESMTPS id l42sm6665536eep.1.2012.08.14.05.49.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Aug 2012 05:49:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAK18fxFfWO0ZG2tisaROTuJ-FSgLoqMW4cUgTpNq3DNeqFpNqg@mail.gmail.com>
Date: Tue, 14 Aug 2012 14:49:35 +0200
Message-Id: <1EE0C4BA-A5E0-42FC-B354-89B29C5C6C22@dominion.thruhere.net>
References: <CAK18fxFfWO0ZG2tisaROTuJ-FSgLoqMW4cUgTpNq3DNeqFpNqg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQlIcytPYesEPBHNmk0I+oGXJ3BHD0HAfYDQJU8YU5EB2sMRTKL7HXo1zWc22cLXCy9kkr0H
Subject: Re: dbus with tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2012 13:01:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 14 aug. 2012, om 13:11 heeft Andrei Gherzan <andrei@gherzan.ro> het =
volgende geschreven:

> In the process of updating dbus, tests (in my opinion) are mandatory.
>=20
> While compiling dbus with tests, dbus and dbus-glib are needed. To =
compile dbus-glib, dbus is needed (obviously). The only solution (to =
compile dbus with tests) that i found is to create a new recipe named =
dbus-tests where to compile dbus with --enable-tests =
--enable-embedded-tests, skip write to sysroot (noexec) and just package =
dbus-tests.
>=20
> 1. Do you guys know a better solution for this?

It's actually the only solution that would work :)

> 2. What would be a good path to use for installing tests?

$bindir or $libexecdir IMO=


