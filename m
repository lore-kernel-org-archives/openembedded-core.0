Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id EB7436BB32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:55:40 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so2093818eae.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 00:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jb5zZ9wdzVJjfryc65jV2Q0Fd/WfAjbAlH3VppGPG2c=;
	b=PM+AR9hhGKt6KPYmi7odEhKSSlVUKYmPe3dAHOBd6MURG5XEHFfc0DiyfggMKRKhmE
	f3nwEuvj5EgUp44S9euN1pbwDMO2IjonwLrS9iyPdohshaPjnvySleO0UqlOUI85KiC9
	MVaxaNC5qUdbvmBW3jEjiiTkAjTj89ds6lWM3Z5Dhz55gFQY0Ke345ObVJaqOjFD/7iC
	964Phuqws8+PJ0PKCG0hD2cb4k4UXU9f2lHpeRGFByOAzL91sNVayzWbcbmTe6CyBI8e
	XoKfnve0+yDZEhEm3MmyZcZy823Vn3/nluubyTJbGmOOK8gYOPz1k4Q0vbSr5MWj0Yu0
	/SVA==
X-Received: by 10.15.55.133 with SMTP id v5mr82351eew.96.1377590141387;
	Tue, 27 Aug 2013 00:55:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm27041197eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 00:55:40 -0700 (PDT)
Date: Tue, 27 Aug 2013 09:56:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20130827075651.GX3544@jama>
References: <cover.1377554229.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1377554229.git.bruce.ashfield@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] linux-yocto: add bc-native and linux-yocto-dependency
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
X-List-Received-Date: Tue, 27 Aug 2013 07:55:41 -0000
X-Groupsio-MsgNum: 44105
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fqQSV+MVmQEkpBtA"
Content-Disposition: inline

--fqQSV+MVmQEkpBtA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 06:00:11PM -0400, Bruce Ashfield wrote:
> Richard/Saul,
>=20
> As reported by Martin Jansa, the following error happens when building in=
 a
> minimal environment:
>=20
>    |   BC      kernel/timeconst.h
>    | /bin/sh: bc: command not found
>    | make[3]: *** [kernel/timeconst.h] Error 127
>    | make[2]: *** [kernel] Error 2
>    | make[2]: *** Waiting for unfinished jobs....
>=20
> kernel commit 70730bca [kernel: Replace timeconst.pl with a bc script] ad=
ded
> a kernel dependency on bc. To support the build of linux-yocto recipes in
> these configurations, we add bc-native to the common dependencies.
>=20
> I didn't go so far as to add the dependency to the base kernel bbclass,
> since not all kernels will be of the right version to trigger this depend=
ency,
> but we can consider doing that in the future.
>=20
> I'm not packaging/native tool expert, but I think I added bc-native prope=
rly,
> and it worked here. But obviously, correct me if I'm wrong.

I've used the same change for bc yesterday to build it, so:

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Cheers,
>=20
> Bruce
>=20
>=20
> The following changes since commit dcc23c073ef936eccecdc16f973492f41c44de=
f7:
>=20
>   kern-tools: fix patch series to git tree validation (2013-08-26 13:57:2=
0 -0400)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib zedd/kernel-bc
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel-bc
>=20
> Bruce Ashfield (2):
>   bc: add bc-native
>   linux-yocto: add bc-native dependency, and move to linux-yocto.inc
>=20
>  meta/recipes-extended/bc/bc_1.06.bb                |    2 ++
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    3 ---
>  meta/recipes-kernel/linux/linux-yocto.inc          |    2 ++
>  3 files changed, 4 insertions(+), 3 deletions(-)
>=20
> --=20
> 1.7.10.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fqQSV+MVmQEkpBtA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIcW8MACgkQN1Ujt2V2gBwz2ACeN6X1sjutyBTZBATFGlZSlSPp
UE4An2xNAAeTgp2Inv/zpG+yxvuvkZPg
=wvEC
-----END PGP SIGNATURE-----

--fqQSV+MVmQEkpBtA--
