Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE18734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:25:00 +0000 (UTC)
Received: by padjw17 with SMTP id jw17so35394174pad.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BI1uyakSoU4Zu3Z3KVmp7fgIxjbeCBLhqwwNod3yx1A=;
	b=lzhz2PVJ+tdEWT5vHUgNreFO9u+Mb6E7yr+AKU03KKrU5AO9xQiB5zCRqQg4kJFkoo
	RG1PZslpJ+ekwgj7tPoHOFmn/MO72xT3MqJQi+QZUDdj5rr6NTMQIf5F02UPeG0FDbaj
	cvLsMLAr5A9haK6Qr7NrX+wu3JdkgiGNp5fz9dV9ospC5C4qaCw0dXrrI+P4EdhL0VZa
	dDeYG8X+YVL7XsEClXNcDdasecM65QzU3jMuFG8nuUxBRcSQyfXBJNYIdN51NxuVhDsb
	8Dd/9Aodedpx4tO2pgvARzNXyCVEhnSodntVuoTTHFLf4idOQku1My9gO07gMO/9hnWM
	yaPA==
X-Received: by 10.70.50.199 with SMTP id e7mr72019114pdo.124.1433445902411;
	Thu, 04 Jun 2015 12:25:02 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id nm6sm4493240pbc.75.2015.06.04.12.25.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:25:00 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:24:47 -0700
Message-Id: <1433445889-7311-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433445889-7311-1-git-send-email-armccurdy@gmail.com>
References: <1433445889-7311-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/4] gstreamer1.0-plugins-base.inc: use x86 over-ride instead of i586
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
X-List-Received-Date: Thu, 04 Jun 2015 19:25:03 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 06eac67..97e2949 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -37,4 +37,4 @@ EXTRA_OECONF += " \
 
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
 
-CACHED_CONFIGUREVARS_append_i586 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
+CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
-- 
1.9.1


