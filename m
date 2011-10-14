Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REdPN-0000Ia-IT
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 10:46:25 +0200
Received: by bkat8 with SMTP id t8so1715058bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 01:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=To7rrBt+E3q01NnMW5lCiorJ0675hSDBuR5FEvlGLyI=;
	b=s3sDiiiBhjE2adM+QDnziinLVfXBH2UTRFkjjT2SUntc/IkPALJi39oDQMhzPT+Sva
	I/1LMN9IVfhfIkDRYUa8OeuM2Y+79xNOdos9fLsAlE3ejkY6hY+pSeYIhVIsaUR47ZoY
	0Us7E7egO2M2aQP+qq2/O9INeGl+lcz53Y1xE=
Received: by 10.204.130.68 with SMTP id r4mr5854534bks.62.1318581640900;
	Fri, 14 Oct 2011 01:40:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm7597711bks.1.2011.10.14.01.40.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 01:40:39 -0700 (PDT)
Date: Fri, 14 Oct 2011 10:40:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111014084032.GD3542@jama.jama.net>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
	<3ffacbd5138165278774387c51b4bd3bb625eaff.1317648041.git.Martin.Jansa@gmail.com>
	<1317654131.13337.6.camel@phil-desktop>
	<20111003150904.GR7364@jama.jama.net>
	<1318535180.3158.4.camel@lenovo.internal.reciva.com>
	<CAMKF1spsGP=k24dbbX+p4dQLncBcaP5BX6Qf0S4ZrcttnfqSGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spsGP=k24dbbX+p4dQLncBcaP5BX6Qf0S4ZrcttnfqSGw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv2 26/30] glx-use-tls: add from meta-oe layer
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
X-List-Received-Date: Fri, 14 Oct 2011 08:46:25 -0000
X-Groupsio-MsgNum: 10996
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UfEAyuTBtIjiZzX6"
Content-Disposition: inline

--UfEAyuTBtIjiZzX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 05:09:08PM -0700, Khem Raj wrote:
> On Thu, Oct 13, 2011 at 12:46 PM, Phil Blundell <philb@gnu.org> wrote:
> > On Mon, 2011-10-03 at 17:09 +0200, Martin Jansa wrote:
> >> On Mon, Oct 03, 2011 at 04:02:10PM +0100, Phil Blundell wrote:
> >> > Can you add some commentary explaining why this is necessary -- i.e.
> >> > what exactly is lacking in uClibc to mean it doesn't have "prober TLS
> >> > support"?
> >>
> >> I'm not using uClibc myself and tracking original bbclass in OE-classic
> >> leads to this commit
> >> http://git.openembedded.org/cgit.cgi/openembedded/commit/packages/mesa=
/mesa-tls.inc?id=3Db527d8f723c98c77f2f5c5358062e5348493d767
> >>
> >> So I'm CCing woglinde and he will probably explain it.
> >
> > I see this patch has been applied in the meantime so I guess it's a
> > slightly academic question now, but I still think it would benefit from
> > some further explanation.
>=20
> This patch is no longer needed. Since uclibc now supports TLS/NPTL and
> we do not support
> Linuxthreads in OE (starting with oe-core) if we did configure with LT
> then uclibc does
> not have TLS implementation that goes with LT but thats a moot point in o=
e-core

I'm not using uclibc at all, but if you're 100% sure, then I'll send
patch removing glx-use-tls.inc after the rest of Xorg patchset is
applied and mesa removed from meta-oe..

Regards,

>=20
> >
> > p.
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UfEAyuTBtIjiZzX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6X9YAACgkQN1Ujt2V2gBwrKACghT5Ols1j8TED2GVqMs9tk5Go
k68An3GAL2nm4rYxaDSAfzu8d7fMY88K
=a8Ep
-----END PGP SIGNATURE-----

--UfEAyuTBtIjiZzX6--
