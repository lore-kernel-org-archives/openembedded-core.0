Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TR0Cq-0005Nd-1g
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 14:37:08 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so378342wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 05:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=ehsJlXy5iHoR+HTOHn1+1YKKVvbyDw3uxacnFyQWgmY=;
	b=q/tgw5riCpjYP3SGOcHrHPWr3M1ZMFG31ydDZmCK4+wl+ql9Ya2LPG8tkoSs0J1wtE
	4o1tq1k1lkuXLCtlGXx0uodJvBrqHJ+3r5DewLYckkeKAzazYHF8M94jwP2n3AzaTKhv
	s9rMCtDnWuSfdg5dr+2eT6epPkNSeK9elqgi46HYlpeXMSuww2KYsQV47EqGAB0qHUUx
	LjJQC4PJE+65exTqBRDt9a6UAgMlpgGsIzQH02TRUhmGD5OEW4kkEV+RiQlpjJ90q9Ew
	ERypYl7vpXvOd8WMG72txAxa7b1+WwMDJRyw8ds3qyVMhDgd1LTutkJnDqbKsnvYXL/v
	TBaQ==
Received: by 10.216.210.223 with SMTP id u73mr9885079weo.132.1351081420853;
	Wed, 24 Oct 2012 05:23:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dt9sm4117224wib.1.2012.10.24.05.23.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 05:23:39 -0700 (PDT)
Date: Wed, 24 Oct 2012 14:23:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20121024122357.GG3269@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: eglibc-initial having wrong paths with STAGING_DIR_TCBOOTSTRAP
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
X-List-Received-Date: Wed, 24 Oct 2012 12:37:08 -0000
X-Groupsio-MsgNum: 30931
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k040vn1t/h12DMPO"
Content-Disposition: inline

--k040vn1t/h12DMPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

bitbake.conf:
STAGING_DIR_TCBOOTSTRAP =3D "${STAGING_DIR_TARGET}-tcbootstrap"

but in sstate-control manifest there is missing '/'

$ head -n 5 ../sstate-control/manifest-armv4t-eglibc-initial.populate-sysro=
ot.om-gta02=20
/OE/shr-core/tmp-eglibc/sysroots/om-gta02-tcbootstrapusr/include/dirent.h
/OE/shr-core/tmp-eglibc/sysroots/om-gta02-tcbootstrapusr/include/syscall.h
/OE/shr-core/tmp-eglibc/sysroots/om-gta02-tcbootstrapusr/include/mcheck.h
/OE/shr-core/tmp-eglibc/sysroots/om-gta02-tcbootstrapusr/include/_G_config.h
/OE/shr-core/tmp-eglibc/sysroots/om-gta02-tcbootstrapusr/include/sysexits.h

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k040vn1t/h12DMPO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCH3d0ACgkQN1Ujt2V2gBybFACghfkSBRHWE7SMUxgKacSB5vbN
ypAAn1uwoKYi5vMciFr8eb0sYHTpvJqZ
=bdBb
-----END PGP SIGNATURE-----

--k040vn1t/h12DMPO--
