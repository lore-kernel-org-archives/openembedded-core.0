Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 35A207E4E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 13:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
	bh=XrCdjVl+yQlkA+UEJdQkB9mCjNe1vIHMiPsjf9nbenE=; 
	b=cvctDzqV2GovvvrYKLrwqLHGvqAQTvpuUj8EZGgYcMe0/o4XFvAPWUR9adAaob7clr9gH2TNQYOPquI6Fo0Wgsrr9AQ69hEHH1akPYMZ0Fs9DtVjMs8XI/LtCpvtoyvLPhWFe/vKu5Vy/mxmrrosM4V2d/sgDjkSrxumj2dOUV64X1cVP+9+8RvSblqEdkgKcZQtpAMkkzXTRJpwnwoCpg2e0YSXq0Lysgr0ggSLobeoQJTBMf3G+H3VAq7W/kRhe3Oz4vJDjVG5vPgNIxurnh2D2NHyM7pxlD8xH4ADTL+udf2rxuJi3HgE4qalPW1aCnYOGs+J387x5jfWwplIqg==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=localhost.localdomain) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hWLP1-0003Q1-Df; Thu, 30 May 2019 15:47:31 +0200
From: Philippe Normand <philn@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 14:47:01 +0100
Message-Id: <20190530134703.16094-1-philn@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] libtasn1: Enable nativesdk support
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
X-List-Received-Date: Thu, 30 May 2019 13:47:33 -0000
Content-Transfer-Encoding: 8bit

This is required before enabling p11-kit support by default in gnutls.

Signed-off-by: Philippe Normand <philn@igalia.com>
---
 meta/recipes-support/gnutls/libtasn1_4.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.13.bb b/meta/recipes-support/gnutls/libtasn1_4.13.bb
index 9ee1913091..ea2dfe03fd 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.13.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.13.bb
@@ -20,4 +20,4 @@ SRC_URI[sha256sum] = "7e528e8c317ddd156230c4e31d082cd13e7ddeb7a54824be8263220955
 
 inherit autotools texinfo lib_package gtk-doc
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


