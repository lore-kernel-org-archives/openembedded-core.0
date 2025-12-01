Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29983D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 16:32:11 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25759.1764606724214484488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 08:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0PTfP5aF;
 spf=pass (domain: smile.fr, ip: 209.85.218.50, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b762de65c07so88863266b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 08:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764606722; x=1765211522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPOLotiLY9x+9e8VJGnRhVFCIDwZssgja6Gg7H7luMA=;
        b=0PTfP5aFfCmNYgF1yPhiYA+ooELi9QhUBBAqOzc4urbZnj8od13mVk1oaemzHKX+gC
         NuPyo7yx8l77iHwN03IDCu+nHQgYLSnNC5Yg5kXby8oFpkzRCfqbZf+3djHSpMpA4HpY
         feua6Aej4juhpmINQfNzRi7Y+6QtDOzCjAj78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606722; x=1765211522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kPOLotiLY9x+9e8VJGnRhVFCIDwZssgja6Gg7H7luMA=;
        b=b7sNm28WthEI7iEPeQG27ZBvOSMTHMQ5KHsIagO1mNoLlpaTJaINCc/8Wdd9Ixghfs
         FLqER9AKqauOTvGGpciOruDOU1v7yCcoem8PU7fzB+8G8Oe88CbiUxF0/oMLJJ/keAFo
         Hj5fsIL9EKDvUo8vpvXrlYQxIirFHpnfaJH5fujvpadi6382CpPQ8FO2ao3n34KtINPe
         irckOaPalHM4fZYLi7f4ke+SnJDPo/jXWtTfnqHaIlruBVoaMV2RlVQQd4rEUdTelYIL
         x79XE36XTHzdOrwVX1nfq0aOL5dOOqhDZwFQExhh1JKBb2Lk/7tLYi+Zi7SwU6ePhv5J
         tYhw==
X-Gm-Message-State: AOJu0YzzxGztA6gY8hMCS8vqd2JQWRluqLaTek6wOmweyBk3eE4Lbmyh
	HtKA1hTLoJRx9W43vJaiIg7JYqqPJBIR4DXIoZ6jUhvDN+tuNs4ZjrJFD7sWGyO8LxTVTXSipvd
	mph6V
X-Gm-Gg: ASbGncvgJVEVcaO7tX7epC2X0QFMGms9lqDxQ3NniJ7Na1baYzwIjobyHcMjDk2cgrV
	x5s41jLxvw0QE5RB48//IAXfNky67bffc4Kb34LVZrKUvRuiWr5TBX9aap4z6eLbC2kLt/Wgikh
	MK6WeAALG4oDalcAqOHMSghlxErSWnQ9n217JvcyQa80XBBCqP49WhAhW2os33T9gWDiJDed4D2
	CTNA1+L89w6S2YG6hV4hLfazx5UJuTC4E4P0RzpI1jeYrEMvQ71R7cWWAPNQdpg7QHzx+Cf5ifM
	+n275aKMoYPseQgAWlvlyvSrPow6xaiLppMvr+S5CL6WhF6TSr2Er2L7Rq6VCmRuFcj1zM/fcp3
	2XnaR7nLoAxI+qPtQvLaEv7M0lruyk2FZcPyMQ2cUWdnWcex5JWsG5NyAtfkaAtJcdVeh1xH6pS
	W7Rhmw4d4KNxIcnBx5wR8VfimnjlFVeQjdYxO09iIAoBsWV5doObNGNG0u+qTBNYiBIEid3DckX
	4QstfIeYhm2K6SNfi84Ln0=
X-Google-Smtp-Source: AGHT+IFl2YgXBfSeCO18KWpl9PLoYLSMXasJl07KlIJTsnLPE2RmuVQpn5STdnzIJ0W1FvxpqXBOTQ==
X-Received: by 2002:a17:907:608f:b0:b73:4aa5:35e5 with SMTP id a640c23a62f3a-b76c546d3a8mr2789061966b.7.1764606722332;
        Mon, 01 Dec 2025 08:32:02 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-3d1a-8466-8f7c-672d.rev.sfr.net. [2a02:8434:8fe1:4f01:3d1a:8466:8f7c:672d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d45sm12980290a12.8.2025.12.01.08.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:32:02 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [PATCH v2 6/6] patchtest/selftest: Ensure HEAD is attached before running attach tests case
Date: Mon,  1 Dec 2025 17:31:00 +0100
Message-Id: <20251201163100.143476-6-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
References: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 16:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227134

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

If the repo is in a detached HEAD state, create and check out a temporary branch
to attach HEAD. If the branch already exists, the error is raised via run_sh.

Add a check to verify that the Git state has not changed before and
after the test in the attached HEAD.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/selftest/selftest | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index c85d59c415..5f742a85ed 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -120,6 +120,9 @@ def is_git_state_same(before, after):
 
     return ret
 
+def git_attach_head(temp_branch):
+    run_sh(f"git switch -C {temp_branch}")
+
 def git_detach_head():
     run_sh("git switch --detach HEAD")
     assert run_sh("git rev-parse --abbrev-ref HEAD") == "HEAD", "Failed to enter detached HEAD state"
@@ -136,10 +139,15 @@ def test(root, patch):
 
     return results
 
-def test_head_attached(patches, counts):
+def test_head_attached(patches, counts, branch):
+
+    git_attach_head(branch)
+    git_state_before = get_git_state()
     for patch_info in patches:
         results = test(patch_info["root"], patch_info["patch"])
         counts = analyze_result(results, patch_info, counts)
+    git_state_after = get_git_state()
+    assert is_git_state_same(git_state_before, git_state_after), "Repository state changed after attached HEAD test."
     return counts
 
 def test_head_detached(patches, counts):
@@ -159,10 +167,13 @@ def test_head_detached(patches, counts):
     return counts
 
 def run_tests(patches, counts):
+    temp_branch = "test_patchtest_head_attached"
     git_state = get_git_state()
-    counts = test_head_attached(patches, counts)
+    assert git_state['branch'] != temp_branch, f"Cannot run patchtest selftest while on branch '{temp_branch}'"
+    counts = test_head_attached(patches, counts, temp_branch)
     counts = test_head_detached(patches, counts)
     restore_git_state(git_state)
+    run_sh(f"git branch -D {temp_branch}")
 
     return counts
 

