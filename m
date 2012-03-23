Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SB82M-0000V5-Kj
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 18:12:26 +0100
Received: by obqv19 with SMTP id v19so2731206obq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=+nmDnZsVPD4NO3boCfjd8TXOfhOqIuLLkDfSd6Z5Cpg=;
	b=rOHXQRSAsHK0NzuJKMpU/zXzw9J2T78qqsy53lJTC7FWpmUEmxqrfEY3uznLZZRR5u
	4easQifUkm+uxzAqmzmBBDXUojJaDZRsoJwG43AaWdyoiP/iNZa648dycp1asc7ZsjaE
	/6/Um5GT6ZE/xJgg0Ri8eizd41YpTt3h32BclnVwTF9YcKduYXNbCRv6lmNXSdKCKey2
	UrjO7d3mgWjWHq7P7rCyglUU12OnKjhQEIF0m2jS9/9fgyDqLiC8aUuzdgw6I/0PfT5y
	AIEdWIUoXJ8cArFtlYhGyBLDflFYJYys7lvrBGOBjD/UjfTI5gir7ixC2hs4u1RTVkn0
	ogmA==
Received: by 10.182.222.74 with SMTP id qk10mr15367553obc.75.1332522209933;
	Fri, 23 Mar 2012 10:03:29 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id 8sm8231001obv.19.2012.03.23.10.03.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 10:03:29 -0700 (PDT)
Date: Fri, 23 Mar 2012 10:03:31 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20120323170331.GE9551@bill-the-cat>
References: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
	<1332458784.9740.371.camel@ted> <20120322235342.GC13495@denix.org>
	<1332465264.9740.380.camel@ted>
	<20120323154826.GC9551@bill-the-cat>
	<4F6CA210.4040501@linux.intel.com>
	<20120323162900.GD9551@bill-the-cat>
	<4F6CA5FA.8020605@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F6CA5FA.8020605@linux.intel.com>
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
X-List-Received-Date: Fri, 23 Mar 2012 17:12:27 -0000
X-Groupsio-MsgNum: 19593
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Content-Disposition: inline

