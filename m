Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RuW4A-0004tx-A4
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 22:25:38 +0100
Received: by wgbdr13 with SMTP id dr13so5959281wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 13:17:37 -0800 (PST)
Received: by 10.180.86.198 with SMTP id r6mr15762961wiz.2.1328563057043;
	Mon, 06 Feb 2012 13:17:37 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s2sm36850181wix.3.2012.02.06.13.17.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 13:17:36 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMvUbCz0Lts7dUOWWvJeivm9nUb3nuhEqS-QY4+nOYOgmDzEkw@mail.gmail.com>
Date: Mon, 6 Feb 2012 22:17:33 +0100
Message-Id: <2025C8A2-8B17-4F99-B4B3-3A0C8EC2C322@dominion.thruhere.net>
References: <CAMvUbCz0Lts7dUOWWvJeivm9nUb3nuhEqS-QY4+nOYOgmDzEkw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQnpKlQ9qQTmNS4mx+FnvEYIJQjcTpnVS53g8bfkS8sXXNV3TBevSJQjcGMSyvMNmWNhe7S5
Subject: Re: armhf support in OpenEmbedded?
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
X-List-Received-Date: Mon, 06 Feb 2012 21:25:38 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 6 feb. 2012, om 22:01 heeft Leon Woestenberg het volgende geschreven:

> Hello,
>=20
> do we already have support for the ARM "armhf" ABI in OpenEmbedded?  =
(A quick search on the ML didn't get me hits).
>=20
> Basically,"armhf" is built with -mfloat-abi=3Dhard, and tuned for =
armv7-a CPUs.

Yes, we've had it for ages in OE-classic and Marks tune overhaul made it =
easy to use in OE-core as well. Also note that armhf has practically no =
adavantage over softfp in real world applications. The only things =
getting a decent speedup in proper benchmarks was povray.

regards,

Koen=


