Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A09F2776E0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 21:59:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w207so20742710wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 14:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rc5lu4nfRnWU0Udwcy9csGFt9eHYxL2ndpklOrAUl9M=;
	b=M1YgMG9VkkBrad7cE8AZIxuOIEEFOmuJRpyTQ+uH67drlXTUcKtODLmfBIeJ/2zciw
	At6ha/28KFmwaRrQsOgnOZp3WPvvltEiFmadzI/KbJdSvx39S0S/h5CZXFgZOaRwzrtS
	uOriK36XcvU0NdkzfXGtBmUJBTO48d3gYbS7IvZEJ++j0IQ/3ChtvCb6Do7HfTX9Gddn
	mlcpMneusgjONcrKjluwOs2Qhb0PtIixhGtN/sHv5jtjFqQo/T41moLBlz51xnPbsrRs
	8Lb6fxyRWKAsTZmsJO9DriRZz3EvMcF3xu9I7GdpolD9dBkCw5NXieMrf85vwYtbOf+T
	iphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rc5lu4nfRnWU0Udwcy9csGFt9eHYxL2ndpklOrAUl9M=;
	b=SpGb1xwOcYgqHnHjgBTAvp8FG1H6pVx1SwDYjGRTKCXJkAMTOsq6TEuxJdNpHW4EKL
	KA0lxJkrDbqWlnRYeHWIvBUhO+4XJlLDzUqnG/hDpfBUXgU+kkr8Ht0lHwxNs/70qBMj
	BZ9qHluOBVD8p1ktc86fTKE9dLWhszVoPZ68ftYD1GaYy3Cl1AnDgXtRq2ERRcs+FS6Y
	i2lzc7AEvfnxVKSFPv9HnGlV9FJS1jyJSYiPqZ22nVXPrIEKsZcCRlwx+HLj1iZQORk1
	sMZD8wThh37FKN0ZoAXFh/prFGvtrKOE4dF3/FKdXiTsejYyehAni0ps/mZhnFGYlMt/
	66MQ==
X-Gm-Message-State: AE9vXwO+5gxvGr9/0yertXqOj8Pytw8ZBYIREET6TgH565Jf8exhP5EGJ8iDZ7qm1iWUKg==
X-Received: by 10.28.129.145 with SMTP id c139mr712005wmd.102.1473199141398;
	Tue, 06 Sep 2016 14:59:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	n7sm23029840wjs.34.2016.09.06.14.59.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Sep 2016 14:59:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 23:58:59 +0200
Message-Id: <20160906215859.11941-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20160906214219.GE2645@jama>
References: <20160906214219.GE2645@jama>
Subject: [PATCH] lighttpd: fix EXTRA_OECONF
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
X-List-Received-Date: Tue, 06 Sep 2016 21:59:02 -0000

* --without-memcache was renamed to --without-memcached in:
  https://redmine.lighttpd.net/projects/lighttpd/repository/revisions/f3b577ddee36b9555331dfbcddb6a200df2ba438
* causing:
  ERROR: lighttpd-1.4.41-r0 do_configure: QA Issue: lighttpd: configure was passed unrecognised options: --without-memcache [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
index bba90cf..1a3f323 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
@@ -36,7 +36,7 @@ EXTRA_OECONF = " \
              --without-bzip2 \
              --without-ldap \
              --without-lua \
-             --without-memcache \
+             --without-memcached \
              --with-pcre \
              --without-webdav-props \
              --without-webdav-locks \
-- 
2.10.0


