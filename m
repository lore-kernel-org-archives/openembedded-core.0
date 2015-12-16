Return-Path: <roman@khimov.ru>
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id C7DD870057
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 19:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Reply-To:To:From;
	bh=ByZTys8lpBDpbW+TkCgufzeaalrOfA/OHhJwnT+hJTQ=; 
	b=g/WbWnplswu2BidposnomcZZ/REet9hckG0HeUmgpcbtpIJRYi6D3qo3DK5sH592ShQ2oWpXR1ox42+bk9AM8ac9XsZfCM+N8d/bT5jSlc25JnQlvZKfoAW2bgoRTk3CAqYSm7bGVNI+u7+oO2tFTSdt1slQ6hkHgPwsBP/KQPWb/cBiZmEV+TDBrZXwz4Lp2cFEWoC3jKkbijQCW6aEWT5zcezoPK73Pz/MZ/TcitS0oO5hBez/R+kZ4pmnyx5ulpqNgcwK/cHNslkNmgOdQpktETywqxJ8bUusARobg8W1wmW5BspKRzKHMypfHOmnFRhcckZblA0ipngpbSL2hg==;
Received: from [93.100.16.104] (helo=masala.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>) id 1a9I2G-0003E1-EW
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Dec 2015 22:46:56 +0300
From: Roman Khimov <roman@khimov.ru>
To: openembedded-core@lists.openembedded.org
Reply-To: roman@khimov.ru
Date: Wed, 16 Dec 2015 22:46:51 +0300
Message-ID: <1893430.e3TcZXnnJp@masala.hex>
User-Agent: KMail/4.14.10 (Linux/4.1.13-5-default; KDE/4.14.10; x86_64; ; )
In-Reply-To: <1b8e3d820ac8f20f89ba01e1f88543deed69620e.1450288828.git.mschiffer@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
	<1b8e3d820ac8f20f89ba01e1f88543deed69620e.1450288828.git.mschiffer@universe-factory.net>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] base-files: create typical merged /usr symlinks if the "merged-usr" distro feature is set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Dec 2015 19:47:02 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 16 =D0=B4=D0=B5=
=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2015 19:12:00 =D0=BF=D0=BE=D0=BB=D1=8C=D0=
=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Matthias Schiffer =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> The following options in a distro configuration create a full Fedora-=
style
> merged /usr:
>=20
>   DISTRO_FEATURES_DEFAULT +=3D "merged-usr"
>   base_bindir =3D "${exec_prefix}/bin"
>   base_sbindir =3D "${exec_prefix}/bin"
>   sbindir =3D "${exec_prefix}/bin"
>   base_libdir =3D "${exec_prefix}/${baselib}"
>   nonarch_base_libdir =3D "${exec_prefix}/lib"

Hmm. Why not just change the base_prefix? We've done it this way (not m=
erging=20
bin with sbin, but that's a separate thing):

+base_prefix =3D "/usr"
+sysconfdir =3D "/etc"
+localstatedir =3D "/var"

Also, you probably want to add this symlinks to fs-perms.txt. I don't q=
uite=20
remember which packages failed for me without it, but there were some.

--=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

