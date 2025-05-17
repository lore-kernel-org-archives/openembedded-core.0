Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32C8C3DA6D
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 15:02:18 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.13302.1747494136453829221
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 May 2025 08:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bTK4EbDc;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3380252b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747494135; x=1748098935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCi+TVnE+Z6oE1YIHNe7uU/m2nZPp7H0Y6vLqTU/kV0=;
        b=bTK4EbDczBcqrbL4Tn3MP9g4DhJsHvME4nK0qY1BGNWrOtZI7uL2tMt7PSppmiSKkJ
         ieLDqTmVgQGTIP4RuNgKbFJgyVzQYqux0W7cqrfYrlpe0hN951Qgggr8e/jNQ3sKfH1n
         G5zPehWEzB08su4cJA6l4y9gvuaylMOeOx/GhlRZLZ4U9NImAZd7HAudhMNwyzU5Od3Y
         vKRcG1ScM+E+IG8Z0rOyapOPlrkOqmUVTp3BzgM07hZ8+VR/r0NVwiPQyrduobYMcElT
         hqnoPPt8hTBtltdeyweffBdSz2OCwj45TN1oMRPT+rBx9O9QZpvRBW0qAzm7+z1DEvK0
         gD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747494135; x=1748098935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCi+TVnE+Z6oE1YIHNe7uU/m2nZPp7H0Y6vLqTU/kV0=;
        b=IK++CCeyZ+0pJ+PfecLWW1EtmwX/uOIAdspUDwsDVIPHgCPpvqzjp48FZFdo9rwnnu
         XA4c9i+38PYgShgU3TR8oJDudDaU5lD9XfSELRVvOcQHt0cTUuGKeiEm7ZphocSG9ACl
         CvMwdo87u92c/9eWeSm+PqbXT9VpfAWihMG6e+rIllcB18MKUcsYkaIH4OatVoqPPXSk
         TArzbQ/pFBwUBnTN/DW5HPX+Fff0CXzU4N5J1upzzk77sbxcDNj9DwmNQ52A0vCeplif
         rW7gCMvJQFefq6Z6C/eJd8v0iTgyoQoie6SrUVyaH2bcjZe/9oPyQMwoW5Kh3BJFVlRj
         kyIg==
X-Gm-Message-State: AOJu0YxZ60xlXVQ/ut7fe0rI3pBt5MopRUARE3tAFsM9CWM4//BQW5JW
	p22B/W3jecp+h0lGIH/IIXUtrIuUrS0b3hct/ZlsZ00Wmzp9wtDyX71vdspvFOsM
X-Gm-Gg: ASbGncvDOZPJ0BC/98eciR+yFV/MifkvomfYK6Vr9JG2CLyH844jpnRjl7c9ttuU7zC
	KrCzyJPUF1fS6Sb500a6KeU3hBGvT7sIT5g9tkR0jrPRbTZ0P9BkzQsOsPdeIxb8fyCGIhss+0/
	LUvPSFne27zO8LRtqHibXfd7tf+FelovjmaCsqhmD+4Amte4opFNo86HDHP5ZjvchF8ewIaVVQe
	TH5VZsR25nBQa8Nbi2duwqmVbSNPk/B+m3FL3P/w7HVnLAMaeWZ5bLIMIfsAc5XSn4c0rJPOWkj
	o79BbxSGCzl2dJnZVTZP7BPDmPwALik758zfDL8hcFE=
X-Google-Smtp-Source: AGHT+IH0hFRFS+39lArbG8wseKezXNvvCoH1d+IlOWW04KKqapzAj00pPK0L0dlED67QM3UcFDx1rw==
X-Received: by 2002:a05:6a00:b84:b0:73f:f816:dd7f with SMTP id d2e1a72fcca58-742a989a1b2mr8607782b3a.15.1747494135359;
        Sat, 17 May 2025 08:02:15 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970bb2fsm3379201b3a.53.2025.05.17.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 08:02:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libvorbis: Ignore -mfused-madd as well for clang
Date: Sat, 17 May 2025 08:02:12 -0700
Message-ID: <20250517150213.2489547-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 15:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216770

This option is not universal for all compilers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-configure-Check-for-clang.patch      | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
index d4fac605b66..36f47f91739 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
@@ -12,8 +12,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac | 19 +++++++++++++++++--
  1 file changed, 17 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 28b0a14..2d4e984 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -98,6 +98,16 @@ AC_ARG_ENABLE(examples,
@@ -51,6 +49,20 @@ index 28b0a14..2d4e984 100644
  
  		# glibc < 2.1.3 has a serious FP bug in the math inline header
  		# that will cripple Vorbis.  Look to see if the magic FP stack
--- 
-2.17.0
-
+@@ -178,12 +193,12 @@ else
+   		fi;;
+         powerpc-*-linux*spe)
+  	        DEBUG="-g -Wall -Wextra -D_REENTRANT -D__NO_MATH_INLINES"
+- 	        CFLAGS="-O3 -Wall -Wextra -ffast-math -mfused-madd -D_REENTRANT"
+- 	        PROFILE="-pg -g -O3 -ffast-math -mfused-madd -D_REENTRANT";;
++			CFLAGS="-O3 -Wall -Wextra -ffast-math -D_REENTRANT"
++			PROFILE="-pg -g -O3 -ffast-math -D_REENTRANT";;
+ 	powerpc-*-linux*)
+ 		DEBUG="-g -Wall -Wextra -D_REENTRANT -D__NO_MATH_INLINES"
+-		CFLAGS="-O3 -Wall -Wextra -ffast-math -mfused-madd -mcpu=750 -D_REENTRANT"
+-		PROFILE="-pg -g -O3 -ffast-math -mfused-madd -mcpu=750 -D_REENTRANT";;
++		CFLAGS="-O3 -Wall -Wextra -ffast-math -mcpu=750 -D_REENTRANT"
++		PROFILE="-pg -g -O3 -ffast-math -mcpu=750 -D_REENTRANT";;
+ 	*-*-linux*)
+ 		DEBUG="-g -Wall -Wextra -D_REENTRANT -D__NO_MATH_INLINES -fsigned-char"
+ 		CFLAGS="-O3 -Wall -Wextra -ffast-math -D_REENTRANT -fsigned-char"

