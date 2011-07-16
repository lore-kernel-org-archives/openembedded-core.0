Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhuyV-0002hy-Lu
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 04:51:27 +0200
Received: by pvf24 with SMTP id 24so1614800pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 19:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=qNIY4MG5vfcMqb88pQM9dRowfMUNXZoHYCq6mkuUtf0=;
	b=erlhTPpXzUGxDeQHXWorAxbrAyUtCytF8o3gzCGoRgIUs+goPYWoY8EWD/W0pfamTk
	/pyq7hR6KKl57BDsS//AmnwuhD5bDiYnZxRDYvSmvKkRcx22J9iixETb8pVUmLMoYbiy
	Fn2x1O9kOJ1cmLuoosy82mqbf8a8zp06HHljo=
Received: by 10.68.10.103 with SMTP id h7mr4952951pbb.211.1310784445350; Fri,
	15 Jul 2011 19:47:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Fri, 15 Jul 2011 19:46:55 -0700 (PDT)
In-Reply-To: <ae375ddeb4e1c4e3141e41fe01a78d196d9d6970.1310781382.git.raj.khem@gmail.com>
References: <cover.1310781382.git.raj.khem@gmail.com>
	<e286a25378756398463d3bf34174005a8cef8841.1310781382.git.raj.khem@gmail.com>
	<ae375ddeb4e1c4e3141e41fe01a78d196d9d6970.1310781382.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jul 2011 19:46:55 -0700
Message-ID: <CAMKF1soLJgvAOU82EBy_9G5vaCKk8H92iYtj0nzVdN9QA2KQpA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] acl, attr: Fix build failures when NLS is disabled on uclibc
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
X-List-Received-Date: Sat, 16 Jul 2011 02:51:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2011 at 6:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Disable gettext support when NLS is not enabled

hold on to this patch there I found problems building from scratch on acl-n=
ative
I am fixing it. Other patches in the series are ok.

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-support/attr/acl_2.2.51.bb =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-support/attr/attr.inc =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A04 ----
> =C2=A0meta/recipes-support/attr/attr_2.4.46.bb | =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-support/attr/ea-acl.inc =C2=A0 =C2=A0 | =C2=A0 =C2=A04=
 ++++
> =C2=A04 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-support/attr/acl_2.2.51.bb b/meta/recipes-suppo=
rt/attr/acl_2.2.51.bb
> index 301d44a..18aac7c 100644
> --- a/meta/recipes-support/attr/acl_2.2.51.bb
> +++ b/meta/recipes-support/attr/acl_2.2.51.bb
> @@ -1,6 +1,6 @@
> =C2=A0require acl.inc
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =C2=A0SRC_URI[md5sum] =3D "3fc0ce99dc5253bdcce4c9cd437bc267"
> =C2=A0SRC_URI[sha256sum] =3D "06854521cf5d396801af7e54b9636680edf8064355e=
51c07657ec7442a185225"
> diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/at=
tr/attr.inc
> index b2ed9a1..c110340 100644
> --- a/meta/recipes-support/attr/attr.inc
> +++ b/meta/recipes-support/attr/attr.inc
> @@ -20,7 +20,3 @@ do_install_append() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${D}${libdir}/libattr.la -e \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s,^libdir=3D\'${base_libdir}\'$,=
libdir=3D\'${libdir}\',
> =C2=A0}
> -
> -# Only append ldflags for target recipe
> -LDFLAGS_libc-uclibc +=3D "${@['', '-lintl']['${PN}' =3D=3D '${BPN}']}"
> -
> diff --git a/meta/recipes-support/attr/attr_2.4.46.bb b/meta/recipes-supp=
ort/attr/attr_2.4.46.bb
> index 9fef41b..fe8ab79 100644
> --- a/meta/recipes-support/attr/attr_2.4.46.bb
> +++ b/meta/recipes-support/attr/attr_2.4.46.bb
> @@ -1,6 +1,6 @@
> =C2=A0require attr.inc
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =C2=A0SRC_URI[md5sum] =3D "db557c17fdfa4f785333ecda08654010"
> =C2=A0SRC_URI[sha256sum] =3D "dcd69bdca7ff166bc45141eddbcf21967999a6b66b0=
544be12a1cc2fd6340e1f"
> diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/=
attr/ea-acl.inc
> index afe2f1c..96dc0fb 100644
> --- a/meta/recipes-support/attr/ea-acl.inc
> +++ b/meta/recipes-support/attr/ea-acl.inc
> @@ -32,3 +32,7 @@ FILES_lib${PN}-doc =3D "${mandir}/man2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${mandir}/man3"
>
> =C2=A0BBCLASSEXTEND =3D "native"
> +# Only append ldflags for target recipe and if USE_NLS is enabled
> +LDFLAGS_libc-uclibc +=3D "${@['', '-lintl'][(bb.data.getVar('PN', d, Tru=
e) =3D=3D bb.data.getVar('BPN', d , True)) and (bb.data.getVar('USE_NLS', d=
, True) =3D=3D 'yes')]}"
> +EXTRA_OECONF_append_libc-uclibc =3D "${@[' --disable-gettext ', ' --enab=
le-gettext '][(bb.data.getVar('PN', d, True) =3D=3D bb.data.getVar('BPN', d=
 , True)) and (bb.data.getVar('USE_NLS', d, True) =3D=3D 'yes')]}"
> +
> --
> 1.7.4.1
>
>


