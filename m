Return-Path: <nick83ola@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id C45DF7E48F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 14:45:39 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id q64so5948301vsd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 07:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zlx6nTC+wqoqNdAEMhMqUaAo63dStRfJmCt4gh1U0ng=;
	b=OixKm5VPKOayPkGrBvK4jvHJqdDarHjjgLPW3BhT8CRPpPRAuvVDDD20PZUq6Oa/4l
	kdvnkR7pKQp+teiNQJku7D5WX5rN6MmW80TYiPtquW1pw76w7WWjS7Zc8Z+NR+o/QAo5
	VM2tQeUWLn1UYMfwIDkBJ1u2FvMOLhMqcXQO6R2oS5dV5Ot769uSUcKl+j6SFrGWX91q
	fVFBYC6gR0uZmAdAUBKd4Z8/Lqb3UMrrYvWr+sEFu5TG0jgulUNxx1LgRJDd//GnOHwn
	MgZBdaNThKg5u9PGlajbG1Dt+sSs6qiX9ZaiV2L8FXfargWlwlq6QjcbPO8fhpvRZoyC
	dEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zlx6nTC+wqoqNdAEMhMqUaAo63dStRfJmCt4gh1U0ng=;
	b=nb3tp/zqVnOIc3mKX9Q9rX44kvad1bUmgcflzs1EN90LulNbRNTafdSV/Sb4u4SA6b
	WWjqLB5s5E9+Y8johZ60mCIUHTnCmLwcqy+ZCRB7AIpJmLsW902BiFjFrsaQysDPd2JC
	Kjuth3MM6KpsIt366F+EcWtXSrlYFh2ot9ix6ab/IRlKFNYHFhjKkhyXiSHW8Wlk5O1a
	fZEE4FAq9TVv9FXVFwjz2Mhzyf4M4rsIDeIQ7JDGo2BM0shCbuy/zvnokoR7SPduog9D
	d+y/9krqvnbZTCyb7QPj9SgDhN32e2I5RKOrxy9eId5VtdHPUEgsqx/7NTogT1FIbLrB
	qW2A==
X-Gm-Message-State: APjAAAWJ2jeRjHIwxz8l163vLzwmA2EUy2S9lZivvQKZssocMBQBaK1W
	4xGVbFkz+lfIl8O5CsP1lIuJjdCsurc=
X-Google-Smtp-Source: APXvYqxu7sp7NIZCZ8IYAKjA06Wq3ORG2O+eS8+y3kpT+68sGsizcz1SHf940JHO3h3LWu4+kWnPMA==
X-Received: by 2002:a67:f4c6:: with SMTP id s6mr41601397vsn.193.1558709140072; 
	Fri, 24 May 2019 07:45:40 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id a95sm747485uaa.13.2019.05.24.07.45.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 07:45:39 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2019 15:44:49 +0100
Message-Id: <20190524144447.24103-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524144447.24103-1-nick83ola@gmail.com>
References: <20190524144447.24103-1-nick83ola@gmail.com>
MIME-Version: 1.0
Subject: [oe][meta-webserver][PATCH 2/2] nginx: update stable version to 1.16.0
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
X-List-Received-Date: Fri, 24 May 2019 14:45:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
deleted file mode 100644
index d0613ffeb..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.14.x branch is the current stable branch, the recommended default
-# 1.15.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
-
-SRC_URI[md5sum] = "239b829a13cea1d244c1044e830bd9c2"
-SRC_URI[sha256sum] = "002d9f6154e331886a2dd4e6065863c9c1cf8291ae97a1255308572c02be9797"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb
new file mode 100644
index 000000000..cad0db6fc
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.16.x branch is the current stable branch, the recommended default
+# 1.17.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
+
+SRC_URI[md5sum] = "97207283f30cd90cdba638c3ea30323a"
+SRC_URI[sha256sum] = "4fd376bad78797e7f18094a00f0f1088259326436b537eb5af69b01be2ca1345"
-- 
2.20.1


