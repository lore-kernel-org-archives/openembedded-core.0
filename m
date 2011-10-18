Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RG4b3-0007ub-P6
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 10:00:25 +0200
Received: by bkat8 with SMTP id t8so535547bka.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 00:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=It8VvU7NPUVPZ49d8wxxEMeixmUIP8xUQH1TACmiFW8=;
	b=XV9NmYfP9ItV8q42/usLk8C92MJuaZYfvmgU6UwyoEM4iV3nKn5zZO3QFbaWP5auzi
	cVQzvvB/uBAWchDi20FStYII7uQId79zFKx0d+LQnBCcsicP7hlv7jxlaxxDcg7eSo2q
	aMnODEZoZXkmY0tfJ6NpEhxDzu12IoUqHd9/o=
Received: by 10.205.83.73 with SMTP id af9mr887250bkc.24.1318924475638;
	Tue, 18 Oct 2011 00:54:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm1068794bkn.7.2011.10.18.00.54.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 00:54:34 -0700 (PDT)
Date: Tue, 18 Oct 2011 09:54:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111018075427.GB20678@jama.jama.net>
References: <cover.1318901607.git.raj.khem@gmail.com>
	<32b67c2bc8ebfcbf0db650e93a2152399ca89ee7.1318901607.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <32b67c2bc8ebfcbf0db650e93a2152399ca89ee7.1318901607.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/3] gcc-4.6: Backport PR46934 fix
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
X-List-Received-Date: Tue, 18 Oct 2011 08:00:25 -0000
X-Groupsio-MsgNum: 11154
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline

--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2011 at 06:39:27PM -0700, Khem Raj wrote:
> We have been hitting this issue on ARM/thumb and
> have a workaround in place to compile samba
> http://git.openembedded.org/openembedded/commit/recipes/samba/samba_3.2.1=
5.bb?id=3D4ba7aa07c0dcd28f94515ff9927e2a04403fcf15
> This backport should fix the gcc bug
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I can confirm that samba build with this works again (without forcing
ARM mode), I'm going to run more build tests with it but for now:

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

(holds also for 2/3)
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6dMLMACgkQN1Ujt2V2gBxVsACgg3HohSVOszto9596v/0r8po4
vCIAnR5zD4Su+J0CaFINW5vbWfh0cWD8
=4I+M
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
