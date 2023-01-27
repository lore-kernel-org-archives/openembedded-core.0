Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2EFC38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 14:23:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.103033.1674829405392091931
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 06:23:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WGMN4atS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id h16so5083302wrz.12
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 06:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXKvkm+Xpzi6N8bURiWXRKyzDe5BinYP26it4jLnX0s=;
        b=WGMN4atSFwHMTYi2e2OwMId7o5/Jq2+1iZ0p3M3eXj5G7HS5UaRCETb3LyZLAjytli
         CG/FWyCemNIfGTCyKJ/iW4suQd+aO1Na/3LuIcaKcrRgcUXMddAtFBzMYFXNV02ULi3b
         qqEo39Uji7obOUJF2LExZZRhNJbggPmpP70ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CXKvkm+Xpzi6N8bURiWXRKyzDe5BinYP26it4jLnX0s=;
        b=qD99gu/olTBU+ZxpQHFYa67YqDvU9xlOzoTDNmbYRcvy8wvGePHFPB9/MSaDYrkk4w
         qerpbmtb+3s/UpTXEy2jIu9/r9K9A14QzMhBeusgnOXidl2FQNZ0OxCN+BTdOMZTqjVS
         BV141m43qmYaA0Y8ODxmNoG4uarC9o3QeoAYaHW3/1KLCGSXA6cCFBGt95tF2n3d9Rwo
         vQDS9lw2RdA8tH2zArQ33QTHxxfht92v9hkLSdIHsOM/tT7TKc0NLbZ20FP0XXhhkrEp
         4ppv5ETDLwfwHzZ2VBma8/XQaxDqJie6coPnL9eC0q3rUlcADqSVnL5OjS30yq2lkkro
         HPvw==
X-Gm-Message-State: AFqh2kpp2GzC0cAzlXcbTG5Tz6/EBq4fZ9wvnTzqAK29CG24u3QhICMj
	5BqOTmAcssZnBa1hsqSQg+ILHg==
X-Google-Smtp-Source: AMrXdXuOW8zqkp58g06qbLVvjI31X3neCoVoqNNFHJhoNWBGM8QAAuA7hmOH6E2xyhb0u9OTIYJCWg==
X-Received: by 2002:a5d:5f07:0:b0:2be:338f:bc55 with SMTP id cl7-20020a5d5f07000000b002be338fbc55mr33593036wrb.66.1674829403473;
        Fri, 27 Jan 2023 06:23:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3876:ca46:43a6:4b49? ([2001:8b0:aba:5f3c:3876:ca46:43a6:4b49])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d434e000000b002bfbda53b98sm4063887wrr.35.2023.01.27.06.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 06:23:23 -0800 (PST)
Message-ID: <361d44c7b13bbd3f9ad41b6cd00908a4e831090c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/locales: Create selftest for
 locales generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <lrannou@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2023 14:23:22 +0000
In-Reply-To: <b8f54a56-9cd2-01bd-2210-a5c361a7ae49@baylibre.com>
References: <20230125083127.53988-1-lrannou@baylibre.com>
	 <f39b351e96ff00039f526290e7ff68c7fa3c7271.camel@linuxfoundation.org>
	 <4479c710-1384-dd7b-ad6b-be756025e3bb@baylibre.com>
	 <de1cd98004d72f55e48fb4185bc24828e2195820.camel@linuxfoundation.org>
	 <b8f54a56-9cd2-01bd-2210-a5c361a7ae49@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 14:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176448

