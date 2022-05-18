Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B717AC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:35:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.3384.1652870131068091267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SRoB5bKe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 r188-20020a1c44c5000000b003946c466c17so2915001wma.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=EzOxG7VdtyJCZRo1RJ9rgY9LzoOIY3g9fimGbDcl7cE=;
        b=SRoB5bKeJZfz7RgXqp53NiH9xF2GJqbc4+cEr9W0u9LtUNVtXTfn8tXZTyeZmwj0Nw
         vRgZPnQDPLWJRDnDeizUGQK8qfhgD2TR4YJSs3q/Arodb2nSacJBpEjatwg5D6Y0Vz9u
         whrC2BsyjbCQ+g5lMyur/ORx6GxTHG3jvGK+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=EzOxG7VdtyJCZRo1RJ9rgY9LzoOIY3g9fimGbDcl7cE=;
        b=MIfBm9faF/eIIObzh8lRpZZQMTNV8Seot04Kzy8xAedwurV1AfIwb3CgUGa63pk1jv
         hU/9WpdSFi0yrqJPIKQzboyLSWO6p5aVVlXUwmgz1OZDOm2W+jPVwPN9KPhr1Fqk3/vw
         TdjBcQP90CKQznof3sUYS3vsI1HGFzJvLeZ86ZtB/pH0wip3pEc+kxiZunYXflldfPeC
         r7GMHSpTSkl7tKBre2dVFNcTMW+t5geHlAHkTMwJ+a4ulD+UU+eGnAR5tu6eno5e/Lej
         RXwoYRcPgH4H4ypOshEeiZeKnlQV5BrbHFE3wrcNdhHz7sE6xb2VAAIZBFrQazDD1YEm
         iMIA==
X-Gm-Message-State: AOAM530QRJQYLbY2ubh+o86n8NS5zAHAdBz+XZ41eeVMNgD30COnTKRE
	tsXuQ50JmvAyZQGndyU2EoXy6elCd89w+PRt
X-Google-Smtp-Source: 
 ABdhPJzTbJegAaDphsrAoLkb7Xzu+qr5hBfOorkgLd4/I0yIQb4S9W8xUCPAjs4ngdbZz5WP4wB8Ig==
X-Received: by 2002:a1c:4b03:0:b0:394:6640:7a78 with SMTP id
 y3-20020a1c4b03000000b0039466407a78mr36491497wma.65.1652870129585;
        Wed, 18 May 2022 03:35:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f9c5:af58:f70a:331b?
 ([2001:8b0:aba:5f3c:f9c5:af58:f70a:331b])
        by smtp.gmail.com with ESMTPSA id
 q6-20020adfbb86000000b0020e5d2a9d0bsm2105413wrg.54.2022.05.18.03.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:35:29 -0700 (PDT)
Message-ID: 
 <01d7118ffeb634d6867b5ad3b95d59a96ad07357.camel@linuxfoundation.org>
Subject: Re: [OE-core] npm.bblcass dysfunctional in kirkstone
From: richard.purdie@linuxfoundation.org
To: enrico.scholz@sigma-chemnitz.de, openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2022 11:35:28 +0100
In-Reply-To: <lypmkbuozf.fsf@ensc-pc.intern.sigma-chemnitz.de>
References: <lypmkbuozf.fsf@ensc-pc.intern.sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:35:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165797

On Wed, 2022-05-18 at 12:14 +0200, Enrico Scholz via
lists.openembedded.org wrote:
> Hello,
>=20
> with nodejs 16, 'npm.bbclass' stops to work and fails (at least) because
> of:
>=20
> 1. 'ignore-scripts' has no effect with 'npm pack' anymore.  This command
>    will now execute 'prepare' scripts which usually fail.
>=20
>    Patching out 'scripts/prepare' from package.json should solve it (can
>    be done by npm.bbclass).
>=20
>    This problem happens in do_configure()
>=20
>=20
> 2. In do_compile(), 'npm install <tarball>' is executed.  This tries to
>    contact the registry to fetch the manifest of dependencies.  Because
>    offline mode is enforced, it will fail with ENOTCACHED.
>=20
>    E.g.
>=20
>    | npm install md5-2.3.0.tgz
>    | npm sill fetch manifest charenc@0.0.2
>    | npm verb stack Error: request to https://registry.npmjs.org/charenc =
failed: cache mode is 'only-if-cached' but no cached response is available
>    | npm ERR! code ENOTCACHED
>=20
>=20
>    This url (https://registry.npmjs.org/charenc) was not added to the
>    npm cache.
>=20
>    Is there any solution or other ways to use npm in kirkstone?

We're lacking people working on the npm/node support. If people send
patches to fix it and add test cases we can look to improve it but this
kind of thing doesn't happen without developers working on it and we
simply don't have those at the moment :(.

Cheers,

Richard



