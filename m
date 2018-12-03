Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5CA6C657
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 16:40:11 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id g85so10272219ita.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 08:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9pLj+eFQiqVf/pjxBerbrbUsxjUsykdxfrhoEN/httk=;
	b=g0w9adNAgD0Pc4Z3rIq8mOrYuIpRN9T+hsddi67uu6FEEl8a9n6WLihXGrmL0V6II0
	XlgZVsWFecKf51EAgvOMXi8+AvTITfY92/kh7TYUiWQ4QRWOk7K5YjVrEiJdhk4kd3BF
	S+wGIGsC/0ahDbrlSNiRT8PXg8wn+3rGNchtt9b2kSknw5dG+QGZDcddPE9gsDqnDDlc
	6OIQTCR5VzmFCEzuO3upGEaaDUAf1p/k3xH+QCutWZITTzrTYBw2PfEjEYkIAEtrGLfv
	Gv4x6H6N80K68+1E6bMFKfLrrbYCYFx+WgfvIu1sgWE23RCbZv8fQ8dELBpLaxmyjnAo
	gJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9pLj+eFQiqVf/pjxBerbrbUsxjUsykdxfrhoEN/httk=;
	b=uMto69OqjwaKxG6bMoJzyteXNzL/xCaRvSEa9FZHBGCcJbj6e5VjYHP7wsecy9Fb4u
	EBrfCTS95CVfbun85Bhetbu7QXYTziNnew0KYGj3mDbFwtJjxOpffINNyRFzQ6ot7WUd
	Z2buuPypNtYMG0YDvluWssuktZGupdvVc09IAp7cgSu11DkVvjylKWvpMB4zeODYzL1S
	f2NYEBi8lpzA3GGsJDIGheE2tqmsdNgUdo18aEPsUrnPU+gyDHlAhC+KoZNXSEzUHRNT
	UhO6WSup1A/S9bPIy3JfBN7ovu24OGJMgTcCq5ggiqFOwy2TsIoF0V72rS6EkYPxsCPp
	lBwA==
X-Gm-Message-State: AA+aEWYHbwgQ22CSoCNMf8Cje//FGTvEcTNTcO7nQhao7k79NacNQJw1
	gXEWqCNE+lRBYIu+QhIkxciBvLFngl2pzbAqq1TWdjLq
X-Google-Smtp-Source: AFSGD/V1FGmzDZ7KlZ5xRzFO6rBPRWypx+hH6SLRPUwkqGjkxlqCOqxqjLYmBvBGd7YrDk0f0c81LaGG/tqlkrxAf70=
X-Received: by 2002:a24:c601:: with SMTP id j1mr1838959itg.130.1543855212061; 
	Mon, 03 Dec 2018 08:40:12 -0800 (PST)
MIME-Version: 1.0
References: <20181203152815.6623-1-git@andred.net>
In-Reply-To: <20181203152815.6623-1-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Dec 2018 16:40:00 +0000
Message-ID: <CAJTo0LYwiZ57t7zZBSYO51Tn2AwObKYJ6xqBExDCKr7LLssdqg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: split out blkdiscard into its own package
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
X-List-Received-Date: Mon, 03 Dec 2018 16:40:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When do we just programatically split instead of doing it piece by piece? :=
)

Ross
On Mon, 3 Dec 2018 at 15:28, Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> For systems that don't otherwise depend on the full
> util-linux package, blkdiscard is a mere 18k (on
> cortexa7t2hf-neon).
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index a05c1cabbe..b5f77f7b6b 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -27,7 +27,7 @@ DEPENDS_append_class-nativesdk =3D " lzo-native"
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION=
}/util-linux-${PV}.tar.xz \
>             "
>
> -PACKAGES =3D+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util=
-linux-sfdisk \
> +PACKAGES =3D+ "util-linux-agetty util-linux-blkdiscard util-linux-fdisk =
util-linux-cfdisk util-linux-sfdisk \
>               util-linux-swaponoff util-linux-losetup util-linux-umount \
>               util-linux-mount util-linux-readprofile util-linux-uuidd \
>               util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs =
util-linux-fsck \
> @@ -74,6 +74,7 @@ FILES_${PN}-doc +=3D "${datadir}/getopt/getopt-*.*"
>  FILES_${PN}-dev +=3D "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
>
>  FILES_util-linux-agetty =3D "${base_sbindir}/agetty"
> +FILES_util-linux-blkdiscard =3D "${sbindir}/blkdiscard"
>  FILES_util-linux-fdisk =3D "${base_sbindir}/fdisk.${BPN}"
>  FILES_util-linux-fstrim =3D "${base_sbindir}/fstrim.${BPN}"
>  FILES_util-linux-cfdisk =3D "${base_sbindir}/cfdisk"
> @@ -126,7 +127,7 @@ RDEPENDS_util-linux-su +=3D "libpam"
>  RDEPENDS_${PN} =3D "util-linux-umount util-linux-swaponoff util-linux-lo=
setup util-linux-sulogin util-linux-lsblk"
>  RDEPENDS_${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'uti=
l-linux-runuser util-linux-su', '', d)}"
>
> -RRECOMMENDS_${PN} =3D "util-linux-fdisk util-linux-cfdisk util-linux-sfd=
isk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-moun=
tpoint util-linux-prlimit util-linux-ionice util-linux-switch-root"
> +RRECOMMENDS_${PN} =3D "util-linux-blkdiscard util-linux-fdisk util-linux=
-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linu=
x-mkfs util-linux-mountpoint util-linux-prlimit util-linux-ionice util-linu=
x-switch-root"
>
>  RRECOMMENDS_${PN}_class-native =3D ""
>  RRECOMMENDS_${PN}_class-nativesdk =3D ""
> --
> 2.20.0.rc1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

