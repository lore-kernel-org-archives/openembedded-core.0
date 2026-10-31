Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3729.1793405750369907903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=K0xqGtW4;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so13227405e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405749; x=1794010549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zUhG++Dbkha5Kr1rEnb6DfXimy7vq20nSevPP704y9o=;
        b=K0xqGtW4j8mk+B1/pgCBqT3dYLExwIrlN4QfOx5VeghuOaxi1mjiZ1nv6Y2hBxnUqf
         RMFN6SMvpEIN15s9ECA3EJKGVsdkI163jYFvYkk38x3s3c3ZGrL7aoMvOx9/rEA2bw8f
         BAnNNl7wGtSHewfr4RLhFYKKkzDm+yi1EnqcBgY98Lcbf3/FZc0guKJzrDEk6qRMGk0Z
         5FptH9ZPv/9UUFV+5xERdlBenXoS62w/aNJC2eLgFr+Lx+GHXRyxJ9v7Un78iDR1mZFa
         DTe5x8pXiXyFu/tGsvb39Fyn1sd2v0DcknBj7cY+92pdc1gV5To+2WDpO+lAzxIedcXr
         6+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405749; x=1794010549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zUhG++Dbkha5Kr1rEnb6DfXimy7vq20nSevPP704y9o=;
        b=Mw80knIE+9kRArvg7ou/XIxEYrrWfyPJ8sqyRsy6LbodeXaBXE6+gCUFEdmWrGAgtn
         d37ty+tsyk4wiTtjiLrmWx8SmYpRbdJJg9PXgNTPpbbq9VlC2ROIc0CyQhHHLS2CfxSM
         /V8jN9LF+pDAPYM8kOxsneQUfeAhBOH6ogguNoWT7zleqFThTZcWQL0n+6h3B8gNvJV9
         HZCo0PNPxuRiGQFuT0V5sgpgyN0nXNUJ4vZvaspZbT9AB8Mfi0q1lGdT0/rgB9j82u/A
         43ppF7MM3J7ngod+maP3VAoNj58W9pgWPtcOcGZJImb1cgl5Iv1qMlgpx0B0DiC2J0HA
         lrOA==
X-Gm-Message-State: AFq9FYK/eAhc1+R6ZTAG4jC1sFRXTC3EkNeeBEYvyPonzlvibWl4JemK
	leqOyfyzekuwveTC2wwM6IoBA78SbSPC2sPn/jwB9i8u+W2aIfdzdcfPDi6ecrOd/RBDnnfQypi
	rrHpmkN4=
X-Gm-Gg: AYBFou1l4M9P8ETFeMYe0rqlq0cbE5bPhNevO7dN5wAWF5+m2Hjnqj/gVjWG7B73KbR
	yMppNm02/iD08A3D+tbnxYj0wWns3jCM6hrakdjkb1+eEYO6Ep022PxoScuB7LOwoHzmk1dQRVx
	i6qVWpdie41chNc0h0yiA6TRbGi9RJXk+SzOOg5zWpFHLtyUK+SNETseYIpRr76jVU+CvnjNrGR
	1bYh1wkKysU5Ri/3L2UFhrgeWRRktjSvnQYvtPxC1D/sVutjV1hUMZSnAXXNKRc23xjBEmoYvRm
	eAJQz6dkhAlsJptugqX9CrPLARBK5CoAIL9TiAZAvtQXXbfJeqSmqY+LVPenTLgV56QkzHiw+Y8
	sCF0due7BZpL+Tbw/6wdh8Hf6gP1R+NswCqYQujqzzAHWWP1Q5xzI4QrLBdlNTudBYm3mwsuD4n
	cXuPKk652N0tThCciYCrKh2tRBr+mFdu+sZa204LqdgG6L402ipY371F/emWNToIh91G/xBZ+Iy
	Oe09Chvc7Yz+B1gtC1oJVWJ88LEF1ejJE0jYSHInNevrb7InCj7GvE5mhvII10/fbhkJYapee4p
	QrKJtRFSRz903zpZAaA+N3t/mIgBfNf3D2nASxcFZB2QMgykpO6ZaOX0VViOpNWBfzOZhgGbAoK
	dFW006y1hSwsgErXsko07l6MopZL0
X-Received: by 2002:a05:600c:3b0e:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4ac150b2243mr93278745e9.2.1793405748589;
        Fri, 30 Oct 2026 17:15:48 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/55] tzdata/tzcode-native: upgrade 2026d -> 2026e
Date: Sat, 31 Oct 2026 01:14:30 +0100
Message-ID: <f9e074fb0169f8bf4135681fb4ac5c88f9f750ff.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249084
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35a0a18640e92bd98eca22ec9150be11daca1df7)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 441dc9be998..704d6b603f9 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026d"
+PV = "2026e"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "2f5c9f7fe29e6b8cb863583667884b8ce17b0a485355a054b591c6bdfcd81791"
-SRC_URI[tzdata.sha256sum] = "0cb2aa8e333c3dc049badc42a0c61f21987b8cd44e107fa900bad764aacc7767"
+SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
+SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"
