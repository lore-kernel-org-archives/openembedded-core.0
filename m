Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD0CD71E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 08:09:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBQ89CjK023314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 00:09:12 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Dec 2016 00:09:11 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Dec 2016 16:10:29 +0800
Message-ID: <973c456f7b8348688aa23d963a1ee78a7f81a54f.1482739038.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1482739038.git.Qi.Chen@windriver.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] systemd-bootchart: upgrade to 231
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
X-List-Received-Date: Mon, 26 Dec 2016 08:09:12 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../{systemd-bootchart_230.bb => systemd-bootchart_231.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/systemd-bootchart/{systemd-bootchart_230.bb => systemd-bootchart_231.bb} (92%)

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb
similarity index 92%
rename from meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb
rename to meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb
index 9ce629a..1d88036 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c
 SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https"
 
 # Modify these as desired
-PV = "230+git${SRCPV}"
-SRCREV = "dcb246b46239259ec99b3c6e6ab7d27e1a5a8a84"
+PV = "231+git${SRCPV}"
+SRCREV = "9ee2ffc1dc6c8209725e625954bbd89f96cb7139"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


