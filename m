Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB38b-0008Pi-Qt
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 12:58:33 +0100
Received: by wera1 with SMTP id a1so2590932wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 04:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dwzvu/ZepyEab45E7M/hTr36tSv6NfjxGganoiXP9Tw=;
	b=qrEwOcnMvCMnG83iT15IRTKBY33+l3ImL1sv7OFjap1mXx4bz6v0iGr7GzAA4apcAb
	8fKmTzLhqaffhVPT9yTgDzT3SKHCrkrSRea3PBT0pCronOqRlS7B1MfCCHcMHbeWBl/N
	lvwlAhUirFbeQ3HE17aKKHMUQ0jEe6E48bPqpsr5ADj1FTJkbPT2KOJB3QT6S5qjbj/K
	ggZyCJuB+MEFRvQltp1obugkMWaDwXADyw3+tbf6u6tViqgMqfV6HlKFirm2QfiXIzLX
	6pZADFyr/FNffmLfKF3xXnmN8UdQ3NqrxXkJ2EszrI9RO7+AQadCvkG+8FVSlZjcahOn
	IKMw==
Received: by 10.180.14.230 with SMTP id s6mr5924745wic.2.1332503377720;
	Fri, 23 Mar 2012 04:49:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm22114520wiw.1.2012.03.23.04.49.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 04:49:37 -0700 (PDT)
Date: Fri, 23 Mar 2012 12:49:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120323114938.GC3879@jama.jama.net>
References: <1332485029-9148-1-git-send-email-Martin.Jansa@gmail.com>
	<1332494193.9740.382.camel@ted>
	<20120323093623.GB3879@jama.jama.net>
	<1332502793.9740.385.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332502793.9740.385.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] kernel.bbclass: populate /etc/modules-load.d/ with module_autoload entries too
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
X-List-Received-Date: Fri, 23 Mar 2012 11:58:33 -0000
X-Groupsio-MsgNum: 19520
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline

--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 11:39:53AM +0000, Richard Purdie wrote:
> On Fri, 2012-03-23 at 10:36 +0100, Martin Jansa wrote:
> > On Fri, Mar 23, 2012 at 09:16:33AM +0000, Richard Purdie wrote:
> > > On Fri, 2012-03-23 at 07:43 +0100, Martin Jansa wrote:
> > > > * /etc/modules-load.d/foo.conf is used by systemd like /etc/modutil=
s/foo was with sysvinit
> > > >=20
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  meta/classes/kernel.bbclass |   10 ++++++++--
> > > >  1 files changed, 8 insertions(+), 2 deletions(-)
> > >=20
> > > Since these look identical couldn't we symlink them? I'm not a big fan
> > > of writing duplicate data to a package :/.
> >=20
> > OK I'll change it in v2
>=20
> Note that I'm wondering if we can just symlink the directory entirely
> rather than the files themselves. There may be a reason that is a bad
> idea but I don't know...

There are different filenames (notice .conf in the end) so I have patch
doing symlinks for files not directories.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9sY1IACgkQN1Ujt2V2gBxgtwCgodDBjV53id1W8sZFb93RMBxm
aZwAoIWb9ERPSyOXYMidZ9q7NS6pIiPl
=s2zR
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
