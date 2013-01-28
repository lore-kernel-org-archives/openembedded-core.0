Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzuwY-0004ZI-Q7
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 21:04:41 +0100
Received: by mail-pb0-f53.google.com with SMTP id un1so1661670pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 11:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=GXtcVhTcW2GDCp2FTehLWWDN8sFF1qymR+lz91zsIBE=;
	b=0R7K7GKnzAdtrDb+hvHcRGhxXar6OZvVkTkhkEUc7vMFeDHuwNiMBSoibgeazrYQSo
	tMEiNDG5XtPne2x7vWhWI9/bGnyo2J8HTGuEfGbUZQbWHpw4MJ3FUBw150XM0NlhKK6r
	ju+NSuX2SNurSbhOii7wgIDktaAWJRziacHz3gIrA88bE6FpSDBnVDKY+T3E530qimhQ
	lOs5EbXNYqd1tra4rFbhzqVTy0ASZd3m+A8Y44blaXi/b0pJq9IEr/8rsz9WJWyYF3eV
	v+znnkOwTr6V0vrugKKt9BtfxwZohvWcW3MR6tjtW22qaAPS9ldgsGr5ymOGC8SBHiSq
	mqRw==
X-Received: by 10.66.84.195 with SMTP id b3mr38710251paz.30.1359402539230;
	Mon, 28 Jan 2013 11:48:59 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id nz8sm4356330pbb.71.2013.01.28.11.48.56
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 11:48:57 -0800 (PST)
Date: Mon, 28 Jan 2013 20:48:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130128194857.GG16904@jama.palm1.palmone.com>
References: <CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
	<20130125193456.GE16904@jama.palm1.palmone.com>
	<16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
	<20130125202657.GF16904@jama.palm1.palmone.com>
	<CAJTo0LY77_koWo9=y3cYcJo+43-tE7_txf6uW0_pqr7hSi-QMA@mail.gmail.com>
	<20130128182717.GF16904@jama.palm1.palmone.com>
	<CAJTo0LaLw8Z+QizuObvx_GL-dqUe0kSOr2JhQsMmVnj62zG0rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaLw8Z+QizuObvx_GL-dqUe0kSOr2JhQsMmVnj62zG0rw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Mon, 28 Jan 2013 20:04:41 -0000
X-Groupsio-MsgNum: 34589
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wQkw7DhpL9hyPo7K"
Content-Disposition: inline

--wQkw7DhpL9hyPo7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 07:27:22PM +0000, Burton, Ross wrote:
> On 28 January 2013 18:27, Martin Jansa <martin.jansa@gmail.com> wrote:
> > So I guess upgrade path from meta-systemd won't be ever provided (e.g.
> > with RPROVIDES/RCONFLICTS/RREPLACES combo).
>=20
> I'd prefer not too, but if we have to we can.
>=20
> > I wouldn't mind PN-sysvinit, PN-upstart, PN-openrc
>=20
> But what's the point when its a distro variable? With systemd daemons
> are actively making code changes instead of it merely being a
> different init file, so an image feature just won't work.

to control which packages should have systemd support just by IMAGE_INSTALL.

With latest systemd.bbclass you can still install them but not enable
them by default, but even after SYSTEMD_AUTO_RRECOMMENDS was introduced
I prefered to turn that off and control what I want in images (or
install from feed).

Imagine situation when someone wants ntpd package just for ocassional
manual sync, but someone else wants to pull ntpd to image together with
systemd .service file to make sure his device is always using right
time.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wQkw7DhpL9hyPo7K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEG1ikACgkQN1Ujt2V2gBz8aQCfY1RNCljdduW6EU5fl2mrJyNR
HIEAn2YHwDyGop8JP52thdNUFBMQmzM5
=pTBK
-----END PGP SIGNATURE-----

--wQkw7DhpL9hyPo7K--
