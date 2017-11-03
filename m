Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id BEE3577BD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:54:54 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e64so2922450pfk.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SPOl+yv9OSGTRhA3rfqlgpi2BNmh9uMq/BvPhXvi/PE=;
	b=VpYoab28mkzySClJAsnkq6a3WbkzG988ydbHaJ8ru2ORlUn+3FDJGKWDEyF+cbaZ0x
	j/oN0uLDm5Rv1a3BTq35Bl4DUxwot8gYgogAkz9FZ8bIPBVpH1DB2xTDHZmKJLDkRYB5
	O0Tuq0GtwV4FXd47n1Tyxu45haHH7yusF83KFHn/OvOm4hqdDHBacm9LmSXcMZ81kCHr
	R3bU7f+gh/ZiOmirnARpu4QJ7gOihk5DfrAtokMz6pih8dD4hYa/z1JSgUVzW1MwBjV7
	KsJy9NQXCZ4OTzPc6CGaEtbFRLHSLGaPSzRpvtSciwJbv2OL7PS+vwWqTos/Q0Nx9eaA
	uOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SPOl+yv9OSGTRhA3rfqlgpi2BNmh9uMq/BvPhXvi/PE=;
	b=H150SFRy3upZo3jn5flkFmxkurfPUHeIsXz/Nr7/eOl2CUBwD13gFL9oEurBWpn3de
	6rxBaYKBb4foKRaVrLle+de4Jf56+j6OeirvWdkCRhigb0y6DcgZdrdSrZRcKK4SZSBF
	vTVmMjdnqcmniMAwmgUaM5LTzjBnhDqfA3QMmCTyINXDjJiEsezGau40yBqR4H97y69d
	e6azY+rhbb68WfUJRyykQ0nycuD3Rlwb+Kk8GXh0nXh0MnFk1si9BchN27GTlSkgspWX
	Xpyc8h57ZPrufwyq6yRLjxRSwYaIdqCYj36T47SqO8P4N1MmEGOwuxfCX2H32RZJn1aw
	Kvbg==
X-Gm-Message-State: AMCzsaVwEvBz9LDwmCPdXP+ARmB3/CYZwDmoNVdcH2fP6+ua5nAIs+TD
	4dttSMxDdFaWEKEK4Y2Fl3laGQ==
X-Google-Smtp-Source: ABhQp+SvMt2X2fNRDRJK76BSSn/paVWAanT4grxmS6n1Z/KNNYbaz7lSjl0sRzS7OV+8kuL4ez4y7Q==
X-Received: by 10.159.253.6 with SMTP id p6mr7687832pls.212.1509738895813;
	Fri, 03 Nov 2017 12:54:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.54.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:54:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:37 -0700
Message-Id: <46b2c4824f11c90994158c2d7575acd9e52e1570.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 03/15] libxres: upgrading to 1.2.0
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
X-List-Received-Date: Fri, 03 Nov 2017 19:54:54 -0000

https://lists.x.org/archives/xorg-announce/2017-October/002812.html
integer overflow in XResQueryClients() [CVE-2013-1988 1/2]
integer overflow in XResQueryClientResources() [CVE-2013-1988 2/2]

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-graphics/xorg-lib/{libxres_1.0.7.bb => libxres_1.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxres_1.0.7.bb => libxres_1.2.0.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxres_1.0.7.bb b/meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxres_1.0.7.bb
rename to meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb
index 8c04c44..8c34e47 100644
--- a/meta/recipes-graphics/xorg-lib/libxres_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb
@@ -16,5 +16,5 @@ PE = "1"
 
 XORG_PN = "libXres"
 
-SRC_URI[md5sum] = "45ef29206a6b58254c81bea28ec6c95f"
-SRC_URI[sha256sum] = "26899054aa87f81b17becc68e8645b240f140464cf90c42616ebb263ec5fa0e5"
+SRC_URI[md5sum] = "5d6d443d1abc8e1f6fc1c57fb27729bb"
+SRC_URI[sha256sum] = "ff75c1643488e64a7cfbced27486f0f944801319c84c18d3bd3da6bf28c812d4"
-- 
2.7.4


