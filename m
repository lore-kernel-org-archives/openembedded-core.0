Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFD2174520
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 15:06:24 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f21-v6so10372904wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 08:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wPAnzBJW8TEnixkPcvJSnI2a3QkwmgGs64gmYrXvagg=;
	b=m1mlw1IHXdR+j3M/8mhr2ZJeHJG6Yr7eRXJmELojBTFUFyy5VH3kvOWYejD0o6dD7F
	ezSUb1yc8M+SoGjXIo64rx1qUV9cIbXEo3kRM8dcNcj2v069AaeptqSw4LI9ZOSRD36p
	kHCJ4kQLcy1+iydGCFiLvtg5iWnkMEdHnpv1oNdKWJGlK975gS3GbCjA3upi2R1qUIIe
	AAyIjfwb/K19kTL7tPIRD4R1EBLFNbs1X1zbA2QMcpb4GWZQhQ8uZ+GQXDvduRikQiuv
	ErPmFLFvCmXX7LxuxXLzePvLwbnBNHi9p2TbtfrcvYrXMMktlUxo/tl0C6jzlMWS8+bX
	bf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wPAnzBJW8TEnixkPcvJSnI2a3QkwmgGs64gmYrXvagg=;
	b=hfXA4Czm1arNdKwFXhNANPPZ1R5B3qhUojB6kKjboGLGHEVyuzWWsF33iLtSKzAQsZ
	qQYz/AueXSX4n3RbpmOlb/Hw0/oBlXvY3vRpYDGQDW5zH812fcs0yh+MKZIFFIRgdk5B
	jv7wHUvLF4ot2QINRwG4QKqFRRYD5ey3gMgdYXEXTmfzlM7E1Ehs6ec+fN3Pj9inSKxy
	h8jZANJJ56kMAfAHkQV4mpQJk8gc/kGTS2nWwupCyq9ToZl14CpSppIXGWgrCqEETovE
	Q6eD7WrJhjcGO8jBusCZMiy5oun78Ep6CtsiXXAoa4cQMR1bShRPckeHfjUUUU4trAY0
	Rq/w==
X-Gm-Message-State: APzg51B5PMfG+IZfsj5EstevTrcVQ1VtmPwMeJb8+i3xDEaQA7vfCfkG
	nxLVRo/3kmDz9jeSjRXihmV6BFax
X-Google-Smtp-Source: ANB0VdbghZ5tWAFKlaqKH1hInY3RC7gDs8PNuEZUxOxnw3f6+RLM4vOWXb4ZF9qum7y5WEvi/GAR6Q==
X-Received: by 2002:a1c:8f0e:: with SMTP id
	r14-v6mr3045444wmd.79.1537455985158; 
	Thu, 20 Sep 2018 08:06:25 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	72-v6sm23955280wrb.48.2018.09.20.08.06.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Sep 2018 08:06:24 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 15:06:06 +0000
Message-Id: <1537455966-8694-2-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537455966-8694-1-git-send-email-alex.kiernan@gmail.com>
References: <1537455966-8694-1-git-send-email-alex.kiernan@gmail.com>
Subject: [PATCH 2/2] p11-kit: Add PACKAGECONFIG for trust paths
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
X-List-Received-Date: Thu, 20 Sep 2018 15:06:24 -0000

Add trust-paths PACKAGECONFIG item which enables support for default
trust-paths in /etc/ssl/certs/ca-certificates.crt

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-support/p11-kit/p11-kit_0.23.14.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.14.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.14.bb
index 2a8709143b19..dd25c3813298 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.14.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.14.bb
@@ -13,7 +13,9 @@ SRCREV = "3770793f026e46a000d2d8816d56122598289d5c"
 S = "${WORKDIR}/git"
 
 AUTOTOOLS_AUXDIR = "${S}/build/litter"
-EXTRA_OECONF = "--without-trust-paths"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[trust-paths] = "--with-trust-paths=/etc/ssl/certs/ca-certificates.crt,--without-trust-paths,,ca-certificates"
 
 # This recipe does not use the standard gtk-doc m4 macros, and so the ./configure flags
 # that control gtk-doc build are non-standard
-- 
2.7.4


