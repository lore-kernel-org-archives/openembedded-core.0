Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id D82C260616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 21:34:08 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id oj9so16996494obc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8qsBYI+hUb10VTRyKAasekL4taCh4uPYsqOHttsk52k=;
	b=SQRHj90q8XJjxUCoAostr6zekvXXcqZxu+QZhfvPWIkREBnw+KVy3xBzFNPUVrxYep
	ISC3JEt0xIWrN/j5usfge7h0vSF5h7qKrjrJwIqDhXlsFUMgAf0IuJDUgxLXiBg9ZYie
	k3oRAoKgko9AKFj0s+EoTV8Aai4livdNv/SvUiQMVKyGBAxx0qV2H1BQw7OxT7Xa1OzO
	asooPTVzrX28FhKDLckf5NlEAWHJRsqvrhdSrL4e+a2R1vtuLn8UdON1FnIeCT7fQtc3
	Iy4rIrSY8WYDmkk0+UtC9q25OUQgqN+cHgZFLgyeZHaufxL8gCSzDEdPHpMDpWaronqj
	80cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8qsBYI+hUb10VTRyKAasekL4taCh4uPYsqOHttsk52k=;
	b=gkWvxa8JNfbWW3pZvVBrcMD10mQeeU+c2ddEiLfqNCxR4Q/j5pMqeYnsQb6Ezg3znC
	Y9e+hlPSmrod84MmWeqNgCm+jrEMYWf7gHlpMMwB7sLeEmoTUA86XKekZ3vD50yHBVKs
	Prl+uS1vg/BHxz18vG90FxYC+jojLbFNwp17NzsDj1cDiaAQjaP2zvAk3E45M2FV/pqY
	Nxbdh3T/HBzVsz8eSQaTc3AiE5ts5+al/o40ZCSe3lmhUeaudZvC99Pkw5OCMKTYOH2u
	VvurzxnxXEFNKJ9geRU1lvIHfAheEh30p/A8w0rg10AStktnhx2Zg5H7r5kMHrER1++U
	zmBA==
X-Gm-Message-State: ALoCoQmbIc35tdlG4LKv+zI/gEqw3m+b8U4ecRJsXbuEVgfg4yw+Uhs7mHaU+Aq9eWcz2PXQl4ndvyQ8q8nIRpqodrwarDi5uA==
X-Received: by 10.182.137.198 with SMTP id qk6mr20232805obb.5.1453152848566;
	Mon, 18 Jan 2016 13:34:08 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id v6sm5928816oer.10.2016.01.18.13.34.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jan 2016 13:34:07 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 13:33:47 -0800
Message-Id: <1453152832-12019-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 0/5] strace: update 4.10 -> 4.11
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
X-List-Received-Date: Mon, 18 Jan 2016 21:34:13 -0000

v2: add mpers.m4 patch to fix x86-64 build failures.

Andre McCurdy (5):
  strace: drop unnecessary dependency on acl
  strace: fix --disable-aio configure option
  strace: remove need for git-version-gen script
  strace: fix ARCH definition in tests/Makefile
  strace: update 4.10 -> 4.11

 .../0001-Add-linux-aarch64-arch_regs.h.patch       |  25 ---
 .../Include-linux-ioctl.h-for-_IOC_-macros.patch   |  69 -------
 .../strace/Include-sys-stat.h-for-S_I-macros.patch |  52 -----
 .../strace/strace/Makefile-ptest.patch             |  18 +-
 .../strace/strace/disable-git-version-gen.patch    |  20 ++
 .../recipes-devtools/strace/strace/git-version-gen | 225 ---------------------
 ...-robust-test-for-m32-mx32-compile-support.patch |  46 +++++
 .../strace/strace-add-configure-options.patch      |  57 ------
 .../strace/strace/update-gawk-paths.patch          | 118 +++++++++++
 .../strace/{strace_4.10.bb => strace_4.11.bb}      |  26 +--
 10 files changed, 202 insertions(+), 454 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch
 create mode 100644 meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
 delete mode 100755 meta/recipes-devtools/strace/strace/git-version-gen
 create mode 100644 meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
 create mode 100644 meta/recipes-devtools/strace/strace/update-gawk-paths.patch
 rename meta/recipes-devtools/strace/{strace_4.10.bb => strace_4.11.bb} (51%)

-- 
1.9.1


