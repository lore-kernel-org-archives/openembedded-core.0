Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.229.182])
 by mx.groups.io with SMTP id smtpd.web11.919.1610583611769895498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 16:20:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=dkimrelay header.b=eh2E6KqW;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 192.19.229.182, mailfrom: scott.branden@broadcom.com)
Received: from lbrmn-lnxub113.broadcom.net (lbrmn-lnxub113.ric.broadcom.net [10.136.13.65])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 91DB0361CF;
	Wed, 13 Jan 2021 16:20:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 91DB0361CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1610583610;
	bh=CzYbETc7zlNzrp3ZkbidDDvCdYhnozjZsHK+DjKaX5I=;
	h=From:To:Cc:Subject:Date:From;
	b=eh2E6KqWn3kmzHrKf2bGjVBi2POKikyGR3bKSbdjWGo/RskP22gIXjLzoC5lJKTKe
	 b6BVrx9fnOEaoSbUdzgCxUC1Qyvz+RfuH2dLRobg8EENNkGGHydl7bKpNvVEvnnsiv
	 EXCPOYKy8dByWYAaQeTXZZtXpUtsyuy7B8AchyaE=
From: "Scott Branden" <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Cc: suji.velupillai@broadcom.com,
	jonathan.richardson@broadcom.com,
	Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH] kmod: update 27 -> 28
Date: Wed, 13 Jan 2021 16:20:00 -0800
Message-Id: <20210114002000.28979-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1

Upgrade kmod from 27 to 28.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta/recipes-kernel/kmod/kmod.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index dabda2d57e..ccda9f2b73 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools gtk-doc pkgconfig manpages
 
-SRCREV = "819a125ca756003dce2d11624035b7fb605a8e99"
+SRCREV = "1ccfe994287119cc6cef37a7ca4c529d89de4b95"
 # Lookout for PV bump too when SRCREV is changed
-PV = "27"
+PV = "28"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
-- 
2.17.1

