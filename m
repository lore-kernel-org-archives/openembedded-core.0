Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SxCos-0008SW-CC; Fri, 03 Aug 2012 10:01:14 +0200
Received: by weyr6 with SMTP id r6so220356wey.6
	for <multiple recipients>; Fri, 03 Aug 2012 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OQONEQYvO5yzaXbjmXmPGBYpc0jJqL2UegAmr/r7TGM=;
	b=gsvksgWbT919qwx48qmwaiKwLVYwyGGNchkQYT92tlWF6kteXqvlg4CgK+Pqm2ITXb
	c2wDwSPHfi81cv7kozeWAZeMX7V9e4erjEMQeq+IHrYFGIh+FMQfGoR9nirn3XWMDS8c
	pCxqCYdN2Og8gh0l54POQsLzdNnRG6/KRthTbzZJmQMD+D6Kx/QiLO3K+xbT20UaGtn5
	5bFXmIUtrCeekCYYjEEbcLMyWINhmtI/QpG71qeg73D1JiGDArT3XzWBVT5dkVZgsroy
	07ip126eAIdZ387Mbh3OaGDLqF9MQDWmv8YleeWHcXkwQkLUNGrl59K0EZByPkK5WHFD
	DKvQ==
Received: by 10.216.74.21 with SMTP id w21mr439317wed.77.1343980173845;
	Fri, 03 Aug 2012 00:49:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm22528278wiz.4.2012.08.03.00.49.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 00:49:32 -0700 (PDT)
Date: Fri, 3 Aug 2012 09:49:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120803074931.GB30148@jama.jama.net>
References: <CA+YB3rbdcfSNi4es51A0nXAK55rbPsbe3-dpVCjiJz4_q0AjaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+YB3rbdcfSNi4es51A0nXAK55rbPsbe3-dpVCjiJz4_q0AjaQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: tsc <tsc@lists.openembedded.org>, openembedded-devel@lists.openembedded.org
Subject: Re: Minutes: OE-TSC 31 July 2012
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
X-List-Received-Date: Fri, 03 Aug 2012 08:01:14 -0000
X-Groupsio-MsgNum: 26856
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline

--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 03:18:26PM -0700, Jeff Osier-Mixon wrote:
> OpenEmbedded Technical Steering Committee
> 31 July 2012
>=20
> Attendees: Mark, Koen, Richard, Paul
> Apologies: Khem
>=20
> ________________________________________________________________
> Agenda & Results
>=20
> 1. pick a chair - bluelightning
>=20
>  d. package.bbclass whitespace
>  tabs resulting in warnings, seems better in general
>  some fallout, some positive comments

> [17:25] <bluelightning> on to 3d: package.bbclass whitespace
> [17:25] <bluelightning> presumably this is now sorted?
> [17:25] <fray> I've seen some fallout on that, but in generate is seems
> much better
> [17:26] <bluelightning> yeah, we expected some
> [17:26] <bluelightning> I don't have a handle on how much grief we caused
> for other layers
> [17:26] <fray> I don't think it was bad
> [17:27] <fray> I figure in a few weeks as more layers roll forward, we
> might get some more stuff..
> [17:27] <RP__> It resulted in warnings, not errors so it shouldn't have
> been too bad
> [17:27] <bluelightning> it sounds like the fallout was less than expected
> [17:27] <fray> the biggest thing I heard about was 3 vs 4 character
> whitespace in things like package.bbclass..
> [17:27] <fray> bluelightning certainly less then I expected


I was expecting some discussion about=20
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026176.html

Can this be discussed on next TSC meeting?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAbgosACgkQN1Ujt2V2gBxTMgCfWKwt6d3hnrI3sLGKpJ3Qyqc0
GFwAoKeSNhhgrJrYw7hgU3cBhK9t9IDC
=pTNQ
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
