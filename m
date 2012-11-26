Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Td3Tc-00067T-9A
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 19:32:19 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6267521eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 10:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QvLvTAmmnjYDtTmpp1aYp5jbuhC4/zsW5zYkTtCNQ48=;
	b=oOuIPRQCCWFuKnVBeNzjGfxhlHG+ltH3uOs/UzC6/U26g3ahHWUcgKQb55vzZToRAd
	uUJaDUkafvglJRaDW2OUyVNhY14yLmXoDoTCkZtyWNBl7+j3le1j+H+jtXUz82jadWiA
	Jr+AOSltluMR5RuaVm9TPZYYQC0stsgEiKeWicP0FNNMmJ9S61D/mAG6dgXKWl/QbTTA
	18I4duzYzGDhxe0HntiIYq8C0UFdmI7Q0SRcaKdDDVnCazIuFwvbBIzkHvQiYF2rJIrO
	4zE6M7O6k+7HxpIV93giNd0Nrkk674leW8kpcg5+e66uHScyE79Arixsbbf3NRbKLxvB
	7bjQ==
Received: by 10.14.173.65 with SMTP id u41mr2466373eel.13.1353953884406;
	Mon, 26 Nov 2012 10:18:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a44sm35548145eeo.7.2012.11.26.10.18.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 10:18:03 -0800 (PST)
Date: Mon, 26 Nov 2012 19:18:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20121126181810.GA18943@jama.jama.net>
References: <1348318001-18232-1-git-send-email-Martin.Jansa@gmail.com>
	<1353933452-13251-1-git-send-email-Martin.Jansa@gmail.com>
	<CADkTA4N2mbhBgh4o3W9mwa3Jg7ohZEB13FsEGoOLQZ04t1fAcQ@mail.gmail.com>
	<20121126135758.GB3401@jama.jama.net>
	<1353942076.13864.742.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1353942076.13864.742.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: use the same versioning schema for modules.tgz and provide link to latest
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
X-List-Received-Date: Mon, 26 Nov 2012 18:32:19 -0000
X-Groupsio-MsgNum: 31764
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2012 at 03:01:15PM +0000, Phil Blundell wrote:
> On Mon, 2012-11-26 at 14:57 +0100, Martin Jansa wrote:
> > I remember seeing some thread about making whole modules tarball
> > creation optional and disabled by default, so I guess there is only a
> > few users of this.
>=20
> That particular patch was apparently rejected, but I think you're right
> that only one or two people said at the time that they were using the
> tarball.  It does seem to be a slightly fringe interest.

http://patches.openembedded.org/patch/37087/

Was it really rejected? I take RP's comment as rejecting setting
KERNEL_DEPLOY_MODULE_TARBALL to 0 as default, but not as rejecting whole
patch..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCzsmIACgkQN1Ujt2V2gBy5kACeNO6h0bpPiyRmeKZChs9BLX2Y
eNgAn1VxgseGMhAoldkdBwqSB1cZKGxm
=RD3w
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
