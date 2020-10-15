Subject: Re: [PATCH] busybox: add rev and pgrep
To: openembedded-core@lists.openembedded.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 85
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 15 Oct 2020 02:07:51 -0700
References: <20201015054600.24514-1-akuster808@gmail.com>
In-Reply-To: <20201015054600.24514-1-akuster808@gmail.com>
Message-ID: <27107.1602752871157273119@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2020 at 06:46 AM, akuster wrote:

>
> From: akuster <akuster@kona.kama-aina.net>
>=20
> Signed-off-by: akuster <akuster808@gmail.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta/recipes-core/busybox/busybox/pgrep.cfg | 1 +
>  meta/recipes-core/busybox/busybox/rev.cfg   | 1 +
>  meta/recipes-core/busybox/busybox_1.32.0.bb | 2 ++
>  3 files changed, 4 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/pgrep.cfg
>  create mode 100644 meta/recipes-core/busybox/busybox/rev.cfg
>=20
> diff --git a/meta/recipes-core/busybox/busybox/pgrep.cfg
> b/meta/recipes-core/busybox/busybox/pgrep.cfg
> new file mode 100644
> index 00000000000..775e487d601
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/pgrep.cfg
> @@ -0,0 +1 @@
> +CONFIG_PGREP=3Dy
> diff --git a/meta/recipes-core/busybox/busybox/rev.cfg
> b/meta/recipes-core/busybox/busybox/rev.cfg
> new file mode 100644
> index 00000000000..da008c30cd3
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/rev.cfg
> @@ -0,0 +1 @@
> +CONFIG_REV=3Dy
> diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb
> b/meta/recipes-core/busybox/busybox_1.32.0.bb
> index aeea40fbc15..8e23b0d4a28 100644
> --- a/meta/recipes-core/busybox/busybox_1.32.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.32.0.bb
> @@ -44,6 +44,8 @@ SRC_URI =3D
> "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>             file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
>            
> file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
>             file://0001-hwclock-make-glibc-2.31-compatible.patch \
> +           file://rev.cfg \
> +           file://pgrep.cfg \
>  "
>  SRC_URI_append_libc-musl =3D " file://musl.cfg "
>  
> --=20
> 2.17.1
>=20
>
