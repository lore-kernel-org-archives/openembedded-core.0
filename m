Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2C73670A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 21:39:37 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so2396670wgh.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 13:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Ae7jVn/gcIezF8WWQIUO5lEzgwdVYo6Z/5b3prBD18I=;
	b=CY2wy3Q4QFZSJf0z4f1dBHxeLamwV3AO1L4mtiz+PIxaqakJJ3a+iv9CM5Ki9UHsM/
	Ymrn3iDXEMIc2z4+9EJjTjuZD3pqIeeXwnlOEhHi1G6rfQBDlQdQgx+AR4p2D8Jq0tmr
	SOCI0ldX8PvkDm+ThwR86PTxxLDKssArEVg9jKbdDLiEX+ylbkkJ4I32PqAWZ2beZpow
	JZZUMlBxiYEjHJKmpRwG9KSN7K4QHWWPMZ2oMtlGuW2Yy9k535qw6sDwtFIayjB6S5d8
	0fjKAIrL2QOOWM9URDPPuq0alIheuEi9tEXIFt8EeRjqfN9JiMNQ7+NvJF7pdH3lKt6o
	8M8Q==
X-Gm-Message-State: ALoCoQnRK4KdNB+Ow7T+ceyKBKSB5CINbwa1DGH8BgmuMmwLGud85BWgTw4tEgQW5KTWSmcWjIej
X-Received: by 10.180.86.38 with SMTP id m6mr34022625wiz.65.1416260377436;
	Mon, 17 Nov 2014 13:39:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	kn5sm45639740wjb.48.2014.11.17.13.39.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Nov 2014 13:39:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Nov 2014 21:39:32 +0000
Message-Id: <1416260372-19557-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] cups: remove unrecognised option
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
X-List-Received-Date: Mon, 17 Nov 2014 21:39:38 -0000

--disable-openssl was removed in 2.0, so don't pass it to configure.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/cups/cups.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 6720c3d..16fdd4f 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -33,7 +33,6 @@ EXTRA_OECONF = " \
                --enable-gnutls \
                --enable-dbus \
                --enable-browsing \
-               --disable-openssl \
                --disable-gssapi \
                --enable-debug \
                --disable-relro \
-- 
1.7.10.4


