Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVsXa-0000hH-H5
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:22:10 +0100
Received: by lagj5 with SMTP id j5so467664lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=lwKTImvIxoHUTgOYKY4vAl06wtYaLInoOE1Indrf9hI=;
	b=KN89kxaPzgWImhc0osxc00yB9jmDwwbvFtlbpuOzp5CvspobZQl+l+5kGSUXGuKzhW
	O17cGbHpxBQ79TtGOvAEON1mc6p+JswNQojJ8eQ4A9VohJS+5TFiSWoY5LsL7i/FQ6Xo
	yzF/aAFA6kpoU0dDX5ryPA2gpftUSlkavU6xA=
Received: by 10.152.104.206 with SMTP id gg14mr2801876lab.41.1322691329301;
	Wed, 30 Nov 2011 14:15:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 30 Nov 2011 14:14:58 -0800 (PST)
In-Reply-To: <685dc1375188fc90c1b3f8fd3b38442ec9bafddc.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
	<685dc1375188fc90c1b3f8fd3b38442ec9bafddc.1322662245.git.dexuan.cui@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2011 14:14:58 -0800
Message-ID: <CAMKF1soKtwMPU_fs3ZBjMG4sxq5xRnPKqD1s--nDa5KLH-h9Cg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] lzo: upgrade from 2.05 to the latest version 2.06
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
X-List-Received-Date: Wed, 30 Nov 2011 22:22:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 6:12 AM, Dexuan Cui <dexuan.cui@intel.com> wrote:
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
> =C2=A0.../lzo/{lzo-2.05 =3D> lzo-2.06}/acinclude.m4 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A00
> =C2=A0.../lzo/{lzo-2.05 =3D> lzo-2.06}/autoconf.patch =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A09 ++++++++-
> =C2=A0.../lzo/{lzo_2.05.bb =3D> lzo_2.06.bb} =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++--
> =C2=A03 files changed, 10 insertions(+), 3 deletions(-)
> =C2=A0rename meta/recipes-support/lzo/{lzo-2.05 =3D> lzo-2.06}/acinclude.=
m4 (100%)
> =C2=A0rename meta/recipes-support/lzo/{lzo-2.05 =3D> lzo-2.06}/autoconf.p=
atch (79%)
> =C2=A0rename meta/recipes-support/lzo/{lzo_2.05.bb =3D> lzo_2.06.bb} (81%=
)
>
> diff --git a/meta/recipes-support/lzo/lzo-2.05/acinclude.m4 b/meta/recipe=
s-support/lzo/lzo-2.06/acinclude.m4
> similarity index 100%
> rename from meta/recipes-support/lzo/lzo-2.05/acinclude.m4
> rename to meta/recipes-support/lzo/lzo-2.06/acinclude.m4
> diff --git a/meta/recipes-support/lzo/lzo-2.05/autoconf.patch b/meta/reci=
pes-support/lzo/lzo-2.06/autoconf.patch
> similarity index 79%
> rename from meta/recipes-support/lzo/lzo-2.05/autoconf.patch
> rename to meta/recipes-support/lzo/lzo-2.06/autoconf.patch
> index dbd2072..63c1d2d 100644
> --- a/meta/recipes-support/lzo/lzo-2.05/autoconf.patch
> +++ b/meta/recipes-support/lzo/lzo-2.06/autoconf.patch
> @@ -5,6 +5,13 @@ to pass build
> =C2=A0Upstream-Status: Inappropriate [workaround]
>
> =C2=A0Signed-off-by: Qing He <qing.he@intel.com>
> +
> +
> +
> +Wed Nov 30 14:42:01 CST 2011
> +Rebase to lzo-2.06.
> +Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> +
> =C2=A0---
> =C2=A0diff --git a/configure.ac b/configure.ac
> =C2=A0index 650749a..2a78845 100644
> @@ -16,6 +23,6 @@ index 650749a..2a78845 100644
>
> =C2=A0-AC_PREREQ(2.67)
> =C2=A0+AC_PREREQ(2.65)

is this patch needed still. We use newer autoconf so why do we go back
to 2.65 in this case ?

> - AC_INIT([LZO],[2.05],[markus@oberhumer.com],[lzo],[http://www.oberhumer=
.com/opensource/lzo/])
> + AC_INIT([LZO],[2.06],[markus@oberhumer.com],[lzo],[http://www.oberhumer=
.com/opensource/lzo/])
> =C2=A0AC_MSG_NOTICE([Configuring LZO $PACKAGE_VERSION])
> =C2=A0AC_CONFIG_SRCDIR(src/lzo_init.c)
> diff --git a/meta/recipes-support/lzo/lzo_2.05.bb b/meta/recipes-support/=
lzo/lzo_2.06.bb
> similarity index 81%
> rename from meta/recipes-support/lzo/lzo_2.05.bb
> rename to meta/recipes-support/lzo/lzo_2.06.bb
> index c49e94a..b2cc171 100644
> --- a/meta/recipes-support/lzo/lzo_2.05.bb
> +++ b/meta/recipes-support/lzo/lzo_2.06.bb
> @@ -11,8 +11,8 @@ SRC_URI =3D "http://www.oberhumer.com/opensource/lzo/do=
wnload/lzo-${PV}.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://acinclude.m4 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> -SRC_URI[md5sum] =3D "c67cda5fa191bab761c7cb06fe091e36"
> -SRC_URI[sha256sum] =3D "449f98186d76ba252cd17ff1241ca2a96b7f62e0d3e4766f=
88730dab0ea5f333"
> +SRC_URI[md5sum] =3D "95380bd4081f85ef08c5209f4107e9f8"
> +SRC_URI[sha256sum] =3D "ff79e6f836d62d3f86ef6ce893ed65d07e638ef4d3cb9529=
63471b4234d43e73"
>
> =C2=A0inherit autotools
>
> --
> 1.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


