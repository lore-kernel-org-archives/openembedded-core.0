Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAkE9-0002qd-4J
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 17:14:45 +0200
Received: by eya25 with SMTP id 25so3136757eya.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xpJcqMzg/KGUtxwGD+MXbIKzmsW59oUsa3KaloOhXDA=;
	b=DCHBOTbGFrI5DW8ST71ajrvdbF4Ct5CYINuURjbHQGm3NPKyHsT388g34gfg0gUKIT
	u+t91QXy/4HWAyUWwfJatB/jp780cyjCA4t3peodbhDNq+eOmt4/36wt/eaM5yPJJ/g2
	sEcZ+P+rZ4InBiwe2cmci5mT9SCNoeSp9FY3M=
Received: by 10.223.58.198 with SMTP id i6mr40557fah.91.1317654552001;
	Mon, 03 Oct 2011 08:09:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c1sm21584103fab.15.2011.10.03.08.09.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 08:09:10 -0700 (PDT)
Date: Mon, 3 Oct 2011 17:09:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111003150904.GR7364@jama.jama.net>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
	<3ffacbd5138165278774387c51b4bd3bb625eaff.1317648041.git.Martin.Jansa@gmail.com>
	<1317654131.13337.6.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1317654131.13337.6.camel@phil-desktop>
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
X-List-Received-Date: Mon, 03 Oct 2011 15:14:45 -0000
X-Groupsio-MsgNum: 10427
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oN4OvwWIcd1E23D1"
Content-Disposition: inline

--oN4OvwWIcd1E23D1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 03, 2011 at 04:02:10PM +0100, Phil Blundell wrote:
> Can you add some commentary explaining why this is necessary -- i.e.
> what exactly is lacking in uClibc to mean it doesn't have "prober TLS
> support"?

I'm not using uClibc myself and tracking original bbclass in OE-classic
leads to this commit
http://git.openembedded.org/cgit.cgi/openembedded/commit/packages/mesa/mesa=
-tls.inc?id=3Db527d8f723c98c77f2f5c5358062e5348493d767

So I'm CCing woglinde and he will probably explain it.

Regards,

>=20
> p.
>=20
> On Mon, 2011-10-03 at 15:28 +0200, Martin Jansa wrote:
> > * it's in .bbclass instead of .inc because it's used by mesa and
> >   xserver-xf86 recipes
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/glx-use-tls.bbclass |    7 +++++++
> >  1 files changed, 7 insertions(+), 0 deletions(-)
> >  create mode 100644 meta/classes/glx-use-tls.bbclass
> >=20
> > diff --git a/meta/classes/glx-use-tls.bbclass b/meta/classes/glx-use-tl=
s.bbclass
> > new file mode 100644
> > index 0000000..7530872
> > --- /dev/null
> > +++ b/meta/classes/glx-use-tls.bbclass
> > @@ -0,0 +1,7 @@
> > +def get_tls_setting(bb, d):
> > +    # until we have no prober TLS support in uclibc disable it
> > +    if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >=3D 0 :
> > +        return ""
> > +    return "--enable-glx-tls"
> > +
> > +EXTRA_OECONF +=3D "${@get_tls_setting(bb, d)}"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oN4OvwWIcd1E23D1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6J0BAACgkQN1Ujt2V2gBzzDQCggIfOaik4Uy4ryzYHCjivYA7G
eG0AoIJ/qykfg3KdRNEw9D51aGZHLEH9
=AVm/
-----END PGP SIGNATURE-----

--oN4OvwWIcd1E23D1--