--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 09:34:02AM -0700, Darren Hart wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
>=20
> On 03/23/2012 09:29 AM, Tom Rini wrote:
> > On Fri, Mar 23, 2012 at 09:17:20AM -0700, Darren Hart wrote:
> >> On 03/23/2012 08:48 AM, Tom Rini wrote:
> >>> On Fri, Mar 23, 2012 at 01:14:24AM +0000, Richard Purdie
> >>> wrote:
> >>>> On Thu, 2012-03-22 at 19:53 -0400, Denys Dmytriyenko wrote:
> >>>>> On Thu, Mar 22, 2012 at 11:26:24PM +0000, Richard Purdie
> >>>>> wrote:
> >>>>>> On Fri, 2012-03-09 at 14:39 -0700, Tom Rini wrote:
> >>>>>>> Hey all,
> >>>>>>>=20
> >>>>>>> Over in meta-ti I kicked off a discussion=20
> >>>>>>> (https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/0007=
79.html)
> >>>>>>>
> >>>>>>>=20
> about if we should be using '?=3D' or '+=3D' with IMAGE_FSTYPES in the
> >>>>>>> machine conf files.  This has been discussed a little
> >>>>>>> bit before=20
> >>>>>>> (http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/2=
060/focus=3D2061).
> >>>>>>>
> >>>>>>>=20
> The problem is we have the following and I believe ultimately
> >>>>>>> conflicting use cases:
> >>>>>>=20
> >>>>>> I've been under the impression that we decided upon:
> >>>>>>=20
> >>>>>>> - The machine needs to say 'I need or support the
> >>>>>>> following formats'
> >>>>>>=20
> >>>>>> so the machine starts and sets:
> >>>>>>=20
> >>>>>> IMAGE_FSTYPES =3D "xxxx"
> >>>>>>=20
> >>>>>>> - The distro needs to say 'I always want format X'
> >>>>>>=20
> >>>>>> so the distro can do:
> >>>>>>=20
> >>>>>> IMAGE_FSTYPES +=3D " yyy"
> >>>>>>=20
> >>>>>>> - The user needs to say 'I know best, give me only
> >>>>>>> format X'
> >>>>>>=20
> >>>>>> So the user can do:
> >>>>>>=20
> >>>>>> IMAGE_FSTYPES =3D "X"
> >>>>>=20
> >>>>> Since local.conf gets parsed before machine.conf and
> >>>>> distro.conf, the user needs to do this override:
> >>>>>=20
> >>>>> IMAGE_FSTYPES_local =3D "X"
> >>>>>=20
> >>>>> Otherwise machine.conf will always overwrite it with "xxxx"
> >>>>> with its unconditional assignment.
> >>>>=20
> >>>> Right, I'd forgotten that little detail :/.
> >>>>=20
> >>>> It actually makes me wonder if our include order is the right
> >>>> one but now isn't the time to try changing that.
> >>>>=20
> >>>> I agree the neatest way to change it is probably something
> >>>> like MACHINE_FSTYPES. I do worry a lot about backwards
> >>>> compatibility though and I'd also point out where we're at in
> >>>> the release cycle (bug fix only).
> >>>=20
> >>> Well, one problem that would make this a bugfix is that no one
> >>> does what you say we agreed on today.  oe-core has qemu.inc
> >>> using ?=3D, meta-intel is using +=3D and meta-ti is mixed (which is
> >>> what got this started).
> >>>=20
> >>>=20
> >>=20
> >> Is this causing any nasty failures right now, or is it in the
> >> "this is a confusing mess and it would be nice to get it cleaned
> >> up" bucket? If the latter, I think I'd prefer to wait a bit an
> >> clean up the local.conf/machine.conf IMAGE_FSTYPES clobbering
> >> issue.
> >=20
> > Well, I found this as part of adding UBI support for a board and
> > it wasn't sticking.
> >=20
> > I'd go so far as to say that for a release, we really need to pick
> > a standard, document and follow it.  If it's machine.conf does =3D,
> > everyone else does +=3D and user's have to do _local =3D, fine, it
> > sucks but it's documented and consistent on all of the BSP layers.
> >=20
> >> If this isn't really fixable (for whatever requirements bitbake
> >> has on load/parse order of config files), then Koen's
> >> EXTRA_IMAGE_FSTYPES seems like the most consistent mechanism with
> >> other things, like CORE_IMAGE_EXTRA_INSTALL (OK, maybe
> >> IMAGE_EXTRA_FSTYPES ?).
> >>=20
> >> So the default becomes:
> >>=20
> >> IMAGE_FSTYPES ?=3D ${IMAGE_EXTRA_FSTYPES}
> >>=20
> >> and DISTROs might define that as:
> >>=20
> >> IMAGE_FSTYPES +=3D "yyy"
> >>=20
> >> and users can update local.conf to be:
> >>=20
> >> IMAGE_FSTYPES =3D "X"
> >>=20
> >> But, doesn't this meant the DISTRO append will still change the=20
> >> IMAGE_FSTYPES to "X yyy" even though the user intended "only X"?
> >=20
> > How about: bitbake.conf: IMAGE_FSTYPES ??=3D ${IMAGE_EXTRA_FSTYPES}=20
> > distro.conf: IMAGE_FSTYPES ?=3D "yyy ${IMAGE_EXTRA_FSTYPES}"=20
> > local.conf: IMAGE_FSTYPES =3D "X"
> >=20
> > Or am I forgetting the magic of ??=3D again...
> >=20
>=20
> What would machine.conf do in this scenario?

OK, lets test things out.  bitbake.conf, distro.conf set as above (with
machine.conf providing IMAGE_EXTRA_FSTYPES). =20

> IMAGE_FSTYPES_append_machine =3D "Z" ?

With this in local.conf, IMAGE_FSTYPES =3D "distro machineZ" (the fun of
_append semantics, you would have wanted " Z").

> IMAGE_EXTRA_FSTYPES =3D "Z"

Again in local.conf, this is ignored and it's the original problem.
Making this IMAGE_EXTRA_FSTYPES_local =3D "Z" is also ignored because
local overrides were removed in 83ce96f (really? ok..).  Making this
IMAGE_EXTRA_FSTYPES_forcevariable =3D "Z" yields IMAGE_FSTYPES =3D "distro =
Z".

--=20
Tom

--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk9srOMACgkQdZngf2G4WwNjUgCeN0Aob+MOc+CT96jX/jIJlsJW
wEAAn1hjezqRY//yAIwVVBoqj+T8orBg
=IT5/
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--
