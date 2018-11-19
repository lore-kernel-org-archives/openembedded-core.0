Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 61C406C132
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 22:07:49 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id s5so29134389oth.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lRqE1+OIPlNYqkRVZBLBgTgIVQgMpq4RRv1hjU6EnUQ=;
	b=NPoMjFZSzwFizBGsjoTsRKuJ8CDH7J63Pk9mDCxOebU3jsblV4tlFmJY7KVBABzOiD
	UrTALWRN4+SRYRA8CvzoQfi9njNDTvb1nYgLEDxhXpg9c/Yxrwn5bUQb4vn5UbJ/WgCL
	HU6ajwtAHVRDjm3HfvIDrvr3iRrcLzFDxFnrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lRqE1+OIPlNYqkRVZBLBgTgIVQgMpq4RRv1hjU6EnUQ=;
	b=ucQ6pBMnmAhOZILhwz4wGNjLEkViiS4st9L1o3JagKEF/7k65jIHFr5htcvvR4mo2q
	R1JdEuJ4v1DO2OlGRq8AO6m3q5Qjvdd9Ks9G+Zb8GMRCmK5wWmDxqHd1qxrsYU9KGDwc
	YjylA3n44s35MnOWW3C3ACdUpSPGq41hr/PAFWuzU9tQvxmxIw9GX8VjBRDgH3UaAk54
	XiHer76MWlY3RYZvZpT+iz1X619q5XBLrywP+s1FLR4o/FqTHZcEB9QuMr0hx6lF28AJ
	PpPWTLE7IdEHMZtZzYp0pQ8EELDCDNCoaW50aSoBU/HGqvnzh7ZYYrtHW86s8g+QOiZL
	oUoQ==
X-Gm-Message-State: AGRZ1gI1Lr1tiq5aRr/OBywUR8RUm326KYmWJ+jAncFaMyeioC0xyYs1
	4jxdVDHffyEJCeCKfwCjPPgpkBmDaj9xZA==
X-Google-Smtp-Source: AJdET5f3CXyIyapSE7FlISda5dGSqIAD38xvd34yDUcmjV4FPpMpkgx6sKBg7jYREV8XZ2nPYvJu2g==
X-Received: by 2002:a9d:42c7:: with SMTP id c7mr13516987otj.119.1542665269637; 
	Mon, 19 Nov 2018 14:07:49 -0800 (PST)
Received: from alago.cortijodelrio.net
	(CableLink-187-161-144-57.PCs.InterCable.net. [187.161.144.57])
	by smtp.googlemail.com with ESMTPSA id
	e66-v6sm13563785oia.33.2018.11.19.14.07.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 14:07:48 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 16:07:20 -0600
Message-Id: <20181119220720.322-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] ltp: Delete unneeded patch for FNM_EXTMATCH
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
X-List-Received-Date: Mon, 19 Nov 2018 22:07:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch in question was reworked, merged and released by
upstream version 20180926, as commit 822ad2043379.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 ...FNM_EXTMATCH-if-not-already-like-und.patch | 44 -------------------
 meta/recipes-extended/ltp/ltp_20180926.bb     |  1 -
 2 files changed, 45 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch

diff --git a/meta/recipes-extended/ltp/ltp/0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch b/meta/recipes-extended/ltp/ltp/0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch
deleted file mode 100644
index 0245a89f3d..0000000000
--- a/meta/recipes-extended/ltp/ltp/0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 23518508de307790231d16af307291f1b45e903a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
-Date: Tue, 5 Jun 2018 15:36:30 -0500
-Subject: [PATCH] read_all: Define FNM_EXTMATCH if not already (like under
- musl).
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With musl, FNM_EXTMATCH is not defined:
-| read_all.c: In function 'read_test':
-| read_all.c:201:41: error: 'FNM_EXTMATCH' undeclared (first use in this function); did you mean 'FNM_NOMATCH'?
-|   if (exclude && !fnmatch(exclude, path, FNM_EXTMATCH)) {
-|                                          ^~~~~~~~~~~~
-|                                          FNM_NOMATCH
-| read_all.c:201:41: note: each undeclared identifier is reported only once for each function it appears in
-| <builtin>: recipe for target 'read_all' failed
-| make[4]: *** [read_all] Error 1
-
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
-
-Upstream-Status: Pending
----
- testcases/kernel/fs/read_all/read_all.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
-index a8e1611..e9ff47a 100644
---- a/testcases/kernel/fs/read_all/read_all.c
-+++ b/testcases/kernel/fs/read_all/read_all.c
-@@ -59,6 +59,10 @@
- #define MAX_PATH 4096
- #define MAX_DISPLAY 40
- 
-+#if !defined(FNM_EXTMATCH)
-+#define FNM_EXTMATCH 0
-+#endif
-+
- struct queue {
- 	sem_t sem;
- 	int front;
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp_20180926.bb b/meta/recipes-extended/ltp/ltp_20180926.bb
index 622c1f42f7..500ca0063d 100644
--- a/meta/recipes-extended/ltp/ltp_20180926.bb
+++ b/meta/recipes-extended/ltp/ltp_20180926.bb
@@ -46,7 +46,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
-           file://0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch \
            file://0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch \
            file://0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch \
            file://0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch \
-- 
2.17.1


