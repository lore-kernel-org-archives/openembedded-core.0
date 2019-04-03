Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 611657D3B1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:04:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n25so9203924wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i1z15cK+pxeM88okhoBfO8Cc9buWEeDOQ639wSWAEgY=;
	b=SQohyI+515m8el6/nFkmQhCvILHVRk/r8jQsSIUBrLLgy6bRD1Q18sptmwMzBfuA/q
	mzKNi02EzPiVkLJ2Lb8sJJyzQgwKcQEQwxffFtETGllNJkrd6xtzU4dJMMViSFmHnswO
	II5ZlknlX3Ygs2R7UlMVCJfU8eLDO9O418u6Wuo6NzHT/gQ5NeVp/mQGH2U3q9ePik1v
	lijklOaHhO4QIKvVFxyFHPYQASeHL3C14kfd14ZGK6N+zyAZD7USCed2mQdsLTpine5d
	kTwgeCgP2ShWgsoZ49EELLvna5RakCU92cL01lsGmAnzEhRfMg6Qpw9eJ8bvgOXK5+Tl
	/lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i1z15cK+pxeM88okhoBfO8Cc9buWEeDOQ639wSWAEgY=;
	b=f7I5V68D4dGoBiGmRKU9+2HfxWOZFqBkhlke8GRMOx9DsBPYiuoJgKsh+EjhSqeC6X
	BoOhqqoLbuRw0usF6TDGMmMXihPHrbZDU8N4KmD5NRr5VtT3JFGfx5xYVvobUSHRoCec
	lhZ01tmh/757A20rZcQ1n+6UzLCyVjZrLxtwRTEwQU7IEChM/I8Te2Pvpn65v+HKLC29
	kPZZH82pZEIRUqBNMtFrdR4KIjZiY9C9Iq7VloHIsTDVZy8K3CL83M7LNjbr6zKVAXWx
	aAcONFZ5b7XrwDR1YQ5ZBKhszwBSZIb+JHId1hgFPoIx6g5MEJsnkLgyRR4ap0/Pr9u+
	JqFw==
X-Gm-Message-State: APjAAAXe6zC2FYV2nWOBG9YtoOwPaG3g+JiKHrzNHl4Kb+yZ2avkOIwG
	8PQ0A9IHe+5kbCmOyGT6iCHpivnF8do=
X-Google-Smtp-Source: APXvYqz/Ymj7cQBPhYPGUsIlKSaoU+tjmQqn26MBG1jAHMb1atGRuXw4vbfnTFvLpuCt9UV440v3rA==
X-Received: by 2002:a1c:31c3:: with SMTP id x186mr707979wmx.82.1554311060917; 
	Wed, 03 Apr 2019 10:04:20 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o17sm17362170wrw.73.2019.04.03.10.04.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 10:04:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 18:04:08 +0100
Message-Id: <20190403170412.23568-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190403170412.23568-1-ross.burton@intel.com>
References: <20190403170412.23568-1-ross.burton@intel.com>
Subject: [PATCH 5/9] libxslt: update for new catalog path
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
X-List-Received-Date: Wed, 03 Apr 2019 17:04:20 -0000

The XML catalogue is now at the canonical path, ${sysconfdir}/xml/catalog.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.33.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
index fd442d44f72..28d404ca779 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -36,9 +36,9 @@ RPROVIDES_${PN}-bin += "${PN}-utils"
 RCONFLICTS_${PN}-bin += "${PN}-utils"
 RREPLACES_${PN}-bin += "${PN}-utils"
 
-
+# This is only needed until libxml can load the relocated catalog itself
 do_install_append_class-native () {
-    create_wrapper ${D}/${bindir}/xsltproc XML_CATALOG_FILES=${sysconfdir}/xml/catalog.xml
+    create_wrapper ${D}/${bindir}/xsltproc XML_CATALOG_FILES=${sysconfdir}/xml/catalog
 }
 
 FILES_${PN} += "${libdir}/libxslt-plugins"
-- 
2.11.0


