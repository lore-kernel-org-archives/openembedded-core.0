Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C910C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 22:16:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.6816.1676499385507329874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 14:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J893Nw47;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id o15so122483wrc.9
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 14:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uz/ueZveyZMqRjju5Mr1qn/5cSOhMEb6F2/Bno3jj00=;
        b=J893Nw471PKdWP60t0GPEn7UYHh/8662ABK5DWofLrykdIdYK4lyTk32WgLrOkE5Dl
         kFdjl8fLmrKyf/NuT3tblVSNtNH/DzP4GqmLlosvlCo0zIZfPGGaUNuvQIpj5ASHTHty
         Nobi+vTfYyv/DAKMQHAK0uavRrb9+ta52hWQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uz/ueZveyZMqRjju5Mr1qn/5cSOhMEb6F2/Bno3jj00=;
        b=nQ/rcgr7Oaxk9A75XQorC3As/gw/fItlvaJB3gH4MYIyCSFN5SN1VwgZIQ/bcx3ikL
         DxlWWztDoolywlbYcaImPyQ6rqIgi50sbpRE4oWmpX72o+XzIkZeC7lxFQUxXtluZ1D0
         9CA8ihMQlxAQQF2Tna4JLBn2Q/tWkOCPeO+Rme2E5ru12jDIdMvru7aHSt3AN8d1lBDO
         sGuriJAl21rGxeXCGjLrXmVbfV5Hsc3lOEh0H0Zr/WQkDaGu49EoKB1Ksy/y5hIJGR/+
         0ye/psmOtvhLYBDku11piV1ptdusx0svyHsDM7QKqD5XWaHx8b+59/eM23lXMLw9VyS1
         j8eA==
X-Gm-Message-State: AO0yUKXOQSbSvlmDvpXD6lEhp6O/7SwwUWkGNSGdvgr3LaPMVK7zxs5G
	aziewKQzQsWGM2ntUBUZAUIZmw==
X-Google-Smtp-Source: AK7set+zAjAP7RNzRDg75NC9taVBQhHa6EH/c7CRbama+IdwRlgzzxGsMUouHI+i2Mss4s0W6qqkWQ==
X-Received: by 2002:a5d:6841:0:b0:2c5:54fd:265e with SMTP id o1-20020a5d6841000000b002c554fd265emr2495859wrw.70.1676499383665;
        Wed, 15 Feb 2023 14:16:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d39a:5560:699e:2da6? ([2001:8b0:aba:5f3c:d39a:5560:699e:2da6])
        by smtp.gmail.com with ESMTPSA id p13-20020a056000018d00b002c57384dfe0sm1798917wrx.113.2023.02.15.14.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 14:16:23 -0800 (PST)
Message-ID: <fa5fdfa0a3ee4f823960478ffad16a3fc900d1be.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH] libssh2: Update patch to apply and fix
 malformed Upstream-Status
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, changqing.li@windriver.com
Date: Wed, 15 Feb 2023 22:16:22 +0000
In-Reply-To: <17440FA3D0B2DC7A.14281@lists.openembedded.org>
References: <20230215171832.635085-1-Martin.Jansa@gmail.com>
	 <17440FA3D0B2DC7A.14281@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 22:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177220

On Wed, 2023-02-15 at 17:29 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2023-02-15 at 18:18 +0100, Martin Jansa wrote:
> > * I've noticed this, because patchreview.py reports Malformed
> >   Upstream-Status in this one now, but the QA check in insane.bbclass
> >   wasn't reporting it before
> >=20
> > * the reason why insane.bbclass doesn't report it is because:
> >   SRC_URI:append:ptest =3D " file://0001-Don-t-let-host-enviroment-to-d=
ecide-if-a-test-is-bui.patch"
> >   doesn't work and probably never did as "ptest" is not an override
> >   and patch-status-core checks only the .patch files which are really
> >   in SRC_URI.
> >=20
> > * I've added it directly to SRC_URI and it also didn't apply:
> >   http://errors.yoctoproject.org/Errors/Details/689955/
> >   as the "endif" at the end was removed in 1.10.0 version:
> >   https://github.com/libssh2/libssh2/commit/ecd6a74e44562797a1e92186ad4=
a402c5641720e#diff-32103f666ff2fb42b025a47ccf1b959bbcc6db89f217e5943b1de73c=
81a4f9db
> >=20
> >   after updating the patch to apply I got expected patch-status-core fa=
ilure:
> >   http://errors.yoctoproject.org/Errors/Details/689956/
> >   ERROR: QA Issue: Malformed Upstream-Status in patch
> >   TOPDIR/openembedded-core/meta/recipes-support/libssh2/files/0001-Don-=
t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> >   Please correct according to https://www.openembedded.org/wiki/Commit_=
Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status :
> >   Upstream-Status: Inappropriate[oe specific] [patch-status-core]
> >=20
> > * so the mystery is solved, but what should be do with this never-used
> >   patch, I think we should just delete it together with
> >   SRC_URI:append:ptest, but please Changqing Li confirm it's not needed
> >=20
> > * it was originally added by Changqing Li in meta-oe with:
> >   https://git.openembedded.org/meta-openembedded/commit/?id=3Dd7aa71734=
05c3b36235af736cd31dbe110708787
> >   then imported to oe-core by Randy MacLeod with:
> >   https://git.openembedded.org/openembedded-core/commit/?id=3D57df134b1=
be56a688f41851e5ff014dd859c0bc3
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  ...nviroment-to-decide-if-a-test-is-bui.patch | 22 ++++++-------------
> >  1 file changed, 7 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-env=
iroment-to-decide-if-a-test-is-bui.patch b/meta/recipes-support/libssh2/fil=
es/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> > index b1204e49eb..e0000b2658 100644
> > --- a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment=
-to-decide-if-a-test-is-bui.patch
> > +++ b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment=
-to-decide-if-a-test-is-bui.patch
> > @@ -1,24 +1,23 @@
> > -From f6abce5ba41a412a247250dcd80e387e53474466 Mon Sep 17 00:00:00 2001
> > -From: Your Name <you@example.com>
> > +From 7ffa1773be8d262bed0f5c8bdcb4dd8f906de095 Mon Sep 17 00:00:00 2001
> > +From: Changqing Li <changqing.li@windriver.com>
> >  Date: Mon, 28 Dec 2020 02:08:03 +0000
> >  Subject: [PATCH] Don't let host enviroment to decide if a test is buil=
d
> > =20
> >  test ssh2.sh need sshd, for cross compile, we need it on target, so
> >  don't use SSHD on host to decide weither to build a test
> > =20
> > -Upstream-Status: Inappropriate[oe specific]
> > +Upstream-Status: Inappropriate [oe specific]
> > =20
> >  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>=20
> The patch is to fix ssh2.sh as a test. The test was disabled here:
>=20
> https://git.yoctoproject.org/poky/commit/meta/recipes-support/libssh2?id=
=3Daf067d427fc1000c2dcce84c5578ea26f9048208
>=20
> referencing:
>=20
> https://github.com/libssh2/libssh2/issues/630
>=20
> which is now fixed.
>=20
> The autobuilder doesn't currently run the test:
>=20
> https://autobuilder.yocto.io/pub/non-release/20230215-12/testresults/qemu=
x86-64-ptest/libssh2.log
>=20
> I don't know if the test still needs the patch to fix it.

I did some tests and there is a patch to fix issue 630 which then does
allow ssh2.sh to pass without this patch. We can therefore remove it.
We should also add a patch to sort issue 630 and enable the test.

Cheers,

Richard


