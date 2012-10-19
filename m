Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TPIbc-0004gx-WA
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 21:51:41 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so409265wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 12:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IzDyq6Is2MjEzydtRw6ZapGkodUsSko9WJJO0TKhfvw=;
	b=APVG7HyOBJl0b+XjfLv37gkFt099edpDzuOvJpX16NWvk873nUFLw+3aPcad4r3v2V
	xd813W5KON5CXKrOPpq4V7Tp3KAK7kEWO5NLZR2CX+Prn/U1PItTHxFG9gmF0/OkHcYs
	t8cR+teUjhX9nCwkQLJOMHHp1Sr0UBthwiHxxR5uL0Hh0/vZ6+E9xkLE43wR221Z/nSp
	Ag9o6jtamchcs+O+dm9F3okqtt7i58igfgysrqyuPI9FJZZ7CO43R4wa5tcUIN0y4m/k
	DQtfYTrEzgGfsTSkD7cXZ7/TyfVo8LAlnCYD5sS60zidSkAFE4CEpxuIzCoc4Z4V7ngA
	VgOg==
Received: by 10.216.201.198 with SMTP id b48mr1318086weo.126.1350675499808;
	Fri, 19 Oct 2012 12:38:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm36332219wif.4.2012.10.19.12.38.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 12:38:18 -0700 (PDT)
Date: Fri, 19 Oct 2012 21:38:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20121019193829.GA29349@jama.jama.net>
References: <1350600718-3052-1-git-send-email-denis@denix.org>
	<20121019084432.GH3087@jama.jama.net>
	<20121019165616.GA27336@denix.org>
MIME-Version: 1.0
In-Reply-To: <20121019165616.GA27336@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Add more tunes for new ARM processors Cortex-A15 and Cortex-A7
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
X-List-Received-Date: Fri, 19 Oct 2012 19:51:41 -0000
X-Groupsio-MsgNum: 30749
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2012 at 12:56:16PM -0400, Denys Dmytriyenko wrote:
> On Fri, Oct 19, 2012 at 10:44:32AM +0200, Martin Jansa wrote:
> > On Thu, Oct 18, 2012 at 06:51:56PM -0400, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >=20
> > > The patchset adds 2 more standard tune files for the new ARM MPCore (=
multicore)
> > > processors Cortex-A15 and Cortex-A7, as per:
> > >=20
> > > http://www.arm.com/products/processors/cortex-a/cortex-a15.php
> > > http://www.arm.com/products/processors/cortex-a/cortex-a7.php
> >=20
> > Please check this patchset=20
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/030=
759.html
>=20
> Yes, I've seen that patchset. Unfortunately it's still in the queue and i=
s=20
> going through implementation iterations. Once it gets into OE-Core, I'd b=
e=20

Nobody commented on last iteration (except of acks from khem). So I
don't plan to send another one.


> happy to update my tune files with the corresponding ARMPKGARCH and=20
> DEFAULTTUNE changes. But I don't think that tune rework patchset should b=
lock=20
> new tune files, as they don't break anything and adhere to the existing=
=20
> framework. Thanks.

Your new tune files wont work if that patchset is applied, that's why I
commented on them.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCBrDUACgkQN1Ujt2V2gBw5NQCggV/2KKlHrPly8MqrGN3T3bZo
eO8An3KMqYrwrEkxh1zU3X9b2OAu7ors
=XQwe
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
