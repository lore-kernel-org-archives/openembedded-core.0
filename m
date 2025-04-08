Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C553EC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 11:17:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.72710.1744111042912144271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 04:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e3+6KnCl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5912943160;
	Tue,  8 Apr 2025 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744111040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POgtR27c0yKJ4C532b7rY0wQGNDdZ0JpB26FgZtdzTQ=;
	b=e3+6KnClJrink57nJQezA42SfVHc2J1n1BDi2pyW3Lkl0sEXeGlgh5cFi3ZoNlcRTizZO8
	+uZmBMoFWPFN/3a5P6KDAhXcoTH4wQdBEEgagpGVr2FoW2stG6Z8aLoyra7GhlH7wJZEi4
	hlT8zCNS+crKwq9/xG9iDQvEkIQUoxGt/EgNJqduF4/QaPnQYuB1vd62iThWZuqFXEhgOH
	v2lHoBC/Rf2l4ZlcEiDWdj6dyG5P25rno30jxlm0Ze9zZ0TEhDljoUf6SNhrVkan8+yWsY
	e8fzkYO+Dyhfl2DxELNPCJMWgtNaKCPWV+fP8Rc/C7D2oy3FrARxJ7AYDCZBiw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 13:17:19 +0200
Message-Id: <D917RIL4YVYB.2M2GS34YXOHO4@bootlin.com>
Subject: Re: [OE-core] [PATCH 01/15] curl: upgrade 8.12.1 -> 8.13.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffellefgveekfeegheejiedutedukeffkeduvdevvddtgefgffffveefgfdvudenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeifrghnghhmhiesfhhujhhithhsuhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsr
 dhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 11:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214533

On Tue Apr 8, 2025 at 2:51 AM CEST, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> no-test-timeout.patch
> refreshed for 8.13.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for your patch.

I believe the curl update is breaking nativesdk-cmake on the
autobuilder:

ERROR: nativesdk-cmake-3.31.6-r0 do_compile: Execution of '/srv/pokybuild/y=
octo-worker/qemuarmv5/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/n=
ativesdk-cmake/3.31.6/temp/run.do_compile.1695358' failed with exit code 1

| In file included from /srv/pokybuild/yocto-worker/qemuarmv5/build/build/t=
mp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-cmake/3.31.6/cmake-3.31.6/=
Utilities/cm3p/curl/curl.h:8,
|                  from /srv/pokybuild/yocto-worker/qemuarmv5/build/build/t=
mp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-cmake/3.31.6/cmake-3.31.6/=
Source/cmCurl.h:12,
|                  from /srv/pokybuild/yocto-worker/qemuarmv5/build/build/t=
mp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-cmake/3.31.6/cmake-3.31.6/=
Source/cmCurl.cxx:3:
| /srv/pokybuild/yocto-worker/qemuarmv5/build/build/tmp/work/x86_64-natives=
dk-pokysdk-linux/nativesdk-cmake/3.31.6/cmake-3.31.6/Source/cmCurl.cxx: In =
function 'std::string cmCurlSetNETRCOption(CURL*, const std::string&, const=
 std::string&)':
| /srv/pokybuild/yocto-worker/qemuarmv5/build/build/tmp/work/x86_64-natives=
dk-pokysdk-linux/nativesdk-cmake/3.31.6/cmake-3.31.6/Source/cmCurl.cxx:178:=
26: error: invalid conversion from 'long int' to 'CURL_NETRC_OPTION' [-fper=
missive]
|   178 |       curl_netrc_level =3D CURL_NETRC_OPTIONAL;
|       |                          ^~~~~~~~~~~~~~~~~~~
|       |                          |
|       |                          long int
| /srv/pokybuild/yocto-worker/qemuarmv5/build/build/tmp/work/x86_64-natives=
dk-pokysdk-linux/nativesdk-cmake/3.31.6/cmake-3.31.6/Source/cmCurl.cxx:180:=
26: error: invalid conversion from 'long int' to 'CURL_NETRC_OPTION' [-fper=
missive]
|   180 |       curl_netrc_level =3D CURL_NETRC_REQUIRED;
|       |                          ^~~~~~~~~~~~~~~~~~~
|       |                          |
|       |                          long int
| /srv/pokybuild/yocto-worker/qemuarmv5/build/build/tmp/work/x86_64-natives=
dk-pokysdk-linux/nativesdk-cmake/3.31.6/cmake-3.31.6/Source/cmCurl.cxx:182:=
26: error: invalid conversion from 'long int' to 'CURL_NETRC_OPTION' [-fper=
missive]
|   182 |       curl_netrc_level =3D CURL_NETRC_IGNORED;
|       |                          ^~~~~~~~~~~~~~~~~~
|       |                          |
|       |                          long int

Can you have a look at this please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


