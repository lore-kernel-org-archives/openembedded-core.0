Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVsVQ-0000ZQ-DC
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:19:56 +0100
Received: by lagj5 with SMTP id j5so466820lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=fJnpXASbmj0vdv+UVj1TZYT0Zs7OLDoPmqNNjvgZ7Bs=;
	b=akWmssZry5VcBGqdOhUkHSbWlJB3rAtl6DFkEOfFBZCZO40nOHg9EsXmWdTOydUIc3
	LwR+TiOYa+sbvsomF4Wc7zYz60co/oqwsrbpQFcwYNC6muYFVAmUCpwux8faODNJa2sD
	asyaJ5Dbej4Q1fHY6iNUQi2QFzi+/9JLJlomA=
Received: by 10.152.145.233 with SMTP id sx9mr2799534lab.6.1322691189384; Wed,
	30 Nov 2011 14:13:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 30 Nov 2011 14:12:38 -0800 (PST)
In-Reply-To: <7b66253699b50888fa21d9e79bc1d1e6898ff40a.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
	<7b66253699b50888fa21d9e79bc1d1e6898ff40a.1322662245.git.dexuan.cui@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2011 14:12:38 -0800
Message-ID: <CAMKF1spEcQKvCHsBY68MQfPMXR8E-w7W9kyQrcbKq2RqvPVeCw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] libxfont: upgrade from 1.4.3 to 1.4.4
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
X-List-Received-Date: Wed, 30 Nov 2011 22:19:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 6:12 AM, Dexuan Cui <dexuan.cui@intel.com> wrote:
> updated LIC_FILES_CHKSUM:
> only Copyright holder change in COPYING -- no actual license change.
>
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
> =C2=A0.../{libxfont_1.4.3.bb =3D> libxfont_1.4.4.bb} =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A08 +++-----
> =C2=A01 files changed, 3 insertions(+), 5 deletions(-)
> =C2=A0rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.3.bb =3D> libxf=
ont_1.4.4.bb} (62%)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb b/meta/reci=
pes-graphics/xorg-lib/libxfont_1.4.4.bb
> similarity index 62%
> rename from meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb
> rename to meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
> index 43a628e..8af0ac9 100644
> --- a/meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
> @@ -7,7 +7,7 @@ such as freetype)."
> =C2=A0require xorg-lib-common.inc
>
> =C2=A0LICENSE=3D "MIT & MIT-style & BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddeeee1c29f32ca774cecf0c83b46b=
b5c"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da46c8040f2f737bcd0c435feb2ab1=
c2c"
>
> =C2=A0DEPENDS +=3D "freetype fontcacheproto xtrans fontsproto libfontenc"
> =C2=A0PROVIDES =3D "xfont"
> @@ -15,11 +15,9 @@ PROVIDES =3D "xfont"
> =C2=A0PR =3D "r0"
> =C2=A0PE =3D "1"
>
> -#SRC_URI +=3D "file://no-scalable-crash.patch"
> -

Please rm the patch as well.


