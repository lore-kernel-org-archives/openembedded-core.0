Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tipjn-00080H-Pb
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 18:04:51 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so607672eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 08:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y9MpjSqnbTuBPHEqsa0ZP3UbPC41r9P3QiF/cSMewiQ=;
	b=P6yOctbgvm/xe6RiCAC+thC2GtpgIbHythdIZ8jhdhFqF4WCbDzGo76g7eM6Kq+CDz
	BnlBuOI3h/1IRKsmHb+uBYfPmz9gm4pfgnaA9ngDInBw2fpQQI966PSZIc701hiPQFIl
	SxcFoGWw/iliGpNtRnxxbT3BBvVncU96gwPAyuiUZJfklpSKyE2c42MjBkoJ1tH7IXXY
	Zzdq+yItBi6B4EVM0NjiSVCqmhuO7GNR6fCejHw3+dSmnEDa9IIXDj60PaJ8i+H8NQfa
	nO2Epf7sM0j1ksPglIgKgprkO5dAjjU/K7deBh4ee6bC00IFFn0Gg36HUcWbD7AKpVWk
	Ihcg==
Received: by 10.14.0.133 with SMTP id 5mr4207006eeb.29.1355331018156;
	Wed, 12 Dec 2012 08:50:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm50583306eep.15.2012.12.12.08.50.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 08:50:17 -0800 (PST)
Date: Wed, 12 Dec 2012 17:50:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Message-ID: <20121212165032.GB1756@jama.jama.net>
References: <CAOHjBZvqGWByQ+v60GDfMOxoiB8XyTsfyFxFb4RvYE2FQQvffA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOHjBZvqGWByQ+v60GDfMOxoiB8XyTsfyFxFb4RvYE2FQQvffA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Download of bitbake doesn't work properly
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
X-List-Received-Date: Wed, 12 Dec 2012 17:04:51 -0000
X-Groupsio-MsgNum: 32567
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline

--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 12, 2012 at 03:17:05PM +0100, Giuseppe Condorelli wrote:
> Hi, just to highlight that I'm unable to download the bitbake tar files.
> It seems that cgit.openembedded.org suffers of some problem in that case.
>=20
> Please can you verify?

I think it's still disabled:

#oe/2012-12-04.log
02:53 < halstead> ka6sox, cgit.openembedded.org was overloaded and nearly u=
nresponsive. I've taken some quick measures and sent you an e-mail describi=
ng them.
02:53 < halstead> Everyone else cgit.openembedded.org's .tar.gz and .tar.bz=
2 files are temporarily disabled.
02:56 < ka6sox> halstead, thanks...I'm not sure why its to unresponsive...I=
 may move it to a different host (opal to a different dom0)
02:59 < halstead> ka6sox, Do you know if the nginx config has been changed =
recently? I don't recognize those rewrites.
03:02 < halstead> JaMa, Is it better now for you?
03:06 < halstead> ka6sox, Okay. Looking at the logs this seems to be caused=
 by a spider trying to get all of the on-demand tarballs.
03:06 < halstead> ka6sox, Once all the crawlers get the new robots.txt file=
 we can probably re-enable full functionality.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDItdgACgkQN1Ujt2V2gBxXUQCdGExOS8whsMcTqltG+F2wyTe+
Gg4AoLm+u7RJSXbtK2Z0nq0ExpO+KddG
=h6HK
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
