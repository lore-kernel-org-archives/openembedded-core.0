Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7BDFF8844
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32591.1777064220068845443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DPV2CJhS;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso82270215e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064218; x=1777669018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAUvwJIi4XVr6s/3tpJnxmEUgf6tU4r/wcS4txJ3vak=;
        b=DPV2CJhSU+UrIeZyLm0th55tUyuu+vg+kKV3kj2wWYg5XnspDQWvHln0t19TO3H8mN
         CsQFS8eg5g3UnPZInNXMdSZg144TEzLLN1CxSP8oVXQPxxUNbS/mA3XyVoTFIAEINWhO
         0T/F/c6QOkOiu3qu76IO7YaMlEX6KmusPxX0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064218; x=1777669018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WAUvwJIi4XVr6s/3tpJnxmEUgf6tU4r/wcS4txJ3vak=;
        b=N22gSRNnvYs47m3Ef8lKBbsO95AF3208/qYEyM5ysJB1zxKvTapMzvdarp+PUpJHy4
         FUOGLBMW+OiwbvaZj8T9UpwMQyZOjYQVAHbUqwPaW1asGNZiNkFr4sNAiHsFRCa1gLWP
         Hfbj9VjyPt9zjrPslD8FJmwhurefniAGqdjBHM0tCjkhNjdFfAKOos0GB3SJ+yI8d4h4
         UUZopHFt6xNnSjHENZ70uIA0Xal3Xlt5gvOwHKKheln2wcrRdD1/jk5wxAbXcyVDz3zm
         WfK5cIv/b5+tKn+d5YPA2wIZDIcN4gms3enwplluHHh5oBwgVU7KH/XHr3yKQfJ7D8Oe
         vHdw==
X-Gm-Message-State: AOJu0YzdB9EvDQBEXRFan2L62XyEkqLIS6d6r3i+URgimH7zIOMK+IzJ
	JimrYIprWcUPugO9sapBUox/HQsBrUZE7SwQY1FZoIAe8iobA0D3ib88j7roDLgscXJsZ9DBgxj
	hYOxOZKEMiLGV
X-Gm-Gg: AeBDiev4zj578nojcgRcDFJ/q9hvV6jeYv9qMgsyQfmrVK9Vk0+br0z5kqRI4bRLnEE
	AtAd8FymH4tsQYPSK/Fzl5t414xKQS6BoXlMYZVXGCh5ryT7XXtIzfR+PETgqM3l+Xib3bYNQhh
	OqeXkWVzK3NLDX2BiGJFusPqSrjyKE98uWTXGVJOHt7/CSs6s3DBL6stYwXE4fSaNfG2/v87g4l
	pe2Cw44rnP/TZFDIg1NUxlqdgC6WfTdmgzvl8ntnH7yIOHJNBCiEqwHsM47o/R2M009O+Vf+LPJ
	TqqdmWZUOzGZhk/SOXGL9jIugIdYsgjlzIC9kGYORETyMgLpsjH/JWDjNx9YzhYtwX4nJHiCSTi
	L/0NoRqFEKi4pqyVNiED/ZAMItCBDKgBPmNHbQKjc8CrAcX4OeQcmfmquhzP3bDxtK0X5BIMYg/
	cR8s2dJn/b3zhi7HoSkUc453l3RA8Rnq40UxntHx4AEGxWfnwvIzfa42bRg3HT8d9qVLwWFLD0w
	T8kHQtAeYDJJIYh8z4jefnI0G9tQ7x416bGbw==
X-Received: by 2002:a05:600c:1993:b0:489:e696:836f with SMTP id 5b1f17b1804b1-489e69686a7mr307350265e9.10.1777064218195;
        Fri, 24 Apr 2026 13:56:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 38/66] ltp: fix epoll_ctl04 failed
Date: Fri, 24 Apr 2026 22:55:37 +0200
Message-ID: <02ee34a255573789d1baf7ec080bf30e6e34b2ba.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235911

From: Li Wang <li.wang@windriver.com>

backport from ltp upstream commit:
https://github.com/linux-test-project/ltp/commit/e84f0689cf7a8a77478a0e70aa62560f66c3bceb

the related kernel patch was already merged into yocto linux:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f2e467a48287c868818085aa35389a224d226732

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...l_ctl04-add-ELOOP-to-expected-errnos.patch | 49 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-epoll_ctl04-add-ELOOP-to-expected-errnos.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-epoll_ctl04-add-ELOOP-to-expected-errnos.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-epoll_ctl04-add-ELOOP-to-expected-errnos.patch
new file mode 100644
index 00000000000..203836a5f66
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-epoll_ctl04-add-ELOOP-to-expected-errnos.patch
@@ -0,0 +1,49 @@
+From e84f0689cf7a8a77478a0e70aa62560f66c3bceb Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Tue, 5 Aug 2025 11:27:23 +0200
+Subject: [PATCH] syscalls/epoll_ctl04: add ELOOP to expected errnos
+
+Kernel commit f2e467a48287 ("eventpoll: Fix semi-unbounded recursion")
+added an extra checks for determining the maximum depth of an upwards walk,
+which starting with 6.17-rc kernels now hits ELOOP before EINVAL.
+
+Add ELOOP to list of expected errnos.
+
+Upstream-Status: Backport from
+[https://github.com/linux-test-project/ltp/commit/e84f0689]
+
+Link: https://lore.kernel.org/ltp/39ee7abdee12e22074b40d46775d69d37725b932.1754386027.git.jstancek@redhat.com/
+Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Reviewed-by: Avinesh Kumar <akumar@suse.de>
+Tested-by: Avinesh Kumar <akumar@suse.de>
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+[ modify TST_EXP_FAIL2_ARR function parameters ]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c
+index 955959b6b26..feb49623b15 100644
+--- a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c
++++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c
+@@ -51,13 +51,16 @@ static void cleanup(void)
+ 
+ static void verify_epoll_ctl(void)
+ {
++	const int exp_errnos[] = {EINVAL, ELOOP};
++
+ 	new_epfd = epoll_create(1);
+ 	if (new_epfd == -1)
+ 		tst_brk(TBROK | TERRNO, "fail to create epoll instance");
+ 
+ 	events.data.fd = epfd;
+-	TST_EXP_FAIL(epoll_ctl(new_epfd, EPOLL_CTL_ADD, epfd, &events), EINVAL,
+-		     "epoll_ctl(..., EPOLL_CTL_ADD, ...) with number of nesting is 5");
++	TST_EXP_FAIL2_ARR(epoll_ctl(new_epfd, EPOLL_CTL_ADD, epfd, &events),
++		exp_errnos,
++		"epoll_ctl(..., EPOLL_CTL_ADD, ...) with number of nesting is 5");
+ 	SAFE_CLOSE(new_epfd);
+ }
+ 
diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
index 18c64392839..ec31c985445 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-scenario_groups-default-remove-connectors.patch \
            file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch \
            file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch \
+           file://0001-syscalls-epoll_ctl04-add-ELOOP-to-expected-errnos.patch \
            "
 
 S = "${WORKDIR}/git"

