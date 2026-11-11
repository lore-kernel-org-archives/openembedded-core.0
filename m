Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2359.1794418537534450943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 09:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=T0EahSlm;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1527773f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418536; x=1795023336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1Q4pjR2qqa0qfnyUZhl/SmuC5IWufw5Ot40YMG4hZs=;
        b=T0EahSlmfVOYsfD8g890qj2DrFA7VHGBXb9mnJWzBQwKcEXWZgN+a0dtUU/Y6lXHHV
         KqVm5KFfh5ya8E1EQdhmH6zum8ngPG50HOLIgSGdowZXd2rMoAz/1FjNUELGQrLME+WY
         lETdC0INYLdplfxtYtQ5Fge6eg6+rSJicwcPdKCiUDoUclJi5S5FsL/5f/kpTkKDD9xQ
         R3J0dKcKkMPEXGqLLMFgweQOdSVumAuvqIxJu6RbMD6g9JORH/8I8dutORlaSDgy5kT2
         csTnnvDGQ1GfqoHsBnddkVsSQMIgQAzULPnPrixxqMDrfEWtS96O3VS1OZQlqVgBw69s
         QV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418536; x=1795023336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1Q4pjR2qqa0qfnyUZhl/SmuC5IWufw5Ot40YMG4hZs=;
        b=kiyJr2um1AVPfJtzeZYv4Qp4vp3p7dvHNfVyLcbURzIY7ODzLcIuRK8RiPmzl3k4u7
         qlO5CA3qDyw+Xs6hJBNNovpb3c9dRfiUaJKIFwrBfp9fxLm32YYdTIwvoDy4G0RugZIr
         GlmJ+5Gmym13vuFWg4jVhWEQ1Bj3gXt9cqpqPV4P2pOhOWu5KlVfjOhWKHmzWLnBTJTK
         VqyA6whpOPfL6xkCCRaG/ys8f8xMOuRyuu4z9GlrSo1mzYc++DCx/Gs+UPRUawtzPknB
         0pyd/y3OzJokd3MkpAszO02nyUzg8MV9+6RZYxhfs0fMWmvcRR+uJWBlMsBYVw702tgO
         haTw==
X-Gm-Message-State: APuU4Z9GTGIbWxUX+qpSO2JqgnmzIMFg+DTxJXu7wt1U5qrRDar2P+qA
	vpRP22HQ6wWNWR6AVwW/NlE7MAKT5NfUtGnRasx3el6dInnAWiM5n1h4Lvosly3R
X-Gm-Gg: AYBFou1mk6LTVySyp7eoDHgP1UzSHFaLkEyxrFJ1byFz939+Z2ZWvigXZRRAyRDAzzv
	WnKFoKRqDRtvH0Kc9wR8scYHvBpd2f6KA4xbVch2RIIOf2yUf0HWU6X7Kiii0jrkmgEx4+vYbug
	Ejo5LnrbiIuG3tekjtwzhj2OIkR3DWdFtYhbMPqTR+7GtM75HVK4LszguPpNoRDSsETxJyeP3eM
	JcSVkQIRPNmbnZ1s6NHVtyDjzh+N2BCas+cL587hYt8op+2ANcCQQioVSICchymo2Cw7hN6j38p
	xK6Hc5meBKG++RwdzJogi+5LsfXiRHjzUCRaqIOkxcN36rknL+7Ujpg8IUlXR9qJ/Q2tXw8z02s
	54Z58kf9rSVaj+1aNDzsmPn9keVaJc+7I+QTz7VAjU0EA79r+VvS52E9m7Wp+rRac6FehQ+8GqI
	up9rwoYZY//sasDrep9Bb93F2QmaOX4bXJPinHdgdgFJqxZmjgOesdFSSy/frIF6C+yDIRgFZXr
	Lxvpk8AkboOfjO54wp775eVgB3s65AsKbfO9hHHmHDKZlhK4K/6l2NRfBqSCrmAyqvboBrEoYV1
	6Zm4KpG6d4wmZ7xtU+tcKKz3bZKWXeqLMsk0XLSSUls8Ni0=
X-Received: by 2002:a05:6000:25c6:b0:491:6c24:65f5 with SMTP id ffacd0b85a97d-499c5e3c13dmr5220916f8f.17.1794418535556;
        Wed, 11 Nov 2026 09:35:35 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm12214329f8f.37.2026.11.11.09.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:35:34 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	jpewhacker@gmail.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	patrick.wicki@siemens.com,
	stefano.tondo.ext@siemens.com,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [blacksail][PATCH 2/3] spdx30: Enrich gitsm source downloads like git ones
Date: Wed, 11 Nov 2026 18:35:25 +0100
Message-ID: <20261111173526.3653122-3-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111173526.3653122-1-stondo@gmail.com>
References: <20261111173526.3653122-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 17:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250043
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

The source download enrichment only handled fd.type "git", so gitsm
downloads got the VCS external reference but neither the SRCREV as
version nor the PURL. The gitsm fetcher is a git fetcher with
submodule support and carries the same revision, so treat it the same.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e5146d8f9111416c3fc9247b152d1d70b55c7fe)
Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 19661152ff..d15dae8fdb 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -405,7 +405,7 @@ def enrich_source_package(d, dl, fd, file_name, primary_purpose):
     version = None
     purl = None
 
-    if fd.type == "git":
+    if fd.type in ("git", "gitsm"):
         # Use full SHA-1 from fd.revision
         srcrev = getattr(fd, "revision", None)
         if srcrev and srcrev not in {"${AUTOREV}", "AUTOINC", "INVALID"}:
-- 
2.56.0

