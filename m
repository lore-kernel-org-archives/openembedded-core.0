Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7769D7F3FF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 01:14:31 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id b136so29522050iof.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 18:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=yglhmLnSIG43lXeq50ZNQsGZf3nxnGaxSBed9sA0Jug=;
	b=WTHkgj9HtdE6bau1gTtWkCxBpBfOLpRy+J7Wma/4+EsSZtF5y5XAVz6oQ3LZaQURdo
	DgS4s5MubiIblKNG8mjJIIkBAKrPNIA3DbQtgIKayMSBlv5vNlFM65QMTN/gDJ3EQ5D3
	Vp5k+0irqJLBjOFrT518NIR1cUMqexqEo1LsUAYJTaMb3P+IadL2anzVNEAsp0Oign/d
	xX+mTDqKdl+H2G4N128/p4af+tKTm6+4mchol3bgoLydf2GlYa8YBUkODpLQCnx0xuM9
	tKwbUMJPPeJgVMtYt0p5oyANup5BD5bSd9TjROZG/+KjJ0dMAZbR0v5WHpxLoHgHVqk+
	XiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yglhmLnSIG43lXeq50ZNQsGZf3nxnGaxSBed9sA0Jug=;
	b=f2nsQgl2FyVhQT9w75j7yblpzBWqdSuEOfyeq/GjFNFQiI5RHwAlz+jK0HRns//bto
	mPzRMK3dNXZV+pk00UwTEN8Ax67MjseodKQjS8aST5XRlMVJkfuoNXLOt1MUMvXQQnhQ
	mvy3kzLZ3Wp0UHQCJkdpIDftZBYOkAMDjwxYYkBMF0hZTxFcEBillEgH9RI+mWiv0b4H
	BtrVE9c3RYy9xHo5XYafAt1Q6V40TZS9FYHBL+itFeDPtWJWXai6lIsVfI7PT4Mh8na+
	VrJnMxX8bAYCUKjR29MyV/7YjEiu00S/nz5pyfvzsD2RcWOczd4k+Qwo0BRhxMnJ0PsH
	jbyA==
X-Gm-Message-State: APjAAAVFY0nRdrTuMgAauZlrGB1R6P1tCrk1+j4MRUBmJ9asGQYX966F
	Yyn3oGSTmwsCR4SYGOVfCJrT9sctbwsEWaygWRwt3B9I
X-Google-Smtp-Source: APXvYqz/d9/e1wod/ZGtYnffAxG6L8d7BBvM29lhAjkTcN6Ndwohi/yxppsLGptWuUuaeKYW4ZAGM+1DXRaUAVc5G3g=
X-Received: by 2002:a6b:5404:: with SMTP id i4mr18048796iob.204.1570929272180; 
	Sat, 12 Oct 2019 18:14:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Sat, 12 Oct 2019 18:14:31
	-0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Sun, 13 Oct 2019 12:14:31 +1100
Message-ID: <CAA=hcWSN3s3YGNrods9t2bRsAbwVf1x1fRXDofVgjtr-BK29Bg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Failed to build zImage-initramfs
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
X-List-Received-Date: Sun, 13 Oct 2019 01:14:31 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Apologize if it is not right mailing list for helps, please advise
which mailing list I should go.

I have been trying to build zImage-initramfs, according to the
oe-core/meta/classes/kernel.bbclass, I defined following variables in
local.conf:

INITRAMFS_IMAGE = "zImage-initramfs"
INITRAMFS_IMAGE_NAME = "zImage-initramfs"
INITRAMFS_IMAGE_BUNDLE = "1"
IMAGE_INSTALL_append = "zImage-initramfs"

But I had following errors:

ERROR: Nothing RPROVIDES 'zImage-initramfs' (but
/build/Ramdisk/oe-core/../meta-solar/recipes-core/images/ram-image.bb
RDEPENDS on or otherwise requires it)

NOTE: Runtime target 'zImage-initramfs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['zImage-initramfs']

ERROR: Required build target 'solar-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['ram-image', 'zImage-initramfs']

In my ram-image.bb:

inherit core-image

IMAGE_ROOTFS_SIZE = "100000"
IMAGE_FSTYPES += " ${INITRAMFS_FSTYPES} cpio.gz tar.gz"
PACKAGE_INSTALL = "${IMAGE_INSTALL}"

What I am missing for "Nothing RPROVIDES" error?

Thank you.

Kind regards,

- jh

