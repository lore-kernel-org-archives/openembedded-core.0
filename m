Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id A1E25785D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 18:28:58 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id u185so35705421pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 11:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=TopO+WMaj+qX0rOSo2/JZgPepdBT5CdTQZu/7p3QjFA=;
	b=xqHs9+n/VnFA8lmTqkVPKD+gcIUVOo641fudTR5qUK0XHYteOKnzRkJz4C24/5kQgK
	MVtCUE/Qk2r7iGHjcSQBuQZRZL1DQpYo9DADuG1fDxGz6G/w9ncRnuocKtl7wwGa7vZ/
	ki7vbcP1oHey5X/FRuQ6XxdLP1oxC2i35bDLeDorVPjpX7Lw9xpS27XPPu4+kM/TvdWI
	ZN/DEtwzI+1c/EVr1vpLXaJBqo/GQefsp0m8KJ4oCtdrv/W3ezLtisvghVkmUiAD+wmf
	2+TLWlb8qgUjbjsv7cHWRhTLC2SblgGebRBeqsA7RFYUFJ6es6p9hIaXQ6RJVfjvemHW
	nuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TopO+WMaj+qX0rOSo2/JZgPepdBT5CdTQZu/7p3QjFA=;
	b=Hlkbes1YCl5EmatL4wC0u+xyFY53rzbaSfRF5AEr/V4EJJR5J+iUGTiYdGQnzYY+Wp
	dsM7e14OvfNpsJeQxPyhwhZVI71rwoPYRXo5WMKOWgf9udyluwT6cGJxkz+gpJ1kvz7t
	rPDPeE69PZIKPdSlZzDE+PO8SLyYkf/QrXRJCAH7tx9eaXuAts3sRm4I4JKxuEukJIYF
	yneij7ZoLuu7rlSeqRqVYf8FU9PfPzriENt4oMSRRuV1tea6HxrLkIO88wOWv6ly8Vsh
	It+EPiDrPx8MML6muTPSj9SSP66dTE8aRojoURytrjxnFcfkJRNshupQSORVM1VCW4L1
	AEow==
X-Gm-Message-State: AIVw1136Cfr+oPpc/D9T8TnThLclbyPQcb9jQYzCu0wCeBZthM++zMpm
	jiCReLXN7z/PNzqod3Y=
X-Received: by 10.84.224.137 with SMTP id s9mr18688377plj.350.1501525739566;
	Mon, 31 Jul 2017 11:28:59 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FE53.dip0.t-ipconnect.de.
	[93.232.254.83]) by smtp.gmail.com with ESMTPSA id
	d69sm25033399pfe.49.2017.07.31.11.28.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 11:28:58 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 20:28:49 +0200
Message-Id: <b36be49d6a0148121bf03ef0b93b7f854e72bb21.1501525705.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] autoconf-archive: GPLv3 + autoconf exception
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
X-List-Received-Date: Mon, 31 Jul 2017 18:28:58 -0000

The COPYING file specifies pure GPLv3, not GPLv2 & GPLv3, with the
autoconf exception in COPYING.EXCEPTION. OE-core currently has
GPL-3.0-with-GCC-exception for this in meta/conf/licenses.conf, so
this is used here despite the deprecation note for that license
identifier in https://spdx.org/licenses/GPL-3.0-with-autoconf-exception.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
index d77c37d..104dc38 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
@@ -1,8 +1,9 @@
 SUMMARY = "a collection of freely re-usable Autoconf macros"
 HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
 SECTION = "devel"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE = "GPL-3.0-with-autoconf-exception"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+    file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"

base-commit: da29bc17e4dd748f50b054c5e3afaf8d41bf4077
-- 
git-series 0.9.1

