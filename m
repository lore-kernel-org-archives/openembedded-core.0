Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 10F3D608C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 12:26:08 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a15so5715235eae.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bKWA+22c/0L+9T1Le4yiAlKfr1A6lJWdwlHbkUZ6J8o=;
	b=Ge4YQipW1w1KO6Pl6kQEBQPnKiVwP2WOkjsuKxu6wii1Ff3LlD2N4fPQD7EED9td+D
	VwHMVaTwFqXNOyZx09AkRPSdrwXt6NqaXdyN+ap6XuhqhFS2qNYH5ZbJSCYKnZnTDvN4
	hUX5NyD+4RwEyHBgDr9zvDdcnUCzPaXbC7mtrooh8pmSlaqcLojw5Xa5Yd/CliWQ4AW5
	5w1coE1ZP4qTmaDg5KtEQSdVQstetQRDUgdTbeT4sDf1ExYtARpxeh8aCrDH7n4H4VUQ
	fOLIhtrGWCBwSXfuWXIgHIZKjpLZaqkMPPJlH51EbopYX64C+V5wRwMTABSf0ny6RDst
	1TMQ==
X-Received: by 10.15.24.129 with SMTP id j1mr41913490eeu.17.1373545569115;
	Thu, 11 Jul 2013 05:26:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	o5sm68697352eef.5.2013.07.11.05.26.07 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Jul 2013 05:26:08 -0700 (PDT)
Date: Thu, 11 Jul 2013 14:26:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130711122619.GH3288@jama>
References: <1373303785-8508-1-git-send-email-eu@felipetonello.com>
	<51DDACEA.1080503@linux.intel.com>
	<CAJTo0LZ7POY-i61qz8hUE=JXbc0=0uoNo_i1aTmgi-ma_cc8hw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ7POY-i61qz8hUE=JXbc0=0uoNo_i1aTmgi-ma_cc8hw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: Added consolekit dependency for pulseaudio-module-console-kit package
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
X-List-Received-Date: Thu, 11 Jul 2013 12:26:09 -0000
X-Groupsio-MsgNum: 41814
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C4ZO9l7mQWyMv5+Y"
Content-Disposition: inline

--C4ZO9l7mQWyMv5+Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2013 at 11:32:14AM +0100, Burton, Ross wrote:
> On 10 July 2013 19:50, Saul Wold <sgw@linux.intel.com> wrote:
> > Is this really a build-time dependency or a runtime dependency specific=
 to
> > the pulseaudio-module?
>=20
> It's a runtime dependency, but from memory bitbake doesn't manage to
> piece the chain together enough to actually build consolekit (probably
> because the packages are dynamically created).

The problem is that RDEPENDS_<dynamic_package> =3D "foo"
doesn't enforce foo to be built before <dynamic_package> is used in
image:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3498

So if <dynamic_package> is the only thing pulling "foo" into the image
you can get do_rootfs error about missing "foo".

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C4ZO9l7mQWyMv5+Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHepGsACgkQN1Ujt2V2gBxtgwCfZ0ZIARIwk/2L0j61v5dfPfeR
RfcAnAuIM1hhNF9wdwM9rXOO9JBcl96D
=vNkP
-----END PGP SIGNATURE-----

--C4ZO9l7mQWyMv5+Y--
