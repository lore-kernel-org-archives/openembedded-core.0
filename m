Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EA56D77D11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 12:15:03 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7OCF29F013381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 24 Aug 2017 13:15:03 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dkr2M-0006Pr-Rh; Thu, 24 Aug 2017 13:15:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 13:15:01 +0100
Message-Id: <1503576901-24618-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503576901-24618-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1503576901-24618-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 24 Aug 2017 13:15:03 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] default-providers: Add entries for pkgconfig (due to pkg-conf being added)
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
X-List-Received-Date: Thu, 24 Aug 2017 12:15:04 -0000

This silences warnings generated after pkg-conf was added as an alternative
pkgconfig provider.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/default-providers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index e1cb2f9..f54fdcd 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -53,3 +53,6 @@ PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
 PREFERRED_PROVIDER_openssl ?= "openssl"
 PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
 PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
+PREFERRED_PROVIDER_pkgconfig ?= "pkgconfig"
+PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconfig"
+PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
-- 
2.7.4


