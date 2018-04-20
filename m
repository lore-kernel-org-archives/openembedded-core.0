Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id D53C97462B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 16:34:07 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id c7-v6so5552085plr.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 09:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vLj8WWdNmvYkcepcOXom+ffZpUw8WIQiUlDb+lAx2+o=;
	b=lBWMKtJGYp4YwBzJ9jYAQfvUoTvMgOMVSa528iDbtICVS1OKjXL+sUzGtW516cn7nc
	bidOxqy/9iUWwT6OgLTpGOxp+pTRm9eQLIl8sXrxXjvdZvAANDC6j7LR+ldmNd32cbSW
	8+H+uG/Di8xGpJUrn2VT0a/NFGm6y5fjLejzw9hFATDuKEs+Yex0rBPQg6q0hvZaSdRp
	A8g0A3A/PEv28WB+wJG/piPN974TkCumtbihk1Tp1M2m7Pz6Y42M5loApKWK11JAiSf2
	6JPcobyIQgyDggnkRak0U+ErVfi/cHpSQ2S/5dBZr70mjhul0tCGLVAnuw5hP0TT3l/c
	pL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vLj8WWdNmvYkcepcOXom+ffZpUw8WIQiUlDb+lAx2+o=;
	b=dSI9ltV7fnQXpVml36QE67am18eHKjiTi0g0g7DvCc/UliiSpp9Rzj4ehNdWI0+HD2
	9qUPS9nzpdSkmwzkAyk9ZJj7C3A1gy9jr0LIeG92Lu/LB04b2p+cz+XqGbxVTH9I0qvv
	4Arw3wy2VaZqNrOmfa0nq1u/Pi8R2pi64fAkbgY6yTqWyZmcOCQcT1Zc6Kz7APp+fTzp
	eDGL/P4rEQQakgdYZFUaccki/OozZDtXw6wm4OiOTe6DGUgDkqf+zFRhF/OJZ5ZiG3d7
	YQRFhM2GrP4hs4g5+3+F73yWdaS50HV++lLYN5tQBhjPXF+Ctymv2PBX/fwwAd/JPOc/
	5xvw==
X-Gm-Message-State: ALQs6tCbVVETdUfGiL0rYCTNf3Vh1KHHk0IvgzkmweL8ca7oYtgngEXy
	MK5m8kE+PqSgm0ZYoqVUYfLCQw==
X-Google-Smtp-Source: AIpwx4973zHcnHILl/ch3xlNZvsSJjMR59oklpxwB2J+YrKa+0LhEAvc2GhckV5d16lsmYTyHT9/Zw==
X-Received: by 2002:a17:902:3181:: with SMTP id
	x1-v6mr10957497plb.198.1524242048633; 
	Fri, 20 Apr 2018 09:34:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	204sm13450925pgf.61.2018.04.20.09.34.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Apr 2018 09:34:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 09:33:53 -0700
Message-Id: <20180420163354.12065-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180420163354.12065-1-raj.khem@gmail.com>
References: <20180420163354.12065-1-raj.khem@gmail.com>
Subject: [PATCH V3 5/6] musl: Upgrade to latest
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
X-List-Received-Date: Fri, 20 Apr 2018 16:34:08 -0000

Changes are here

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=55df09bfccbfe21fc9dd7d8f94550c0ff25ace04..618b18c78e33acfe54a4434e91aa57b8e171df89

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v2:
- Rebased

 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index a57460ddd2..01fec69aeb 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "55df09bfccbfe21fc9dd7d8f94550c0ff25ace04"
+SRCREV = "618b18c78e33acfe54a4434e91aa57b8e171df89"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.17.0


