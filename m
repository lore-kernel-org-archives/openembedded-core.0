Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id BC6AE60B3F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:28:49 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id a141so22491790wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zFil9Msv6ZKGg24epxJahplVGqy07n8YVSYIme0hDIQ=;
	b=FDsNdVU8IuayNtP3Hn32xfxnc7wn7FVOaMSq36yvM282yltLFtPVTb0KvxFc9PQsmu
	O6LEfw5rr640S7WUEGS8VjAqME1J/tdo+Z7a4VYbSfRR+Xz2Nd7bKIQmlyVkupwZs4AH
	qoHWzIQ2YqVp+E/a0wWcYXV2FUbQSeOfK5GhMyXO0PWbzVRlkXvl6DJHJxmjBk3j4KJq
	aIYUqxFI6eutuHjxLAnjZGPJmWnTKI2I/luRhPsApH42sofr7CXnRMCXCIGAmQxzVdmY
	eD9rxdcLVEuJ1873u2106Xg/BKmRuPsVFxkxTPE9q1BlwsKlXUFn6bvRnhux5tqWQ1PB
	AsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zFil9Msv6ZKGg24epxJahplVGqy07n8YVSYIme0hDIQ=;
	b=hiYQRxTjEPPa6NsIDyGKuhm0CLRy8mpemcXll5BHH+nrAXAhFf6mAHqGtu1gJsigS7
	Q6SpLj+z1rHpQcltoxRoEvTpqSefS4w0ut9x2ExTdxnVBC3058DLLhmFbsES/FirAzKx
	FA7OGY+ARsC/zGbgxw0gMVF+EFHdZyvBE3rcBWsdhXYPn5900jMtTYRYk6DEbkUmosaI
	k7KQ5b5nhLiXODJewD0J6WIFQFcu+DUDMGzwtvvgymzuS1RWGtXY0eoRkm/EZEBVj9yx
	/vPi0OAmGlXh60kzW7sAbT7npvkZENW13YX2/5eINh8MYbw58TFYy1PFI9p0hOwAXMuM
	xiLQ==
X-Gm-Message-State: ANhLgQ1mphQA+QTSRNLAAo2/rJZvLcWg1Okz7GICRsWZ7XF0rteGGiNU
	DZGtLGfSyyBVzowlVjGqGO3vkpWP
X-Google-Smtp-Source: ADFU+vvpeC3qsnzp/9zwa8QdbTkF4hqhcEyhIu8FB9xH5shnOTWcR8fdQOAslNk1MIduyNfBp6cJMw==
X-Received: by 2002:a05:600c:4114:: with SMTP id
	j20mr5793652wmi.58.1584458929895; 
	Tue, 17 Mar 2020 08:28:49 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c2sm4307128wma.39.2020.03.17.08.28.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:28:49 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:22:52 +0000
Message-Id: <20200317152303.4600-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [RFC PATCH 00/11] Systemd 245 and related updates
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
X-List-Received-Date: Tue, 17 Mar 2020 15:28:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Throwing these out there, so that anyone else who's looking at systemd
245 doesn't have to repeat the work, equally now is clearly not the time
to be applying these to master!

Not all of these are stricly related to systemd 245.


Alex Kiernan (11):
  systemd: Package udev rules explicitly
  systemd: Reinstate systemd-hwdb-update.service
  systemd: Add sch-fq-codel to RRECOMMENDS
  systemd: Add PACKAGECONFIG for sysvinit
  systemd: Remove X11 related files when disabled
  psplash: Set RemainAfterExit on systemd units
  oeqa/runtime/cases: Disable and stop systemd-timesyncd
  systemd: upgrade v244.3 -> v245
  systemd: Enable smack based on DISTRO_FEATURES
  systemd: Enable audit based on DISTRO_FEATURES
  systemd: Enable acl based on DISTRO_FEATURES

 meta/lib/oeqa/runtime/cases/date.py           |   4 +-
 .../psplash/files/psplash-start.service       |   1 +
 .../psplash/files/psplash-systemd.service     |   2 +-
 ...temd-boot_244.3.bb => systemd-boot_245.bb} |   0
 ...temd-conf_244.3.bb => systemd-conf_245.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   4 +-
 .../systemd/0001-Handle-missing-gshadow.patch | 171 ++++++++++++++++++
 ...tall-dependency-links-at-install-tim.patch |  14 +-
 ...-not-disable-buffer-in-writing-files.patch |  46 ++---
 ...002-don-t-use-glibc-specific-qsort_r.patch |  12 +-
 ...k-parse_printf_format-implementation.patch |  10 +-
 ...set-util.h-add-__cpu_mask-definition.patch |   8 +-
 ...missing.h-check-for-missing-strndupa.patch |  93 ++++++----
 .../0006-Include-netinet-if_ether.h.patch     |  41 +++--
 ..._register_atfork-for-non-glibc-build.patch |   6 +-
 ...11-Use-uintmax_t-for-handling-rlim_t.patch |  10 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   8 +-
 ...uffering-when-writing-to-oom_score_a.patch |   8 +-
 .../{systemd_244.3.bb => systemd_245.bb}      |  67 +++++--
 scripts/postinst-intercepts/update_udev_hwdb  |  16 +-
 20 files changed, 376 insertions(+), 145 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_244.3.bb => systemd-boot_245.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_244.3.bb => systemd-conf_245.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
 rename meta/recipes-core/systemd/{systemd_244.3.bb => systemd_245.bb} (91%)

-- 
2.17.1


