Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id A4DD576BE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:18:50 +0000 (UTC)
Received: by pdob1 with SMTP id b1so58158301pdo.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=xfTG1k9G9uitvttjF+oiogSih57BDrwONmUuLFVclug=;
	b=wvYH8NnHB+q4eLm4a3AxhDqZhYwGULW1d1wKd/r/HcaktXFfd2bbJO8+dA2NiMX+ck
	IqTzjvw8RAIvroGY81xURCzkBKOMj0OHmNQ8YpVb0wqkPF6UAq9aNjZqwxhke+OxJV/l
	X9xobXtiuGvTTr5CWMiseJcA+Ymg4RzgIbzVQ6ICs7vAMLm4AtQnDy1tVMQyfs6dWo0Q
	0NbiB4HY30NUbfZ0NrC2LOzuQ40mpduLi2HWLJCVWzcskcX4f1qS03V/sVsXNTzpblUE
	QDgxTya8IhlKkkEENwUvTlLNnK3cJUe55WFb8P06PFQvemzO2mdMbTLIbAKJm9Ppde0u
	ACBQ==
X-Received: by 10.70.129.102 with SMTP id nv6mr49573948pdb.126.1440454730748; 
	Mon, 24 Aug 2015 15:18:50 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	mc1sm18565465pdb.14.2015.08.24.15.18.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:18:49 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:18:35 -0700
Message-Id: <9da00495ad901a0075f1030422706d94428447de.1440454289.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
References: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454289.git.chris_larson@mentor.com>
References: <cover.1440454289.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/7] nativesdk.bbclass: set sbindir to bindir
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
X-List-Received-Date: Mon, 24 Aug 2015 22:18:51 -0000

From: Christopher Larson <chris_larson@mentor.com>

The sbindir vs bindir separation really doesn't mean much in this context, and
toolchain-scripts.bbclass doesn't add sbindir to the PATH, so set the former
to the latter.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 30bcdfe..f74da62 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -56,6 +56,7 @@ base_prefix = "${SDKPATHNATIVE}"
 prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
 exec_prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
 baselib = "lib"
+sbindir = "${bindir}"
 
 export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
-- 
2.2.1


