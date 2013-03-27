Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UKtEM-0005n5-Hd
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 17:29:50 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb10so649096pad.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ncA+PvvNJfU8MOAve5kk8SiCu5nCVmQTBIwJw+AChNE=;
	b=duvb0zIhvCmbxa+lztJpid2EfMl8/xFw1Xgq/dWWXJwqDbqmSUNyGyet6n5V2Iw6Ru
	GaKMCT5HZWJ6GhZAYIxZhD0MYFK3uXr6HfWeN2US4S3FXnlVkJHzZCks3kqldTMdhStA
	7Wubvp1zEacoSMrlRbSlmTW8B38CXUD18TT6W7zrEzm43YcCQ+enrlIpd9BsL7sgNV2Z
	9qAPQvx2CfeDuijW0935dkPCKbOdzAVmJlUaLnwlFvqda9i5MZPbe8KfdJb9qO27x2cd
	ijSCeYzYp/lwhbq5/2QmNrHQ6dCpfuE4b9tNzxAGm6ZHKmV45ZP81de4MvDzIICtfjMG
	GFww==
X-Received: by 10.66.83.65 with SMTP id o1mr30084403pay.195.1364400760613;
	Wed, 27 Mar 2013 09:12:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 4sm21968172pbn.23.2013.03.27.09.12.37
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 09:12:39 -0700 (PDT)
Date: Wed, 27 Mar 2013 17:12:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130327161230.GC3254@jama>
References: <1364386111-1734-1-git-send-email-ross.burton@intel.com>
	<5695994C-BB2C-427C-A551-1EA6D4C2AD9D@dominion.thruhere.net>
	<20130327160752.GB3254@jama>
MIME-Version: 1.0
In-Reply-To: <20130327160752.GB3254@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Upgrade to 198
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
X-List-Received-Date: Wed, 27 Mar 2013 16:30:01 -0000
X-Groupsio-MsgNum: 37167
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline

--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2013 at 05:07:52PM +0100, Martin Jansa wrote:
> On Wed, Mar 27, 2013 at 04:03:31PM +0100, Koen Kooi wrote:
> >=20
> > Op 27 mrt. 2013, om 13:08 heeft Ross Burton <ross.burton@intel.com> het=
 volgende geschreven:
> >=20
> > > From: Khem Raj <raj.khem@gmail.com>
> > >=20
> > > Tested on ppc and x86_64
> > > compile tested for uclibc
> > >=20
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> >=20
> > Since 199 has been released a few days back, how about upgrading to tha=
t and drag in http://cgit.freedesktop.org/systemd/systemd/commit/?id=3D9424=
3ef299425d6c7089a7a05c48c9bb8f6cf3da ?
> >=20
>=20
> also "systemd-journal" group should be created to get rid of
> systemd-journald[44]: Failed to resolve 'systemd-journal' group: No such =
process
>=20
> I guess that SIGUSR1 is expected (I got this even after creating that
> group):
> systemd-journald[44]: Received SIGUSR1

Looks correct:
http://www.freedesktop.org/software/systemd/man/systemd-journald.service.ht=
ml

SIGUSR1
Request that journal data from /run/ is flushed to /var/ in order to
make it persistent (if this is enabled). This may be used after /var/ is
mounted, but is generally not required since the first journal write
when /var/ becomes writable triggers the flushing anyway.

SIGUSR2
Request immediate rotation of the journal files.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFTGm4ACgkQN1Ujt2V2gBwtFQCdHisycbIVFEU6ht7PSSGvy08S
R/gAoKbHdktF+q9JqEyq2NYRGm5YTdTR
=BXOz
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
