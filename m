Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2E09E6FCE0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 10:51:46 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id pv20so14837610lab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+IdR0srzFVrpAi39F3wtH9Jjpjw2eet105K/p3VLFek=;
	b=bgXxSZQAQwXgB6+4zBKyCSbW+ZBE+KYAqHcyMOyBI6r/4qHj8Qx94eZxxDd3qVEeaf
	eT4B6Kw6yatb/rjOetp0rt/yNGvwwIuyVVFAscVkwMNro2gAvUQdBDMkRS01SLesLyIa
	WCYk+j6ZIzr/Sskn7HG49jas1Dt/laMigFMXEryLCXeZDxrjpwHCIqjXiIL4wcKQZSg4
	45qjFELk2DWrLR4B/ZQBmvDgfnVxyoxMf1vF9OnlHLwyYrqZJhB76FfdbRmBBlfPqNV3
	/Ob4jPx9upKWxoyS3qRmp1C4qRUqQ0hXu29REsTVWbIfKMThUHjfHVqejF3e7RY1R5rR
	ZCPQ==
X-Received: by 10.112.33.14 with SMTP id n14mr1957188lbi.99.1409050306923;
	Tue, 26 Aug 2014 03:51:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	my10sm4621092lbb.9.2014.08.26.03.51.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Aug 2014 03:51:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 Aug 2014 12:51:49 +0200
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20140826105149.GV20524@jama>
References: <cover.1409007366.git.chris_larson@mentor.com>
	<483e2f9eb1085db0958bb1ef9184814766bbd214.1409007366.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <483e2f9eb1085db0958bb1ef9184814766bbd214.1409007366.git.chris_larson@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 1/3] sanity: handle both \n and \\n in mirror vars
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
X-List-Received-Date: Tue, 26 Aug 2014 10:51:50 -0000
X-Groupsio-MsgNum: 56962
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GrZJL/A7LJaW37J8"
Content-Disposition: inline

--GrZJL/A7LJaW37J8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2014 at 03:57:42PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/sanity.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index dbcc26b..7cfc4be 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -759,7 +759,7 @@ def check_sanity_everybuild(status, d):
>          'git://', 'gitsm://', 'hg://', 'osc://', 'p4://', 'svk://', 'svn=
://', \
>          'bzr://', 'cvs://']
>      for mir_type in mir_types:
> -        mirros =3D (d.getVar(mir_type, True) or '').split('\\n')
> +        mirros =3D (d.getVar(mir_type, True) or '').replace('\\n', '\n')=
=2Esplit('\n')

Would you mind fixing the typo in variable name as well?

>          for mir in mirros:
>              mir_list =3D mir.split()
>              # Should be two members.
> --=20
> 1.8.3.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GrZJL/A7LJaW37J8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP8ZsUACgkQN1Ujt2V2gBypigCgqj6A8jdlEvt9Sf2bWbTQFHto
LIUAn0A4pLKcxgKcMOTEzqdcCNdgRvJR
=GnlR
-----END PGP SIGNATURE-----

--GrZJL/A7LJaW37J8--
