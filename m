Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45124.1795622908309075925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=LjSmuMuN;
 spf=pass (domain: baylibre.com, ip: 209.85.219.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9213f004a14so72711586d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622907; x=1796227707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a8YAfOa5kAxj75R1NFcvNx7YmnWhk3fsxERnlNNba38=;
        b=LjSmuMuNrtQgr8PmxBOFXps/gSCJODSkucrBPCzBR9pCqMTd2fYTPhoDN73sgacx4Q
         yi5Ap+yMvne4LhZZqt2bqG8wZRrRSEadqIwZtlZ/jLet5wW/oeqRUpqlTcLYnXnevhTy
         RWQullV0vrr5hT1UlrDGlBphJpzsGVj3+gzdIP/Qxjov0lkNX5S9laQUK74w1qecWS9x
         v4BEGpcQyM/4JzNgllPAlavkYeT0vYxp8GwbNKj9HJQVg5LTKi3uNsYWwPa0TC8fNKie
         Tki0hWIcilSAf9UzNAE6Cr5aek00M3EYC+tVFMWmSiwqya5ce2f6CwA+SRDlVMEpmvF1
         kFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622907; x=1796227707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a8YAfOa5kAxj75R1NFcvNx7YmnWhk3fsxERnlNNba38=;
        b=zLmvxbEOcyxn2Nv/au2yMxM4szS++VVgGtJOauNZ126DlJIyUpmmL3laI7NRyoYRnm
         8keMa0bZiz1egc/deW9oMUTOM4WfceFkvEOO6sHPLE0gdUSeuIupkvX8GiznSwR+1OaH
         TF/r202a0CDy039+lHcHvrygacf8EtDEDK8d5hAm9CGqUV84jkFb4LY7a7B+Lrje5N/B
         /vAmSxk9pos8K1hwaSlEU3YvZNKnNylr6xK6ngSJo+rlkB1ap2Y/mVSyViSrcenuEVJp
         VfdzDFVk7tEIr1p20e+ZI2H3zdcVBnbCfvofUdBfh7ikUbTA89G0tezwxUp/0hkoHe/V
         vetQ==
X-Gm-Message-State: APuU4Z/t2pcGv3G0pPcyWFKDEZZNnUHRLXmszWuzUNxQolim6mzWJSLp
	DAXHQmQiuRph28eMFIQRXjoGH9JdoUcierAPJxkpypWp1Lz3cDdWMI1Y5JZDxD8Vd7vqtHgFfEU
	yJYXi
X-Gm-Gg: AZFdTZf/17rddCZCnu2YdVIRjghSPsN9km6k7VpEaIL1Kb+WtgTNxweL7LnVhpMuyqU
	rmBXkCBqfVSLbDpOgUiBnW6F9+tRAP5WKrO9Cy8i/fwzVEMEgjgN0QcFk9cEQsc3/8kDH+OrT26
	uwE36yjdblJ/rjJJduC3fTBv7tYd1PXTU3gkbJ61j/3l3SbO01DpudGWdOvIeseZrN2GWK8zmP1
	UImDC5vUjWIk1UYXRPmujfAylvkeS5PMGHZTYQ9jF0UnqaVlrXHMJjBLakSQ+oNHV6FlZiwt3Gl
	e9qeUXhAcUaTMdTm5Rp+COI1QbwO/sXFDd2KJjqa05FJswoyYaCtV6tGj1G4FlAYeerNfpxBZmk
	Dp+DnWRU0z8em+mncCrrebvPiVyJMaJuvrgAOZ8FyqMoyvZc6ms19+nfP/4Hp7F/v8Rqb0GytQf
	uXio6EguVSr56xj0EoIpZFhO9uhwsgJA7K/ALDPdVFuhK3+FNE8a/mU772AW2N2Cgtaz01t5QcV
	g+M5XOgAMe4PMOvTDbGj4oW10DcpNUwxc7ZXKK41Q32Fx0W128GLWmQbuMfynzK10KKhbcypAC4
	+YKwOHHCi35BLZWWx0IbN5doNX7ObUfzrVjoWRiBkY55LwJS21gdaOV+nHvdBVzhxeRiDA1QRGB
	J7FeT0kseKg==
X-Received: by 2002:a05:6214:19e5:b0:921:5418:607f with SMTP id 6a1803df08f44-92154186169mr204773516d6.25.1795622907129;
        Wed, 25 Nov 2026 08:08:27 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921787f6847sm25849466d6.30.2026.11.25.08.08.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:08:26 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/6 v2] ptest-cargo.bbclass: improve test binary matching
Date: Wed, 25 Nov 2026 11:08:18 -0500
Message-ID: <20261125160821.3028875-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125160821.3028875-1-tgamblin@baylibre.com>
References: <20261125160821.3028875-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251208
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

