Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4330.1794732563917779030
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V2VKZLyV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1076594f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732562; x=1795337362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B/0tz25vN1/Ofwx0U7+mK/59nh+OfmPdP6QWpm3Z0gA=;
        b=V2VKZLyVWgXW2azz793PyNc8q/8D/vd0Fq1EIMGHC/P0CJJgJizcajjLKUlgdTZIAL
         2s2hzqg8onBS8jQQABzpMzN5kBFxGkufbYILaaP17QZ+SU7joT5arUP1UdTAYgD38G2O
         4WoIt84v7tMDdspa2TlZm7qZWnuSVp3zwpmkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732562; x=1795337362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B/0tz25vN1/Ofwx0U7+mK/59nh+OfmPdP6QWpm3Z0gA=;
        b=K/cETeZfm89aV8psOnZzf2rBoPeti8yyEm1YQ86pF/QWD22rqdsP8RDOyOf7S7aEYi
         U4NLv62boaT1KUVtnp8QNtEd7uiZYxgYMuRDVEbleozg2yeuesdb7ot+k9x8rQdV07Y2
         KqWvP3M3cR52kTX0Fz1yl1P6XUNc6FZsgl1Tj6bId9GtYb5mKLRRCfjoPCUkkjnMxNbt
         lPJOBTqX1WobGHcMxaQ6SI8YA0PDHzcR0o1Vteh32x8/HF8HbjDt8ODTAJeSh8+ZhTMA
         f3u+6v+S47ZDIr5KwoygvZwAyA7oGA5PeSsaYLPPFCUPEjGlDENVD/cbHee9EXEg5WyB
         b1hQ==
X-Gm-Message-State: APuU4Z+M5HQpalO9nC7WL/ssxAEPgxJ1PudznHcBwosOuGRPZ3r7716j
	ys/S/uovvJNoqtQ+wpNYZixlpBJaEFZZ19UiL+bVC0w1fv12shgC6WfxQznizQITMNNNGAygAjW
	RF3y8Gu0=
X-Gm-Gg: AYBFou0IwwArSu0rqSBzKnJCDyT8zF3Fu145WBgF1Uul80ApTKcfphgaMKdB1sn5B4Y
	rULhe61Jb47sAe0/Wuom57yIGuU4rnCVwWn19hAsrfikC8E0VJZIMCBIDvzcmQRkG4oOjU6EqRC
	5T9XKwqcnKJyf6dvieZ7aFzKe6T/V2Sq8QF2sIgte9kc6YN6Tzk5Pvs9a+nE3h+ESrZBgLhgy/l
	A3sb3VqYGMqOJf3WmSHcmbc2X7lsM9xcU10hpgIgulnvStFGHetOTXiCq2OvX406e5yla9ruL6C
	AZ9ZhgJ2r0T6m26P5VMNuz6JlFCyL+IK0Gwu3uZYbI5GwfvxkEDdsZYVgoGbJzOPwok9E3W0VTb
	yOHbXnkD8ciUsIjSB4XgCDTJJhDdMw4Ok7rAR0gqKFdMaTZHOoILuTWII6/Iz4cp22DOQ2vFsdi
	FoTWog/Adv3MPdoZhwDUvyoIl4DyomYivWDdXFda8udLwxuA70x4l5ZX5EzShW0Mzz0Wb6Ok+xZ
	L8Lqd1gASwrs79kqW5NdCzvJFcuRDYKcsXFxaUXxymew5jf7GBATLLlEBpi1tzVV9t+BcuhWxIF
	tNANRNYAvahXX++BiVK9Lg31wKZ33Oo1LRLr1B8wbF/mFk3nRrdpdWfq+4Z3DFYTtbDr13OiCSO
	G3i4=
X-Received: by 2002:adf:f14b:0:b0:492:dddc:64c3 with SMTP id ffacd0b85a97d-49c742a6580mr12403489f8f.41.1794732562188;
        Sun, 15 Nov 2026 00:49:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:20 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/41] oeqa/core/target/ssh: Fix TimeoutExpired reference
Date: Sun, 15 Nov 2026 08:48:24 +0000
Message-ID: <20261115084845.701136-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250252
Content-Type: text/plain; charset="utf-8"

TimeoutExpired was never imported so if the ssh process failed to exit
after 5 seconds, the cleanup code raised a NameError instead of
killing the process.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/target/ssh.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index e380fd84854..03e99e68234 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -296,7 +296,7 @@ def SSHCall(command, logger, timeout=None, raw=False, **opts):
         if process.returncode is None:
             try:
                 process.wait(timeout=5)
-            except TimeoutExpired:
+            except subprocess.TimeoutExpired:
                 try:
                     process.kill()
                 except OSError:
