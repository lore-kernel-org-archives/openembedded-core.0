Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 84AA376536
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 18:47:40 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so1745122wid.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=l+l/VJfSW098O3eyh0ZqTe0GpKKK/L1wEGxkPRpNZSU=;
	b=qe49iPIhqZf+xmM845iEhirROklIbEnaY4FXzFT+r5jlU42zKlLXoGpQmUl+CV7ITC
	+Ntw3ugz12zIwwAwgjACi/YhXTZRuTRcBvYcDmzfC2z/I2z3zAwc2kxVp9yaftqX3ll/
	EV0HXc6EZiARktLcHZCJe/YPxaqUdCxSJqS2rW+pez1mATadG4KFzyWq8y3c+nxJCbxg
	Se5m5a3Zrrj9jdgrbxEZI3pZYAROU/nfGgpFQyXgBITamg1j6YQGq0J4z4R8cv64eFd1
	PDsbVg+1N08F5ULlvM3aKGcfVhOhznEM2BBnI5Fud95ngqDxFpYiP5LUxc5Aoq+QL0IZ
	BAnA==
X-Received: by 10.194.5.74 with SMTP id q10mr6578655wjq.27.1440701260738;
	Thu, 27 Aug 2015 11:47:40 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ul1sm4326362wjc.30.2015.08.27.11.47.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 11:47:39 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 11:48:25 -0700
Message-Id: <531a2a54e33ecd94f85ef0df43733d1fd685905f.1440700983.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440700983.git.chris_larson@mentor.com>
References: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440700983.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440700983.git.chris_larson@mentor.com>
References: <cover.1440700983.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/5] iw: inherit pkgconfig
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
X-List-Received-Date: Thu, 27 Aug 2015 18:47:43 -0000

From: Christopher Larson <chris_larson@mentor.com>

We want the dep on pkgconfig-native, not pkgconfig, and the convention is to
inherit pkgconfig when running pkg-config at build time.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/iw/iw_4.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iw/iw_4.1.bb b/meta/recipes-connectivity/iw/iw_4.1.bb
index e1e7c12e..556af2b 100644
--- a/meta/recipes-connectivity/iw/iw_4.1.bb
+++ b/meta/recipes-connectivity/iw/iw_4.1.bb
@@ -7,7 +7,7 @@ SECTION = "base"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
 
-DEPENDS = "libnl pkgconfig"
+DEPENDS = "libnl"
 
 SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
@@ -16,6 +16,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
 SRC_URI[md5sum] = "68c282285c71c956069957e9ca10a6a7"
 SRC_URI[sha256sum] = "14bfc627b37f7f607e4ffa63a70ded15fa2ea85177f703cb17d7fe36f9c8f33d"
 
+inherit pkgconfig
+
 EXTRA_OEMAKE = ""
 
 do_install() {
-- 
2.2.1


