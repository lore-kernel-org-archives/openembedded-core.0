Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCBB7E3A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:20 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s11so10767604pfm.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pxXbn0ZUUdEtEdhmT+vB2iXnbaa4kBCWP3u1JsygGsM=;
	b=qMPoMlRfeW1d1AsUVkH0ytNbKy7W9ktfhnMi4lvbZl/CeIdBPCa5aOfc1a+P4SUx5v
	FWxZQhqM1WDYwS+TExxo45YJcrINVzUcaFU/qYgWbHIPHUijDwnEWxfJPTG4UfWlpR/g
	mn0m/Ad9pYHrrqOIXeqKGgjMaD+pw1Ya5q3SgN1khg5nqkosqUAg9KDGdMU3btUfgspT
	5Tjec5VoPeIRqQweJjrFbP64lDNnDgFfEDrc2u1h/A87a6AMHtTtAfzxhjpF+kxpiAvy
	8WBlfZJwz2wjxBY4o5l0rR6LpqdR613zjqvAsxAE8iKWBE/JbVNOAbv8vw9o8un3Gcff
	uAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pxXbn0ZUUdEtEdhmT+vB2iXnbaa4kBCWP3u1JsygGsM=;
	b=UcTw31FBNv3hOi2JQiz+C/78lLxbZxkanmgJALtch3lskZNh/qATE/x30hZSOT3Byw
	otRSYCznKaj/uCZ0rTKNBbHCKxOXHXERdKDr14xUWmfmpL3sLMcnt1NH4C1HHDBRplig
	DSGuYUWDYlyZ7H6PmioJba4CqgXYUFKWDl4YKWie+VWJJo8Wg7fUeebh8YDZ2+7ft5q6
	xqcMwVFvdDrJKyYHxhQiD+qgdirwBrlBp+dof0fT4q63MYAEXXD+z5+YlKuPBUkvf6/b
	vAntZecP8vLs/X1oBvFGLpGXd2e0PSJPL6XTMJCiOX8S13BGnfEnoxngD68PpH52EvGd
	0y0Q==
X-Gm-Message-State: APjAAAVlv5jC1c+QoPSqHBUhGFHIe4DzN5foXMHVy+TyHaR2s9VGv9NF
	7ktlDnk3TuOC1CG17MNrGx8wkfWk
X-Google-Smtp-Source: APXvYqxtM6Z86LDReEs6GufCVM75oc17l1K/k0sqtU2+D0fa8dJiz7VKJR7FM+MIsnHFyyIXIZQAMw==
X-Received: by 2002:a63:234c:: with SMTP id u12mr29257203pgm.264.1559574441715;
	Mon, 03 Jun 2019 08:07:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:58 -0700
Message-Id: <914d2967e04bcf76e1aef07392527ea3c2d257e7.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 15/21] perl-rdepends: Add missing module dependencies
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:20 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Adding these fixes the acl and attr ptests to work within minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
index f93bbc7..362d317 100644
--- a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
@@ -954,11 +954,13 @@ RDEPENDS_perl-module-io-dir += "perl-module-file-stat"
 RDEPENDS_perl-module-io-dir += "perl-module-io-file"
 RDEPENDS_perl-module-io-dir += "perl-module-strict"
 RDEPENDS_perl-module-io-dir += "perl-module-tie-hash"
+RDEPENDS_perl-module-io-file += "perl-module-carp"
 RDEPENDS_perl-module-io-file += "perl-module-exporter"
 RDEPENDS_perl-module-io-file += "perl-module-fcntl"
 RDEPENDS_perl-module-io-file += "perl-module-io-seekable"
 RDEPENDS_perl-module-io-file += "perl-module-selectsaver"
 RDEPENDS_perl-module-io-file += "perl-module-strict"
+RDEPENDS_perl-module-io-file += "perl-module-symbol"
 RDEPENDS_perl-module-io-handle += "perl-module-exporter"
 RDEPENDS_perl-module-io-handle += "perl-module-io"
 RDEPENDS_perl-module-io-handle += "perl-module-io-file"
-- 
2.7.4


