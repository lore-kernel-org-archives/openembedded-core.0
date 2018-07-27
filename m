Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id C603D78C97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 03:36:44 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id e13-v6so1254250pff.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 20:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=zCu6snuxZ4bTSiMU7Ffp9IKzav2Y08WmLHjLMN6MtfA=;
	b=hAd8C6+s4wAFu83ug4dYl5Jh6/87NMAnUgda13HFZzGr9QVzexpu7yqXWXH0kypMbo
	t9I1C2FEY19okKf95TofOgRCQBKBcC6hjZPx2LRLJVd4JzfbPaoln6b5o+WhL9MT49NN
	1wnD7nhxmRtoRDNfBjiAqhl0jrvCtilduYw1mQpZqyqOuwmdM3OuDsXlD1sXJYuGMcD6
	+vP3177MiK8wl6G0AvgmeTn4QulNvsFFZWNXh3l0VQpni82gvi/ZYdmmDj62HCme9K+h
	FUvmFq8HFAXrAE0XitOOTVXBCOnnRequ2FVQjV94dcKLYSQo2uiPdMTG2c3edDSNJ6T7
	OZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=zCu6snuxZ4bTSiMU7Ffp9IKzav2Y08WmLHjLMN6MtfA=;
	b=MLB16d+oBWFWt9SDmKnqypj1IOjxKmOeQhMDdjTMsGik9Opki3ZpbylF+F2iCSLHYf
	yE+I0u5kJO0zvromCNQ/CH4+CwBiWdqaZnR5eqzJaVvpmXLEHtCVRnSKqErjY2NicN1K
	BeijRgN0eURTt5um3xH3DmiVBlgbnXB4ax88L5sy3T2LwsY7TnNsiJKPXUW+RzALDxT4
	s23SCwn0mDBmnZjEXV4K2Wzl+4gkzY11jF7m6vo7IOq9lCJoZenUUn2KoUo4Lhp6XgHE
	c9iz+KY5M9RGGS+awVxlm2MDixN2RtXRFVaIafriu+DMuY1n/CZ1LcZYbXp2Pm139yQ7
	vkzg==
X-Gm-Message-State: AOUpUlF37fMrGmXYgXN5JPkmyDEpcgfhMYp489gJhwbBhC1uuKMkiK6Q
	PFQyXXKeUQc3AjvQyP8LYnxKg1vp
X-Google-Smtp-Source: AAOMgpfCaWZq1h6aSy51ExuS25lCHKQXiDrWWvxYIXHQna8scz8pOA1p9VBLc1cPbJ7JfJbi1oZDXA==
X-Received: by 2002:a65:608b:: with SMTP id
	t11-v6mr4409668pgu.259.1532662605330; 
	Thu, 26 Jul 2018 20:36:45 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:fdce:954b:eac0:24ad])
	by smtp.gmail.com with ESMTPSA id
	p19-v6sm8203082pgh.60.2018.07.26.20.36.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 20:36:44 -0700 (PDT)
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
References: <1532534751-5871-1-git-send-email-alejandr@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <72c0ba68-7fa5-2e3a-a554-e79bff93a00b@gmail.com>
Date: Thu, 26 Jul 2018 20:36:38 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1532534751-5871-1-git-send-email-alejandr@xilinx.com>
Subject: Re: [PATCH 2/2] multiconfig: Enable multiconfig dependencies on oe-core
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
X-List-Received-Date: Fri, 27 Jul 2018 03:36:44 -0000
X-Groupsio-MsgNum: 113996
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="4io4TCjcIL7AdI40i3e7G4kTACk27HRg4"

--4io4TCjcIL7AdI40i3e7G4kTACk27HRg4
Content-Type: multipart/mixed; boundary="RwAbmC4aRNw3rpB8vMwaabNxjD4tfslXT";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alejandro Enedino Hernandez Samaniego
 <alejandro.enedino.hernandez-samaniego@xilinx.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <72c0ba68-7fa5-2e3a-a554-e79bff93a00b@gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] multiconfig: Enable multiconfig
 dependencies on oe-core
References: <1532534751-5871-1-git-send-email-alejandr@xilinx.com>
In-Reply-To: <1532534751-5871-1-git-send-email-alejandr@xilinx.com>

--RwAbmC4aRNw3rpB8vMwaabNxjD4tfslXT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/25/18 9:05 AM, Alejandro Enedino Hernandez Samaniego wrote:
> This patch enables multiconfig dependencies (mcdepends) to be used on
> recipes using the following format:
>=20
> task[mcdepends] =3D "multiconfig:FROM-MC:TO-MC:PN:task-to-depend-on"
>=20
> For the sake of simplicity consider the following example:
>=20
> Assuming we have set up multiconfig builds, one for qemux86 and one for=

