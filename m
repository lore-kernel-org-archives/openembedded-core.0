Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1ShVqm-0003eS-De
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 03:06:29 +0200
Received: by dalh21 with SMTP id h21so101718dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 17:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=GYHdzeaWyaKsPx3ug7B/fhQUBqhQBmAE762CVMEndhc=;
	b=scexT2V+RcH08tPM6OzO2EqGuIcWhNOzn6ZgrpIhEKfE2BTJS72khIldo3gPq91IaT
	V1qEGUxcd7UuXmjbPiZtZ5vzjGcNENO/sX8Btx0jAtW1u45NOdc/77bRpSO3VonV037i
	wgX0DLXKf+RlDzlU9XKXAAoF2oIHzMMvwYXHMJ9QkGTCDkKvEdaG18/YhjphNPH4ysOF
	j0hgyB7hIzGJjdCTEnRjxY3VLGpN+bCE0Vvdxuz6B7ism/yXZlNFauJNwbMPeLtnj4dn
	wUKxofmkJFfAs2z32vXBJmooDBtjmWRlbSR6sp+hlsfagoh4e1sP6jz24xBogJuhBWIW
	owDQ==
MIME-Version: 1.0
Received: by 10.68.222.163 with SMTP id qn3mr82180095pbc.135.1340240132447;
	Wed, 20 Jun 2012 17:55:32 -0700 (PDT)
Received: by 10.68.229.135 with HTTP; Wed, 20 Jun 2012 17:55:32 -0700 (PDT)
In-Reply-To: <3df261f3071c776a836bfaf44304c4a0ee572912.1340228144.git.raj.khem@gmail.com>
References: <cover.1340228144.git.raj.khem@gmail.com>
	<3df261f3071c776a836bfaf44304c4a0ee572912.1340228144.git.raj.khem@gmail.com>
Date: Wed, 20 Jun 2012 20:55:32 -0400
Message-ID: <CADkTA4OfoqJQv64838KfGv7Afsfj51CfvGQD16xmCYmE=rMC0g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kconfig-frontends: New recipe
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
X-List-Received-Date: Thu, 21 Jun 2012 01:06:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
> kconfig-frontends provides the kconfig infrastructure
> thats used for linux kernel as a standalone package. Its
> not intended to be used for kernel itself but can be
> used by packages who are based on kconfig e.g. busybox
> uclibc or new packages who wants to use kconfig infra
> for the package build

I like the approach. I haven't had a chance to try this out, but I
wanted to throw
my vote behind getting a common Kconfig front end package into oe-core.

Cheers,

Bruce

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0.../kconfig-frontends/kconfig-frontends_3.4.bb =A0 =A0 | =A0 28 ++++++=
++++++++++++++
> =A01 files changed, 28 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-fro=
ntends_3.4.bb
>
> diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.=
4.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
> new file mode 100644
> index 0000000..d95d3e8
> --- /dev/null
> +++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
> @@ -0,0 +1,28 @@
> +# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "The kconfig-frontends project aims at centralising \
> +the effort of keeping an up-to-date, out-of-tree, packaging of the \
> +kconfig infrastructure, ready for use by third-party projects. \
> +The kconfig-frontends package provides the kconfig parser, as well as al=
l \
> +the frontends"
> +HOMEPAGE =3D "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9b8cf60ff39767ff04b671fca8302=
408"
> +SECTION =3D "devel"
> +DEPENDS +=3D "ncurses flex bison gperf"
> +PR =3D "r0"
> +PV =3D "3.4.0"
> +SPIN =3D "0"
> +SRC_URI =3D "http://ymorin.is-a-geek.org/download/${BPN}/${BPN}-${PV}-${=
SPIN}.tar.xz"
> +SRC_URI[md5sum] =3D "7eed0faf5a41d6dd0b2a886a440a972d"
> +SRC_URI[sha256sum] =3D "638006f3d1aefefdc1db3030a15b562cf3c89f2028b1cea0=
bf0f0629708802f2"
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}-${SPIN}"
> +
> +inherit autotools
> +do_configure_prepend () {
> + =A0 =A0 =A0 mkdir -p scripts/.autostuff/m4
> +}
> +EXTRA_OECONF +=3D "--disable-gconf --disable-qconf"
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


