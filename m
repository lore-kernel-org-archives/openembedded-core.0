Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 78AE277060;
	Wed, 14 Oct 2015 14:17:07 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so103738935wic.0;
	Wed, 14 Oct 2015 07:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JjkTDUHPleoVyMenbDFqstSEYi7U10mgLsEHUt6s67w=;
	b=P5usMpr3tG6gI0CZV+2uerdOgyNch2wTCOHqZW1AtCbwKOlfflq1Ko6wmg6XtfmC2n
	pnU/Pg7VUskYjTAGsaERh5Jbhh44MOjOM6HJI6NEEVAklX1hMfIPv/zUXRGfycYdoyIb
	+uw2gao+p0CKJCcD+JMm9sUmDX3WN83Ouj0ps9I8yKNotbAXcNLgLL0SiNYrRFVTeXpp
	A9vTnbgAVj3uY+VlRiQO3tFrKj5tDdu2808QpZft42UBDhQim6iO1JjeHSVfJVNR0UxU
	tSXk7sEU+ruoinWGUFOH4hip2id/y82d0N7xJJtLK58QNzbIVtvXjPNYOsaESSi+u9TE
	SSWg==
X-Received: by 10.180.208.100 with SMTP id md4mr4674398wic.41.1444832199108;
	Wed, 14 Oct 2015 07:16:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l1sm10337422wjx.13.2015.10.14.07.16.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 07:16:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Oct 2015 16:16:50 +0200
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20151014141650.GC22448@jama>
References: <1443597600-29477-1-git-send-email-adrian.ratiu@ni.com>
	<1444373887-24315-1-git-send-email-adrian.ratiu@ni.com>
	<20151013105339.GC2396@jama> <561CFBB4.4000404@ni.com>
	<20151013130825.GE2396@jama> <561E614F.4070909@ni.com>
MIME-Version: 1.0
In-Reply-To: <561E614F.4070909@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH v2] meta-oe: recipes-graphics: add libvncserver recipe
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
X-List-Received-Date: Wed, 14 Oct 2015 14:17:08 -0000
X-Groupsio-MsgNum: 72172
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline

--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 05:06:07PM +0300, Ioan-Adrian Ratiu wrote:
> On 13.10.2015 16:08, Martin Jansa wrote:
> > On Tue, Oct 13, 2015 at 03:40:20PM +0300, Ioan-Adrian Ratiu wrote:
> >> On 13.10.2015 13:53, Martin Jansa wrote:
> >>> On Fri, Oct 09, 2015 at 09:58:07AM +0300, Ioan-Adrian Ratiu wrote:
> >>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> >>>> ---
> >>>>    .../libvncserver/libvncserver_0.9.10.bb               | 19 ++++++=
+++++++++++++
> >>>>    1 file changed, 19 insertions(+)
> >>>>    create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncse=
rver_0.9.10.bb
> >>>>
> >>>> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.=
10.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
> >>>> new file mode 100644
> >>>> index 0000000..afa303c
> >>>> --- /dev/null
> >>>> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
> >>>> @@ -0,0 +1,19 @@
> >>>> +DESCRIPTION =3D "library for easy implementation of a RDP/VNC serve=
r"
> >
> > Use SUMMARY for such short description.
> >
> >>>> +HOMEPAGE =3D "https://libvnc.github.io"
> >>>> +SECTION =3D "libs"
> >>>> +PRIORITY =3D "optional"
> >
> > Drop PRIORITY, we don't use it anywhere.
> >
> >>>> +LICENSE =3D "GPLv2"
> >>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D361b6b837cad26c6900a926b=
62aada5f"
> >>>> +
> >>>> +DEPENDS +=3D "zlib jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
> >>>> +RDEPENDS_${PN} +=3D "libpng gtk+ libgcrypt"
> >>>> +
> >>>> +RCONFLICTS_${PN} =3D "x11vnc"
> >>>
> >>> This isn't enough to resolve conflicts with x11vnc in sysroot, this o=
nly
> >>> prevent installing both packages in the same image.
> >>>
> >>>> +
> >>>> +inherit autotools pkgconfig
> >>>> +
> >>>> +SRC_URI  =3D "git://github.com/LibVNC/libvncserver.git;tag=3DLibVNC=
Server-0.9.10"
> >>>
> >>> Set SRCREV matching with this tag, otherwise bitbake will always use =
git
> >>> ls-remote to convert tag name to git SHA, which won't work for builds
> >>> from premirror (possibly without access to network)
> >>>
> >>
> >> This is easy to fix, however the above x11vnc conflict is not and I ha=
ve
> >> to check with upstream developers which might take awhile.
> >>
> >> Is it ok to blacklist libvncserver in patch v3 in order to not break
> >> x11vnc until this is solved?
> >
> > I don't want to introduce more blacklisted recipes in meta-oe, so this
> > won't be merged until it's resolved.
>=20
> Quick question: Fixing this involves adding a PACKAGECONFIG dependency=20
> inside x11vnc on libvncserver. x11vnc is in the openembedded-core layer.

If such PACKAGECONFIG can be disabled by default, then it's ok.

> Should I move libvncserver to oe-core, move x11vnc in meta-oe or should=
=20
> I just let them reside in separate layers even though there is this=20
> dependency?

oe-core (x11vnc) cannot by default depend on meta-oe (libvncserver), it
can be optional dependency, but without looking at the code my guess is
that this won't fix the issue.

Is the PACKAGECONFIG about using external libvncserver instead of
building own version inside x11vnc recipe? If my guess is right, then
oe-core will need to build own and meta-oe will need to remove such
PACKAGECONFIG in order to unblock building separate libvncserver.

If that's the case then moving libvncserver to oe-core or x11vnc to
meta-oe would be easier way forward.

Adding oe-core ML for their opinion.

Regards,
> >
> >>>> +
> >>>> +S =3D "${WORKDIR}/git"
> >>>> +
> >>>> +EXTRA_OEMAKE_append=3D" SUBDIRS=3D'libvncserver' "
> >>>> --
> >>>> 2.1.4
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >>>
> >>>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYeY9EACgkQN1Ujt2V2gBxY9gCeNTglzt17vwY4ugH+iXu1C9Gk
Uv0AoJaUgXHNyglRFnswJENYfxT6CUdD
=86ID
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