> qemuarm, named x86 and arm respectively.
>=20
> Adding the following line to an image recipe (core-image-sato):
> do_image[mcdepends] =3D "multiconfig:x86:arm:core-image-minimal:do_root=
fs"
>=20

Do we really need to add multiconfig to keyword namespace ? can we
deduce this from "arch1:arch2:..."

secondy, this need to be well documented, with examples for users

> Would state that core-image-sato:do_image from x86 will depend on
> core-image-minimal:do_rootfs from arm so it can be executed.
>=20
> This patch makes modifications to bitbake.conf to enable mcdepends, and=

> to sstatesig and staging.bbclass to avoid conflicts between packages fr=
om
> different multiconfigs.
>=20
> [YOCTO #10681]
>=20
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.c=
om>
> ---
>  meta/classes/staging.bbclass | 8 +++++++-
>  meta/conf/bitbake.conf       | 2 +-
>  meta/lib/oe/sstatesig.py     | 9 ++++++++-
>  3 files changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclas=
s
> index 41df883..27b012e 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -256,7 +256,7 @@ python extend_recipe_sysroot() {
>      workdir =3D d.getVar("WORKDIR")
>      #bb.warn(str(taskdepdata))
>      pn =3D d.getVar("PN")
> -
> +    mc =3D d.getVar("BB_CURRENT_MC")
>      stagingdir =3D d.getVar("STAGING_DIR")
>      sharedmanifests =3D d.getVar("COMPONENTS_DIR") + "/manifests"
>      recipesysroot =3D d.getVar("RECIPE_SYSROOT")
> @@ -443,7 +443,13 @@ python extend_recipe_sysroot() {
> =20
>      msg_exists =3D []
>      msg_adding =3D []
> +
>      for dep in configuredeps:
> +        if mc !=3D 'default':
> +            # We should not care about other multiconfigs
> +            depmc =3D dep.split(':')[1]
> +            if depmc !=3D mc:
> +                continue
>          c =3D setscenedeps[dep][0]
>          if c not in installed:
>              continue
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e28f3c7..f68954c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -877,7 +877,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?=3D "doc deps depends \=

>      file-checksums python func task export unexport noexec nostamp dir=
s cleandirs \
>      sstate-lockfile-shared prefuncs postfuncs export_func deptask rdep=
task \
>      recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename=
 lineno \
> -    progress"
> +    progress mcdepends"
> =20
>  MLPREFIX ??=3D ""
>  MULTILIB_VARIANTS ??=3D ""
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 5dcc2f5..18c5a35 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -150,16 +150,23 @@ class SignatureGeneratorOEBasicHash(bb.siggen.Sig=
natureGeneratorBasicHash):
>          if recipename in self.unlockedrecipes:
>              unlocked =3D True
>          else:
> +            def get_mc(tid):
> +                tid =3D tid.rsplit('.', 1)[0]
> +                if tid.startswith('multiconfig:'):
> +                    elems =3D tid.split(':')
> +                    return elems[1]
>              def recipename_from_dep(dep):
>                  # The dep entry will look something like
>                  # /path/path/recipename.bb.task, virtual:native:/p/foo=
=2Ebb.task,
>                  # ...
> +
>                  fn =3D dep.rsplit('.', 1)[0]
>                  return dataCache.pkg_fn[fn]
> =20
> +            mc =3D get_mc(fn)
>              # If any unlocked recipe is in the direct dependencies the=
n the
>              # current recipe should be unlocked as well.
> -            depnames =3D [ recipename_from_dep(x) for x in deps ]
> +            depnames =3D [ recipename_from_dep(x) for x in deps if mc =
=3D=3D get_mc(x)]
>              if any(x in y for y in depnames for x in self.unlockedreci=
pes):
>                  self.unlockedrecipes[recipename] =3D ''
>                  unlocked =3D True
>=20


--RwAbmC4aRNw3rpB8vMwaabNxjD4tfslXT--

--4io4TCjcIL7AdI40i3e7G4kTACk27HRg4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW1qTRgAKCRC7BTNVkZ0z
FC66AJ9EOsHmOcWLwtFre/hwDSqKpEoA6gCcD2eaxiAtfztNlvH1gXLGmeuTvp0=
=WCNT
-----END PGP SIGNATURE-----

--4io4TCjcIL7AdI40i3e7G4kTACk27HRg4--
