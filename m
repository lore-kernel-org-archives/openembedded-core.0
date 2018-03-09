Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id F11E47886A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 20:29:03 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f23-v6so5836865plr.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 12:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BpKse19uDcW9D2GnGGpM/8ipo7yXNQ4ZEeSgy4sy0u4=;
	b=Y29jeAdlyzwEIeYJo/9+pHJigWsUS/uuwjiySEXFRZT/4ErPVu4Vvh6UqEOH+g70D8
	p2RX0IZd52w/G5G8sGJnwfeHRlOAxxy9AfelXNanxLrFu1qT2ekqCo7bDwoQTM1WPOzc
	ODX8a7EP71RhhP2qdEr6ZXaLaKQVuD9eDPtZLTh/gVlpJoLs/4NxAnvt2va9OnSp2mTX
	hLTMY/Nngk/XRVqpqlqfIZTVzaJt8+uFJSYR/dYWotZAttJU3Bx1uiw5gj5Cq+Ak89kC
	W4MU+3ZYuPgIr8+wcWPtQugcaQGVSc6Rwf47QdYlXZXynTz7ASlPG7huzpSUDe9xMsmM
	CY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BpKse19uDcW9D2GnGGpM/8ipo7yXNQ4ZEeSgy4sy0u4=;
	b=axl/WI5cZNJkRb2nQ/d7uDi1mX+MAaXIrZBGNfI3OxOoa8qqscwDcCBX9vtu2FBgzq
	r12jK56K5UXALh60OH1q3l1iQU6XhCPr5Qs6DEIWPD9N9R6Vtrj5J+P3+VZYPqbfSvnj
	Rkzy9SNCzUL2fhekWXyWRChmzjEtwH1R0Cm6r8/95LckWYZaFZ65D4HIQfWUMbSAErs+
	u72h6T8xS/W6kBKiTDzM3oSDLmF9aSJrER4uvNHSrv4P8PO/7kF2x+r1TfGJcGbqqI9J
	fTIDYWEGYwwcMLmS0cfV4U/ydfX391Lj5hQS8F4GkU0aajAqovvygD0e9fdbij62075S
	tK9g==
X-Gm-Message-State: APf1xPDMTtss0ABp51F25fgvuvEdXsb43VGeWByrCZjCoDDYyaQABbKk
	1T7YlAN9Afnx7cU2ZiLZdhITNQ==
X-Google-Smtp-Source: AG47ELvk65jGu21F/UZtugLFSeRn3g37V1/jC0ymgHcwRgn3RsWt056BeCwZH/n5WpLXXy4ROlB5Gg==
X-Received: by 2002:a17:902:7a2:: with SMTP id
	31-v6mr28952437plj.313.1520627344803; 
	Fri, 09 Mar 2018 12:29:04 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	b18sm4162679pfi.34.2018.03.09.12.29.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 12:29:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 12:28:56 -0800
Message-Id: <cover.1520627244.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH 0/3] Build fixed for riscv64
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
X-List-Received-Date: Fri, 09 Mar 2018 20:29:04 -0000

These packages found failing on building extended images on riscv64

The following changes since commit e4da78229f0bd67fd34928eafe48dbdc9e8da050:

  e2fsprogs: Add comment on why touch is needed (2018-03-09 11:09:39 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/riscv64-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/riscv64-fixes

Khem Raj (3):
  packagegroup-core-sdk: Disable SANITIZERS for riscv64
  liburcu: Explicitly add pthread options to cflags
  recipes: Disable lttng for riscv

 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb           | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 2 ++
 meta/recipes-devtools/gdb/gdb-common.inc                           | 1 +
 meta/recipes-kernel/lttng/lttng-tools_2.10.2.bb                    | 1 +
 meta/recipes-support/liburcu/liburcu_0.10.1.bb                     | 2 ++
 5 files changed, 7 insertions(+)

-- 
2.16.2


