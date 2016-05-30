Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 36012771DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 11:28:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a136so21791574wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 04:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=pdQIoZ9tLzEKiE9smQw6m/SsbtHsTi+cr2xzgxlPIf8=;
	b=zra10eq5p92xE5pTbIbay8p8KYm2q3iJmWQVDRuG6/N8LVVP2e8iJlTxnH/sLNMrv1
	HNhsJODcIoWOk1b7vsGYm//fC1K/LEJD7+B1pW6fo6lxIQqfye5Ed167MfS91hb2lZR4
	KAFrU9PEzdhfmiW9V0j9fwaWG+cqrJc7hbI6cx9EhvTMNGH2zPrawCEXVY9r3KPFGe5/
	3bnUTmaS5xSmRctlCO4AH7lQNLosjaMtLtaME3ChQV4XyzEJPU/d6uhdTtuMCozTR3Cw
	0NMzcHmbmckoaXWWuOAYlwr2qXOWyroEF5a7jWc433DEcD1aSf6jOOsEg7+3xk8XTAP7
	elJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=pdQIoZ9tLzEKiE9smQw6m/SsbtHsTi+cr2xzgxlPIf8=;
	b=NpZz7PS89Kg5g/yoBTnBY4J5YAmzhSvaOMVoMM2bnNsBsPE1pMtt4ZeagAKkHVjwzS
	RWteOA4MS9Epe2ZgRltEvmVnXlQf5af+s5vhBCbRUz7+q5wnh1IS+22R8zY52Qp9AYWG
	inVSYpEolJf4Is1zKXwtzYqyu1g7Gx0410ico1xk6nnrQhXg/ghNsUFElPdH6dCYQ3ZZ
	fj0Nr/aePb0aVS6r3U1SbrXu20XawbjVn6ID1txxnbGLZMabpN/MOPXgU3m34zxgh+FU
	hWH6XG5rZhkArcn4ay+GWm4vQHNRDPoS7sEffKaYETA3Wa1lyK3ttjo1ezKwGfFgt3Ud
	d8CA==
X-Gm-Message-State: ALyK8tJ28s4J6f83vT3cMht9OOEcI3NQ4016UGfHYAeu4dBhdWmKI5TyFKTp0YV+s4al5Q==
X-Received: by 10.28.88.206 with SMTP id m197mr9976592wmb.43.1464607688842;
	Mon, 30 May 2016 04:28:08 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	p9sm28242032wjv.21.2016.05.30.04.28.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2016 04:28:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1464025857-23995-1-git-send-email-koen.kooi@linaro.org>
Date: Mon, 30 May 2016 13:28:06 +0200
Message-Id: <0FCEA83D-C569-48F0-AFAA-2E9D5BD96820@dominion.thruhere.net>
References: <1464025857-23995-1-git-send-email-koen.kooi@linaro.org>
To: Koen Kooi <koen.kooi@linaro.org>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "image.bbclass: don't execute compression commands multiple times"
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
X-List-Received-Date: Mon, 30 May 2016 11:28:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

> Op 23 mei 2016, om 19:50 heeft Koen Kooi <koen.kooi@linaro.org> het =
volgende geschreven:
>=20
> The commit breaks image_types_uboot.bbclass:
>=20
> ERROR: Logfile of failure stored in: =
/build/linaro/build/build/tmp-glibc/work/genericarmv8-oe-linux/linaro-imag=
e-minimal-initramfs/1.0-r0/temp/log.do_image_cpio.16506
> Log data follows:
> | DEBUG: Executing python function set_image_size
> | DEBUG: Python function set_image_size finished
> | DEBUG: Executing shell function do_image_cpio
> | 31373 blocks
> | Image Name:   linaro-image-minimal-initramfs-g
> | Created:      Mon May 23 19:38:56 2016
> | Image Type:   ARM Linux RAMDisk Image (gzip compressed)
> | Data Size:    7326620 Bytes =3D 7154.90 kB =3D 6.99 MB
> | Load Address: 00000000
> | Entry Point:  00000000
> | mkimage: Can't open =
/build/linaro/build/build/tmp-glibc/deploy/images/genericarmv8/linaro-imag=
e-minimal-initramfs-genericarmv8-20160523173835.rootfs.cpio.gz: No such =
file or directory
>=20
> This reverts commit 94f61c2682e5cfd819ac84535650c3e0a654415a.
>=20
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
> meta/classes/image.bbclass | 8 ++------
> 1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 9f4c83f..df3bd3a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -410,13 +410,9 @@ python () {
>                     # Create input image first.
>                     gen_conversion_cmds(type)
>                     localdata.setVar('type', type)
> -                    cmd =3D "\t" + localdata.getVar("COMPRESS_CMD_" + =
ctype, True)
> -                    if cmd not in cmds:
> -                        cmds.append(cmd)
> +                    cmds.append("\t" + =
localdata.getVar("COMPRESS_CMD_" + ctype, True))
>                     vardeps.add('COMPRESS_CMD_' + ctype)
> -                    subimage =3D type + "." + ctype
> -                    if subimage not in subimages:
> -                        subimages.append(subimage)
> +                    subimages.append(type + "." + ctype)
>                     if type not in alltypes:
>                         =
rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe}"))
>=20
> --=20
> 2.4.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


