Return-Path: <oliver.graute@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 13E5E60111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 16:26:03 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id c200so36586688wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 08:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=tcxNQANO4hxAzyZNQZxOP0oEfM4VXOZg11eisOGvhBs=;
	b=xAZh9vqOvNkYd1OOKKyv/vfNL9+5lX8AkfInW22XdS9wWbAoFsg8QpkH2JWjqoNLnT
	+cTbD4PbQv1wfuczG3XKo2D8movI7ziQ7BVzT1aYqk6l7sjyr9uDXGcLJNeZTzOw1CL2
	8sw69xXBfi8BiSKeM/LDJyxoIuuvBW3K8bJyRmpL/KJ7u3OVC+Foy4q0chKTOLIgsn7H
	Px0yiJPw35viTF/HHXe/A7nefbN9RMKax4stAXEPmTji260t2m5K3t5giRp7tUuEgWl0
	uhAulcB9Xcn/l5Bruo6PFXgPr/+QemXJvy3KkL2KV0069ODOIK8qVMEmvXGDjVx1xxdw
	T3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=tcxNQANO4hxAzyZNQZxOP0oEfM4VXOZg11eisOGvhBs=;
	b=ICMhG+w6DcHTpUAAZd6n9H3++eALH/ypTL3X7LcDmkah/t7P5LLvUcu+uEev/H2AJN
	bk4z9JkyIQz+CAX5caRMxmg5j8Zg64pt+rKQZzKKUGLXsCl0panlR3VyqfRJtN5ASXET
	SQE/BLhJu8+/QV6ulNbCkXu47ZqUMkK5Ndq0uLeqB47QTzG7g7/aKyVgPiu5tq0PiEPZ
	Lerf6m0oushBuAmIwD9AUiBAwCBIkJIvLmc6+urSB/mUvTXYVBZ1arILPkEyegR8j0XH
	kDfwoKCjBHs26oSxo92qErqEhLXi993IFZrwXrJ01dERfavBbNrVI+4UQ14I5p0XS7uq
	fOWQ==
X-Gm-Message-State: AG10YOTRVpHxTEUWavdqoydcG0B31hhh44EbJoizhrtKT4pl748DRmWCVZiY/gW8I2/uJA==
X-Received: by 10.28.175.193 with SMTP id y184mr12944522wme.62.1455121563605; 
	Wed, 10 Feb 2016 08:26:03 -0800 (PST)
Received: from localhost (x55b1eae5.dyn.telefonica.de. [85.177.234.229])
	by smtp.gmail.com with ESMTPSA id i2sm3629187wjx.42.2016.02.10.08.26.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 08:26:02 -0800 (PST)
Date: Wed, 10 Feb 2016 17:14:58 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160210161458.GB27824@graute-opti>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: create_image.wic is missing u-boot SPL file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Feb 2016 16:26:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello list,

I observe a problem with the create_image.wic script after second execution of

bitbake fsl-image

NOTE: recipe fsl-image-1.0-r0: task do_rootfs: Started
2016-02-10T03:21:41.323Z: ERROR: Error: The image creation script '/home/dnt/build-imx6ulevk/tmp/work/imx6ulevk-poky-linux-gnueabi/fsl-image/1.0-r0/temp/create_image.wic' returned 1:
2016-02-10T03:21:41.323Z: Error: exec_cmd: du -Lbks /home/dnt/build-imx6ulevk/tmp/deploy/images/imx6ulevk/SPL returned '1' instead of 0
2016-02-10T03:21:41.323Z: Checking basic build environment...
2016-02-10T03:21:41.323Z: Done.
2016-02-10T03:21:41.324Z:
2016-02-10T03:21:41.324Z: Creating image(s)...
2016-02-10T03:21:41.324Z:
2016-02-10T03:21:41.324Z: WARNING: exit code 1 from a shell command.
2016-02-10T03:21:41.324Z:
2016-02-10T03:21:41.324Z: ERROR: Function failed: do_rootfs
2016-02-10T03:21:41.371Z: ERROR: Logfile of failure stored in: /home/dnt/build-imx6ulevk/tmp/work/imx6ulevk-poky-linux-gnueabi/fsl-image/1.0-r0/temp/log.do_rootfs.27900


Somewhere the SPL symbolic link and the SPL files itself are deleted from my
deploy image folder during the wic run.

If i execute

bitbake -c cleansstate  u-boot fsl-image
bitbake u-boot fsl-image

everything works fine, until I run next time bitbake fsl_image again
(without u-boot before)

Some ideas how to fix this?

Best regards,

Oliver

