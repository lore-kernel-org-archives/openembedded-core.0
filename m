Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SkLs2-0005OB-Qi
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 23:03:22 +0200
Received: by wgbdr1 with SMTP id dr1so2392702wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 13:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2wfFSfpDAu3XPchy057vLWWmNlL5oQic00CbFJciO68=;
	b=P2ONIBHKk5XBK+DL4RbGuyWP7r65ZhZjUV5NUiSGGZwcOjgHp6hL4BwoiVLth921qJ
	hkbyXgdqOtoUKQouKycoLcRN6i2vbojU+61mQWte+cEJAUmJp22D9PI/VFOwF/9fzQZe
	PYsGMlU7C+vG5JWbhAshJU7OqFbMqotIwtbSMSVdzBmvGYpPvsuc+c4fziNnzyfpit5w
	R/3pMZX8K6OLRTd6jd5Gt/svdAQih0+rh3RshBx6/ysFIUgJfbMnBcRp5LJ8YHVLodb/
	B5bO61xe1is9wzz/o4gFzX229tjZ2TgXCQFk2SSNov7uIx5xK8OxmfL8/KqyfwYM5hhU
	a+fA==
Received: by 10.216.213.37 with SMTP id z37mr2038480weo.132.1340916747714;
	Thu, 28 Jun 2012 13:52:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ch9sm1504777wib.8.2012.06.28.13.52.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 13:52:26 -0700 (PDT)
Date: Thu, 28 Jun 2012 22:52:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120628205220.GB3961@jama.jama.net>
References: <20120530110534.15D7110219@opal>
	<20120628191246.GA5532@localhost.jama.net>
	<4FECB3E0.1080503@windriver.com>
	<20120628200607.GA3961@jama.jama.net>
	<4FECBF47.2000209@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4FECBF47.2000209@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Mark Hatle : util-linux: use new update-alternatives
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
X-List-Received-Date: Thu, 28 Jun 2012 21:03:23 -0000
X-Groupsio-MsgNum: 24265
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline

--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 03:32:07PM -0500, Mark Hatle wrote:
> On 6/28/12 3:06 PM, Martin Jansa wrote:
> > On Thu, Jun 28, 2012 at 02:43:28PM -0500, Mark Hatle wrote:
> >> On 6/28/12 2:12 PM, Martin Jansa wrote:
> >>> On Wed, May 30, 2012 at 11:05:32AM +0000, git@git.openembedded.org wr=
ote:
> >>>> Module: openembedded-core.git
> >>>> Branch: master
> >>>> Commit: 55c01de28a28a4cfe16d36663c190a874ef2e85d
> >>>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dc=
ommit;h=3D55c01de28a28a4cfe16d36663c190a874ef2e85d
> >>>>
> >>>> Author: Mark Hatle <mark.hatle@windriver.com>
> >>>> Date:   Mon May 21 12:42:34 2012 -0500
> >>>>
> >>>> util-linux: use new update-alternatives
> >>>>
> >>>> In addition to switching to the new update-alternatives, it was disc=
overed
> >>>> that the sln, shutdown, halt, reboot and related commands were never=
 generated.
> >>>> Remove these from the list.  (These appear to have been removed from=
 util-linux
> >>>> some time ago.)
> >>>>
> >>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>>
> >>> This seems to break u-a for reset while upgrading from older image:
> >>>
> >>> update-alternatives: Error: cannot register alternative reset to
> >>> /bin/reset since it is already registered to /usr/bin/reset
> >>
> >> Can you figure out what registered it as /usr/bin/reset?  As far as I'=
m aware
> >> the reset command should be in /bin...  (Sounds like this may simply b=
e an
> >> ordering thing.)
> >
> > seems like busybox did..
> >
> > SHR root@Nokia-N900 / $ cat /var/lib/opkg/alternatives/reset
> > /usr/bin/reset
> > ../../bin/busybox 50
>=20
> Is that the current busybox?  If so, then util-linux is incorrect.  It sh=
ould be=20
> matching the behavior of busybox -- unless of course busybox has a bug.  =
;)

yes
SHRZ root@zjama ~ $ grep reset /etc/busybox.links
/usr/bin/reset

I do not track every BB release.. so it's possible that they changed
lately, but I haven't seen any busybox which should cause this, that's
why I've replied on this commit..

Cheers,

>=20
>=20
> But when I set this up originally, the intent was to follow what BB was d=
oing.
>=20
> --Mark
>=20
> > Cheers,
> >
> >>
> >> --Mark
> >>
> >>> anyone seen it too?
> >>>
> >>> Cheers,
> >>>
> >>>>
> >>>> ---
> >>>>
> >>>>    meta/recipes-core/util-linux/util-linux.inc       |  212 +++++---=
-------------
> >>>>    meta/recipes-core/util-linux/util-linux_2.21.1.bb |    2 +-
> >>>>    2 files changed, 45 insertions(+), 169 deletions(-)
> >>>>
> >>>> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3D=
commitdiff;h=3D55c01de28a28a4cfe16d36663c190a874ef2e85d
> >>>>
> >>>> _______________________________________________
> >>>> Openembedded-commits mailing list
> >>>> Openembedded-commits@lists.openembedded.org
> >>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-com=
mits
> >>>
> >>>
> >>>
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>>
> >>
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/sxAQACgkQN1Ujt2V2gBzZTACghT3Z6b55TSD8ReLr0Gn9GLv6
DFEAoK869ylER7kInT6crTDfcMivQq4z
=pmlj
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
