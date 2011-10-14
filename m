Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REVIZ-0007Yp-8J
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 02:06:51 +0200
Received: by ywf7 with SMTP id 7so1743733ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 17:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=nvAplz1KaSNT8E8zRgdJ4uv28FIrxPKacs7RaRJkdTM=;
	b=rrEc4cLUJK0t49WTmtsKC7zQFxzzEIrxEQj3FwdoJNTWQMgMzSyF51B6ArEyt4jmft
	i1SdUi8U9BAFR2pOsoSEjQjNWh9HSHqfKPo1Ri4xVFnE3HF2ARYjylYVZJJLiLsfWYKa
	tyFNxB6xLZHVw+kfkbpuWTZiFHahE3NKVSfFE=
Received: by 10.68.20.226 with SMTP id q2mr12223452pbe.115.1318550466060; Thu,
	13 Oct 2011 17:01:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 13 Oct 2011 17:00:36 -0700 (PDT)
In-Reply-To: <c5043e9c181631b290bf33c770940594efdc9647.1318496401.git.kai.kang@windriver.com>
References: <cover.1318496401.git.kai.kang@windriver.com>
	<c5043e9c181631b290bf33c770940594efdc9647.1318496401.git.kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2011 17:00:36 -0700
Message-ID: <CAMKF1soQsuuA-7hRuGFmC98uBA20Mt9e0J2RF1uWm06F12DB_Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] gdk-pixbuf: pick up ${NM} to fix libtool naming issue
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
X-List-Received-Date: Fri, 14 Oct 2011 00:06:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 2:05 AM, Kang Kai <kai.kang@windriver.com> wrote:
> When gdk-pixbuf configures, it should pick up ${NM} from the
> environment if it is defined, instead of just looking
> for "nm".
>
> The patch is from WindRiver Linux.
> CQID: =C2=A0WIND00260200
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
> =C2=A0.../gdk-pixbuf-2.24.0/configure-nm.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 32 ++++++++++++++++++++
> =C2=A0meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb | =C2=A0 =C2=A03=
 ++
> =C2=A02 files changed, 35 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/=
configure-nm.patch
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure-nm=
.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure-nm.patch
> new file mode 100644
> index 0000000..71defd0
> --- /dev/null
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure-nm.patch
> @@ -0,0 +1,32 @@
> +This patch is from WindRiver Linux, to fix libtool naming issue.
> +The original commit info is:
> +
> +commit 684b9d2daab517856222cc078ac51c72ce3ca3a9
> +Author: David Borman <david.borman@windriver.com>
> +Date: =C2=A0 Thu Mar 10 07:51:11 2011 -0600
> +
> + =C2=A0 =C2=A0Have gdk-pixbuf pick up ${NM}, fix libtool naming issue
> +
> + =C2=A0 =C2=A0CQID: WIND00260200
> +
> + =C2=A0 =C2=A0The configuration for gdk-pixbuf needs to pick up $NM
> + =C2=A0 =C2=A0from the environment, this is the same patch that was
> + =C2=A0 =C2=A0applied to gdk+.
> +
> + =C2=A0 =C2=A0Signed-off-by: David Borman <david.borman@windriver.com>
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -149,7 +149,7 @@
> + AC_SYS_LARGEFILE
> +
> + AM_PROG_AS
> +-AC_PATH_PROG(NM, nm, nm)
> ++AC_PATH_PROG(NM, [$NM nm], nm)

Does

 AC_PATH_TOOL(NM,nm,nm)

work for you here ?

> +
> + AC_MSG_CHECKING([for some Win32 platform])
> + AS_CASE(["$host"],
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb b/meta/re=
cipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
> index 9fabbe2..2099b98 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
> @@ -10,9 +10,12 @@ SECTION =3D "libs"
>
> =C2=A0DEPENDS =3D "libpng glib-2.0 jpeg"
>
> +PR =3D "r1"
> +
> =C2=A0SRC_URI =3D "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.2=
4/gdk-pixbuf-${PV}.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://hardcoded_libtool.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure_fix.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure-nm.patch;patch=3D1 =
\

patch=3D1 is redundant

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0SRC_URI[md5sum] =3D "d8ece3a4ade4a91c768328620e473ab8"
> --
> 1.7.5.1.300.gc565c
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


