Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRo3k-0002MH-4d
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 18:14:16 +0200
Received: by wwb17 with SMTP id 17so5328283wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 09:11:05 -0700 (PDT)
Received: by 10.227.178.203 with SMTP id bn11mr7480792wbb.51.1306944665598;
	Wed, 01 Jun 2011 09:11:05 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c17sm847887wbh.12.2011.06.01.09.11.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 09:11:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306944235.2529.109.camel@phil-desktop>
Date: Wed, 1 Jun 2011 18:11:04 +0200
Message-Id: <5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>
References: <1306944074.2529.107.camel@phil-desktop>
	<1306944235.2529.109.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: dbus-native --with-x
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
X-List-Received-Date: Wed, 01 Jun 2011 16:14:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jun 2011, om 18:03 heeft Phil Blundell het volgende geschreven:

> On Wed, 2011-06-01 at 17:01 +0100, Phil Blundell wrote:
>> Is there any compelling reason why dbus-native needs to be built
>> --with-x?  This seems to be causing quite a large stack of native X11
>> packages to get built with, as far as I can tell, no useful result.
>=20
> Oh, on the subject of out-of-control dependency chains, my other pet
> bugbear at the moment is rpm-native:
>=20
> "rpm-native" -> "bzip2-native"
> "rpm-native" -> "db-native"
> "rpm-native" -> "perl-native"
> "rpm-native" -> "openssl-native"
> "rpm-native" -> "expat-native"
> "rpm-native" -> "autoconf-native"
> "rpm-native" -> "automake-native"
> "rpm-native" -> "libtool-native"
> "rpm-native" -> "gnu-config-native"
> "rpm-native" -> "gettext-native"
> "rpm-native" -> "python-native"
> "rpm-native" -> "acl-native"
> "rpm-native" -> "elfutils-native"
> "rpm-native" -> "libpcre-native"
> "rpm-native" -> "zlib-native"
> "rpm-native" -> "popt-native"
> "rpm-native" -> "attr-native"
>=20
> As far as I can tell, the native rpm is never being used in any way
> which requires it to have openssl, and I suspect the same is probably
> true for some of the other libs above.  Does anybody happen to know =
what
> features rpm-native actually requires for correct operation?

Furthermore, rpm-native seems to get built even if you don't select rpm =
as package format!

regards,

Koen=


