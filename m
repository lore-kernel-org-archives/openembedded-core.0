Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966F2C636D7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 13:49:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.23400.1675259347551018953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 05:49:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cIcaL+W7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso1411841wms.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 05:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rXraQWQ23e0qVreqv2lM/X94bSA1PFnFNMHDfptEVw=;
        b=cIcaL+W7i9+We/WRlvESbNeEL7t+Ic8KPOJpcTlEu5G3m+SEoRxePlcgVbPvDUJhMM
         rXkFtpcGwVVdxEjdCAc6aFUaNJCe+qKTYaZKHLFZaEV8i/5518O5L5ST/lWqOf/hyfjR
         cL4EmEJLGE6vI1Ts+xCJRWXC0klS2Uw0pz9I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0rXraQWQ23e0qVreqv2lM/X94bSA1PFnFNMHDfptEVw=;
        b=VqRyV8afDvOBPVmAEmaDFxOisPE6oPIOYCuE5jA6K4AfgPt/vKlqyy2nRgkxPL7uk2
         9MRH2NAmYCmNHheWFjBXuSsarSwsGoTFwYMhWW5Bj/N+KoT/P/7TywvTEpGcYZqkPWOP
         tz8bkNT+bwzJ56gboQS+OemVJzksm+TQevXrRQBS2WoGVJGdgWKUwhO7KuMHVZ8VCr/8
         9iYeD8gdqrHDfJtkR2O0QPv9U2tAvWbdlvD0vrmIpl1ACh8IRb00gpvIt4SbF7IV/vTL
         qDeyg6SeeM0ZO9R4+YOFAex5cB6kyQuGFCg2LPKilgnGc1/5zsR1LrBsZ2CCmoItrdJo
         TcHg==
X-Gm-Message-State: AO0yUKXVZBo8d1P+icKGCC07cqUGXbGQBDO0X9DiCXG2g/D3aMThZSQ3
	UQMZNAR38uA4SZIBN5+ymc31Gg==
X-Google-Smtp-Source: AK7set/rK9qqpBHkWqMIoaHfHKiCkw9LFqYrjmoyWxI1DE8+7hes057NGs15IAN3rG9EQ7q1etm4Sg==
X-Received: by 2002:a05:600c:4f42:b0:3dc:5984:a16c with SMTP id m2-20020a05600c4f4200b003dc5984a16cmr2156044wmq.31.1675259345750;
        Wed, 01 Feb 2023 05:49:05 -0800 (PST)
Received: from [172.27.244.82] ([212.187.182.164])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d4d0c000000b002bbb2d43f65sm17430449wrt.14.2023.02.01.05.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 05:49:05 -0800 (PST)
Message-ID: <b3320afb6afb6508d5f4d0f3ceb75e87e97ed450.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] oeqa/selftest/locales: Create selftest for
 locales generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <lrannou@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Feb 2023 13:49:04 +0000
In-Reply-To: <20230127153344.2868589-1-lrannou@baylibre.com>
References: <20230127153344.2868589-1-lrannou@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 13:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176530

