Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A8F9E780CD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:34:39 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u62so7288960pgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=am+R9xClg4AvwRAZyaU+yMll9yRPDavyUR9PrHdGUhY=;
	b=nfkje9sh44VJDKBmShnthhzlh3xQOXW26/DQukNb7fMDTWSszUGMczqfBN7EqVd9ML
	lYNdjra7U4oB22tEdne/Ea7WbG8F2OmN0bAGAIselv0rlnLWVUmy+BNQOkQRBJZMCeH+
	zLkPYs4Hnujm8YSAc7InTwyCFbGsF7ofVzRgh7woV66CsWl4COSepJrByCFpBffEuO1f
	ffg+ytUTXD7rxng/MzXKYOqvviwHq5SduUFH4ophUCWX4knGJ6fImnjdHrfJy/EFXyGV
	VEJggC9CYK0Wxjuq7HBHn4kIHSCYiVqYSCpd4Gmd/on8zK7iX25Gqqgr6Yl3D9Xq6TRF
	owbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=am+R9xClg4AvwRAZyaU+yMll9yRPDavyUR9PrHdGUhY=;
	b=YTKpC7T51E/hFzSTXoHw5IMhh71LogHwXqYp0SJinGg6N4Q05NITOKk1Y37ZerWf+t
	GxLIrs8/PkFMiXhniVszZ2Mwmks13kr8zhMJtTLlNciYsVK0+i9oFs75r8ExptkCQO0R
	d+V/yFgSZDiOpn+N0QNlDP1J7J7EM3ytjvg2or/5GQEqozfWmbV5yiaFvCkst2117t0V
	iqhTzJKvWyqnZG8ZANVMiTUJ8qM/KioigE+8Fd3YVyTuIlIUyh/eZRD+7nQE/0ozHYWh
	WjjxQs9S3Nuorjmm+INbyIYVHWka77ypKMHNTUxN2eWArLa0PmlUOM/ASb1QaTEUArGs
	5YSA==
X-Gm-Message-State: AIVw1108r1w6/iOvppc/T1b2WT28eaRHWbyj9YMbxSlZQxU2VL/9niz3
	sTEXOtJ5UNTfvkcv
X-Received: by 10.98.222.3 with SMTP id h3mr35638721pfg.93.1499520880245;
	Sat, 08 Jul 2017 06:34:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	i27sm15575561pfi.82.2017.07.08.06.34.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:34:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:34:21 -0700
Message-Id: <d0b4e0049a0128c12ab468f9261e2d7cc354a863.1499520469.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499520469.git.raj.khem@gmail.com>
References: <cover.1499520469.git.raj.khem@gmail.com>
Subject: [PATCH 02/10] glibc: Drop obsoleted bits/string.h from multilibbing
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
X-List-Received-Date: Sat, 08 Jul 2017 13:34:39 -0000

glibc 2.26 has dropped bits/string.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 645be694b5..0281251bee 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -135,7 +135,7 @@ do_install_armmultilib () {
 
 	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
 	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
-	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/string.h bits/typesizes.h
+	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
 
 	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
 
-- 
2.13.2


