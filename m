Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SNk1o-0004wl-7T
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 14:12:00 +0200
Received: by wibhj13 with SMTP id hj13so468622wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 05:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=PIJL5uQDc6uhRKQIlLwcCwDktLU9y+hvzPCpfqvINIA=;
	b=m9PCqpq9USE0hgaexL7JD/unMSMj3duHgIoedo/PAPcyAeFTRswK0gDwYo7gySMsF6
	hoCmyEFGfmDFtLpWOOhUe1XOC90EcFdzmIkiWLmhL3mWgtpYmt2kivcjYfnGQmOSBbjt
	ZfO7FBvpr4jCA90leQiYd2l1oyVX7kFnLKWwRNZanGpRFhZUfmT7OSC3KOeQ94S0k1NW
	vx6g9Uj8OrTX5azOIf/MyKGe/jmXf55OQFDIn8zmNzekAraFnT2IM6ZwJI1t7apnzcgi
	myqbRqTS22KdiNZeVMenvpXLOpAqRu1NYqemopc5zOzWfNofG91B9fCkqXsy9cl0F9qb
	yDqg==
Received: by 10.180.91.10 with SMTP id ca10mr5307736wib.17.1335528142100;
	Fri, 27 Apr 2012 05:02:22 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n20sm6853233wiw.5.2012.04.27.05.02.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 05:02:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1335526751.20130.73.camel@ted>
Date: Fri, 27 Apr 2012 14:02:19 +0200
Message-Id: <D68D089B-A0F5-4CE3-9124-4DA8AD02287E@dominion.thruhere.net>
References: <1335526751.20130.73.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnEu+NbPCf2XYZm/kuTfNoY5VikFCgCZJqH/f9KMA5MSWD4EW8tE2jEpjDUw+Rm4kK6bXDO
Subject: Re: gcc default version change (and qt4)
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
X-List-Received-Date: Fri, 27 Apr 2012 12:12:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 apr. 2012, om 13:39 heeft Richard Purdie het volgende geschreven:

> I'd like to warn people that I'm pretty close to throwing the version
> switch to default to gcc 4.7 at the same time as merging in Khem's
> patches. I don't think this will surprise anyone, we've talked about
> doing it post release for long enough.
>=20
> It also appears that qt 4.7.4 has issues with gcc 4.7 and 4.8.1 is =
fixed
> so I'm going to change the default version on that at the same time.
>=20
> Since the tests on the autobuilder are looking pretty good now, I'll
> probably do this sooner than later, maybe on Monday.
>=20
> I'll probably then give it a week, then assuming no reason to change
> back to the older version, I'll remove gcc 4.6 and qt 4.7.4 from
> OE-Core. They may get added to meta-oe's toolchain layer at that point
> but that is up to the appropriate maintainers.

FWIW angstrom will be using 4.5 for 'denzil' and 4.7 for 'master'. No =
4.6 anywhere :)

regards,

Koen=


