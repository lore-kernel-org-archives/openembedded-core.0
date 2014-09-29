Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 28652605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 14:52:18 +0000 (UTC)
Received: from comp-006-thk.localnet (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 76BA03162E16;
	Mon, 29 Sep 2014 16:52:16 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 29 Sep 2014 16:52:14 +0200
Message-ID: <201722111.zmNURQEFnj@comp-006-thk>
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <1412001614-15126-1-git-send-email-ross.burton@intel.com>
References: <1412001614-15126-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: add SRCREV to do_fetch() hash
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
X-List-Received-Date: Mon, 29 Sep 2014 14:52:22 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday 29 of September 2014 15:40:14 Ross Burton wrote:
> Without this changing just the SRCREV won't re-fetch unless you embed=
 the
> SRCREV into PV.

So a trick like this will not be needed anymore to automatically rebuil=
d=20
whenever sources in SCM change?

SRCREV =3D "${AUTOREV}"
PVBASE :=3D "${PV}"
PV =3D "${PVBASE}.${SRCPV}"

>=20
> The downside here is that every hash changes, so this causes a full r=
ebuild.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/base.bbclass |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index c0d61fe..ff8c633 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -97,6 +97,7 @@ PATH_prepend =3D "${@extra_path_elements(d)}"
>  addtask fetch
>  do_fetch[dirs] =3D "${DL_DIR}"
>  do_fetch[file-checksums] =3D "${@bb.fetch.get_checksum_file_list(d)}=
"
> +do_fetch[vardeps] +=3D "SRCREV"
>  python base_do_fetch() {
>=20
>      src_uri =3D (d.getVar('SRC_URI', True) or "").split()


--=20

Maciej Borz=C4=99cki=20
Senior Software Engineer Open-RnD Sp. z o.o.=20
www.open-rnd.pl, Facebook, Twitter=20
mobile: +48 telefon, fax: +48 42 657 9079=20

Niniejsza wiadomo=C5=9B=C4=87 wraz z za=C5=82=C4=85cznikami mo=C5=BCe z=
awiera=C4=87 chronione prawem lub=20
poufne informacje i zosta=C5=82a wys=C5=82ana wy=C5=82=C4=85cznie do wi=
adomo=C5=9Bci i u=C5=BCytku os=C3=B3b, do=20
kt=C3=B3rych zosta=C5=82a zaadresowana. Je=C5=9Bli wiadomo=C5=9B=C4=87 =
zosta=C5=82a otrzymana przypadkowo=20
zabrania si=C4=99 jej kopiowania lub rozsy=C5=82ania do os=C3=B3b trzec=
ich. W takim przypadku=20
uprasza si=C4=99 o natychmiastowe zniszczenie wiadomo=C5=9Bci oraz poin=
formowanie=20
nadawcy o zaistnia=C5=82ej sytuacji za pomoc=C4=85 wiadomo=C5=9Bci zwro=
tnej. Dzi=C4=99kujemy.=20

This message, including any attachments hereto, may contain privileged =
or=20
confidential information and is sent solely for the attention and use o=
f the=20
intended addressee(s). If you are not an intended addressee, you may ne=
ither=20
use this message nor copy or deliver it to anyone. In such case, you sh=
ould=20
immediately destroy this message and kindly notify the sender by reply =
email.=20
Thank you. 

