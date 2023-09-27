Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615AAE82CDE
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 21:17:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.359.1695849473634942498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 14:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JRa2TuMp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40528376459so123202945e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 14:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695849472; x=1696454272; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gPyP5IGdPPePpvzdEBye4mrUKlSBQtMHJmpZeRIumGQ=;
        b=JRa2TuMp60pzFSarGJRVx2OSFHK4AtAFptcSIlklzUJN1FVAHUp1pEum2NoI83YL4y
         QRwCi1PtfoAXeJlPHUa0gA3Jky6FCwNIS+ycsAGxu1AEXk4PjodCW3IfMupOoDBjHL/q
         QO5nwAJifeq9u69ObsW1v2pAgWBQ3j9S7TS+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695849472; x=1696454272;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPyP5IGdPPePpvzdEBye4mrUKlSBQtMHJmpZeRIumGQ=;
        b=EC9amxrOA0wNH+g1Do6AOfEdfbjznUFyewd/6qMHtaack2fvP2+tswcH1f31D0FPW2
         85rH2Ny7jt2d/H4PI1jwMJyIyv3/Chs6xc1BbjaVtseo8BjoNhbI0nelSaIceHRMmNSM
         8HO1zmU3/ka3Qix/CJEsmVy+GfIX9LNkiD+N1Qqgc/Oq9ixhpXFIr+ifFUrSij54HiPe
         HKDTziAqcw2odaw6QlgOiMyRBXy4S5eWo5SrRrJL86h87yx9b1ZpltYGauVatKAKOwBN
         I72J5TGGqIgB9AVVuSIpn94FtuBJ85aXpLnqD1Y9PyuMtvpBXdAnZf0OAL+g2ofJ651b
         LJyQ==
X-Gm-Message-State: AOJu0Yy3xq8n030jPWk6mHl7l6AXLFOALtdWsdIM9rCPoPEHp/3dNbd/
	gAYbwoyxj10mE3ItA0whLA1GkQ==
X-Google-Smtp-Source: AGHT+IEZFv7oZA+vbC52FEBOHg5KthYZTdwJRqTn2dU8Y2uBK+XKBGQOVkHDWQ5nsMdOJV/n7jK4bg==
X-Received: by 2002:a05:600c:5120:b0:406:44e7:bf84 with SMTP id o32-20020a05600c512000b0040644e7bf84mr2642963wms.9.1695849471993;
        Wed, 27 Sep 2023 14:17:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:259f:7d13:e5a1:bb93? ([2001:8b0:aba:5f3c:259f:7d13:e5a1:bb93])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c378500b004064ac107cfsm886647wmr.39.2023.09.27.14.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 14:17:51 -0700 (PDT)
Message-ID: <6f9dd65547742d68a2e3210070ce7efea80343e9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julien Stephan <jstephan@baylibre.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2023 22:17:50 +0100
In-Reply-To: <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
References: <20230925080452.803540-1-jstephan@baylibre.com>
	 <20230927101614dd0d974d@mail.local>
	 <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 21:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188346

On Wed, 2023-09-27 at 14:47 +0200, Julien Stephan wrote:
> Le mer. 27 sept. 2023 =C3=A0 12:16, Alexandre Belloni
> <alexandre.belloni@bootlin.com> a =C3=A9crit :
> >=20
> > Hello,
> >=20
> > I had a build were all the tests passed, then I had this failure:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5812/=
steps/14/logs/stdio
> >=20
>=20
> Hi Alexandre,
> I only see
>=20
>    bblock.BBLock.test_lock_single_recipe_all_tasks: FAILED
>=20
> but I can't see the actual error :( Is it possible to have it somewhere?

I am a bit worried this will be hard to reproduce/debug so I had a look
at things as I do really want to get things resolved.

The error log says:

WARNING: The quilt:do_build sig is computed to be 255536826e64d835fcc6b5a27=
7e9a3dacaae75318e608fa2df289bdfa23df40e, but the sig is locked to 0f48875f0=
11499948d53edc6abbe9e4efd617d5ef9233055e4b61411cf01cb87 in SIGGEN_LOCKEDSIG=
S_core2-64

and I couldn't reproduce those stamps in a local build or on the
builder where it failed (once I got access which took a while).

The "while" is important as I think in the meantime things changed
which effected the results.

On the autobuilder, "bitbake quilt -S none" generated stamp files for
quilt. I did this for "build" and "build-st-3046552", the latter being
the one where the test failed. There were two different do_build stamps
generated. The diff:

bitbake-diffsigs tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.sigdata=
.b502a759bb6bceb6c8ccd76b57db2612501bb66bd9c46ece5f99f8bf16d7ac4a  ../build=
/tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.sigdata.7cf16a1f87d5058=
e134f3f6fc02612515e28784625413c87d3545e93ae0ab407=20
NOTE: Reconnecting to bitbake server...
Hash for task dependency diffstat:do_package_write_rpm changed from 41171f7=
938a2ddbe244372c1cc4300d91b7dca425eb8b214c19262e4949a7f18 to 2211ac20553e9d=
ddc710970cf1a663412ece5b5a2071e47c5471b3ee01efa2ce
    Hash for task dependency diffstat:do_package changed from f3fe486831eed=
e23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec to e5ff0ed8a81d8022b098=
1162e9b4e286886d9e281adee81175725072c3d413ec
    Unable to find matching sigdata for diffstat:do_package with hash e5ff0=
ed8a81d8022b0981162e9b4e286886d9e281adee81175725072c3d413ec

i.e. a couple of dependencies were different.

bitbake-diffsigs tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_package.si=
gdata.f3fe486831eede23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec  ../=
build/tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_package.sigdata.af8eb=
e96c5cf424e1094c1599400a56096302e16d0f691daaeec380b963f37b2

showed no output, i.e. they appear to be the same but different.

My best guess at what is going on here is hash equivalence causing
problems.=C2=A0

So in summary, I think the best solution will be to disable hash
equivalence for these tests.


Cheers,

Richard

