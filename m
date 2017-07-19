Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id DE1A7782B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 13:26:00 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id k71so5101346wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OGk16lRMWjLNsj3Ss913LXyeoBsxuI1TsFbL1ffZyBk=;
	b=DKYyuRCEUjXQxM5fQv5h3PqyOCEmwEjbKB5KZnXgjHLtzZRTGFrXi27Y8+mAWabcY/
	UAfbu6ZgUwhA9f2u9g/NaWGmpO3ikoFtg54jmtWP5cUxodtDfwcJtIfA/X2UPyT3Rrkm
	rZiowmW40jnwTxFZr8+APsPya4my19AqcG8JBi4KLfb7qSHsuF0V9hHqcjxfTbGUVGED
	ZE+6+f0Vgv8ZwGpqqg0vmw/8+xfEfhHNiAT/9gliEvlIMTgJsc709lwVC/Igj8gPdGqp
	sM7XMXRW9EBi2SHPYCX/8Z+6HE+9aStRKWYp7C4f9d4XxTCKHQoPtUFP+Ls1BfXGfegu
	wWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OGk16lRMWjLNsj3Ss913LXyeoBsxuI1TsFbL1ffZyBk=;
	b=RvbsWMJlcB6nh1UggV8cr3fuxcgPurc22ygf+vkv1BczMunTAlqZy1xDggjCKSdull
	1L7sjLmxfaJdGoMbKyqCt+bXrNhP5UiLTEhNwvgWqU+CHu2F6WIzdWy6z0UZ3kz+EX2G
	pnz3xTm5//+3QRQjUXoNcqDsJWwxHpV/USLdh+U6ayhBt9pPp4lRaK7AsTQ48sFYsJ84
	4tf6IhFSguyMGP95Yner/udtVEP4yc3diGtZ2BGRHwccTQKWvsLFGuP52/286/6TmjYA
	lED7i6ln2JkZg5g84IC4oxegLme8sRJH+x466N0sSb3uSDIBodF8ndTYfCgZewJg1hGu
	FW/A==
X-Gm-Message-State: AIVw11242fEy+cDESvah8Rtn4IQdgILGBSCCX9w1pJAWCWXZb6EAB771
	/4XibiGsvY9HytZzYWE=
X-Received: by 10.223.154.183 with SMTP id a52mr4425550wrc.47.1500470761468;
	Wed, 19 Jul 2017 06:26:01 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	p23sm4740453wrc.35.2017.07.19.06.26.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jul 2017 06:26:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 14:25:53 +0100
Message-Id: <20170719132553.5979-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170719132553.5979-1-ross.burton@intel.com>
References: <20170719132553.5979-1-ross.burton@intel.com>
Subject: [PATCH 2/2] libgcrypt: upgrade to 1.7.8
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
X-List-Received-Date: Wed, 19 Jul 2017 13:26:01 -0000

Fixes CVE-2017-7526, 'flush+reload side-channel attack on RSA secret keys dubbed
"Sliding right into disaster"'.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libgcrypt/{libgcrypt_1.7.7.bb => libgcrypt_1.7.8.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.7.7.bb => libgcrypt_1.7.8.bb} (92%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.7.8.bb
similarity index 92%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.7.8.bb
index 7f7d852fb3b..83351594ea1 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.7.8.bb
@@ -21,8 +21,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
            file://fix-undefined-reference-to-pthread.patch \
 "
-SRC_URI[md5sum] = "36ace8f8dc4b1a82793ae759bbfc806f"
-SRC_URI[sha256sum] = "0e72e91290d553c303095a50ea660279d8f11b76c6c86e826f470442fcdf1edd"
+SRC_URI[md5sum] = "5588b89b75b1353e2454b04c7b8368f3"
+SRC_URI[sha256sum] = "cb076b2efc7ba752f3d4c663c9ee0589a98b1d614fe90878b1facd607a45fd43"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.11.0


