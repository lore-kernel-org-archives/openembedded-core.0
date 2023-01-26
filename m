Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC21C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 10:15:22 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.70573.1674728112101315759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 02:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a57+kWtM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id b7so1249110wrt.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 02:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJkT79mooLl4AZszwRwClOz+9q+MvSsdfq2g4jBdhFI=;
        b=a57+kWtMekqND/VBjwz2XKOnVPtQ+JTyiToxCfdQZcCP8pFO7W9Gjdghkt9j0upFKc
         5qJUaz2FOqii4K52AHF0cOAarednvE4n35q2QE1wCmEZ0qp9Ll4tpu2IC48Fs6phgNiw
         ii3oFa7DPIb/mvuPSNOcxFfU3I459yiopx4GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oJkT79mooLl4AZszwRwClOz+9q+MvSsdfq2g4jBdhFI=;
        b=fzh97RKunZtlJUpxNtwGbUjUXK+zn039N8L6/oYzZSwSIVBjmEkel3omHOLXwMbi7Q
         SgW5SlTPShDGDSU7pATgQF6Tx0jjjjER/fzUYFLWx+8wuQd8CsuXOGU+XFBhw2fJs3d1
         XNYItwWG1lv5vw6ahilVPF4q4IHFHa8MitRS4FSWPVMwBDSEWOO6Z27B+Xf6w5Ibq6gH
         eniejo9HmKX4gQGBKYDJFer/Bw+qXY6KHdqi3TrRb6bI5tpjiztt8RhvxJ4tvmHCKh9q
         l/wLSjsc/f9B86NydhKqitNJ4Q7uVdgai52Tv0/11aoa/4in6e0gujWNP4adkVFgucPI
         9BIg==
X-Gm-Message-State: AFqh2kpcL0ssvSq2yBSlaapR8wlNa1ppAbIp7lH80Hono+D3j6JAgQyP
	8YpbrK2pvx4UVF+Nj0+DruZPq20t35Yx9dS0
X-Google-Smtp-Source: AMrXdXvjRUc4PjX966aOkWVfATGh5DrRna6se6iud7G3Rjw35K1BIv8qrDdZ58rICJgmYP07RKgK/A==
X-Received: by 2002:a05:6000:16ce:b0:2be:d04:3667 with SMTP id h14-20020a05600016ce00b002be0d043667mr37422456wrf.26.1674728110216;
        Thu, 26 Jan 2023 02:15:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2d7:e330:f537:35d8? ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id e2-20020adfe382000000b002bfae43109fsm860199wrm.93.2023.01.26.02.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 02:15:09 -0800 (PST)
Message-ID: <de1cd98004d72f55e48fb4185bc24828e2195820.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/locales: Create selftest for
 locales generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <lrannou@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2023 10:15:09 +0000
In-Reply-To: <4479c710-1384-dd7b-ad6b-be756025e3bb@baylibre.com>
References: <20230125083127.53988-1-lrannou@baylibre.com>
	 <f39b351e96ff00039f526290e7ff68c7fa3c7271.camel@linuxfoundation.org>
	 <4479c710-1384-dd7b-ad6b-be756025e3bb@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 10:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176390

On Thu, 2023-01-26 at 11:09 +0100, Louis Rannou wrote:
> On 26/01/2023 11:02, Richard Purdie wrote:
> > On Wed, 2023-01-25 at 09:31 +0100, Louis Rannou wrote:
> > > From: Louis Rannou <lrannou@baylibre.com>
> > >=20
> > > [YOCTO #9070]
> > >=20
> > > Add a new selftest to validate the locales generation. This selftest =
builds a
> > > complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
> > > ENABLE_BINARY_LOCALE_GENERATION set. The locales are tested through a=
 ssh
> > > connection in three manners: checks if the locales exist in the local=
e-archive,
> > > if it does exist for the glibc and if it can be generated.
> > >=20
> > > Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> > > ---
> > >   meta/lib/oeqa/selftest/cases/locales.py | 54 ++++++++++++++++++++++=
+++
> > >   1 file changed, 54 insertions(+)
> > >   create mode 100644 meta/lib/oeqa/selftest/cases/locales.py
> > >=20
> > > diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/=
selftest/cases/locales.py
> > > new file mode 100644
> > > index 0000000000..089ca594a1
> > > --- /dev/null
> > > +++ b/meta/lib/oeqa/selftest/cases/locales.py
> > > @@ -0,0 +1,54 @@
> > > +#
> > > +# SPDX-License-Identifier: MIT
> > > +#
> > > +
> > > +from oeqa.selftest.case import OESelftestTestCase
> > > +from oeqa.core.decorator import OETestTag
> > > +from oeqa.utils.commands import bitbake, runqemu
> > > +from oeqa.utils.sshcontrol import SSHControl
> > > +
> > > +class LocalesTest(OESelftestTestCase):
> > > +
> > > +    @OETestTag("runqemu")
> > > +    def test_locales(self):
> > > +        """
> > > +        Summary: Test the locales through a ssh connection
> > > +        Expected: 1. Check the locale exist in the locale-archive
> > > +                  2. Check it the locale exist for the glibc
> > > +                  3. Check the locale can be generated
> > > +        Product: oe-core
> > > +        Author: Louis Rannou <lrannou@baylibre.com>
> > > +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
> > > +        """
> > > +
> > > +        features =3D []
> > > +        features.append('EXTRA_IMAGE_FEATURES =3D "ssh-server-openss=
h empty-root-password allow-empty-password allow-root-login"')
> > > +        features.append('IMAGE_INSTALL:append =3D " glibc-utils loca=
ledef"')
> > > +        features.append('GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 fr_=
FR.UTF-8"')
> > > +        features.append('IMAGE_LINGUAS:append =3D " en-us fr-fr"')
> > > +        features.append('ENABLE_BINARY_LOCALE_GENERATION =3D "1"')
> > > +        self.write_config("\n".join(features))
> > > +
> > > +        # Build a core-image-minimal
> > > +        bitbake('core-image-minimal')
> > > +
> > > +        with runqemu("core-image-minimal") as qemu:
> > > +            # Attempt to ssh with each user into qemu with empty pas=
sword
> > > +            ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, =
user=3D'root')
> >=20
> > Thanks for this, in general this looks good and it would be great to
> > get a test for this enabled so I'm very happy to see the patch.
> >=20
> > I did have one question about the above line. I think you can just use
> > qemu.run() to run commands over ssh and I suspect the above might
> > create a second ssh connection which might then have lifecycle issues.
> > Did you try qemu.run() and have issues? I noticed a lot of our tests
> > use run_serial() which I hadn't realised until I looked!
> Hello, I haven't tried qemu as the bugzilla said to use a ssh=20
> connection. But I guess this was different in 2013. I agree, it might be=
=20
> better to avoid the ssh connection.

To be clear, qemu.run() should run the command over an ssh connection
to qemu if I remember the code paths correctly. It is just abstracted
in the runqemu code so the test doesn't need to worry about it.

> Also, the bugzilla asks to make a primary test with=20
> ENABLE_BINARY_LOCALE_GENERATION=3D"0" to check the locales are not gener.=
=20
> This means a complete regeneration of the image, so I thought it is not=
=20
> very relevant. Is this fine ?

Ideally we'd have two tests, one for binary locales enabled and one
with it not enabled. That will mean a little more build time but would
completely test the different options so is probably worth doing. I'd
be happy for *any* automated locale tests at this point though!

We shouldn't close the bug until we have both tests.

Cheers,

Richard



