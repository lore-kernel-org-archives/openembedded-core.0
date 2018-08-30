Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 38281792B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 00:05:59 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id a4-v6so2988344plm.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 17:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+9lBz6RJm1tZ/e3kQZboJwkUBBcO8+RrpvR/98h7Z04=;
	b=mf6QZkHGXMaE7Yiqyy1YzO49PwBpXgGGr7Gn3V50pQhlMDMBtbZzHHR+Th1iVh65s1
	s6WKGO2ZwtQu1An0WJNapkkiAHITWstTob5COf3TPdxtcR9xZ12oRdY8cMdIQE/OSeeR
	VXvY7gviFjbX05nTowGxsH7BwrP+pPlbHY1E1lHzVYjxnHfTBcX3wIfH7bejQiySxjai
	veSwGA6uEQYdpXaWkpfHXo5rawLYH/wkGmolLu1dR+1ypErSI2jjMOEgqWIBsEhTuIKQ
	d861A0IMTgK6UGm3Zv13tmAHenY6+P+yNXjjsUx2ukcBCeXIvywxS37uleDxREDsATGR
	aphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+9lBz6RJm1tZ/e3kQZboJwkUBBcO8+RrpvR/98h7Z04=;
	b=BM4b08h8Ixn5noiNlG2mea0uWYQ9fCtN3I8Vu3fYEpsOfYS6A1cGt4xnkH7qWN0n4z
	4o4Ezt7BT/HOkzJRisyiy77/xgINKvReddb2e+ybvxrSKqxGs8t8D3gif5ze2aG5oedo
	rzoz30ngegKnUVInUB0ukc0yskVqBpnSw3giOevu9ou3jJk0kgwg3l7NNTpG8NNxVPdi
	5TuYGeETn5YKHNTCp6tj5k9NtJ8y1i/1QT/jKJ9PedxSA+WZU7DMQNpKt9KTzK5uWYKq
	0c/U52lDHz2EtcqCXW3l2TuBDEqfegCOwbmJhDObd/+0fYBgR/7TekAyHqJAWr82CyZX
	Cz8A==
X-Gm-Message-State: APzg51A+rqF2b4ud2Yh+255S8vFByfqn5wBS9ZzFpAAx3eLyeLhDWIX4
	qKvVhKYV1fc6045rb++YP9/5VBb7
X-Google-Smtp-Source: ANB0VdYp05aInbtU9CsPabACd5SIfnbjdew3nTfNVuwvnNB0uZhZYKkpi95Dxwo4O+l7CEL8tdMLOQ==
X-Received: by 2002:a17:902:24e1:: with SMTP id
	l30-v6mr7925337plg.315.1535587559882; 
	Wed, 29 Aug 2018 17:05:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	x3-v6sm6572383pgv.61.2018.08.29.17.05.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 17:05:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 17:05:50 -0700
Message-Id: <cover.1535587162.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 0/4] postinst and clang fixes
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
X-List-Received-Date: Thu, 30 Aug 2018 00:05:59 -0000

This pull fixes boost with clang
other fixes are needed for risc-v to enable offline
locale and postint generation, especially after
https://patchwork.openembedded.org/patch/154363/

Now we can boot qemuriscv64 quite fast

The following changes since commit 0d69f86e50e57afe893dade095c1dbd3d05c3b0f:

  libsdl2: Fix left rotated display for RaspPi/VC4/GLES2 (2018-08-29 15:43:18 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu-1
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu-1

Khem Raj (4):
  boost: Fix invalid const in atomic builtins
  libc-package: Add risc-v specific options to cross-localedef
    invocation
  sysklogd: Use update-alternatives
  glibc-locale: Enable riscv64 and riscv32 in BINARY_LOCALE_ARCHES
    supported architectures

 meta/classes/libc-package.bbclass             |  2 +
 meta/recipes-core/glibc/glibc-locale.inc      |  4 +-
 meta/recipes-extended/sysklogd/sysklogd.inc   |  8 +-
 ...ecific-branch-for-x86-DCAS-based-loa.patch | 76 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.67.0.bb    | 15 ++--
 5 files changed, 95 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-support/boost/boost/0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch

-- 
2.18.0


