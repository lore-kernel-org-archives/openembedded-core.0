Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWb3C-0003YK-Th
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 23:21:30 +0200
Received: by wwb17 with SMTP id 17so5303431wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:18:05 -0700 (PDT)
Received: by 10.227.179.14 with SMTP id bo14mr1004740wbb.90.1308086285198;
	Tue, 14 Jun 2011 14:18:05 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id en1sm5340963wbb.35.2011.06.14.14.18.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 14:18:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 14 Jun 2011 23:18:02 +0200
Message-Id: <E0300751-811D-4FAE-A9E5-5C7A4FD88C4F@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Tue, 14 Jun 2011 21:21:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jun 2011, om 23:13 heeft Khem Raj het volgende geschreven:

> PACKAGE_ARCH is set to BASE_PACKAGE_ARCH so we do not
> need to define it here since we already define BASE_PACKAGE_ARCH
>=20
> angstrom sets FEED_ARCH like
>=20
> FEED_ARCH ?=3D "${BASE_PACKAGE_ARCH}"
>=20
> and 'all' doesnt go well for FEED_ARCH as it ends up with
> parsing error for x86 machines.
>=20
> This might be a latent bug in bitbake but allarch.bbclass
> excavated it and we burry it in the same class.
>=20
> This makes the behavior same as it was before allarch.bbclass
> where we set PACKAGE_ARCH =3D all for common packages
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Just to repeat the questions you answered on IRC already:

this will still result in a foo_1.0_all.ipk, right? So I don't have to =
recreated the feeds *again* as I needed to do after the =
machine-name->machine_name changes?

regards,

Koen=


