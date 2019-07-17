Return-Path: <wbourque@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id C3A937ED59
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 21:31:31 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id r21so20629772otq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 14:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/tc9CRx2i9QE0Xw3UqMYmO/r04LqxedPJ9CeAyb3C0Y=;
	b=O9swD5u2QXZzwlfu7emgHv+xdtVcZ3ytdI9iAJmc5V8LkpkCpIXIwn5Jko5058wqJH
	TLKG0ur2/4wAgcsG88eY/+oVkQcsDBI7jlLYrc0byjfkVfbYfqKpF4vUR6mou0p48nv5
	xKZoAU8ZDkJTPbXSCEyyLMgP6keUfgyFdW/EzcytexdLKyDx3MW6Rkt7ipMf3Ly7hm26
	cv3UnnXINULcKamrzGhIo4AOdDLJn5W+UIwGniwjSKGBfmUXBu/VixyjEsKMhmaUdqwu
	THEWlb+tPbLKJ9euOKp2U5GA3Do0ESukeQTOl201KWiKVMUI2R47C86CW6NGLDPoN3Jy
	od/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/tc9CRx2i9QE0Xw3UqMYmO/r04LqxedPJ9CeAyb3C0Y=;
	b=RE99WcVjtXsMMZUQQbkypjEbHv3hgDNNOO0dKE4ThyvAG12DEEUt1pbgwobNidUWX+
	8zQVrUynSWCHA/nRrLd3VVz+sfPTx1Yh/IB6w9/Pp9MvNXhWJiWtqOMVnuMMgyvwJ+hu
	YskfY8y58zOO+grw1PQaVZViN+88/S9CDj/IyKUgarWnvFfE1B9236c2GgshRHNJVe9M
	g2kxmuS3zoeAgzPLaLNUHfO2LJQIRD4bBFxTFjZI7VjBKeabblqtW3MeLhVazm0HHSWl
	/3siUlVWRYihZ6Gh+1JcVcjS9Ae+kdsnnpjEMnRPYU1Pa6qT+oDRt9dfTcfyYthv+jO9
	lHfg==
X-Gm-Message-State: APjAAAXDOVu/MP2kbdDrs30iX2C0DjSZr4043pm21/mDsP+FcuVzCkeQ
	kc6jU8n8KnBhuAh15Edo+aM3Qrtbsb/rxxkr5pCuRG7i
X-Google-Smtp-Source: APXvYqx+2xOnmIfh+l2eUBK06tLPTvPWqcGXuegRCSrObowmsbwtT4MaP58RL4fnHa+n6VMC8ZqqWo0K4bGAMNxMbVc=
X-Received: by 2002:a9d:3e4e:: with SMTP id h14mr30590059otg.182.1563399092603;
	Wed, 17 Jul 2019 14:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190712140020.28280-1-wbourque@gmail.com>
	<b60f393b0bddab4623d22627d2c83b33774c4565.camel@linuxfoundation.org>
In-Reply-To: <b60f393b0bddab4623d22627d2c83b33774c4565.camel@linuxfoundation.org>
From: William Bourque <wbourque@gmail.com>
Date: Wed, 17 Jul 2019 17:31:20 -0400
Message-ID: <CANBSh+Np-BfUJBwJDMDNRV_5-Ck3ikfZ79iQ_AE8EZnmK7OrTw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] wic/plugins: Source that support both EFI and BIOS
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
X-List-Received-Date: Wed, 17 Jul 2019 21:31:31 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry about the failure. I'm trying to figure out what's wrong; the
output of the autobuilder is quite puzzling.

For test_biosplusefi_plugin_qemu, at line 1303
(https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/290/steps/7/logs/step2d)
:
It seems that for some reason my command was truncated ("sk -l
/dev/sda" of "fdisk -l /dev/sda" as in the code).

For test_biosplusefi_plugin, line 1287,
(https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/290/steps/7/logs/step2d):
If I read the output right, the test fails on "Couldn't find correct
bootimg_dir"... which is unexpected since it's not something I'm using
in the test itself.


That said, I'm having a real hard time running the tests here and
getting the same result as the autobuilder.
Out of the box, all the *_qemu tests are failing on my setup. I was
able to get them running after debugging oeqa selftest classes : for
some reasons, qemu does not seems to like having multiple "-serial"
passed as arguments; only the first one is considered. I had to patch
the code locally to get the tests to run.

I suspect there might be difference between my host machine compared
to autobuilder, but I couldn't find information about what's the
"right" setup.

Is there a HOWTO or some documentation I can follow to make sure my
own setup is comparable to autobuilder?
Otherwise I fear I won't be able to get the same results as I see in
the reports.

- William

