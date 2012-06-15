Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SfXjX-0008Gf-9V
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 16:42:43 +0200
Received: by wgbdr1 with SMTP id dr1so2749689wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 07:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ejx9IEt/OpDGx1NDGaEGBk/SaRJERQWqDBOAriLxqe4=;
	b=Lt77GF+YXLq+MR2mtZkQQetOsyu2AzKHMbOcM+ORUyamEd5MgOjueUbN1QefR5y13y
	PjBgwcZXsiX0rLF9rZv0r0gLXHThzVzs/vXBJ3cVimbozPR4e7uhuzqqHLe6i/XZms0+
	MspUffQdmZ8k/a/nomx/5PoyasggbMIHtdIgqvdpZHmEsmh/sM+1XtmYjkn44CGMdQPS
	Detpe0vcEHMW2jb+jH2uonF13WnW+1/4QpONWwq3RVPBMbGEhDQHBSWXvLhMyW4xlitJ
	ksHGXLq3gt26G4/NYG29xRbbsg0GRoMkTI3LJYVwJIemwFpLBKMvI/2IM+ZfEuJ7H4Lo
	nQkQ==
Received: by 10.180.80.35 with SMTP id o3mr5060972wix.7.1339770724624;
	Fri, 15 Jun 2012 07:32:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ez4sm3400340wid.3.2012.06.15.07.32.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jun 2012 07:32:03 -0700 (PDT)
Date: Fri, 15 Jun 2012 16:32:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120615143224.GW3140@jama.jama.net>
References: <20120615063647.GU3140@jama.jama.net>
	<CAMKF1srmOijugSfqfOivt2Sqfi0CvUVfZDRgUCprSShJ4nzf_w@mail.gmail.com>
	<4FDB4476.2070105@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <4FDB4476.2070105@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: openssl does not build on recent distributions with perl-5.16.0
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
X-List-Received-Date: Fri, 15 Jun 2012 14:42:43 -0000
X-Groupsio-MsgNum: 23622
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pEAjBjStGYT6H+Py"
Content-Disposition: inline

--pEAjBjStGYT6H+Py
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2012 at 03:19:34PM +0100, Jack Mitchell wrote:
> On 15/06/12 15:15, Khem Raj wrote:
> >
> >
> > On Thursday, June 14, 2012, Martin Jansa wrote:
> >
> >     Hi,
> >
> >     openembedded-core/meta/recipes-connectivity/openssl/openssl.inc
> >
> >     is using perlpath.pl <http://perlpath.pl>:
> >
> >      do_configure () {
> >              cd util
> >              perl perlpath.pl <http://perlpath.pl>
> >     ${STAGING_BINDIR_NATIVE}
> >
> >
> > I wonder why it's using host perl and not staged perl-native
> > May be missing inherit perlnative
> >
> >      ...
> >
> >     and perlpath.pl <http://perlpath.pl> is using find.pl
> >     <http://find.pl>:
> >     openssl-1.0.0i/util/perlpath.pl <http://perlpath.pl>:
> >      #!/usr/local/bin/perl
> >      #
> >      # modify the '#!/usr/local/bin/perl'
> >      # line in all scripts that rely on perl.
> >      #
> >
> >      require "find.pl <http://find.pl>";
> >      ...
> >
> >     which was removed in perl-5.16.0 and marked as deprecated and
> >     unmaintained in 5.14 and older:
> >     /tmp/usr/lib/perl5/5.14.2/find.pl <http://find.pl>:
> >      warn "Legacy library @{[(caller(0))[6]]} will be removed from the
> >     Perl
> >      core distribution in the next major release. Please install it
> >     from the
> >      CPAN distribution Perl4::CoreLibs. It is being used at
> >     @{[(caller)[1]]},
> >      line @{[(caller)[2]]}.\n";
> >
> >      # This library is deprecated and unmaintained. It is included for
> >      # compatibility with Perl 4 scripts which may use it, but it will =
be
> >      # removed in a future version of Perl. Please use the File::Find
> >     module
> >      # instead.
> >
> >     Cheers,
> >
> >     --
> >     Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com <javascript:=
;>
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> I can confirm I also ran into this issue using Archlinux, I thought it=20
> was an issue with my Perl install but obviously not!
>=20
> Regards,

You can use this patch as work around
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dshr&id=3D=
376acaea6856b4d7da35c61332d67e919d8c5736
but I guess that it should be fixed better for oe-core (preferably in
openssl perlpath.pl directly).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pEAjBjStGYT6H+Py
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/bR3gACgkQN1Ujt2V2gBxzygCghU+HT2ttAkRHpIE067tVv4be
dWcAoIIhgco1FrrDxX3QpvT4gAA5tFdL
=auKx
-----END PGP SIGNATURE-----

--pEAjBjStGYT6H+Py--
