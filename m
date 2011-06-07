Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QTsn1-0006lO-Dw
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 11:41:35 +0200
Received: by wwb17 with SMTP id 17so3953215wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 02:38:18 -0700 (PDT)
Received: by 10.216.255.206 with SMTP id j56mr3731551wes.39.1307439497331;
	Tue, 07 Jun 2011 02:38:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fl19sm1539052wbb.32.2011.06.07.02.38.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 02:38:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307102133.2529.260.camel@phil-desktop>
Date: Tue, 7 Jun 2011 11:38:15 +0200
Message-Id: <C8EB46A5-E33D-4D3C-B525-67E0EFD714DE@dominion.thruhere.net>
References: <1307102133.2529.260.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Tue, 07 Jun 2011 09:41:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 jun 2011, om 13:55 heeft Phil Blundell het volgende geschreven:

> There is no good reason for uclibc to be machine specific.  Remove =
local
> assignment to PACKAGE_ARCH so that it gets the default target
> architecture and bump PR for that change.
>=20
> See =
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/003064.htm=
l
>=20
> Also replace a chunk of anonymous python with a COMPATIBLE_HOST
> declaration.
>=20
> Signed-off-by: Phil Blundell <philb@gnu.org>

Not sure if we do this in the OE-core world, but:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>=


