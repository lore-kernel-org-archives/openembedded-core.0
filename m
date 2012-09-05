Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9B8u-0000X2-NF
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 10:39:24 +0200
Received: by weyr6 with SMTP id r6so244047wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S68dwRrA2fVZDvqHh9eJTAhhXe2jw6EPnID/rhXGY70=;
	b=dgeJ0g1wpSRjSscvcMxoe5YA0sJRvXa1nMhdi7T0222fz7GQtzVxVTTLsVkw44tLLa
	nNwiabhFMzX3YZQhLxhu/wlb1qqUcOoCPJTezeoWhlCubO2hTxOCnUuNHccqFZNs63+u
	iOeLRac9ZLJR8gXTHek93b6oTzLneJTSozTlgCXpgcOH5B6ocvEepmZGy78lVHjiHsGh
	exXg3BjKj9q5b3FAKLav8gGLlAiUX+pLPDm7xU6gnu+btyacGWC4f2VtymonCPDlVP0p
	Y4MpWrElLxfbEb7XSTC1Vv72SI7gurhEoRsfDZf6mhqsay8nlG5m+MFOmtMVvedY8FPo
	RtQw==
Received: by 10.216.140.213 with SMTP id e63mr13597584wej.48.1346833622106;
	Wed, 05 Sep 2012 01:27:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm27955116wib.2.2012.09.05.01.26.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 01:26:59 -0700 (PDT)
Date: Wed, 5 Sep 2012 10:27:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Message-ID: <20120905082729.GM3372@jama.jama.net>
References: <cover.1346829716.git.kai.kang@windriver.com>
	<5005901e3eda3b6c290bf31f2b2c73dbc4ccef39.1346829716.git.kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5005901e3eda3b6c290bf31f2b2c73dbc4ccef39.1346829716.git.kai.kang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 9/9] task-core-lsb.bbappend: add bbappend file
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
X-List-Received-Date: Wed, 05 Sep 2012 08:39:24 -0000
X-Groupsio-MsgNum: 28708
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JlJsEFsx9RQyiX4C"
Content-Disposition: inline

--JlJsEFsx9RQyiX4C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2012 at 03:32:48PM +0800, Kang Kai wrote:
> Add file task-core-lsb.bbappend. Packages added in layer meta-lsb should
> put in this file.
>=20
> Add package wget and perl modules.
>=20
> LSB needs wget to download packages. But wget provided by busybox doesn't
> support some options such as '-N'.
>=20
> LSB perl test 4.1.6-2 case all/tst_perlModPresent.pl,
> ../lib/Class/ISA/t/00_about_verbose and
> ../lib/Class/ISA/t/01_old_junk.t
> fail because of lack of these modules, add them to make test pass.
>=20
> [Yocto #3030 #3031]

This probably needs to be renamed to packagegroup already, current
master has
=2E/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb

>=20
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  meta-lsb/recipes-core/tasks/task-core-lsb.bbappend |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 meta-lsb/recipes-core/tasks/task-core-lsb.bbappend
>=20
> diff --git a/meta-lsb/recipes-core/tasks/task-core-lsb.bbappend b/meta-ls=
b/recipes-core/tasks/task-core-lsb.bbappend
> new file mode 100644
> index 0000000..f964481
> --- /dev/null
> +++ b/meta-lsb/recipes-core/tasks/task-core-lsb.bbappend
> @@ -0,0 +1,15 @@
> +#
> +# Copyright (c) 2012 Wind River Systems, Inc.
> +#
> +
> +RDEPENDS_task-core-lsb-command-add_append +=3D "wget"
> +
> +RDEPENDS_task-core-lsb-runtime-add_append +=3D "\
> +    libclass-isa-perl \
> +    libenv-perl \
> +    libdumpvalue-perl \
> +    libfile-checktree-perl \
> +    libi18n-collate-perl \
> +    libpod-plainer-perl"
> +
> +
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JlJsEFsx9RQyiX4C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBHDPEACgkQN1Ujt2V2gBzjCQCfcvOU2jZq/M4G1m/5HjFe9Lk6
hOoAoJyzzt0vJVq58WUrvI8DsPwQxaTj
=Lm22
-----END PGP SIGNATURE-----

--JlJsEFsx9RQyiX4C--
