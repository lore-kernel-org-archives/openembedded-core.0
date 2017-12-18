Return-Path: <rruslich@cisco.com>
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	by mail.openembedded.org (Postfix) with ESMTP id 8941571A5E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 14:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=991; q=dns/txt; s=iport;
	t=1513605676; x=1514815276;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=Pfb3ksSWwqT4MhzG0wRvh1IYIP8M8WLt3kmiEheO0AM=;
	b=BSueaGP33kWlwbX5SABPbyNpEedT3pw5tFhpXRaMTsxMPsmJiS432/sv
	9uvZblAOq/qLfujSKZLlq2WHhzebLBCAWFSpZD/btjwHD/wUD5rTWMkVO
	12r56pZgvaOPsxxx8O6QnyzHEFn53hnxZ3dtZhbgTNpkoGUexFC/WF0Kh g=;
X-IronPort-AV: E=Sophos;i="5.45,422,1508803200"; d="scan'208";a="115801977"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
	by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 13:51:47 +0000
Received: from rruslich-ThinkPad-W550s.cisco.com (sjc-vpn7-128.cisco.com
	[10.21.144.128])
	by rcdn-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id vBIDpBR3009937
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Mon, 18 Dec 2017 13:51:46 GMT
From: Ruslan Ruslichenko <rruslich@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2017 15:50:51 +0200
Message-Id: <1513605052-9357-6-git-send-email-rruslich@cisco.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
References: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
Subject: [morty][PATCH 6/7] glibc-common.inc: set CVE_PRODUCT to glibc
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
X-List-Received-Date: Mon, 18 Dec 2017 14:01:14 -0000

From: Mikko Rapeli <mikko.rapeli@bmw.de>

All recipes which include this .inc map to glibc NVD component.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 613a13725db4e05539974cc7c66584a287d7b4bd)
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
---
 meta/recipes-core/glibc/glibc-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index bba1568..b05e162 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -7,3 +7,4 @@ LIC_FILES_CHKSUM ?= "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
+CVE_PRODUCT = "glibc"
-- 
1.9.1


