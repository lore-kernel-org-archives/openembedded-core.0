Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6217DC35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 09:33:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.3842.1742376794710833066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 02:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hMrFN1AA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EC6743281;
	Wed, 19 Mar 2025 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742376793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2EaCm777PgKKd3rsNNwDD48zPdxYTDaNxyVcu8Oh70=;
	b=hMrFN1AAwKg9K8ZyzgxVeM1Z+Sx3yH6aDYzQUAb6n9xUcZvB5F7ujVI21e1MIZEaSHrxlE
	hrQcweBTvk3tPrkcANCfV/I2lahFSgTvy8DpD9IR5vFwB1xLARzPgSu2Vb+VQ6sWY9x+NZ
	TsWNWn7M26IHZvqFnoviPLiZcp7i3YQznK5XUDEZPlPmzwTIbNyk58bFSENwyspFlTbmOg
	he9kQgVbMsQvqZqVp/2leWFZI+GGMChx1cSFjXyqTiUOwPamRi/BedAT3J/sWF5A0Fz9rW
	JUTftRxD3JcWQKV63+ik6UgQ/yBvBjszdY7fyq4Cx2q9/OCNRwIsdlE9jotxfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Mar 2025 10:33:12 +0100
Message-Id: <D8K50W97LGL8.1WRT66MJ5ZYV1@bootlin.com>
To: <Pascal.Weisser.ext@karlstorz.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/3] Resolve YOCTO #14520 and YOCTO #15525.
Cc: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250318104853.1442703-1-pascal.weisser.ext@karlstorz.com>
In-Reply-To: <20250318104853.1442703-1-pascal.weisser.ext@karlstorz.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeegleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugfevveeuteeghfefteefudevleduhfffhedujefhfeffvdetveelhfejkeejheenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdduvddrsggspdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprfgrshgtrghlr
 dghvghishhsvghrrdgvgihtsehkrghrlhhsthhorhiirdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213314

On Tue Mar 18, 2025 at 11:48 AM CET, Pascal.ext via lists.openembedded.org =
Weisser wrote:
> This patch series resolves the issues YOCTO #14520 and YOCTO #15525.
>
> Weisser, Pascal (3):
>   Revert "qemuboot: Trigger write_qemuboot_conf task on changes of
>     kernel image realpath"
>   qemuboot: Trigger do_write_qemuboot_conf task on bundled initramfs
>     changes
>   qemuboot: Provide default value for INITRAMFS_LINK_NAME
>
>  meta/classes-recipe/qemuboot.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Hi Pascal,

Thanks for your patch.

I believe this is creating circular dependencies in some cases: we got a
few errors on the autobuilder:

ERROR:
Dependency loop #1 found:
  Task /srv/pokybuild/yocto-worker/genericarm64-alt/build/meta/recipes-core=
/images/core-image-initramfs-boot.bb:do_image_complete (dependent Tasks ['q=
emu-system-native_9.2.0.bb:do_populate_sysroot', 'core-image-initramfs-boot=
.bb:do_image', 'core-image-initramfs-boot.bb:do_image_cpio', 'core-image-in=
itramfs-boot.bb:do_write_qemuboot_conf', 'qemu-helper-native_1.0.bb:do_addt=
o_recipe_sysroot'])
  Task /srv/pokybuild/yocto-worker/genericarm64-alt/build/meta/recipes-kern=
el/linux/linux-yocto_6.12.bb:do_bundle_initramfs (dependent Tasks ['core-im=
age-initramfs-boot.bb:do_image_complete', 'linux-yocto_6.12.bb:do_install']=
)
  Task /srv/pokybuild/yocto-worker/genericarm64-alt/build/meta/recipes-kern=
el/linux/linux-yocto_6.12.bb:do_deploy (dependent Tasks ['depmodwrapper-cro=
ss_1.0.bb:do_populate_sysroot', 'linux-yocto_6.12.bb:do_populate_sysroot', =
'linux-yocto_6.12.bb:do_packagedata', 'pigz_2.8.bb:do_populate_sysroot', 'l=
inux-yocto_6.12.bb:do_bundle_initramfs'])
  Task /srv/pokybuild/yocto-worker/genericarm64-alt/build/meta/recipes-core=
/images/core-image-initramfs-boot.bb:do_write_qemuboot_conf (dependent Task=
s ['linux-yocto_6.12.bb:do_deploy', 'core-image-initramfs-boot.bb:do_rootfs=
'])

https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/1218
https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/1215

Can you have a look at these failures please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


