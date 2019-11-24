Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id E9ECB7FC9E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:03 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 207so6122339pge.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=907LQXxsoJPewJqDNUbLSNwlkJMVSud6CJ0MnJvb53A=;
	b=d8n2ZGF0NcjAw7NrlQA+jcKqCdzJ0SJ7fqB9DzbV/KGTLJ6IVhAEAxlt4lld5HazKJ
	6DdVxzjscAavmanK5K+pY6jh1jjzDKSx/da//e8y1dNrJ+Xw6U7az6KxSVpHi2kUB1l2
	7deEhZWK5offS+9pSTNeCEi0UdTG3e9sC49oG7rvzPFD1MfC8f+eivf4x1wLitkzNObc
	JSimEIRaUYJ3uXCgyzmAaQY7NV/q0jBbm4SxTXsCmPeSV6SKKL3r+nv60IHBV3j8Htjw
	S3HJ07O4cV8gHvlOQbJkk3hpAnrHVdogDZAgnWFpn4N63tMrDHZgwfXBjc7Vs9qUs34t
	fxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=907LQXxsoJPewJqDNUbLSNwlkJMVSud6CJ0MnJvb53A=;
	b=dqR5wJwG9+ia1GagON0d8lr3ft1D43U6eRWV9SG462TDLsWZ8FqCfd4FA9LUPHPXjM
	AyG+wQ4XG8KMYjz44mxib3Rm+l24IZMzFJm1kDHPqI/MWR6Jrv7NmrrAJCZtuLkFqzZW
	fXDkWJ0NP0+Z3+fRhsByeO/1OmqOGmfBCCtYY8g1KcOlFW4lmKNegHm9hfDzwSkW8IKf
	mlGSauW/kemJxk7lV1BVM6Ykujo05lIxnSo4jK5A/Fqm8t94KtsH9gXIKRS5UHNahq7P
	mKK5vPepC1Il7nhVJbpUZdtI8PRIjvoW4PlKYu/JZy86YRqWS0gISwQORVMWlHfLgsH3
	fsMg==
X-Gm-Message-State: APjAAAWizVJjWu8jMBH2cCiwmMa5T3ryP8h1mfJb7fBSbEZfCfoX5lgs
	ijTcTnNrJ1w80n4tL9npN1dmzArS
X-Google-Smtp-Source: APXvYqzxTFgcKJjwD6XCusmx9i95/95kAuCXRbonH8iWDIos16xZgSUkGMGTSkeWo638v3pzcRK0KA==
X-Received: by 2002:a65:60c7:: with SMTP id r7mr28841055pgv.420.1574639464879; 
	Sun, 24 Nov 2019 15:51:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:27 -0800
Message-Id: <4c6a5f122a09506783cb3ca2594c8ae21b974805.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 22/35] gstreamer1.0-vaapi: upgrade to version 1.16.1
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:04 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{gstreamer1.0-vaapi_1.16.0.bb => gstreamer1.0-vaapi_1.16.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.0.bb => gstreamer1.0-vaapi_1.16.1.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
index e5dfb61..61cf705 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-vaapsink-downgrade-to-marginal.patch \
            "
 
-SRC_URI[md5sum] = "8c3f9ee3e47cbdb75a94f7183460b721"
-SRC_URI[sha256sum] = "4e7fce626ee0590dca74b5a8341d25bac76307945131a970b414fc5895f5171f"
+SRC_URI[md5sum] = "15b08f76777359d87b0b4a561db05f1f"
+SRC_URI[sha256sum] = "cb570f6f1e78cb364fbe3c4fb8751824ee9db0c942ba61b62380b9b5abb7603a"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.7.4


