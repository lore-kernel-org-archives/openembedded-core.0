Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SfQJG-00020W-N3
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:47:06 +0200
Received: by wibhm14 with SMTP id hm14so193886wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 23:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=gi/xKZx6azKlY95LQoOgsxp5EQqMKDOlsW8XPZWos20=;
	b=tk2PEbDKlt874dm0KvByH5L0I7B52ITml7p40Z96MDxoVbXYG2XOY8LcGggvco0rvK
	idP5ogru9i0WL6NKbmwvTcgESeS5UXzoBwCXGNt6YyvzlwVzkZliwpogA0CX5hRgKMap
	WZHCnfvewS18K4pM4b/EwBptkWekURvl9v5XppPymjapx5BHHcDcMnjKuGUFz27fuXeH
	eiV9X/6vHdK8A1cGoDprk9juIRFNlKvVRIqqx3fGxmUdfeOKkLGWZ/GmPXNppV4MOfSM
	bhO0ybzmF+pFcVi+0Bp19O6TP0KnPrQpP6NqrwRo6x/PLewaRKuIc6zI6lo4fxtc4QUe
	I3yA==
Received: by 10.180.80.228 with SMTP id u4mr1690425wix.5.1339742188699;
	Thu, 14 Jun 2012 23:36:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f7sm2228024wiv.2.2012.06.14.23.36.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 23:36:27 -0700 (PDT)
Date: Fri, 15 Jun 2012 08:36:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120615063647.GU3140@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: openssl does not build on recent distributions with perl-5.16.0
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
X-List-Received-Date: Fri, 15 Jun 2012 06:47:06 -0000
X-Groupsio-MsgNum: 23600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sDhuxz86kt5qlkuV"
Content-Disposition: inline

--sDhuxz86kt5qlkuV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

openembedded-core/meta/recipes-connectivity/openssl/openssl.inc

is using perlpath.pl:

  do_configure () {
          cd util
          perl perlpath.pl ${STAGING_BINDIR_NATIVE}
  ...

and perlpath.pl is using find.pl:
openssl-1.0.0i/util/perlpath.pl:
  #!/usr/local/bin/perl
  #
  # modify the '#!/usr/local/bin/perl'
  # line in all scripts that rely on perl.
  #

  require "find.pl";
  ...

which was removed in perl-5.16.0 and marked as deprecated and
unmaintained in 5.14 and older:=20
/tmp/usr/lib/perl5/5.14.2/find.pl:
  warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl
  core distribution in the next major release. Please install it from the
  CPAN distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]},
  line @{[(caller)[2]]}.\n";

  # This library is deprecated and unmaintained. It is included for
  # compatibility with Perl 4 scripts which may use it, but it will be
  # removed in a future version of Perl. Please use the File::Find module
  # instead.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sDhuxz86kt5qlkuV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/a1/8ACgkQN1Ujt2V2gBxYSQCgm4g4MdFshz34NYyNcjPcv4cH
2h8AoJ0yiOYYZz5HIEe5RUuP2e69SACO
=HqNW
-----END PGP SIGNATURE-----

--sDhuxz86kt5qlkuV--
