Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SkMUf-0005h9-KB; Thu, 28 Jun 2012 23:43:17 +0200
Received: by werg55 with SMTP id g55so1756507wer.6
	for <multiple recipients>; Thu, 28 Jun 2012 14:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=og5N9jEEwa0LZdLKDUcv0FDAr6PVWySSjMBQiVMlbaw=;
	b=UpTwd1LvZzQF64Hh5i9lADlK1gLkgW2XPtg+gv5SidYrm5KdUynhuWblj6TGto1IF4
	/VU53iV30RCKelxrFfUSa38/uDtxsMnu+ooELP3bFxdiBqH/RrMxFGEbkmo0b3n0FigM
	jHJ5J51sHOUrV66i5xo6MsYjV58mIJdeK7ST/KXXa1qhUGEG/WnTYg0s1n97ZEyAHjAv
	XVaj7mzS7JahIr/p8F+1txLU6e8NZXkZWNVQoq7x8DVJxNlKx/Q9aB2ZRPRlGdHX94I9
	vIxN1gNtbaPIYpLmzqsbM5TPS8xjt+BDPxd20g0UwVxv/uH6CUDQnizABllJzE3F3187
	IGGA==
Received: by 10.180.87.232 with SMTP id bb8mr383653wib.0.1340919142740;
	Thu, 28 Jun 2012 14:32:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm2471436wib.5.2012.06.28.14.32.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 14:32:21 -0700 (PDT)
Date: Thu, 28 Jun 2012 23:32:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120628213215.GC3961@jama.jama.net>
References: <20120628152441.4D5571032F@opal>
MIME-Version: 1.0
In-Reply-To: <20120628152441.4D5571032F@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: add buildall and robustness fixes
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
X-List-Received-Date: Thu, 28 Jun 2012 21:43:17 -0000
X-Groupsio-MsgNum: 24266
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline

--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 03:24:41PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: be3cff86d55db6255e036d68e943e527802b4f4c
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dbe3cff86d55db6255e036d68e943e527802b4f4c
>=20
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date:   Fri Jun 15 15:26:44 2012 -0400
>=20
> kern-tools: add buildall and robustness fixes
>=20
> Updating the kern-tools SRCREV to pickup the following functionality:
>=20
>  - buildall: provides the ability to build all kernel branches
>              without a build system, only a cross compiler and configme
>              are required.
>=20
>  - robustness/cleanups: obselete/unused code removal and general robustne=
ss
>                         fixes from Paul Gortmaker and Bruce Ashfield

is this expected with latest kern-tools/linux-yocto and qemux86-64?

NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533c=
d0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_configchec=
k: Start
ed
NOTE: validating kernel configuration
find: warning: -path /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux=
-yocto/linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1=
cdb60720c452c3965eaec3ec2cd10f06261cc5-r0/linux/ will not match anything be=
cause it ends with /.
This BSP sets 1 kernel options that are possibly non-hardware related.
The full list can be found in your kernel src dir at:
meta/cfg/standard/common-pc-64/specified_non_hdw.cfg

There were 1 instances of config fragment errors.
The full list can be found in your kernel src dir at:
meta/cfg/standard/common-pc-64/fragment_errors.txt

NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533c=
d0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_configchec=
k: Succeeded


OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto=
-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c3965e=
aec3ec2c
d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/specified_non_hd=
w.cfg
CONFIG_BLOCK
OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto=
-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c3965e=
aec3ec2c
d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/fragment_errors.=
txt
Warning: Value of CONFIG_NET_CLS_CGROUP is defined multiple times within fr=
agment meta/cfg/kernel-cache/features/net_sched/net_sched.cfg:
CONFIG_NET_CLS_CGROUP=3Dy
CONFIG_NET_CLS_CGROUP=3Dy

Cheers,

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/szV8ACgkQN1Ujt2V2gBxZdgCfVopbJO4QAzBDAmOs89rfi4F0
tQwAnAw5BDs0BHTa+VcusdylWmnm20f2
=HYWW
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
