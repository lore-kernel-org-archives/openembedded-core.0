Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44782.1795622115879426427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 07:55:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Mzh7bAg3;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso79392426d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 07:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622115; x=1796226915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a8YAfOa5kAxj75R1NFcvNx7YmnWhk3fsxERnlNNba38=;
        b=Mzh7bAg3luDTZ4cuJUH+5mLM4Xd+TbjZsb+EBhAgrUX3WdIEPB6YXc6lnl1/Ltvbdv
         rK+tLbukPXc+iNBuP0Du/mDR7qAKISZwUTvosbRjJ6fqjZeln0F5wrOD+Ze65jKxA6as
         yN2A0xHdxCjQ6rjAfIuV/urfKuCxYumaubwxb4QXp6ocwjSaauiwVtFfjiyORZbtzrl7
         lScXGNTbVeYYlmrSy9grfU98K99f9rP8bJ+3cQnZy/S6mQ7VSCQFj0ixrZUxM00hxQyB
         eT3xICZ4AiB6m3fdIT5YAvYgbGt3TZuHnlHwUbtXGB0RYo+eKrBXtxAvDbWQblSqUwPn
         p0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622115; x=1796226915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a8YAfOa5kAxj75R1NFcvNx7YmnWhk3fsxERnlNNba38=;
        b=sPTT6juQJTMhNwGaIfBmfufpqWJqA7q2AwyTLovECjzQyKQtNPw5TNxC+rqg7zV2zr
         bQYE0JNXL6ZQR4dvVm1kjwgfQmob+pVLEUvsnuIUBMN0Z/01lqxMfFiKPT4MBln2g0tG
         ZRQeDnZR+ZCSzqVnZKgfvQcBJtTTqlnK1malIbT0l+ifFV8TXI061puizThTsC+6ldx2
         Vr7bzAvgRxkNeuyksCXQY0VyGxYS+aZ/s9N38AONXTP3iWWd9iMAfi6Z/4FAZvVxDsNV
         h8SH5Jg/ffUcqIuZTPdnep8FqwY8Ce1ZNOKMpHWdlIAp/j1zk02OZqHtJCXqpLJOXyLi
         HVSw==
X-Gm-Message-State: APuU4Z+Cs/pFay2c3D4DdXXAoT9WrGgFYxHEg9GZ4uHzUevUAaRRhfC0
	xKAqVhnvt7OfJDFWUcZnwyE6vo/DJ0ErK8mwCb1VQMWC4z4uTbFpKgZHtSdi9O7hurZ3UDNCnKv
	QT/Vq
X-Gm-Gg: AZFdTZdjqpCrx5cOPKiisA6vXOZ4qt8xRegqDq9LNBhXIQuCWG3Of1xqer7mw16WVc2
	x3nsb3DX/j1jA2g2tFa4XBbh41zIzIqRWCpisrhyudek62uYZvRUqj15RhEKiaHmg5/o9TBZu98
	t2uj+FNlKYoTMLdXSQgcVj1HfUUj8bW1EnpNcSFHosIddDLeVi1JMidbbUj9KTs4ctkZ2sLcIWs
	ElrVHB45YbOLowtwOanT1AaHoulH3XN5/7tJwc30xOsl9xZuBFMO+oxZ0K2GjG9gf8RPogJ8MMH
	A141UVzgH1dGIgYvYafSnjM5s2alnb405FOeIz5ILI/mooHboB0CzqcMyo/any8sPq+oQJsy8wB
	zdum+wbnknIHoauoG0E4RR86sqbmu890XjCRJOZGpeAf1y/WH6w+RNL1Wahl/GdJ/qvAzYfcpC+
	haUo8zoZeNHJ4CDvnEHqo75a6FAPllfJn5Mu0t/5Ifqq73WZxuLMUtdsSPAZcLqezL7npIrbiWN
	5yjXymnmTmCq6Kqw0tOnf/oUQ5wwuGtAPFw3oKwrhgMJq9wLDVWXrD438QMxqsdINVyjKUNYxzY
	PaJvGZ8GD5zy8jO3j0cZchbYi7gbgnvR6yn1ATzSy/bOXMdFY6LUUclqg78QMXQW1R+RyqwR2T7
	frva4bDIu2A==
