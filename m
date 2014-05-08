Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f48.google.com (unknown [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6AF09606E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 18:38:30 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e49so1962185eek.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 11:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=7Kx76EWZmBKTfAe4peoeMcnJbw/naU++8uEtsMWZveM=;
	b=vvW1odiuodKftEfmaYtitN6UtgBdZkyu6caP66bbNNx+HAOHy0ukLVMht6iDUHCA3x
	Oio117xxf9/D2Vu4qnoJ7BMbRgQkMfCAFLg+HN11atau5KlS7qide4w/YKHLfhVBb6/J
	41s8kiaS5rTEhXDH9tsqxss8Df1bBEYv+OipUAZ9re+OBusc7vih2Zl/WFFbEUKUvT98
	HRRHU8PaSujwm5as8DlZyGB+f7JQ9gR9Nfsj/GS8WZPDiEx5PhaGuuqSBEHSxXOj0uPf
	9nzL88Gzn4v0rFmvFvrikIupYUTZ1VGI8Ms2FWO+yee5dX0ab4GmlFI8xyB7Vj0Ht+L+
	zVIw==
X-Received: by 10.15.49.8 with SMTP id i8mr5061938eew.33.1399574311659;
	Thu, 08 May 2014 11:38:31 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id l1sm5936975eem.45.2014.05.08.11.38.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 May 2014 11:38:30 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Thu, 8 May 2014 18:38:27 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Saul Wold <sgw@linux.intel.com>,
	OE Core <openembedded-core@lists.openembedded.org>
Message-ID: <20140508183827.GE26157@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Daisy backports of opkg fixes
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
X-List-Received-Date: Thu, 08 May 2014 18:38:33 -0000
X-Groupsio-MsgNum: 53000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline

--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Saul,

opkg 0.2.2 missed inclusion in daisy as it was released too late but it did=
 fix
a couple of important bugs (with opkg issue numbers in brackets):

- Fix '--force-reinstall' flag so that it acts as an upgrade rather than
  removing possibly critical packages before reinstall (issue 71)

- Symlinks are now correctly removed during package uninstall (issue 91)

Both of these could be beneficial to have in daisy. The first one in partic=
ular
prevents commands like 'opkg install --force-reinstall libc6' from complete=
ly
bricking a system.

As the stable branch policy forbids backporting the package upgrade, I'm ha=
ppy
to add these fixes as patches which apply on top of opkg 0.2.1.

I'll let you decide if these are worth backporting first though before I do=
 the
work.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTa88jAAoJEBwoJlo7UPQDt6wIAIhRuWbYhGjK0F6XDnfP1WLJ
MJj7TaMjLXE03+6LuOqTVNIqX5jL/0T07xKo35/NnjFXSRsv0KEeobV9TK2DyLZ5
FMMR+wXTkpzzlXGjEoN36DubY+TfhKFV+n7O4ek1pXY+P92tGjMiHYady1s+QGMQ
rz/GN1ZWrgNDpPA8pTV22LLUO5yt9spFjQjQCiQl8UL/atAejBYPXFwhDa+FfuMS
Kr7oO8h0hOHxtMqQBgnzpTKPgWpD85Ugbf7HBrVQUsxojNgT0uzkqYr+Kcoq5/gf
AzUBhCzxylsJNEwu6KdI64klNysHzS7GvpbuhEvCURjdhLqgKzx+vmgn8TiDsnM=
=OFcj
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--
