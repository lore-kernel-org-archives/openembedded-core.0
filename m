Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB99FC83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 11:22:57 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.11602.1752232969464984481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 04:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HLjyldPD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAE2743914;
	Fri, 11 Jul 2025 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752232967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/P2+3ocFSEuktJ+IHtqB60QKnWo1rxouayuK4/TTI5U=;
	b=HLjyldPDDNP33tCNb5nbw9Ow1JbQUFL0XwzMoguB/KpyYEDTbhJANygB+zezVSjNbIqC7V
	A1voR+ZEwyumrLxvwnBajsSrMC2IB9OSn7TFDwYIKxnHQ4KsWo7InN8aHuZ8MPtf5uysah
	G0cKBMNJViwC3WKzhwS1Bwt2DI+2Cdi6YoM7gKWrIzZQiYVpSrgG/Dg67I37fzuO/YoaCe
	iU5HdPl9qpqBO4MRsQToD8dA/HvZbI4za9TI3v6a6syHpcPrDOBq8jaTGdlp4J2yY1NJSZ
	MTkaF9Fm5+9+BRAkLVnPEMcaDgZqFdoJnp082E8PQOoGvbIoqZ5iz+7INk6BEw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 13:22:46 +0200
Message-Id: <DB96QW0DBI2N.11E6ASE04WBX6@bootlin.com>
Cc: <jpewhacker@gmail.com>, <raj.khem@gmail.com>, "Ricardo Simoes"
 <ricardo.simoes@pt.bosch.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mark.jonas@de.bosch.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] dosfstools: Add ptests
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250710142015.174053-1-mark.jonas@de.bosch.com>
In-Reply-To: <20250710142015.174053-1-mark.jonas@de.bosch.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueegjefhgeegteeugfevieejueetleffhfefleejfffgtdejteejuefhteevudeunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdihohgtthhordhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepmhgrrhhkr
 dhjohhnrghsseguvgdrsghoshgthhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehjphgvfihhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopehrihgtrghrughordhsihhmohgvshesphhtrdgsohhstghhrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 11:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220140

On Thu Jul 10, 2025 at 4:20 PM CEST, Mark Jonas via lists.openembedded.org =
wrote:
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---

Hi Ricardo,

Thanks for your patch!

It looks like some of the added ptests are failing:

WARNING: core-image-ptest-dosfstools-1.0-r0 do_testimage: There were failin=
g ptests.
...
{'dosfstools': 'START: ptest-runner\n'
               '2025-07-11T10:03\n'
               'make  test-mkfs test-fsck test-label referenceFAT12.mkfs '
               'referenceFAT12.xxd referenceFAT16.mkfs referenceFAT16.xxd '
               'referenceFAT32.mkfs referenceFAT32.xxd referenceFAT32mbr.mk=
fs '
               'referenceFAT32mbr.xxd mkfs-fat32_2_res_sects.mkfs '
               'mkfs-fat32_2_res_sects.xxd mkfs-fat32_4K.mkfs '
               'mkfs-fat32_4K.xxd check-bad_names.fsck check-bad_names.xxd =
'
               'check-fat12_first_cluster.fsck check-fat12_first_cluster.ar=
gs '
               'check-fat12_first_cluster.xxd check-fat16_first_cluster.fsc=
k '
               'check-fat16_first_cluster.args check-fat16_first_cluster.xx=
d '
               'check-fat32_first_cluster.fsck check-fat32_first_cluster.ar=
gs '
               'check-fat32_first_cluster.xxd check-fat16_dos_cln_shut.fsck=
 '
               'check-fat16_dos_cln_shut.xxd check-fat32_dos_cln_shut.fsck =
'
               'check-fat32_dos_cln_shut.xxd check-chain_to_free_cluster.fs=
ck '
               'check-chain_to_free_cluster.xxd check-chain_too_long.fsck '
               'check-chain_too_long.xxd check-chain_to_other_file.fsck '
               'check-chain_to_other_file.xxd check-circular_chain.fsck '
               'check-circular_chain.xxd check-duplicate_names.fsck '
               'check-duplicate_names.xxd check-dot_entries.fsck '
               'check-dot_entries.xxd check-huge.fsck '
               'check-label-different.fsck check-label-different.xxd '
               'check-label-only-boot.fsck check-label-only-boot.xxd '
               'check-label-only-root.fsck check-label-only-root.xxd '
               'label-fat32_mkdosfs_label1_dosfslabel_empty.label '
               'label-fat32_mkdosfs_label1_dosfslabel_empty.xxd '
               'label-fat32_mkdosfs_label1_dosfslabel_label2.label '
               'label-fat32_mkdosfs_label1_dosfslabel_label2.xxd '
               'label-fat32_mkdosfs_label1_dosfslabel_NO_NAME.label '
               'label-fat32_mkdosfs_label1_dosfslabel_NO_NAME.xxd '
               'label-fat32_mkdosfs_label1_mlabel_erase.label '
               'label-fat32_mkdosfs_label1_mlabel_erase.xxd '
               'label-fat32_mkdosfs_label1_mlabel_NO_NAME.label '
               'label-fat32_mkdosfs_label1_mlabel_NO_NAME.xxd '
               'label-fat32_mkdosfs_label1_xp_erase.label '
               'label-fat32_mkdosfs_label1_xp_erase.xxd '
               'label-fat32_mkdosfs_label1_xp_label2.label '
               'label-fat32_mkdosfs_label1_xp_label2.xxd '
               'label-fat32_mkdosfs_label1.label '
               'label-fat32_mkdosfs_label1.xxd '
               'label-fat32_mkdosfs_none_dosfslabel_label1_xp_label2.label =
'
               'label-fat32_mkdosfs_none_dosfslabel_label1_xp_label2.xxd '
               'label-fat32_mkdosfs_none_dosfslabel_label1.label '
               'label-fat32_mkdosfs_none_dosfslabel_label1.xxd '
               'label-fat32_mkdosfs_none_dosfslabel_NO_NAME.label '
               'label-fat32_mkdosfs_none_dosfslabel_NO_NAME.xxd '
               'label-fat32_mkdosfs_none_xp_label1_dosfslabel_label2.label =
'
               'label-fat32_mkdosfs_none_xp_label1_dosfslabel_label2.xxd '
               'label-fat32_mkdosfs_none_xp_label1.label '
               'label-fat32_mkdosfs_none_xp_label1.xxd '
               'label-fat32_mkdosfs_none.label label-fat32_mkdosfs_none.xxd=
 '
               'label-fat32_xp_label1.label label-fat32_xp_label1.xxd '
               'label-fat32_xp_none_dosfslabel_label1.label '
               'label-fat32_xp_none_dosfslabel_label1.xxd '
               'label-fat32_xp_none_mlabel_label1.label '
               'label-fat32_xp_none_mlabel_label1.xxd '
               'label-fat32_xp_none.label label-fat32_xp_none.xxd\n'
               'make: /bin/bash: No such file or directory\n'
               'make: *** [Makefile:858: check-am] Error 127\n'
               '\n'
               'ERROR: Exit status is 2\n'
               'DURATION: 0\n'}

ptests which had no test results:
['dosfstools']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1880
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/201

Full ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250711-49/testresults/qemux86-6=
4-ptest/core-image-ptest-dosfstools/
https://valkyrie.yocto.io/pub/non-release/20250711-47/testresults/qemuriscv=
64-ptest/core-image-ptest-dosfstools/

Can you have a look at these failures please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


