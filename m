Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE123C021AD
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 17:15:56 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.1277.1739898953811743328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 09:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NqbPFoVJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C82BB442AB;
	Tue, 18 Feb 2025 17:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739898952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3ywjp6/BzJCa/wDlH5c6SZotpsux8n2Xv84yAjkZrU=;
	b=NqbPFoVJM+nMpyfR5QKVdLEUDGr++XfGW79Z1POt9Nz5HQywXpfEFNCMB6UZGquvAjZybQ
	dk11d4K4Xkp/uvDsXm87lM6Bf0Q89rvw28TKbVJtmxL4zm5WdwZF2pGryZKR9lZ2IvpZe7
	vSMEf8agWXCCdtPHHdHCobyVlw43jZVStgWWi+7j+Wjs+eUOUXjRdyB9XZ6n9G1+lYKtJP
	9Su1T5nWKWbXgf1MVQPVtaAuN+bCsDtC4yrjZIWdzbuG9Paos3vS5rFUaOrajy2LBwXVxV
	drqlFxX7fhdMMwRzlUqXXwDTV4+axWSykoXgguJXktm8ajfW8KfH/mNwuB0v8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Feb 2025 18:15:51 +0100
Message-Id: <D7VQPBSVP6PJ.2CIYIN5Y67FR0@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 15/32] pango: upgrade 1.55.5 -> 1.56.1
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
 <1739864375-21394-15-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1739864375-21394-15-git-send-email-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfguedvgffhgedthedvgeevhfekgeehieekleeffeffteehiedtudduleduudelnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeifrghnghhmhiesfhhujhhithhsuhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsv
 gguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 17:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211637

On Tue Feb 18, 2025 at 8:39 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Avoid criticals when there are no fonts
> - fontconfig: Handle lack of FC_FONT_WRAPPER in font cache
> - fontconfig: Prefer application fonts even if they are older
> - Support setting font features in font descriptions
> - serialization: Document the tab array format
> - serialization: Accept attributes without range
> - win32: Improve the pango_font_map_reload_implementation
> - win32: Take variations into account for caching
> - layout: Fix measuring ellipsis runs with shapes
> - build: Require C11
> - build: Require GLib 2.80
> - build: Require cairo 1.18
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi,

This does fail on qemux86-world-alt:

ERROR: pango-1.56.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-wor=
ker/qemux86-world-alt/build/build/tmp/work/core2-64-poky-linux/pango/1.56.1=
/temp/run.do_configure.1676834' failed with exit code 1
...
| Program rst2man rst2man.py found: NO
| Program rst2html5 rst2html5.py found: NO
|
| ../pango-1.56.1/docs/meson.build:222:12: ERROR: Program 'rst2html5 rst2ht=
ml5.py' not found or not executable
|
| A full log can be found at /srv/pokybuild/yocto-worker/qemux86-world-alt/=
build/build/tmp/work/core2-64-poky-linux/pango/1.56.1/build/meson-logs/meso=
n-log.txt
| ERROR: meson failed
| WARNING: exit code 1 from a shell command

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/17/builds/955/ste=
ps/11/logs/stdio

Can you have a look at this failure please?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


