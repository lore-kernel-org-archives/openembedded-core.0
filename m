Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D0EC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 16:59:55 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.316.1684774792066901486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 09:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=JCjnNhSO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f60804faf4so5507565e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 09:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684774790; x=1687366790;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FS3uVhjAWIfU+4U/I+r8FC0jGwrfTmOwewpXvFZOxzU=;
        b=JCjnNhSOYn6c2cYB0yve5Nja2AaK7e8pG0dGPTD3qd3i74YsUhiLDDPKSWEbBR9JF2
         Btm6eQnlkJdo+LaMDkeuG6IMz8cwgGMelgFoESDbTHspKIz9yOYX+7u1EZz1ZSBQUuX0
         TQKJERSOrGGqd7B/au2VX7IVD7npn3nHksU90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684774790; x=1687366790;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FS3uVhjAWIfU+4U/I+r8FC0jGwrfTmOwewpXvFZOxzU=;
        b=cQCPAX6tx9bHtooleOXBD2NNJqrQgAO6Hi4AghJqh98wQnL/erm4EiExKa47E2i0AA
         BG+h8XjbeIieZyjM6SuLKhx2l3fs6ov3froZYpp7yEu/9PSDNb3C2Y3YhYY4ROAODJj2
         ftV+n/HTS8cYTa8oMvPkGMJk8SGuQ+uOtsy6woURUx/DqNopw0Pc3GbZhErfVK7MB8OP
         fPd9TF3gDKSNqADuySn+D9a0BSCbLRIpJGhzLPZHmNyH2Lisfed1JZhpEL0e2idmbLXJ
         ez5DbdPKgAJZZEA0SPirxAtM2bQfwzuB0jQjtSKvOB42o/6FjZTFqVnvttvBtBsEFHq8
         H7tA==
X-Gm-Message-State: AC+VfDzHqRXT8VYsC8XJWQRGJQiXdNmB58+dLRnPahdWJdvZXcvUr7m9
	Y7WA+pazqFYNioCLjeneS9R7ng==
X-Google-Smtp-Source: ACHHUZ67EgxA0OsuV+neryAlLA/WRe0o1NtnPBTb0bBrsd2NTs6McETpzXbLoMl1ENO0zQaaW/P78A==
X-Received: by 2002:a05:600c:3797:b0:3f4:2819:7777 with SMTP id o23-20020a05600c379700b003f428197777mr7995876wmr.38.1684774790471;
        Mon, 22 May 2023 09:59:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af81:9fd3:4814:bc78? ([2001:8b0:aba:5f3c:af81:9fd3:4814:bc78])
        by smtp.gmail.com with ESMTPSA id t20-20020a1c7714000000b003f606869603sm2660670wmi.6.2023.05.22.09.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 09:59:50 -0700 (PDT)
Message-ID: <115977cc86693aee888b225f7643cfc9fc77c071.camel@linuxfoundation.org>
Subject: Re: [EXTERNAL] Re: [OE-core][PATCHv2 2/2] kernel-devicetree:
 recursively search for dtbs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randolph Sapp <rs@ti.com>, afd@ti.com, reatmon@ti.com, denis@denix.org, 
	martin.jansa@gmail.com, peter.kjellerstedt@axis.com, 
	alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2023 17:59:49 +0100
In-Reply-To: <85499663-9edf-087b-aee4-b59739c533a7@ti.com>
References: <20230512172221.4062722-1-rs@ti.com>
	 <20230512172221.4062722-3-rs@ti.com>
	 <373eafd376a3ecf1b418fcbd0a8dfc8974226920.camel@linuxfoundation.org>
	 <85499663-9edf-087b-aee4-b59739c533a7@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 16:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181600

