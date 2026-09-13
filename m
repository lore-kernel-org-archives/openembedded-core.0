Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A4DC88E65
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:12:05 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5998.1789330322120551258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RHQUOMhQ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so10943535e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330320; x=1789935120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBzj5Dkpua9fvLKs8RduWNo9AAi/1V+qxAbjjasiBjE=;
        b=RHQUOMhQx3alVyf7Ht1HUkpMbx+CHqHf8u6zSpmkcGcl3N6Z1dybq/iDiFv+BM7JY1
         SBt3ivG9h3XwFvqXkF7hh3dE/YX0GvJFn4ATMLEbHVB4oMB5m74PmQ4eaiHWK7qgn3vZ
         UD0Ava6w0PsMC1jgR2ZPHWVdLUQ1SoJUhDgT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330320; x=1789935120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WBzj5Dkpua9fvLKs8RduWNo9AAi/1V+qxAbjjasiBjE=;
        b=T7luJcyhmpb0tvV3xTvWwGohKR5K7b66R3eOrUBvfhVhkJhYFGjSmDqzcY/8YVc/FX
         hnbxfFtpvkrg6fkFdOZkSjVZhoTzuSgOstIrh/X2dfBL0gjWx2I4qQjttLJ77ClnSGdh
         DGWsyuaAIgL1VpQzFZ9GvwrNlkv/lW0UIgaNH6Repx5VTGFNyakl2SZElphLxIRSF7Dq
         TSE7WyrMYdpEy+KooC5nmSCQHlwZzSkQ9q8G1AqabznXjYdIx5zm45VdS/kDIKrYf7x/
         kMSy+EiC0VL9WNGJ1qSVIuCrS2q3LaNMxbuwp1K2LmOOaefuY90QAX+2Y2IyQ8SShbw4
         sDFA==
X-Gm-Message-State: AFuF++kWrSbXleF6C1rYO/I7jaFN+VrS8BbRPszCsSqBlq4unbArVOo3
	Qnv1oftJtAI8Bw2L8UA0RoNXNsqU0681wtWpcKCQtA61n7PmBtmuj6XOEa3PphKAVOKCEegIj/5
	kkbhNpIs=
X-Gm-Gg: AYBFou1sX5K9D0Z3Xf1/qjtS2GiJqe3tC2f17hL9DT6WXZeCycUhb9XWb/RHVZ+gIZO
	JQo/qiLGZybmH1TgPETKU03SeXTclOA82Dm9dHEToVnrpCGBUbIg2M3sw/EZ9cPfSgQoVirUE1E
	wOucEyUVqiyUsrDaQhqQ/p8MBSTf3dS6r0iumnyPu/5pO3j7iotQXYtVCoTcCCzPRczRQpEjPQU
	Ppaao8YRfHfakNGam5vmoiJ9IWrEApKuupFVHIKJcOo/o4sKV6Vl+D9Btbzl2cLLiqBwnL3mdTT
	ZUcaZYPPMk9ctPicK07EKTgLR+ct50khbAjoiC4OPG8k1RJ74QT6neE0Grt5euWb2ptf8iJfd2q
	Yc2A/XovLudaLJFJeHqxlMtb2kcM6gP0z6o15XJ64CAGKDW2TAOz4Rg2SZvYaZVkFrKOvenN6g+
	QcYMzWXtMiOzylKLk0mVIJEkmh3MoOtelP7Nv3UAf4/ezo6N6ill5O8730zdKw2JGVEeFa8Ip3e
	HIJsiYQejo7tknnjqQPtxZAaMXz
X-Received: by 2002:a05:600c:3f16:b0:49d:25b0:cc60 with SMTP id 5b1f17b1804b1-49e6cc13c99mr88225245e9.29.1789330320276;
        Sun, 13 Sep 2026 13:12:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm21613916f8f.19.2026.09.13.13.11.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:11:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/11] gn: upgrade to latest revision
Date: Sun, 13 Sep 2026 21:11:48 +0100
Message-ID: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245728

