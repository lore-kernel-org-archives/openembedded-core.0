Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE4C97F337
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:37 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a3so6631526pgm.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Esc4bPSuqdtuLpJ+2YKUlXNIfgG2rln0TxMBeTaXk+w=;
	b=RSQiSGfGoAbYKG84YWmjUM3300IxSp+sYjKAkgW19fFH/H/09u8C1J/pCWVpXGHKsZ
	Y4A9u4dOwHC3BSSABSdlyeQnAcn3YpR3Mmq9dqgjJZEDb7yZ69mIw9WmgVD6iidt3NHq
	g6UTVxAXG9Zz7wZ1xCha5XtEAOAPE3WmZyo2u5qSShvKQ68zl074ghi1mEtGizTgHxLi
	NSrg+l5k/vf9xj6WLldOfSfaBMv5p9xFZhN70SsbpMmtFdvgDwvvoay2/YMD3ryXJVbx
	YdlcRVC/djQiVBG2iIlje5Y3Isi8WYVFxPcX5vTUuAngo++dD7D8hzBUwwAHWChDzkmh
	PDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Esc4bPSuqdtuLpJ+2YKUlXNIfgG2rln0TxMBeTaXk+w=;
	b=azZ86Jz9tlcie+iTKU9SdcQ4KkQFIH5pu7Ah0Ykz0yA5HbEFXKFPyYRKvtdaqKPDjf
	hNVc7bjQkVWz8Ng/2uzKXuYgwSDBrhkV+5EGtGTGBLSkD2MXdYVRpxLqQErpTwdtKthK
	vi6PndxfcY3XswpvAmTYwF4sgrvWYeLYCjYAQ3aCjOwzs8Xh+SwoBBO9NOUcKLXG4AJs
	uCozA4fJW1OzC17ZqJdoDUV3n3xjaBjMkIVGuJ3jSrUPIkkRLknNPrh1Qg1kZv7YlnPc
	wRU4cS6M5B1I1zAPVJr8UX4JKgYKgScaJhRR9Mw2REVIZvpEodhNYa+f9yzZ+xX7QCBE
	tr/A==
X-Gm-Message-State: APjAAAWITBd7SxMj2H+8cFfFV+UBtrLqCrQM/OD11sfHxde2Sti2kpRG
	gX2f//Ctau0QW55MBJ5rAAryziVD1Ck=
X-Google-Smtp-Source: APXvYqxvc7tQlbmQ9xXnAKxAZS8tSmWW+ehAiGqdIhlIPcBw4OolfVJNjW1DA1XMu18piS5ky9R/6w==
X-Received: by 2002:a17:90a:6547:: with SMTP id
	f7mr23753772pjs.13.1569818918707; 
	Sun, 29 Sep 2019 21:48:38 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:39 -0700
Message-Id: <ef7a387c8045af08e5db171e944656b9bf15f598.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 44/54] kernel-devsrc: tweak for v5.3+
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:38 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 5.3 kernel has two changes that require tweaks to the minimal
kernel-devsrc package.

- 4ce97317f [x86/purgatory: Do not use __builtin_memcpy and __builtin_memset]

  This change removes the need for arch/x86/purgatory/string.c and
  instead reuses a copy in arch/x86/boot/compressed/, so we can't copy
  the file anymore. To support older kernels, we make the copy survive
  the non-existence of the file.

- b1663d7e [docs: Kbuild/Makefile: allow check for missing docs at build time]

  This change adds the sourceing of Documentation/Kbuild to the top
  level Kbuild file. So we now leave the copy of Documention/'s Kbuild
  in the devsrc.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 5ec5929..3900489 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -65,7 +65,6 @@ do_install() {
     )
 
     # then drop all but the needed Makefiles/Kconfig files
-    rm -rf $kerneldir/build/Documentation
     rm -rf $kerneldir/build/scripts
     rm -rf $kerneldir/build/include
 
@@ -205,11 +204,12 @@ do_install() {
 	    cp -a --parents arch/x86/purgatory/sha256.c $kerneldir/build/ 2>/dev/null || :
 
 	    cp -a --parents arch/x86/purgatory/stack.S $kerneldir/build/
-	    cp -a --parents arch/x86/purgatory/string.c $kerneldir/build/
+	    cp -a --parents arch/x86/purgatory/string.c $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/x86/purgatory/setup-x86_64.S $kerneldir/build/
 	    cp -a --parents arch/x86/purgatory/entry64.S $kerneldir/build/
 	    cp -a --parents arch/x86/boot/string.h $kerneldir/build/
 	    cp -a --parents arch/x86/boot/string.c $kerneldir/build/
+	    cp -a --parents arch/x86/boot/compressed/string.c $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/x86/boot/ctype.h $kerneldir/build/
 	fi
 
-- 
2.7.4


