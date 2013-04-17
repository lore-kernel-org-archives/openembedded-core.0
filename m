Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USObp-0000nQ-Fo
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 11:24:58 +0200
Received: by mail-da0-f43.google.com with SMTP id u36so696493dak.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 02:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=3uZd9V3fGEsIHodEw4Sy1RWLa8Ba9VanVp3hTda9OLo=;
	b=aCz9NExrylm56seWnP++butVb98wFvZAjTUOC68nuj6cc+ld2TPq5O7II0Vo8LrM3T
	6xKG7QBwgcR3liXF04r5jG4Yf8gkSD/pAOox0Gxa9FCfn9A3G9f3c7Zht9GRqFvjp36D
	WrRhnL3DnbWsJ7IxlWQ5YhP51OQZ968Bc8D5EhM5REqJvCH7IgSSlJwI5yUrEPFfmyIh
	tmQQKyz4OTeKPR69o2CaRFy8phv+WBXKYQQC9vFpO4No0tACXTZIUAeOa/QEDFZuZxpU
	zCisOTAszQGXcWonoRUc804Ppo1rTPdeQ1d4un6Sh0w4Pi+DTloBqdWfrYuVfOg00ID6
	Lmag==
X-Received: by 10.66.27.228 with SMTP id w4mr7741645pag.98.1366189645322;
	Wed, 17 Apr 2013 02:07:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b3sm5618549pbw.4.2013.04.17.02.07.22
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 02:07:24 -0700 (PDT)
Date: Wed, 17 Apr 2013 11:07:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20130417090723.GC26007@jama>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Wed, 17 Apr 2013 09:25:12 -0000
X-Groupsio-MsgNum: 38062
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2/5bycvrmDh4d1IB"
Content-Disposition: inline

--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 08:28:31AM +0200, Andreas M=FCller wrote:
> Hi,
>=20
> sorry again me with another issue. I updated all layers from master
> few hours ago and built from scratch. On first boot with systemd
> postinst never finishes. I see only:
>=20
> [**  } A start job is running for Run pending postinsts
>=20
> and ** are moving around.
>=20
> Does anybody else face this one?

Yes, even with distro-less oe-core-only core-image
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/037660.ht=
ml

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFuZksACgkQN1Ujt2V2gByOXwCfW7kOi6vy4XqGY5R/i67d9e+E
2FIAmwctUNif/GNdfIIQgKVUCtNHOg8z
=U3XP
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--
