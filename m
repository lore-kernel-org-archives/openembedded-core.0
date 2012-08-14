Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T1KYQ-0000kU-9G
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 19:05:18 +0200
Received: by eekb57 with SMTP id b57so191155eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 09:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=sUJJ8GRc3jcHTLqErNrEIDaVtkloiw9awgqgjNo9Tys=;
	b=KW9TuVLS9Lwy1Dlkxy4wptlplJiAAvWBFoyjvjtL5hEjmHrpZm9mvLAuJF+Ri/aKrE
	G8st5t7CzWUkZKNi1l6yr5VFCRPa+1Qe0goI/gV9vtmxOzKMTwMPstOUXbb1Jb1jdmLv
	bJlUaorYRRnCVaevtMqorzzdb3Bdgg366Z4VyqHC0oSvD1xWVU0/vv9iK2WVOAvkBeRp
	qL5Zn79VASCyfi0ZTZTE6Covyl5jaghzRqUk8fvdnqlbvQgx3z5/udc1FA+B2lvzbAps
	7ojcudzwDbBJQMuEo4EJB1r7oJ+xOhSVQgFHzRRVUoafl0LX+MCWz7C6RY4IQ+v2DliM
	YNSA==
Received: by 10.14.223.72 with SMTP id u48mr16200185eep.37.1344963203170;
	Tue, 14 Aug 2012 09:53:23 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id h2sm8306900eeo.3.2012.08.14.09.53.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Aug 2012 09:53:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <502A7BB0.4050708@linux.intel.com>
Date: Tue, 14 Aug 2012 18:53:21 +0200
Message-Id: <5CB37A1B-9FC1-42AC-BF8E-291E3440A2C5@dominion.thruhere.net>
References: <CAK18fxFfWO0ZG2tisaROTuJ-FSgLoqMW4cUgTpNq3DNeqFpNqg@mail.gmail.com>
	<1EE0C4BA-A5E0-42FC-B354-89B29C5C6C22@dominion.thruhere.net>
	<502A7BB0.4050708@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQkyGbWRbySmiBwRfKlC4GBqjtwOEVoOHlwhRFthEUxl11fgmLM3Rm9/TplNIBhma67q1pYm
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 14 Aug 2012 17:05:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 14 aug. 2012, om 18:24 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> On 08/14/2012 03:49 PM, Koen Kooi wrote:
>>=20
>> Op 14 aug. 2012, om 13:11 heeft Andrei Gherzan <andrei@gherzan.ro> =
het volgende geschreven:
>>=20
>>> In the process of updating dbus, tests (in my opinion) are =
mandatory.
>>>=20
>>> While compiling dbus with tests, dbus and dbus-glib are needed. To =
compile dbus-glib, dbus is needed (obviously). The only solution (to =
compile dbus with tests) that i found is to create a new recipe named =
dbus-tests where to compile dbus with --enable-tests =
--enable-embedded-tests, skip write to sysroot (noexec) and just package =
dbus-tests.
>>>=20
>>> 1. Do you guys know a better solution for this?
>>=20
>> It's actually the only solution that would work :)
>>=20
>>> 2. What would be a good path to use for installing tests?
>>=20
>> $bindir or $libexecdir IMO
>=20
> Not bindir please!  Tests should live separate,
>=20
> If it;s going to be libexecdir, really should be $libdir/$BPN as we =
want to move way from having things live in /usr/libexec, and yes with =
time $libexecdir will be $prefix/lib/$BPN.

I wanted to suggest libdir/BPN, but since that's one of those =
new-fangled things adopted by systemd I thought people would have a =
knee-jerk reaction, kinda like the big players threatening to back out =
of yocto if systemd ends up in oe-core.=20=


