Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id B03E26013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 18:14:36 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id us13so2355244pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 11:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4kSuafkST5cpKiDdVTfNbLXv+GsQa4YOw/So78UMmE4=;
	b=yvuOtzR3D9Pio+F5x5rvMaPVQIm4qk4dcifjh7U0LQI8ujEn08vkT+n068Sq4TBooL
	FRaBcOPraY+AzY71EgL+i0AZO/dz2egtjPXZM7j7AvNtJRw1FE6N7YA54LaGUAPqWCS2
	fMemkQ/vOL/4wNllg79zdpAwrJHyVjQP5nbE3n/RFDHPEVGL4iE2mnxtiiaAyqUv+NYG
	cij0l21DvWqMscu0b/NaSFdrYwW8tP0ot+aU+vreVq0RJwmBaKB6e7rOFTw92epZNWpi
	BEyifR1Xgw19IR0wspJFgF4X4/HxnZWDj5951HOLWcOh5zslIqTnJd7MuRdpF7o59yax
	jyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=4kSuafkST5cpKiDdVTfNbLXv+GsQa4YOw/So78UMmE4=;
	b=Xf1NObaR9FVvLWuu4xodAGKb0yxpwug5JhyUUvLadzWyheLzAhlmkpKV/5swoGqwin
	suQOEk7TuqBYacz3gjAsE1R5wagcWITjqO1useosqFeqxo3OgPI8vgFJ5WRWpxz328yV
	24jdgBlD10hkQfpX5xji9YYBPo4IHKfsd/j3ygbcHvtyxA1wLGuevnku5koZjZjzeSLp
	gmuxzMeDtlkx0bM58ohFTnSXkpDoWzDNXZRQSS0CHHNkLALtB0YU8mqHKSE/uw2OtGXD
	jMnUxFXsHQMHM/nJgAF4s3CAg/C4xBa6BuwzV0jgiwD6c65MpDQ54CldnYCAKvE5mVAm
	dWsQ==
X-Gm-Message-State: ALyK8tLogdZYAng/Xv6HAn9t4fRag4X3BM3oWjfKmbZXvPiQNPZEjRf6XYsmaoLjd/0RKA==
X-Received: by 10.66.132.7 with SMTP id oq7mr2563781pab.26.1467914916526;
	Thu, 07 Jul 2016 11:08:36 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id j8sm6106747paj.22.2016.07.07.11.08.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jul 2016 11:08:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 11:08:28 -0700
Message-Id: <a175ac0157961600c298888d9b0fb345687203a2.1467914773.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <35285b0dd386fd16e53678361ee33e8525671a21.1467914773.git.raj.khem@gmail.com>
References: <35285b0dd386fd16e53678361ee33e8525671a21.1467914773.git.raj.khem@gmail.com>
In-Reply-To: <cover.1467914773.git.raj.khem@gmail.com>
References: <cover.1467914773.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] musl: Update to v1.1.15 release
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
X-List-Received-Date: Thu, 07 Jul 2016 18:14:36 -0000

here is shortlog of changes
http://git.musl-libc.org/cgit/musl/commit/?id=faf69b9a73d09fafcbe4fd3007b8d8724293d8e1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 956d9dd..ac321fd 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "6cec7bc57f599f43f4041cec2093e3c9231dbaab"
+SRCREV = "faf69b9a73d09fafcbe4fd3007b8d8724293d8e1"
 
-PV = "1.1.14+git${SRCPV}"
+PV = "1.1.15+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
2.9.0


