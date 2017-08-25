Return-Path: <Peter.Marko@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD9D783A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 06:23:31 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v7P6NVBS031272
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 25 Aug 2017 08:23:31 +0200
Received: from ATVIES991U8MSX.ww300.siemens.net
	(atvies991u8msx.ww300.siemens.net [158.226.163.42])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTPS id v7P6NVqU014451
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Aug 2017 08:23:31 +0200
Received: from ATVIES991UAMSX.ww300.siemens.net ([169.254.1.6]) by
	ATVIES991U8MSX.ww300.siemens.net ([158.226.163.42]) with mapi id
	14.03.0361.001; Fri, 25 Aug 2017 08:23:30 +0200
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core][pyro][PATCH] staging: add missing import errno to
	staging_populate_sysroot_dir
Thread-Index: AQHTHWjh4H61rT9v/0KB1TRHsBu1xKKUmfaw
Date: Fri, 25 Aug 2017 06:23:30 +0000
Message-ID: <6D4566C9E07A8D4DAB6F935696920A84244DE137@ATVIES991UAMSX.ww300.siemens.net>
References: <1503641416-14607-1-git-send-email-peter.marko@siemens.com>
In-Reply-To: <1503641416-14607-1-git-send-email-peter.marko@siemens.com>
Accept-Language: sk-SK, de-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.10]
MIME-Version: 1.0
Subject: Re: [pyro][PATCH] staging: add missing import errno to staging_populate_sysroot_dir
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
X-List-Received-Date: Fri, 25 Aug 2017 06:23:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Fixes error "Exception: NameError: name 'errno' is not defined"
> during build-sysroots.bb:do_build_target_sysroot
>
> Signed-off-by: Marko, Peter <peter.marko@siemens.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Sorry for this sign off, I was cherry picking instead of patching.
I can send v2 without it if it is a problem.

Peter

> ---
>  meta/classes/staging.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass =
index a0b74a2..67f7b3d 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -259,6 +259,7 @@ def staging_processfixme(fixme, target, recipesysroot=
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


