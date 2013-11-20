Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id A47366C73F
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:38:12 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so3020601eak.4
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 02:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lTihKZ0vQnR9OLmhsB8xDRctOoSQEMuNDK0oo0eS1xA=;
	b=zSEBZywWf4dWdb/gN/Vq2/LHKPGU6p0JFpJe82wsT5qHAXPBPcoII3/0eq6Cw/Sk+S
	4KmXoJdR1lVVDkadjmTZsNiGI/uiwxLD1A0IAV/ylsULYx8FslISWU9rzym7jVVlPRJ3
	t/H6dChbdxQsSTWJYH33cl0gPFtfemnTXPiqiE83xJC6n1YjfOQeMmb235QWKSwuiJgn
	LtnrVmWvVxQSuFT/+yDLEgS9r6sFvy+AmSAO8N3IgSZxLnrTHYmSAmUbYvjsrv6/Ywb8
	f/zxKvP32qJf0vA7MswA2HWOkV0k+wKlzqvkSmlxXvnDbigIVHyNbKydvZWnxMWMoMSe
	ba4Q==
X-Received: by 10.14.0.72 with SMTP id 48mr73060eea.50.1384943893674;
	Wed, 20 Nov 2013 02:38:13 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	g47sm58193757eeo.19.2013.11.20.02.38.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 02:38:12 -0800 (PST)
Date: Wed, 20 Nov 2013 11:38:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20131120103815.GJ3708@jama>
References: <528C8880.7070806@topic.nl>
MIME-Version: 1.0
In-Reply-To: <528C8880.7070806@topic.nl>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: tslib keeps failing on checksum
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
X-List-Received-Date: Wed, 20 Nov 2013 10:38:13 -0000
X-Groupsio-MsgNum: 47323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liqSWPDvh3eyfZ9k"
Content-Disposition: inline

--liqSWPDvh3eyfZ9k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 11:01:36AM +0100, Mike Looijmans wrote:
> =EF=BB=BFI get this error every time I try t build the current oe-core ma=
ster:
>=20
> ERROR: Checksum failure fetching=20
> https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.xz;d=
ownloadfilename=3Dtslib-1.1.tar.xz
> ERROR: Function failed: Fetcher failure for URL:=20
> 'https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.xz;=
downloadfilename=3Dtslib-1.1.tar.xz'.=20
> Checksum mismatch!
> File: '/home/mike/zynq-next/build/downloads/tslib-1.1.tar.xz' has md5 che=
cksum=20
> d41d8cd98f00b204e9800998ecf8427e when 14771f8607b341bb4b297819d37e837d wa=
s=20
> expected
>=20
> Now the weird thing is, that when I fetch the thing using wget, I get a b=
lob=20
> with the right checksum:
>=20
> # wget https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.t=
ar.xz
> # md5sum tslib-1.1.tar.xz
> 14771f8607b341bb4b297819d37e837d  tslib-1.1.tar.xz
>=20
> Is oe-core using some other flavour of wget or what else could cause this=
 kind=20
> of fetch error?

Have you tried to unpack both tarballs and compare content in them?

If you have older version of bitbake, then it could be that you have
broken tarball in downloads directory.

>=20
> --=20
> Mike Looijmans - TOPIC Automation
>=20
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
>=20
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) =E2=80=93 (0)499 - 33.69.79
> Telefax: (+31) - (0)499 - 33.69.70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>=20
> Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn uitslu=
itend bestemd voor de geadresseerde, zoals die blijkt uit het e-mail berich=
t en/of de bijlagen. Er kunnen gegevens met betrekking tot een derde instaa=
n. Indien u als niet-geadresseerde dit bericht en de bijlagen ontvangt, ter=
wijl u niet bevoegd of gemachtigd bent om dit bericht namens de geadresseer=
de te ontvangen, wordt u verzocht de afzender hierover direct te informeren=
 en het e-mail bericht met de bijlagen te vernietigen. Ieder gebruik van de=
 inhoud van het e-mail bericht, waaronder de daarbij behorende bijlagen, do=
or een ander dan de geadresseerde is onrechtmatig jegens ons dan wel de eve=
ntueel in het e-mail bericht of de bijlagen voorkomende andere personen. TO=
PIC Embedded Systems is niet aansprakelijk voor enigerlei schade voortvloei=
end uit het gebruik en/of acceptatie van dit e-mail bericht of de daarbij b=
ehorende bijlagen.
>=20
> The contents of this message, as well as any enclosures, are addressed pe=
rsonally to, and thus solely intended for the addressee. They may contain i=
nformation regarding a third party. A recipient who is neither the addresse=
e, nor empowered to receive this message on behalf of the addressee, is kin=
dly requested to immediately inform the sender of receipt, and to destroy t=
he message and the enclosures. Any use of the contents of this message and/=
or the enclosures by any other person than the addressee or person who is e=
mpowered to receive this message, is illegal towards the sender and/or the =
aforementioned third party. TOPIC Embedded Systems is not  liable for any d=
amage as a result of the use and/or acceptance of this message and as well =
as any enclosures.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--liqSWPDvh3eyfZ9k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKMkRcACgkQN1Ujt2V2gBxG4ACfQzzlzHRqreNzc9szgnjxWVQw
Np0AmwUp6o42boIkt72+WwCnrCgj4fQu
=ZXNW
-----END PGP SIGNATURE-----

--liqSWPDvh3eyfZ9k--
