Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id CCA8075462
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 18:48:48 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id c9-v6so5172807pgf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gxu/hpvx9gJAhnpicclL08432C3OJS7kbm1dPJg98Wg=;
	b=dvYeGe6OUCynysCnK8sCmhBLumTMAozfODMZyLMeH9X5YrYQH40DDq90ztlTvdDWCp
	0VagAUmMF2lTEP5e/7cAKloowVOjJ4Q3FtHLv526EeTPRFshcp57FcKYnXJNpkhaJ9BE
	CPkZqVdC0YhKct45jf7sBzEaMlUKDg8pda410h545R+1heXcvlt/5hpxKm/C6GNYuccV
	IiuP0AJpU602fREH2im89lsoP2AhyWDjxgjPewwYjXDoC38yegGO5IT88MmUHRLjgdhH
	pk85ZPyt8AmZPETGpgnNSb9EobDCXaA5R/ryd/VG4EvpcdGScCb1YOF4/tdZPRCcrQXo
	uJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gxu/hpvx9gJAhnpicclL08432C3OJS7kbm1dPJg98Wg=;
	b=Oax7Mx7QK24QXBhDD4mG51J2FKCDsF6UTtsLOGbr/DEFLc3WhjA6tGqHkaxbkuo+9I
	8SUy/KtpMypQNmpYlJ0aGprvN/xseESIkQZChtLucuTGYvyv5ndgqb3YYJoF3kPHq7Gn
	AKPXehSN0MT2Z2sIgCE3Iy17Jb0Ch1BozN8c41qysnkG6Vu7vwhmgbsoLT7K2Fn3xKK8
	gRgqUYV70j7RoBnqt3eDHBPJ/jchPP3/xr7XhopQevBJqxiQE3ZYuC07Fh/3IyQKUiWj
	7hxVVMfUyj0qeA+9kiEMDDKypHQhUyubfmDXFbTBIYwRESS/Ld8ha9JZa77uju1EnYDj
	c9tg==
X-Gm-Message-State: APt69E0L7PV14xPE84mdboQw/kX8iY84fb0TuPViY3j3t6sg1UTvBdsx
	/fcSPq3dzA0rv0G6Ye75HOAIuA==
X-Google-Smtp-Source: ADUXVKIf1XTbQqmhmkCO4GRply/laIjQ6+BAlib/nthfIfW72OBEB+FyRPa2oAjJyoYUDf0PqMAesA==
X-Received: by 2002:a63:9543:: with SMTP id t3-v6mr2463743pgn.77.1528397329830;
	Thu, 07 Jun 2018 11:48:49 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f30-v6sm27103558pgn.76.2018.06.07.11.48.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 11:48:49 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2018 11:48:35 -0700
Message-Id: <1528397320-32269-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
References: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/7] openssh: stop manually hiding libutil etc headers from configure
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
X-List-Received-Date: Thu, 07 Jun 2018 18:48:49 -0000

Since we now have recipe specific sysroots, drop old workarounds
for non-deterministic detection of sysroot header files.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index 7cf34eb..0459782 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -61,17 +61,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
 # musl doesn't implement wtmp/utmp
 EXTRA_OECONF_append_libc-musl = " --disable-wtmp"
 
-# Since we do not depend on libbsd, we do not want configure to use it
-# just because it finds libutil.h.  But, specifying --disable-libutil
-# causes compile errors, so...
-CACHED_CONFIGUREVARS += "ac_cv_header_bsd_libutil_h=no ac_cv_header_libutil_h=no"
-
 # passwd path is hardcoded in sshd
 CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
 
-# We don't want to depend on libblockfile
-CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
-
 do_configure_prepend () {
 	export LD="${CC}"
 	install -m 0644 ${WORKDIR}/sshd_config ${B}/
-- 
1.9.1


