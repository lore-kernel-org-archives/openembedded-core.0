Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E8F8B6093F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 13:50:13 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ciLgt-0005QJ-IA from Joe_MacDonald@mentor.com ;
	Mon, 27 Feb 2017 05:50:15 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Feb 2017 05:50:15 -0800
Received: by burninator (Postfix, from userid 1000)	id 3CAE358047E; Mon, 27
	Feb 2017 08:50:14 -0500 (EST)
Date: Mon, 27 Feb 2017 08:50:14 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170227135013.GA30104@mentor.com>
References: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
	<CAMKF1sr0OxcRYC9OZsJBieR-MVFnw5XbfuKr+go8xnhgYDHstA@mail.gmail.com>
	<CA+chaQdJprDqs_aiMuWy6pRDB0WDM=fjnM6RqtLGv28EUCLOxg@mail.gmail.com>
	<d0fc6e64-0602-0389-5c2e-f89161b3885a@balister.org>
	<CA+chaQd6FsOMascqMb16stGRVeJK-ickg8hJYq3gVDiTkE_VqQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQd6FsOMascqMb16stGRVeJK-ickg8hJYq3gVDiTkE_VqQ@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Editor: Vim-704 http://www.vim.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] deprecated.bbclass: Add a PNDEPRECATED variable for recipes
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
X-List-Received-Date: Mon, 27 Feb 2017 13:50:14 -0000
X-Groupsio-MsgNum: 94002
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [OE-core] [PATCH] deprecated.bbclass: Add a PNDEPRECATED variable for =
recipes] On 17.02.24 (Fri 21:51) Martin Jansa wrote:

> OK, should I update all currently PNBLACKLISTed recipes to add " - the
> recipe will be removed on 2017-09-01 unless the issue is fixed" in the
> PNBLACKLIST value, so that we can delete all blacklisted recipes
> before 2.4 release?

I haven't seen any additional discussion on this yet but my personal
opinion on this is it seems reasonable to draw a line in the sand and
one that's quite far out.  I also expect that there'll be a flurry of
activity as the deadline draws close, so there's room for flexibility in
the drop-dead date, but that'd be a discretionary thing.  If we wanted
to be slightly less contentious, the wording could be 'may' rather than
'will' and then the message is "if it isn't fixed by this date, it's
fair game to be removed whenever someone gets around to it".

-J.

>=20
> On Fri, Feb 24, 2017 at 9:39 PM, Philip Balister <philip@balister.org> wr=
ote:
>=20
>     On 02/24/2017 01:16 AM, Martin Jansa wrote:
>     >> If nobody speaks up within some
>     > amount of time the maintainer considers reasonable (I'm thinking a =
Yocto
>     > release
>     > cycle) then it's fair game to remove the recipe in question.
>     >
>     > Maybe this is different case with at least some PNBLACKLIST entries=
 we
