Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0EAE07FA8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 11:16:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i1so6350435wro.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=h5tBwRRDA8JJKljGH23O3hpPCKDFVSN3OKccp4hK1qk=;
	b=iYqZsYvlRAGLCenTNlKqIiGq9DCB8PxFDMyo4g6Sz6EAOvxBpHFTJPd0ba/pEBxtOf
	1Jd+U1/gGwpA9rFBzo6wuBJW1vefndRcPs1+2hj9Sd9DkHFi0hfkovVSRd9QTsrnmEaZ
	+5zfU5WIwGGXvVO3ID0w2Ijhg1/x9ytmw2reV7YfJlf03/u2uOYxkQDx7zK2xnZooxam
	rfa5BKnCq/HokvEc0Cv1fz/nSR4+ouupZr+vDitR/5zT4873/yLA37hBsGOFdPrXQ2Ll
	hHIjGrFS/zngLdSODXFlePahK4aIJ7zLYrI4PT0PVjLbnSt8UNEybL9RwKKp7PRWIGIH
	SGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h5tBwRRDA8JJKljGH23O3hpPCKDFVSN3OKccp4hK1qk=;
	b=KqBXMUj0cXc61NoGYLXH7MWW5TmlzpgTNBuKG0thBUihsaXnFA4FLZxfbaQZVPNjWk
	uI2kDTxKIwTjBsjuQsvVifj8WfEH0iYOIyGklHyhAZ/ELRTctxE8vVNYA7O8XJNe7zhO
	J6LULDuNXyyIJHlp7H3LGHpmszQCSYQXqmlwVqNvaEQyQZWm84rZS/pTGc47/TaJgNhX
	s4Lo38IGouBiqoBHA4DyvEQWB0RoIOza5r4wBJfMMrhnJsb4Yx2ai+ltxGCT2Czdc0c9
	MPpOdRSbbL8KthsFhDe2NCQghJnMfyKm8dMa6Td0pKW8uIjAXhKvVcDsQRpyAr8I+NU+
	vNeQ==
X-Gm-Message-State: APjAAAU6RGgFu3NTlDlMVHAfgLFRqvlKU+u4Vijs6Qa78xUxdSH4UWcd
	VTfrtAHwiBXmpgDENA347z8AKqVSUag=
X-Google-Smtp-Source: APXvYqzqdm3sohGye/DzxaG53JLTmZYX1M+7HU+0ZcsWfTn9/tifZRuvX5XmW22RMACZWQabzRt08w==
X-Received: by 2002:adf:e48a:: with SMTP id i10mr11419906wrm.311.1568978166503;
	Fri, 20 Sep 2019 04:16:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t14sm1747724wrs.6.2019.09.20.04.16.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 04:16:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2019 12:16:02 +0100
Message-Id: <20190920111602.27927-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190920111602.27927-1-ross.burton@intel.com>
References: <20190920111602.27927-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] json-c: clean up recipe
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
X-List-Received-Date: Fri, 20 Sep 2019 11:16:06 -0000
Content-Transfer-Encoding: 8bit

Tidy the indentation of EXTRA_OECONF.

Remove the deletion of config.status which hasn't been in the tarballs since
0.12.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index fcc3e4337ea..38a150f4abf 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -16,12 +16,6 @@ RPROVIDES_${PN} = "libjson"
 
 inherit autotools
 
-EXTRA_OECONF = "--disable-werror \
-                "
-
-do_configure_prepend() {
-    # Clean up autoconf cruft that should not be in the tarball
-    rm -f ${S}/config.status
-}
+EXTRA_OECONF = "--disable-werror"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


