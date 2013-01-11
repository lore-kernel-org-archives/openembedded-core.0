Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtU1j-00026m-F0
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 03:07:25 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so518515dak.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 17:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=dUGUn2cT/A+6IASlhNZs0o1bBPch35IY2RrmB0/18dI=;
	b=NcsxJnJ54sY4C6wWyKJDgPvb0zZm+eUbXJz3ukIJNiuhdDExKAr+y/S+D2LSgY+dK0
	SBOgQORfNuRGPa5yVgbtCxM65JBUK0sB39pAo/1anPrX7tyOK0nOAxiBQVKRbK2KS6Pa
	FBn3X422620R4kiRW5Y2CDvqensRUuaqDRLCXg5c+cgE4qMCRuwS65CVwCJOYz3zXCFp
	zuS9BCVkECWrM+iBecy44xv2W3Ne7N/BtKRLhd1+w2CYqINWyLoZH4d0IWPKcZpnzll4
	o7lGxkKYL6XZBgfG1iZr67LDzLwnxUeATflOyUeqv6Ia5UCNaROnUaeyo5Ba9FxCifnB
	JvPw==
X-Received: by 10.66.73.105 with SMTP id k9mr203176735pav.37.1357869128671;
	Thu, 10 Jan 2013 17:52:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qh6sm1774405pbb.25.2013.01.10.17.52.05
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 17:52:06 -0800 (PST)
Date: Fri, 11 Jan 2013 02:52:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Message-ID: <20130111015212.GK3722@jama.palm1.palmone.com>
References: <1757330.jo1AhcIeyl@yiqingliang-pc>
	<20130110104253.GU3722@jama.palm1.palmone.com>
	<2093032.6T1PG2Tjzt@yiqingliang-pc>
MIME-Version: 1.0
In-Reply-To: <2093032.6T1PG2Tjzt@yiqingliang-pc>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: glib2.0 and dbus dependency
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
X-List-Received-Date: Fri, 11 Jan 2013 02:07:25 -0000
X-List-Received-Date: Fri, 11 Jan 2013 02:07:25 -0000
X-Groupsio-MsgNum: 33687
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k2+Bt23KD9VIuFWa"
Content-Disposition: inline

--k2+Bt23KD9VIuFWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2013 at 09:18:06AM +0000, Yi Qingliang wrote:
> On Thursday, January 10, 2013 11:42:53 AM Martin Jansa wrote:
> > On Thu, Jan 10, 2013 at 06:31:22PM +0000, Yi Qingliang wrote:
> > > when compiling using 4 threads, I got following error.
> > > the glib2.0-native want find dbus header file.
> > > If I compiled dbus/dbus-natigve, and then compile glib2.0 OK.
> > >=20
> > > when grep glib2.0 bb files, I can't find dbus in dependency, why?
> >=20
> > It was causing cyclic dependency at least when dbus tests were enabled,
> > I'm not sure if this was resolved already.
> cyclic dependency???? OMG, do they really need 'cyclic dependency'?
> splitting them cannot solve 'cyclic dependency'? am i right?

Please check first if this is still valid:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-December/02798=
7.html

I think it was resolved somewhere, but I'm not sure or you can just add
it and see if it fails :).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k2+Bt23KD9VIuFWa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDvcEwACgkQN1Ujt2V2gBzbvQCfXE2zDnmrZlvZ1qR5kotgRlOF
31wAnA9f/PRldpUvjBQHtFCZlFiIZseU
=dVvu
-----END PGP SIGNATURE-----

--k2+Bt23KD9VIuFWa--
