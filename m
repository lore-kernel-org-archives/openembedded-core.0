Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLXCp-0004aU-Q6
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 10:33:59 +0100
Received: by wyh5 with SMTP id 5so3205523wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 02:27:49 -0700 (PDT)
Received: by 10.227.204.204 with SMTP id fn12mr4328170wbb.21.1320226069709;
	Wed, 02 Nov 2011 02:27:49 -0700 (PDT)
Received: from [172.20.1.32] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id es5sm3048086wbb.11.2011.11.02.02.27.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 02:27:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 2 Nov 2011 10:27:32 +0100
In-Reply-To: <1320224305-6747-2-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320224305-6747-1-git-send-email-Martin.Jansa@gmail.com>
	<1320224305-6747-2-git-send-email-Martin.Jansa@gmail.com>
Message-Id: <E931143B-21AD-462E-A831-0693725DD432@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/3] keymaps: use VIRTUAL-RUNTIME_kbd instead of console-tools directly
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
X-List-Received-Date: Wed, 02 Nov 2011 09:33:59 -0000
X-Groupsio-MsgNum: 11813
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C42E25CF-BD17-4114-91DC-3A951CAADEC0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C42E25CF-BD17-4114-91DC-3A951CAADEC0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Op 2 nov. 2011, om 09:58 heeft Martin Jansa het volgende geschreven:

> * nowadays kbd seems more active and it's available ie in meta-openembedded
> * other option is to move kbd from meta-openembedded to
>  openembedded-core and changed DEPENDS

Since I really dislike VIRTUAL_RUNTIME_*, let's move kbd into OE-core.

regards,

Koen

--Apple-Mail=_C42E25CF-BD17-4114-91DC-3A951CAADEC0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6xDQ4ACgkQMkyGM64RGpGxKACffJPVsfCd5fGUfuEP49DVoeDg
vCkAnRdLnvaUU0/msI2xJEQHyoMUSw+q
=ETBg
-----END PGP SIGNATURE-----

--Apple-Mail=_C42E25CF-BD17-4114-91DC-3A951CAADEC0--
