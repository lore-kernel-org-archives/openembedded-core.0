Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 763B6705A7;
	Sun, 20 Jul 2014 14:01:58 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so2848862wib.14
	for <multiple recipients>; Sun, 20 Jul 2014 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fNrOQ6tkp/TdVKZpVOdKmezMdxxxFmxXWWM9onr+zTc=;
	b=ipNEguQGNmDVjuxk3/LuOk6JDGSTDQUJA+mXhs8hqHv4o8JpL7QjhW2/ThEkAALF89
	ytsRjCSoaNNU5oIpFrg7Eh+d9spGLrooY4/iWcPG0ky6g/xXnmWISBC5g9B4Kw+LTYqp
	6CRjGrfa82NQw1YMNYt/kh9NJ8T+PBxaUaueRY7KQOm7ZCrOA/S4BY33CeXMpynE3ac6
	PTZeGvk+1D8yvPTO6sERjlvg8hpIp0woVyE2D/dPby72PvLmrciB0NRWpkySW6XfTmJI
	LHRAJf6byT+VTl4FwzcHe4duKfep2BLNbg7IKWPwZxH1pdgFtgb09NKIFdDRRvYD79oG
	JhhA==
X-Received: by 10.194.22.201 with SMTP id g9mr13392883wjf.98.1405864919336;
	Sun, 20 Jul 2014 07:01:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fc7sm29915773wjc.37.2014.07.20.07.01.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 07:01:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 20 Jul 2014 16:02:13 +0200
To: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20140720140213.GA12193@jama>
References: <20140618094425.8523A504AA@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140618094425.8523A504AA@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : lttng-modules: update to 2.4.1-stable latest
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
X-List-Received-Date: Sun, 20 Jul 2014 14:02:06 -0000
X-Groupsio-MsgNum: 55239
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2014 at 09:44:25AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: bb304f306c0f6ee496a75a67c0bb8a6c1e41ddf2
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dbb304f306c0f6ee496a75a67c0bb8a6c1e41ddf2
>=20
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date:   Tue Jun 17 21:29:51 2014 -0400
>=20
> lttng-modules: update to 2.4.1-stable latest
>=20
> The 3.15, and 3.14.5+ kernels introduced a change to trace_block_rq_compl=
ete,
> which triggers the following build error:
>=20
>     probes/../instrumentation/events/lttng-module/../../../probes/lttng-e=
vents.h:151:6:
>     error: conflicting types for 'trace_block_rq_complete'
>     |  void trace_##_name(_proto);
>     |       ^
>     |
>     probes/../instrumentation/events/lttng-module/../../../probes/lttng-e=
vents.h:117:2:
>     note: in expansion of macro 'DEFINE_EVENT_MAP'
>     |   DEFINE_EVENT_MAP(template, name, name, PARAMS(proto), PARAMS(args=
))
>     |   ^
>     |
>     probes/../instrumentation/events/lttng-module/../../../probes/../inst=
rumentation/events/lttng-module/block.h:235:1:
>     note: in expansion of macro 'DEFINE_EVENT'
>     |  DEFINE_EVENT(block_rq_with_error, block_rq_complete,
>=20
> The lttng 2.4.x-stable branch contains the fix (and several other small f=
ixes), so
> we bump the SRCREV to import the change.

We still have lttng-modules 2.3.3 in oe-core which still suffers from
this issue, can you please drop or fix them?

2.3.3 is used by default for qemuarm, because of this in 2.4.1:
# lttng currently blacklists arm with gcc-4.8
COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips).*-linux'

The issue was already reported 7 times in world status builds.

|   CC [M]  /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linu=
x-gnueabi/lttng-modules/2.3.3-r0/git/probes/lttng-probe-block.o
| In file included from /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qem=
uarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/../instrumentation/=
events/lttng-module/../../../probes/define_trace.h:148:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qem=
uarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/../instrumentation/=
events/lttng-module/block.h:932,
|                  from /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qem=
uarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/lttng-probe-block.c=
:41:
| /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/=
lttng-modules/2.3.3-r0/git/probes/../instrumentation/events/lttng-module/..=
/../../probes/lttng-events.h:151:6: error: conflicting types for 'trace_blo=
ck_rq_complete'
|  void trace_##_name(_proto);
|       ^
| /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/=
lttng-modules/2.3.3-r0/git/probes/../instrumentation/events/lttng-module/..=
/../../probes/lttng-events.h:117:2: note: in expansion of macro 'DEFINE_EVE=
NT_MAP'
|   DEFINE_EVENT_MAP(template, name, name, PARAMS(proto), PARAMS(args))
|   ^
| /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/=
lttng-modules/2.3.3-r0/git/probes/../instrumentation/events/lttng-module/..=
/../../probes/../instrumentation/events/lttng-module/block.h:235:1: note: i=
n expansion of macro 'DEFINE_EVENT'
|  DEFINE_EVENT(block_rq_with_error, block_rq_complete,
|  ^
| In file included from include/linux/module.h:18:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qem=
uarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/lttng-probe-block.c=
:23:
| include/linux/tracepoint.h:168:21: note: previous definition of 'trace_bl=
ock_rq_complete' was here
|   static inline void trace_##name(proto)    \
|                      ^
| include/linux/tracepoint.h:265:3: note: in expansion of macro '__DECLARE_=
TRACE'
|    __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
|    ^
| include/linux/tracepoint.h:399:2: note: in expansion of macro 'DECLARE_TR=
ACE'
|   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
|   ^
| include/trace/events/block.h:143:1: note: in expansion of macro 'TRACE_EV=
ENT'
|  TRACE_EVENT(block_rq_complete,
|  ^
| make[3]: *** [/home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-=
linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/lttng-probe-block.o] Error 1
| make[2]: *** [/home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-=
linux-gnueabi/lttng-modules/2.3.3-r0/git/probes] Error 2
| make[1]: *** [_module_/home/jenkins/oe/world/shr-core/tmp-eglibc/work/qem=
uarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git] Error 2
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-eglibc/sy=
sroots/qemuarm/usr/src/kernel'
| make: *** [default] Error 2

>=20
> Build tested against 3.14 and 3.10.
>=20
> [YOCTO #6459]
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb b/meta/reci=
pes-kernel/lttng/lttng-modules_2.4.1.bb
> index 4ef74dd..5e05ffc 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
> @@ -10,7 +10,7 @@ DEPENDS =3D "virtual/kernel"
> =20
>  inherit module
> =20
> -SRCREV =3D "afdc6b155161f209fcfadc5288dc017ceab56353"
> +SRCREV =3D "a0383def517e3aebbbcebae61fe2bcfb50d31e71"
>  PV =3D "2.4.1"
> =20
>  # lttng currently blacklists arm with gcc-4.8
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPLy+UACgkQN1Ujt2V2gByRgwCfSLRknFhudqaajrWO93BJq543
ZKsAoIK9z7vE7o3+T8zaFLUPp5uLyxjv
=ixu0
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
