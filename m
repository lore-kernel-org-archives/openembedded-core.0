Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RddnL-0006VP-2a
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:14:31 +0100
Received: by eeit10 with SMTP id t10so4051656eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 00:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pUfw7dHq5m1J3cBeKesJ9Fvux6AAtL2ysxooZXax0n4=;
	b=oxdCRz7GgFdMBNPF/ZE7Mx905GZXGzcfJxttIutRh9WPv8YeqJm9W0zs2eWHPMTFfn
	bsLJ1RxqK8gMrAzOdqgG3kmPufAhG8odrHy/6mEYUVoMv0Io0HEfV+ltubFAj3QfKpQg
	LG9tssS9ZAU+BSfytF6JFOVVq7b4sX/ESwfmQ=
Received: by 10.14.18.16 with SMTP id k16mr3896805eek.15.1324541241729;
	Thu, 22 Dec 2011 00:07:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm31161061eeb.3.2011.12.22.00.07.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 00:07:20 -0800 (PST)
Date: Thu, 22 Dec 2011 09:07:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111222080659.GH12791@jama.jama.net>
References: <1322665120-29586-1-git-send-email-koen@dominion.thruhere.net>
	<D72EA3E2-0752-4F03-875F-77F5764313B1@dominion.thruhere.net>
	<20111220075952.GB3946@jama.jama.net>
	<20111221074011.GB12791@jama.jama.net>
	<E6A4ABFF-7BBC-4D8F-97E7-42FEAD69E3B5@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <E6A4ABFF-7BBC-4D8F-97E7-42FEAD69E3B5@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] webkit-gtk svn: update to r101488
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
X-List-Received-Date: Thu, 22 Dec 2011 08:14:31 -0000
X-Groupsio-MsgNum: 14651
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MP5ln1Rcf9Bvi+ZW"
Content-Disposition: inline

--MP5ln1Rcf9Bvi+ZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2011 at 09:03:46AM +0100, Koen Kooi wrote:
>=20
> Op 21 dec. 2011, om 08:40 heeft Martin Jansa het volgende geschreven:
>=20
> > On Tue, Dec 20, 2011 at 08:59:52AM +0100, Martin Jansa wrote:
> >> On Thu, Dec 15, 2011 at 04:16:17PM +0100, Koen Kooi wrote:
> >>> ping
> >>=20
> >> I've tried it with older midori-0.4.2 as well as with newer 0.4.3 (whi=
ch
> >> I'll send to meta-oe later) but both does segfault, probably not caused
> >> by this newer webkit-gtk because even with older webkit-gtk 0.4.2 was
> >> segfaulting (maybe gcc-4.6 issue if you're still using gcc-4.5).
> >>=20
> >> I've tried to get usable backtrace.. but webkit-gtk-dbg is huge (>300M=
B)
> >> and opkg died twice already when I was waiting for midori-dbg to insta=
ll
> >> :/.
> >>=20
> >> BTW: it happens on armv4t as well as armv7a-vfp-neon.
> >=20
> > 627.8M  usr/lib/.debug/libwebkitgtk-1.0.so.0.11.2
> > from libwebkitgtk-1.0-dbg (1.7.2+svnr101488-r0) wasn't=20
> > really helpfull as it fails even before that on nokia900:
>=20
> All this happens on both the old and the new version, right? If so, can t=
his patch finally go in?

Yes with both, so for me this can go in.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MP5ln1Rcf9Bvi+ZW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7y5SMACgkQN1Ujt2V2gBy18ACcC9d9EwUbZiKmmAUcU5+urVti
HvAAn0FmIYd0qOuLwk43le9Cuq2cX+xk
=JrYc
-----END PGP SIGNATURE-----

--MP5ln1Rcf9Bvi+ZW--
