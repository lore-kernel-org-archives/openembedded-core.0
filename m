Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56C9370149
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 10:52:40 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e201so3949761wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 03:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MJQhX/CSaXOzSSAlrzojzK6/IpmNSS7Jke6OiZvXj4M=;
	b=DsAoZXx88/Le9s/2shqwDeNhTtMSNasfK/aQeRGyZ38QEbxAx3gZbfTlHVdB8WZr16
	XEk1KSm4g0SdKxrjXhJGxDBHXsgE7TfJZNE0Mi9ggWHwedLDCWJ/r8lMAztY/J5F3ytV
	Mqls+XxpN/9Az54m3YlvlSLUSfCoT9shghQgE8QmSfjYF0DSkf4vqtD4jlaaiS92N9Dm
	CM0bQaWxNrmyY3dUmC97wqsLF+/u9++YfK0BDV9Yx5+vtSBCLU2YCTxy9bMayVVEf3mF
	+JAdXMGCxauraS3O+q4GIoZB65ol0R58zzsB4U+HugqJggeiWV3jiPSH8A0YnhGLSG5A
	8LGg==
X-Gm-Message-State: AOPr4FWDl2uVErnHGVBVfaN2rw5TC1QEGfijaKVVL2v2aRdAQ0j6RcCHis0Zd/6OvrWH3g==
X-Received: by 10.28.224.70 with SMTP id x67mr3190199wmg.78.1461927161091;
	Fri, 29 Apr 2016 03:52:41 -0700 (PDT)
Received: from localhost.localdomain ([185.46.212.56])
	by smtp.gmail.com with ESMTPSA id
	us3sm14205822wjc.41.2016.04.29.03.52.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Apr 2016 03:52:40 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2016 11:52:38 +0100
Message-Id: <1461927158-24385-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461926747-23380-1-git-send-email-git@andred.net>
References: <1461926747-23380-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH][jethro] gdb: fix QA warning (uClibc)
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
X-List-Received-Date: Fri, 29 Apr 2016 10:52:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

WARNING: QA Issue: gdb rdepends on libiconv, but it isn't a build dependency? [build-deps]

We already have virtual/libiconv which is set appropriately
in all environments, so let's use it to fix the issue.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 166ba8e..303373d 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 LICENSE = "GPLv3+"
 SECTION = "devel"
-DEPENDS = "expat zlib ncurses readline ${LTTNGUST}"
+DEPENDS = "expat zlib ncurses readline virtual/libiconv ${LTTNGUST}"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_aarch64 = ""
-- 
2.8.1


