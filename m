Return-Path: <joshc@ni.com>
X-Greylist: delayed 969 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Aug 2015 18:11:59 UTC
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 4E04176DFB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 18:11:59 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t7QIBvvm021174; Wed, 26 Aug 2015 13:11:57 -0500
Received: from jcartwri.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015082613115729-659534 ;
	Wed, 26 Aug 2015 13:11:57 -0500 
Received: by jcartwri.amer.corp.natinst.com (Postfix, from userid 1000)
	id 54DFA3003E0; Wed, 26 Aug 2015 13:11:57 -0500 (CDT)
Date: Wed, 26 Aug 2015 13:11:57 -0500
From: Josh Cartwright <joshc@ni.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20150826181157.GM8016@jcartwri.amer.corp.natinst.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<1438634128-4347-2-git-send-email-juro.bystricky@intel.com>
	<CADkTA4N6M5nnq9Y_eSKKdotUCNkPfpJBLuu5dZnwWSdszVgxuQ@mail.gmail.com>
	<20150826175547.GL8016@jcartwri.amer.corp.natinst.com>
	<CADkTA4P7-4VDttHEPPsmyhbzZNQj-r1AtkgZoe6b8X9u844LSg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4P7-4VDttHEPPsmyhbzZNQj-r1AtkgZoe6b8X9u844LSg@mail.gmail.com>
User-Agent: Mutt/1.5.23+102 (2ca89bed6448) (2014-03-12)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/26/2015 01:11:57 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/26/2015 01:11:57 PM,
	Serialize complete at 08/26/2015 01:11:57 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-08-26_06:, , signatures=0
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel-headers: linux kernel headers
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
X-List-Received-Date: Wed, 26 Aug 2015 18:12:01 -0000
X-Groupsio-MsgNum: 70103
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EEx6GiKZGZ1wKUra"
Content-Disposition: inline

--EEx6GiKZGZ1wKUra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 01:57:13PM -0400, Bruce Ashfield wrote:
> On Wed, Aug 26, 2015 at 1:55 PM, Josh Cartwright <joshc@ni.com> wrote:
> > On Tue, Aug 04, 2015 at 11:20:11PM -0300, Bruce Ashfield wrote:
> >> On Mon, Aug 3, 2015 at 5:35 PM, Juro Bystricky <juro.bystricky@intel.c=
om> wrote:
[..]
> >> If you have issues with devsrc .. why aren't you fixing it ? It certai=
nly
> >> shouldn't be left as is, while introducing something new.
> >
> > I would expect this -headers package to contain a subset of what -devsrc
> > is currently installing; might an option be to make the -devsrc package
> > depend on this -headers package?
>=20
> That's the rough plan. I'm looking into changing things this week, since I
> was catching up on backlog all last week.

Great!  Thanks for confirming.

  Josh

--EEx6GiKZGZ1wKUra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJV3gFpAAoJEKp7ZBKwQFArGF8H/jUzB5AfkaTpdXx4VOQcL4l8
LQGyWbifBEFpvt4Q642MSBmef7FIQDgHBLz5+70t8wa7a1oeoNsr4lKBBCVsuhjW
j+ylORnCgmGu6VMK0PvI95X/EvrRGjC/9Bs7+Chxh2T+ZULtoyxKu6XAoTKtHLWU
U+0U8HCfY2yRKpEPGuVmygjxaTVBPhgCyx/DeDR81se4wnBtNThPkSuAXBfjzaUJ
xPruK25ss0mb0A+ZMh+aUGtfKi+hHGhD5EM5DkG8CV01cbySSYfrcB+ONbZk4qTM
M7kuEcb5Tv5DVi6NPrYJWYaAh6r5/YztBU9R2aiPFYJCPXPYIEbih8nhkS6wWxA=
=5OQR
-----END PGP SIGNATURE-----

--EEx6GiKZGZ1wKUra--
