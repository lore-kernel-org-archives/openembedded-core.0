Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D839EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 08:37:55 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.9344.1689755867334408328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 01:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=bUSp9g5e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so61488165e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689755866; x=1690360666;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zu4Di4X9/wFvhSFI0ANQTn0COtvfdBCjjkbqimmeGzE=;
        b=bUSp9g5e9BSgebXu56Yl1KGu+9QmxkxdgBr6pQRK3kAzqfg6ta7fjTTtIXjwOcVrMW
         nF6jBLsroxqtadD/kNZoQaM7qnvBovlgeK2cvzHbKJtm9pQhNlWCr27sbf+/JhsRMAvv
         vC+66gkq2Uy8cPa9VGLeboWWKnmk8sIgNDLhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689755866; x=1690360666;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zu4Di4X9/wFvhSFI0ANQTn0COtvfdBCjjkbqimmeGzE=;
        b=ADxpToTrLMkKOMun7TLTDHmc3oSR8vV2+/gOgrPyij9Ep1Hz5VuoCiToGrdHu8fc4P
         ETNqxFoNe/8rxCBB52jlWoNIk928D+2E+5TMfERfQD+H7PbMCex62BBXlj4fME3ABcFe
         S7MazZSMdgMmlJVFqT2Fe3m6cpunF0vhGVTV1fdkeBGl41OlwIjYr5exr92y6O8eAWSM
         stJQ+LORfgZj8nDFqoqjaq9a+ltnXQau+J3SnTmxQNWOHwgOhNgsib9rgRLSV6M1hPTX
         SHzI4U3NJTwRDZ0zJ5cfV0QohseG4Tis1bUpN39MxQtJFIpMQc1ne5mi1rdRrd7Ej1p/
         wfgg==
X-Gm-Message-State: ABy/qLZbEqujycNz8xpozds1AM52V1QaysUdckV3tbX2J65i3vmN6lhP
	anLgllPVE+sHZ+vlMFfh38I3Tg==
X-Google-Smtp-Source: APBJJlE49qTY4R1bEpHaetPb1Gl+XAWKWg5PpEzqzOkKpbpmMdXWywUvuQjuJjLe+N0ZX6wnnP7VnA==
X-Received: by 2002:a05:600c:3781:b0:3fa:74ae:df9f with SMTP id o1-20020a05600c378100b003fa74aedf9fmr3864047wmr.37.1689755865677;
        Wed, 19 Jul 2023 01:37:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6248:d29c:dec5:5723? ([2001:8b0:aba:5f3c:6248:d29c:dec5:5723])
        by smtp.gmail.com with ESMTPSA id e16-20020adfef10000000b0030fa3567541sm4690416wro.48.2023.07.19.01.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 01:37:45 -0700 (PDT)
Message-ID: <354d702419dd053b96cee5cc64c2f923833fa749.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: Alex Stewart <alex.stewart@ni.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jul 2023 09:37:44 +0100
In-Reply-To: <VI1PR04MB53735A682AA5C026FC6EFC3B9138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
	 <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
	 <VI1PR04MB5373A7CF0029527D7AA884689134A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <20230716213857fea03b3e@mail.local>
	 <17728F63D7D8F798.22245@lists.openembedded.org>
	 <177297AC200D092D.22245@lists.openembedded.org>
	 <VI1PR04MB53737C43B2CDDBFB197010359138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <202307182105150310803d@mail.local>
	 <VI1PR04MB53735A682AA5C026FC6EFC3B9138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 08:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184569

On Wed, 2023-07-19 at 07:53 +0000, Piotr =C5=81obacz wrote:
> I'm running this on docker with ubuntu 22.04 LTS and I have patched
> tar 1.34 with the patch I have given to you. I know that it contains
> these parameters, but they are faulty - meaning the ACLs do not
> preserve uid/gid in tar archive.

Are you saying we need to patch tar in order for these patches to work?

> Nevertheless this concerns me that opkg-build command should not
> fail. Additionally I have tested yesterday running my build without
> acl and xattr in DISTRO_FEATURES and it also worked for me - without
> applaying acls and xattrs to tar archive.
> Generally I need to reproduce your error and it seems to me that
> there is no other option as to re-create exactly the same environment
> on my machine locally, so I could investigate it.
>=20
> My question is how can we achive it in the simplest way? Does
> autobuilder use a docker for building?Because if so, I could take
> these docker scripts, run them and check what's happening.

The autobuilders are standard installs of various distros. We keep them
matching upstream and the list of installed software minimal.

There are more issues in this patch series. For example there is this
reproducibility issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3219/ste=
ps/13/logs/stdio

which is saying there were two sets of different ipk packages produced.
These are available here:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230718-bn_npkd=
c/packages/

sadly the automatic diffoscope output wasn't generated.

Worryingly this report suggests the opkg-build change is not
deterministic.

FWIW this is just with the opkg-build change and the bitbake.conf
change, not the other patches.

These two changes alone also cause these warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7436/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7436/step=
s/18/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/7509/step=
s/21/logs/stdio

e.g. things like:

WARNING: core-image-sato-1.0-r0 do_rootfs: [log_check] core-image-sato: fou=
nd 4 warning messages in the logfile:
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)

so there is a further issue to investigate there.

All in all, there are a lot of issues with this patch series :(.

Cheers,

Richard


