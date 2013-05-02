Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXwv9-0008Ry-Tx
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 19:04:02 +0200
Received: by mail-pa0-f49.google.com with SMTP id hk2so458043pac.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 09:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=5rQfoklOIzS5GBqCOoqHmynP+DitpPnjzjMxSivuEjk=;
	b=G1JnfR++fQHrFUd0qqVHDH44zI7eMSN5E/9dgAfFGMmYho8lE9odQ7eXdyqqqB6nwP
	RF7ZZHB78IcqB25u7dUVEkCd+bLUsvHkzxOCye0mx7V9GUeu5qLv2vC+cgTFgUql/mz1
	WyXNCdqodqLuYD0EQMjL0lVqKA5gL2+zDzR9kSkxs4wbs5FFESf+IqUTEo0uttrqJpjB
	kuAupuRh4RInIshPD+GSmzeZE6QF5PFOkLd/ujMBTfBwHGFWtFK4+/VG3gU4rOImj9Hp
	DcAQrn4Zm4RhsJ1Yq1+/sU/fpNTl++LNyOdnDPPb9zD6gWqnBJMkQGq1Bd0mhMdEjjE7
	u+Ow==
X-Received: by 10.66.235.3 with SMTP id ui3mr10711666pac.200.1367513157553;
	Thu, 02 May 2013 09:45:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	10sm7924398pbr.45.2013.05.02.09.45.54 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 02 May 2013 09:45:56 -0700 (PDT)
Date: Thu, 2 May 2013 18:46:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130502164613.GE3206@jama>
References: <1367506593-11381-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1367506593-11381-3-git-send-email-jukka.rissanen@linux.intel.com>
	<20130502153930.GD3206@jama>
	<CAJTo0LZrk_JYXV8EQbJ9T__L6qBGHQfO5mNvZmUJtYTEas9x7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZrk_JYXV8EQbJ9T__L6qBGHQfO5mNvZmUJtYTEas9x7g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] neard: Use SRCREV instead of SRCPV
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
X-List-Received-Date: Thu, 02 May 2013 17:04:05 -0000
X-Groupsio-MsgNum: 38666
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Content-Disposition: inline

--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2013 at 05:11:28PM +0100, Burton, Ross wrote:
> On 2 May 2013 16:39, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> -PV =3D "0.10+git${SRCPV}"
> >> +PV =3D "0.10+git${SRCREV}"
>=20
> As the git revision is the 0.10 tag, wouldn't it be clearer to not set
> PV as the git revision is a detail of the fetcher - this *is* 0.10.

That's fine too as long as nobody bumps SRCREV without updating PV or
uses AUTOREV from some .inc or local.conf.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGCmFUACgkQN1Ujt2V2gBwc0ACgubCu3RrownrvdKnqGzfgicAB
JdQAmQG30wDLtsG/Gjy59YdscO42DYBY
=i0F7
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--
