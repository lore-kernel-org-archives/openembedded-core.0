Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 830A560E77
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2020 18:35:00 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id b9so6525168pgk.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 10:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ek188JtRxg45a8GY3IgVJPVLi85pWNhAMavFsW2a1ow=;
	b=RupvTHDqNmKKUcEErB8WTjYld5a8A9AcA4vQdsiwQQe4s1VNbUh5wHfxhQW+BEX3Ki
	WuVVrb5XHLOMZ4QtOWwBI/956fBfxqGqGfqH73I8Da7/g2P5u3Kbw3L/ZxbTyRmuvbMz
	QFAuf/XU6c2CzcPqGEJKkh5ydnxIqSJv7mlK6M9NVVAAAUzJtCYjZX0kcaJED0gv8Wbk
	2kHaGKCmRd5xWcfbQnbLE0klDuQQtv/JcG6WlelbmfBqXYkED9RyQ3YlzrP/0dNZWaGw
	NyjQ+AS0LeoPCMHxg4hFVxp62Xa0XmCyGyIr++Epdxt3vKeEoYgK2z3lSEUuuJau/V6t
	msow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ek188JtRxg45a8GY3IgVJPVLi85pWNhAMavFsW2a1ow=;
	b=H1jhFOmvtFxX44EzDTAFJ1ywBh0yhrkFC8FV+fmHHbM8/t04zYMPHDreFVSFpqHmuz
	w66+k+zV6SUrK1ZWD6nlokhZvuuk/08rmUHPa1gdAz2na867DDNjcvlDGYWoquTs1dZl
	wv+HWicjoh2Sit62TCaquU8/bATjYPYdysC1T71fkw6dVAq7qiAsFQgE+1YLdbAadUlM
	JkPTHRB+HR0SrFKhsAMd5lJmKdLnrWLzYQYP66bdg1PDuoxzBgUDDVXL0HLYsB6B3B0J
	iZZH5fDadyNlBf5kDhrw1iIbKktb486PwgexWbv4YAlf1IOYo2nInUbAzC2DfNRXvkC2
	p+Tw==
X-Gm-Message-State: APjAAAVmqK8xe12ULmxMRj0HOYiV+qFZRXJ/Qqi64mjzW3mx//JlqZHF
	nHuwznWiqbQIGcy9GIVIlit6+/0+N5Q=
X-Google-Smtp-Source: APXvYqzgyeLNZRhxaT6+cMYAnD5+MSlIz80FG7yWLvCV3ImveU4VHtjoCXDLn3Uzq3d5Lq8Gmf2blg==
X-Received: by 2002:a05:6a00:5b:: with SMTP id
	i27mr21325680pfk.112.1580668501176; 
	Sun, 02 Feb 2020 10:35:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id
	z27sm17761809pfj.107.2020.02.02.10.35.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 02 Feb 2020 10:35:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Feb 2020 10:34:59 -0800
Message-Id: <dbcf3b0eb10ca61d3122342eb4efe90c49179441.1580668334.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580668334.git.raj.khem@gmail.com>
References: <cover.1580668334.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] musl: Update to latest on master
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
X-List-Received-Date: Sun, 02 Feb 2020 18:35:00 -0000
Content-Transfer-Encoding: 8bit

Details on commit delta [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=83350eb17b9cb355e3f08b0340c4f1e8c437fac9..e6093b5a870a38ebfb3e54382acd48c698bde15d

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 629872050c..f4853b4f2e 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "83350eb17b9cb355e3f08b0340c4f1e8c437fac9"
+SRCREV = "e6093b5a870a38ebfb3e54382acd48c698bde15d"
 
 BASEVER = "1.1.24"
 
-- 
2.25.0


