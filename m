Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 843BC78461
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:52:03 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id b1so4930704qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=UdwKpLftzhl7r+3OKhr5FBF4KBhKqd5NKkHXUZLmXKw=;
	b=SV+FCuf5PTTL3BQEgL0sMFmlJYYb/Xvr1OofXh2ivT+TtoAh4hKRvTHPB6CvCspuTv
	5b7mbEvGCUvai4DoejFajyVS97pktPA5NnDe+w5AsjtiNxbWrNQnFZVr9G1BqVgWMS3R
	ma2CUI+OkTnHShXYPGGUxuIAHTVRTp4dGYO4sPhxzHRhFAMp7EITTVrnMNL8AVy4qENa
	UnOE2CWmqKVFdI85ZHS6eez8GZQXlRfSzgToFajQ321+nbPRpGampCgP65TK0OYokQZq
	hblCtZo8Z8a8nWwiX+A25/Ah/xOSvZYc45FPNAPyf7znc+f7R+UMr7hBR/CXXXUmC225
	USLg==
X-Gm-Message-State: AHPjjUjn9ULxax+ygQ+kd1+FCs3u9Y4wsc9TxHfZGbtXM2Q7kfCseaCI
	sk3Dc6oYJM205jtw
X-Google-Smtp-Source: AOwi7QC+JX0pbgWyBKNq1DAynDm4ZfyE5oJU9SPMY37w+EyqTT+O4lJk0pLFqN1PI3Bx5fnhRTJmdw==
X-Received: by 10.237.37.228 with SMTP id y33mr11985146qtc.79.1505220724029;
	Tue, 12 Sep 2017 05:52:04 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id o5sm8036936qtc.16.2017.09.12.05.51.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:52:03 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:51:56 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:26 -0300
Message-Id: <20170912125031.4009-9-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 08/13] go: rename go.inc -> go-target.inc
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
X-List-Received-Date: Tue, 12 Sep 2017 12:52:03 -0000

From: Matt Madison <matt@madison.systems>

to make it clearer that it is only used for building
the toolchain for the target.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6:
- new patch

 meta/recipes-devtools/go/{go.inc => go-target.inc} | 0
 meta/recipes-devtools/go/go_1.8.bb                 | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/go/{go.inc => go-target.inc} (100%)

diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go-target.inc
similarity index 100%
rename from meta/recipes-devtools/go/go.inc
rename to meta/recipes-devtools/go/go-target.inc
diff --git a/meta/recipes-devtools/go/go_1.8.bb b/meta/recipes-devtools/go/go_1.8.bb
index ef8bc14383..08ab793f86 100644
--- a/meta/recipes-devtools/go/go_1.8.bb
+++ b/meta/recipes-devtools/go/go_1.8.bb
@@ -1,4 +1,4 @@
 require go-${PV}.inc
-require go.inc
+require go-target.inc
 TUNE_CCARGS_remove = "-march=mips32r2"
 SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
-- 
2.14.1


