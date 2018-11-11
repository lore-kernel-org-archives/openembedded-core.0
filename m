Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 173AE6BE3C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 20:49:33 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id n11-v6so3264167pfb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 12:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=mfDpNzzUmm5avgdd6ov9oaCQrqLsdHm2Y/QUQBqiiIQ=;
	b=ri4KBvaotHeKnlAnsRcMhoeHbo8HeSeIX8hfWxYO56rKYim5JbmmRZ6KdBzXNT80eK
	OygZ4BFjAcniELjKJfK3XCiLLTeV22UAowYtOGQsMBJ2ZhG38LgO0Zx1wEUeEDxQ4cHG
	cH8bvpqAW8f+O36SXtSls9dHU31GCvVETN71C6FdmTOY+ZE6QRWcdmOgt8L4FFogOUHG
	VBytGLNyle4bG12JwqlhQaS3b9PAo28ojxIW6SmpwFiAh4UPgPoxJ1abWApJ7mtTcxBV
	2QQJcFzBvhGYutCxqIusXYhvk+y2bk/MZYoTYUAhrsTfwE4eOFB9bGiMzrMTZp8NQNq5
	mwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=mfDpNzzUmm5avgdd6ov9oaCQrqLsdHm2Y/QUQBqiiIQ=;
	b=RvfdRhk72la8ay3IxOME5vpuHizTM4YRwIbYjMj4sReYdpUvUnjKglGQ7wCoPAx6z0
	FMsHXK37ebzGSRqyScCnuvnS30YwYlT0aCLrbnO/bVifmGDAZptnFaWh38O8lDeFZp60
	2zFJdhJT5pp+m1gak6tH/0UbB49ZrvQKhdERqP2r/rF2v3h5UJ5UbeBVpNgJfpYgqZZs
	pJS4E7AamuDV+6BwEf5jn9DrwsTx6pcPnpc60oS062MVXC3JuQMVTQDug+OePCorMobB
	QOtY1oLNdolJjyt90b7QuGabr2qRTcUn/6626yOhx/alBVqbqM//DF4+TPnn34epXHkh
	of4A==
X-Gm-Message-State: AGRZ1gLaSZHSx6XJsPYODDiGhgyFe8kOutZ0AfiUzJb8GKNG6X+0rDoc
	dzT8WhcVZNUMZhIT3yGpC+u7eZrz
X-Google-Smtp-Source: AJdET5dRLbimFbKj6W2+2hVO9Kd0xUdNp5TqsVcfvGqPAFYYj2zWSIbgviZX2wBLvuIZwScJkQAcuA==
X-Received: by 2002:a62:4896:: with SMTP id
	q22-v6mr17666585pfi.248.1541969374644; 
	Sun, 11 Nov 2018 12:49:34 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:7077:6962:50cb:42de?
	([2601:202:4180:c33:7077:6962:50cb:42de])
	by smtp.gmail.com with ESMTPSA id
	n87-v6sm17658011pfb.62.2018.11.11.12.49.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Nov 2018 12:49:34 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
	<20181109142912.23102-8-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <74c3b1de-4f26-f086-2adb-36022d344b7a@gmail.com>
Date: Sun, 11 Nov 2018 12:49:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181109142912.23102-8-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 08/12] testimage: Simplfy DEFAULT_TEST_SUITES logic
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
X-List-Received-Date: Sun, 11 Nov 2018 20:49:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 11/9/18 6:29 AM, Richard Purdie wrote:
> Now that the tests have correct markup to automatically determine which=
 images
> they can run against, clean up the default test suites logic to be simp=
ler
> and not image specific.
> Some cleanup of the compiler tests still needs to be completed but this=

