Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8D96FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:05:09 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f206so17634667wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 04:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0zaRCqzpaQ1VVyzKL796a9lB6eRDjnsC0x1+DPWFKv4=;
	b=lGuCUkJQ1ZeElBQiwrpyA1tYxCQoqakq1aIuZwvP+49jmRzteVZiz+7VSzeDywSRA1
	k1l9ps1uE2mUf5UzxM57/4dY4DBxtzFCMC5XrZLDsON5RR0BxKzazAz3GPS5t8JvTk00
	rU7hlIJAxE9fO2SVE3wgQNRJwvLv9zRbPKho6K71Mn91M9dYR0c73Rt7L45aEj24MVGX
	NE6x1jIaLLpxN8WNL0VKVIjMlAYIQxepQZG21jXN689BpX4SOtaFTpiNH/aJGU7krdF4
	XgNZS3ycs4c1FHF0idJhSSQcxNBNkeG10/mpiAjeFhh5UxlyMXRGsd7nyC5xnCb5e/nn
	+wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=0zaRCqzpaQ1VVyzKL796a9lB6eRDjnsC0x1+DPWFKv4=;
	b=Crabh1p/0bNNqmbTdDeRoIbAgv+3xeNa+RBWLiVyHp7gx8TNuUltZxAJ+dyxOP7xT+
	rfKTt93VLj8NBFVCoCwzhNeDwpgX016RcTb5Gi2E+U+lVEoOBpkE/9EpuPtI0eCQQsEU
	tcTF30DrOacCSBgS/reogWzrYw19wbWyVN1fVrTIKTqoJh4j0PovYFHuizhptATSYUgF
	wQAz0LQACVz/MfVEz+c16twxJCFns3C+f8BtCqXG6f6lQ1sfwkb34D2Dq4BfpV+p44IO
	EIg3luxtZRj3jk3UjrkNZvb76R9hJPFolChDqxZnXYyFS+gAMBAzwrdp/FQiadCury3B
	5Pbw==
X-Gm-Message-State: AG10YOS0Pk2OJAaVs1x/S9pVN2Lcu98uM2A71B0Csi5XtevphZVZOhP62FJuTdXe2opuVQ==
X-Received: by 10.28.3.134 with SMTP id 128mr2844058wmd.92.1452859510135;
	Fri, 15 Jan 2016 04:05:10 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	g187sm2253018wmf.8.2016.01.15.04.05.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jan 2016 04:05:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Jan 2016 13:06:05 +0100
To: Joshua Lock <joshua.lock@collabora.co.uk>,
	openembedded-core@lists.openembedded.org
Message-ID: <20160115120605.GA2607@jama>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1449754339.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][fido][RESEND 0/5] Backports for fido
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
X-List-Received-Date: Fri, 15 Jan 2016 12:05:09 -0000
X-Groupsio-MsgNum: 76144
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 02:48:16PM +0100, Martin Jansa wrote:
> The following changes since commit 9f339f516ab03d598fae0e536b3a420ea4d8ee=
1a:
>=20
>   bash: Disable custom memory allocator (2015-11-20 15:46:27 +0000)

PING

>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib jansa/fido-backpor=
ts
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Djansa/fido-backports
>=20
> Martin Jansa (2):
>   texinfo: don't create dependency on INHERIT variable
>   linux-dtb.inc: drop unused DTB_NAME variable from do_install
>=20
> Mike Crowe (1):
>   allarch: Force TARGET_*FLAGS variable values
>=20
> Richard Purdie (2):
>   layer.conf: Add several allarch dependency exclusions
>   layer.conf: Add missing dependency for allarch package
>     initramfs-framework
>=20
>  meta/classes/allarch.bbclass                 |  4 ++++
>  meta/conf/layer.conf                         | 11 +++++++++++
>  meta/recipes-extended/texinfo/texinfo_5.2.bb |  2 +-
>  meta/recipes-kernel/linux/linux-dtb.inc      |  1 -
>  4 files changed, 16 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.6.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaY4KwACgkQN1Ujt2V2gBxfywCfZQ4nFBORhVEtbfB1sWKGZQQx
I4oAn19dLNFhCNLNc2Sp+omQ6exUV4lg
=PoMG
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
