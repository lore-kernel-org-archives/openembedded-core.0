Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9gKO-0006S5-I7
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 18:52:48 +0200
Received: by fxi1 with SMTP id 1so3272528fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 09:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V/ixclWou+sAxW6vMjtI8HrOFEComn7RPgIVdGF0Sw4=;
	b=CTfTAvn4TxO3GyL9QME85zV5n58+hifRS04QlCVz2O3sGlXJvn2PJIbzcpfLQLr9O9
	D94pJwJJ44j5Z9UD2JQ6m9RWLc0CbiSmgtz+3UJsnwd6r3I0dYNTCdMjpRZ3HjiUWBOA
	+jzsnLvQBHSkij0lzp06wVmHvk1jhslJjPmAs=
Received: by 10.223.43.211 with SMTP id x19mr9501648fae.142.1317401225720;
	Fri, 30 Sep 2011 09:47:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f25sm7407910faf.7.2011.09.30.09.47.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 09:47:04 -0700 (PDT)
Date: Fri, 30 Sep 2011 18:46:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20110930164658.GB7364@jama.jama.net>
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
	<1317392122.12332.208.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1317392122.12332.208.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Fri, 30 Sep 2011 16:52:48 -0000
X-Groupsio-MsgNum: 10323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline

--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 03:15:15PM +0100, Richard Purdie wrote:
> I'd not forgotten about this patch, just been distracted by other
> things. I've run some further tests on the changes here and have
> comments below. Summary is I think some pieces can merge, other pieces
> need more work. Lets try and get the pieces that are ready merged, then
> worry about the remainder.
>=20
> Could we clean out the problematic pieces and resubmit please so we can
> at least get those pieces in? :)

pushed as 6 patches to=20
oe-core-contrib jansa/allarch

1st patch contains changes you've marked as fine
2nd is hal-info, which is imho not worth debugging it as nobody likes
  hal nowadays (I've tried to patch configure.in, but recipe doesn't
  call reautoconf IIRC..)
the rest is kept as reminder which recipes needs to be taken care of.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6F8oIACgkQN1Ujt2V2gBzx6wCfagVmGh9f3YnJ+IBmG0OLiSF1
on4An22Hbt4pUEB8muTqCa57zJ4kuiBl
=doIo
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
