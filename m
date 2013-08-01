Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 685A26B1F0;
	Thu,  1 Aug 2013 10:35:47 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so913793eek.39
	for <multiple recipients>; Thu, 01 Aug 2013 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TjL3IsiVq1trsmSYuuC/NSjA0RVH8jmEdF6LvTceJCo=;
	b=wOmDAOAl29rf3uqf8f5f05v2ZMw8vW/29d3q0Z4JGscxS9ErujZ8a5tD3g/bPiuobp
	gBKzFYfznzsVWTnoCWJYWwQeldnJpqxgOHEXakJ4XLB1JHBTR6eB6Pmkzv93dRp/OcmZ
	Fa1FXMg2uybHc2gND4HkoD3ASy3QzRjStDk8+qo3CtVjm5Vrcwmja7SJKWIjaTXpGVPD
	+DiMXday46UUYSHQ1jvWqq84903idrY9Agav6vkKOyfw+NC87AADTeE7FnULtatbPVGV
	V19+BwssxaJBaWjTbsCio8rKvme2AdysRRkHhTbkSDcyNd/Y1E9GMi5B67GxJ4r43htv
	yGtA==
X-Received: by 10.15.110.197 with SMTP id ch45mr769627eeb.149.1375353347714;
	Thu, 01 Aug 2013 03:35:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id x3sm2772849eeu.1.2013.08.01.03.35.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 03:35:47 -0700 (PDT)
Date: Thu, 1 Aug 2013 12:36:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130801103622.GM3280@jama>
References: <51ECCF5C.2020505@dresearch-fe.de> <6366141.Q5aULPr4OG@helios>
	<51F8E0C2.3070102@dresearch-fe.de> <8337615.XrjW46moIm@helios>
	<51F9FC24.3070907@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <51F9FC24.3070907@dresearch-fe.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] SRC_URI and latest HEAD revision with git (in oe-classic)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Aug 2013 10:35:48 -0000
X-Groupsio-MsgNum: 42797
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zROEGoKAXsG5UqGB"
Content-Disposition: inline

--zROEGoKAXsG5UqGB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2013 at 08:11:48AM +0200, Steffen Sledz wrote:
> On 31.07.2013 14:50, Paul Eggleton wrote:
> > On Wednesday 31 July 2013 12:02:42 Steffen Sledz wrote:
> >> On 22.07.2013 11:51, Paul Eggleton wrote:
> >>> On Monday 22 July 2013 11:46:23 Steffen Sledz wrote:
> >>>> On 22.07.2013 11:01, Nicolas Dechesne wrote:
> >>>>> On Mon, Jul 22, 2013 at 8:21 AM, Steffen Sledz <sledz@dresearch-fe.=
de
> >>>>>
> >>>>> <mailto:sledz@dresearch-fe.de>> wrote:
> >>>>>> After being OE abstinent for some months i'd like to ask what is t=
he
> >>>>>> current suggested method for recipes building from the HEAD revisi=
on of
> >>>>>> a git repository (we need this for continuous integration).
> >>>>>>
> >>>>>> I read some RFC's in the ml about PKGV/PKGR stuff, but i miss a fi=
nal
> >>>>>> decision, documentation and a good example.>
> >>>>>
> >>>>> you can use ${AUTOREV} for this purpose. You can look at poky-bleed=
ing
> >>>>> distro config for such an example.
> >>>>>
> >>>>> e.g.
> >>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf=
/dist
> >>>>> r
> >>>>> o/include/poky-floating-revisions.inc
> >>>>
> >>>> Hmmmm? This doesn't seem the work.
> >>>>
> >>>> Here's what i tried in my recipe:
> >>>>
> >>>> ------------> snip <------------
> >>>> PR =3D "r3"
> >>>>
> >>>> SRCREV=3D"${AUTOREV}"
> >>>> PV =3D "gitr${SRCPV}"
> >>>> ------------> snip <------------
> >>>>
> >>>> But i get package versions like
> >>>>
> >>>>   gitr0+53b64e717404d282d0c58b7fa4a4e74ab2ca81ba-r3
> >>>>
> >>>> where SRCPB is always 0. :(
> >>>>
> >>>> A bit more description and/or a complete example would be very helpf=
ul.
> >>>
> >>> If you want these to increment now AIUI you need to be using the PR
> >>> server:
> >>>
> >>> https://wiki.yoctoproject.org/wiki/PR_Service
> >>
> >> And here comes my next really big problem. :(
> >>
> >> We're sitting on an big, old but active project based on oe-classic and
> >> bitbake 1.12.0. Irksomely we're forced to switch from SVN to GIT for t=
his
> >> project. So we need the AUTOREV/PRSERV stuff for this old environment =
too.
> >>
> >> Has anyone tried to backport the feature to an older bitbake/oe-classic
> >> environment? Or can someone give some hints what's to do?
> >=20
> > I'm not sure, but my gut feeling is you'd be better off trying to bring=
 the=20
> > project up to be based on OE-Core rather than trying to bring such=20
> > functionality back to OE-Classic, particularly since for full functiona=
lity it=20
> > requires signature-based tasks that are only supported with current ver=
sions=20
> > of bitbake and require support from the metadata. You'd be trading some=
=20
> > hopefully short-term pain for long-term gain if the project is going to=
=20
> > continue for a reasonable amount of time.
>=20
> I was afraid to get this answer. ;-)
>=20
> Unfortunately we do not have the manpower to bring up this old project to=
 oe-core. Our team is working hard on a follow-up project based on oe-core.
>=20
> I read something about a solution using
>=20
>   BB_GIT_CLONE_FOR_SRCREV =3D "1"
>   BB_LOCALCOUNT_OVERRIDE =3D ""
>=20
> which should be supported by the old oe-classic/bitbake-1.12.0. Could thi=
s be a solution for our problem? What drawbacks does it have?

BB_GIT_CLONE_FOR_SRCREV will need to clone every git repository included
in metadata you're using (even if the recipe isn't built, because it
needs to define AUTOREV for parsing and that needs local clone).

empty BB_LOCALCOUNT_OVERRIDE should work correctly, but you need to
synchronize bb_persist_data.sqlite3 between multiple builders (if you
have multiple builders populating the same binary feed).

> Steffen
>=20
> --=20
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zROEGoKAXsG5UqGB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH6OiYACgkQN1Ujt2V2gByqUgCcC5L7S/FTFdWsK2G3Zr3UqXKu
4FoAoKwwDN1ErFA688JAAFfLJLhfGgGB
=Hzvc
-----END PGP SIGNATURE-----

--zROEGoKAXsG5UqGB--
