Return-Path: <shantanu@senic.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 100A671A18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 19:12:46 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id r71so4273687pfe.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 12:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/lQnTKlFj3GFwe2GsK8kaK3crjV3m2trLnake2+i0aQ=;
	b=L89Tid7jNbu50/SolmVg1Ggsk4YXotEdctWRSjmXrtR7eofdFcRXJpxLLF9Vvq/CR9
	O38iTLE8oFuuVmnkMj/VbOND42fFJ8FjXEudc7qx0j1vHMBPl4hA2JLTqGw8tqZOC1+9
	6IKf057lNFdmZGY2FbRqvTCiIWT9839O2IVnnILAOa6nEOwDOsgV9S0mMg23XW1E7rri
	GymcX4O9BJDKH906dvO5awszRMCpuD2Cflhv8Y1nOWSvbnXl7jqIdsjyAg7nHNDp2ahH
	c16B8DBbSnBBdjHyJZh5iKR96G2E1+ERfzLohx6T5wyGA9/ogBL46LDR7AeV1+lgNfRx
	EGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/lQnTKlFj3GFwe2GsK8kaK3crjV3m2trLnake2+i0aQ=;
	b=sMEWHOJonvaCLeuJQOOx3tURgLXw9AR5QgLxIdAiwKfqlN/SvXxr5ccbLWe7QjgAWD
	EZNffgC305rZNR/xFamMPxDC0laTs7zclwK82CAbG3tMtpjf3MdaPm5ucH0FUf9veGD2
	HNnLpKFILRyif9DQ0GPObymNrcfAcYKSQByagEdCbDIO+ZwwTNZENfi3ixyuMeUeOA+v
	aFHtOQFzAuNQTV6flRIA1wccj/l95UnbfXlSsGvmUHGBlwc3Zzkk2QivDCJU4JMWQLMR
	lUyU3uWEaRHc1p670YGquyAFr0RCF3Vl5oXD1so9Htkr3xDVLbDoHXdbRgScgndhTrdU
	wApw==
X-Gm-Message-State: AHPjjUiuuRGkNJyw+zjW+6qX0Z3ErEHcZW1WySFUHFc7sYUfFB3ftSGg
	9SUBObPO4749New3EwgcD61iTts1
X-Google-Smtp-Source: AOwi7QBZqud52QKRwOIGp4B7wpAzZZCdz6B4D1xht30SA1shCYhpXgPGXEMCLv0MD4PQN6Hq1ly1TA==
X-Received: by 10.99.97.5 with SMTP id v5mr8599055pgb.89.1506366768075;
	Mon, 25 Sep 2017 12:12:48 -0700 (PDT)
Received: from k-bhumi.domain.name ([45.126.64.155])
	by smtp.gmail.com with ESMTPSA id
	d23sm6502029pfe.115.2017.09.25.12.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 12:12:47 -0700 (PDT)
From: baali <shantanu@senic.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 00:42:18 +0530
Message-Id: <1506366738-1064-2-git-send-email-shantanu@senic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506366738-1064-1-git-send-email-shantanu@senic.com>
References: <1506366738-1064-1-git-send-email-shantanu@senic.com>
Cc: baali <baali@muse-amuse.in>
Subject: [PATCH 2/2] curl: Added missing build dependency of nghttp2 to packageconfig.
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
X-List-Received-Date: Mon, 25 Sep 2017 19:12:47 -0000

From: baali <baali@muse-amuse.in>

Signed-off-by: baali <baali@muse-amuse.in>
---
 meta/recipes-support/curl/curl_7.54.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.54.1.bb
index c22c827..04aeee7 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.1.bb
@@ -48,7 +48,7 @@ PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
-PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2"
+PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
 
 EXTRA_OECONF = " \
     --enable-crypto-auth \
-- 
2.7.4


