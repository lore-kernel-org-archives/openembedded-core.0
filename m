Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 91E8562252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:04 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id cc10so2506894wib.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ourotexVqOupL+NuM84s74mf9O5CwJ8UnnEFp4mIHKc=;
	b=Mlsr/CrzdFDebyEnfBa9EIxcnOnqjK28dBr1hgv3F50XtsBOMNeyo6/FZoYdf0loqd
	57vazucsXjedjrNZrHjRrMAFgzf475Aw7xeP3UuhtQzkBekcGZ4RM31iGYbmOtpichFY
	dJK6PbFLzOOImAz/dXGnFI26CwG+7APRErJNmFulwdFmBhZAgwLT/nLX5/NBdwgZuz5I
	dKhZtNL/ZRjAzbcsOMTJ0NvcNePW2kDmYJgRT+HmGPlQmpTAtLmYuPzAaU4Xf9MGAy2h
	K0cn6Q6sqD+Z1HmoM4Q3uVJ6gpegYWd0VCI3YlTpmjHZxwa0RavokymR+AAZhN9js55l
	/WqQ==
X-Gm-Message-State: ALoCoQlPTZpvs5vBsKTaxtJngZyptrfo1JRfBJiymarRQTnbrBGd79rWyv3C6esaB45GZifN8jDk
X-Received: by 10.180.20.40 with SMTP id k8mr22657377wie.38.1410177546072;
	Mon, 08 Sep 2014 04:59:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:29 +0100
Message-Id: <c67291b9afe3fc11feb01f3036749cb0884ec790.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 11/27] libxkbcommon: Add missing dependency on xkeyboard-config
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:07 -0000

From: Mikhail Durnev <mikhail_durnev@mentor.com>

libxkbcommon depends on xkeyboard-config

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
Signed-off-by: Abhijit Potnis <abhijit_potnis@mentor.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.3.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.3.bb
index 9b7b0c2..0dd2956 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.3.bb
@@ -17,4 +17,4 @@ inherit autotools pkgconfig
 EXTRA_OECONF = "--disable-docs"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxcb"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxcb xkeyboard-config,"
-- 
1.7.10.4


