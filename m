Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SS6aK-0000Gn-JN
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 15:05:40 +0200
Received: by wibhn14 with SMTP id hn14so1533145wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 05:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FFBuzmaYiRZHUcGME46wjS3l/5bDwrybIJUEaEnLWWU=;
	b=okl209rP7oOJbmkWSPaHMjrzMvjq/Z7Ht0Uib+VmmjETV3IGcBvWHJ9qVB4Pqxob5X
	4W2m+PBo55WntM1MVb07dk5SwhD6z/jBTGtq+BfUFvRqEnQ2YgDMiTFmxN42Dl98lCgN
	hrA5sQ8Ts96LzRuEMUdt4k7wYnM1QsS/ADq1UTkh5kDaz/NV3A5krP+Q4NhECoFMpz9l
	/1hAdj2ab+vkvKUWoHfWo5T6ORn/mkXWoPVnVLA6dQJaJayBY4JFQeroJrte6MKQcsOc
	6YRYbEebgbYjpgd9RKEE++4dj1QkdNb2pvrSsC1IatIZvSdnolZ8D0oo0Yngb3GSXlwO
	RiEA==
Received: by 10.180.107.100 with SMTP id hb4mr10476wib.22.1336568147889;
	Wed, 09 May 2012 05:55:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm36309999wiy.7.2012.05.09.05.55.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 05:55:47 -0700 (PDT)
Date: Wed, 9 May 2012 14:55:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120509125548.GE12898@jama.jama.net>
References: <20120508151411.C836310218@opal>
	<20120509105803.GC12898@jama.jama.net>
	<CADkTA4MdYMfAiPbkkmNCHx+xc1Nyy5PR5ZyDJq3mfz9QXpP3Hg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4MdYMfAiPbkkmNCHx+xc1Nyy5PR5ZyDJq3mfz9QXpP3Hg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: integrate minor fixes
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
X-List-Received-Date: Wed, 09 May 2012 13:05:40 -0000
X-Groupsio-MsgNum: 21894
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IU5/I01NYhRvwH70"
Content-Disposition: inline

--IU5/I01NYhRvwH70
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 09, 2012 at 08:43:50AM -0400, Bruce Ashfield wrote:
> On Wed, May 9, 2012 at 6:58 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Tue, May 08, 2012 at 03:14:10PM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 043871d7e5d2d19c2ff43e54d2ff180c09e8903e
> >> URL: =A0 =A0http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3D043871d7e5d2d19c2ff43e54d2ff180c09e8903e
> >>
> >> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> Date: =A0 Mon Apr 30 00:02:17 2012 -0400
> >>
> >> kern-tools: integrate minor fixes
> >>
> >> Updating the SRCREV to pick up two minor fixes:
> >>
> >> 1/2:
> >> =A0 =A0 kgit-init: correct spelling of createme
> >>
> >> =A0 =A0 kgit-init copies the kern-tools scripts and intends to copy cr=
eateme.
> >>
> >> =A0 =A0 The typo is in the usage() of updateme as well.
> >>
> >> =A0 =A0 Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
> >>
> >> 2/2:
> >> =A0 =A0 kconf_check: fix bad quoting around missing_required.cfg
> >>
> >> =A0 =A0 missing_required.cfg won't have it's path truncated (if applic=
able), since
> >> =A0 =A0 the quoting it wrong.
> >>
> >> =A0 =A0 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> >> =A0 =A0 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >
> > No idea if this is new issue or just old issue now revealed by those
> > fixes, but linux-yocto-3.2 now fails to build for qemux86-64 (at
> > least here).
>=20
> It's an old issue, but the second patch I sent last night is the fix.

This one?
http://patchwork.openembedded.org/patch/27337/

Thanks

>=20
> Bruce
>=20
> >
> > NOTE: package linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f03827b7efb=
ccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1: task do_patch: Star=
ted
> > ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/qemu=
x86_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f=
03827b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/log.d=
o_patch.32134 for further information)
> > ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/qemux=
86_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f0=
3827b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/log.do=
_patch.32134
> > Log data follows:
> > | ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/qe=
mux86_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f=
3f03827b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/log=
=2Edo_patch.32134 for further information)
> > | WARNING: addon feature "features/netfilter" was not found
> > | WARNING: addon feature "features/taskstats" was not found
> > | WARNING: addon feature "cfg/sound" was not found
> > | ERROR: required features were not found. aborting
> > | ERROR. Could not update standard/default/common-pc-64/base
> > NOTE: package linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f03827b7efb=
ccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1: task do_patch: Fail=
ed
> >
> > Cheers,
> >
> > --
> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IU5/I01NYhRvwH70
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+qaVQACgkQN1Ujt2V2gBylSACgqz2nsrtxzCvZzDxziV4rK7LE
HroAnR5zTBFyivm9i4Mj7wa1taciXdqx
=fvrr
-----END PGP SIGNATURE-----

--IU5/I01NYhRvwH70--
