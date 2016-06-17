Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 960B373196
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 04:24:07 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 66so5321781pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 21:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BPBaaYMcyx+vhFFdGn/KAwB0cl6nzENIM60YyAo9IeQ=;
	b=V94eNVIea9WAGHdKeVoaap8scchFafANoGKrxJr1pE4NxgkERTUop5thVy7t2WWucL
	bR5Qr1+NpqqF/06CxbXZAM4RROGfv18dgSCDDb/EAYF3eMZZ8OyZL852HkM/OWjnPW5V
	DJmP8FPG/oS6qNNRlI8SX2GGwtLUJV8ioxBtWdzuJUhKO6aMaCv3cvm4CSXQlC6Wt7UY
	CoxY/XooY5NAuisiudIhHkhyfV9wNhDsYz0AaMZXmCjOxoJwDu0eWBetqDwwipF5nq/T
	sOpXHEOhOD+C7bbYXtT62R/XBrhZG/Qu0qkPM/Zkz5zi7kkX9Se9MsH1T7zuU60ZPyjh
	K2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BPBaaYMcyx+vhFFdGn/KAwB0cl6nzENIM60YyAo9IeQ=;
	b=hyB0mEYnKt2JCPItaoj7G3+TX0orntghkaNTR67+eWacDt8MLT5bhHMqUKL6heuNzw
	7zNHM69FTZ+QA17BOMHITE5vBJnaPWEalIR1dqTsXbuLh8js1eP/OSXgbql1YXtzE+/Z
	U+9dJPrXBBq7eNcwwsQh/Qh8LDqT5b+96kj6nLwtzihrjnHpMqW6gOcvPXLe/g6562Nv
	a8vPTPH7/QwCr5SLNwORd98NaIpV+Fi/vjku5DAg+XaTU1x5HkZeq1OUdN9LJuAjwOeh
	NyRLqdAmnhzCiJP4RSyAEBkxaVe1cGh2EVjWeVGDr26d15YAYV8xD7MJCJL2MxknlqCf
	59LA==
X-Gm-Message-State: ALyK8tIzQ1RhMXB7/cTzAcASBrW/bWJRY9ZhJJEBYieoNx5IP/NCCHacWdUlrdTVNSII6Q==
X-Received: by 10.98.102.66 with SMTP id a63mr115019pfc.32.1466137447985;
	Thu, 16 Jun 2016 21:24:07 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	bw1sm56677200pab.17.2016.06.16.21.24.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jun 2016 21:24:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2016 21:23:58 -0700
Message-Id: <20160617042358.24237-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160617042358.24237-1-raj.khem@gmail.com>
References: <20160617042358.24237-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] gstreamer1.0-plugins-ugly: Add mpg123 PACKAGECONFIG
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
X-List-Received-Date: Fri, 17 Jun 2016 04:24:07 -0000

mpg123 plugin moved from bad collection to ugly in 1.8
since mpg123 has commercial licence implications its best
to keep it with a knob.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.1.bb
index 7c0d206..137f535 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.1.bb
@@ -11,3 +11,5 @@ SRC_URI[md5sum] = "b6f47bcb3d924f7ef8a8b33ac4d037ab"
 SRC_URI[sha256sum] = "8e656a9a3be60d7e7ed3fb8e2a22d070b1f54f95d0b22accd876360e659446ce"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
+
+PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
-- 
2.8.3