On Fri, 2023-01-27 at 16:33 +0100, Louis Rannou wrote:
> From: Louis Rannou <lrannou@baylibre.com>
>=20
> [YOCTO #9070]
>=20
> Add a new selftest to validate the locales generation. This selftest buil=
ds a
> complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
> ENABLE_BINARY_LOCALE_GENERATION set.
>=20
> The tests has two cases: GLIBC_GENERATE_LOCALES=3D1 and
> GLIBC_GENERATE_LOCALES=3D0. When set to 1, we check that the locales exis=
t in the
> local-archive and if it does exist for the glibc. When set to 0, we check=
 it
> does not.
>=20
> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> ---
>  meta/lib/oeqa/selftest/cases/locales.py | 81 +++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/locales.py
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/self=
test/cases/locales.py
> new file mode 100644
> index 0000000000..f053cc8e31
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/locales.py
> @@ -0,0 +1,81 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.core.decorator import OETestTag
> +from oeqa.utils.commands import bitbake, runqemu
> +
> +class LocalesTest(OESelftestTestCase):
> +
> +    @OETestTag("runqemu")
> +    def test_locales_on(self):
> +        """
> +        Summary: Test the locales are generated
> +        Expected: 1. Check the locale exist in the locale-archive
> +                  2. Check the locale exist for the glibc
> +                  3. Check the locale can be generated
> +        Product: oe-core
> +        Author: Louis Rannou <lrannou@baylibre.com>
> +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
> +        """
> +
> +        features =3D []
> +        features.append('EXTRA_IMAGE_FEATURES =3D "empty-root-password a=
llow-empty-password allow-root-login"')
> +        features.append('IMAGE_INSTALL:append =3D " glibc-utils localede=
f"')
> +        features.append('GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 fr_FR.U=
TF-8"')
> +        features.append('IMAGE_LINGUAS:append =3D " en-us fr-fr"')
> +        features.append('ENABLE_BINARY_LOCALE_GENERATION =3D "1"')
> +        self.write_config("\n".join(features))
> +
> +        # Build a core-image-minimal
> +        bitbake('core-image-minimal')
> +
> +        with runqemu("core-image-minimal", ssh=3DFalse, runqemuparams=3D=
'nographic') as qemu:
> +            cmd =3D "locale -a"
> +            status, output =3D qemu.run_serial(cmd)
> +            # output must includes fr_FR or fr_FR.UTF-8
> +            self.assertEqual(status, 1, msg=3D'localedef test failed: ou=
tput: %s' % output)
> +            self.assertIn("fr_FR", output, msg=3D'locale -a test failed:=
 output: %s' % output)
> +
> +            cmd =3D "localedef --list-archive -v"
> +            status, output =3D qemu.run_serial(cmd)
> +            # output must includes fr_FR.utf8
> +            self.assertEqual(status, 1, msg=3D'localedef test failed: ou=
tput: %s' % output)
> +            self.assertIn("fr_FR.utf8", output, msg=3D'locale -a test fa=
iled: output: %s' % output)
> +
> +    @OETestTag("runqemu")
> +    def test_locales_off(self):
> +        """
> +        Summary: Test the locales are not generated
> +        Expected: 1. Check the locale does not exist in the locale-archi=
ve
> +                  2. Check the locale does not exist for the glibc
> +                  3. Check the locale cannot be generated
> +        Product: oe-core
> +        Author: Louis Rannou <lrannou@baylibre.com>
> +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
> +        """
> +
> +        features =3D []
> +        features.append('EXTRA_IMAGE_FEATURES =3D "empty-root-password a=
llow-empty-password allow-root-login"')
> +        features.append('IMAGE_INSTALL:append =3D " glibc-utils localede=
f"')
> +        features.append('GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 fr_FR.U=
TF-8"')
> +        features.append('IMAGE_LINGUAS:append =3D " en-us fr-fr"')
> +        features.append('ENABLE_BINARY_LOCALE_GENERATION =3D "0"')
> +        self.write_config("\n".join(features))
> +
> +        # Build a core-image-minimal
> +        bitbake('core-image-minimal')
> +
> +        with runqemu("core-image-minimal", ssh=3DFalse, runqemuparams=3D=
'nographic') as qemu:
> +            cmd =3D "locale -a"
> +            status, output =3D qemu.run_serial(cmd)
> +            # output must not includes fr_FR or fr_FR.UTF-8
> +            self.assertEqual(status, 1, msg=3D'localedef test failed: ou=
tput: %s' % output)

This should really say locale instead of localedef here to be clear
which command the error is coming from.

> +            self.assertNotIn("fr_FR", output, msg=3D'locale -a test fail=
ed: output: %s' % output)
> +
> +            cmd =3D "localedef --list-archive -v"
> +            status, output =3D qemu.run_serial(cmd)
> +            # output must not includes fr_FR.utf8
> +            self.assertEqual(status, 1, msg=3D'localedef test failed: ou=
tput: %s' % output)
> +            self.assertNotIn("fr_FR.utf8", output, msg=3D'locale -a test=
 failed: output: %s' % output)

We did run this through tests on the autobuilder and the tests did
pass. I did wonder rather than duplicate the whole test with a line
change, could we share the code between the two?

I then start looking at the code and I'm a bit worried the locales are
not present when binary locale generation is turned off as I think they
should be. Going from memory, I thought that they should be generated
on target at first boot in that case so they should be present in both
cases.

To keep things simple, lets merge the first case in and file a bug for
the other case? I think we'll need to investigate that and check
whether we're broken something somewhere.

Cheers,

Richard


