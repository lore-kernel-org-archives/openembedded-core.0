Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29839.1793868249786593286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=EnjL0KZ1;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4910b863b84so216412f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868248; x=1794473048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qv9ESuqlDQt+ISdz89ZFx6JdajgzgftsOLtyxoJunJw=;
        b=EnjL0KZ1g7B1xH+sK+tyF204cq6epaNKIKh8NbCgwUjR+IsfWGJ5DylOMKTUkIDeiB
         bs58ECTDORxifHUtOyo3LUgFGw+6KIXNCyzjl0kWRAz8sS3Vpt4okxWjxqXMIhyreo1J
         VMbCCS8jOaGuLh6x2xDDGcJtaqUtxdQmpJqZ7KFLiTQvFu3PRtHh6HzQM2ybR1u84laP
         0I7+LSp/aJJ/3o8UQZp0gwEzI8wtRotVVaSezs/feH8hvzk15MVPLil4AaLAdvZrOc4d
         Kfto8NpOt644bEgHM7MuScBGyMHvo4chQ4mD6Wqmig0nqsQFo5g0mg7r/IpnNcJzE19r
         PH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868248; x=1794473048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qv9ESuqlDQt+ISdz89ZFx6JdajgzgftsOLtyxoJunJw=;
        b=x61Eju+l/g8FAhi2lmN9rznZx+B72Gg/s98yJYE9igA1C4kAZTtUiDRDaVXnIvZ1XF
         de3fw20hcNkFQbr8Qr9A4svfBacyDGw68Y4YPAD0HucRFpUZhOHClsUDnVZH0PSFqlUy
         nbyLmVG6gMTo9dvSfBfogDG/aKynEIvxyUfyeypf2XGqpEB/Sj+z1179shPDyG/VeOhP
         foQYoeJ8MBNda+1MF2CgW5GLPlGsV91W9Hzch3xbJj79NfUI4DU+K+PfnW03TRzr3XVK
         hjD2pbzXUpE9xBdVTXDtZ7wr330qZTv/3HgrDqWP5Uxz/MHQR7EBL/n5gZuVCEbqr7qC
         hdgg==
X-Gm-Message-State: APuU4Z+wEUMJxMlJ7xaO280enRysVM6y3z8W5+A0RzrzabFSc800Fqtr
	SJUfNNbbLTqhzphvVWvwLV7iEim71weEWts1aUWsBzqTzKqza2xoybVEXwSDfp9kRNzNZInIGSD
	v6gWimh0=
X-Gm-Gg: AYBFou1DUJJk16T8gaYuIgqcJQiUVfZ3hU2H8eloqpI59PTn3pkMpxWG0Jyjh166SCP
	Dg5earfJOSRGWoSL4MCPVKoZxfnVImLLjaZ9lDMxE5i5Xg0sjyFxvCEwUcpuUrVFTIe4OspIMxG
	dwdnLub1Z2i1Ed+OwbvVM32D6pDYFJ8HZBpskFg4OZVo1vJ1vBeWIWeTDJr6NWEOI6SxaAWROKg
	38KswMeITX1Ree2PayZvYO/bt1p5rhpA6XSQZAiHK3Z/pIBc//SrcrLAdtDFknF6JI13MLpjViN
	oWX9uNaVikCKSRFhKETSQZEY+NjCP5IkwBh6T78plVChwxBA6IBLvml1HVUsDdY2wnLlsAA1eRy
	U62yz6v3t3pMC+QG+TWQXK9JkjlwX8Xcns+rF99DXrbdVMyYfJ9a2We3/CVSjiID7J8FNba3oyj
	viPC2nh6/N0lNu0WVQMFtqtkNjPaJUowdizTJoOrBJytV4pZ1PcqZndhgxgs23IM7yEHlZzQ7Af
	aSVzfpevY7tjejF9PJQWpBwRW83GcILE6zfWFK9xG5POGCbrnaFY/vxyTlR/870VUS9pKNqnTHh
	UwpX12Me6tVIlxX1zyO7WWI2QpJC5OliOc5ZWBwSaHBNkp1a+m9EBv8jlRtL58LwbVhqy3OBnjs
	BIta50hFyK90Tg/itjv6gsKHDrEzt
X-Received: by 2002:a05:6000:4010:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-49119afe9d3mr3295020f8f.16.1793868248056;
        Thu, 05 Nov 2026 00:44:08 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 57/60] python3: ptest: skip flaky test_shutdown_no_wait_max_tasks_gh119592
Date: Thu,  5 Nov 2026 09:43:16 +0100
Message-ID: <0a02733a12e2ed9f6bb8b179cf73046d056178ac.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249516
Content-Type: text/plain; charset="utf-8"

From: Pratik Farkase <pratik.farkase@est.tech>

This concurrent.futures ProcessPool test starts a worker and expects it
to be stranded within a 30s thread-join timeout. On loaded autobuilder
hosts under QEMU emulation (seen on qemuriscv64) the worker process is
slow to start, the managed queue get() times out and the join exceeds
30s, so the test fails intermittently. The upstream test is inherently
timing-sensitive (CPython gh-119592), so skip it like the other flaky
timing-dependent tests.

[YOCTO #16466]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e00e7b070ad5649e382ba9160b2994edf48a02c1)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recipes-devtools/python/python3_3.14.10.bb
index b870a3defe3..35d3491098d 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -356,6 +356,17 @@ SKIPPED_TESTS += " \
     --ignore test.test_asyncio.test_eager_task_factory.CEagerTaskFactoryLoopTests.test_staggered_race_with_eager_tasks \
 "
 
+# Intermittent failure under load - this concurrent.futures ProcessPool test
+# starts a worker and expects it to be stranded within a 30s thread-join
+# timeout. On loaded autobuilder hosts under QEMU emulation (seen on
+# qemuriscv64) the worker process is slow to start, the managed queue get()
+# times out and the join exceeds 30s. Upstream test is timing-sensitive
+# (CPython gh-119592).
+# Bugzilla YP 16466
+SKIPPED_TESTS += " \
+    --ignore test_shutdown_no_wait_max_tasks_gh119592 \
+"
+
 SKIPPED_TESTS:append:libc-musl = " \
     -x test__locale \
     -x test_c_locale_coercion \
