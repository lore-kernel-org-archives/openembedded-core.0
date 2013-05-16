Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UcuK9-00082R-HG; Thu, 16 May 2013 11:18:19 +0200
Received: by mail-da0-f41.google.com with SMTP id y19so1531824dan.0
	for <multiple recipients>; Thu, 16 May 2013 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=04/ONADKS7Mi4ewX9muORtckIEFsVAjc/IM925baBXo=;
	b=xiBKwhAVZPIO/p/RHPBy5qVawasluwJfZSTaywUMdRteXeudrnMQCbHTN5NK0uYpi6
	gqzN3jvAo3YpMp21xPrpw9podU7A7wWmy6KCZqJmXzlpJqJeOQTqLpgCnPddJZL+VdEl
	LwJ2J9GLueDT8vjawQYJUD0oF6uOuiFc2GVlIVzaS8RVmZdc3GCcGR19F3FYvErjXW3i
	szzWa6B/Zaerki87aG5aAxLxTIzQp9bMGI4Pt/e7GKUQzEu9emmn4WOoX4ASTG18pEAU
	a/4xL/KpdpsAB//XGCFi3PqTbinOGKFD/I8Y6oBWmxxktcwAVbhYxq4dIZ/f11qjXMZt
	Wbdw==
X-Received: by 10.68.129.10 with SMTP id ns10mr42512914pbb.13.1368694794642;
	Thu, 16 May 2013 01:59:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	zy5sm6011894pbb.43.2013.05.16.01.59.51 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 16 May 2013 01:59:53 -0700 (PDT)
Date: Thu, 16 May 2013 10:59:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130516085954.GC24809@jama.dyndns-home.com>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1499979.6pTC18VfFV@helios>
	<879938A8-B7BD-4FA6-A38B-F2DDF9D5A48B@dominion.thruhere.net>
	<2253707.h5Yg7SAvOu@helios>
MIME-Version: 1.0
In-Reply-To: <2253707.h5Yg7SAvOu@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Thu, 16 May 2013 09:18:20 -0000
X-Groupsio-MsgNum: 39322
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline

--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2013 at 09:29:48AM +0100, Paul Eggleton wrote:
> On Thursday 16 May 2013 08:31:33 Koen Kooi wrote:
> > The flip side is that adding BSP layers becomes a lot safer. I don't mi=
nd
> > adding layers. Adding layers is easy.
>=20
> For distros like Angstrom it is, yes, as I said above.
>=20
> > Removing layers is pretty much impossible, though.
>=20
> With PRINC gone would there be any other issue that would make removing l=
ayers=20
> a problem?

Does PR service really fix removing layers? I don't think so, if you add
layer and checksum of foo is changed AUTOPR is incremented, but then you
remove the layer and the checksum is unfortunately the same as what you
had before AUTOPR will go backwards.

PRINCs were doing this at least consistently and in reproducible way,
removing layer with PR service will cause only some AUTOPRs going
backwards (if there were other changes in between).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGUoAoACgkQN1Ujt2V2gByUtwCgi0/3g/LiksRGfglgpFGYtQWn
0zkAoLDG3jJAGIa+K3flctfx/SE2+VrA
=+JOz
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