X-Received: by 2002:a05:6214:5244:b0:921:2840:db3 with SMTP id 6a1803df08f44-921349cefcamr335960376d6.4.1795622114450;
        Wed, 25 Nov 2026 07:55:14 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm167601326d6.15.2026.11.25.07.55.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:55:13 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/6] ptest-cargo.bbclass: improve test binary matching
Date: Wed, 25 Nov 2026 10:55:04 -0500
Message-ID: <20261125155508.3024814-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125155508.3024814-1-tgamblin@baylibre.com>
References: <20261125155508.3024814-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 15:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251200
Content-Type: text/plain; charset="utf-8"

do_compile_ptest_cargo finds test binaries by parsing JSON from 'cargo
build --tests' and keeps every executable artifact with a "test" or
"doctest" target. Since 'cargo build --tests' also builds bin targets,
the normal program binary can be mistakenly installed and run as a test
only to fail because no arguments are provided.

Instead, filter on profile.test, which is only set for artifacts
compiled with the test harness. Additionally, drop the 'doctest' check,
since 'cargo build --tests' doesn't produce doctest executables.

See also: https://doc.rust-lang.org/cargo/reference/cargo-targets.html#the-test-field

As an example, here is what happens with the 'hyperfine' tool when
trying to run its ptests. Most of the test suite works, but it fails at
the end when trying to invoke the 'normal' binary:

|test result: ok. 56 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
|
|PASS: /usr/lib/hyperfine/ptest/hyperfine-e8776e44d98845b7
|error: the following required arguments were not provided:
|  <command>...
|
|Usage: hyperfine <command>...
|
|For more information, try '--help'.
|FAIL: /usr/lib/hyperfine/ptest/hyperfine
|
|ERROR: Exit status is 1
|DURATION: 1
|END: /usr/lib/hyperfine/ptest
|2026-11-24T19:14
|STOP: ptest-runner
|TOTAL: 1 FAIL: 1
|root@qemux86-64:~#

With this fix, we instead see:

|test result: ok. 56 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
|
|PASS: /usr/lib/hyperfine/ptest/hyperfine-e8776e44d98845b7
|DURATION: 1
|END: /usr/lib/hyperfine/ptest
|2026-11-24T19:21
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemux86-64:~#

librsvg test run to ensure no breakage:

|test result: ok. 101 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.16s
|
|PASS: /usr/lib/librsvg/ptest/rsvg_convert-87afefb074698767
|
|running 0 tests
|
|test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
|
|PASS: /usr/lib/librsvg/ptest/rsvg_convert-a76274799d15584d
|DURATION: 4
|END: /usr/lib/librsvg/ptest
|2026-11-24T19:29
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

and rpm-sequoia:

|test result: ok. 3 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 1.43s
|
|PASS: /usr/lib/rpm-sequoia/ptest/rpm_sequoia-51940508e5906e81
|DURATION: 1
|END: /usr/lib/rpm-sequoia/ptest
|2026-11-24T19:35
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index 5cdd1c43d1..73b9e84766 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -43,8 +43,10 @@ python do_compile_ptest_cargo() {
                 #    - test binaries from sub manifest of the current project if any
                 current_manifest_path = os.path.normpath(data['manifest_path'])
                 common_path = os.path.commonpath([current_manifest_path, project_manifest_path])
+                #    - artifacts actually built as tests: target.test is also true
+                #      for plain bin targets, which cargo builds for integration tests
                 if common_path in [manifest_dir, current_manifest_path]:
-                    if (data['target']['test'] or data['target']['doctest']) and data['executable']:
+                    if data['profile']['test'] and data['executable']:
                         test_bins.append(data['executable'])
             except (KeyError, ValueError) as e:
                 # skip lines that do not meet the requirements
-- 
2.56.1

