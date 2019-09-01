Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id A90E96C226
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 09:39:55 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id f9so10139148ljc.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 02:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hDy6AYI/b9EoXIaHCAzxnHn0rvVvEnlNVoxcn4IMrR4=;
	b=vSmQhV7btruKOyYzgCzEzN4IqYvCp+DdAqzeMZLeAWrqWRowULpZzeB+ARggu2gdoY
	7W+mYw6SZxMlinMmXV43apQ1LYeCadONZQCX18sdSQSy+1I0tWVhJZ4GKZewAzaWq+2+
	1ao8y2v5rBtI86CF23PaUT41WCTmIoTZO6dwOg9ZuA/TE2HAcAbBUMCPaAGVibHBgNR2
	2FfRK6Nt5FA6L1/grxzykyIfnvr/xXm6gL7FI6rxKWLYOCIu0rodsA31JcsnaSxFtJFB
	AEw4yQArApTzBioYRqS58yWf7fzkNWrP144W+cnhuBwfvlbyHeCE2HXNKIeAjCM+QylK
	RGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hDy6AYI/b9EoXIaHCAzxnHn0rvVvEnlNVoxcn4IMrR4=;
	b=AmK3CtQeost+99eG+l0g4TQOCtemC5WWgFKHxUjTPTAnwuj/3mM8RVWsH3PQ079EEp
	7pTgse6KwEzEF0Pq4cyoTKSrVGP+8pLFQAVFs9HWtUV+xA/+1Rzv4soJlyX1Dioo/Vrs
	HmRJMB7TMgc6Oq8MRsBq9UigF4Ig3/DctHFF80V2V0oP/I1uqi00KftKm2tOM8SRK99r
	+obQYEYDORYp2irXPqnrQbV1WVCLTSG8gqmVLMOrPRvXm0rlHSAEkiwn1js3194r9cbR
	TD4HWXOmYPtte6vosKhDGCDhXdmXTZmi91aK3LpmbczKlb5geZf8Pnz0YsA9cJVFwcoW
	2Gaw==
X-Gm-Message-State: APjAAAUZD/FF+dFibnavbOFG06J017TijUWLOYGOXL/0/0003tMyGiOH
	fim8r4fv8Mx+09ywHTWr4sX+jZg2
X-Google-Smtp-Source: APXvYqyFbQ7F8avYUsDY5vQCh0RRI38caIigQyhyQmJciZq40YUV0onaPrTtLyfUiVu7yOgGD4Fspg==
X-Received: by 2002:a2e:3e18:: with SMTP id l24mr13527621lja.67.1567330796054; 
	Sun, 01 Sep 2019 02:39:56 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id w1sm1926434lfe.67.2019.09.01.02.39.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 02:39:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 11:39:47 +0200
Message-Id: <20190901093947.95524-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190901093947.95524-1-alex.kanavin@gmail.com>
References: <20190901093947.95524-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] libepoxy: enable x11 PACKAGECONFIG for native/nativesdk
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
X-List-Received-Date: Sun, 01 Sep 2019 09:39:56 -0000

This is needed to enable virgl support in qemu with SDL frontend

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
index dd706a96063..c8d1650c637 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
@@ -23,8 +23,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
 
 EXTRA_OEMESON += "-Dtests=false"
 
-PACKAGECONFIG_class-native = "egl"
-PACKAGECONFIG_class-nativesdk = "egl"
+PACKAGECONFIG_class-native = "egl x11"
+PACKAGECONFIG_class-nativesdk = "egl x11"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


