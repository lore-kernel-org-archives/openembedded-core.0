Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id EED1C739BE;
	Mon, 13 Jul 2015 17:37:29 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so95584180pdr.2;
	Mon, 13 Jul 2015 10:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=WV90vRhDSEr0G6zdISz5trb1N/4j/lvh/ikyYbHOE9c=;
	b=Nc30UISpyHNjjB4sN0rXD0aUmK7Vq+ZSC0UHo3HxWcpQKkytOUdeA4NUjSiODCqC6N
	LBzgRAe6roCFfFZ+RLQQaM+IC6fV9fefTp+gfEamkE8fNWLQLclqZNtLsp9upXnOy3c6
	umPmfrL86oBrC0A0z9hHiC60wKYzdiZm1CV3mUEsiPxm0cLNqlPac88BijOKz0v/XMry
	EmT+YBiJQv05u8J8uE50vgN32Iy/qc++XdAoPmf/zmcON8TU1orhQlhA7yNwJh1T9i9Q
	rB+2LPSBcg8lxFcTHMDRQwMbgaHDl90ZOUykf5K+n2QaO5AnAEWmkJ+ev2/sXN+jcacm
	1gsg==
X-Received: by 10.66.62.202 with SMTP id a10mr5715115pas.42.1436809049203;
	Mon, 13 Jul 2015 10:37:29 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:2911:52b8:984e:c65b?
	([2601:646:8601:4580:2911:52b8:984e:c65b])
	by smtp.gmail.com with ESMTPSA id
	do3sm19160866pbb.5.2015.07.13.10.37.28
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Jul 2015 10:37:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Pgp-Agent: GPGMail 2.5
Date: Mon, 13 Jul 2015 10:37:23 -0700
Message-Id: <261F5389-C495-4B05-B79E-309AE0E0F0CA@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Yocto discussion list <yocto@yoctoproject.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Mailer: Apple Mail (2.2102)
Subject: glibc 2.22
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
X-List-Received-Date: Mon, 13 Jul 2015 17:37:30 -0000
X-Groupsio-MsgNum: 67903
Content-Type: multipart/signed;
	boundary="Apple-Mail=_65805941-0605-4404-B39B-FBE83868203D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_65805941-0605-4404-B39B-FBE83868203D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi All

glibc 2.22 will release end of this month. For some time I have put =
together the update here

=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mas=
ter&id=3D02e73ea526d94f21c7ef82eb96b062eff8ebb825

It works pretty well for machines I have tested it on ( arm/x86 ) but =
would be interested if more wider trial could be carried
out and issues reported between now and release can be addressed.

Please give it a try if you have spare cycles

Thanks
-Khem



--Apple-Mail=_65805941-0605-4404-B39B-FBE83868203D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWj91cACgkQuwUzVZGdMxRA+gCgkSzUeaeubUSKZHM5rUY2Re1z
5wEAn2OPj0sFYt4er8ptomzLr33zTaXZ
=/J8r
-----END PGP SIGNATURE-----

--Apple-Mail=_65805941-0605-4404-B39B-FBE83868203D--
