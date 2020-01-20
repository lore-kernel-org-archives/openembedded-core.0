Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 43EA47FA27
	for <openembedded-core@openembedded.org>;
	Mon, 20 Jan 2020 06:38:23 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c9so7461412plo.1
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 22:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=JksZOk50WBaCYAEtVUpi24qU0pKOLibUh7URtIKREn0=;
	b=P27s7NNCovFjrTXKwJs22ZL02fjWfxC5LNKy2HUMlI0c3+FMYbRh/MBAAQAgIUYba2
	PLgOPPKhrjn4liM07RjmBE0FEcUuzmWZm0o6XdUN4wY5n9HgE7C93i80TWmo8Nt+drjn
	LNupVKhkD45eO8Imd4uqDn7jsgf5ap9tx3oJC4vSPxnkIf3ALcMBmephKn7VXg4q6R0F
	3zGFEarFlN9oOHSFeNvxlqui0he3x35A9rqhqbDEhSjrx9o/8YZZ30MwToVLb6W9os4T
	OSl5jekfYiLDT9dMl0NQl0SELqEML1wTh+K9X86x2oDvRUDjjhRYmeku3YEyqDbj6Kd1
	drYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JksZOk50WBaCYAEtVUpi24qU0pKOLibUh7URtIKREn0=;
	b=UgeANjrnZU+rje/+Fs6O74v444ENRuJsixjOIvHAZFNkLgPpb9bjwizMM30YON9W2N
	370WZz/pzblRAZ8T8+1sDZKdeEFs+3WQS0u4CTtcKRHbGaZUOJRh0ZoYFwImwK8XhYkx
	RotooGDh6TIfjuOHJSmVhpOx2nvGSMoPLbbmBO+74AhOFJ7aQGjzh8/BHL+bdNPJqLve
	9FuYUMUcdLdHbIKAiIjqqBDZZLD8cdzZF7WJEiomh/qV1ck1rJfbh450tWEY0/c/fiwr
	PFwrhCKKDqCKG4F5BFMxWOb3Jg/zkMC0c0pH0+/tBijzb0cYxD4gPNpokoSylAxgHatb
	TaSA==
X-Gm-Message-State: APjAAAUaFV4lDWMn2ClaSYFp/huY1b23bSp1tz4mZB1B5HhjVeSqjqFh
	IlzjIIZKun6HRLD5xdwOeEZcDG+3
X-Google-Smtp-Source: APXvYqy0XoXJ51m5GKQf+C7vvb7AOfRPLG7L4bMzER9+vcqqKsX0WRj8fuqfCj6X6G4J9tHhE/bP/g==
X-Received: by 2002:a17:902:8642:: with SMTP id
	y2mr13247997plt.306.1579502304953; 
	Sun, 19 Jan 2020 22:38:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:b5ff:6d3b:2415:6395])
	by smtp.gmail.com with ESMTPSA id
	p28sm36310484pgb.93.2020.01.19.22.38.24
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 22:38:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 19 Jan 2020 22:38:16 -0800
Message-Id: <cover.1579502114.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [zeus 0/5] More patches for review.
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
X-List-Received-Date: Mon, 20 Jan 2020 06:38:24 -0000

Here are somemore patches that where also tested and needing review.
Please have feedback by Tuesday.


The following changes since commit f9739e0f58f5d8a5dc01fdb0efaa778af4edd671:

  kernel: Make symbol link to vmlinux.64 in boot directory (2020-01-08 20:33:12 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-nut

Peter Kjellerstedt (5):
  toaster.bbclass: Correct pkgdatadir path in toaster_package_dumpdata()
  populate_sdk_ext.bbclass: No longer needed to clean away
    conf/sanity_info
  sanity.bbclass: Move sanity_info from conf to cache
  licenses.conf: Remove the SRC_DISTRIBUTE_LICENSES variable
  license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses

 meta/classes/license.bbclass                  | 27 ++++++++++--
 meta/classes/populate_sdk_ext.bbclass         |  2 +-
 meta/classes/sanity.bbclass                   |  2 +-
 meta/classes/toaster.bbclass                  | 15 +++++--
 meta/conf/documentation.conf                  |  1 +
 meta/conf/licenses.conf                       | 43 -------------------
 meta/lib/oeqa/buildperf/base.py               |  2 +-
 .../oeqa/selftest/cases/incompatible_lic.py   |  6 +--
 8 files changed, 41 insertions(+), 57 deletions(-)

-- 
2.17.1


