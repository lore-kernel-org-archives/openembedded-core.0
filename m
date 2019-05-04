Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 570CE745BF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:25 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t187so92571pgb.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=F903HldGgJJk6HpyDZ46fcSQrZ6iQgTqHUaOii0pGSc=;
	b=sSOZelWK1wlb2pAK0g3aPNlqq/4v8l2ILjV4eZ9VbH/OP2RCgGhm98lbo7S7Mksa+v
	YgtYpAQUTGbEc3sj7qDxS/Oyg1vxxfEOCclSetUb9TKA2JG1qS+Pa3j6oxH9cP6GToPh
	PYPh1x02E/ZqU2ojqXqXS+tZl4oX9XCAvGSiPhgDcwIaQEmbMG1CEtmWdklBRZP9bHfa
	GNxHOm4CU9aey9fUTLqCZI1MzS64WYK/MF3vk6EQPiWBJfSpnutvOccJMsSxkgolp0Qz
	mycUAQe5S//zYIdYj+wQ8GiMI20wWRZC/+f37Hg5Y4CAJ2bVyRZc2gY5O2hJRzVn5XQo
	fZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=F903HldGgJJk6HpyDZ46fcSQrZ6iQgTqHUaOii0pGSc=;
	b=tsL7IYFxsLw28O5MyIapzpU3387W2/jsfAjiH6jxFr83zfFeI2JlvCptwI4Ni57QAz
	clTzkNl58JhCsGJKPa1hQghHNKCbMbIGmJLMQ5xiFJ2QBeI4Ib6d1nj5HFe5TzvNofG1
	Tt0+yXnQguVQfMIzoPLjfStcNkOiUhlmOL9UzHRrBYv71iH978R+aJ1//csZdki2ZkMP
	QX6LHVNz2QWIBD3Jp/6tbu64HFwsWCFsRUcbtTSliF2ULcmNHDZ+R48lYb+PKsjabOBF
	UIaM3s1WgT1+bCOz6W+UetKXCqrZbpST0pnvoCTnix1VzfJ27BmAt2U5DeHTLeBAe+2C
	8sAA==
X-Gm-Message-State: APjAAAWa59EjnyidLRT3d5Ke/mX0JJw++Pe9V8vUNg20JALq2yWPrnct
	+p70m0Y3rIICDU4LdQ0YrAZBNXG9
X-Google-Smtp-Source: APXvYqyMaYzn3JF3gJjGcWb2FZmrwwqTTMrO7V+G+wEK5+NBvMLYlnJTq5qo96OXL5iUOV5taaWX+Q==
X-Received: by 2002:a62:448d:: with SMTP id m13mr20562435pfi.182.1556983646186;
	Sat, 04 May 2019 08:27:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:37 -0700
Message-Id: <61433a177c5ce19a0c560a6e1062bad8194cecc8.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 01/43] curl: update to 7.64.1
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
X-List-Received-Date: Sat, 04 May 2019 15:27:25 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/curl/{curl_7.64.0.bb => curl_7.64.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.64.0.bb => curl_7.64.1.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.64.0.bb b/meta/recipes-support/curl/curl_7.64.1.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.64.0.bb
rename to meta/recipes-support/curl/curl_7.64.1.bb
index a1b5e7d..47c28be 100644
--- a/meta/recipes-support/curl/curl_7.64.0.bb
+++ b/meta/recipes-support/curl/curl_7.64.1.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "d0bcc586873cfef08b4b9594e5395a33"
-SRC_URI[sha256sum] = "d573ba1c2d1cf9d8533fadcce480d778417964e8d04ccddcc76e591d544cf2eb"
+SRC_URI[md5sum] = "790c101927845208a9d7e8c429ddd1b2"
+SRC_URI[sha256sum] = "4cc7c738b35250d0680f29e93e0820c4cb40035f43514ea3ec8d60322d41a45d"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


