Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BB0AE78447
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 10:59:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f140so11567141wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 02:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0Qwewi1v/NsuO1IH3ZSslEbPjqdIApDRUg3qIupXKVc=;
	b=iMAFWwgLtyLCevkbiQ69EJ+rIM7DUl/qnk/X58OfG17EccMWz360hQRISQOTz9Gv6/
	u/WG8Q2RkAnrFrED0TguDpXJWPdA6S72bN2MqiVwvq1cuFX+eZ7c04tWbjwjr8dst69m
	mrA9g6N3cPnnG0AV/1euMubfTJmXAkr3iTxK7cdYPJVEPgnZEHa0v7Xa/Qk1AZ3htle6
	usvgQW1svTMXbhvbdyFyy7DP9pLxKZvkXT5MbScs3eFlOg8fNQjEqUYAGICzAJVcaq8k
	xaBDOCQznP7ZhFByo9bz13Vfu4/XWyhoXjRt3jlGBWI3aQ9saW0fsLlFWqo83drKtj9i
	99aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0Qwewi1v/NsuO1IH3ZSslEbPjqdIApDRUg3qIupXKVc=;
	b=Tk6PvGycb3LhN7h1+EcdeBc5MLY7rbNdo5z3pUiqEKhjIetKzgfMepQVRzCa22HPDE
	+EL58yLUS+1xsrBOCAjE77+68uPKmzrZJUZFEukpGtflinXM+OEO4NPmJKJ4t5V3YHTQ
	FIcCpBoC5BkOqRZCT51jlrW0OjISWsNcI11Hnpyl0Skcb4584y3qY/KwzwoNqeM2mPNU
	Ggf8KqD6nR+77LgoutsFtH1zKHn/iY9k2/Z22vHQ2us1FA0sHiHfH6X80uCtI/xnrMh2
	Hw7UFMd5M4Tp6BGvX/ron+cooIX341tbXog3soW9obsR5wNm4AB/Na2LAQ6h91wECKdf
	oujw==
X-Gm-Message-State: AJaThX4FJNfNurvvxOtvDC2vC1PEbRE1fhWP6DSJJYGPFbwclYjOS5Y/
	eL82S2hBW27t4SKIiAsgrRxX3blL
X-Google-Smtp-Source: AGs4zMa2i3PhHwVGUYsAOPywJOyjPdb64uS1SPnWjBASuhCtWAlygDrUL028fZ47v8Z+MdA1+T7d9g==
X-Received: by 10.28.90.65 with SMTP id o62mr1490019wmb.16.1512039547230;
	Thu, 30 Nov 2017 02:59:07 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l140sm8879287wma.5.2017.11.30.02.59.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Nov 2017 02:59:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2017 10:59:04 +0000
Message-Id: <20171130105904.32364-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lib/oe/utils: remove param_bool()
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
X-List-Received-Date: Thu, 30 Nov 2017 10:59:07 -0000

This function is not used by any classes or recipes that I can find, so lets
delete it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/utils.py | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 643ab78df7a..1897c5faea0 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -86,17 +86,6 @@ def str_filter_out(f, str, d):
     from re import match
     return " ".join([x for x in str.split() if not match(f, x, 0)])
 
-def param_bool(cfg, field, dflt = None):
-    """Lookup <field> in <cfg> map and convert it to a boolean; take
-    <dflt> when this <field> does not exist"""
-    value = cfg.get(field, dflt)
-    strvalue = str(value).lower()
-    if strvalue in ('yes', 'y', 'true', 't', '1'):
-        return True
-    elif strvalue in ('no', 'n', 'false', 'f', '0'):
-        return False
-    raise ValueError("invalid value for boolean parameter '%s': '%s'" % (field, value))
-
 def build_depends_string(depends, task):
     """Append a taskname to a string of dependencies as used by the [depends] flag"""
     return " ".join(dep + ":" + task for dep in depends.split())
-- 
2.11.0


