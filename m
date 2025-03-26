Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D23C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 10:10:58 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.18706.1742983851600644521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 03:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B2DtGu+u;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FBB843231;
	Wed, 26 Mar 2025 10:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742983849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/U7sr6Wy8ufww6oZNPqEQTGwNVXV+yrnVUAiOtuIZcs=;
	b=B2DtGu+u7Zqx5bJovCL+hK5xnD6l5aut4z5iEUnmKfr0A8QMM+Aw4XwDBMjmWIHVx32iFV
	hQTNlfVPLBzvolvp99Zb0mrLNzBjleaCZNvHvIgi/Y2oug+0nnfdP2aGu15QlinCRW3dAy
	0xx0+LhpNbUCStAJuwVRKwJQiWXBxAhtdFlRpfMx3ORJvYIVBJM0uIxPQllTpUBVPtOUWc
	eT/rwgS42T/FWHDDeNXwHB3bqUW1bT7BwApUoprMIvOiSoaUnXcr/INBawQVlgLw7LA1DQ
	xmxA3aHQp1gXISNDxGbfV2txNLBfowVlzPluPYIZlpLWcH4S96IkB/u6aYsJQA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Mar 2025 11:10:48 +0100
Message-Id: <D8Q47HYAALIV.1Q4AZO2V3RPZ1@bootlin.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] dnf: upgrade 4.22.0 -> 4.23.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1742439740-18703-1-git-send-email-wangmy@fujitsu.com>
 <D8KXQ6QPGOL6.1VKUBIEENIJYU@bootlin.com>
 <TYWPR01MB11861D6EC6DC97514BE5AADF9DCA62@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861D6EC6DC97514BE5AADF9DCA62@TYWPR01MB11861.jpnprd01.prod.outlook.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuhffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeduieegjeffgeekiedvgfdtueefieffueetjeeghfejudefleffjeekleehuddtnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghpthhtohepohhpvghnvghms
 ggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 10:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213643

On Wed Mar 26, 2025 at 2:45 AM CET, Mingyu Wang (Fujitsu) wrote:
> After compiling the image, I did not encounter such an issue, so could yo=
u please tell me how to reproduce this problem?
>
>   --
> Best Regards
> ---------------------------------------------------

Hi,

Here is a reproducer sequence:

git clone ssh://git@push.yoctoproject.org/poky-ci-archive -b autobuilder.yo=
ctoproject.org/valkyrie/a-full-1229
. ./poky-ci-archive/oe-init-build-env
bitbake core-image-minimal

And I get this error:

ERROR: core-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command '=
/home/mdubois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-linux/core-ima=
ge-minimal/1.0/recipe-sysroot-native/usr/bin/dnf -v --rpmverbosity=3Dinfo -=
y -c /home/mdubois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-linux/cor=
e-image-minimal/1.0/rootfs/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/home/mdu=
bois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-linux/core-image-minima=
l/1.0/rootfs/etc/yum.repos.d --installroot=3D/home/mdubois-briand/swat/dnf/=
build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs --setopt=
=3Dlogdir=3D/home/mdubois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-li=
nux/core-image-minimal/1.0/temp --repofrompath=3Doe-repo,/home/mdubois-bria=
nd/swat/dnf/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/oe-=
rootfs-repo makecache --refresh' returned 1:
Traceback (most recent call last):
  File "/home/mdubois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-linux/=
core-image-minimal/1.0/recipe-sysroot-native/usr/bin/dnf.real", line 57, in=
 <module>
    main.user_main(sys.argv[1:], exit_code=3DTrue)
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/mdubois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-linux/=
core-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.13/site-packag=
es/dnf/cli/main.py", line 208, in user_main
    errcode =3D main(args)
  File "/home/mdubois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-linux/=
core-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.13/site-packag=
es/dnf/cli/main.py", line 67, in main
    return _main(base, args, cli_class, option_parser_class)
  File "/home/mdubois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-linux/=
core-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.13/site-packag=
es/dnf/cli/main.py", line 102, in _main
    cli.configure(list(map(ucd, args)), option_parser())
    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/mdubois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-linux/=
core-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.13/site-packag=
es/dnf/cli/cli.py", line 847, in configure
    self._read_conf_file(opts.releasever, opts.releasever_major, opts.relea=
sever_minor)
    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^
  File "/home/mdubois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-linux/=
core-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.13/site-packag=
es/dnf/cli/cli.py", line 981, in _read_conf_file
    subst.update_from_etc(from_root, varsdir=3Dconf._get_value('varsdir'))
    ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/mdubois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-linux/=
core-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.13/site-packag=
es/dnf/conf/substitutions.py", line 89, in update_from_etc
    self[fsvar] =3D val
    ~~~~^^^^^^^
  File "/home/mdubois-briand/swat/dnf/build/tmp/work/qemux86_64-poky-linux/=
core-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.13/site-packag=
es/dnf/conf/substitutions.py", line 57, in __setitem__
    releasever_major, releasever_minor =3D ConfigParser.splitReleasever(val=
ue)
                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: type object 'ConfigParser' has no attribute 'splitReleaseve=
r'

ERROR: Logfile of failure stored in: /home/mdubois-briand/swat/dnf/build/tm=
p/work/qemux86_64-poky-linux/core-image-minimal/1.0/temp/log.do_rootfs.2565=
307
ERROR: Task (/home/mdubois-briand/swat/dnf/poky-ci-archive/meta/recipes-cor=
e/images/core-image-minimal.bb:do_rootfs) failed with exit code '1'



--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


