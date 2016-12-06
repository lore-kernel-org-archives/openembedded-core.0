Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A2075719C1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 00:19:37 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g23so18725413wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 16:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yXWCvAQetbcgM5IpIqF8CXCQXb1J74ShOomsbi0WQyw=;
	b=dRYhcLRH9pBnr+P9cxsKNIt+3cB/FDNud4Uhng6sCTCNdXalARjbCE6Mg+V5f/jrMX
	rgmDkptDsoTbUmWXDohbu+7YncsxLWXHIKqebdsxjFRPzk6tqJSxvb7NKDFPb4PmrpCr
	Op1cXPuWpYIDeVdbnobGib0aa9FpiUq1jv7bQQ9a7t0wZpb4gJ9ouG8GcaFtSPz/pG53
	o3+gedw3Aw5XkGOR7iE+WNuqRCQVtYLCrGqLWiW2ftIn6NbQrYCLzLzLOzO2SMhnNkyl
	dockchqCCCDCqsKXN1mispjsxxtXvCev7MK8W2qgej3Dp+el9LbQACjqYxV9TCvyPwwH
	2kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yXWCvAQetbcgM5IpIqF8CXCQXb1J74ShOomsbi0WQyw=;
	b=lCR598Zdyz8NGyPi/aYPt5M6npjeywjOzQsr21lSnqQdKbQLFocHeSo/mBDK56sMvd
	kXemOAEB7Mop43t/ExornuBMOhFu28G1YyENjPu2Z/WvXZguA7/4o4UFzhZbQtyc4uxa
	jWs8dSrSMkIQDPEiqVd1cQZbCAxPzlfhtu7VmkliyIbLjKX7iIgNP6xn6xIc7mHubqtw
	IB8By9iAMSStKTbHbszj5bpdPr2e0E/QP829n5F6OBL1V0V7ptROSdpnDXYUxJ23PFFQ
	BjfgatLpxeZjSOSb4P/vEhsKScmeut++oCdbqJBbTPl4flsjPQ5iIiLjBS6jG1JAWAMs
	eDcg==
X-Gm-Message-State: AKaTC03L7Hcig3ZFnJKr7zr6cbsyNrg8BHahEpxuuWo1jLzqlnQlHQTE58nFh2D3NncWIw==
X-Received: by 10.28.180.214 with SMTP id d205mr166766wmf.131.1480983578380;
	Mon, 05 Dec 2016 16:19:38 -0800 (PST)
Received: from localhost.localdomain (p579F7D52.dip0.t-ipconnect.de.
	[87.159.125.82]) by smtp.googlemail.com with ESMTPSA id
	u18sm1150972wmd.1.2016.12.05.16.19.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 16:19:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 01:19:18 +0100
Message-Id: <1480983561-11437-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] libdrm: update to 2.4.74
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
X-List-Received-Date: Tue, 06 Dec 2016 00:19:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-graphics/drm/{libdrm_2.4.73.bb => libdrm_2.4.74.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.73.bb => libdrm_2.4.74.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.73.bb b/meta/recipes-graphics/drm/libdrm_2.4.74.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.73.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.74.bb
index 3315014..c67d356 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.73.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.74.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "bc1cee09cde72ffe3b952e8f50ccdaa8"
-SRC_URI[sha256sum] = "96bfd39242fe168017d95f22e141645a35591f5902a7d98c2fa4ca8c31df5e4d"
+SRC_URI[md5sum] = "31964aa15bdea1a40c5941d4ce0962ee"
+SRC_URI[sha256sum] = "d80dd5a76c401f4c8756dcccd999c63d7e0a3bad258d96a829055cfd86ef840b"
 
 inherit autotools pkgconfig manpages
 
-- 
2.5.5


