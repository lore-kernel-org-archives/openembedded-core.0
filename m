Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id CA5BE7E5FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:17 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d22so272037pll.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Esc4bPSuqdtuLpJ+2YKUlXNIfgG2rln0TxMBeTaXk+w=;
	b=VIgMbd8/oslJ4KXuUXcXG5QWqaQYfSMQ/ik+j6YR4QB63vm//DwGV/tfeVSlqa/yCt
	C8cx08BQ5vNr+IKPuhHWCNDtABVTq1BlbDkZf/MiGfqhbcrmoinEBpuRqX3ODqvWGnL6
	X9xfgV7RfBbFdkV6mYAfCZDhOakf0QHReo4Ib3emF+msDnMGPDNUCxcc6SpKSuZo74FW
	0Q6P4jDfwp9JzOeiX7X21aDC+GSDV9J85YNu4XVe1Jx0NQahJNO7a1bv0hmqy+Dhl85N
	fPFsh3L94iio9YhOdN22Sfn+qHu4dxG6SCcR+TNSECmVdo+09b4XiNoaFbdYoHkFHoFb
	frNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Esc4bPSuqdtuLpJ+2YKUlXNIfgG2rln0TxMBeTaXk+w=;
	b=JJxTwR2Ba/wRAi9FGKZmbPRdfgN88oJeJ+1Ymu493i9FXLO9GLa87y/K1JQIU2vyT6
	Zmwi8SkgJQqSNnMqVedeMm3U69QJX5gDp9h7oK626ujOFn337kJE1YmRQfTIcmsDQcBG
	Dq7mLaYKFG66QBq7TSG5Z0CD2UTClHL9OJ1VRRQl3Q+/qx5ZatVz/S2W12zKacK+03BW
	IlfNaUTnOJ5/sg/S9Z55iLWic0Io25EJvtNsskbGS7qI45h6VoCCqpXp/478vFHkUlC7
	dyV9cTn/vDdKmLfp2HD5a79MTnG4/amcliSCfMsn3pm8zNl8abyGoFq6OmmAjMRfGfeo
	cWuA==
X-Gm-Message-State: APjAAAUqwIE0+Olf38uzxytB0d22SIgExs+f79LTN9/1iaLW4erCNMy/
	fy7pe9IgCQQZeP6miN95Dev8Afhp61Y=
X-Google-Smtp-Source: APXvYqxyX2yChgKXLSf9Lfuqpc0F9JOIQT2lzbz1NUUfwP/2KTGMF3Hy9mRT/eAQ2TktDXVqHnO+wg==
X-Received: by 2002:a17:902:bd8c:: with SMTP id
	q12mr428285pls.339.1569293418747; 
	Mon, 23 Sep 2019 19:50:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:25 -0700
Message-Id: <650216f165f4100770c190083a0f78e15aedf658.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 45/50] kernel-devsrc: tweak for v5.3+
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:18 -0000

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


