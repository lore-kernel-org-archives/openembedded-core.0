Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5255AC54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 12:45:46 +0000 (UTC)
Received: from dan.rpsys.net (dan.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web09.6663.1663850743051344052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 05:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@rpsys.net
 header.s=default header.b=rhidEiN/;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1663850739; bh=XJspKSh+K/nwAX18q2mA6wn9Ev1peCOzl8EI6mvNiKU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=rhidEiN/LROo7JYK0s7A6t+avRaT3IOX1JrHHDUfU0ZjEjxaPwRhuLuscKt0my0cY
	 D+tQg2fDiF261Al3HkX2nDnbsnlTTetMCRSNT2NfsYQ8b3cwTh+IX+D2zlwaSWY0Pv
	 NjuwXQr8dwCs6YU3WJ2ujVSZqv1S8YA/HawXC0UPMD0VjWYXWQx73IjkYeLfs8LlmD
	 wQMD+8Em6jnRHVm61LZiwQoCLc6/pPu3Zcloo0FWRakPjVMxD5t2lcJBIRVoRdOHRs
	 O2WRyz0SL7D9X61kRVxz8pYCGp0sAyinrWpw28GO5+n10Zc7pXoBgP3jLcV0f7/YfX
	 zLVgNiNGYBxTA==
Received: from [192.168.1.7] ([192.168.1.7])
	(authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id
 28MCjbl41796055
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 13:45:38 +0100
Message-ID: <36a2e82978462cfcd53ae5228ead7dc8b3ce4603.camel@rpsys.net>
Subject: Re: [OE-core] [PATCH 1/2] poky.conf: allow changes to
 DISTRO_VERSION, SDK_VERSION and MAINTAINER
From: Richard Purdie <rpurdie@rpsys.net>
To: Ross Burton <ross.burton@arm.com>,
        "mikko.rapeli@linaro.org"
	 <mikko.rapeli@linaro.org>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2022 13:45:37 +0100
In-Reply-To: <A7BB2455-96E4-4403-8E60-AE010F0AF124@arm.com>
References: <20220922122402.32710-1-mikko.rapeli@linaro.org>
	 <A7BB2455-96E4-4403-8E60-AE010F0AF124@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at dan
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 12:45:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170976

On Thu, 2022-09-22 at 12:42 +0000, Ross Burton wrote:
> On 22 Sep 2022, at 13:24, Mikko Rapeli via lists.openembedded.org <mikko.=
rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> >=20
> > For users who build their own variants of poky, they want to stay close
> > to poky.conf and thus use it, but would still like to change the
> > version details and maintainers to their own. With this change
> > these variables can be changed in local.conf, for example.
>=20
> If you want to name your distro, make your own distro.conf.

poky-tiny and poky-altcfg do this.

> You can trivially just include poky.conf as the first thing it does,
> but I do recommend that everyone using Yocto in production create
> their own distro and not piggyback on Poky.  Poky can, and does,
> change over time as it=E2=80=99s a test distro for QA purposes, and you m=
ay
> not want what we add.

Just to be clear, you can create a distro.conf file even in a local
build directory where local.conf is.

We've kind of left the =3D assignments in poky.conf to nudge people in
this direction as creating a custom distro in local.conf isn't really
what we want to encourage.

Cheers,

Richard


