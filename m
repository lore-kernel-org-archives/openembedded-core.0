Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 587167318F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 14:03:39 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y7so11442032pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 07:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IAFo1sO52tGG2hBnw/6hjvJEswSYiBR1aw0995PwSXw=;
	b=nAw11ty2b+0rh4JkQwyX/QhhFur3R4Ipyq0pjOj+NCVEYVfclf045yuLJOs9nZ8FHb
	/Cfacl0D2+4sEWliUQ1tSIix4CJgNfI1y/g1BXU1D6/ZqUkRQaVHbEORSHAe6t0OIYU6
	quYWu/gMBlFLqxm3fuoci0wX1cnvTILSQoj31Myeee5sHAHTDuyLhOwTZ99h+qOiDabx
	o3FFbw7Bjll2A0AZRgN33RrxbMHVVbaunb8wSf6OBNevkt89M2aX24YwdG3EIUV7jc/L
	sRgI6tfrNVrQVcrmhm/DrAHD+PkZXUHkPmu7ljyw47LM9j/PCQthoZvN92PrHtZ7oRRh
	9eCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IAFo1sO52tGG2hBnw/6hjvJEswSYiBR1aw0995PwSXw=;
	b=Zy120JeTX3wZeDwSnTYYlJLGHI8w4Xe7TuovtjXbbboWpb2RY8+ngMF/uu6Qc21osW
	2ySuc9ZJEoYs6GzoJ3hfzFp6yyhEmJoBnBTAg04ySWmoLycMBFhv6FZtFS9kB2K44DjW
	zSuV4OHpP3Dt+9XIEJKYzT+1g5j5zI7ENIUj9H40dA+1CdlKU1jwoarL0hT/bZ97ebNB
	WhfFwNgCmjkVamCP1L5MzyYPy5JsaRu6Pxm+3XWyYoBg07HxiIDjRqktBfEtmGA450/F
	gyIaSNey+TcWZG8c0lK2XFOKiKhHtON55Yvo44O8UUcmCFEGUGmWEKMbSBj26fuDQoHd
	pFhw==
X-Gm-Message-State: AOPr4FUCosTyX7sWYD32h4sRvCob+V43LS0XmZKDrh9WRTHvhhB1hc9Oyq07+xGJ76nmgw==
X-Received: by 10.98.32.140 with SMTP id m12mr3482435pfj.119.1463753020161;
	Fri, 20 May 2016 07:03:40 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	w125sm27642542pfb.53.2016.05.20.07.03.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 May 2016 07:03:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 07:03:30 -0700
Message-Id: <1463753010-32035-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463753010-32035-1-git-send-email-raj.khem@gmail.com>
References: <1463753010-32035-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/4] musl: Update to latest tip
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
X-List-Received-Date: Fri, 20 May 2016 14:03:40 -0000

Bobby Bingham (3):
      x32: remove arch-specific syscall remapping
      x32: eliminate __X32_SYSCALL_BIT constant
      deduplicate __NR_* and SYS_* syscall number definitions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index dd525b0..b1abf4f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "49631b7b6c8b8c055aae5b6948930c219b95fdef"
+SRCREV = "63e3a1661f1fa5552e2023683617ce09fac3248b"
 
 PV = "1.1.14+git${SRCPV}"
 
-- 
2.8.2


