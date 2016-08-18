Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id C92A66FEF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 15:45:50 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g202so2147947pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 08:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=juGw/PG4IZgCkFfq2AVFONv/SYU8kuoJWfJZGicvLVA=;
	b=n1JGK6e3LYqsiJz1RQ/ORCVtSdIqgzj9wCraOWPo2UrCVbwomKLvebIFw9vS1t2ohC
	snvTGwnbv9xmutF9Qx8kDn23/UIhhCGKatsKZ86SJCiBJsM8AH6suyO0dkMgzs8FCNe+
	LI219bQHjxR+sHOMpju8vivWTDgE+CAZuldMwC5KHMtElZTAS9v1RNamOuhneeDYbYxW
	sHAsXq+FZVQtJdaa15S2GAuLStYzExemHfEk6odX2ofJTuum8eXKBmhZTlsaDo4PJDR9
	as4kejzUWlvylfwPBcy54AE9o4eTy3temmu8oMxtBbkZhJUCKD35yGAXoKEesZWeBLqw
	TCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=juGw/PG4IZgCkFfq2AVFONv/SYU8kuoJWfJZGicvLVA=;
	b=QyePB28w5Aol8/wniDI11pmdbqii6aZg3a6Wt/i/teJgCiIG2ul7B3s2FBglTPhv+P
	+q2uCaKUMYC4M2OoMqELKG+Qfq/VC6sydzRScvAKlM2p/2LLcu4Q6dt8WJtvs+NtJwUf
	iDH2z21tXSvefIHpB5y6nfeIqbVVzKIoMx157e/Hb4CQZJzHOTtHOZvrOP/BMYL+jVko
	cpHIUeUjg586ReenCOtmW3PASAxLazyZgh8HeegDid0TX2YzGc1DMHu0Zx2fU2EKHJ8z
	NM0os+ORFcm/2Z/+bCe0CKYPBPusNqUCpW4ZTZ9oekTWG65Q2h2I04mLwrKlx01HArjs
	ZWZg==
X-Gm-Message-State: AEkoousxWTtwdH6ecwvG2tm62AFMQ9REgh9+IA07t0fXw8J2JFtZIfwe7eOwkUUuv+mrzw==
X-Received: by 10.98.158.78 with SMTP id s75mr5195065pfd.137.1471535151074;
	Thu, 18 Aug 2016 08:45:51 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:e111:2047:280c:be38?
	([2601:647:4c00:3edf:e111:2047:280c:be38])
	by smtp.gmail.com with ESMTPSA id
	p64sm4787907pfd.11.2016.08.18.08.45.49
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 08:45:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160729222801.9806-1-raj.khem@gmail.com>
Date: Thu, 18 Aug 2016 08:45:48 -0700
Message-Id: <5346A37C-FD8C-4EFB-B3D1-A0E692F74EC5@gmail.com>
References: <20160729222801.9806-1-raj.khem@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH 1/3] linux-dtb.inc: Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Thu, 18 Aug 2016 15:45:51 -0000
X-Groupsio-MsgNum: 85895
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2368D3CB-EBEE-4BAB-AD8A-7315191F5FBE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2368D3CB-EBEE-4BAB-AD8A-7315191F5FBE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Armin

Can this be back ported to krogoth please?

> On Jul 29, 2016, at 3:27 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> From: Herve Jourdain <herve.jourdain@neuf.fr>
>=20
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-kernel/linux/linux-dtb.inc | 18 +++++++++++-------
> 1 file changed, 11 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc =
b/meta/recipes-kernel/linux/linux-dtb.inc
> index 74f5ef8..8528d64 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -33,12 +33,13 @@ do_compile_append() {
> do_install_append() {
> 	for DTB in ${KERNEL_DEVICETREE}; do
> 		DTB=3D`normalize_dtb "${DTB}"`
> -		DTB_BASE_NAME=3D`basename ${DTB} .dtb`
> +		DTB_EXT=3D${DTB##*.}
> +		DTB_BASE_NAME=3D`basename ${DTB} ."${DTB_EXT}"`
> 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> 			=
symlink_name=3D${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> 			DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed =
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
> 			DTB_PATH=3D`get_real_dtb_path_in_kernel =
"${DTB}"`
> -			install -m 0644 ${DTB_PATH} =
${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> +			install -m 0644 ${DTB_PATH} =
${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
> 		done
> 	done
> }
> @@ -46,7 +47,8 @@ do_install_append() {
> do_deploy_append() {
> 	for DTB in ${KERNEL_DEVICETREE}; do
> 		DTB=3D`normalize_dtb "${DTB}"`
> -		DTB_BASE_NAME=3D`basename ${DTB} .dtb`
> +		DTB_EXT=3D${DTB##*.}
> +		DTB_BASE_NAME=3D`basename ${DTB} ."${DTB_EXT}"`
> 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> 			base_name=3D${type}"-"${KERNEL_IMAGE_BASE_NAME}
> 			=
symlink_name=3D${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> @@ -54,8 +56,8 @@ do_deploy_append() {
> 			DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed =
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
> 			DTB_PATH=3D`get_real_dtb_path_in_kernel =
"${DTB}"`
> 			install -d ${DEPLOYDIR}
> -			install -m 0644 ${DTB_PATH} =
${DEPLOYDIR}/${DTB_NAME}.dtb
> -			ln -sf ${DTB_NAME}.dtb =
${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
> +			install -m 0644 ${DTB_PATH} =
${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
> +			ln -sf ${DTB_NAME}.${DTB_EXT} =
${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
> 		done
> 	done
> }
> @@ -65,9 +67,10 @@ pkg_postinst_kernel-devicetree () {
> 	for DTB in ${KERNEL_DEVICETREE}; do
> 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> 			=
symlink_name=3D${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +			DTB_EXT=3D${DTB##*.}
> 			DTB_BASE_NAME=3D`basename ${DTB} | awk -F "." =
'{print $1}'`
> 			DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed =
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -			update-alternatives --install =
/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb =
/boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +			update-alternatives --install =
/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} =
${DTB_BASE_NAME}.${DTB_EXT} =
/boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || =
true
> 		done
> 	done
> }
> @@ -77,9 +80,10 @@ pkg_postrm_kernel-devicetree () {
> 	for DTB in ${KERNEL_DEVICETREE}; do
> 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> 			=
symlink_name=3D${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +			DTB_EXT=3D${DTB##*.}
> 			DTB_BASE_NAME=3D`basename ${DTB} | awk -F "." =
'{print $1}'`
> 			DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed =
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -			update-alternatives --remove =
${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb =
${KERNEL_PRIORITY} || true
> +			update-alternatives --remove =
${DTB_BASE_NAME}.${DTB_EXT} =
/boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || =
true
> 		done
> 	done
> }
> --
> 2.9.0
>=20


--Apple-Mail=_2368D3CB-EBEE-4BAB-AD8A-7315191F5FBE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle12DEACgkQuwUzVZGdMxRr5ACggy6FCk7orVStRUZEH6vfM0YJ
lZQAnjR/3u9yEEFtfk4xkQRUPq+/H2Iv
=EY3E
-----END PGP SIGNATURE-----

--Apple-Mail=_2368D3CB-EBEE-4BAB-AD8A-7315191F5FBE--