cfcd774b Header check: avoid interning paths during include lookup
0625da07 Improve heuristic to disambiguate recommended dependency to add.
f9997211 No longer automatically add files to public.
e095a1af Deduplicate deps/public_deps and sources/public in gn edit
c0e4aae6 Preserve toolchain when generating suggestions in gn check
5df47e55 Use ReachabilityCache to improve performance of loop detection
28fc4470 Support `target(target_type, name)` in `gn edit`
3163718c Cache reverse dependencies for dependency exposure.
8288110a Skip attempting to resolve known files as module names.
5b0f8830 Cache file path -> target lookup in `gn suggest`.
4f6a76b6 Make `gn edit move` idempotent.
356ee8a8 When re-running build/gen.py from ninja, preserve environment variables.
7e0a9f67 Implement pretty for several more types
16d3d2e2 Ensure `gn edit` follows the style guide for variable ordering.
7826279d Simplify code produced by gn edit.
1c73f622 Support setting expressions in `gn edit`
f73e445a Revert "Write to ninja files via a standard API"
8e99cccd Write to ninja files via a standard API
02564b48 Use move instead of add where suitable when suggesting fixes.
a99d46a9 Fix EditCommandTest.ShardSubcommand
a6f2c97a Support public_inputs in gn desc
4cf50b37 Update `gn format` to always insert newlines before targets.
150a9d6b run_formatter.sh: Warn if `rustfmt` is not installed.
d71c4a70 docs: Document that copy() uses the toolchain's copy tool
c1b66378 standard_out.h: Add ScopedBufferedOuptut class.
664f3e63 Support public_inputs in group targets
deecdc59 Run benchmarks serially.
07014ca3 Write benchmarks to out/before and out/after instead of out/
a6473d48 Add jj subcommands to easily compare revisions.
e10143e8 Add `build/gen.py --gen ~/chromium/src=out/Default`
d0aec586 Create a trace comparison tool to evaluate the performance impact of a change.
c7ffaf80 Allow host_os and host_cpu to be accessed in .gn files
e0a6ab04 Implement `gn edit "shard"` subcommand
b1da1218 Hint about --fix/--apply when running without them
2fc5f9e5 Add support for creating new targets in `gn edit`
58933a7c Support cloning of nodes in the AST.
f3d7a0c8 Mark NOTREACHED as [[noreturn]]
2481edf5 Implement `gn check --fix`
f0be464b Fix gn suggest adding self-dependency loops.
d2e84fac Add a `gn suggest --apply` option.
39e3f7ad Add `gn edit` suggestions to `gn suggest`
c6cffd45 Implement `gn edit "rename attr attr"`
bc1914cf Implement `gn edit "move attr attr value(s)"`
167116e0 Implement `gn edit "add attribute value(s)"`
1c79e13d Implement `gn edit "remove attr value(s)"`
e8a8e093 Refactor parse nodes to support non-const access.
24800a7f Implement `gn edit delete` and `gn edit remove attr`
0db00fc0 Implement `gn edit` command, and implement a simple subcommand "set"
d5594ca8 Add features to test framework
152bfad2 Implement a Result<T> type.
6b0190f7 Fix formatter on main branch
73243639 Fix path to build/gen.py.
d1996a79 Add pre-upload checks into ninja targets
64cfb834 Add --exclude-type command-line argument
925dd782 Add CQ to starlark branch
a01a5a9b Refactor main.star to support multiple branches.
f9cea148 Implement rule implementation execution.
3a817c2e Create a simple session type and create a test for it.
37ab73c2 Fix lifetime of starlark struct keys passed to C++.
4ac29005 Rename .bzl to .scl in accordance with design doc guidance.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index eddbbcdf7fb..6e8626dc32c 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
 "
-SRCREV = "17b0057970fa2b07a20cbb4289ab78cf93565f35"
+SRCREV = "cfcd774b98f3433e18b722f9a7ff06119825b8eb"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""

