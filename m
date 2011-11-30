Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVsZT-0000nn-PX
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:24:08 +0100
Received: by lagj5 with SMTP id j5so468359lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=GbYY7bsA6r+UGWO3aRgyK6kZLjjvtER7gyxy0PlSvzU=;
	b=Ry8sf5hLuY0JyJIcsd6FMzRiAy+8QVTJlDRdSZnvIgqwZAPary+VkPx3JbSRFmcuO1
	p3ni+iNKxpChxT5aJQn+HmdXMJqwRMZR0ElR1zuozTrwDJMVYfhJRaIcSnt5mEpnXK+H
	baSMnke6ddJ5rvk758Zd9D/3vAzsFRtOtvayA=
Received: by 10.152.105.67 with SMTP id gk3mr2794426lab.48.1322691441338; Wed,
	30 Nov 2011 14:17:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 30 Nov 2011 14:16:50 -0800 (PST)
In-Reply-To: <05e28e6a8cd5c930a0c538121ced79d008f0fdf3.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
	<05e28e6a8cd5c930a0c538121ced79d008f0fdf3.1322662245.git.dexuan.cui@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2011 14:16:50 -0800
Message-ID: <CAMKF1srX6OY7OEUdTggi-26v3zdN5-s0imC4_tMC88sRymc4=g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] xcb-util: upgrade from 0.3.6 to 0.3.8
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
X-List-Received-Date: Wed, 30 Nov 2011 22:24:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 6:12 AM, Dexuan Cui <dexuan.cui@intel.com> wrote:
> updated LIC_FILES_CHKSUM since the code was re-organized, but the license
> remains the same.
>
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
> =C2=A0meta/recipes-graphics/xcb/xcb-util_0.3.6.bb | =C2=A0 18 -----------=
-------
> =C2=A0meta/recipes-graphics/xcb/xcb-util_0.3.8.bb | =C2=A0 =C2=A09 ++++++=
+++
> =C2=A02 files changed, 9 insertions(+), 18 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-graphics/xcb/xcb-util_0.3.6.bb
> =C2=A0create mode 100644 meta/recipes-graphics/xcb/xcb-util_0.3.8.bb
>
> diff --git a/meta/recipes-graphics/xcb/xcb-util_0.3.6.bb b/meta/recipes-g=
raphics/xcb/xcb-util_0.3.6.bb
> deleted file mode 100644
> index 1057b34..0000000
> --- a/meta/recipes-graphics/xcb/xcb-util_0.3.6.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -require xcb-util.inc
> -
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://xcb-util-common.h;endline=3D30;md5=3D6c7459=
5925fd773cc8cf387ff7bc53c7 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://reply/reply.c;endline=3D27;md5=3Df9a1d6b55bba632d349949cbf33cd635 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://aux/xcb_aux.c;endline=3D30;md5=3Dae305b9c2a38f9ba27060191046a6460 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://renderutil/xcb_renderutil.h;endline=3D24;md5=3Dd0ddab3052dd4949c93cfcb=
0891c96df \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://event/xcb_event.h;endline=3D27;md5=3D627be355aee59e1b8ade80d5bd90fad9 =
\
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://property/xcb_property.h;endline=3D27;md5=3Df5890866ee0c655c36ef1c6c738=
fee6b \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://keysyms/keysyms.c;endline=3D30;md5=3D2f8de023ed823bb92f0b47900574ea9e =
\
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://image/xcb_pixel.h;beginline=3D4;endline=3D27;md5=3D48cd25ae55e7de525fe=
1e1a3a7672e1c"
> -
> -
> -PR =3D "r0"
> -
> -
> -SRC_URI[md5sum] =3D "dd8968b8ee613cb027a8ef1fcbdc8fc9"
> -SRC_URI[sha256sum] =3D "ffb8ee11ab015858a970ab7edd56bd2436b281657596561d=
8429d4a90df60e57"
> diff --git a/meta/recipes-graphics/xcb/xcb-util_0.3.8.bb b/meta/recipes-g=
raphics/xcb/xcb-util_0.3.8.bb
> new file mode 100644
> index 0000000..b7eff29
> --- /dev/null
> +++ b/meta/recipes-graphics/xcb/xcb-util_0.3.8.bb
> @@ -0,0 +1,9 @@
> +require xcb-util.inc
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://src/xcb_aux.c;endline=3D30;md5=3Dae305b9c2a=
38f9ba27060191046a6460 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://src/xcb_event.h;endline=3D27;md5=3D627be355aee59e1b8ade80d5bd90fad9"

if license remains same then why do we not check for the remaining
files from there new location wherever they moved to
after code reorg ?

> +PR =3D "r0"
> +
> +SRC_URI[md5sum] =3D "8ce019c4bbf20dce246b98f177cfccff"
> +SRC_URI[sha256sum] =3D "c1eed9284750bc09352e60654df77bb585dbbe7673fdcc67=
5e58b7f3a0b447b9"
> --
> 1.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


