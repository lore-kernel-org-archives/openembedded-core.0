Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 48A8978151
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:34:44 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e199so8251532pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ngct9WjeQkQ8YBGChXmg88sOs+vHGCkTLmKom3Nv3fc=;
	b=ncFn4Mo8SWcS0badJrBvOzGXAK+muSWCXU6pABsgi2xU1GfsliSuosJcvRGxEG+fB+
	9hsIPcAoqPYaCQ3GdntPcL3dLM40WjwKNBls5m7YvxNniqn49BDcCFLR8gZfkdT4Y+Z4
	tq+Lju84wJwZBbQfGQdKR1AsQyG3U5JsegE8Erue7VuMlPciE3BXAi2XAT55ELNagUV0
	ZUFYPuYekMud0VR0dUa3UunMDODcEsjO+MsUxZUuw1dcWcXaIttINsGQszB3tJqt9aC6
	+jYgnE7Q3PXbpgX/AehehyFz7HiCSO0zt6liLlgyCuBFEOf8DgM34kD53/TchPNnqxOe
	cSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ngct9WjeQkQ8YBGChXmg88sOs+vHGCkTLmKom3Nv3fc=;
	b=a7jQtT1ubSZLguNHLrdlkYOZ7Dml6c0/NHshLc1TJrxb+FkHQl+J67xEVleQCZl6Vo
	maW4zNR6N/Dp2wYzKDrBX9FKfGDL4qrPCtlIPgqxlOHj+vh6amA3ohJVCVKjXu+Xj6zc
	K50U7l6EfTcm1/cqzpA63uybl+LKye3IJdXdcBY7PRZvXJ3W2gmb7Sl5Ssu8IKK3rj3Z
	Gdubi6SzjVQFjUbp/eyRENI+w60Ha5t9r7OA8JHeACGUPGcKqoeZguDTg3kzPxaNWr6d
	/N4tFPS2SSi6XLe/nYAik1f8R/p96UVutgMhzSS+MA9GmbH8CAZhmmx7H2OPSEN3Coc5
	KW8Q==
X-Gm-Message-State: AIVw111Z/tCukeXa7ihxcIlL1OoODr+EERigYze3d6QSeHeQY807z6i5
	tB+2WMc0ZREfQ1HY
X-Received: by 10.99.16.65 with SMTP id 1mr6154863pgq.208.1499520886041;
	Sat, 08 Jul 2017 06:34:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	i27sm15575561pfi.82.2017.07.08.06.34.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:34:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:34:25 -0700
Message-Id: <305d2ecedec664d196bf0600bebb0e7f4b931d57.1499520469.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499520469.git.raj.khem@gmail.com>
References: <cover.1499520469.git.raj.khem@gmail.com>
Subject: [PATCH 06/10] musl: Update to latest on master
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
X-List-Received-Date: Sat, 08 Jul 2017 13:34:45 -0000

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


