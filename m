Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 6B7ED79CE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 23:58:57 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 006AE1C001F;
	Fri, 14 Dec 2018 12:58:56 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 12:58:51 +1300
Message-Id: <20181213235853.11206-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] attr: Move attr-only patches into the attr/ subdir
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
X-List-Received-Date: Thu, 13 Dec 2018 23:58:58 -0000

These are not shared patches between attr and acl.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 .../Remove-the-attr.5-man-page-moved-to-man-pages.patch           | 0
 .../attr/{files => attr}/Remove-the-section-2-man-pages.patch     | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-support/attr/{files => attr}/Remove-the-attr.5-man-page-moved-to-man-pages.patch (100%)
 rename meta/recipes-support/attr/{files => attr}/Remove-the-section-2-man-pages.patch (100%)

diff --git a/meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch b/meta/recipes-support/attr/attr/Remove-the-attr.5-man-page-moved-to-man-pages.patch
similarity index 100%
rename from meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch
rename to meta/recipes-support/attr/attr/Remove-the-attr.5-man-page-moved-to-man-pages.patch
diff --git a/meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch b/meta/recipes-support/attr/attr/Remove-the-section-2-man-pages.patch
similarity index 100%
rename from meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch
rename to meta/recipes-support/attr/attr/Remove-the-section-2-man-pages.patch
-- 
2.17.1


