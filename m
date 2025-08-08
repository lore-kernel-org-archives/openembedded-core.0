Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD004C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 11:00:28 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.19290.1754650824787972271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 04:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MpWrpGvH;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98B224420A;
	Fri,  8 Aug 2025 11:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754650822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q7xfjRi0BfsLUg0pJsIv2rfdatDQ76lvpeLEc4iJ9l8=;
	b=MpWrpGvHz9ZhT57pP6if7HX5UzRo+BLHOIJO0FfRqaU0lj7sUPRZ/Cl589EQl+uL0uV68Z
	rz6d/1JQkbbJIMrFh01SqLxJJo69PBN9LbtcPp8waKB5fYTZls+M92Fzf6v8hHyEM1G6UE
	Cd4F/CWcGfdPliinD2ZoURwYeXeD9bZKTWn2i9ukiGmw8VG+hqhlwhike8pG/htsl1VBZ+
	5lihSf0MInhODM4NfUUp2GXnEAbOtJI60aXcvho9sj4uwjk7hcgrpRrF6VPHy0yPd6V/J7
	LynlzmcclayOtcxmNOLGlXELanP04HHpEYH9Y4kTh6VDWTf3cCaO6TXtwdOvPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 13:00:21 +0200
Message-Id: <DBWZSZFJPU0Q.85U7OINILZ2R@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tim.orling@konsulko.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] python3-zipp: upgrade 3.21.0 -> 3.23.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1754591996.git.tim.orling@konsulko.com>
 <a3eb2194866253dce443cbdfe1815109f45c40aa.1754591996.git.tim.orling@konsulko.com>
In-Reply-To: <a3eb2194866253dce443cbdfe1815109f45c40aa.1754591996.git.tim.orling@konsulko.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdefieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudeiiefhkedtjeejheeiledviefgudeiudduheejgedtgedugedvleehheevieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmedvvdgrvdemugehgegsmeejhehfsgemieehtghfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemvddvrgdvmeguheegsgemjeehfhgsmeeihegtfhdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehtihhmrdhorhhlihhngheskhhonhhsuhhlkhhordgtohhmp
 dhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 11:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221650

On Thu Aug 7, 2025 at 8:44 PM CEST, Tim Orling via lists.openembedded.org w=
rote:
> From: Tim Orling <tim.orling@konsulko.com>
>
> License-Update: add copyright year; update to match SPDX license text
>
> v3.23.0
> * Features
>   - Add a compatibility shim for Python 3.13 and earlier. (#145)
>
> v3.22.0
> * Features
>   - Backported simplified tests from python/cpython#123424. (#142)
> * Bugfixes
>   - Fixed .name, .stem, and other basename-based properties on Windows wh=
en
>     working with a zipfile on disk. (#133)
>
> https://github.com/jaraco/zipp/blob/main/NEWS.rst#v3230
> https://github.com/jaraco/zipp/blob/main/NEWS.rst#v3220
>
> Comparing changes:
> https://github.com/jaraco/zipp/compare/v3.21.0...v3.23.0
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---

Hi Tim,

Thanks for the patch.

It looks like this is breaking in several builds:

ERROR: lib32-python3-zipp-3.23.0-r0 do_compile: Execution of '/srv/pokybuil=
d/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib=
32-python3-zipp/3.23.0/temp/run.do_compile.3832240' failed with exit code 1
...
| ERROR Missing dependencies:
| 	coherent.licensed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2177
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/924
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2236
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2206
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2027
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2184
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2250

Can you have a look at this failure please?

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


