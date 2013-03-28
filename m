Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULDLn-0005Vt-7f
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 14:58:58 +0100
Received: by mail-pd0-f174.google.com with SMTP id p12so2143786pdj.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 06:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=8GuZgIhqhGmf6cvgu9BxABGEDnC5S3uw79oANiamcxQ=;
	b=iJObclG+DKywqfdZ1122A6YSWtPxxNvzMDoNCUe35tSwBc7y2+YyrSQkObwRs58d8G
	w/IUmZwd2coM8gG426CbNtqqL40hDZYLON/7tMiDekhQ2SUFqnOThYWAC59FRxVAyOVN
	o6IpUhZMPybZZ5oZIe6VoVUrxh4mQ1XdGdhDAS1ny6IGNbwN6yeHxsN4RDXKjOUrZMhM
	wSU+P6EekW9yeVmQfrSjnh0c2HF8oAAVJ5Z0nOpXCMkf/7jUMtHlgfknigcvLF0H+/jX
	7pVuCvDyKpjWgELyzYoNu5ov90Zq5HAH6Vq/Aii4TI65SVKyD3RLroyH+niwOrq5IlH4
	psmg==
X-Received: by 10.66.255.41 with SMTP id an9mr35824577pad.44.1364478099983;
	Thu, 28 Mar 2013 06:41:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bs1sm14815153pbc.8.2013.03.28.06.41.37
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 06:41:38 -0700 (PDT)
Date: Thu, 28 Mar 2013 14:41:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Message-ID: <20130328134131.GB5105@jama>
References: <CADV-EXGjHhZgOSO5tzYQt7cQjPC5_7CDytxt26Ji0NsF5jUd6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADV-EXGjHhZgOSO5tzYQt7cQjPC5_7CDytxt26Ji0NsF5jUd6Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd: add python-systemd package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2013 13:59:03 -0000
X-Groupsio-MsgNum: 37192
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline

--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2013 at 03:35:48PM +0200, Yevhen Kyriukha wrote:
> Hi!
>=20
> It would be great if someone add changes to systemd recipe to generate
> python-systemd package (
> http://www.freedesktop.org/software/systemd/python-systemd/).

See systemd recipe in meta-systemd before it was removed and prepare
patch for oe-core version.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFUSIsACgkQN1Ujt2V2gBzowwCcD+5yczF+g1ujsTfZE/hSiGOw
na4An1kaAlowPsoDRuYxdPOoQDEVZbcO
=/S1u
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
