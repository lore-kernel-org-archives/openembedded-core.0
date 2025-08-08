Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61993C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:37 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.17693.1754643033209480045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8jI3nlQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b4209a0d426so1932398a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643032; x=1755247832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AL2WkQaHXSacRiHRpk5kDaah6EYWRRp3/8aLrZ8f3Xg=;
        b=W8jI3nlQUVpjjmufCotC/UQmg7jrOKFbihvnJRnbTsH0u+kGaqnV0Qz0I647V9vXhJ
         4Hahq9sXN5c6LwzTPsp7FKYaQWRstIHUxaBd1wq3EYRw4ersWuM3MVCWNnQE8mvm6OHs
         /om5kGr/jXgGzvSUxYlTRVEFVTRzlki+8Ii1vFsXoIbG7O2wNSB6WRiD3XE2gfdYBqgc
         ubrP9BhtZ6b7LKNtZ8N4dFmQUdB4q2IYjl8V/DUpzSeCWoZuMURjT4yXoIOa6TwWxuKZ
         HrLJ6d16QBAAzPtIPJRpqgdYqLaJaSh7ydWP9wKFrSW70PMob+ulIXHkyZ3iY5WtztWH
         W21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643032; x=1755247832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AL2WkQaHXSacRiHRpk5kDaah6EYWRRp3/8aLrZ8f3Xg=;
        b=keHKon6Oi6APgfTcOkqbpdDwhUUszuRUc8mk3WjW1s759sGCKHYndE3LW4rSc5yZwU
         HOQtlN6pw1Eaa++dJvuy0GphRXxe5kb2rr6SSyAiQ/H0pxAqSIjcoos8IcvVF81+5XBN
         8T02el9ElVEM27O2aYp9h9RglaeKY8YsDjP7qmH7AfJIQ0fQPCO00XHL54ttHCHQ7c/P
         KPjUAJPTamb7L5wCfKtjLG4Y4Exj7PX5A1TyLnu1dfp883azZk1AFGQXpQXIgrnj4WQJ
         akg1cy9DXO/ugwf0pVS+hm6Y1hF0SpSDcC8CoAAcOdZkpnlANykL8mrtYciPabGCoNGN
         nRlw==
X-Gm-Message-State: AOJu0YzJdVjlBkDiw744jZPM65pmZudqdhXXmKzwTv+yOaDJy57MP5IK
	6PYA0hH5jd+NoKfZKqliWcPmdGuSuFd6TkXO13CSJG4B9llBfYblM6Byklx7cw==
X-Gm-Gg: ASbGncv3fqKf1mIE5KkpokebecS81i/J2Iw+T11X05GFkqUJeipXldD+b1zjMRjJiRV
	kbBV+B/g6DpDMRanOrJSR72By+SjnSyY2zsphLZ5t+h3sdCpIQomjjnH3c7PUjM3rBgS6x7Lm/b
	gno/fEny3Fm72WGauupGEjWX5n9Jr7PW1xohyxn2oTUynJAPxWZV222Jh5yVm0BweZKSmGnygHw
	xy073pfY58mlcbgm+KR08nFN2Lmd82w9bRJ5Ue+yavq4cK9rr0uiHGXngRmACd2ckbwieZc8Iu2
	ajbJmNzgQBL+yROU2yb9KqjbV76ITDIxJuspLRlaxCml5TT1hyww6hllLWQq/yFpIJUeSOGXFk1
	wsKrKAI8qYgIDSrhoLJMizFuDU8lT9l+W
X-Google-Smtp-Source: AGHT+IGOqWy4JS3H+LdBVia2o5xTPTN5p4air7Egt52BjxpGDc7M4SX3r9AvYO8Q1vvP3jofCFRFFg==
X-Received: by 2002:a17:903:110f:b0:23f:df36:5f0c with SMTP id d9443c01a7336-242c21dda3emr32084925ad.29.1754643032317;
        Fri, 08 Aug 2025 01:50:32 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:31 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 20/23] bitbake: fetch2/git: fix shallow clone for tag containing slash
Date: Fri,  8 Aug 2025 14:19:28 +0530
Message-Id: <20250808084931.2156763-20-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221617

From: Chen Qi <Qi.Chen@windriver.com>

If a tag contains slash, e.g., debian/5.22, then shallow clone
fails because it's using a wrong ref.

To reproduce the issue, add the following lines in local.conf:

  BB_GIT_SHALLOW = "1"
  BB_GENERATE_SHALLOW_TARBALLS = "1"

And then run 'bitbake debianutils -c fetch'.

What the original os.path.basename(ref) wanted to do is to remove
the strings such as refs/heads/. So we do it explitly to fix this
issue.

Fixes: [YOCTO #15862]

(Bitbake rev: c6d6999f1ed01e7445b8f177a888038edacf555c)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07f08063c1d6eff52fe95d0b6c1239cb1336c7a7)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 2b6e49362f..764e34ccc2 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -662,7 +662,7 @@ class Git(FetchMethod):
                 extra_refs.append(r)
 
         for ref in extra_refs:
-            ref_fetch = os.path.basename(ref)
+            ref_fetch = ref.replace('refs/heads/', '').replace('refs/remotes/origin/', '').replace('refs/tags/', '')
             runfetchcmd("%s fetch origin --depth 1 %s" % (ud.basecmd, ref_fetch), d, workdir=dest)
             revision = runfetchcmd("%s rev-parse FETCH_HEAD" % ud.basecmd, d, workdir=dest)
             runfetchcmd("%s update-ref %s %s" % (ud.basecmd, ref, revision), d, workdir=dest)
-- 
2.25.1


