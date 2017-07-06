Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 05FAD776D1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:52 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j186so474764pge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=am+R9xClg4AvwRAZyaU+yMll9yRPDavyUR9PrHdGUhY=;
	b=ECKbwEJVsZGtWBiN2mwYQepfSLaiw4m0xRf+K3gnzqgyrmH3zIz4SqCGzjGbs8qLlr
	m4WiyNgJHsjZLjUWrrr2vSaY6DuGFuWqFCRTA9qjJO+a5KFt9WzwSjsmbwT7+P9oPq2y
	2URaLCBY5PCsvFv5uW4Q55D2xXXd1ztkIZUYdqX8HDhCATEcNaT+YhqXS+HjBpm4aDGs
	4JE6V3JZOTx5BGG+Tuh1plVUx+I2b1cKIBfkLKTkSHMqwdH7Xfl6eYDpAQJj0IG16xXr
	3qyi5dxl1B9MGcvBE63wm6VbED6N6cftE72KOX+bz+VBrdrMU9KKYgq4Smbew7n3N16B
	vM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=am+R9xClg4AvwRAZyaU+yMll9yRPDavyUR9PrHdGUhY=;
	b=XmkJPu1FJQh5/7lfsDvv+VPetO/c7/845TeCl/c2E/zC9zTPxqnJ9qqT0JwojeYzSa
	AcR1HPg+zYNcl3bzCsCM7/+x56You4UweepMtQjlSEd5mcJncTEVL0JZPuOfPzliDUKN
	HkxBfM5otYAnNS38dFUPQpevvQBLamddpt5u5pAUZybLAIbtdrsBOlLXyKjk2JL/5KVi
	H0phH6pvBXIyJ52fr0tXJ3qb9+4QQWG0Tp3TQ2DxIYlgTABwfRU2bk3O1d0RRsJc7FF+
	70rYKTNVgOJ7y2L9n3zZiQhffk1ulJC6t1eelFzZVALbWEW4h5R7xPbnxLquC6+qXdBs
	ihrA==
X-Gm-Message-State: AIVw111ZFP8sQ46npNS5ANMWYSFXh04PmSDd3SryQ1KnZd67nSAoTMTc
	7oHP6vQuVCncHBoh
X-Received: by 10.84.141.3 with SMTP id 3mr29118313plu.227.1499351633393;
	Thu, 06 Jul 2017 07:33:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:13 -0700
Message-Id: <061c21b51248d0e3fe3ae6d6f6d31d5b8f1998a7.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 12/22] glibc: Drop obsoleted bits/string.h from multilibbing
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:52 -0000

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


