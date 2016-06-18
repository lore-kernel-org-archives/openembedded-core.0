Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 21D6A60797
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 13:27:02 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id k2so16365756vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to:cc;
	bh=y8NFAQBgCIgq1yrA6CTtsA2q6MRNsCzK1JvnxeiutGo=;
	b=PfWhKVO8o1aS3VyTOkbOg5eIzNt8wJaUZ5xJc9SSoSZKvMZfXOYXNqs3ZzEYFrDvgr
	uEZOcWcN8Pnf2vuqJ8jLMSEXyykG4o7J0SEen+AXtu6PH6wOO2zEINei4TkGbI3/40Ur
	eb2n0GQ4cECok9fGhkKJhXSaULb+Dtc6XmQBhe2JGcZ2AOczpCnoQWWfS4jJuuLRrHnJ
	Oc4aL+r+w/8HtJ7eIOzA9l433Nk9EPNZAWrVzFmz5tcAFr8/7vqaqxr7TYaTxsRAhJtX
	z5tI9eigL/KUYjaYR3P2nbVM5h/ZX+ExGHVBNt+gE5Z96VpUbLbdw6Z41Q+i0L2uc70l
	jngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc;
	bh=y8NFAQBgCIgq1yrA6CTtsA2q6MRNsCzK1JvnxeiutGo=;
	b=byfp8hG240NAkNAwyjHEYL9UD0p6mWmMSSoLrbi3J01eEEoIyvr75sWZ75WLUiK62k
	mCDo/cuuPLnMVsxxlhcRSYnt/Lfy5YY3sB4PJDssFIQz5iQJCxBpTnRVuJPZf7FiGW6x
	YP3Ybfzeqfv8TpQySxTEOdgLyNEgV6WfyakbfqJWfDi4fCb3rXfd+uvh95fGhOiriAc5
	WJCTBaHyzlbwtcpIXrWAfXG2lZlZW7uolo3sqtupO+TPdev10eWG75A7v32/k//dzlLP
	LMxsaYjJrXLtbASQKoG/34ssvpuol3IVJpIVciaN6yhR1Pqj2agbVNLm4FKWMr59oHSW
	a6EA==
X-Gm-Message-State: ALyK8tIHRbatOUR7TSw8HxHLerwTKBergBdxJBksAVsUBnnK7xQuELkwJZL8jhg8xTQBfA==
X-Received: by 10.159.32.67 with SMTP id 61mr3150852uam.39.1466256422682;
	Sat, 18 Jun 2016 06:27:02 -0700 (PDT)
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com.
	[209.85.213.51])
	by smtp.gmail.com with ESMTPSA id z74sm7797137vkd.9.2016.06.18.06.27.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jun 2016 06:27:01 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f51.google.com with SMTP id d185so147958065vkg.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 06:27:01 -0700 (PDT)
X-Received: by 10.31.139.139 with SMTP id n133mr3330819vkd.71.1466256420826;
	Sat, 18 Jun 2016 06:27:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Sat, 18 Jun 2016 06:27:00 -0700 (PDT)
Date: Sat, 18 Jun 2016 10:27:00 -0300
X-Gmail-Original-Message-ID: <CAP9ODKorODqhm-Pqe4L_m4RpTvPmW++yNngL_pAUxvFHHa7XTg@mail.gmail.com>
Message-ID: <CAP9ODKorODqhm-Pqe4L_m4RpTvPmW++yNngL_pAUxvFHHa7XTg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [for-krogoth] Backport for libc != glibc
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
X-List-Received-Date: Sat, 18 Jun 2016 13:27:05 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

At O.S. Systems we are involved in some projects which uses musl as
libC. For those, we are doing the SDK for faster development and found
that it is currently broken on Krogoth.

Master branch has the need fixes. The fixes needed are
OE-Core:2b9ae0ab and OE-Core:fcaaabb4

commit 2b9ae0ab056e62290f2328aa0d4dd70e6f138759
Author: Khem Raj <raj.khem@gmail.com>
Date:   Wed May 11 10:35:40 2016 -0700

    musl: Create symlinks for stub libraries

    Some libraries e.g. libm.so are needed to be
    created so that SDKs built with distros which
    disable static librararies can have the stubs
    and since default linker script requires -lm
    this helps in compiling applications with SDK

    there are .a equivalents for these libraries
    but they do not land in SDKs when static libs
    are disabled distrowide

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit fcaaabb401fffcda4db9a7d1f927a2a404e4776d
Author: Khem Raj <raj.khem@gmail.com>
Date:   Wed May 11 10:35:45 2016 -0700

   gcc-runtime, libgcc: Symlink c++ header and startup files in
target_triplet for SDK use

   We build SDKs such that gcc-cross-candian is built for only one
   target *-*-linux and then use -muclibc or -mmusl to let it compile
   code for other libc variants. This works fine when libc = glibc
   however it does not work for c++ programs when libc != glibc since
   there are c++ headers installed under ${includedir}/c++/${BINV}/${TARGET_SYS}
   which is fine when gcc-runtime and gcc-cross-candian uses same
--target options
   gxx includedir searches in right triplet, but it fails with musl/uclibc
   since gcc will look for glibc based triplet but gcc-runtime will install
   them under musl/uclibc triplet.

   This patch symlinks the musl/uclibc triplet to glibc triplet when
libc != glibc

   This fixes SDKs for musl/uclibc

   Signed-off-by: Khem Raj <raj.khem@gmail.com>
   Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backporting those, on top of current Krogoth branch, fixes the SDK
issues we had at the moment.

Could those be reviewed and queued for the next backport?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

