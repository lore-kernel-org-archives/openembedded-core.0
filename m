Return-Path: <Peter.Marko@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2A9782DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 10:50:27 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v7OAoR9s001931
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 24 Aug 2017 12:50:27 +0200
Received: from ATNETS9912ZMSX.ww300.siemens.net
	(atnets9912zmsx.ww300.siemens.net [158.226.163.52])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTPS id v7OAoR0A006850
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 24 Aug 2017 12:50:27 +0200
Received: from ATVIES991UAMSX.ww300.siemens.net ([169.254.1.6]) by
	ATNETS9912ZMSX.ww300.siemens.net ([158.226.163.52]) with mapi id
	14.03.0361.001; Thu, 24 Aug 2017 12:50:27 +0200
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] staging: add missing import errno to
	staging_populate_sysroot_dir
Thread-Index: AQHTHAmxFCPt6qIG5kqHXRnf6Z2wM6KTU0CA
Date: Thu, 24 Aug 2017 10:50:26 +0000
Message-ID: <6D4566C9E07A8D4DAB6F935696920A84244DDB59@ATVIES991UAMSX.ww300.siemens.net>
References: <1503490589-19310-1-git-send-email-peter.marko@siemens.com>
In-Reply-To: <1503490589-19310-1-git-send-email-peter.marko@siemens.com>
Accept-Language: sk-SK, de-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.10]
MIME-Version: 1.0
Subject: Re: [PATCH] staging: add missing import errno to staging_populate_sysroot_dir
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
X-List-Received-Date: Thu, 24 Aug 2017 10:50:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Could this be queued also to pyro branch?
It's commit ID b1e482ae20b9c714f4089d4da6470d041242e441

Thanks,
  Peter

> Fixes error "Exception: NameError: name 'errno' is not defined"
> during build-sysroots.bb:do_build_target_sysroot
>=20
> Signed-off-by: Marko, Peter <peter.marko@siemens.com>
> ---
>  meta/classes/staging.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass =
index 162c8e9..9d3d2ad 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -177,6 +177,7 @@ def staging_processfixme(fixme, target, recipesysroot=
, recipesysrootnative, d):
>  def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d=
):
>      import glob
>      import subprocess
> +    import errno
> =20
>      fixme =3D []
>      postinsts =3D []
> --
> 2.1.4


