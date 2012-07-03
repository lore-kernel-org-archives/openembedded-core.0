Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sm6ye-00025g-Aw
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 19:33:28 +0200
Received: by weyr6 with SMTP id r6so1110053wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 10:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IZidt64aGWDkk8ArggPLh4anCjRrZOTr4/e2+AMJBa8=;
	b=SwJIKYml+jxRPhLnjKAiYrxnHuTlKzRgMS+7hahF/+RbbNcjIoX2RjgRIolDZGqsKP
	Qm37Mj8xT6JnBP0j+Clk394Q8TPjMNAt1PpbBpGZWHzLhQEqUo3zs8rEerFSSALpdgt1
	jbPc08q1PAUslckZufSqi2BfA18GhOWwADLoB+gTakPa/Z2LniWAtYclKJhm9A+m+MoK
	ZDKsbEotDvN4ZrasdbZst++2Wts3OnQw3YcIFkM4zLi57BYnfnhrO26t9oDcB/cuqfy+
	uzXXK1rByu/o+HRePXv9lnzvVUb/nPcaf3LvhDZPB4PTRSTxEMzMA2D0fBXVeIbax3ZK
	9XLQ==
Received: by 10.216.81.7 with SMTP id l7mr4833233wee.23.1341336143605;
	Tue, 03 Jul 2012 10:22:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fw4sm31861228wib.0.2012.07.03.10.22.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jul 2012 10:22:22 -0700 (PDT)
Date: Tue, 3 Jul 2012 19:22:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120703172219.GC3771@jama.jama.net>
References: <4FF320DD.8090301@palm.com>
 <4FF32550.6060606@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4FF32550.6060606@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: local.conf & bblayers.conf changes...
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
X-List-Received-Date: Tue, 03 Jul 2012 17:33:28 -0000
X-Groupsio-MsgNum: 24573
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline

--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2012 at 10:01:04AM -0700, Saul Wold wrote:
> On 07/03/2012 09:42 AM, Rich Pixley wrote:
> > Where can I find a description of the recent changes and what I need to
> > do to bring my files back up to current?
> >
> > What were the incompatible changes?
> >
> For bblayers.conf, we bumped the version becase we moved the BBPATH=20
> initial setting into the bblayers.conf to ensure we dont accidently=20
> pickup things in . because of the way a :: was being parsed.  See
> this commit
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D5e3a61b40b7b6=
97d83b41e7e247cd1f94eb7673c
>=20
> Not sure what you mean about local.conf, since I am not sure of your=20
> starting point.

Maybe he refers to OELAYOUT_ABI change from:
http://git.openembedded.org/openembedded-core/commit/?id=3D4199efed48005a62=
267fa3374c33b13627d85f44

Which in sanity.conf suggests:
"To continue, either rebuild or switch back to the OEBasic signature
handler with BB_SIGNATURE_HANDLER =3D 'OEBasic'."
see: http://git.openembedded.org/openembedded-core/commit/meta/classes/sani=
ty.bbclass?id=3Dbf440fd971dd549ae4e92c54046ea062ef51cd85

but doesn't say that if you decide to switch back to OEBasic signature
handler that you have to also bump tmp-eglibc/abi_version to 8 to
silence this sanity check and keep OEBasic without rebuilding.

Cheers,

>=20
> Sau!
>=20
>=20
> > --rich
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/zKksACgkQN1Ujt2V2gBw3zQCgkTPS6j8qROZ7z73q0Or/7BLh
IBwAn3HUwLmrIKzs5XQAnVzz0355Ou/r
=T3hY
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
