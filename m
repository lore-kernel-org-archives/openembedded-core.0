Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0595D733B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 06:00:17 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id m14so8654818wev.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=C14lwLGSW4H9IAElfgpChJgVRCoRbP5GgcpXind/eDU=;
	b=Pf2sxfTjdHMmZfXAG2U3R68SJGEWTD3zFn6Q2A0U6uL0kAvGeYUNsGifxnADbTUP+Z
	6NgflugNmTlIlQoCLwQQVg2/LNYopgKiMibwg5TkaiHpv3o1HUGsg6um4Cf/S9qE1pzQ
	aFoo4lFeSByVzb9KuOODze8Ouo3roxO8RpNtbSos2EwnpBA2R2c+Iu//XSF4J0CghKRP
	HQelX33sEYqk0uQSRURGQUpaOqUGDYH66g7YpGg2G5dhnFQy0t8vNUVNt3Lb0LmHsvWR
	aiM9aWjFGn4nF4NuZjh1sLZyBzBMIpA/KK+XLZkH5zQ6ePHckXMGHV/RzL73SMGx9XWt
	PkDg==
X-Received: by 10.194.173.138 with SMTP id bk10mr14351235wjc.112.1423807218607;
	Thu, 12 Feb 2015 22:00:18 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id u9sm8547638wjy.37.2015.02.12.22.00.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 22:00:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2015 06:59:55 +0100
Message-Id: <1423807195-7087-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] default-versions.inc: remove pinning of liberation-fonts
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
X-List-Received-Date: Fri, 13 Feb 2015 06:00:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/conf/distro/include/default-versions.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 6e92aa5..c41db46 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -7,9 +7,6 @@ PYTHON_BASEVERSION ?= "2.7"
 PREFERRED_VERSION_python ?= "2.7.3"
 PREFERRED_VERSION_python-native ?= "2.7.3"
 
-# Force the older version of liberation-fonts until we fix the fontforge issue
-PREFERRED_VERSION_liberation-fonts ?= "1.04"
-
 # Force db-native's version to keep sync with db while
 # 'AGPL-3.0' in ${INCOMPATIBLE_LICENSE} blacklist
 PREFERRED_VERSION_db-native = "${@incompatible_license_contains('AGPL-3.0', '5.%', '6.%', d)}"
-- 
1.9.3


