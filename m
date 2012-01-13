Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlmRy-0002cH-ID
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 20:06:06 +0100
Received: by eekd17 with SMTP id d17so942803eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 10:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pWLnTby9lWQG/pJrFuu8p+jKALLSZFt7jOVYXxZ94Zc=;
	b=m9IpzqDPbQhqHZT8Fvv1pju1cHF6Y0Kvc9pxY8zfyzn80036MZ4bmImG6cInw9MGQe
	8NmAvLe+o3pCRUirATMnarR5qAWJujxv9YpFg+zG3g/gfzC7ECYelGfzuEVr1k7jwSVy
	uUbBaw7TwSWDKtn4tpGR+A6y6o/Abg9GfR8/I=
Received: by 10.213.27.15 with SMTP id g15mr530344ebc.111.1326481103277;
	Fri, 13 Jan 2012 10:58:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 76sm32978414eeh.0.2012.01.13.10.58.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jan 2012 10:58:22 -0800 (PST)
Date: Fri, 13 Jan 2012 19:58:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120113185810.GB3483@jama.jama.net>
References: <cover.1326216024.git.josh@linux.intel.com>
	<35eca064e6310d94b517b481beef5f5a5a3f395b.1326216024.git.josh@linux.intel.com>
	<4F0F08F4.4010505@linux.intel.com>
	<20120112163127.GG3452@jama.jama.net>
	<4F107DEE.4020106@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F107DEE.4020106@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/3] task-base: add alsa-state to task-base-alsa
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
X-List-Received-Date: Fri, 13 Jan 2012 19:06:06 -0000
X-Groupsio-MsgNum: 15991
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline

--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2012 at 10:54:38AM -0800, Joshua Lock wrote:
>=20
>=20
> On 12/01/12 08:31, Martin Jansa wrote:
> > On Thu, Jan 12, 2012 at 08:23:16AM -0800, Darren Hart wrote:
> >>
> >>
> >> On 01/10/2012 09:39 AM, Joshua Lock wrote:
> >>> This enables automatic configuration setting and restoration on syste=
ms
> >>> with alsa.
> >>>
> >>> Signed-off-by: Joshua Lock<josh@linux.intel.com>
> >>
> >> Acked-by: Darren Hart<dvhart@linux.intel.com>
> >
> > can we use VIRTUAL_RUNTIME for this, please?
> >
> > for example in SHR we have alsa-state provided by fsoaudiod
>=20
> That's a fine idea. VIRTUAL-RUNTIME_alsa-state?

good for me.

> I'm testing a patch for it now.

Thanks!

>=20
> Cheers,
> Joshua
> --=20
> Joshua Lock
>          Yocto Project "Johannes factotum"
>          Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8QfsIACgkQN1Ujt2V2gByg1ACfRMRaXA30+sO4dcYDS4ECRSM0
eyYAn3uvP4oknUlxeyoApN8Z01L6i75E
=Srfl
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
