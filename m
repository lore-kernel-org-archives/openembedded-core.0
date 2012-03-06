Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S4r5P-0007Vm-BT for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 10:53:39 +0100
Received: from g225138053.adsl.alicedsl.de ([92.225.138.53]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S4qxA-0000fw-B8; Tue, 06 Mar 2012 09:45:08 +0000
Message-ID: <1331027106.6166.7.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 06 Mar 2012 10:45:06 +0100
In-Reply-To: <1331000623-10956-1-git-send-email-james@digitalmatter.com.au>
References: <1331000623-10956-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] gdk-pixbuf: Pick up ${NM} from the environment.
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
X-List-Received-Date: Tue, 06 Mar 2012 09:53:39 -0000
X-Groupsio-MsgNum: 18429
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-zxbusMZzWU5lVenUCf4w"

--=-zxbusMZzWU5lVenUCf4w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear James,


thank you for sending an improved version of the patch.


Am Dienstag, den 06.03.2012, 10:23 +0800 schrieb James Limbouris:
> Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> ---
>  .../gdk-pixbuf-2.24.0/configure_nm.patch           |   18 ++++++++++++++=
++++
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    3 ++-
>  2 files changed, 20 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/confi=
gure_nm.patch
>=20
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm=
.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch
> new file mode 100644
> index 0000000..0460824
> --- /dev/null
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch
> @@ -0,0 +1,18 @@
> +Pick up ${NM} from the environment.
> +Upstream-Status: Inappropriate [configuration]

as Khem and you discussed, it should be useful for upstream [1]. Maybe
you can add more context [2][3], so upstream can better judge if they
want it.

> +Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> +
> +Index: gdk-pixbuf-2.24.0/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff -uNr gdk-pixbuf-2.24.0/configure.ac gdk-pixbuf-2.24.0.mod/configure=
.ac
> +--- gdk-pixbuf-2.24.0/configure.ac	2011-08-27 11:27:52.000000000 +0800
> ++++ gdk-pixbuf-2.24.0.mod/configure.ac	2012-02-28 14:48:36.481126410 +08=
00
> +@@ -147,7 +147,7 @@
> + AC_SYS_LARGEFILE
> +=20
> + AM_PROG_AS
> +-AC_PATH_PROG(NM, nm, nm)
> ++AC_CHECK_TOOLS(NM, [$NM nm], nm)
> +=20
> + AC_MSG_CHECKING([for some Win32 platform])
> + AS_CASE(["$host"],
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb b/meta/re=
cipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
> index 121babd..d75bf2a 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb

[=E2=80=A6]


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/01855=
4.html
[2] http://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Gen=
eric-Programs.html
[3] http://lists.gnu.org/archive/html/bug-ncurses/2011-11/msg00011.html

--=-zxbusMZzWU5lVenUCf4w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk9V3KIACgkQPX1aK2wOHViyyACgiJQRzMj9ocqhcOP5yLjkVeDa
56gAnRk9nFY2lT4xdwuDE8uU2EZJHaZj
=a4Ok
-----END PGP SIGNATURE-----

--=-zxbusMZzWU5lVenUCf4w--
