Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE107F8A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:26:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l17so3205801wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 05:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EAMxL9cen2imH69UlrV2J8XX6d3rorZ4EreBxfi/BZk=;
	b=PSvKhoQ3mMcMONz+X1XrG7oPPt4PSh2WWMBW2gO6qU73SpOqc+1/Gdbyqyhu20Gjjm
	quBM8u7D0X8obxj+7F07WkU+XcZfN7ptX4WylG4R2gmbPSF8pQyWMHmMYiUJqqiAMlXu
	aIFLMjaNLfzamH2tvVxKZdT5a5GDqMFNmnFPM60Z6JULZzSfRZmpgpuNJnc1+PrK0CA/
	tfEl7R7GnPiNfcI+ajMyDgbawAzs9mfRTySjMR6JOIdJaayumx7GSdOLNm5Wa2j4q+Zx
	14sg6WvTbJNo7/tnI60U9+8N4s5ziQyohXmVU/zgbVEFfwk40kjlhxZIxUJDmlLTE88d
	nGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EAMxL9cen2imH69UlrV2J8XX6d3rorZ4EreBxfi/BZk=;
	b=R3Wxa8twAG00n/6mYmvaJXMnSzoNGfQSXl4s4lNVSuH1Vy2QqwOhHN93+xCL8r1pt9
	kNL9kH6dzqyDRvWx3IGRI/z+huTb3+KM+CR2KT18/x0MzEAFEy1dvLPDQVB7AnTCV16p
	4f69vbDRdUpgEUUC7m1ek3Ed8hvS8fKO/Nt/lfqSZk7W2Z+TQC10A4HtjY7zmC0g64FP
	legpY7hGLk06eJbtlatw+OOIFuDaKVDSdAHDGVwYsaHTxo+ySN3oL1RmaOpiXJ9dOXwy
	KoQJcFTd6dAuU/72uC/GanfZ8MK6rgQJ/MVi9azvtHCt86sB8UKJFL2On1UHaiHpo8Ve
	SO1A==
X-Gm-Message-State: APjAAAVD4m25eWqqUny7G5XX7lLm/axWfuqtaGWrXzXKNw5Q89FpuQwR
	albWXTABBVy5rUsvYYljxZRRP4PB
X-Google-Smtp-Source: APXvYqxRU5pKmgrFkBYmJtYu5nA3usgV0zhows6a+lKu+6zc6N63HeZ8M6sEWIl+aiWHujaWSvMsSw==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr5406307wmh.82.1574169980969;
	Tue, 19 Nov 2019 05:26:20 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	200sm3447380wme.32.2019.11.19.05.26.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 05:26:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 14:25:55 +0100
Message-Id: <20191119132556.107508-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119132556.107508-1-alex.kanavin@gmail.com>
References: <20191119132556.107508-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/5] dnf: upgrade 4.2.2 -> 4.2.16
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
X-List-Received-Date: Tue, 19 Nov 2019 13:26:21 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.16.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.16.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.2.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.2.16.bb
index f38167f1ad0..1373bccee23 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.16.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            "
 
-SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
+SRCREV = "4c74fe24c4232ce6bbde4b252f9715cdb29923f0"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


