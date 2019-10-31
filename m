Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0A47A7F98A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:55:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a11so5702377wra.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CHed2K/xvif/a9juZRNkCCnFxAJfAH/ImacyLYmW9zU=;
	b=PEiqKoB1izj4G34qMoEyzZUyj8I/xr6cxja1fsi/Xd2IwkT3hRh178FlJF+oEkANPs
	SQxSnz9i+G4ROYW0fCvZh/WnyDuqH2k/ChP1WaETdEk5N9PJjipgCE7W35SHRrHwfEHo
	38pXkfQ/tfLUJppqhU1hFBMN8+phh3cAVxs0ajLd76qFp+fkYFqLkQtJYoJVixW7jEHA
	khkNYzKNFg9Yj8JrZyefsHDxI+QVQLTkJZs2ILruAqBCtMw9fWUbnESN3/QtZcF76NyQ
	71Fcx2ROOxUGzZ0AWexQJAA7TG3/ZghulK/mbZ0wPvr+ygMeyvutUL5OijGZVla6Lm+I
	b7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CHed2K/xvif/a9juZRNkCCnFxAJfAH/ImacyLYmW9zU=;
	b=PzvcS6AfoKw3abwAi0cySB53v0TvIk9nZ2ruiif30OE/WLUVV2d2RSj0QL9ilBlTRA
	woRVTzGjE3f5YKkahvucBJfk250CJd4j1Pu2Efj4oV6m5MqKJbisi+XkSKFK5aZqf2Dm
	8fY2hTqtwXqStnCY06spYFjii/tW5fSTxd2AKIHrStaBnHO6Hi91D2aWka9+UJ+Y2uPb
	mY2ImhNqstmdTVPafiO9du5cwCNQhq5wT6auP6kjIX831owadxh9ZL2m7DI2+FwehAKy
	lppo6mHaMm3Px28KxZGOu/0PX/HCAqoIEE4ENu+zu30wzoecTrwY861idPNsM6tGH048
	BsGQ==
X-Gm-Message-State: APjAAAWODjVCjY7dwOLFVdCgbXpd9CqpQF8CcPytYIKPUqLe0luPJNYF
	s2YY4UaQ9yS2CG9hxZfDnpRPDXd4Sr0=
X-Google-Smtp-Source: APXvYqw8wGX2OlkAOzA6vYnfxLfElNxe1T0oyOFn4MfOrv2jkNAsloMMJjyQ9/4qHiCRMtewxHGRUw==
X-Received: by 2002:a5d:6747:: with SMTP id l7mr4783816wrw.328.1572519326490; 
	Thu, 31 Oct 2019 03:55:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l4sm2836496wml.33.2019.10.31.03.55.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 03:55:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:55:16 +0000
Message-Id: <20191031105518.7716-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031105518.7716-1-ross.burton@intel.com>
References: <20191031105518.7716-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] squashfs-tools: remove redundant source checksums
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
X-List-Received-Date: Thu, 31 Oct 2019 10:55:26 -0000
Content-Transfer-Encoding: 8bit

oe-core e37a1ecc stopped downloading a LZMA tarball, but the checksums were not
removed at the same time.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 53d37872710..0e1be6bc1ff 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -9,8 +9,6 @@ PV = "4.4"
 SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
 "
-SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
-SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
 
 S = "${WORKDIR}/git/squashfs-tools"
 
-- 
2.20.1


