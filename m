Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TZ3AB-00017Q-HV
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 18:23:39 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so800550bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 09:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0R0cCYkBBAbrW0WmSKPmMw0ZHqovW9q1JUgDmH2LdYA=;
	b=YZVT9ig84bIPywVOsNyOEFg7KTYtcptGU1OOTpx2iltvljMwp9Er5gtRGg0LDwOCF2
	yVM+0f519Lfbp3zhjtpUm4+ubxhtoUFIdWYny8mOK7EDe96rXseL0VL1wOmbG6ELkvDm
	GHSsWxL8QTDYKIEipeuajQahKmRcBEaAa+jZaoFImwbDlkG8yhklVxFrLBJ6d4ZyejkV
	Q17a5eX/12zllwZPQlZcMu7to6yxipDFk6kOMo6ZuHBz15l7ytkKAzswpHxtfnqaEqwu
	hDexe0+6BUXvvHpP3GyCtoXg+j7trRZtXG5CDY2uhJfleMbgbm+VixVcRB0/gH1J4mxI
	pxcg==
Received: by 10.204.146.13 with SMTP id f13mr725207bkv.29.1352999382626;
	Thu, 15 Nov 2012 09:09:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ia2sm10957425bkc.11.2012.11.15.09.09.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 09:09:41 -0800 (PST)
Date: Thu, 15 Nov 2012 18:09:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20121115170954.GE17521@jama.jama.net>
References: <1351077301-7744-1-git-send-email-Martin.Jansa@gmail.com>
	<1352964649-31187-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZAN=W_E+Qtox5XF7nBcMY9tN4vCCA51vcy=Hx1GDVGMwVbQ@mail.gmail.com>
	<20121115161907.GC17521@jama.jama.net>
	<CABcZANn1VVzpKrRiRCoBgvodnrDKKmrA5wBa2T2rjbzhey39tw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANn1VVzpKrRiRCoBgvodnrDKKmrA5wBa2T2rjbzhey39tw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2012 17:23:39 -0000
X-Groupsio-MsgNum: 31430
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xA/XKXTdy9G3iaIz"
Content-Disposition: inline

--xA/XKXTdy9G3iaIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2012 at 09:27:52AM -0700, Chris Larson wrote:
> On Thu, Nov 15, 2012 at 9:19 AM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > On Thu, Nov 15, 2012 at 08:25:20AM -0700, Chris Larson wrote:
> > > On Thu, Nov 15, 2012 at 12:30 AM, Martin Jansa <martin.jansa@gmail.com
> > >wrote:
> > >
> > > > * it's not very universal, but works with default oe-core setup and
> > > >   shows basic HOW-TO. It can be improved later.
> > > >
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  V2: added .pyo to WHITELIST
> > > >      shorter filenames
> > > >      TMPDIR
> > > >      added duplicates but not shown
> > > >
> > > >  V3: use also populate-sysroot.MACHINE, manifest name for
> > populate-sysroot
> > > >      was changed in febeaf3d1b8917b660c7279b008d8b03337568e9
> > > >
> > > >  V4: dropped eglibc-initial work around, it was fixed in oe-core
> > > >
> > > >  scripts/sstate-sysroot-cruft.sh | 34
> > ++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 34 insertions(+)
> > > >  create mode 100755 scripts/sstate-sysroot-cruft.sh
> > > >
> > > > diff --git a/scripts/sstate-sysroot-cruft.sh
> > > > b/scripts/sstate-sysroot-cruft.sh
> > > > new file mode 100755
> > > > index 0000000..ca23dcf
> > > > --- /dev/null
> > > > +++ b/scripts/sstate-sysroot-cruft.sh
> > > > @@ -0,0 +1,34 @@
> > > > +#!/bin/sh
> > > > +
> > > > +# Used to find files installed in sysroot which are not tracked by
> > sstate
> > > > manifest
> > > > +# Update BASE
> > > > +
> > > > +BASE=3D"/OE/oe-core"
> > > >
> > >
> > > This seems interesting, but I have a few comments/concerns.
> > >
> > > 1) don't hardcode BASE, figure out the path relative to the script's
> > > location, e.g. BASE=3D"$(cd $(dirname $(dirname $0)) && pwd)"
> > > 2) output files shouldn't go into oe-core directly, as oe-core isn't
> > > guaranteed to be writable, and it's more common to expect output from=
 a
> > > script like this to go relative to the current directory, or a temp
> > > directory
> > > 3) extract TMPDIR from bitbake -e, rather than hardcoding that, as th=
at
> > > breaks for any distros or users which separate their tmpdirs by distr=
o,
> > or
> > > set TCLIBCAPPEND =3D ""
> >
> > Ah in this case BASE is not directory with oe-core layer but one above.
> >
>=20
> Still trivial to determine relative to the script's location. Adding an
> extra call to dirname, or an extra '/..' isn't particularly tough.

Yes, but making another assumption that TMPDIR is on same level as
oe-core checkout it.

> I didn't want to use bitbake -e, so that this script can be executed
> > when some other bitbake process is running.
> >
>=20
> I don't see having to hardcode assumptions about the environment as a net
> win, personally. At least make them arguments, or add an argument to
> optionally use bitbake -e, or let it take vars from the environment.

v5 is using argument or env variable (like sstate-cache-management.sh)

> As said it's not really universal (I wrote it just to confirm something
> > and then shared it to find if someone else finds it also usefull to
> > improve it).
> >
>=20
> If it can't be used in a wide variety of circumstances, I'd argue against
> its inclusion in oe-core until such time that it's ready. The subject of
> this thread didn't include "RFC' ;)

I was using it in wide variety of circumstances just by updating 1
variable in script, but I agree that argument + shell history can make
it easier.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xA/XKXTdy9G3iaIz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlClIeIACgkQN1Ujt2V2gBzg3gCfXWlcUUD46Qc0R0Fh4ZbLRkSr
BeQAnjSdOtCrceA+QSNFUXDWOx7tbRHO
=r7Wd
-----END PGP SIGNATURE-----

--xA/XKXTdy9G3iaIz--