On Fri, 2023-01-27 at 14:47 +0100, Louis Rannou wrote:
>=20
> On 26/01/2023 11:15, Richard Purdie wrote:
> > On Thu, 2023-01-26 at 11:09 +0100, Louis Rannou wrote:
> > > On 26/01/2023 11:02, Richard Purdie wrote:
> > > > On Wed, 2023-01-25 at 09:31 +0100, Louis Rannou wrote:
> > > > > From: Louis Rannou <lrannou@baylibre.com>
> > > > >=20
> > > > > [YOCTO #9070]
> > > > >=20
> > > > > Add a new selftest to validate the locales generation. This selft=
est builds a
> > > > > complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
> > > > > ENABLE_BINARY_LOCALE_GENERATION set. The locales are tested throu=
gh a ssh
> > > > > connection in three manners: checks if the locales exist in the l=
ocale-archive,
> > > > > if it does exist for the glibc and if it can be generated.
> > > > >=20
> > > > > Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> > > > > ---
> > > > >    meta/lib/oeqa/selftest/cases/locales.py | 54 +++++++++++++++++=
++++++++
> > > > >    1 file changed, 54 insertions(+)
> > > > >    create mode 100644 meta/lib/oeqa/selftest/cases/locales.py
> > > > >=20
> > > > > diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/o=
eqa/selftest/cases/locales.py
> > > > > new file mode 100644
> > > > > index 0000000000..089ca594a1
> > > > > --- /dev/null
> > > > > +++ b/meta/lib/oeqa/selftest/cases/locales.py
> > > > > @@ -0,0 +1,54 @@
> > > > > +#
> > > > > +# SPDX-License-Identifier: MIT
> > > > > +#
> > > > > +
> > > > > +from oeqa.selftest.case import OESelftestTestCase
> > > > > +from oeqa.core.decorator import OETestTag
> > > > > +from oeqa.utils.commands import bitbake, runqemu
> > > > > +from oeqa.utils.sshcontrol import SSHControl
> > > > > +
> > > > > +class LocalesTest(OESelftestTestCase):
> > > > > +
> > > > > +    @OETestTag("runqemu")
> > > > > +    def test_locales(self):
> > > > > +        """
> > > > > +        Summary: Test the locales through a ssh connection
> > > > > +        Expected: 1. Check the locale exist in the locale-archiv=
e
> > > > > +                  2. Check it the locale exist for the glibc
> > > > > +                  3. Check the locale can be generated
> > > > > +        Product: oe-core
> > > > > +        Author: Louis Rannou <lrannou@baylibre.com>
> > > > > +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
> > > > > +        """
> > > > > +
> > > > > +        features =3D []
> > > > > +        features.append('EXTRA_IMAGE_FEATURES =3D "ssh-server-op=
enssh empty-root-password allow-empty-password allow-root-login"')
> > > > > +        features.append('IMAGE_INSTALL:append =3D " glibc-utils =
localedef"')
> > > > > +        features.append('GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8=
 fr_FR.UTF-8"')
> > > > > +        features.append('IMAGE_LINGUAS:append =3D " en-us fr-fr"=
')
> > > > > +        features.append('ENABLE_BINARY_LOCALE_GENERATION =3D "1"=
')
> > > > > +        self.write_config("\n".join(features))
> > > > > +
> > > > > +        # Build a core-image-minimal
> > > > > +        bitbake('core-image-minimal')
> > > > > +
> > > > > +        with runqemu("core-image-minimal") as qemu:
> > > > > +            # Attempt to ssh with each user into qemu with empty=
 password
> > > > > +            ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshl=
og, user=3D'root')
> > > >=20
> > > > Thanks for this, in general this looks good and it would be great t=
o
> > > > get a test for this enabled so I'm very happy to see the patch.
> > > >=20
> > > > I did have one question about the above line. I think you can just =
use
> > > > qemu.run() to run commands over ssh and I suspect the above might
> > > > create a second ssh connection which might then have lifecycle issu=
es.
> > > > Did you try qemu.run() and have issues? I noticed a lot of our test=
s
> > > > use run_serial() which I hadn't realised until I looked!
> > > Hello, I haven't tried qemu as the bugzilla said to use a ssh
> > > connection. But I guess this was different in 2013. I agree, it might=
 be
> > > better to avoid the ssh connection.
>=20
> I just noticed that qemu_serial returns 1 on success and 0 on failure=20
> while the ssh command returns 0 and -N on failure.

That is horrible. We should file a bug so we remember to improve that!
Since it is python, they probably should raise an exception if they
fail instead or a return value.

Cheers,

Richard

