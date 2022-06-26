Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C103C433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 09:52:00 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.28424.1656237114168101776
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 02:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a6DJqDm7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id i1so4508123wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 02:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=/YtuJ/P0ZOwoSG+cBY3eb33Ad67x3Mq5XPORl5vGs4E=;
        b=a6DJqDm7HiybK5m6eSd+gQWP044UuPtn5aBHU8+LOuzQVVkowutx4QadElvo+UhbMO
         GdP5H3QvKi/mDvzavzl7CFndyKwfgPmI0A0oVE+ozoPol5hNZpQbWzRJhw4uckXvYx//
         BWRwQmq9VI9gP/1/Fp47xmLOrgkXApPeyIbbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=/YtuJ/P0ZOwoSG+cBY3eb33Ad67x3Mq5XPORl5vGs4E=;
        b=DiecDucogA1AyKh+lInTWNKU4XF7z6dvCQypAyLhUJni2qEHfWBR3n9jfimg4kXCxN
         22VCA9Mx5ew+ChEEUDF3UDhPukqUMzvheUWvU1S1AIFodd7shkG2vE3H6AsA8CyYgLV6
         ET8DOfGzC0RgYAD16+mQw7NqMFUa643I+m3hR3MjH1hHu2jwOTmp8AhzMTLP+Zdntv3J
         A/bb2Kt6MfqsbL0DEPZ0eGZHarchmo5Q137/E/dydFk6ApAgtBWRPBXrLTamHB/9heBW
         x0/tPKU+8mXOmS0y/ovA8/lGXBF2NFM5kT4ZCYaCjNOFfosGCoH7jn933OTKT8s4vexF
         PxkQ==
X-Gm-Message-State: AJIora9bcoaLovruWxv9Ixal10VFcl493MQJgqF0jlBrYkAB+HKZs3Vg
	gdS4HXizzyLIaeu4gC1Q5IHiyQ==
X-Google-Smtp-Source: 
 AGRyM1u00e9QnZq+hKkARWzW8T1Nz6Q7WespB0uB/vjbBCJfRH5r/vokQZSuNGe4lmOoHOYHUs4nSg==
X-Received: by 2002:adf:dd41:0:b0:21b:8201:4b66 with SMTP id
 u1-20020adfdd41000000b0021b82014b66mr7112086wrm.706.1656237112620;
        Sun, 26 Jun 2022 02:51:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2873:558:fe47:ee6f?
 ([2001:8b0:aba:5f3c:2873:558:fe47:ee6f])
        by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c35cf00b003a0375c4f73sm8084723wmq.44.2022.06.26.02.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 02:51:52 -0700 (PDT)
Message-ID: 
 <45afa12d8f0eeb976e478f0103279e8bc1f2228f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] llvm: add PACKAGECONFIG[optviewer]
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: luca.ceresoli@bootlin.com, openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>, Stefan Herbrechtsmeier
	 <stefan.herbrechtsmeier-oss@weidmueller.com>
Date: Sun, 26 Jun 2022 10:51:51 +0100
In-Reply-To: <20220622204701.254358-1-luca.ceresoli@bootlin.com>
References: <20220622204701.254358-1-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jun 2022 09:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167307

On Wed, 2022-06-22 at 22:47 +0200, Luca Ceresoli via
lists.openembedded.org wrote:
> Currently the CMake configuration for llvm finds the python pygments and
> pyyaml if they are installed on the host. This makes builds
> non-reproducible across different machines, some having those modules
> installed and some others not.
>=20
> This has been causing a 'reproducible' failure on one of the autobuilders=
:
>=20
>   AssertionError: The following deb packages are missing or different and=
 not in exclusion list: /home/pokybuild/yocto-worker/reproducible/build/bui=
ld-st/reproducibleB/tmp/deploy/deb/./core2-64/llvm-dev_14.0.4-r0_amd64.deb
>   The following ipk packages are missing or different and not in exclusio=
n list: /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducib=
leB/tmp/deploy/ipk/./core2-64/llvm-dev_14.0.4-r0_core2-64.ipk
>   The following rpm packages are missing or different and not in exclusio=
n list: /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducib=
leB/tmp/deploy/rpm/./core2_64/llvm-dev-14.0.4-r0.core2_64.rpm
>=20
> Fix by adding an explicit PACKAGECONFIG to control the
> LLVM_HAVE_OPT_VIEWER_MODULES option in CMake. If unset, it forces CMake t=
o
> ignore pygments and pyyaml, no matter it they are available on the host. =
If
> set, it DEPENDS on the pygments and pyyaml modules so that CMake will fin=
d
> and use them.
>=20
> Based on suggestions from Stefan and Markus -- thanks.
>=20
> Proposed-by: "Stefan Herbrechtsmeier" <stefan.herbrechtsmeier-oss@weidmue=
ller.com>
> Proposed-by: "Markus Volk" <f_l_k@t-online.de>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Just wanted to say thanks for the help on this one, I think we ended up
with a better fix than I'd originally thought we'd have!

It is one less issue to cause problems on the infrastructure too :)

Cheers,

Richard


