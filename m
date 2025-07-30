Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001D1C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 07:05:47 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.29432.1753859144992188608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 00:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V5sCGqQH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B3E5443E8;
	Wed, 30 Jul 2025 07:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753859141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4z+LyGJBzqlquqi3FxhYtNUt6HLYpQfIJM695dQcXyw=;
	b=V5sCGqQHp/ItAtFRw4vtrlTP6a3PgdJgVbY40P4m/l9CVZDGj+83ryUe5RMV0VrxV/Qcio
	Pv2v8J46mEUVIMMbQz0nwhxbzc1uj/DlC4ObA49qOM8TdRjRfAas9eNqhZoMlcldmZYv00
	/yHUpbvhH2uBFvmnjC26k2A9Ds6HyjTgJD+LY3nL/1cjJIx2kpSAs4/j3FBnBVUIYOXLUf
	3EAQRG79peSDtH65zHoUQWnkviB9el7cOZQAna7jeWfupeE5JKv/jJs7Kaxe3JEOmNpvuq
	pjFPi18VeRiNdsIZv7HzDgOOao5vs+Sju1KYgDAR+d0iQLSuPhcixALaueEviw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Jul 2025 09:05:40 +0200
Message-Id: <DBP76ED1BYRR.2VALKUKEVWLVH@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/3] classes/toolchain/clang: compiler-rt
 and libcxx are not target-specific
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250729122448.1067745-1-ross.burton@arm.com>
In-Reply-To: <20250729122448.1067745-1-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteekvddtudetteetgeejueekhffgjefgffefffeuffejhfdvheejfeekfeduvddvnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdihohgtthhordhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtt
 hhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 07:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221106

On Tue Jul 29, 2025 at 2:24 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> This file can be used for nativesdk builds, which if they are using the
> clang toolchain will also need compiler-rt and libcxx.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Looks better now, but we do have a reproducibility issue:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./core2-64/libllvmspirvlib-dbg_20.1.4-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./core2-64/libllvmspirvlib20.1_20.1.4-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./core2-64/lld-dbg_20.1.8-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./core2-64/lld_20.1.8-r0_amd64.deb

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2184
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250729-g9mmstqt/=
packages/diff-html/

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


