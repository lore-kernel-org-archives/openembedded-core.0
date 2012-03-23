Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SB7Uy-0007tF-IR
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:37:56 +0100
Received: by ggcy3 with SMTP id y3so2898630ggc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 09:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=S5EXNqS5z+KDhUYswu8pPNDScUEqyuEz0nl+6ip01Mw=;
	b=Vq8uNOHVA2LC79B4mE0zVHKdgbE96EhzpMi8Usy55c4chTqh/azlXX3rkvHLMGHUF7
	AhIMk1I6dUhFhSI2A+sFy1b1vE3D5e0qvXuX6KUa39vPcf7hHubQoFrE5/HrhzxqfYtn
	vgXt8o1Jo4xUP+QRnoStXigMbXLSN5SA5MTMMaG6y9HEqYj+Ffjz3kuXxrRd2Ew/1T8d
	J+1mZNQCsoVZZMu47ST2eQZFyKQx/u11mKjMZdBR0pr01l+M1uE6+bjmqtXsNJz8HMT1
	HbI+ecH5xX/hJmFc22Sw3ebS0UbMUzgMJNelt1BWx3gFDv6/hs5cUB9PcumdrwaZvFU6
	GvTQ==
Received: by 10.60.0.201 with SMTP id 9mr14946891oeg.59.1332520139692;
	Fri, 23 Mar 2012 09:28:59 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id xh3sm8153807obb.13.2012.03.23.09.28.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 09:28:58 -0700 (PDT)
Date: Fri, 23 Mar 2012 09:29:00 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20120323162900.GD9551@bill-the-cat>
References: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
	<1332458784.9740.371.camel@ted> <20120322235342.GC13495@denix.org>
	<1332465264.9740.380.camel@ted>
	<20120323154826.GC9551@bill-the-cat>
	<4F6CA210.4040501@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F6CA210.4040501@linux.intel.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Consistency and use cases for IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 23 Mar 2012 16:37:56 -0000
X-Groupsio-MsgNum: 19581
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline

--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 09:17:20AM -0700, Darren Hart wrote:
> On 03/23/2012 08:48 AM, Tom Rini wrote:
> > On Fri, Mar 23, 2012 at 01:14:24AM +0000, Richard Purdie wrote:
> >> On Thu, 2012-03-22 at 19:53 -0400, Denys Dmytriyenko wrote:
> >>> On Thu, Mar 22, 2012 at 11:26:24PM +0000, Richard Purdie wrote:
> >>>> On Fri, 2012-03-09 at 14:39 -0700, Tom Rini wrote:
> >>>>> Hey all,
> >>>>>
> >>>>> Over in meta-ti I kicked off a discussion
> >>>>> (https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000779=
=2Ehtml)
> >>>>> about if we should be using '?=3D' or '+=3D' with IMAGE_FSTYPES in =
the
> >>>>> machine conf files.  This has been discussed a little bit before
> >>>>> (http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/206=
0/focus=3D2061).
> >>>>>  The problem is we have the following and I believe ultimately
> >>>>> conflicting use cases:
> >>>>
> >>>> I've been under the impression that we decided upon:
> >>>>
> >>>>> - The machine needs to say 'I need or support the following formats'
> >>>>
> >>>> so the machine starts and sets:
> >>>>
> >>>> IMAGE_FSTYPES =3D "xxxx"
> >>>>
> >>>>> - The distro needs to say 'I always want format X'
> >>>>
> >>>> so the distro can do:
> >>>>
> >>>> IMAGE_FSTYPES +=3D " yyy"
> >>>>
> >>>>> - The user needs to say 'I know best, give me only format X'
> >>>>
> >>>> So the user can do:
> >>>>
> >>>> IMAGE_FSTYPES =3D "X"
> >>>
> >>> Since local.conf gets parsed before machine.conf and distro.conf, the=
 user=20
> >>> needs to do this override:
> >>>
> >>> IMAGE_FSTYPES_local =3D "X"
> >>>
> >>> Otherwise machine.conf will always overwrite it with "xxxx" with its=
=20
> >>> unconditional assignment.
> >>
> >> Right, I'd forgotten that little detail :/.
> >>
> >> It actually makes me wonder if our include order is the right one but
> >> now isn't the time to try changing that.
> >>
> >> I agree the neatest way to change it is probably something like
> >> MACHINE_FSTYPES. I do worry a lot about backwards compatibility though
> >> and I'd also point out where we're at in the release cycle (bug fix
> >> only).
> >=20
> > Well, one problem that would make this a bugfix is that no one does what
> > you say we agreed on today.  oe-core has qemu.inc using ?=3D, meta-intel
> > is using +=3D and meta-ti is mixed (which is what got this started).
> >=20
> >=20
>=20
> Is this causing any nasty failures right now, or is it in the "this is a
> confusing mess and it would be nice to get it cleaned up" bucket? If the
> latter, I think I'd prefer to wait a bit an clean up the
> local.conf/machine.conf IMAGE_FSTYPES clobbering issue.

Well, I found this as part of adding UBI support for a board and it
wasn't sticking.

I'd go so far as to say that for a release, we really need to pick a
standard, document and follow it.  If it's machine.conf does =3D, everyone
else does +=3D and user's have to do _local =3D, fine, it sucks but it's
documented and consistent on all of the BSP layers.

> If this isn't really fixable (for whatever requirements bitbake has on
> load/parse order of config files), then Koen's EXTRA_IMAGE_FSTYPES seems
> like the most consistent mechanism with other things, like
> CORE_IMAGE_EXTRA_INSTALL (OK, maybe IMAGE_EXTRA_FSTYPES ?).
>=20
> So the default becomes:
>=20
> IMAGE_FSTYPES ?=3D ${IMAGE_EXTRA_FSTYPES}
>=20
> and DISTROs might define that as:
>=20
> IMAGE_FSTYPES +=3D "yyy"
>=20
> and users can update local.conf to be:
>=20
> IMAGE_FSTYPES =3D "X"
>=20
> But, doesn't this meant the DISTRO append will still change the
> IMAGE_FSTYPES to "X yyy" even though the user intended "only X"?

How about:
bitbake.conf: IMAGE_FSTYPES ??=3D ${IMAGE_EXTRA_FSTYPES}
distro.conf: IMAGE_FSTYPES ?=3D "yyy ${IMAGE_EXTRA_FSTYPES}"
local.conf: IMAGE_FSTYPES =3D "X"

Or am I forgetting the magic of ??=3D again...

--=20
Tom

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk9spMwACgkQdZngf2G4WwMBuwCfY50ckVE54cZ0cM8RCiSo2wb4
Vp8An1r7kU3gn1fLgbJG2675IJjgbe8p
=ylDw
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
