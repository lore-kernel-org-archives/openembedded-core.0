Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjugh-0002pX-VS
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 16:57:20 +0200
Received: by fxh10 with SMTP id 10so3723780fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oqYX4fMjiGmpD6k2SR8m7FZRQJvkjiRV7a8q2mRhCAc=;
	b=SdL0yg5Upfn09mLcDmhVarwybAF1MX+6NAnH4Vd5LSnsZGwe3r5p53eFcdiuyRSZYK
	sqrgymzuc+K+NTfrCBjOMPuOae1yLZVae018Y0xYLbNwNIKb8R36Zg5PUK6IrQr2aYLa
	WlQt2hW0b6aFV314hTizzKdfB6TOks0EHDs+s=
Received: by 10.223.1.129 with SMTP id 1mr404063faf.103.1311259992357;
	Thu, 21 Jul 2011 07:53:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 22sm1440182fas.35.2011.07.21.07.53.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 07:53:11 -0700 (PDT)
Date: Thu, 21 Jul 2011 16:53:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110721145303.GF3443@jama.jama.net>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
	<4E277049.6020308@gmail.com> <4E2778DF.4040001@mentor.com>
	<20110721061111.GD3443@jama.jama.net> <4E283794.6010503@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4E283794.6010503@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 00/10] Small fixes
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
X-List-Received-Date: Thu, 21 Jul 2011 14:57:20 -0000
X-Groupsio-MsgNum: 6399
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UKNXkkdQCYZ6W5l3"
Content-Disposition: inline

--UKNXkkdQCYZ6W5l3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 07:28:36AM -0700, Tom Rini wrote:
> On 07/20/2011 11:11 PM, Martin Jansa wrote:
> > On Wed, Jul 20, 2011 at 05:54:55PM -0700, Tom Rini wrote:
> >> On 07/20/2011 05:18 PM, Khem Raj wrote:
> >>> On 07/20/2011 02:06 PM, Martin Jansa wrote:
> >>>> Fixes for recipes using intltool, distributions not having locales
> >>>> support in libc and distutils fix
> >>>>
> >>>> The following changes since commit
> >>>> 0d03800caffc2341b74190d38f7a372223c89f4c:
> >>>>
> >>>>    lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib
> >>>> (2011-07-20 15:43:43 +0100)
> >>>>
> >>>> are available in the git repository at:
> >>>>    git://git.openembedded.org/openembedded-core-contrib jansa/pull
> >>>>  =20
> >>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/=
?h=3Djansa/pull
> >>>>
> >>>>
> >>>> Martin Jansa (10):
> >>>>    tcmode-default: set preferred version also for (e)glibc-locale
> >>>>    eglibc-package: don't fail without localedef/gconv
> >>>>    intltool: inherit perlnative
> >>>>    polkit: inherit perlnative
> >>>>    shared-mime-info: inherit perlnative
> >>>>    xkeyboard-config: inherit perlnative
> >>>>    avahi: inherit perlnative
> >>>>    vte: inherit perlnative
> >>>
> >>> I guess all inherit perlnative patches can me squashed into one
> >>
> >> Or not done? :)
> >=20
> > I still see this issue, with
> > http://patches.openembedded.org/patch/8069/
> > applied.
>=20
> That's not enough.  You then need the cpan mangling patch applied on top.

I had both..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UKNXkkdQCYZ6W5l3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4oPU8ACgkQN1Ujt2V2gBzQVQCgq/+eV+SJ/dKhaNRMLZ9zbREN
RzoAnjRidron4TalW5JzodA5nsSc3mjb
=mkwy
-----END PGP SIGNATURE-----

--UKNXkkdQCYZ6W5l3--
