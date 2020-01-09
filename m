Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2E31E7FDD9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t2so8877801wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=T2SVfuPy4aSTVjBUkYLVzFWAa/2l8VnUR44YJVDylLA=;
	b=o2RKLnUjARjqLMwrV0CwfQWFCbSXYFAHVBNmOBR+McMajkX5gX3N5uYTAbc7YbkkeF
	WWSbAYhrTPNzz9sEA/67RFBagLlSXDcODRPk8qVLe5OPYid08fefSRV5O/HDco4r4Fv6
	9rGpHr6U6nXbXvFf9CfBNCorGhwSU99GS0DWYEwJnz7vZHaa7LAHvfU95l/pM4ZxK0Ju
	nA+RPGd93VBGhUt1b9FWJUBn/WHR6VgiibJPgH6MyNYiTk5in238qX2c9oisXJmFDhZU
	UaKtyQ4lcvFGnxfG6Z6eRTMA/3BSaCuyYpLPuVt215NK2wsrFS5haD1St67f79PzFOvI
	O1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=T2SVfuPy4aSTVjBUkYLVzFWAa/2l8VnUR44YJVDylLA=;
	b=E00COUqkNqt5pa99ytDAI8rupTWNcjJPNbUIhI2b7BNGK/HQwczvwBbrl0zLqOi5yC
	ENuXgFwhYy0IwvIvMvGQOtAKFLjNYjqXDjViexGYd3pc8U4y45O8SXaKPCNv6MRU2dnv
	xAh8rb7vmPGgIxO7veulbLDPaBLNeP6FCI9c2FjWgOQSa/YhbsYUkiURV+FNBvir4571
	0CO+D2A2TAL37CluiClkOdwF8KV4ru2W0eOl9dT4EtDHPRE8pejJx1n5QUeluo5et6iq
	nN84H6f8yULoOR6aXzi17ern6Rz4uW8RvJXPbEBPmPxXBcGSNYqaWdWZ8aFVB9CbXfyv
	l2rw==
X-Gm-Message-State: APjAAAV1MGle1mTeciaWpPu6H1Tg3JwRJS6CBcvHNZVTUvXEqzgidhbt
	pbUgMTipmWZRgh3RmNydNV5c5ZZvRPk=
X-Google-Smtp-Source: APXvYqwE28tkifv11r+qTXqmFQSHAJT0AksizBIuk6x8nG4HTr/6X95kTxf+QQHBe0hiHGiZlHY+YQ==
X-Received: by 2002:adf:eb09:: with SMTP id s9mr13278082wrn.61.1578601594717; 
	Thu, 09 Jan 2020 12:26:34 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:14 +0100
Message-Id: <20200109202623.28936-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/11] itstool: extend to nativesdk
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was not done in meta-oe but shared-mime-info extends to nativesdk either.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-support/itstool/itstool_2.0.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/itstool/itstool_2.0.6.bb b/meta/recipes-support/itstool/itstool_2.0.6.bb
index 8290c5e581..5f358f463d 100644
--- a/meta/recipes-support/itstool/itstool_2.0.6.bb
+++ b/meta/recipes-support/itstool/itstool_2.0.6.bb
@@ -9,12 +9,13 @@ DEPENDS = "libxml2-native"
 
 SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
 SRC_URI_append_class-native = " file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
+SRC_URI_append_class-nativesdk = " file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
 SRC_URI_append_class-target = " file://0002-Don-t-use-build-time-hardcoded-python-binary-path.patch"
 
 SRC_URI[md5sum] = "4306eeba4f4aee6b393d14f9c3c57ca1"
 SRC_URI[sha256sum] = "6233cc22726a9a5a83664bf67d1af79549a298c23185d926c3677afa917b92a9"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN} += "libxml2-python"
 RDEPENDS_${PN}_class-native = ""
-- 
2.21.0


