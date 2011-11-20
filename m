Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RSEv1-0000UE-Bh for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 22:27:19 +0100
Received: from f053037184.adsl.alicedsl.de ([78.53.37.184]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RSEop-0004Vd-Ak for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 21:20:55 +0000
Message-ID: <1321824051.1070.76.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2011 22:20:51 +0100
In-Reply-To: <0abcddc2e0bdf826919f7aee820f60fa64024177.1321811216.git.raj.khem@gmail.com>
References: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
	<0abcddc2e0bdf826919f7aee820f60fa64024177.1321811216.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 3/5] pulseaudio-0.9.23: Fix build on uclibc
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
X-List-Received-Date: Sun, 20 Nov 2011 21:27:19 -0000
X-Groupsio-MsgNum: 12667
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-0e+raoOwNOvuL6h89U6l"

--=-0e+raoOwNOvuL6h89U6l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 20.11.2011, 09:50 -0800 schrieb Khem Raj:
> Import patch from oe.dev rev 7c33f2e906a20e139d53b4f2d8fbc2773a4725b3
> to fix bluez build when using uclibc
>=20
> cgit link here
>=20
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D7c33f2e90=
6a20e139d53b4f2d8fbc2773a4725b3
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../pulseaudio-0.9.23/fix_bluez_build.patch        |   26 ++++++++++++++=
++++++
>  .../pulseaudio/pulseaudio_0.9.23.bb                |    3 +-
>  2 files changed, 28 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/=
fix_bluez_build.patch
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_blu=
ez_build.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_b=
luez_build.patch
> new file mode 100644
> index 0000000..fbb22d7
> --- /dev/null
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_buil=
d.patch
> @@ -0,0 +1,26 @@
> +using uClibc $(INTLLIBS) is not empty but set to -lintl
> +this means that AM_LIBADD wont be empty as well and hence
> +a missing space which otherwise works starts to show up as error
> +
> +| make[4]: *** No rule to make target `-lintl', needed by `libbluetooth-=
ipc.la'.  Stop.
> +| make[4]: Leaving directory `/home/kraj/work/angstrom/sources/openembed=
ded-core/build/tmp-uclibc/work/armv5te-oe-linux-uclibceabi/pulseaudio-0.9.2=
3-r7/pulseaudio-0.9.23/src'
> +| make[3]: *** [all-recursive] Error 1
> +
> +We add missing space
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending

It is committed upstream as far as I know.

[=E2=80=A6]


Thanks,

Paul

--=-0e+raoOwNOvuL6h89U6l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7JbzMACgkQPX1aK2wOHVg08QCfTyJnL2fXqISmbgxCgQ5re1px
IYsAnR0tAye0FWkWXVuu7bk8Vq4D9bHd
=6Tgu
-----END PGP SIGNATURE-----

--=-0e+raoOwNOvuL6h89U6l--
