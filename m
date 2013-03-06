Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDIYA-0006Pv-Fz
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 18:54:56 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so6335008pbc.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2013 09:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=YvjTqy9XseNk02WMvAosr0f5VrE4OGjSSWt+OH+2Lp0=;
	b=ZIwcddEC1DmUPuhSC3apuIPEk9aEh/RC37LI1Ga+167wXszThdFrti+iM2XAmM4zgW
	EBVwfqYCKWRMJAxZkSwSb26lL0wY7EYHTwwNbQwM6oZ/qtNn1l3iyLs4VxZ1qecWHilh
	lBvtE4hR4Uin1qLmUUgspLGpZH9ImQsEhkZUaTK3AGDbUSyH4oKbNEiN1QpCgdfHv/g7
	hAAgHEtuO4r7yPvRCQ3k5coPwl6PsE/7CrkQDu5mrWsA0MLxW0+p3Mm0YMsCvFcKwI0T
	KSAEbA6X45SqK912eClG69IG4IYxqsoLUOR4T2Eg962K44hNnPPw7PcIl90NQouG6mOH
	vzig==
X-Received: by 10.68.225.40 with SMTP id rh8mr36909028pbc.137.1362591494521;
	Wed, 06 Mar 2013 09:38:14 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ip8sm6545751pbc.39.2013.03.06.09.38.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Mar 2013 09:38:13 -0800 (PST)
Date: Wed, 6 Mar 2013 18:37:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130306173756.GD32228@jama.dyndns-home.com>
References: <1362159742-20602-1-git-send-email-Martin.Jansa@gmail.com>
	<1552403.roegCEAHfx@helios>
MIME-Version: 1.0
In-Reply-To: <1552403.roegCEAHfx@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sanity.bbclass: always use oe.lsb.distro_identifier method
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
X-List-Received-Date: Wed, 06 Mar 2013 17:55:08 -0000
X-Groupsio-MsgNum: 36292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Nae48J/T25AfBN4"
Content-Disposition: inline

--6Nae48J/T25AfBN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2013 at 10:54:25AM +0000, Paul Eggleton wrote:
> On Friday 01 March 2013 18:42:22 Martin Jansa wrote:
> > * even when /etc/redhat-release or /etc/SuSE-release exists
> > * don't read /etc/lsb-release manually, NATIVELSBSTRING is not
> >   reading it too
>=20
> Unfortunately this has been merged before I had a chance to reply. FYI I =
put=20
> the code in here to read the files directly on purpose, because most dist=
ros=20
> bundle up the lsb_release tool with all of the LSB dependencies, so if yo=
u=20
> want to set up a headless server without some of the LSB dependencies (wh=
ich=20
> include X11) you won't have the lsb_release tool and NATIVELSBSTRING is=
=20
> "Unknown". Yes, I know we have this problem with NATIVELSBSTRING already.

then we should fix it in oe.lsb.distro_identifier method and share the
same code for sanity and NATIVELSBSTRING.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6Nae48J/T25AfBN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAlE3fvQACgkQN1Ujt2V2gBxsNwCYm851YNtynLdQugFbkOfPxdPo
OQCeMJzHAzlmVPt87WJEA1G8pxRJIm4=
=WXvk
-----END PGP SIGNATURE-----

--6Nae48J/T25AfBN4--
