Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SsMbG-0004HL-6p; Sat, 21 Jul 2012 01:27:10 +0200
Received: by weyr6 with SMTP id r6so2854068wey.6
	for <multiple recipients>; Fri, 20 Jul 2012 16:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=93mCGz6Bzc58BMVuPA1duosImiGjkmLdbgJMW3FXIBw=;
	b=L/lW4NRIdiyF8BmbS1pg23ZOeaSo+0+xId2jNIKzwGeFKR5mQxNi3JxIZQrgvWy3oq
	KoJL1m5FjNHHhbEknTOUsbjxs/Yb+GteK5zwiqKDfx7MWU2WHQ8RSTkKsYiLcgWJ+im9
	FL2oD4XAnnSIw8VrAj8onXQQKlDsQIAGJP3kF+/nEOUYN+cvBf2RFCwHPVBqerjClJvd
	MqyOsaTPp8X7okhUM3NLJGwoT8SF9MfMZPCPNAHYerurCafmDDdLehyLLESCfcHDH8LF
	r2V7DiFFTLbHPVE7vk5MwwGI8zGI2K3cENNfXUm2Pd4DoxlsfWQurm4pW2WOq4GoamJy
	LRqg==
Received: by 10.180.79.229 with SMTP id m5mr18170834wix.13.1342826146471;
	Fri, 20 Jul 2012 16:15:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm331846wib.10.2012.07.20.16.15.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 16:15:45 -0700 (PDT)
Date: Sat, 21 Jul 2012 01:15:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120720231539.GB3576@jama.jama.net>
References: <20120718133146.0C2B910217@opal>
MIME-Version: 1.0
In-Reply-To: <20120718133146.0C2B910217@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : webkit-gtk: remove no-parallel bodge
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
X-List-Received-Date: Fri, 20 Jul 2012 23:27:10 -0000
X-Groupsio-MsgNum: 25901
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline

--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 01:31:45PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 90ca88a6f9dd5e2bc055739f84cb224f9a82455a
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D90ca88a6f9dd5e2bc055739f84cb224f9a82455a
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Tue Jul 17 19:44:19 2012 +0100
>=20
> webkit-gtk: remove no-parallel bodge
>=20
> This workaround was originally for GNU Make 3.82 which upstream was blami=
ng
> for a parallel build failure.  Since then I've changed numerous variables
> and now parallel builds are working with 3.82 (and succeed in 20 minutes
> instead of 2 hours).
>=20
> Revert the change until we've more data about what causes the breakage, t=
hen
> we can bring it back with more finesse.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Now it failed on one of my builders:

| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-ranlib
=2Elibs/libWebCoreGtk.a
| mv -f
Tools/DumpRenderTree/gtk/.deps/Programs_DumpRenderTree-TextInputController.=
Tpo
Tools/DumpRenderTree/gtk/.deps/Programs_DumpRenderTree-TextInputController.=
Po
| arm-oe-linux-gnueabi-libtool: link: ( cd "TestNetscapePlugin/.libs" &&
rm -f "libtestnetscapeplugin.la" && ln -s "../libtestnetscapeplugin.la"
"libtestnetscapeplugin.la"=20
)
| arm-oe-linux-gnueabi-libtool: link: cannot find the library
`libjavascriptcoregtk-1.0.la' or unhandled argument
`libjavascriptcoregtk-1.0.la'
| make[1]: *** [Programs/minidom] Error 1
| arm-oe-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f
"libWebCoreGtk.la" && ln -s "../libWebCoreGtk.la" "libWebCoreGtk.la" )

GNU Make 3.82

I've built it without PARALLEL_MAKE about 8 times already and this is
first time it failed.. so the race condition is probably still there.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAJ5psACgkQN1Ujt2V2gBzn0QCdF+LmBJ5npIEmNPf1oDH56nJg
NT0AoIfSy45J9Wz3C0grOHrDehh1n5FX
=OPpl
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
