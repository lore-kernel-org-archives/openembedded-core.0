Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PvWPQ-0006z5-Ho
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 15:55:12 +0100
Received: by fxm8 with SMTP id 8so2210517fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=M8S6+YmrNSzB/Iwowggqbu9kqNSADVQW5tC0WSOTlOo=;
	b=qJIXTB+Zi8pjJZ9hCXFyURApP5CzlqwY93rrlP+oJ6JByHOPvF7UwE1pxTlKnDFnWK
	NrEGT+4DPfArWenFRlpZ9NtRpMIkUsXYJR/EMXSMD6jo0LRMCP9TrKsRjPE1rp9MvObt
	kXTJ2cXEKRNHhf8RiBEaOEB8aijFQmH/UCtDI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=x47mZjzBUyOAe1+U/cyfc5RiUzPVsCRpMRA4OCC6ZVzKbeI9RAzXpCBj1ywpDNwv9L
	0ZRWKVqzgxhkIHjUCYNGR51+UrbJhKZhzYt0oewwwpbR3GsbkOrFy+RttPSY/MpzwXF9
	gPYTuep/I7SVDqqmWnedJDXQPZCoRKcR1U+c8=
Received: by 10.223.110.38 with SMTP id l38mr890688fap.116.1299250416963;
	Fri, 04 Mar 2011 06:53:36 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r24sm1199944fax.3.2011.03.04.06.53.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 06:53:35 -0800 (PST)
Date: Fri, 4 Mar 2011 15:53:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110304145329.GE3312@jama.jama.net>
References: <1299235247-5527-1-git-send-email-Martin.Jansa@gmail.com>
	<1299247286.17567.1349.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1299247286.17567.1349.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf: point PERSISTENT_DIR outside TMPDIR
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
X-List-Received-Date: Fri, 04 Mar 2011 14:55:12 -0000
X-Groupsio-MsgNum: 241
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LSp5EJdfMPwZcMS1"
Content-Disposition: inline

--LSp5EJdfMPwZcMS1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2011 at 02:01:26PM +0000, Richard Purdie wrote:
> On Fri, 2011-03-04 at 11:40 +0100, Martin Jansa wrote:
> > * sanity check warning user that he still has peristent cache in old lo=
cation
> > * similar patch was sent to OE, to keep PERSISTENT_DIR location consist=
ent
> >   http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/03=
0623.html
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/sanity.bbclass |    8 ++++++++
> >  meta/conf/bitbake.conf      |    2 +-
> >  meta/conf/sanity.conf       |    1 +
> >  3 files changed, 10 insertions(+), 1 deletions(-)
>=20
> When I saw this on the OE list, I'd assumed you'd done what Poky had
> done, I've just realised you're moving this file to TOPDIR instead of
> TMPDIR.
>=20
> My big concern here is that we really shouldn't be writing to data to
> the conf directory as its not what the user expects.
>=20
> I say this knowing the raft of usability problems we've had every time
> we take something outside of TMPDIR as users have the expectation that
> deleting tmp wipes out all stored state and rebuilds. Having this file
> hidden in the conf directory breaks that expectation. Note there are
> only two things we place outside of TMPDIR, downloads and sstate data.
> Even things like buildstats which you might want to preserve over
> different builds are still inside TMPDIR.

=46rom my experience I always had to say:

You have to rebuild from scratch. Just wipe out tmp directory, but don't
forget to save&load tmp/cache/bb_persist_data.sqlite3 because that file is
really important for upgradable path.

So that was my motivation to move it outside TMPDIR and no strong
opinion about keeping it inside conf/toplevel/any other directory.

> Can we put it in cache as a top level file rather than machine specific?

"machine specific"?

something like?
PERSISTENT_DIR =3D "${TOPDIR}/persistent"
or?
PERSISTENT_DIR =3D "${TOPDIR}/persistent-cache"
would be OK?

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LSp5EJdfMPwZcMS1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1w/OkACgkQN1Ujt2V2gBzpgQCbBBcQ9cavOF7AbGCXnLuJeL87
jcsAoIXH2FhHWrwSaqKoGAt/nQTvRhTi
=keMA
-----END PGP SIGNATURE-----

--LSp5EJdfMPwZcMS1--
