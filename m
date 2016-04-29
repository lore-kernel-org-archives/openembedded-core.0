Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9903C6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 10:45:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n129so3940170wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 03:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PKi5IAFlmfGxXObY82EVaPyB1FV3Bt4U0RA6PwAKf0A=;
	b=flZgJSudJDf+z3m/ZkRqg/VcW339L/pAHJCue/LRCqHvl1neVNQ2QL5fvroOvLlRZ1
	1kEntebgYNFP3hJuXHe+1rmC/JDEDJJGOpsKH2zFyXXLyuQbEPYlRYsXGKFPsYiycqts
	BpPkBz0Jv0FpXHFEJkL6GI1YPA5VXewSiad3GvXDIpPygD3qsPGzrj6ujwk0b2LXrKSk
	HHHI43kMfHg+wPa1mKBlQ9xOVmRnqWHzoOFw04h5TeG4WeOz2VpLPTUQNfS73bydNRoW
	16k6XWpLcGSy7jMk7M0keO43G2FhdRdJurS/MJvRP6Y9Rh4GqWCDh9XTtUC4QwupK/eo
	cZdQ==
X-Gm-Message-State: AOPr4FWt2GKvrffhmknCm4E05nfu8YRYF5Ux5tCksT+k1MeY2rxNEMSavn6scxUB3e55Nw==
X-Received: by 10.194.90.3 with SMTP id bs3mr21301468wjb.105.1461926753365;
	Fri, 29 Apr 2016 03:45:53 -0700 (PDT)
Received: from localhost.localdomain ([185.46.212.56])
	by smtp.gmail.com with ESMTPSA id i1sm6764446wjd.38.2016.04.29.03.45.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Apr 2016 03:45:51 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2016 11:45:47 +0100
Message-Id: <1461926747-23380-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] gdb: fix QA warning (uClibc)
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
X-List-Received-Date: Fri, 29 Apr 2016 10:45:54 -0000
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
index 0d28ee4..f208055 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 LICENSE = "GPLv3+"
 SECTION = "devel"
-DEPENDS = "expat zlib ncurses ${LTTNGUST}"
+DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST}"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_aarch64 = ""
-- 
2.8.1


