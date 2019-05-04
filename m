Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 11BFB7D9E0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:35 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y3so4173919plp.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1jsZQqQqBCbqayIAk9D3Tr4IftKWhEAeeHpoOjF6i40=;
	b=RAtO87IjsXiZQP/xV7BZ+lT5Pmi7Xhk1dhYTEZg5S84wLMlfzTevuchZBPasfQhusy
	YC+Y59IYeroVCwxx6MdvVeAv5ncbgeNZmCXfKWIEVjSU0bbiP2sojtOPSaxRHBXmJAqs
	9hn+w2xWY0tvYi2QPMXM5KnkC8X2EqdTiWVCQSqZBOHwZm4h/6mGrd3RjpYdcKUCGTwW
	UdTF70uC13rHhqLae0nUr7OE5qbVrozA3CbEeFpjrFMc+SjV40ds8cnOqonAP9yyvjtl
	X8xXFe5gvyx2MAzf+K5JpAMftiuAE5l1McYbnPwWeZssQcOT8RoFRIfnsnVK2yolUgF0
	1QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1jsZQqQqBCbqayIAk9D3Tr4IftKWhEAeeHpoOjF6i40=;
	b=YDkzxJBDodhO3GjMMcLpxzcdLBe5WXBOUHpY1hx62JgAf7On63Ah6eMYL29680q5la
	6/EH1wFxanmnuXM/omj32eTtwo0xxTlh5+4gxxlUWOfF5NEI2fVYgGAtVcBcwyV54k7e
	k7uOk4UIkqbHOL5vyfahEA0splvRltp4/pmJQQXbHzZcz9QO8G+BMjniDpy7rUCqOZhv
	niGvV+ugNdxUjmkzgjFaV4EmB8Zu+zunLrL61aSVePdHs39WAm8psdvFMNCkX7ZWCZgy
	oGHsPkZ4QM+kC+7R08roqRMks1ijcMdx8cwUl/w7QTylbISGDcAqa8gbb/TzoQ0vzJhl
	H6tQ==
X-Gm-Message-State: APjAAAUuRSwhq1rgeaz8j5MkCUCU01R3l9INaNLOo/GDrluIxrk4n2q8
	UU7cLawn2cXU7HcryrgA6qpSkxHG
X-Google-Smtp-Source: APXvYqz1J5ZxIBC7NndHt/ycT6AK9q5mrWGgK6ipowrsXjuNNJIDfVM1Wi29Cyo6QUHQUQfgAKTwjg==
X-Received: by 2002:a17:902:521:: with SMTP id
	30mr18879319plf.248.1556983657067; 
	Sat, 04 May 2019 08:27:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:47 -0700
Message-Id: <908173cfbec631139283f3b35be03865eb7d73b1.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 11/43] ltp: Fix setrlimit03 call succeeded unexpectedly
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
X-List-Received-Date: Sat, 04 May 2019 15:27:36 -0000

From: He Zhe <zhe.he@windriver.com>

Backport a patch from upstream to fix the following error.
"setrlimit03.c:54: FAIL: call succeeded unexpectedly"

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...trlimit03.c-read-proc-sys-fs-nr_open-for-.patch | 70 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190115.bb          |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
new file mode 100644
index 0000000..39623c3
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
@@ -0,0 +1,70 @@
+From db57ddc1497e72947da2b14f471ab521478ef99d Mon Sep 17 00:00:00 2001
+From: Tommi Rantala <tommi.t.rantala@nokia.com>
+Date: Thu, 31 Jan 2019 19:49:00 +0200
+Subject: [PATCH] syscalls/setrlimit03.c: read /proc/sys/fs/nr_open for
+ RLIMIT_NOFILE limit
+
+Since kernel v2.6.25 RLIMIT_NOFILE limit is no longer hardcoded to
+NR_OPEN, but can be set via /proc/sys/fs/nr_open, see kernel commit
+9cfe015aa424b3c003baba3841a60dd9b5ad319b ("get rid of NR_OPEN and
+introduce a sysctl_nr_open").
+
+nr_open default value is 1024*1024, so setrlimit03 has been passing fine
+on new kernels, only "unexpectedly succeeding" if nr_open is set to some
+larger value.
+
+Signed-off-by: Tommi Rantala <tommi.t.rantala@nokia.com>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+
+Upstream-Status: Backport [db57ddc1497e ("syscalls/setrlimit03.c: read /proc/sys/fs/nr_open for RLIMIT_NOFILE limit")]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/kernel/syscalls/setrlimit/setrlimit03.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/setrlimit/setrlimit03.c b/testcases/kernel/syscalls/setrlimit/setrlimit03.c
+index 29b52aa..12455fe 100644
+--- a/testcases/kernel/syscalls/setrlimit/setrlimit03.c
++++ b/testcases/kernel/syscalls/setrlimit/setrlimit03.c
+@@ -35,7 +35,10 @@
+ # define NR_OPEN (1024*1024)
+ #endif
+ 
++#define NR_OPEN_PATH "/proc/sys/fs/nr_open"
++
+ static struct rlimit rlim1, rlim2;
++static unsigned int nr_open = NR_OPEN;
+ 
+ static struct tcase {
+ 	struct rlimit *rlimt;
+@@ -51,7 +54,10 @@ static void verify_setrlimit(unsigned int n)
+ 
+ 	TEST(setrlimit(RLIMIT_NOFILE, tc->rlimt));
+ 	if (TST_RET != -1) {
+-		tst_res(TFAIL, "call succeeded unexpectedly");
++		tst_res(TFAIL, "call succeeded unexpectedly "
++			"(nr_open=%u rlim_cur=%lu rlim_max=%lu)", nr_open,
++			(unsigned long)(tc->rlimt->rlim_cur),
++			(unsigned long)(tc->rlimt->rlim_max));
+ 		return;
+ 	}
+ 
+@@ -65,10 +71,13 @@ static void verify_setrlimit(unsigned int n)
+ 
+ static void setup(void)
+ {
++	if (!access(NR_OPEN_PATH, F_OK))
++		SAFE_FILE_SCANF(NR_OPEN_PATH, "%u", &nr_open);
++
+ 	SAFE_GETRLIMIT(RLIMIT_NOFILE, &rlim1);
+ 	rlim2.rlim_max = rlim1.rlim_cur;
+ 	rlim2.rlim_cur = rlim1.rlim_max + 1;
+-	rlim1.rlim_max = NR_OPEN + 1;
++	rlim1.rlim_max = nr_open + 1;
+ }
+ 
+ static struct tst_test test = {
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20190115.bb b/meta/recipes-extended/ltp/ltp_20190115.bb
index ddf97e2..1d0c00b 100644
--- a/meta/recipes-extended/ltp/ltp_20190115.bb
+++ b/meta/recipes-extended/ltp/ltp_20190115.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
            file://define-sigrtmin-and-sigrtmax-for-musl.patch \
            file://setregid01-security-string-formatting.patch \
+           file://0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


