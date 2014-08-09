Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 291D870A10
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:07:41 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so3780559wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NRH1jmNL4YVhnA6Ef74vlkG3dt7p3nJKhAu0a+eM8qU=;
	b=CsjzW/pYuZKWCjgtXcSj5EIDWcPz+r/OjNgGWAUP8XNFy65yDkL5Ppt77Xp66wX5FA
	IxDgBzE5Mez2LcjQFMTXFs+9q+RD/xD3gsyVtSnOjdPOPboi/2C9Oz1QIPwpCwZBQl2m
	fDr3QkVf70PBPv3mEWvdmbp8+e3qsjNlndgu1t9prfrV+RZ9HpGn141X/Xl9Uy7HkBI2
	5Yhfhws8s5soSQ9YMZf2zPIty+7Q0veP5KrLQyUz12QXzzsDe8khK3ab1tAeDP2SQWFb
	OLNyjt6+esjVRPvxKhJdJwtT0LUpJnKpDIEbvgbnVpZRv5SLDtsCaE9+RGmmpqKrc5HM
	R8eA==
X-Received: by 10.194.9.228 with SMTP id d4mr3940854wjb.99.1407600462747;
	Sat, 09 Aug 2014 09:07:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l7sm25541309wjx.7.2014.08.09.09.07.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:07:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:02 +0200
Message-Id: <1407600483-31215-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 7/8] directfb: add PACKAGECONFIG for drmkms and tiff
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
X-List-Received-Date: Sat, 09 Aug 2014 16:07:42 -0000

* fixes following floating dependencies:
  directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma tiff

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 51dc09b..3dd0a5b 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -25,6 +25,8 @@ inherit autotools binconfig-disabled pkgconfig
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[jpeg2000] = "--enable-jpeg2000,--disable-jpeg2000,jasper"
+PACKAGECONFIG[drmkms] = "--enable-drmkms,--disable-drmkms,libdrm"
+PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
 
 EXTRA_OECONF = "\
   --with-gfxdrivers=none \
-- 
2.0.4


