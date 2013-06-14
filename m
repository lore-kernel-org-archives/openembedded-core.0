Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1912061AD1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 17:34:04 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id c10so537762wiw.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 10:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=GAphyQ/Y5WFaFu8Xhh1qn0roafLyborIxjtEHefNoVc=;
	b=TfTYimG6FwpfZ0wfSPVP7oNJtSO02l3yxZHDxHPP8uj75zxVDfEsFXzoXqyV5xeodj
	Q7gqf/b/5z0okVMl3wyIZVeAGt9amOoWIsZyh5842UUIScEL5pk5HW3T9yv9WIeRrlhH
	C151Bjp0q6p7bbWHSgAOrvmEh7eBTfVQz0odFYFb7U61TELgdu+E5fJLg2nwC0QpLPHx
	A+JAusFH/eCQOu4MHdPi4IyTkZpDncbOEq3NlR8OEMTHKP/9He6TS3IUcVSDeNUykhsv
	YhMTDRkT8pZOVmA9Kiu2yiXGzYf3OMypU9kHGjUapyWsjwELjGvgHainkHDLkj0hECyT
	fQjQ==
X-Received: by 10.194.174.38 with SMTP id bp6mr2102715wjc.83.1371231245649;
	Fri, 14 Jun 2013 10:34:05 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id en3sm4724822wid.1.2013.06.14.10.34.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 10:34:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2013 18:30:41 +0100
Message-Id: <1371231041-23064-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlGNP3/h0t0ZEpPzkAjoRldXoGoFk9C0ZLpvhvlKlVEoC4IcRl+RV32XkbUqq7K7oRp7G+N
Subject: [PATCH][V2] atk: inherit gnomebase
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
X-List-Received-Date: Fri, 14 Jun 2013 17:34:05 -0000

This recipe was missing a dependency on gnome-common, so lets just inherit
gnomebase and get both it and GNOME SRC_URI handling for free.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/atk_2.8.0.bb |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/atk/atk_2.8.0.bb b/meta/recipes-support/atk/atk_2.8.0.bb
index a190c0a..989151d 100644
--- a/meta/recipes-support/atk/atk_2.8.0.bb
+++ b/meta/recipes-support/atk/atk_2.8.0.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 DEPENDS = "glib-2.0"
 
-inherit autotools gtk-doc pkgconfig
+inherit gnomebase gtk-doc
 
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "c652bd25530825d604dae1c1ebd2da02"
 SRC_URI[sha256sum] = "b22519176226f3e07cf6d932b77852e6b6be4780977770704b32d0f4e0686df4"
 
-- 
1.7.10.4


