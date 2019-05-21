Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3667DF94
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 22:28:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w8so57355wrl.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 15:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EZXYY5UoyucecmPZzFFH1vsnJgQJ2FHkN3Ow+fLATEE=;
	b=JHCUpXK0RuHfiphiETMfw/ighRarmy8LV9TUftJy5JjCVggNZLw2ZAHJOqxG50BQYq
	9eX5McR+f5hpdVjjL6C0eLb07/xLRbXMUH1gAfThmw7JuVKXLnDmjleVIKy12od5LCvm
	LMz5nORDjRt0jRPkZ3J9XOprTFjzRAgD0l3kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EZXYY5UoyucecmPZzFFH1vsnJgQJ2FHkN3Ow+fLATEE=;
	b=LmuaqfQMhAoOSKYd+dhqc7hylmKT1ZugO/QPwHXx7hjjUCs8Ozwok1Rn5dP3B0RMeS
	BWwMqfIqG0w+Qq5WY1zhUNih1a5wmi91UM2qJOStYDplH8fY11tt16TN6Ot6fwIsuokv
	tqjnWYJbAWOlEmwACDxwANkrzfuMg2KJrK+xEE7Xtqh0D/+ahaOfaxDqte2yI1zTc3Rs
	hqsReiXw2yJe0yO8UB3fdpNMY26pqaz7QZIrF4MNd78o0AY+pfhtMgdTKXHy9SDzOVv1
	WqoqhRDfv7rTLnBqF9RnEuFm9zA8V3rp9VUau0h8v2c+18BKw6XO6+ThOLUGDoRSKjde
	lRhA==
X-Gm-Message-State: APjAAAWSRF/eKxA9NcL31/zLvQ7XK6I0CuTLKWxnj/YVFYXPqQlesPq+
	MXhAx5RX+G4OeRpDair50CvtIqmrzOw=
X-Google-Smtp-Source: APXvYqyTJ7a2GlP0RIxnqtig2HUl9ilVoo+V/HMhKMVLRhHfT9Qd301JgWTnfyx0bSVHEwwjmlgsbA==
X-Received: by 2002:adf:ecc2:: with SMTP id s2mr47206658wro.258.1558477720825; 
	Tue, 21 May 2019 15:28:40 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z74sm5585446wmc.2.2019.05.21.15.28.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 15:28:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 23:28:34 +0100
Message-Id: <20190521222835.23928-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
References: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/6] m4: Add coreutils and dffutils dependency for ptest
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
X-List-Received-Date: Tue, 21 May 2019 22:28:41 -0000
Content-Transfer-Encoding: 8bit

The scripts use options not supported by busybox utils such as head and diff
so the full coreutils and diffutils utilities are needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/m4/m4-1.4.18.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
index af0ff45863c..81ed65edd94 100644
--- a/meta/recipes-devtools/m4/m4-1.4.18.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
@@ -53,7 +53,7 @@ do_install_ptest() {
 }
 
 
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make coreutils diffutils"
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
      locale-base-fr-fr.iso-8859-1 \
 "
-- 
2.20.1


