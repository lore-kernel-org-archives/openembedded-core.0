Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id E55DF6C4A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:04:24 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id x124so10889348itd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yd08s1orwXfWhzLfXBgUc172eplcjKdW09+VZjjIKGg=;
	b=ThQj6c0DmWEOcGDXVpqh+e/px3PMSy3ionJhBvkEYWENSmY52FEzXzfMNRj++UH8Pb
	Wi5PR9CrJJi6XpizdaneL6BWvKR1qYEI+lXc+RJQT9fMnP27VdIzpYUZ4aWVA7Dm07xM
	DcI4zfc3Hv95Fs0+B6ej+Eqprew9mWMMFfc89oiTv/10EXqpJ4xEkT39Px+yZtC8PI+r
	IByJShWkvnEGjl289kUngNOIO8S/wE4gQFb/rTyJJWFv2ahQQ/9uX5BY5CqbeuoXnFd/
	k5m0SjrHemUwMoswl3VcBodlaGFS/GCGCMdLI1kpNkahuN++VuQvVioZN+S3JcDyLS++
	EYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yd08s1orwXfWhzLfXBgUc172eplcjKdW09+VZjjIKGg=;
	b=KROvDnBmCtVjcQR/yffutfbsZQTfNOFUXo3uqzDa3vcYEhM9vgY2BTXMowRuqdmQ+f
	CdfeYYfVEZnRJ2o5PCCsFJATOyQAkWD7oOKDuiegrm6A/R/8AyW98ZugsVi1vKi4Q1EW
	S7OVxRqVTwuVjbgWVCWZev62m+ypzuWtaE4bWlwHmqI6GQH/OwZSsxKWJGo3KFdlT3YA
	Lj3YpNOF5X2B+hFnO6HDLzmJOAAmFN4Hr66SGnMmGN/dXWslGpxX9SJ1irnXMKX7VX41
	pJyhVLMbOdX1fkTuiLnsci/TtXcO9c61Mn/91N7/JcRbvnIDM2zj/k60ck+ynieSLrgB
	zygQ==
X-Gm-Message-State: AGRZ1gLS6tjIsqaCdov1+jKUKmzpjEGPA5o+PaKnt8VMn4DIAhle952Y
	JHXysFPbJ+1abZFEPUFiLFYhYIRxM9g=
X-Google-Smtp-Source: AFSGD/U6fYq/VFhWVhW8ij/GWHCDeta1yMiehVC6StlsDT8pMnGbKy6mog5ndV0ac5ZiXWyNI2zrsg==
X-Received: by 2002:a24:2ed3:: with SMTP id i202mr3211781ita.89.1542744265655; 
	Tue, 20 Nov 2018 12:04:25 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	k133-v6sm16414194itb.16.2018.11.20.12.04.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Nov 2018 12:04:24 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 14:04:16 -0600
Message-Id: <20181120200416.15895-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181120200416.15895-1-JPEWhacker@gmail.com>
References: <20181120200416.15895-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] meta/icecc.bbclass: Update system blacklists
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
X-List-Received-Date: Tue, 20 Nov 2018 20:04:25 -0000
Content-Transfer-Encoding: 8bit

Updates the system blacklists to include packages that are known to have
problems compiling under icecream

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 037cce1e964..2b189232cb7 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -68,14 +68,22 @@ ICECC_ENV_DEBUG ??= ""
 #
 # libgcc-initial - fails with CPP sanity check error if host sysroot contains
 #                  cross gcc built for another target tune/variant
+# target-sdk-provides-dummy - ${HOST_PREFIX} is empty which triggers the "NULL
+#                             prefix" error.
 ICECC_SYSTEM_PACKAGE_BL += "\
     libgcc-initial \
+    target-sdk-provides-dummy \
     "
 
 # "system" classes that should be blacklisted. When adding new entry, please
 # document why (how it failed) so that we can re-evaluate it later
 #
+# image - Image aren't compiling, but the testing framework for images captures
+#         PARALLEL_MAKE as part of the test environment. Many tests won't use
+#         icecream, but leaving the high level of parallelism can cause them to
+#         consume an unnecessary amount of resources.
 ICECC_SYSTEM_CLASS_BL += "\
+    image \
     "
 
 def icecc_dep_prepend(d):
-- 
2.19.1


