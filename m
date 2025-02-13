Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE98C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:24:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13448.1739460260110821294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hLVbn6yp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7F2D44204;
	Thu, 13 Feb 2025 15:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739460258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8W7VMjsOn8dKPxERKw4pKt4cMjERiYERLRyYrvVGDOU=;
	b=hLVbn6ypGAJlobX4Yk4iLyTLWjBj9otPiNAsPP+GUBXpr+CWqP4Dm1S6ZinDFD1I4fPiwF
	xi4DB4auPykCW5qY4bJ4T9xAkK0loTOnN/5N+dnOt31VuRjqdHrhHWK/TBlmm8+KvL6tnT
	/+wD8SZYzjCOHQkABJN+jg6mf27S9HcLEFS0svuypaLaA3fQ08A6nWmv/6JWvrJw+CsYne
	sSzjpOZoFAS9iSbue5yjPh9jo3xLilGo1rl9ip6oNzrXyuvwqQq4FJJL+j/xyu5qjU4fWY
	Wq0Gn4bJ3Zg7WtrfMh8Q763F7KdCu/J3I/z32owBJI0tOMrV98z+G28gNjCBHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Feb 2025 16:24:17 +0100
Message-Id: <D7RF76LMC7EB.E2CV3ZDTJAVA@bootlin.com>
Subject: Re: [OE-core][PATCH 3/5] diffutils: upgrade from 3.10 to 3.11
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Joshua Watt" <jpewhacker@gmail.com>, <Qi.Chen@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250213060000.1092285-1-Qi.Chen@windriver.com>
 <20250213060000.1092285-3-Qi.Chen@windriver.com>
In-Reply-To: <20250213060000.1092285-3-Qi.Chen@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvedvvdfhheegtefgheetjeeuvdeiveefhefhieekheefvdejleelteejiefgteeinecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjphgvfihhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopefsihdrvehhv
 ghnseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 15:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211355

On Thu Feb 13, 2025 at 6:59 AM CET, Chen Qi via lists.openembedded.org wrot=
e:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Upgrade diffutils from 3.10 to 3.11.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hi,

Not an issue with the patch, just to notify Joshua: this will break
meta-mingw if merged:

4024 ERROR: nativesdk-diffutils-3.11-r0 do_patch: Applying patch '0001-sdif=
f-Match-execvp-argument-types.patch' on target directory '/srv/pokybuild/yo=
cto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw=
32/nativesdk-diffutils/3.11/diffutils-3.11'

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/7/builds/1031/ste=
ps/12/logs/stdio

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


