Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A1116788C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 11:22:27 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x7so3284669wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Z5SdF3k+/pv6iK+5ijt3hPOmzACku23wWGGv3hYRPQU=;
	b=ksX4AcMow5ggwVM1pDP7gUPIvVKalPN4CX+ri2eNCQgTfhTdeFeJeuHme4MgWKjUva
	vcft8jf1AHRdDkBfgCbsG37qWv5qgQk2ULeyCCifK7RjEjYxWaGaLZV+wro0EXd0yreN
	AWML8u1r6ja4n0cq6o3wElDOxEwLFKR4lHSO5Fuw+uK3uaAZpU3+lC+sEMFCT83Bkito
	yMIWMdoyDnjTFXh4z3K+E9ZD0CGXgY9DGMqLKzUQnR9HiSMANF4T+T/fGfX9iLsjtuZY
	+EiQSOgmiuXXTDdIxgsVEISalgqEZAsre9yuzso5IViLAstzNJeUBb2quzatzaW4/6nu
	hxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Z5SdF3k+/pv6iK+5ijt3hPOmzACku23wWGGv3hYRPQU=;
	b=XuNIHoDMNTvH7mZM3k2/VRnG4sM0D7PFQQ/ldUBe+DGXvPOVRCfAbC4Bue4hR1n/c7
	6YQo+nSKEQfVhM42kUGSJg4wI64xkp6qq7NKOgCRynxxjo8Be0EtZvbhFO/4QBh78Zav
	zAsjdZ8rHQrLgVHPtifVhoHjuy2P4c9ZTaR92zLzNxYComyW8rQEHGjiz4CysOPpKzQt
	fQxsGoKHm+BMoVZgYUHziVUOoZmOaKP4vx3XTqI7+MB8f6IOx3zJKTg9yhZ4/kl+gsCe
	FcEvsr7EQU13XzEDzMRTP3ng+slVS3m+1FgPhbCwY04yvdtYN/zqglHXXiA/IHgZmhU4
	2NzQ==
X-Gm-Message-State: AElRT7F5MEBgR7joxwmjHhQEYiEOOf+1/yPlmjRwlpOr5/UKmzdtAPOQ
	DM1ufDSfT+Dq+/caEAjNELCOXvrl
X-Google-Smtp-Source: AG47ELsyMmXAUflmATNP7kSXvBDDCXi2U7hM9a+QJtX0jBwFFmMxyid14a6uwZfECn1AFeGa0tD4sQ==
X-Received: by 10.28.155.66 with SMTP id d63mr1293532wme.144.1521026548293;
	Wed, 14 Mar 2018 04:22:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z197sm1703522wmz.24.2018.03.14.04.22.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Mar 2018 04:22:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2018 11:22:24 +0000
Message-Id: <20180314112225.22192-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] gtk-doc: always inherit python3native
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
X-List-Received-Date: Wed, 14 Mar 2018 11:22:28 -0000

My attempt at only inheriting python3native if it was needed was broken and
didn't work, so back it out and always inherit.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-doc.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index b8db4280bcd..3f731cb93bf 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -28,10 +28,8 @@ GTKDOC_DOCDIR ?= "${S}"
 
 export STAGING_DIR_HOST
 
-inherit ${@oe.utils.ifelse(d.getVar('GTKDOC_ENABLED') == 'True', 'python3native', '')}
-
-inherit pkgconfig qemu
-DEPENDS_append = "${@oe.utils.ifelse(d.getVar('GTKDOC_ENABLED') == 'True', ' qemu-native', '')}"
+inherit python3native pkgconfig qemu
+DEPENDS_append = "${@' qemu-native' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 do_configure_prepend () {
 	( cd ${S}; gtkdocize --docdir ${GTKDOC_DOCDIR} || true )
-- 
2.11.0


