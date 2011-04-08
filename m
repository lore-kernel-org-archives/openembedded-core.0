Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q8Doa-0001HM-Re
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 17:41:40 +0200
Received: by wwb17 with SMTP id 17so3855741wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Apr 2011 08:39:31 -0700 (PDT)
Received: by 10.216.25.202 with SMTP id z52mr77891wez.14.1302277171441;
	Fri, 08 Apr 2011 08:39:31 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	e13sm1782083wbi.40.2011.04.08.08.39.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2011 08:39:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D9F2423.7060900@mlbassoc.com>
Date: Fri, 8 Apr 2011 17:39:30 +0200
Message-Id: <DD53E7EC-88AD-4F21-B670-6A846E74B03D@dominion.thruhere.net>
References: <4D9F2423.7060900@mlbassoc.com>
To: openembedded-core oe-core layer <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [poky] [PATCH] Control over when package init scripts are run
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
X-List-Received-Date: Fri, 08 Apr 2011 15:41:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Something like this would be better:

=
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De124d03f53=
2aad2ee22c60fda6824a8a1f2ef88f

Op 8 apr 2011, om 17:05 heeft Gary Thomas het volgende geschreven:

> The script /etc/rcS.d/S98configure is run on the first boot only
> to process any postponed package post-install scripts.  The default
> position of this (98 =3D=3D last) can be wrong, so let the =
distribution
> set this (just a matter of ?=3D assignment).  This patch also removes
> some slugos stuff and extends the flexibility to systems which use
> RPM packaging as well.
>=20
> Tested on my PowerPC router, running as S00configure - works a treat.
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> =
<0001-Allow-target-distribution-to-specify-when-to-run-pac.patch>_________=
______________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



