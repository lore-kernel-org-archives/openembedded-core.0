Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EA4207F9A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 14:44:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47WmD24nY9z3H
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 15:44:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575902642;
	bh=XSiTtxGDFWJQfC+Qasmfw60qYE9vIbT3xaNFDFk4t2I=;
	h=From:To:Subject:Date:From;
	b=fH5A7d9+F8fpnRC1KfC7eo6jHzBeb6TDyYvXAwv0yXcqb2eh++fCvA2MjDTStILi1
	haHBkV4pKU7rVJl6WrypY3Na3dB6LqXvEIZpecGy2RgL0Jnl7SfeRk39ZofkMYvGc7
	2lKaZpkd/f4TSMjdKr2Gt0Ccn89DbgHrtPMUP/r9y4ZEKYwt/Us8AEwiVb7XMCzHUR
	AsQCdV1KlmFfLZUTnrxB3K4ps8n2v63Uo0ia/PUjzGJpFzve5s6djXlOzfb/gecfO/
	QdQvYcZ++j1i20myJk0aVGOqWlJsrW7BezCNLlZ1BSM9grZsLJCmJTGBUAZqAgNR03
	KpNF/1pY0/4aBBIqs5V5gKTodwN6OtnQegiDNtc2NRsqT1ndWxhdK9NlbEWmgf0a8X
	gdC47t8+Wm7nzTEd1btbBCP9ER8dLPORY3IuWNDq79UgsgVZ8D7xIkazeqhEZGd7k0
	TichVlNBv9/P9vxQClTez+QOb6xQA/EoM8cY0pL54N2Nu19Ct1OjrmtHuiUZlFgyq0
	r8dEweV+Uu5IZ9E2/H4rXduBp09Jdxtj5LLk0P7aqpS0Y1HKoJwczI+7QB6Fn5rLkg
	3ZLwFT53ByFyHYYxlz+zbVQtzulTXQVfnn412ChoDeT4lIUQw2KiGiKDd/r5I2FqAo
	FUTJxtrxCuS+24WCRN9WWeDQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 16:44:01 +0200
Message-Id: <20191209144401.11378-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systemd: Rename the files instead of using PV
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
X-List-Received-Date: Mon, 09 Dec 2019 14:44:03 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb}      | 0
 .../systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb}      | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 --
 meta/recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb}  | 0
 4 files changed, 2 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_243.bb b/meta/recipes-core/systemd/systemd-boot_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_243.bb
rename to meta/recipes-core/systemd/systemd-boot_243.2.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_243.bb b/meta/recipes-core/systemd/systemd-conf_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_243.bb
rename to meta/recipes-core/systemd/systemd-conf_243.2.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 6965b3b482..18f17d28ac 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -19,5 +19,3 @@ SRCBRANCH = "v243-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
-
-PV_append = ".2"
diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_243.bb
rename to meta/recipes-core/systemd/systemd_243.2.bb
-- 
2.17.1


