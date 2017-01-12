Return-Path: <andre.draszik@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD5471ADA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 09:11:38 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id kp2so1170577wjc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 01:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=d1zDjVfM2adf+xlTgYExURYIF8QDE3imt5LjBjqfzjg=;
	b=uExifAHjbWDaa9JGMotuPXV/kxRXD2cL3zhTEvBf4fvvdW5py0nmlOL914oPjXLfCW
	GrlHQhsGaHW6D21YDs25/rAhXUTtw67+AohzpWRBFn+MreRvwdVeSYg+DNdfH5DBWzoM
	jHtrWwACRJx6hC4ZiJeO64/tvHsdk8AQsL/pfaQY8ZkC+sgMifdGmAWrcmME/0jmp6Tx
	WL9t8s0OtInf9nHcBLO9IM2zMUlNcOkjthuiTN77ykExaBOvGQ6ap5LFFnfD8abmo42C
	DTTnqgMZEzu5O6l7bcJVN3Nr1gH0JwVH73bv3t7/0KpEcFe3pAvTTjBV/0mjKaCCwmSh
	x9hQ==
X-Gm-Message-State: AIkVDXLI/2+ZRPKf0AdhWt5nSPp1cjo0qkRJ2A2UBO++/sXq8pGys1MzKAV9snBvo2JfVw==
X-Received: by 10.194.124.162 with SMTP id mj2mr7712039wjb.111.1484212298425; 
	Thu, 12 Jan 2017 01:11:38 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 204sm2106634wmj.7.2017.01.12.01.11.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 Jan 2017 01:11:37 -0800 (PST)
Message-ID: <1484212295.7594.18.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Thu, 12 Jan 2017 09:11:35 +0000
In-Reply-To: <1484211839.7594.16.camel@andred.net>
References: <1484167889-3198-1-git-send-email-anibal.limon@linux.intel.com>
	<1484211839.7594.16.camel@andred.net>
X-Mailer: Evolution 3.22.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Thu, 12 Jan 2017 09:11:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-01-12 at 09:03 +0000, André Draszik wrote:
> Hi,
> 
> On Wed, 2017-01-11 at 14:51 -0600, Aníbal Limón wrote:
> > Testing:
> > 
> > It was test running testimage over core-image-{minimal, sato} in
> > qemu{x86,arm,ppc,mips} archs.
> > 
> > Also the qemu unit test (ptest) was run in the target and all test
> > pass except a previous failing one:
> > 
> > ERROR:/usr/src/debug/qemu/2.7.0-r1/qemu-2.7.0/tests/test-qht-
> > par.c:20:test_qht:
> > assertion failed (rc == 0): (32512 == 0)
> > 
> > Rebased patches:
> > 
> > - exclude-some-arm-EABI-obsolete-syscalls.patc
> > 
> > Removed patches (already in upstream):
> > 
> > - 0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
> > - 0002-fix-CVE-2016-7423.patch
> > - 0003-fix-CVE-2016-7908.patch
> > - 0004-fix-CVE-2016-7909.patch
> > 
> > Changelog,
> > 
> > http://wiki.qemu.org/ChangeLog/2.8
> 
> The patch 0001-target-mips-add-24KEc-CPU-definition.patch should also be
> removed, as it's been merged.

It looks like Qemu-Arm-versatilepb-Add-memory-size-checking.patch can also
be removed.

A.


