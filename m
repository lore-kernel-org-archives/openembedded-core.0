Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9E9C38142
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:57:15 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.30798.1675274234914157034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QYnuK4Qw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id m14so17627073wrg.13
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 09:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KRQOSpLXFGuv1t8H4DNlKtzoCf+aSZrBaOsRzTJfrG0=;
        b=QYnuK4QwNOzw9yatJNiD63ZZNgRIbGwH77gJM4i1lkaRluXaf68NP2MA4Sa/LdHvil
         FWC9GVw7IASMmUPGDlu9IBnoRSQXj3GB0vzpvxp8H23m7R2gOB6OM2kOvBDMfdwBPnlb
         emaXz9pP9ySbyBqXGqjrWbyx8HjlekBbKIG9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KRQOSpLXFGuv1t8H4DNlKtzoCf+aSZrBaOsRzTJfrG0=;
        b=JhFlVoKNMBLS97a3rBMdeJ+XDOhuYpSumhll0cMatj1yIHPFHNJGonVyzCRJdWsQ+c
         AVjz85i+940Mdc2wLLEQfCZZzrPejXYEufyaRUVZ+XPi4IAtpuCaHhpkqDBCr6Pc+l3c
         dO/ORIpDr29w4SVQRVM6n7XHfdI0kVeItkURxUq52vmFpwWV+0lLEOiOeJaSj6BMfB4K
         yPUcRzF/yEedZxH/81DSjnjdqubZnKJZGuKKwR/mzykxSdexQfqoc2i3aKdjjHsXlbIR
         AN+ofLQZQzxBdO/O+sKlipTiMlnAhjGpJ7bC4FLNM9KJDmx8SfiE1aeHJf1rBaf/5Bzw
         SJ3Q==
X-Gm-Message-State: AO0yUKXFC8joG4q7VnK1MyHNZz6MTVyW7YyMpPl1+fimqgMJNByLoqC1
	WIH11kj8sb/AS91Ua/IGuSCNKA==
X-Google-Smtp-Source: AK7set8TZAv2zk3rudwIMFjMU+CrlNae1ly+unJwY1wxbcJOSlYH7yeQHRj8cS3HmwZA67Kv4uxKlQ==
X-Received: by 2002:a5d:4d84:0:b0:2bf:f5c0:8b65 with SMTP id b4-20020a5d4d84000000b002bff5c08b65mr3112720wru.70.1675274233159;
        Wed, 01 Feb 2023 09:57:13 -0800 (PST)
Received: from [172.27.244.82] ([212.187.182.164])
        by smtp.gmail.com with ESMTPSA id j5-20020adff005000000b002bddd75a83fsm17602036wro.8.2023.02.01.09.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 09:57:12 -0800 (PST)
Message-ID: <913abc23f1ba2691f7c676b182b1ec0303e5d30d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] oeqa/selftest/locales: Create selftest for
 locales generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <lrannou@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Cc: "khilman@baylibre.com" <khilman@baylibre.com>
Date: Wed, 01 Feb 2023 17:57:12 +0000
In-Reply-To: <92bff1e0-aa88-c713-049f-51f074569a55@baylibre.com>
References: <20230127153344.2868589-1-lrannou@baylibre.com>
	 <b3320afb6afb6508d5f4d0f3ceb75e87e97ed450.camel@linuxfoundation.org>
	 <92bff1e0-aa88-c713-049f-51f074569a55@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176660

