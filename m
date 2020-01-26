Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7C54E916C2
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:16 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 2so3729806pfg.12
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mPhKbvnKWpUTSoMPMDhW7yWF+mAO8cdwA4tOXb1MSuk=;
	b=KxlPlOVlTvC5IS1mvOPjbmuuLP3n6I0MPFcYkhInaVLT+aWTvVGnzNZoBhsx6Rym3q
	CYa0uldW9LvgSoe9JmTOFNfYH7GjyhJRjbasj/xfEyCed2DqhjQZh0YmYOQOzz35uCg/
	OeiMSOL4RY3yknVaflTDZNNs5oQIBo/khNfVh06idFSr06gkEyur2dgUN+27mVnTnm6x
	7Wi6pRfjXixZaA3iIJsB20tAt/wU0USXPcJ0KfoOvXwc7PSQKeUhKZTrpCxfsh6uuwhu
	HlLL7FhC+AD6mU1+XH86juLnRrzRYHS3OBHyC3Q/4zxZStaL+Rb/loSn+QjdhEVXIX5d
	aCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mPhKbvnKWpUTSoMPMDhW7yWF+mAO8cdwA4tOXb1MSuk=;
	b=FjphIIXMJ4TfLkapAYOn5lI+6/DhJRMMQj3uBBCwzBnSA1GkDzr40bO6PJkAt76QK2
	M7lUs2HmFQkPDVfffO5cOsRStzLdm9e+fZxDIRu2XvjL5Nk7LL+XkWBl33Vdvw20go3R
	oKKvmDrU6bkbcC6o4+moWhFVBsZxI7Xciw1i30D1Vla38aJZo/HUBvSW4JoY/k7VBRFb
	CvQwqBoJc9Dc89KivLA7XIQhbQtaKhfVanlgDxx0b2ivxa8XnA9ndnEWbhiEfoGKDLGB
	q4ms/HyXmbNB+SDlhj7Nxq7HihpXQ9EcktoMBVUzD1npv4Gq2tpLUZ6Kbe0GXZC3IJ+g
	0zfw==
X-Gm-Message-State: APjAAAV60Ajp9/EGvokcXaZmMWZk/W2k9r0UDV9DMuxw/W0ZEgMShYHS
	cljOvvy/Tevv76xKFVA8wrW0tXOj
X-Google-Smtp-Source: APXvYqwXkQBSx8bjttbSAzyeoU7YlP2R5FrTVf2rW34pe6hVJ4JbMuA1+FrjCAFzufOVbpX4M10iTw==
X-Received: by 2002:a63:e042:: with SMTP id n2mr15706290pgj.308.1580055917531; 
	Sun, 26 Jan 2020 08:25:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.16
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:51 -0800
Message-Id: <8e76d2508da411a1a67f3226465c83fec85dfe97.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 26/29] openssl: Whitelist CVE-2019-0190
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:16 -0000

From: Adrian Bunk <bunk@stusta.de>

This is only a problem with older Apache versions.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 0e65f333e2..af2217bd15 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -205,3 +205,7 @@ RCONFLICTS_openssl-conf = "openssl10-conf"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
+
+# Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
+# Apache in meta-webserver is already recent enough
+CVE_CHECK_WHITELIST += "CVE-2019-0190"
-- 
2.17.1


