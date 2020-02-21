Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3466176A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:45:35 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id w21so1707829pgl.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 14:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SZyH0XNq6AtUb3T5uQmjTzmvhs7X1IVEnESgkvBrLfo=;
	b=K0Bz9qx6TUH+BMEFIImU74fkq5j777iPtswkGEaYrhB0sBk7U3z3X+J9k3MFvzoucj
	1/sQHDGy0gAWvzU9R0peLF1K7VMJi7sRii1YAU5DI5jN/W72ZG7seTV/kaywc9uFzFB6
	dEW0hPMDauVX4on8EDGjsZaj6gZbwG2aAgjLOXaj5likvrvIZa3S/TrzNGsKwQ81LmJY
	gPIDIkIgDHRz2VQ/SGzja0mT9RRW5/oOrxQ+4U7RBvskZExieCWZPkzSSEVBGgXr7rq4
	3oauN2hC6nAEE60Xetp2CipLEh8H0B9nc4DivV97rZ0z4iO5jxelDq0ZrkElGC+m6GH+
	vrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SZyH0XNq6AtUb3T5uQmjTzmvhs7X1IVEnESgkvBrLfo=;
	b=ndl4MPamJj5lyx8QMc7ntCaLBdoIiYTBYiH2YR385BPrALripkX6+qlH4PgsqE7Xxg
	KmvtunqxpfQdbwJsrakdnM7mjgGrX74DYqwuSdgnvFnJXfjZjIIwNP31XbsMmCKYDvUf
	43qsnpEqjYHAtA0USUbUUWSW8YfPd2nS3XIJDD0L1Qs/iXexH2YUXsg1IJ4ihBabggF6
	XiKzxwjnVfV7fDvljferpqBDbUo56i0whwqB20mo9LKZOdYTdkSdCE1B9OwxKx7Z8FBc
	qcZlKr9hkZFwc+LP1SuCy3KeYFn0GVfQ3XLcxOmX8uBvAjKNiA7+xrzgv/jNFZqHALR4
	ji1g==
X-Gm-Message-State: APjAAAXPCK4bDNUMPRvmVJsteKwjGnV4NWSqJ+ZniDJsXNhW+AUl2QxV
	6dso3CtRvQWuD5F61z7NZc+tySIsUY0=
X-Google-Smtp-Source: APXvYqzhi5tlxfb1RxOigWUanJ5xCBz8cYghbmtbzd30eCyKcfjN9NXvYfM7piFWa0EtGU94jnkvmQ==
X-Received: by 2002:a62:1dca:: with SMTP id
	d193mr40604373pfd.140.1582325135949; 
	Fri, 21 Feb 2020 14:45:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	m12sm3830284pfh.37.2020.02.21.14.45.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 14:45:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 14:45:33 -0800
Message-Id: <20200221224537.4052134-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Misc AUH suggested package upgrades
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
X-List-Received-Date: Fri, 21 Feb 2020 22:45:35 -0000
Content-Transfer-Encoding: 8bit

My share of pending updates

Khem Raj (3):
  libxcrypt: Upgrade to 4.4.14 release
  go: Upgrade to 1.13.8 minor release
  gmp: Upgrade to 6.2.0

Upgrade Helper (1):
  ninja: upgrade 1.9.0 -> 1.10.0

 ...t_4.4.12.bb => libxcrypt-compat_4.4.14.bb} |  0
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  2 +-
 ...ibxcrypt_4.4.12.bb => libxcrypt_4.4.14.bb} |  0
 meta/recipes-devtools/go/go-1.13.inc          |  7 ++-
 .../ninja/ninja/fix-musl.patch                | 46 -------------------
 .../ninja/{ninja_1.9.0.bb => ninja_1.10.0.bb} |  6 +--
 .../recipes-support/gmp/gmp-6.1.2/amd64.patch | 18 --------
 ...provided-flags-to-the-auto-detected-.patch |  0
 ...-Believe-the-cflags-from-environment.patch | 16 +++----
 .../{gmp-6.1.2 => gmp}/use-includedir.patch   |  3 ++
 .../gmp/{gmp_6.1.2.bb => gmp_6.2.0.bb}        |  5 +-
 11 files changed, 19 insertions(+), 84 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.12.bb => libxcrypt-compat_4.4.14.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.12.bb => libxcrypt_4.4.14.bb} (100%)
 delete mode 100644 meta/recipes-devtools/ninja/ninja/fix-musl.patch
 rename meta/recipes-devtools/ninja/{ninja_1.9.0.bb => ninja_1.10.0.bb} (87%)
 delete mode 100644 meta/recipes-support/gmp/gmp-6.1.2/amd64.patch
 rename meta/recipes-support/gmp/{gmp-6.1.2 => gmp}/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.2 => gmp}/0001-confiure.ac-Believe-the-cflags-from-environment.patch (80%)
 rename meta/recipes-support/gmp/{gmp-6.1.2 => gmp}/use-includedir.patch (83%)
 rename meta/recipes-support/gmp/{gmp_6.1.2.bb => gmp_6.2.0.bb} (86%)

-- 
2.25.1


