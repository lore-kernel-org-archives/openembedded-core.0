Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 04B1A65CAC;
	Mon, 27 Apr 2015 16:14:04 +0000 (UTC)
Received: by wgso17 with SMTP id o17so121763242wgs.1;
	Mon, 27 Apr 2015 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=KTImXD+BEcfMsMzgZN94UvTRu/vHmEd1WJqx834qgOc=;
	b=N5AIQUmZUirPo4HhKjExowOQ0l7E/YBjblyPOZ87f+9SHYfxwSviJOuMTpfYIFgI27
	t3IkImjdZurM9mTen/wHvngLiYnlQaCxd8hGEjWnbJzVTo+9hdsCGAPnewFh2ygAsm75
	BPbAvF7MgRRkWn0DiE36Ax64F7gP8czCF47fesAkk5pohSrivyGQHMjtpp4yVaVhuPSK
	7IbcTebZpKVExM5F/EtL5UWEHRmLAgpKvi2uJn2RkNWXDr24aURS155jUKMAgRrmDhcL
	GXCfh52x9GyZgZ3U/wavPTMjz9MM6SocVa35Xnm6DTj28vXhJHeOQlRyo2AH1FQFPxoj
	/fUg==
X-Received: by 10.181.11.129 with SMTP id ei1mr21982200wid.57.1430151245542;
	Mon, 27 Apr 2015 09:14:05 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	fl14sm30030647wjc.11.2015.04.27.09.14.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 09:14:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Apr 2015 18:15:01 +0200
To: openembedded-core@lists.openembedded.org,
	Bruno Bottazzini <bruno.bottazzini@intel.com>
Message-ID: <20150427161501.GI2379@jama>
References: <20150427143720.09D9C50238@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150427143720.09D9C50238@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruno Bottazzini : systemd 219 -> system 219-stable
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
X-List-Received-Date: Mon, 27 Apr 2015 16:14:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2015 at 02:37:20PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: c21bf9d7bb0cb90392ed50a44c57a3d068b88ef9
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dc21bf9d7bb0cb90392ed50a44c57a3d068b88ef9
>=20
> Author: Bruno Bottazzini <bruno.bottazzini@intel.com>
> Date:   Wed Apr 22 14:01:10 2015 -0300
>=20
> systemd 219 -> system 219-stable
>=20
> The upstream systemd git repo only contains the main systemd branch that
> progresses at a quick pace, continuously bringing both bugfixes and new f=
eatures.
>=20
> Distributions usually prefer basing their releases on stabilized versions
> that receive the bugfixes but not the features.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/systemd/systemd_219.bb | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core=
/systemd/systemd_219.bb
> index 43c4f95..d1303f7 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -25,11 +25,11 @@ SECTION =3D "base/shell"
> =20
>  inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d updat=
e-alternatives qemu systemd ptest gettext
> =20
> -SRCREV =3D "a88abde72169ddc2df77df3fa5bed30725022253"
> +SRCREV =3D "85a6fabdd3e43cfab0fc6359e9f2a9e368d4a3ed"
> =20
> -PV =3D "219+git${SRCPV}"
> +PV =3D "219-stable+git${SRCPV}"
> =20
> -SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd;branch=3Dmast=
er \
> +SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd-stable;branch=
=3Dv219-stable;protocol=3Dgit \
>             file://0002-shared-missing.h-fall-back-to-insecure-getenv.pat=
ch \
>             file://0003-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0004-configure-Check-for-additional-features-that-ucli=
bc-.patch \
> @@ -38,12 +38,8 @@ SRC_URI =3D "git://anongit.freedesktop.org/systemd/sys=
temd;branch=3Dmaster \
>             file://0007-util-Use-mkostemp-only-if-libc-supports-it.patch \
>             file://0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-c=
onf.patch \
>             file://0009-sysv-generator-add-support-for-executing-scripts-=
und.patch \
> -           file://0010-Make-root-s-home-directory-configurable.patch \

Removal of this patch causes:
WARNING: QA Issue: systemd: configure was passed unrecognised options:
--with-roothomedir [unknown-configure-option]

and why didn't you remove the .patch files which are no longer used from
SRC_URI?

>             file://0011-systemd-user-avoid-using-system-auth.patch \
> -           file://0001-tmpfiles-avoid-creating-duplicate-acl-entries.pat=
ch \
> -           file://0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-files=
yst.patch \
>             file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-as=
-th.patch \
> -           file://0013-journal-fix-Inappropriate-ioctl-for-device-on-ext=
4.patch \
>             file://0014-Revert-rules-remove-firmware-loading-rules.patch \
>             file://0015-Revert-udev-remove-userspace-firmware-loading-sup=
por.patch \
>             file://tmpfiles-pam.patch \
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

