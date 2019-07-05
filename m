Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8096F7DD6E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 16:14:07 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id m24so10714009ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9wNowVef9njN3Ui/Q6BgYUiXdCQ7ga/Hcnq+KWBc3js=;
	b=mbT3dgruwzwKSPRSJoWPMp8trgFOz6hZVja7g+8TNeykJU9hDKwn+KyfAnfsOldDao
	QhJYh1QjhglXcYRDcQehsp/v1KXyFwDkPfkBp/+UnQDt6HcPffeugyeYWYM50TbBTAlY
	/DRyVf/LRt8SPkFJxPvvXw496vNcYkf4Ebbu5xXm4cceAfL08urAYCr33656Cb0x+dIy
	IIFaLSA47lQ4xFRNTFQMNNQLgu2vnAUVjhvwotoEzPo4Id2WOR6Of5DTRGo+5zm9fryA
	/ENMnn1KJBMSbGTAsqbqW/rimgxG1277YWypmIlytJh6ivQl3KmuPpVqO2jl0iKdWoUi
	nfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9wNowVef9njN3Ui/Q6BgYUiXdCQ7ga/Hcnq+KWBc3js=;
	b=CiADxRooG1xZZYTnNj0h4o8uf3cCTE7vdXlhNaJfFBNQxjE3VaSOn5OwK9AeH12SSm
	RF8b4vDNEc+16dsxVSd44KujavukVlL0hWZy0ptCvPjfiC7fa/SrdwBDE3KYN5BoqZZG
	soysADvVPMJWKye7dk9XQRzt1ukk2rSk1RcUD5bvws5xmwT0hZ6hLi4ekv9uuLp1CRy1
	//E6B9XgOrC2I96ZIz7dW1T4AHNnP2ubNGPa2qAWBvl911E5mjWYjQzMvxmX4sspVCXn
	X5AnRj6wOLGBZR5UsRW5JdtKyY/0/Rimj0RUtt6SOdEgumtq3qOzpJrmaOs+A2XgB4VY
	qzxA==
X-Gm-Message-State: APjAAAVVBS/wA20p6lM8fK5eVM9PjxHsb5LaoGLrxcSZ8BUGcsoTJZhE
	lWfhBSzGgkTRGQAsvVdtKXSeyuDLpCk=
X-Google-Smtp-Source: APXvYqwk1wP3hn5BcV2oS2eCLr0BFt4oEsTTWE9252Hx1BBn2czrdpGhbpFDg1Nzvk7IR+XuBbn4bA==
X-Received: by 2002:a6b:4f14:: with SMTP id d20mr4788729iob.219.1562343248206; 
	Fri, 05 Jul 2019 09:14:08 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	m10sm1871386ioj.75.2019.07.05.09.14.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 09:14:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  5 Jul 2019 12:14:02 -0400
Message-Id: <cover.1562342843.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 05 Jul 2019 16:14:07 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here's the next round of updates I've been testing. The 4.19 update is pretty
standard, and is both a -stable and -rt refresh. Boot testing shows no issues
on either kernel type.

We also have a configuration tweak to allow the beaglebone reference to be
booted in qemu directly.

Finally, there's a packaging change .. which I normally don't have in these
requests, but it is an underpinning change for some future kernel features
and updates that I'd like to get out separately. The problem was found while
moving postinsts into both kernel.bbclass and kernel-devsrc.bbclass, and
without it, you can't assemble a rootfs for packages that are using PKG_
constructs. The details are in the commit log of the patch.

The change has been working here (and at Xilinx) for a couple of months now,
so it shouldn't have any drastic side effects. There *may* be other places
that this is required, but I kept to the code paths I could test.

Cheers,

Bruce

The following changes since commit 4fd9ee4670293632cc0ca1e64b8833eb6014435d:

  bitbake: bitbake: Add --skip-setscene option (2019-07-03 17:00:57 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto: bsp/beaglebone: support qemu -machine virt
  linux-yocto/4.19: update to 4.19.57 and -rt22
  package: check PKG_ variables before executing ontarget postinst

 meta/classes/package.bbclass                  |  6 +++++-
 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-rt_5.0.bb               |  2 +-
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 .../linux/linux-yocto-tiny_5.0.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  |  2 +-
 7 files changed, 25 insertions(+), 21 deletions(-)

-- 
2.19.1


