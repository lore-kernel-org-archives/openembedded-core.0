Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 12FE877166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 16:08:26 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v5-v6so5857139wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+qLa31jR7W3cpTv7uNzgyIHdyhC9wIKDbEH0TC5c6Qk=;
	b=DCluqJPZfaz+QA7xXrcOWTWgVp85xsVEe9RLE+3MDKkwuvqvOIafbU2KkWJ1QrGWq3
	+SKuRnnKdKBuFlaUzJ+6PZWhb+w1/e1KPEBM4V1b3BZBTqdg962+AdlcoK/KAlqtNEWI
	9SSJQKTm7fEADK9dnv8x54QLmnYgKBmggqHUIK7i4Q/0+85BDRLfaI7miALNHWtsVaPn
	/d9k8j0aBvCMpUsGurAvH0tih1NkBr7WJPT//5rrWiKP8ONDK9PkjAAA6YPxNBdyo4bd
	U9hLeI+lyJvF6a0NGO4LNitp50uBGMzJz4J5VXSblU2A7H1WAJ/d+BOtn7kZ0Bgw2ICt
	KkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+qLa31jR7W3cpTv7uNzgyIHdyhC9wIKDbEH0TC5c6Qk=;
	b=jl0jqSfcRL0ISxVUtbIfs5T5t0mKfo2pyICm3SieJzQky1UPKsO0+97siPlrKC4VG6
	FxvEi4Hu4utbYt35vmuuIn4oq+9l+IoUo23xMcg1K8m0fiLmEvKNyCMQHlX3wvbsYh85
	KFi8ISok0VSUaV7oflO09F3H1pioX5+ekw3tR/kRDCQtd8QhG9WueK1eE2HnSQ76km/k
	TfbyFHgex1Z0iP1pJvCNrisSY1CuyNUyiDV0jULyVEhONFrcwAlB0ELF8DFHOnLC11P7
	6XxEH9FloKayr2dmrrqbeLMPHdi3tfLFlRkFv8kZKe8z/ZDv4N8Z6o7sPVA6pbS0zKwQ
	17kQ==
X-Gm-Message-State: ALKqPwdCWuT9hIog7DbOjwYpXMluVuDgp2ii3L98biHNxmLvNggNB8M0
	65a6CHUYircejZNfRChv9L3UtwcD
X-Google-Smtp-Source: AB8JxZrI8o7sWdu/4saM3fA/uqULuS/N76Lr81qqVjPMmaYZ9NBpr/igtrI6M0vqsDuqwXZgxWLqDQ==
X-Received: by 2002:adf:85dd:: with SMTP id
	29-v6mr5103779wru.120.1526054907176; 
	Fri, 11 May 2018 09:08:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q2-v6sm3684012wrm.26.2018.05.11.09.08.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 09:08:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 17:08:24 +0100
Message-Id: <20180511160824.11381-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] patchreview: don't disable malformed SoB check
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
X-List-Received-Date: Fri, 11 May 2018 16:08:27 -0000

We cleaned up the metadata so this can be enabled again.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/contrib/patchreview.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index 4e3e73c7a8b..1086c95f67f 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -132,8 +132,8 @@ def analyse(results, want_blame=False, verbose=True):
             need_blame = True
             if verbose:
                 print("Missing Signed-off-by tag (%s)" % patch)
-        # TODO: disable this for now as too much fails
-        if False and r.malformed_sob:
+
+        if r.malformed_sob:
             need_blame = True
             if verbose:
                 print("Malformed Signed-off-by '%s' (%s)" % (r.malformed_sob, patch))
-- 
2.11.0


