Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EBFD5731AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 07:21:37 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b14so8944267wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 23:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=e53oQcsQ5rN3whQZNP8Aop7kmRYSqa23Myf87BQ2S+4=;
	b=q6TGBQ0tUvqadL2BcrIA9f/kvakhj7aWxe/CyxO+G1auyST+OOrwD6YTpVKHYFD1tr
	uIPhN9f3hhcMWdfS8ImA2+UlC3ZUiDqmmLINDMaDf3RXVoff03im90buBRCm7VrqA4ra
	bEm0I0WhQpJX5s+Qb4kW3310sd1M2uKXp21qejxFULNlI+Zrh4EGAJMNBMGSFSBslp6r
	K2jSTJdsL79IHqq2vE+BQsmEgswFcm1sMGWfU7GytHRNVJzTZPYbPHDFLkUOAn4zAz2C
	9gSeOYWli9ff4nxd/r3Q55rAi8ZoRBO2FP9A/EyWi37fhvMw0Co0xGcVoojcbPwxuX59
	scXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=e53oQcsQ5rN3whQZNP8Aop7kmRYSqa23Myf87BQ2S+4=;
	b=MZUxglwCmmg1zjF2Y65+8NiH3NQsDYqM5To42MpOZiUwOWvA2pSgaLXDTpEZYPLDDa
	hhvXBkL1x/zzvph8WsCH5aUy3vYyvA70Qj4Crs3lJbLOg3VjecTNr90TAMrar9FNzQ3m
	1w25ACm4DCwXqhqhjNV0bwA2bVof1tKHoaAr/FjdtIeZFs1E5XpaO7k74+DuUqMt0TlR
	yaooDKuv8Q0Kd/cHSoJ15qeviMC2KWqHuiqVVcjfW//Zo+2eQ0X3hHyuaCpO8rdLqSQD
	vstq748vpUSpHVDE8/8/TTwv/KGBjTjDpbDR+tG6bD10aboOJA3c6rsjOcUndXyiygcy
	5lXg==
X-Gm-Message-State: AG10YOSIzgaNPUuyKnzicpJAKxxj8r3KajEomMNvMEgXhqnTyF2pEbWPNrycXmwGqAFoZw==
X-Received: by 10.28.97.135 with SMTP id v129mr8545658wmb.78.1453360898009;
	Wed, 20 Jan 2016 23:21:38 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	193sm28407313wmg.16.2016.01.20.23.21.36
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 23:21:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3117\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2f2bda63c8a7f435e76c5d4ea1c5c529847f7f65.1452823464.git.liezhi.yang@windriver.com>
Date: Thu, 21 Jan 2016 08:21:35 +0100
Message-Id: <CEE6CE79-B5BE-404E-98C8-9BAA6AC73F57@dominion.thruhere.net>
References: <cover.1452823464.git.liezhi.yang@windriver.com>
	<2f2bda63c8a7f435e76c5d4ea1c5c529847f7f65.1452823464.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.3117)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] e2fsprogs: 1.42.9 -> 1.43-WIP
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
X-List-Received-Date: Thu, 21 Jan 2016 07:21:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 15 jan. 2016, om 03:05 heeft Robert Yang =
<liezhi.yang@windriver.com> het volgende geschreven:
>=20
> Upgrade to 1.43-WIP to make "mke2fs -d" support xattr, so that the =
layer
> which requires xattr such as meta-selinux can populate images easily.
>=20
>=20
> * Add --enable-libblkid to EXTRA_OECONF since libblkid is not created =
by
>  default.

*ahem*

commit fb8e776ea91c39d586b46400ad30aeea8dead1c4
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sat Aug 25 16:45:33 2012 +0100

    e2fsprogs: Fully remove/disable blkid

    We've removed libblkid from e2fsprogs as it was being provided by =
util-linux. The blkid
    binary is also provided there and providing it within e2fsprogs too, =
linked against
    a different and potentially incompatible library we're likely asking =
for trouble.

    It also leads to inconsistencies in the native sysroot since we =
don't consistently
    get one given provider of blkid (but always the liblibid from =
util-linux).

    To clean this up, fully remove/disable the blkid binary and package.

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

And the do_install in the recipe:

        # We use blkid from util-linux now so remove from here
        rm -f ${D}${base_libdir}/libblkid*
        rm -rf ${D}${includedir}/blkid
        rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
        rm -f ${D}${base_sbindir}/blkid
        rm -f ${D}${base_sbindir}/fsck
        rm -f ${D}${base_sbindir}/findfs



