Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AD5D5E152
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 10:16:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.9609.1731061005296688193
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 02:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P9YJ8b8F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27770FF808;
	Fri,  8 Nov 2024 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731061003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e0xM7Ew+gVhdAufBdkxk00+PCMVsboPjD23F9EbnZDQ=;
	b=P9YJ8b8FqJRMHklmKebiqj8Vz+qdrAmUTjJ+0USBnofTsx6r8HtgA9I1GcX0LtGgNsYVx4
	tGETTqh6moTjSA24Vuq3ZZGaNqhPudSJi5ZHI9yBAco7CCMas5ULo8LcF5c5Clg6IgyFqb
	TcQVAL6OgODvVcBhVVhtpfUD7gxMKL2GCHB0Hkt0RJykOrAU1Ah0JOfgxSHbofCOqHRv51
	0LWJeMJNPzLDE8Lp+kXHGsLfD+/7nsOq+hVWw4FZ2RsQIiUlPcQHzQLyrnEcP/UDwNohYf
	7re7LbJ4baXfK3atpPlXFgsqc4rsIr3Kd5C5MvV81NrfMOHyvRqgHufGfhPqBQ==
Date: Fri, 8 Nov 2024 11:16:41 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 1/8] python3-setuptools: add more comments
 to a patch
Message-ID: <Zy3lCZixZnhcyawo@bootlin-mathieu>
Mail-Followup-To: Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
References: <20241107172404.4017047-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107172404.4017047-1-ross.burton@arm.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 10:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206859

On Thu, Nov 07, 2024 at 05:23:57PM +0000, Ross Burton wrote:
> Add more explanatory comments, including when we can drop the patch.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Hi Ross,

Thanks for the v2, but I suspect it is still responsible for some
failures on the autobuilder.

First we have some reproducibility issues on numpy. (Issues on piglit
are probably linked to the build fail described below).

AssertionError: Bitbake reproducibleA failure
The following deb packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/python3-numpy-dbg_1.26.4-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/python3-numpy_1.26.4-r0_amd64.deb
The following deb packages are missing and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/piglit-bash-completion_1.0+gitr0+c11c9374c1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/piglit-dbg_1.0+gitr0+c11c9374c1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/piglit-dev_1.0+gitr0+c11c9374c1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/piglit-doc_1.0+gitr0+c11c9374c1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/piglit_1.0+gitr0+c11c9374c1-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/python3-numpy-dbg_1.26.4-r0_core2-64.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/python3-numpy_1.26.4-r0_core2-64.ipk
The following ipk packages are missing and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/piglit-bash-completion_1.0+gitr0+c11c9374c1-r0_core2-64.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/piglit-dbg_1.0+gitr0+c11c9374c1-r0_core2-64.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/piglit-dev_1.0+gitr0+c11c9374c1-r0_core2-64.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/piglit-doc_1.0+gitr0+c11c9374c1-r0_core2-64.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/piglit_1.0+gitr0+c11c9374c1-r0_core2-64.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/python3-numpy-1.26.4-r0.core2_64.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/python3-numpy-dbg-1.26.4-r0.core2_64.rpm
The following rpm packages are missing and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/piglit-1.0+gitr0+c11c9374c1-r0.core2_64.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/piglit-bash-completion-1.0+gitr0+c11c9374c1-r0.core2_64.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/piglit-dbg-1.0+gitr0+c11c9374c1-r0.core2_64.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/piglit-dev-1.0+gitr0+c11c9374c1-r0.core2_64.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/piglit-doc-1.0+gitr0+c11c9374c1-r0.core2_64.rpm

https://valkyrie.yoctoproject.org/#/builders/37/builds/421/steps/13/logs/stdio

Diffoscope output can be found here:
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20241108-wkf8tasz/packages/

There is also a build error on piglit. I'm not sure but I suspect this
is also caused by these patches, as piglit depends on numpy. I will
confirm this with a new build today.

| CMake Error at
/srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/recipe-sysroot-native/usr/share/cmake-3.30/Modules/FindPackageHandleStandardArgs.cmake:233
(message):
|   Could NOT find PythonNumpy (missing: PythonNumpy_STATUS) (Required
is at
|   least version "1.7.0")

https://valkyrie.yoctoproject.org/#/builders/59/builds/399/steps/11/logs/stdio

Can you have a look at these issues please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

