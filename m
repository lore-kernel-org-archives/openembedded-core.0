Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwAwd-0002aW-CK
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:48:59 +0200
Received: by wibhm2 with SMTP id hm2so3148229wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 04:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZWoD0ZZQkdSuN0QO6I5rw7CBkh6CQF0+tq6derJCvB8=;
	b=dqH56d2zaz1DkVQ6H8AeA2yzArAhlXHc5CHyH+6gg8p20Jwyo8PvZZc4R+y63Z/Woh
	boRNy+NRx0NcHDpDKvDBAw3QHNoyIpJcYaEDmToSjhnhJXfoWvmOt5Md8RYZAv5gzDGv
	6qaIpe7n8WGpRSXU1/cpv77Zx73QMZ8OSpD+i/d6MywMDv6gyMsgjgVCUxq2SkG2ZWB5
	6Tyc126ukfGrC3KaNqyQsF5fwhrtAtB+4DhFuAfW12OZ0y9VvCtPR7KlERlLgOAQLuQe
	lIX/ucg4/lBeGv4ulkrBV0M0bAcij9Pq0ctaTKnsuUIVl1QyzoGYBgigv2+5Qq/bAfMu
	EyXw==
Received: by 10.216.236.24 with SMTP id v24mr6941482weq.18.1343734642654;
	Tue, 31 Jul 2012 04:37:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex20sm32105676wid.7.2012.07.31.04.37.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 04:37:21 -0700 (PDT)
Date: Tue, 31 Jul 2012 13:37:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120731113717.GT3261@jama.jama.net>
References: <20120730175903.GN3261@jama.jama.net>
	<1343674860-1523-1-git-send-email-Martin.Jansa@gmail.com>
	<1343734010.9756.3.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343734010.9756.3.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] udev-extraconf: change LICENSE to MIT
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
X-List-Received-Date: Tue, 31 Jul 2012 11:48:59 -0000
X-Groupsio-MsgNum: 26564
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zpd1bWBxfrI+71+6"
Content-Disposition: inline

--zpd1bWBxfrI+71+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 12:26:50PM +0100, Richard Purdie wrote:
> On Mon, 2012-07-30 at 21:01 +0200, Martin Jansa wrote:
> > * original recipe added by RP in fc128ab1e4fec27d44cebfa690a9bc233eda0c=
af was saying GPL
> > * later it was changed to GPLv2
> > * COPYING.GPL was added to reflect that
> > * meta-oe has similar recipe with MIT license and even more scripts, so=
 lets change LICENSE here too
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/udev/udev-extraconf/COPYING.GPL |  339 -------------=
--------
> >  meta/recipes-core/udev/udev-extraconf_1.0.bb      |    8 +-
> >  2 files changed, 4 insertions(+), 343 deletions(-)
> >  delete mode 100644 meta/recipes-core/udev/udev-extraconf/COPYING.GPL
>=20
> Er, I think we need to be a little more careful than this. Just because
> you want something to be so, doesn't make it happen just like that...
>=20
> Looking at the commit, I've just copied the license from the original
> source which was a GPLv2 recipe (udev). Where did mount.blacklist come
> from originally? Is there evidence its MIT licensed? How did meta-oe
> conclude this was MIT licensed?

sorry I'm not lawyer to decide if those 3 lines of code should be GPLv2
or MIT and I don't have any evidence either way.. (From common sense
more lines were imported from meta-oe where they were marked as MIT).

I think I was carefull, first warning in commit message (end kept
original LICENSE) then extra patch on Koen's request to be clear=20
about that change.

Do we want 2 licenses in udev-extraconf or should we ask all devs which
ever touched udev-extra-rules for permission to change it to GPLv2?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zpd1bWBxfrI+71+6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAXw20ACgkQN1Ujt2V2gByXQACgob246gpM/Ln1m0tPcAZRjzrp
UfkAnR11w/gus5zujhhleR1jmVUSZsRg
=eaI4
-----END PGP SIGNATURE-----

--zpd1bWBxfrI+71+6--
