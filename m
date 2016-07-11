Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3B58873185
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:41:34 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id v6so141376794vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to:cc;
	bh=BBiMUJNyDxgX1/aws45Og2hIC0OinNHRwCo0mH6DRxs=;
	b=kM3uRDF/T6CjZEhPvzG2hc+CGF0W9dNiorWSHhFl26+YX9yI4OC6waIUzDtX834Q4W
	gRCnyq5WpYSmIoffKrEN38KYjuf32S/9uSE5zVSaY324wezZi6yVLMOcLmMhw5Qa/8+l
	Am+fLU4ZtWuIG2dCC5pEMhFYlQTGMzLOlR17lBiegWOFLvk18erII4m480zdaKDELRyW
	veFMyCUKwXJBlm6LSrQMXLgbyAG0BE0pFwIoTxyA0yCv22QZyj+R9OE/QWew9vZ8/fyJ
	Pk7ygB51BILxhGggUoNYsruPUbQyNS1l/Q//FZN21t2lBrZaBznaXVBWS2egPNrYmQct
	9xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc;
	bh=BBiMUJNyDxgX1/aws45Og2hIC0OinNHRwCo0mH6DRxs=;
	b=L9Xo7a94EfB0S9r/pQjyMTzGXbA5D+HWW5Qv9Ar9mvgfziTUegx3Mh5smnxhW9DVSC
	bNfWy/YB3mQMt/vFXmamO4IECBw5vxQ7M0nRTZmnjemyGfQA0AXVE1mWxcIvaYIsHTuV
	bcshjGDVG654IoAvNnFdghg77s7jht/VDX37RGjqd0gnNSKfHt5gZ5RDHxbrB5Wz67TZ
	rDin1qXOBE9buNhL9vjdPMQ1V4n7kpOHWCR5YHkz3PuJtgtmF6V5kf7l1UnJuKsckYys
	b1dZDAKSmVlQbptZYYoXxD7473vUIZCHSNpLAM8HP5OHs3roshkmVdCnOD8tg3vccVeK
	wbsw==
X-Gm-Message-State: ALyK8tI7wge54sPS/d21gd6uSnO3+6dqKavm0HStxwAUltmKJjeeShcTlw28cffpR5pZpg==
X-Received: by 10.176.0.39 with SMTP id 36mr7596167uai.137.1468248095135;
	Mon, 11 Jul 2016 07:41:35 -0700 (PDT)
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com.
	[209.85.213.54])
	by smtp.gmail.com with ESMTPSA id 92sm2137065uay.26.2016.07.11.07.41.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 07:41:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f54.google.com with SMTP id o63so58493337vkg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 07:41:33 -0700 (PDT)
X-Received: by 10.176.1.106 with SMTP id 97mr6017482uak.154.1468248092640;
	Mon, 11 Jul 2016 07:41:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Mon, 11 Jul 2016 07:41:32 -0700 (PDT)
Date: Mon, 11 Jul 2016 11:41:32 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp17vE1xOJiePAq6d3poMvCkkK-BCdf4_m6yAUXgsWsPw@mail.gmail.com>
Message-ID: <CAP9ODKp17vE1xOJiePAq6d3poMvCkkK-BCdf4_m6yAUXgsWsPw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [for-krogoth] Backport of new libarchive release
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
X-List-Received-Date: Mon, 11 Jul 2016 14:41:35 -0000
Content-Type: text/plain; charset=UTF-8

Hello Armin and OE-Core fellows,

The libarchive 3.2.1 fixes several bugs and security related issues so
it seems like a good candidate for backport. I list below the commits
I did in our local fork while testing it:

commit 95e2a448d857659935ecd4762faea851151d1bce (HEAD -> for-krogoth)
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Tue Jun 28 11:06:13 2016 +0300

    libarchive: update to 3.2.1

    Drop merged 0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    (cherry picked from commit 4d65a93d3e705cfb9b4cfe102e9d0cabaffe7a52)

commit 088ad58922bd6af83a17c3c0a9ae3b78564e798d
Author: Maxin B. John <maxin.john@intel.com>
Date:   Mon Jun 6 00:12:03 2016 +0300

    libarchive: respect disable-acl configuration option

    Update configure.ac to properly handle --disable-acl option

    [YOCTO #9668]

    Signed-off-by: Maxin B. John <maxin.john@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
    (cherry picked from commit 84fe3f29f2bdaf98c9beefdfede143084fba093b)

commit 71a550d24e1098e34e35da68335d83f893afe169
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sat Jun 4 09:04:26 2016 +0100

    libarchive: Add PACKAGECONFIG for lz4 to ensure determinism

    This avoids:

    WARNING: opkg-1_0.3.1-r0 do_package_qa: QA Issue: libopkg rdepends
on lz4, but it isn't a build dependency, missing lz4 in DEPENDS or
PACKAGECONFIG? [build-deps]

    and ERROR:

    build-appliance-image-15.0.0-r0 do_rootfs: Unable to install
packages. Command
'/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/sysroots/x86_64-linux/usr/bin/smart
--log-level=warning
--data-dir=/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0.0-r0/rootfs/var/lib/smart
install -y packagegroup-core-boot@qemux86_64
packagegroup-core-ssh-openssh@all psplash@core2_64
kernel-dev@qemux86_64 packagegroup-core-x11-base@all
kernel-devsrc@qemux86_64 smartpm@core2_64 packagegroup-self-hosted@all
rpm@core2_64 locale-base-en-us@core2_64 locale-base-en-gb@core2_64'
returned 1:
    Loading cache...
    Updating cache...
######################################## [100%]

    Computing transaction...error: Can't install
libopkg1-1:0.3.1-r0.0@core2_64: no package provides lz4 >=
131+git0+d86dc9167

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
    (cherry picked from commit f12fe90a78ca1239691e8fd8f7b06ce59b8b72cc)

commit afc19399bfe4e5dfff5243ed14ab806c78c092bb
Author: Paul Barker <paul@paulbarker.me.uk>
Date:   Sat May 28 14:26:15 2016 +0100

    libarchive: Upgrade to v3.2.0

    All patches are removed as they are no longer needed. Most were
merged into this
    release of libarchive. "0001-Set-xattrs-after-setting-times.patch"
was dropped
    upstream after discussion, see
https://github.com/libarchive/libarchive/pull/664.

    The COPYING file in libarchive had a couple of minor changes to
clarify which
    files are under which copyrights but the overall license is unaffected.

    Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
    (cherry picked from commit 4976382011106b9515e44359f2f6bb1d0c69fdb3)

Please consider those for next krogoth pull request.

Thanks in advance,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

