Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCTyF-0005lb-3z
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 11:45:15 +0200
Received: by wye20 with SMTP id 20so504254wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2011 02:42:52 -0700 (PDT)
Received: by 10.216.237.138 with SMTP id y10mr644219weq.30.1303292465504;
	Wed, 20 Apr 2011 02:41:05 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id r80sm348315wei.39.2011.04.20.02.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 02:41:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110420091523.GH5675@jama.jama.net>
Date: Wed, 20 Apr 2011 11:41:03 +0200
Message-Id: <89CD9535-8ECD-4B21-AF00-DC47EEF03418@dominion.thruhere.net>
References: <20110420091523.GH5675@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Mailman refusing multipart/signed Content-Type
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
X-List-Received-Date: Wed, 20 Apr 2011 09:45:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 apr 2011, om 11:15 heeft Martin Jansa het volgende geschreven:

> Hi,=20
>=20
> mailman always refuse gpg signed e-mails from me when I forgot to
> disable default sign.
>=20
> Complete header is:
> Content-Type: multipart/signed; micalg=3Dpgp-sha1; =
protocol=3D"application/pgp-signature"; boundary=3D"cvVnyQ+4j833TQvp"
> Content-Disposition: inline
>=20
> Mailman message is:
> The message's content type was not explicitly allowed
>=20
> Other LTG lists don't have problem with this, is it intentional or =
could
> someone fix oe-core ML configuration?

I added 'multipart/signed' to the whitelist, could you try and see if it =
works?

regards,

Koen=


