Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA2FC433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 17:51:39 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.15196.1637862698318401034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MuAK9/zS;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id v1so28717873edx.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aUKrVU30Gzn9SJeQPoRKQ0Bq/5hXuOrJHjKApkEHP48=;
        b=MuAK9/zSBKciMmFbuXLIQQavbfd3ZFg/TqVPNq60mMrkWwhEyENnxX3q1xPNuXUoT/
         aMuKNJ2HCt77Yv8AJ43o/P7N+LVByvJpyirsN5uJa0bKyoN/ppcHqQe9tSrQSyegrrRa
         EpNotCqU4SxMhnc7plCVclGxNTo2zibNFH6aGVIer9rYGVqkKfn7hz4CRWiiom7ZPQTE
         MAhv/Bl4TPB7QYhDMxFthSQBIaIniwghSZyOGX82nZNdd/Sf9W50WzojK2mUCJs/WYa9
         cdvzEJuk2mLJgLAFhKHIWupEREn91GI4wzRz5cPpgFlTO7T01yM8L9+BnNzL3CnW6Kk7
         I2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aUKrVU30Gzn9SJeQPoRKQ0Bq/5hXuOrJHjKApkEHP48=;
        b=0eqy4VA9cV649a2QhjPCfQVAQlx0v51wKun7LPdMkNja4JLOUDrh5X35SNSZjgHxXJ
         Y4C18fkh45H5pQpAnvP+A1JgkgCgj3ousxCWIrAqvjXxzGu2AhgYw+fSsI+hqjawR0RP
         OX31OLFEu0bduTTit5lmG0FB7dGWWbZ36n8SZZ5RO3ptl7p/KuZ62pzVkQM8zXdQp423
         izigz15vIN+0DoxwdsGsDSIctCYw7A3zE2zctfWIJz1wI2l9yPLOCYfmAgSpWrI4btdb
         q7HimH/GFVr8IzBTvK8Y19w+itmp8WUFpL6n0l4tm8Wv/7HmBC1vxQBWgWj47s2ONW9a
         nwyA==
X-Gm-Message-State: AOAM530eWUk20pNyVJXcmKV9mCqtM81xnKX9u2sLZUjLeNfI+rOB3LfA
	bdSXFzO6nxju9k61FcYSghXvSHQdsx7OySVlZaU=
X-Google-Smtp-Source: 
 ABdhPJyHLddqMdCJ4nJUEmHDNpm2aG1Lpa9bfL5qw69ZfaA95Wj5ydoC7K5ktbVN46/0w+jPj2CnkqaXFOPJbiVTFmo=
X-Received: by 2002:a17:907:1689:: with SMTP id
 hc9mr32723923ejc.445.1637862696423;
 Thu, 25 Nov 2021 09:51:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
 <c653e0c3cd0edd038b3c3a2d9df442d2fe5ea745.1637788184.git.bruce.ashfield@gmail.com>
 <CAMKF1sqXFdQCtOHcc36CZgfoxwL0ASFeU2PyWW7LiD22drJVLA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqXFdQCtOHcc36CZgfoxwL0ASFeU2PyWW7LiD22drJVLA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Nov 2021 12:51:25 -0500
Message-ID: 
 <CADkTA4PpHJJ_QRq=5PC_fctLGt5yyLANwiP9bKcJz1T_OtqH-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/20] python: introduce python3-dtschema
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Tim Orling <TicoTimo@gmail.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 17:51:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158792

On Thu, Nov 25, 2021 at 12:36 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails to build for me
>
> https://errors.yoctoproject.org/Errors/Details/618010/

It was updated in-branch with fixups.  The version in this patch is
known to break on a target build.

Bruce

>
> On Wed, Nov 24, 2021 at 1:14 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > kernel commit 53182e81f47d [kbuild: Enable DT schema checks for %.dtb
> > targets], which is part of v5.16+, makes the checking of dtb schemas
> > manditory.
> >
> > To support the checking, we introduce this new recipe dtschema.
> >
> > Dependencies will be imported in subsequent commits, so we can
> > track the dependency need on a per-import basis.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  .../python/python3-dtschema_2021.10.bb           | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3-dtschema_2021.10.bb
> >
> > diff --git a/meta/recipes-devtools/python/python3-dtschema_2021.10.bb b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
> > new file mode 100644
> > index 0000000000..f16232d610
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
> > @@ -0,0 +1,16 @@
> > +DESCRIPTION = "Tooling for devicetree validation using YAML and jsonschema"
> > +HOMEPAGE = "https://github.com/devicetree-org/dt-schema"
> > +LICENSE = "BSD-2-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=457495c8fa03540db4a576bf7869e811"
> > +
> > +inherit pypi setuptools3
> > +
> > +PYPI_PACKAGE = "dtschema"
> > +
> > +SRC_URI[md5sum] = "d2f0d847ba2ad4d223317ef7304342b0"
> > +SRC_URI[sha256sum] = "d09c94d13f46e6674ba11ff31220651ad1b02dae860f5a87905dfac6b8d768d9"
> > +
> > +DEPENDS += "python3-setuptools-scm"
> > +RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.19.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#158749): https://lists.openembedded.org/g/openembedded-core/message/158749
> > Mute This Topic: https://lists.openembedded.org/mt/87290455/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

