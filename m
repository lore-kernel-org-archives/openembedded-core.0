Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 75F397823F;
	Tue, 22 Aug 2017 14:29:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 22 Aug 2017 07:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,412,1498546800"; d="scan'208";a="143235333"
Received: from jshtaway-mobl.amr.corp.intel.com ([10.254.23.190])
	by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2017 07:29:27 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <20170822132022.GA3308@jama>
Date: Tue, 22 Aug 2017 07:29:26 -0700
Message-Id: <77D41A06-7D48-4CFE-948E-5C3D36118CA0@linux.intel.com>
References: <20170822132022.GA3308@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2017-08-19
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
X-List-Received-Date: Tue, 22 Aug 2017 14:29:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Aug 22, 2017, at 6:20 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> Openssl was reverted back to 1.0 version being default, so there is
> fewer errors now, but there was also a fix for package.bbclass:
> =
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/1411=
27.html
> which causes many do_package_qa tasks to fail.
>=20
> Please help by sending fixes for issues it found.
>=20
> <snip>
>=20
> =3D=3D Failed tasks 2017-08-19 =3D=3D
>=20
> INFO: jenkins-job.sh-1.8.25 Complete log available at =
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170822_0=
23550.log
>=20
> =3D=3D=3D common (15) =3D=3D=3D
> <snip>
>    * =
meta-openembedded/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.=
31.bb:do_package_qa

I=E2=80=99ll take a shot at this one, especially since this recipe =
version is very old. Latest is 0.4224.

>    * =
meta-openembedded/meta-python/recipes-devtools/python/python3-pylint_1.6.5=
.bb:do_package_qa
>    * =
meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.=
1.0.bb:do_compile

I=E2=80=99ll take a shot at these two. pylint version is a bit old, =
latest is 1.7.2. matplotlib latest version is 2.0.2, so this recipe is =
very old; also needs python3 version.

> <snip>


