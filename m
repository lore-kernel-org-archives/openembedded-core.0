Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53346C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 09:04:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2586.1745571837572897462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 02:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BpIr5A87;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65CF843314;
	Fri, 25 Apr 2025 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745571835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IPXG2+O2nYv3aPLQ0OqQPXTdiEdnqncC1OjuJTnGAVQ=;
	b=BpIr5A87dyQbZwkemRH9EBaLRWP3aoY/8TD8q+1/XN80Vo2rrLHiec1NJbytLmlpJNPlTt
	XnpSbuKncMkFaUivCrDhwm67TPfFcgCqPL8yjiXcaJ7/vbT9KBcCMloFvyVwaEnVyQobsL
	lXhKjTnyG9ufRMI/pu6pwII77FIhOvzTNt0ETOuS9amNngbeMrV5IjpXNwcSpMCoUbMjD/
	8AUFIjv8fLKNQ3ySLqeHtAaIMje0Q3bF/4THXjwuAH3k4cMGGBXe3sq25h5oDdeOPcM8Dk
	p7fXHGjBN69hBma09ckIjDCqOxVIYxw5AiIVlTfprwfJJoPFOTz2VsdIriJdcw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 11:03:54 +0200
Message-Id: <D9FLKMJI0UMB.23SHVQV5YOL2R@bootlin.com>
To: <mikko.rapeli@linaro.org>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 7/9] image_types_wic.bbclass: capture
 verbose wic output by default
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
 <20250422143501.99565-8-mikko.rapeli@linaro.org>
In-Reply-To: <20250422143501.99565-8-mikko.rapeli@linaro.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheduleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeettdejvdefudegueejjeehkeejueetudejvddvgeelgeegkeeigeduvdejtdfggeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrghdprhgtphhtthhopehop
 hgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 09:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215447

On Tue Apr 22, 2025 at 4:34 PM CEST, Mikko Rapeli via lists.openembedded.or=
g wrote:
> Call wic with --debug to capture logs from wic internals
> so that it's clear which partitions get created and which
> files get copied where. wic plugins contain for example
> race conditions which don't install files at all and thus
> images fail to boot and it's not possible to debug these without
> something in wic task logs.
>
> For example core-image-initramfs-boot do_image_wic
> log is now 576 lines which is not excessive but very
> important when debugging problems, especially race
> conditions which are only hit in some builds in CI.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/image_types_wic.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-r=
ecipe/image_types_wic.bbclass
> index 1b422b6280..10888bc12b 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -72,7 +72,7 @@ IMAGE_CMD:wic () {
>  	if [ -z "$wks" ]; then
>  		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. P=
lease set WKS_FILE or WKS_FILES appropriately."
>  	fi
> -	BUILDDIR=3D"${TOPDIR}" PSEUDO_UNLOAD=3D1 wic create "$wks" --vars "${ST=
AGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w =
"$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> +	BUILDDIR=3D"${TOPDIR}" PSEUDO_UNLOAD=3D1 wic create --debug "$wks" --va=
rs "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_w=
ic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> =20
>  	# look to see if the user specifies a custom imager
>  	IMAGER=3Ddirect

Hi Mikko,

As we dropped the "oeqa wic.py: clean image build dir before rebuild in
test_permissions" patch, we again have an issue with this one.

2025-04-24 16:54:36,535 - oe-selftest - INFO - wic.Wic.test_permissions (su=
bunit.RemotedTestCase)
2025-04-24 16:54:36,536 - oe-selftest - INFO -  ... FAIL
...
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function set_image_size
| DEBUG: 23394.800000 =3D 17996 * 1.300000
| DEBUG: 23394.800000 =3D max(23394.800000, 8192)[23394.800000] + 0
| DEBUG: 23395.000000 =3D int(23394.800000)
| DEBUG: 23395 =3D aligned(23395)
| DEBUG: returning 23395
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_wic
| abort()ing pseudo client by server request. See https://wiki.yoctoproject=
.org/wiki/Pseudo_Abort for more details on this.
| Check logfile: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-1239956/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/pseudo//p=
seudo.log
| Aborted (core dumped)
| WARNING: exit code 134 from a shell command.
NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
ERROR: Task (/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/rec=
ipes-core/images/core-image-minimal.bb:do_image_wic) failed with exit code =
'1'
Pseudo log:
path mismatch [2 links]: ino 157047752 db '/srv/pokybuild/yocto-worker/oe-s=
elftest-armhost/build/build-st-1239956/tmp/work/qemuarm64-poky-linux/core-i=
mage-minimal/1.0/rootfs/var/log' req '/srv/pokybuild/yocto-worker/oe-selfte=
st-armhost/build/build-st-1239956/tmp/work/qemuarm64-poky-linux/core-image-=
minimal/1.0/tmp-wic/rootfs1/var/log'.
Setup complete, sending SIGUSR1 to pid 346075.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1507

This can be reproduced locally:

Get https://web.git.yoctoproject.org/poky-ci-archive/tag/?h=3Dautobuilder.y=
octoproject.org/valkyrie/a-full-1456
and run 'oe-selftest -r wic.Wic.test_permissions'

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


