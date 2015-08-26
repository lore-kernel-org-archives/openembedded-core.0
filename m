Return-Path: <joshc@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id EE14576DFB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 18:56:06 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t7QHtm6X006480; Wed, 26 Aug 2015 12:55:48 -0500
Received: from jcartwri.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015082612554792-660549 ;
	Wed, 26 Aug 2015 12:55:47 -0500 
Received: by jcartwri.amer.corp.natinst.com (Postfix, from userid 1000)
	id EE2963002CC; Wed, 26 Aug 2015 12:55:47 -0500 (CDT)
Date: Wed, 26 Aug 2015 12:55:47 -0500
From: Josh Cartwright <joshc@ni.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20150826175547.GL8016@jcartwri.amer.corp.natinst.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<1438634128-4347-2-git-send-email-juro.bystricky@intel.com>
	<CADkTA4N6M5nnq9Y_eSKKdotUCNkPfpJBLuu5dZnwWSdszVgxuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4N6M5nnq9Y_eSKKdotUCNkPfpJBLuu5dZnwWSdszVgxuQ@mail.gmail.com>
User-Agent: Mutt/1.5.23+102 (2ca89bed6448) (2014-03-12)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/26/2015 12:55:47 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/26/2015 12:55:48 PM,
	Serialize complete at 08/26/2015 12:55:48 PM
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
X-List-Received-Date: Wed, 26 Aug 2015 18:56:09 -0000
X-Groupsio-MsgNum: 70104
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XjbSsFHOHxvQpKib"
Content-Disposition: inline

--XjbSsFHOHxvQpKib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Bruce-

(Just dug this up because it was relevant to a conversation in the
office.)

On Tue, Aug 04, 2015 at 11:20:11PM -0300, Bruce Ashfield wrote:
> On Mon, Aug 3, 2015 at 5:35 PM, Juro Bystricky <juro.bystricky@intel.com>=
 wrote:
> > Header files and scripts for building modules for Linux kernel.
> >
> > A set of files is needed to allow building new Linux kernel modules
> > against an already installed Linux kernel. The files include various
> > header files, script files, Makefiles, source code files for several
> > utility programs and Linux kerenl .config file.
>=20
> We already have our kernel devsrc packages. This is simply creating more
> copies of the same functionality.

The kernel-devsrc package contains much more than is explicitly required
just to build external kernel modules (a full kernel source tree isn't
required), and the kernel-dev package doesn't install enough.  Right
now, there is no "just enough".

> If you have issues with devsrc .. why aren't you fixing it ? It certainly
> shouldn't be left as is, while introducing something new.

I would expect this -headers package to contain a subset of what -devsrc
is currently installing; might an option be to make the -devsrc package
depend on this -headers package?

  Josh

--XjbSsFHOHxvQpKib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJV3f2gAAoJEKp7ZBKwQFArEecIAI1dD6UqPcJQjohVdPUK2CP/
uAu3/yXv14kkZtJtKSOIaQhPevOgy71btVcOHofQDGbUXte0cM8EiQIv6iiK6EHa
CIkxedVg83rau2x9bPKLj7qEe7q5QPCPRxP70WCxRFhJItihSsHCl0KYcB1NX1+b
3noxkusi/ilDpoU3FpGkDGv7croJVnkYblCPMfSPtitV5kNfPqfNw5qr8kugzzZH
4PPsUZljY9W8DclqucfdnX2prhON0ZTc2X1Np+Uk5Jvnc7lmis7bcRtYdcrnrmNe
NXJ5hNB3uzTTcg8FHTkXJsj6Q2mjoj0Vxl/sxzOvuW92LbCIlB4k01sR+IMszOs=
=+gIX
-----END PGP SIGNATURE-----

--XjbSsFHOHxvQpKib--
