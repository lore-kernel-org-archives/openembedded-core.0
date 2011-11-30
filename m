Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVhqk-0005nU-Dq
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 11:57:14 +0100
Received: by eaad13 with SMTP id d13so488071eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 02:50:34 -0800 (PST)
Received: by 10.213.3.11 with SMTP id 11mr362373ebl.98.1322650234161;
	Wed, 30 Nov 2011 02:50:34 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 49sm4964391eec.1.2011.11.30.02.50.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 02:50:32 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 30 Nov 2011 11:50:26 +0100
In-Reply-To: <43e4ff11b1c935566e81f3ad7f2c64a709c4cdb3.1322648566.git.xiaofeng.yan@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322648566.git.xiaofeng.yan@windriver.com>
	<43e4ff11b1c935566e81f3ad7f2c64a709c4cdb3.1322648566.git.xiaofeng.yan@windriver.com>
Message-Id: <068EE226-9491-4B42-BAEC-A2B762CCF748@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/2] x11-common: Change drive mode of Xfbdev when xserver using framebuffer
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
X-List-Received-Date: Wed, 30 Nov 2011 10:57:14 -0000
X-Groupsio-MsgNum: 13269
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1E0B772F-FF5C-45BC-904F-08B6A0E59574";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1E0B772F-FF5C-45BC-904F-08B6A0E59574
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Op 30 nov. 2011, om 11:33 heeft Xiaofeng Yan het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> The previous mode of starting X is as follow:
> $Xfbdev :0 -keybd keyboard -mouse tslib
> This mode cause that some keys can't be mapped rightly. \
> for example "Down" have the same function with "Enter".
> 
> another drive mode "evdev" can work rightly in new version.
> $Xfbdev :0 -keybd evdev,,device=/dev/input/event0 -mouse tslib

How do you know that event0 is the keyboard?

--Apple-Mail=_1E0B772F-FF5C-45BC-904F-08B6A0E59574
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7WCnYACgkQMkyGM64RGpHd8gCfTHlgidDLopJgt1wQa7VZGOuC
YtIAn1cEs0/RJ8EIwSj02KyQjGreHtlt
=UJAm
-----END PGP SIGNATURE-----

--Apple-Mail=_1E0B772F-FF5C-45BC-904F-08B6A0E59574--
