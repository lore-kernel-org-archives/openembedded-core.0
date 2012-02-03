Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RtEHE-0006h0-TB
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:13:48 +0100
Received: by eaal10 with SMTP id l10so644544eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:05:51 -0800 (PST)
Received: by 10.213.15.7 with SMTP id i7mr2322947eba.23.1328256351783;
	Fri, 03 Feb 2012 00:05:51 -0800 (PST)
Received: from [172.20.1.36] (ip5451781a.direct-adsl.nl. [84.81.120.26])
	by mx.google.com with ESMTPS id n56sm19094446eeh.6.2012.02.03.00.05.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:05:49 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
Date: Fri, 3 Feb 2012 09:05:48 +0100
Message-Id: <FD054A27-BFF7-4E6B-83EA-2B57375CED13@dominion.thruhere.net>
References: <cover.1328226197.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 00/14] Self-Hosted Fixes and Package Updates
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
X-List-Received-Date: Fri, 03 Feb 2012 08:13:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 feb. 2012, om 00:47 heeft Saul Wold het volgende geschreven:

> Richard,
>=20
> This is a patch of updates and self-host-image fixes.
> I also added the gnupg version that is gplv2 to go along
> with the libzypp changes from Steve.
>=20
> Sau!
>=20
> The following changes since commit =
70e1226e8c10bf07d6c7b1e13d745ad603f2ec73:
>=20
>  meta-yocto/local.conf.sample.extended: add LICENSE_FLAGS_WHITELIST =
section (2012-02-02 22:04:54 +0000)
>=20
> are available in the git repository at:
>  git://git.openembedded.org/openembedded-core-contrib sgw/updates
>  =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Ds=
gw/updates
>=20
> Saul Wold (14):
>  task-self-hosted: add disk partitioning tools
>  task-self-hosted: add python-pkgutil since it's required
>  self-hosted-image: add package management for correct installation
>  openssl: Update to 1.0.0g
>  openssl: Update to 0.9.8t (gplv2)
>  gnutls: Update to 2.12.16
>  rxvt-unicode: Update to 9.15
>  gnupg: Add gplv2 version 1.4.7
>  file: Update to version 5.10
>  libidn: Update to 1.24
>  libdrm: Update to 2.4.30
>  xinit: Update to 1.3.2
>  xf86-input-keyboard: Update to 1.6.1

Isn't xf86-input-evdev the preferred input solution nowadays?

regards,

Koen=