On Wed, 2023-02-01 at 16:02 +0100, Louis Rannou wrote:
>=20
> On 01/02/2023 14:49, Richard Purdie wrote:
> > On Fri, 2023-01-27 at 16:33 +0100, Louis Rannou wrote:
> > > From: Louis Rannou <lrannou@baylibre.com>
> > >=20
> > > [YOCTO #9070]
> > >=20
> > > Add a new selftest to validate the locales generation. This selftest =
builds a
> > > complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
> > > ENABLE_BINARY_LOCALE_GENERATION set.
> > >=20
> > > The tests has two cases: GLIBC_GENERATE_LOCALES=3D1 and
> > > GLIBC_GENERATE_LOCALES=3D0. When set to 1, we check that the locales =
exist in the
> > > local-archive and if it does exist for the glibc. When set to 0, we c=
heck it
> > > does not.
> > >=20
> > > Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> > > ---
> > >   meta/lib/oeqa/selftest/cases/locales.py | 81 ++++++++++++++++++++++=
+++
> > >   1 file changed, 81 insertions(+)
> > >   create mode 100644 meta/lib/oeqa/selftest/cases/locales.py
> > >=20
> > > diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/=
selftest/cases/locales.py
> > > new file mode 100644
> > > index 0000000000..f053cc8e31
> > > --- /dev/null
> > > +++ b/meta/lib/oeqa/selftest/cases/locales.py
> > > @@ -0,0 +1,81 @@
> > > +#
> > > +# SPDX-License-Identifier: MIT
> > > +#
> > > +
> > > +from oeqa.selftest.case import OESelftestTestCase
> > > +from oeqa.core.decorator import OETestTag
> > > +from oeqa.utils.commands import bitbake, runqemu
> > > +
> > > +class LocalesTest(OESelftestTestCase):
> > > +
> > > +    @OETestTag("runqemu")
> > > +    def test_locales_on(self):
> > > +        """
> > > +        Summary: Test the locales are generated
> > > +        Expected: 1. Check the locale exist in the locale-archive
> > > +                  2. Check the locale exist for the glibc
> > > +                  3. Check the locale can be generated
> > > +        Product: oe-core
> > > +        Author: Louis Rannou <lrannou@baylibre.com>
> > > +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
> > > +        """
> > > +
> > > +        features =3D []
> > > +        features.append('EXTRA_IMAGE_FEATURES =3D "empty-root-passwo=
rd allow-empty-password allow-root-login"')
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
> > > +        with runqemu("core-image-minimal", ssh=3DFalse, runqemuparam=
s=3D'nographic') as qemu:
> > > +            cmd =3D "locale -a"
> > > +            status, output =3D qemu.run_serial(cmd)
> > > +            # output must includes fr_FR or fr_FR.UTF-8
> > > +            self.assertEqual(status, 1, msg=3D'localedef test failed=
: output: %s' % output)
> > > +            self.assertIn("fr_FR", output, msg=3D'locale -a test fai=
led: output: %s' % output)
> > > +
> > > +            cmd =3D "localedef --list-archive -v"
> > > +            status, output =3D qemu.run_serial(cmd)
> > > +            # output must includes fr_FR.utf8
> > > +            self.assertEqual(status, 1, msg=3D'localedef test failed=
: output: %s' % output)
> > > +            self.assertIn("fr_FR.utf8", output, msg=3D'locale -a tes=
t failed: output: %s' % output)
> > > +
> > > +    @OETestTag("runqemu")
> > > +    def test_locales_off(self):
> > > +        """
> > > +        Summary: Test the locales are not generated
> > > +        Expected: 1. Check the locale does not exist in the locale-a=
rchive
> > > +                  2. Check the locale does not exist for the glibc
> > > +                  3. Check the locale cannot be generated
> > > +        Product: oe-core
> > > +        Author: Louis Rannou <lrannou@baylibre.com>
> > > +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
> > > +        """
> > > +
> > > +        features =3D []
> > > +        features.append('EXTRA_IMAGE_FEATURES =3D "empty-root-passwo=
rd allow-empty-password allow-root-login"')
> > > +        features.append('IMAGE_INSTALL:append =3D " glibc-utils loca=
ledef"')
> > > +        features.append('GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 fr_=
FR.UTF-8"')
> > > +        features.append('IMAGE_LINGUAS:append =3D " en-us fr-fr"')
> > > +        features.append('ENABLE_BINARY_LOCALE_GENERATION =3D "0"')
> > > +        self.write_config("\n".join(features))
> > > +
> > > +        # Build a core-image-minimal
> > > +        bitbake('core-image-minimal')
> > > +
> > > +        with runqemu("core-image-minimal", ssh=3DFalse, runqemuparam=
s=3D'nographic') as qemu:
> > > +            cmd =3D "locale -a"
> > > +            status, output =3D qemu.run_serial(cmd)
> > > +            # output must not includes fr_FR or fr_FR.UTF-8
> > > +            self.assertEqual(status, 1, msg=3D'localedef test failed=
: output: %s' % output)
> >=20
> > This should really say locale instead of localedef here to be clear
> > which command the error is coming from.
> >=20
> > > +            self.assertNotIn("fr_FR", output, msg=3D'locale -a test =
failed: output: %s' % output)
> > > +
> > > +            cmd =3D "localedef --list-archive -v"
> > > +            status, output =3D qemu.run_serial(cmd)
> > > +            # output must not includes fr_FR.utf8
> > > +            self.assertEqual(status, 1, msg=3D'localedef test failed=
: output: %s' % output)
> > > +            self.assertNotIn("fr_FR.utf8", output, msg=3D'locale -a =
test failed: output: %s' % output)
> >=20
> > We did run this through tests on the autobuilder and the tests did
> > pass. I did wonder rather than duplicate the whole test with a line
> > change, could we share the code between the two?
> I think the things we can share are only about the features=20
> configuration and the bitbake command. Going further would require to=20
> create an if/else statement for the assert. I think this will not=20
> simplify the code.
>=20
> >=20
> > I then start looking at the code and I'm a bit worried the locales are
> > not present when binary locale generation is turned off as I think they
> > should be. Going from memory, I thought that they should be generated
> > on target at first boot in that case so they should be present in both
> > cases.
>=20
> I am not sure to understand. But if you suppose there should be=20
> something in /usr/share/i18n/locales, there is nothing there.
>=20
> >=20
> > To keep things simple, lets merge the first case in and file a bug for
> > the other case? I think we'll need to investigate that and check
> > whether we're broken something somewhere.
>=20
> Ok, I'll send a v3 with the first part only. Let's forget about the code=
=20
> sharing before we get clear about what the opposite test will be.

I was able to take a quick look at this. The locale generation on
target is broken, it throws errors upon boot. I was able to make it
work with this patch:

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/g=
libc/glibc-locale.inc
index 7f70b3ca4f..c39007b573 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -60,7 +60,7 @@ DESCRIPTION:localedef =3D "glibc: compile locale definiti=
on files"
 # FILES:glibc-gconv will not be automatically extended in multilib.
 # Explicitly add ${MLPREFIX} for FILES:glibc-gconv.
 FILES:${MLPREFIX}glibc-gconv =3D "${libdir}/gconv/*"
-FILES:localedef =3D "${bindir}/localedef"
+FILES:localedef =3D "${bindir}/localedef ${libdir}/locale"
=20
 LOCALETREESRC =3D "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
=20
@@ -87,6 +87,7 @@ do_install() {
        find ${D}${libdir} -type d -empty -delete
        copy_locale_files ${datadir}/locale 0644
        install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
+       install -d ${D}${libdir}/locale
 }
=20
 inherit libc-package

could you see if the same test will now work with that patch applied?
I'm happy to have the basic test but if we can fix this and stop it
regressing that would be even better.

This issue is exactly why we need automated tests!

Cheers,

Richard