> is a good first step.
>
> The only downside to this is more noise during testing as we now see
> many skipped messages for simple images like core-image-minimal.
>
> The auto type is being removed since it currently breaks badly due to t=
he
> socat mandatory inclusion from the meta-selftest layer which is a probl=
em
> which needs to be addressed seperately.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/testimage.bbclass | 31 ++++++-------------------------
>  1 file changed, 6 insertions(+), 25 deletions(-)
>
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bb=
class
> index ba2d9c491b2..b8acd3ce782 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -40,31 +40,12 @@ TEST_NEEDED_PACKAGES_DIR ?=3D "${WORKDIR}/testimage=
/packages"
>  TEST_EXTRACTED_DIR ?=3D "${TEST_NEEDED_PACKAGES_DIR}/extracted"
>  TEST_PACKAGED_DIR ?=3D "${TEST_NEEDED_PACKAGES_DIR}/packaged"
> =20
> -PKGMANTESTSUITE =3D "\
> -    ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'dnf rpm', '', d)} \
> -    ${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg', '', d)} \
> -    ${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt', '', d)} \
> -    "
> -SYSTEMDSUITE =3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
> -MINTESTSUITE =3D "ping"
> -NETTESTSUITE =3D "${MINTESTSUITE} ssh df date scp oe_syslog ${SYSTEMDS=
UITE}"
> -DEVTESTSUITE =3D "gcc kernelmodule ldd"
> -PTESTTESTSUITE =3D "${MINTESTSUITE} ssh scp ptest"
> -
> -DEFAULT_TEST_SUITES =3D "${MINTESTSUITE} auto"
> -DEFAULT_TEST_SUITES_pn-core-image-minimal =3D "${MINTESTSUITE}"
> -DEFAULT_TEST_SUITES_pn-core-image-minimal-dev =3D "${MINTESTSUITE}"
> -DEFAULT_TEST_SUITES_pn-core-image-full-cmdline =3D "${NETTESTSUITE} pe=
rl python logrotate ptest"
> -DEFAULT_TEST_SUITES_pn-core-image-x11 =3D "${MINTESTSUITE}"
> -DEFAULT_TEST_SUITES_pn-core-image-lsb =3D "${NETTESTSUITE} pam parselo=
gs ${PKGMANTESTSUITE} ptest"
> -DEFAULT_TEST_SUITES_pn-core-image-sato =3D "${NETTESTSUITE} connman xo=
rg parselogs ${PKGMANTESTSUITE} \
> -    ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)} pte=
st gi"
> -DEFAULT_TEST_SUITES_pn-core-image-sato-sdk =3D "${NETTESTSUITE} buildc=
pio buildlzip buildgalculator \
> -    connman ${DEVTESTSUITE} logrotate perl parselogs python ${PKGMANTE=
STSUITE} xorg ptest gi stap"
> -DEFAULT_TEST_SUITES_pn-core-image-lsb-dev =3D "${NETTESTSUITE} pam per=
l python parselogs ${PKGMANTESTSUITE} ptest gi"
> -DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk =3D "${NETTESTSUITE} buildcp=
io buildlzip buildgalculator \
> -    connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${PKGM=
ANTESTSUITE} ptest gi stap"
> -DEFAULT_TEST_SUITES_pn-meta-toolchain =3D "auto"
> +BASICTESTSUITE =3D "ping date df ssh scp python perl apt opkg gi ptest=
 dnf rpm parselogs logrotate connman systemd oe_syslog pam stap ldd xorg"=


So now you are forcing me to run all those test if I just want to run
"Ptests" for my layer that don't have any of those additional pieces.

can we re-instate a basic "PTEST" variable so the rest of use can
leverage a common define? if not, i will have do it locally in my layer.

Nak for now.

- armin

> +DEVTESTSUITE =3D "gcc kernelmodule buildcpio buildlzip buildgalculator=
 "
> +
> +DEFAULT_TEST_SUITES =3D "${BASICTESTSUITE}"
> +DEFAULT_TEST_SUITES_pn-core-image-sato-sdk =3D "${BASICTESTSUITE} ${DE=
VTESTSUITE}"
> +DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk =3D "${BASICTESTSUITE} ${DEV=
TESTSUITE}"
> =20
>  # aarch64 has no graphics
>  DEFAULT_TEST_SUITES_remove_aarch64 =3D "xorg"


