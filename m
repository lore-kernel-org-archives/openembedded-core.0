Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id C8557779FE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:59 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u62so478180pgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ngct9WjeQkQ8YBGChXmg88sOs+vHGCkTLmKom3Nv3fc=;
	b=lA8pAYTG/1VYp2VYiQn/lLbDg86rjl8BbWcvw2yg+YdPJDmWWhl6aNZHg3LtvcgJPq
	ceQMc/khe/rTBHFwP0/dkQPKS+AGk4wSe5TEuI5ypyViH/PPTbuuIJ5390aHknZ1Kk/e
	ndsn6OfGd9vOp8nOPU1VUd6E43OXdBcYs4K/UpQvAyJzCCRJRTp26Mc7EafOWk6ca3EI
	AYfZC9kq6cDHC8uBAgZ+3lSLNQXEzrC3IqM5GXRlXV7KWeV2Ba5cuBpnHbI+Rtow9Gk3
	Zx6ptIETe2OhE3L31GQ4vCEXdBMv9szOkjA7xsyIYi4wcM8hx3zHQnpoMpF/fM2ylDed
	3Uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ngct9WjeQkQ8YBGChXmg88sOs+vHGCkTLmKom3Nv3fc=;
	b=ZWi1p2JZy1X59UlyqcNy2z7rm0K+hak/NA57IeMAFUr9cA+eehwNUiNpeZHkn2SEBm
	V/25pLFzOd6ISKjU2/eHB26LZOZT4s55dG92oPphVa0MxzRsGB3wJjtpyq16DYYqmakX
	l/PN/0Ci3yC9tpH+/KT+jyruRYdaSLQPQ2peDLfjWNQB5CrthPu5cwNmPWMAAfDnhFRp
	8DXbNBs+9YzmOillKqCD/3+aY3GxRWRBKNI66PQ6zjN/wzarEm5Gj4F6tQyhd5gszY7S
	b9sYk8627wDX+9bU4FE0QQh7ylxMw8DKWy5GPg0AH27v8q3I5xKO+G1lJrLfEmL9L5Pp
	ApJg==
X-Gm-Message-State: AIVw113Ou7AsRSjcaxWCdOTy/LAd6YPphOjBpgQ07A0tqFrxot3sMiHB
	o7XlgWKEov92dG1N
X-Received: by 10.84.170.67 with SMTP id i61mr29407887plb.114.1499351641105;
	Thu, 06 Jul 2017 07:34:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:18 -0700
Message-Id: <c42415e843079e49b647522dfaab4df303a88f91.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 17/22] musl: Update to latest on master
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
X-List-Received-Date: Thu, 06 Jul 2017 14:34:00 -0000

Bring in following changes

* fix missing volatile qualifier on lock in __get_locale
* remove ineffective compiler assist from printf
* fix undefined behavior in ptrace
* unify the use of FUTEX_PRIVATE
* fix undefined behavior in free
* reapply va_arg hacks removal to wprintf
* remove useless declarations in string.h
* allow specifying argv[0] when invoking a program via ldso command
* fix regression in dlopen promotion from RTLD_LOCAL to RTLD_GLOBAL
* ldso: avoid spurious & possible erroneous work for libs with no deps
* powerpc64: add single-instruction math functions
* fix clang CFLAGS checks and silence unused argument warnings
* s390x: add single-instruction math functions
* fix arm run-time abi string functions
* fix regression in getspnam[_r] error code for insufficient buffer size
* fix omission of microblaze user.h definitions
* fix iconv conversions for iso88592-iso885916
* handle errors from localtime_r in ctime_r
* set errno when getpw*_r, getgr*_r, and getspnam_r fail
* handle localtime errors in ctime
* handle mremap failure in realloc of mmap-serviced allocations
* getdate: correctly specify error number
* catopen: set errno to EOPNOTSUPP
* fix glob failure to match plain "/" to root directory
* use hard-coded sh4a atomic opcodes to avoid linker errors on sh

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index fba47096f5..31583de596 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "179766aa2ef06df854bc1d9616bf6f00ce49b7f9"
+SRCREV = "a08910fc2cc739f631b75b2d09b8d72a0d64d285"
 
 PV = "1.1.16+git${SRCPV}"
 
-- 
2.13.2