On Mon, 2023-05-22 at 11:22 -0500, Randolph Sapp wrote:
> On 5/22/23 03:00, Richard Purdie wrote:
> > On Fri, 2023-05-12 at 12:22 -0500, Randolph Sapp via
> > lists.openembedded.org wrote:
> > > From: Randolph Sapp <rs@ti.com>
> > >=20
> > > Upstream's dtb directory structure has no real standard. They just te=
nd
> > > to idle around the 2/3 directory depth. Recursively search for the
> > > dtb/dtbo files instead of assuming anything.
> > >=20
> > > Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
> > > directory, 2023-05-02)
> > >=20
> > > Signed-off-by: Randolph Sapp <rs@ti.com>
> > > ---
> > >   meta/classes-recipe/kernel-devicetree.bbclass | 21 +++++++++++++---=
---
> > >   1 file changed, 15 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/cla=
sses-recipe/kernel-devicetree.bbclass
> > > index 831fdd1527..fa6de7a140 100644
> > > --- a/meta/classes-recipe/kernel-devicetree.bbclass
> > > +++ b/meta/classes-recipe/kernel-devicetree.bbclass
> > > @@ -12,12 +12,21 @@ python () {
> > >               d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-=
zimage-bundle")
> > >   }
> > >  =20
> > > -FILES:${KERNEL_PACKAGE_NAME}-devicetree =3D " \
> > > -    /${KERNEL_DTBDEST}/*.dtb \
> > > -    /${KERNEL_DTBDEST}/*.dtbo \
> > > -    /${KERNEL_DTBDEST}/*/*.dtb \
> > > -    /${KERNEL_DTBDEST}/*/*.dtbo \
> > > -"
> > > +# recursivly search for devicetree files
> > > +def find_device_trees(d):
> > > +    import glob
> > > +    import os
> > > +
> > > +    file_paths =3D []
> > > +    dest_dir =3D d.getVar('D')
> > > +    full_dtb_dir =3D dest_dir + '/' + d.getVar('KERNEL_DTBDEST')
> > > +
> > > +    for file in glob.glob(full_dtb_dir + '/**/*.dtb*', recursive=3DT=
rue):
> > > +        file_paths.append('/' + os.path.relpath(file, dest_dir))
> > > +
> > > +    return ' '.join(file_paths)
> > > +
> > > +FILES:${KERNEL_PACKAGE_NAME}-devicetree =3D "${@find_device_trees(d)=
}"
> > >   FILES:${KERNEL_PACKAGE_NAME}-image-zimage-bundle =3D "/${KERNEL_IMA=
GEDEST}/zImage-*.dtb.bin"
> >=20
> > I suspect this still suffers from a determinism problem as the previous
> > patch did but now it depends on whether the build had occurred or not.
> >=20
> > I also really don't like resorting to python functions like this,
> > they're horrible for performance overhead. I did wonder if:
> >=20
> > FILES:${KERNEL_PACKAGE_NAME}-devicetree =3D "/${KERNEL_DTBDEST}/**/*.dt=
b*"
> >=20
> > would work?
>=20
> Tried that first. Unfortunately bitbake doesn't enable the recursive=20
> option in it's path globs. That would be too easy...

I wonder if we should do something like:

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index edb70daaf17..70040f09e7c 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -550,7 +550,7 @@ def files_from_filevars(filevars):
             f =3D '.' + f
         if not f.startswith("./"):
             f =3D './' + f
-        globbed =3D glob.glob(f)
+        globbed =3D glob.glob(f, recursive=3DTrue)
         if globbed:
             if [ f ] !=3D globbed:
                 files +=3D globbed

we now have the right minimum python version for that. My main concern
would be potential any performance implications.

> > Also, are there automated tests we should be adding to catch bugs like
> > this?
>=20
> Unsure. I haven't looked into automated tests for yocto recipes yet. If=
=20
> you know of some docs for whatever OE-core is doing, feel free to shoot=
=20
> them my way.

oe-selftest -r <test-section-name>=20

where you can see the test cases in lib/oeqa/selftest/cases/

but I'm not seeing much for devicetree specifically. We should have
some!

Cheers,

Richard




