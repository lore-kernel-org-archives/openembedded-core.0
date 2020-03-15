Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0A427605AE
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:01 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a23so6843899plm.1
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UnBgeDBEDrR9BS9GEGujqBXZgX1BOYsIE3zkcGMmGvQ=;
	b=CtUf+m9SDuXOQlzj+9gQJj70B8NYMMfdehCnS/jZYMuVpntMJWGnXBX+nRr/9KYvS5
	4DQBIM8mugM0zZtOWkaiEB47ioXNcDQpxSpSoV6PASNKahV8A6e8beYDfDn7pMEFEmFk
	Ark2XfLEb29B++3SQeSd5WslO91ITPbkpQbXTc98tvlCz75IUIcwZxqGe5DTPb+zpNf/
	jiea4GEX25KqPOsYN51KnOj/yVXd87Z2AXOG67UywpelFhEG5HkHShFwS6rB2Vv9KUZJ
	IVfUplb8wvVv6CSgp+JzIXfbnMdPHTSrmxcOAAMrWM1n3geH+BM7mGqd9L7Ok3s76Ela
	GEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UnBgeDBEDrR9BS9GEGujqBXZgX1BOYsIE3zkcGMmGvQ=;
	b=eoyfDA/+7VgZttHMwjahlZlGvgDKBXTmniH8JDUv1qNRdcmmAd1N8Vy1ixIthkKvXG
	+QVlOQAPOQTJBv3wCZUBYBFeZqiHFEJvwfb3Qnbs19t85A4L2XD81ck0xxyb41O7wc8a
	r9HRjdDab1sLLqV081F7JIjPxjZD4u+qepqGvI61rQE2HfvmnyGRx6xtk7K2c4mAYU7t
	lbaokykrLYqN7FLptYyHtH0TNA2qJzV6xQOxrGF9rQ9M1OjooUVj0q6SxqcQ+SqRlcMF
	jZU1PdbgfrAUb99t2J0BLss7JEaClpXD1PY1ppClI4DF7YrXHfD9t8D/sd8FF4gwp6f5
	U7EQ==
X-Gm-Message-State: ANhLgQ2uFjhVIu5Op4SPQYN8iGtImmhLSPpsaBI0MK5FVyzUrc2i76Ln
	jbeHIMe3byNbseS4V2Da/VTM3z5T
X-Google-Smtp-Source: ADFU+vtuNEsWkqVxD/PrGEeRwvvlNv5ZzZir2JDbYy5a3B4cM+nqkPHtPQiX8T7LpIW2DxjgK02BGg==
X-Received: by 2002:a17:90a:bc01:: with SMTP id
	w1mr2925976pjr.154.1584295922920; 
	Sun, 15 Mar 2020 11:12:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.02
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:43 -0700
Message-Id: <2da4ee30335d0b127b79a6eedad68c8559606c57.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
Subject: [zeus 01/16] yocto-uninative.inc: version 2.8 updates glibc to 2.31
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:02 -0000

From: Michael Halstead <mhalstead@linuxfoundation.org>

Allow sstate use in Tumbleweed and other distros as they update glibc.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ccb374c279b260b1fd3460f6bfd1567240816055)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index ad75d3e2a3..889695eae3 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.30"
+UNINATIVE_MAXGLIBCVERSION = "2.31"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.7/"
-UNINATIVE_CHECKSUM[aarch64] ?= "e76a45886ee8a0b3904b761c17ac8ff91edf9811ee455f1832d10763ba794dfc"
-UNINATIVE_CHECKSUM[i686] ?= "810d027dfb1c7675226afbcec07808770516c969ee7378f6d8240281083f8924"
-UNINATIVE_CHECKSUM[x86_64] ?= "9498d8bba047499999a7310ac2576d0796461184965351a56f6d32c888a1f216"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.8/"
+UNINATIVE_CHECKSUM[aarch64] ?= "989187344bf9539b464fb7ed9c223e51f4bdb4c7a677d2c314e6fed393176efe"
+UNINATIVE_CHECKSUM[i686] ?= "cc3e45bc8594488b407363e3fa9af5a099279dab2703c64342098719bd674990"
+UNINATIVE_CHECKSUM[x86_64] ?= "a09922172c3a439105e0ae6b943daad2d83505b17da0aba97961ff433b8c21ab"
-- 
2.17.1


