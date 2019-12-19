Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id A3DBE7FE6A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:55:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id p17so5721537wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YDMnijgualrRgfGhpPx5vKsQx2KqawkqnpMeLxAQRTc=;
	b=pPnJJuBvC0Q061q+JB9jnsCFMGwO2O4+WiH/iwFXOqbhqBL5+mbXRztHIt/FShtX00
	fg3Hl5Zx+Qdzf6UAGu/g6Nf2KnQna4olC6DP668JlidcSoAXGq99F1zRnMXcTeoJVejg
	ShdxfAbfkLFUZQ8AqL9jZ+9gM11BkJsmjB3rFAgUF1zNr6iatSYVyxTcVlwFXub1wSxQ
	ubsC4g4ERNDAe0I8zj366rai3a59yjdsfyYbbyg5tBUAbj9FevsvR/vHCpPlCaOWF/7/
	xGWuz0AqHb1v99i+/R1sqfqe78DkO3YBvZAmnEbU5qLe6uCethJVj7GiZbHYaHQl1CTK
	PDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YDMnijgualrRgfGhpPx5vKsQx2KqawkqnpMeLxAQRTc=;
	b=OXLCE17c9F1ne5AI1QejiD3bfnK7pwiYofDK8enR6he6HHh7QtttFJbleL6ZqtpATv
	CIluV/nAMTuFSwtXchWh5eQZztSNd1TS0gaiuww+jSfeEQRE66YgAxZ5HTh/bmLB+g8Y
	S+1TEx0RmjVMkMzYtKZHigrASdOtYRR1Q+EKIYxCuituxZa5xT7il/Hw2nJYu8ooD1VW
	BCKxGN/ECE06mKoTFyDHJjv63QVXXmrfmJ6pgcNY4fQUX2et28FkMM2iUT+o1ECMMF3H
	eZSIKVcglxlg1Z8Geh2Yvtm+NfPbrvLtB0kOqYHMaDaBnbHa9RjHgsbiRPYf1s4LkNrw
	+z0g==
X-Gm-Message-State: APjAAAWxa/y4de+h3XMTRfdfu4fK6SowByIze+pXumPMRgPaEVye519F
	19AtjhiLxhyZKvAMDQ4NxJm7XI4vD8g=
X-Google-Smtp-Source: APXvYqwrMcMP9OQC+Z3HtRFMBkCcVZYqk/8vcpiQFYkYZjPmz58DvhTtD+LFUcABNJbkM42cvlLFwA==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr9969502wmi.149.1576763701176; 
	Thu, 19 Dec 2019 05:55:01 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m7sm6468809wrr.40.2019.12.19.05.55.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:55:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 13:54:53 +0000
Message-Id: <20191219135454.23080-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191219135454.23080-1-ross.burton@intel.com>
References: <20191219135454.23080-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] fribidi: upgrade 1.0.7 -> 1.0.8
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
X-List-Received-Date: Thu, 19 Dec 2019 13:55:01 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../fribidi/{fribidi_1.0.7.bb => fribidi_1.0.8.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.7.bb => fribidi_1.0.8.bb} (76%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.7.bb b/meta/recipes-support/fribidi/fribidi_1.0.8.bb
similarity index 76%
rename from meta/recipes-support/fribidi/fribidi_1.0.7.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.8.bb
index 67388840160..bab068f3b94 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.7.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.8.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
            "
-SRC_URI[md5sum] = "4c020b0f5136dd012ee00f1e1122f6aa"
-SRC_URI[sha256sum] = "5ab5f21e9f2fc57b4b40f8ea8f14dba78a5cc46d9cf94bc5e00a58e6886a935d"
+SRC_URI[md5sum] = "962c7d8ebaa711d4e306161dbe14aa55"
+SRC_URI[sha256sum] = "94c7b68d86ad2a9613b4dcffe7bbeb03523d63b5b37918bdf2e4ef34195c1e6c"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.20.1


