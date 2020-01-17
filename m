Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D9A527F98F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znM11Ntqz8V
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:58:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579280301;
	bh=UNNRl+VPBGKbDRgvoYphMl+lpxStHTt7FDTZKhNp3LE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cc2734S4+ROeWEdXjUr7bkxjaUVFgngWiJ3YejVuXMy4TaL/BRvriqff1Tqe8vIvd
	fLj6L5g7OdvarSzAegqJdpP8LSW9EneG/pQ+IHZ0H1UvRoTuJ1oMRKrRhAfdt+lg0w
	Y5YykxhNxjhf1OX8Zleaq/fFRA1iRR4dSU7ECFzNhgckJe+rZqG6J9V4HgT+3dLi80
	0QY7KMR2z/a5kZvhi94AGrc2kNdsx3hkwHLvThfHEESGX6DON3UnrUfP7ba34KXzh0
	cyrhPTMO0RonvfM3E71xZnlAONo44ImCOuDAeC3s3kpiQll3n9jpFH0gsywAeTGSjB
	NesXzIlA1WIgBJc/9CG+UgIEBd6mrBymqOHPTw7Xe1oF02VlP2+qGdmXgO3fcQVvSz
	vOaKKONr/TRKXc5qw6Y61BB6PcRPLJbuJXCmQFsfF8Euy1nsGO4fNvZYBma/8KeWs8
	zTE1dO/epUwjKwzL0HHC48EapU6vFQqSs5Wa+8Hx1cpxa/e0dqmPIC+r9IBHvZCXzb
	dAYReiMhHYnnx5sDDVpUrX+wJlKZ0SoyzYHxdlI++if/9PZoPO9z4nm8ljORDFICyG
	yzWfJBa7Qvv2HveRtHSUVFn/rMluk4psahW/vwnc68JTZ6BfjC0HUgrrIW3UYtzTJf
	QgA2x7dmdkmTkCcATPYB6dvs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 18:58:14 +0200
Message-Id: <20200117165819.2542-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117165819.2542-1-bunk@stusta.de>
References: <20200117165819.2542-1-bunk@stusta.de>
Subject: [warrior][PATCH] systemd: Upgrade to a more recent snapshot from the 241 branch
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
X-List-Received-Date: Fri, 17 Jan 2020 16:58:22 -0000

Bugfix-only changes on the 241 stable branch,
including a fix for a breakage with OpenSSL >= 1.1.1c.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/systemd/systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index cb41ac5b22..3161a6c543 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -21,7 +21,7 @@ CVE_CHECK_WHITELIST += "CVE-2018-21029"
 # Commit dc903ec516cb on the 241 branch
 CVE_CHECK_WHITELIST += "CVE-2019-3843 CVE-2019-3844"
 
-SRCREV = "511646b8ac5c82f210b16920044465756913d238"
+SRCREV = "d1cc09a6eac5f8d62e630cc31d604095e30d2d84"
 SRCBRANCH = "v241-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
-- 
2.17.1


