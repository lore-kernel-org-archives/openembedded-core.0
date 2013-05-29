Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6F861AD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:59:04 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id um15so9367123pbc.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZLtWMdWlxNAnQAoOQzgwmHbFaV/iA32Wx2gCmPEHzLM=;
	b=NqEctzynZkGaIAk4ldWAUWO5PhsC+SlLlwDrIVvZ9Sa8hIyzKg9Yqe/biCLl5MYYyj
	vhVMwwJsRr7u8vM87goPqkkBaCQ/m2D34UxsQ0UrplkQTPKLJzpkCDOWQQi4oNGtXuCX
	zzS9TgScasa5MSFYwqw2heVw9jghoLrGUBQSk/vQDcxjmRVQQLws4HICzdrrWGbVRAMu
	mVe8HvZqsJ2j8SCPUUjD6mI4qcwtJmmKJBfuCBXobu/LTtIcVyS7hq1THQz6qHRR0TrU
	9JhXtGlwX3njwRfXgP3h6nZzUCv44RNSfY6sOIw71U/+18HG7+U7zr9rsUNgAEXhHW2s
	gfgg==
X-Received: by 10.66.159.130 with SMTP id xc2mr4024261pab.61.1369843145374;
	Wed, 29 May 2013 08:59:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	gh9sm37789782pbc.37.2013.05.29.08.59.02 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 29 May 2013 08:59:04 -0700 (PDT)
Date: Wed, 29 May 2013 17:59:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20130529155906.GO3192@jama>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-3-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1369840203-21898-3-git-send-email-mark.hatle@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/21] Add directory information to the pkgdata files
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
X-List-Received-Date: Wed, 29 May 2013 15:59:04 -0000
X-Groupsio-MsgNum: 39853
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpgPcFyQO6wM49Um"
Content-Disposition: inline

--IpgPcFyQO6wM49Um
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2013 at 10:09:44AM -0500, Mark Hatle wrote:
> Add S(ource) and B(uild) directory information to the recipe pkgdata file=
s.
> This allows external tools to find the appropriate information, and be ab=
le
> to easily access the corresponding sources and build directories.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 02a1460..19b2b4c 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1124,6 +1124,8 @@ python emit_pkgdata() {
> =20
>      data_file =3D pkgdatadir + d.expand("/${PN}" )
>      f =3D open(data_file, 'w')
> +    f.write("S: %s\n" % d.expand("${S}"))
> +    f.write("B: %s\n" % d.expand("${B}"))
>      f.write("PACKAGES: %s\n" % packages)
>      f.close()

how does this interact with sstate? does setscene task create
pkgdata with right paths?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IpgPcFyQO6wM49Um
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGmJcoACgkQN1Ujt2V2gBwa5wCgqoqhWjtJJM5DYv7I73jx0eAx
GZYAoJpoYWIXUf9jEc+LUxnjU6t1pYKK
=B1PX
-----END PGP SIGNATURE-----

--IpgPcFyQO6wM49Um--
