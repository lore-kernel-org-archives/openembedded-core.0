Return-Path: <andre.draszik@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5D7719B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 09:04:00 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id ey1so1135979wjd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 01:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JnaVtRt7dL/bkB26KYBGGpehWGRHslprV/qAuzcpRGQ=;
	b=tTPzP3ilS4mMzC7v+si0LFMpYIsupXXGcPmE2eJP56shfUkMm0Gp8hBveo931RTx0+
	AIc3C4CJ72nh13tAODVltz5r1kNNo9L7YtyKMI8YbNMl+YQOUPxd9wdKEszsqN8mn23g
	xe7M468Rc1JWgOIVt5ZEb/gpJUt5jKRNwvbq2mJyi4cNe2q4r4yb3v18UsZnto4HA53s
	skQHZIA7GeiLFBxuYxHmO4oNbOdJX0V1vtajRViWn7UcpRt4j6CVVUbjQvnkDy1kt4al
	ckBKavzBas4tM1KWhjpIr3woVDZhWGOwPqX2tEGZOG/1Gxrn5D1KctZwJ4Ehqb7JmAYq
	G0Qw==
X-Gm-Message-State: AIkVDXKZuQj8aSer67xkZZ6/0VTYbpB2nCJ5vD1aWFM+7umJxnvt0nA+FS3IwOFJmTdXwA==
X-Received: by 10.194.20.132 with SMTP id n4mr424635wje.180.1484211841090;
	Thu, 12 Jan 2017 01:04:01 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m10sm12482624wjg.45.2017.01.12.01.03.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 Jan 2017 01:04:00 -0800 (PST)
Message-ID: <1484211839.7594.16.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Thu, 12 Jan 2017 09:03:59 +0000
In-Reply-To: <1484167889-3198-1-git-send-email-anibal.limon@linux.intel.com>
References: <1484167889-3198-1-git-send-email-anibal.limon@linux.intel.com>
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
X-List-Received-Date: Thu, 12 Jan 2017 09:04:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Wed, 2017-01-11 at 14:51 -0600, Aníbal Limón wrote:
> Testing:
> 
> It was test running testimage over core-image-{minimal, sato} in
> qemu{x86,arm,ppc,mips} archs.
> 
> Also the qemu unit test (ptest) was run in the target and all test
> pass except a previous failing one:
> 
> ERROR:/usr/src/debug/qemu/2.7.0-r1/qemu-2.7.0/tests/test-qht-
> par.c:20:test_qht:
> assertion failed (rc == 0): (32512 == 0)
> 
> Rebased patches:
> 
> - exclude-some-arm-EABI-obsolete-syscalls.patc
> 
> Removed patches (already in upstream):
> 
> - 0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch
> - 0002-fix-CVE-2016-7423.patch
> - 0003-fix-CVE-2016-7908.patch
> - 0004-fix-CVE-2016-7909.patch
> 
> Changelog,
> 
> http://wiki.qemu.org/ChangeLog/2.8

The patch 0001-target-mips-add-24KEc-CPU-definition.patch should also be
removed, as it's been merged.

Cheers,
Andre'


