Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D65C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 10:02:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.70433.1674727355799153375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 02:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D3m1QAEu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so779490wmq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 02:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K74+/2j24NfkTT0RKwcZ3896A73yDEQk/QH9W23JobA=;
        b=D3m1QAEuJ1Hy73vxhO4ZxrdXBbB0enMGyyOjo7pskeiPq1jRgocsrbHYRPdmhiGJxh
         l5NaXOGDm7CyqBnI84f4TbnjTX8nQCJ4fHFseFkYbxD91Z04uSFjAFYWmNa3UkzkpW8S
         8mXo1Z13GaQ1Us9BqcG+kTP/Z61IHo9GhRMfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K74+/2j24NfkTT0RKwcZ3896A73yDEQk/QH9W23JobA=;
        b=Xyq29NLN3IxDZsdWJ6kBXiC10OPEbstEaFS/ZqTuabByA4cKnlH2eHfFTxd8qpZCie
         /8V2DWGtQO/u135xF4bUFs/4dkNXz7OLpl3LUAoFpdBP7B3EvG0410vtp5EwxXKw122A
         5aaTEEtTqa3Geblm/93equ9b8Zgw2cnrPkzwu7ezMeWEZDWJKHd+uB1iG5fcJuDT31tr
         yIzttFU+hoXaEatl1YnK4aklQC6G/qDN6vFPll4lUUOQDMvIR5BqqyFfRGSKoDqIRreD
         b3ATtAn7rAvxmGjZVPixFJ3quL+zoQ3PSyfyG2PyO3TJloGkm+ThPPOI0IW2TpyT7uEg
         qX0g==
X-Gm-Message-State: AFqh2kpht01zEgzHPSlH5B/96HkN5NUG1+VQIIahWqHvajfzKltrLLBf
	MK0iUJgqlEJ0nm118P8GU6dNPw==
X-Google-Smtp-Source: AMrXdXugLJCO74Z+lNZwkzjUXKYpePkXhIiC1QolbfZLnyPEXd53wQamdwtMWETZUMgSBxfFkddlfA==
X-Received: by 2002:a05:600c:1d8e:b0:3d9:efe8:a42d with SMTP id p14-20020a05600c1d8e00b003d9efe8a42dmr34725790wms.21.1674727354003;
        Thu, 26 Jan 2023 02:02:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2d7:e330:f537:35d8? ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm1025981wmn.19.2023.01.26.02.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 02:02:33 -0800 (PST)
Message-ID: <f39b351e96ff00039f526290e7ff68c7fa3c7271.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/locales: Create selftest for
 locales generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <lrannou@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2023 10:02:32 +0000
In-Reply-To: <20230125083127.53988-1-lrannou@baylibre.com>
References: <20230125083127.53988-1-lrannou@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 10:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176388

On Wed, 2023-01-25 at 09:31 +0100, Louis Rannou wrote:
> From: Louis Rannou <lrannou@baylibre.com>
>=20
> [YOCTO #9070]
>=20
> Add a new selftest to validate the locales generation. This selftest buil=
ds a
> complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
> ENABLE_BINARY_LOCALE_GENERATION set. The locales are tested through a ssh
> connection in three manners: checks if the locales exist in the locale-ar=
chive,
> if it does exist for the glibc and if it can be generated.
>=20
> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> ---
>  meta/lib/oeqa/selftest/cases/locales.py | 54 +++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/locales.py
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/self=
test/cases/locales.py
> new file mode 100644
> index 0000000000..089ca594a1
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/locales.py
> @@ -0,0 +1,54 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.core.decorator import OETestTag
> +from oeqa.utils.commands import bitbake, runqemu
> +from oeqa.utils.sshcontrol import SSHControl
> +
> +class LocalesTest(OESelftestTestCase):
> +
> +    @OETestTag("runqemu")
> +    def test_locales(self):
> +        """
> +        Summary: Test the locales through a ssh connection
> +        Expected: 1. Check the locale exist in the locale-archive
> +                  2. Check it the locale exist for the glibc
> +                  3. Check the locale can be generated
> +        Product: oe-core
> +        Author: Louis Rannou <lrannou@baylibre.com>
> +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
> +        """
> +
> +        features =3D []
> +        features.append('EXTRA_IMAGE_FEATURES =3D "ssh-server-openssh em=
pty-root-password allow-empty-password allow-root-login"')
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
> +        with runqemu("core-image-minimal") as qemu:
> +            # Attempt to ssh with each user into qemu with empty passwor=
d
> +            ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=
=3D'root')

Thanks for this, in general this looks good and it would be great to
get a test for this enabled so I'm very happy to see the patch.

I did have one question about the above line. I think you can just use
qemu.run() to run commands over ssh and I suspect the above might
create a second ssh connection which might then have lifecycle issues.
Did you try qemu.run() and have issues? I noticed a lot of our tests
use run_serial() which I hadn't realised until I looked!

Cheers,

Richard

> +            cmd =3D "locale -a"
> +            status, output =3D ssh.run(cmd)
> +            # output must includes fr_FR or fr_FR.UTF-8
> +            self.assertEqual(status, 0, msg=3D'locale -a test failed: %s=
' % output)
> +            self.assertIn("fr_FR", output, msg=3D'Incorrect output: %s' =
% output)
> +
> +            cmd =3D "localedef --list-archive -v | grep fr_FR.utf8"
> +            status, output =3D ssh.run(cmd)
> +            # output must includes fr_FR.utf8
> +            self.assertEqual(status, 0, msg=3D'localedef test failed: %s=
' % output)
> +
> +            cmd =3D "LANG=3Dfr_FR.UTF-8 locale"
> +            status, output =3D ssh.run(cmd)
> +            # output must includes fr_FR.UTF-8
> +            self.assertEqual(status, 0, msg=3D'locale test failed: %s' %=
 output)
> +            self.assertIn("LANG=3Dfr_FR.UTF-8", output,
> +                          msg=3D'Incorrect output: %s' % output)