>     > currently have, but
>     > I don't remove PNBLACKLISTed recipes, because as we discussed it's =
always
>     > easier to unblacklist
>     > recipe from e.g. DISTRO config if the issue doesn't affect you for
>     whatever
>     > reason and causes
>     > less churn in the metadata when it gets unblacklisted.
>     >
>     > And many PNBLACKLISTed recipes are also abandonware.
>     >
>=20
>     I think we need to use a different "flag" for recipes that need
>     updating, and have maintained upstreams from recipes that have upstre=
ams
>     that are abandoned.
>=20
>     So blacklist broken recipes with good upstreams and deprecate recipes
>     with dead upstreams.
>   =20
>     Philip
>   =20
>=20
>=20
>     > So my question is, if we will remove PNDEPRECATed recipes after one
>     cycle,
>     > should we start
>     > removing PNBLACKLISTed recipes as well (maybe after 2 cycles?). In =
both
>     > cases it might backfire
>     > when someone will fail to find recipe for his favorite abandonware =
and
>     will
>     > try to add completely
>     > new recipe for it, or we see someone restoring these recipes (e.g. =
in own
>     > layers instead of fixing
>     > the PNBLACKLIST/PNDEPRECATED reasons in original layer).
>     >
>     > On Fri, Feb 24, 2017 at 5:55 AM, Khem Raj <raj.khem@gmail.com> wrot=
e:
>     >
>     >>
>     >> On Thu, Feb 23, 2017 at 8:00 PM Joe MacDonald <joe_macdonald@mento=
r.com>
>     >> wrote:
>     >>
>     >>> Based on the blacklist behaviour, recipes can be tagged as deprec=
ated.
>     >>> Such recipes will produce a warning message when included in a bu=
ild
>     but
>     >>> unlike blacklisted recipes, the build will continue.
>     >>
>     >>
>     >> Perhaps this should also be documented in manuals
>     >>
>     >>>
>     >>>
>     >>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>     >>> ---
>     >>>
>     >>> I threw this together a long time ago and never got around to sen=
ding
>     it
>     >>> out for
>     >>> consideration, but after the excitement last week and this, I got
>     >>> thinking about
>     >>> it again and thought it might be useful.  My specific use-case fo=
r this
>     is
>     >>> recipes I see in meta-networking that I know are largely abandonw=
are
>     but
>     >>> that I
>     >>> don't want to completely throw out without giving some kind of he=
ads
>     up.
>     >>> Obviously this is purely informational, there's no mechanism set =
up for
>     >>> purging
>     >>> deprecated recipes, that's intended to be a maintainer activity, =
but
>     the
>     >>> idea
>     >>> would be that the maintainer would flag a recipe as deprecated
>     (probably
>     >>> when
>     >>> it's become more trouble than it seems to be worth) and thereafter
>     users
>     >>> would
>     >>> have fair warning that this thing is on notice.  If nobody speaks=
 up
>     >>> within some
>     >>> amount of time the maintainer considers reasonable (I'm thinking a
>     Yocto
>     >>> release
>     >>> cycle) then it's fair game to remove the recipe in question.
>     >>>
>     >>>  meta/classes/deprecated.bbclass    | 16 ++++++++++++++++
>     >>>  meta/conf/distro/defaultsetup.conf |  3 ++-
>     >>>  2 files changed, 18 insertions(+), 1 deletion(-)
>     >>>  create mode 100644 meta/classes/deprecated.bbclass
>     >>>
>     >>> diff --git a/meta/classes/deprecated.bbclass b/meta/classes/depre=
cated.
>     >>> bbclass
>     >>> new file mode 100644
>     >>> index 0000000..3dcdadb
>     >>> --- /dev/null
>     >>> +++ b/meta/classes/deprecated.bbclass
>     >>> @@ -0,0 +1,16 @@
>     >>> +# To use the deprecated recipe check, a distribution should
>     >>> +# include this class in the INHERIT_DISTRO
>     >>> +#
>     >>> +# Features:
>     >>> +#
>     >>> +# * To add a package to the deprecated list, set:
>     >>> +#   PNDEPRECATED[pn] =3D "message"
>     >>> +#
>     >>> +
>     >>> +addtask check_deprecated before do_fetch
>     >>> +python do_check_deprecated () {
>     >>> +    deprecated =3D d.getVarFlag('PNDEPRECATED', d.getVar('PN', T=
rue),
>     >>> False)
>     >>> +
>     >>> +    if deprecated:
>     >>> +        bb.warn("Recipe is deprecated: ", (deprecated))
>     >>> +}
>     >>> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distr=
o/
>     >>> defaultsetup.conf
>     >>> index ca2f917..16ece3a 100644
>     >>> --- a/meta/conf/distro/defaultsetup.conf
>     >>> +++ b/meta/conf/distro/defaultsetup.conf
>     >>> @@ -20,5 +20,6 @@ CACHE =3D "${TMPDIR}/cache/${TCMODE}-${TCLIBC}$=
{@['',
>     >>> '/' + str(d.getVar('MACHINE'
>     >>>  USER_CLASSES ?=3D ""
>     >>>  PACKAGE_CLASSES ?=3D "package_ipk"
>     >>>  INHERIT_BLACKLIST =3D "blacklist"
>     >>> +INHERIT_DEPRECATED =3D "deprecated"
>     >>>  INHERIT_DISTRO ?=3D "debian devshell sstate license remove-libto=
ol"
>     >>> -INHERIT +=3D "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTR=
O}
>     >>> ${INHERIT_BLACKLIST}"
>     >>> +INHERIT +=3D "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTR=
O}
>     >>> ${INHERIT_BLACKLIST} ${INHERIT_DEPRECATED}"
>     >>> --
>     >>> 1.9.1
>     >>>
>     >>> --
>     >>> _______________________________________________
>     >>> Openembedded-core mailing list
>     >>> Openembedded-core@lists.openembedded.org
>     >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     >>>
>     >>
>     >> --
>     >> _______________________________________________
>     >> Openembedded-core mailing list
>     >> Openembedded-core@lists.openembedded.org
>     >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     >>
>     >>
>     >
>     >
>     >
>=20
>=20

--=20
-Joe MacDonald.
:wq

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYtC6VAAoJEEn8ffcsOfaWPUEIAJ0gQdnEdPYkFDU6sPNPt/9Q
BEoe5Yl6YxD5i3QVvi+F6UqVH82zqn8svVR5O0N6qEZdb1eSUYssfexuYb6tuE1b
2hagM0+ze+SUfh3kx29NyTMMRacfFGPPvWZh2eaOipX0NwTQbsHKCRCmSTZhCHk+
Qulkrw6XnMKotOSPI8FCihF3QthB+bQhgnPMjAHe3f4DXF53ye35WY+vjPAnX+Dy
xthKzuMpbxRuD5G/505SD+XEfHzOshbAPVqfCjWO6RSQrB4647tuMTh/TDjcEXNG
J+HODwv+GsZFYiEpSP0wnRqsXEQHwbA91gZJadyVRuKLSqbgDDU2Uzn+tVucS5A=
=+RCc
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
