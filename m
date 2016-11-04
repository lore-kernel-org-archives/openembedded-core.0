Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C226C6AC37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 11:06:32 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so3363083wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 04:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C5LjVEL7hwJzxTZFtBV+UWT/gJofCwiyjMoht6aa+PY=;
	b=HYqrhLlMkwWOw5xM7h7dKVVgyqcM67VnjDmLFdt4WZD+4R3OanqVR849p/gNM92SrS
	7+6aQeWFM3TGTyB0mKtRzNMNAZllcIpnSDTLvxyCuFGobrb19WMgPAPl4JTjtXzMK4b+
	j5D6olu3ZD20gbL3/oYgmsAvTOUL5WnYff/9Co/f5mhY4Wy9+t2ziE+JzSvOxttIpBqN
	HBP39z6EBDWe+nLBEhHOFskKOeRDiLNXabCX9vHvAbhXyRHrYqzfRU/p5Ws5iBhpvGme
	+NwZbuqkLu4d2wnLt1udjBF/RO3dMwNPpQtfyUb8riFzcmE2chPomjZJsHxSmbWYuzE0
	waHg==
X-Gm-Message-State: ABUngvdGBy6z9+SVPbx4ezv9y4vaTow37JEMPlYHkj9p9iyMyW6/kTj1TDl+RXeCHwNveA==
X-Received: by 10.28.168.136 with SMTP id r130mr3072901wme.19.1478257593146;
	Fri, 04 Nov 2016 04:06:33 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c7sm13680606wjk.19.2016.11.04.04.06.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Nov 2016 04:06:32 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2016 11:06:31 +0000
Message-Id: <20161104110631.17621-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] cve-check.bbclass: CVE-2014-2524 / readline v5.2
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
X-List-Received-Date: Fri, 04 Nov 2016 11:06:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Contrary to the CVE report, the vulnerable trace functions
don't exist in readline v5.2 (which we keep for GPLv2+
purposes), they were added in readline v6.0 only - let's
whitelist that CVE in order to avoid false positives.

See also the discussion in
 https://patchwork.openembedded.org/patch/81765/

Signed-off-by: André Draszik <adraszik@tycoint.com>
Reviewed-by: Lukasz Nowak <lnowak@tycoint.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1425a40..b0febfb 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -39,7 +39,7 @@ CVE_CHECK_PN_WHITELIST = "\
 
 # Whitelist for CVE and version of package
 CVE_CHECK_CVE_WHITELIST = "{\
-    'CVE-2014-2524': ('6.3',), \
+    'CVE-2014-2524': ('6.3','5.2',), \
 }"
 
 python do_cve_check () {
-- 
2.10.2


