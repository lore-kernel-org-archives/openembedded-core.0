Return-Path: <elvis.dowson@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id CDF596BD57
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:50:37 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so80588eak.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 01:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:from:subject:date:to;
	bh=zR0efotTydFV08ojZLZjqjfJR8vQdo9k4U3T2oB+3+4=;
	b=DqWPLcYlutnu6U7dgxENdl7bnMCx9RHv/ZKaUkaRrSkESz8CbU9mlKaVMMnboVS+3p
	IsMNXJKNItptGhyr1HVlvRQVPWQBDvJyCJkyS/D/q7L4j0i8ZuHl6QuJ0M5x3q5rWpHy
	oZtG8o6qRZipEWmpWMXif8susgVj9UEKgz5dX8Ql6h1luMqGmqma/TiwAsW6nQFnTWXm
	OBtrxJGqUzI6yYns/wBMVKo3cB5bRgRnQsA79a34MbkECCPFxIhIT38WwKUka/mZ0Rre
	Rw/sH5t68wkgrOXjh6n+rg6YDn4ze62mH2VtjGgIY0vkv4vjY3lWObhPiwMuODMl0QVm
	a6cQ==
X-Received: by 10.15.41.77 with SMTP id r53mr2440168eev.64.1377766237559;
	Thu, 29 Aug 2013 01:50:37 -0700 (PDT)
Received: from [37.245.174.246] ([37.245.174.246])
	by mx.google.com with ESMTPSA id a1sm44174012eem.1.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 01:50:36 -0700 (PDT)
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
	<521AD896.3000503@windriver.com>
	<6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
	<521BA7CB.7070206@windriver.com>
	<2D33FB6A-9F7F-4E8E-8B1A-CED1D571A82C@gmail.com>
	<521D0622.6090802@windriver.com>
	<2AC87191-8D2B-4972-A249-2043B68A0A7B@gmail.com>
	<521E7D2E.6060404@windriver.com>
	<E66BA9BD-07D4-4A90-BFB9-0908608FBD07@gmail.com>
	<A3529AF4-7650-4866-A83B-5D948D733723@gmail.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <A3529AF4-7650-4866-A83B-5D948D733723@gmail.com>
Message-Id: <6A28979E-6351-4F22-B118-8987B099613B@gmail.com>
X-Mailer: iPhone Mail (11A4449d)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Thu, 29 Aug 2013 12:50:21 +0400
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 08:50:38 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

>> also take a look at meta-linaro, they test armv7+ qemu regularly.

I built core-image-minimal using meta-linaro, using genericarmv7 machine but=
 it just generates an Image file for the kernel and a tar.gz rootfs. It does=
n't look like its useful out of the box for a QEMU image. Additionally you h=
ave to do something extra for the image to be usable for a beagle QEMU machi=
ne, related to x-load and u-boot, to get it to work.

Are you aware of the extract steps? Most of the docs I've seen use pre built=
 sd card images.

Best regards,

Elvis=

