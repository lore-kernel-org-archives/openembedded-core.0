Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 316A47002B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 08:45:19 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id b67so6764761qgb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 00:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8GtOF5+7aa02zBI1h7rJjIYgrKVGYXR2JmNYz9H4ERk=;
	b=YQw6wNUd/rVnW53oHwnI7ZatWM3kt9AiiSWwMcVxGn3ZdMJhPEKxWEUfc4r6P2N2+k
	UgtWKcI8AGVRLgZZELCzEZ68MTi84NOG2VFqPVuSdxQviD+4TC4a0DvE1B3ZUrJMLlsD
	yj6I30PDvE9OP+ELSNakRRZ8gzHCg6yjtFq6CrIBMoPfhkc+jG/HEjrfxICu1huYZd1f
	HGtu2EXzNecOcw4aF5181F1F9hCPmWmSx2oH63x6Hj/UjyJGo0BCcanvdIJooqGPQobb
	0GwSr3hrIvE0m6X2ASlvBIeEGcgGnkL/3OoP6UtkNdSKYzcre5WoFD2B502LG80ef8Lz
	TdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8GtOF5+7aa02zBI1h7rJjIYgrKVGYXR2JmNYz9H4ERk=;
	b=egU76RslHxASBLqE4Z5SXR/7qwnqzputuxyv0i+Bo9KvOXrKXAF03Iy3bq8hHK7FRL
	W/a8VI6b5q8K9Vf8enXAxgzQodOH0O+q24oQzJrw9/lor+MxYnOBM8PrLjQis4DEddLc
	B9oPldgDP9Az6nBLlwaWkipVsLDYJtKU1Gf+5qiLxaj+R8UGBdBmBZjZTE2+MLpN0D/d
	aajcRRo3816hXE0WCiAu/QTZ170KQq/Vx0+bSSDu6H3qxmQ+E/5B0JBvSEO4KsQqFPmU
	BQ1w4rFojc0X+Sz1yQc357B1dYQPcEJDX0F1fVi7gSDFhVsRmXG3zXz8yCQt6MgLeG4l
	aCuA==
X-Gm-Message-State: AG10YOQLPrcDR8NDG3pUfeka+DXDNPyJMxb8Fbs8avC8o+nde2oHKrRGKoWb+aylzUClFw==
X-Received: by 10.140.85.36 with SMTP id m33mr333881qgd.91.1455698720176;
	Wed, 17 Feb 2016 00:45:20 -0800 (PST)
Received: from dvm-wcdcc-khem-001.sys.comcast.net
	(a-96-118-179-133.sys.comcast.net. [96.118.179.133])
	by smtp.gmail.com with ESMTPSA id
	47sm14944867qgj.11.2016.02.17.00.45.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Feb 2016 00:45:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 08:45:15 +0000
Message-Id: <1455698715-10436-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] musl: Upgrade to 1.1.13+
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
X-List-Received-Date: Wed, 17 Feb 2016 08:45:20 -0000

Rich Felker (3):
      fix assumption in fputs that fwrite returning 0 implies an error
      fix unlikely corner cases in getopt's message printing
      in crypt-sha*, reject excessive rounds as error rather than clamping

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 8c54db8..4151308 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "0ed932f34f11663e6b3ddfa866b1798a5938a3dc"
+SRCREV = "cf115059ba0ecd611008c89c78c37b62f8e6d6af"
 
-PV = "1.1.12+git${SRCPV}"
+PV = "1.1.13+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
1.9.1


