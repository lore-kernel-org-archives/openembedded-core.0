Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1340A76DC0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 20:22:11 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so28134384wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 13:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=l+l/VJfSW098O3eyh0ZqTe0GpKKK/L1wEGxkPRpNZSU=;
	b=ppQjiqjmfpT6vWvJ3hgC7RPCcZU9aJgZJ+vTotvGr07AztHJPwJr1/brs6q9nlC7vR
	MbvzX5Apj5bvlhsEQY6OBkOUzRCeVWluEXFEsH6G98ZsU4axEbZ3+KeBkkN1Vl4nboH+
	0XaLr0D8gTFB8sLmLRjK0M4/2PM9EfiANdfxOLj/6YYGmhUR9+TzAaQxzDKrWqWa/2Eh
	EPZxABIfOLXslfCOq8dquKwTmgYobgndZ7i6sHeyi0ZcR4F156HnTHmgi5AjzpXC0Fsr
	Q6U/lhhDtoU2dylWETv5dlzuoAWi/BaufRP8hCVDxHxvpAczlj25KL5DeLDC0Qq+Eb3y
	0IxA==
X-Received: by 10.194.122.97 with SMTP id lr1mr13470890wjb.26.1440793331773;
	Fri, 28 Aug 2015 13:22:11 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	fa8sm5331474wib.14.2015.08.28.13.22.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 13:22:10 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 13:23:00 -0700
Message-Id: <531a2a54e33ecd94f85ef0df43733d1fd685905f.1440793291.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440793291.git.chris_larson@mentor.com>
References: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440793291.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440793291.git.chris_larson@mentor.com>
References: <cover.1440793291.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 2/5] iw: inherit pkgconfig
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
X-List-Received-Date: Fri, 28 Aug 2015 20:22:12 -0000

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


