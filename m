Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6323.1795182826573577360
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GtA6tp3w;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso7217155e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182825; x=1795787625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dt/B9SfL0/WeDc9OgwBpfZ7ZRxcHO8ccyD3tvyMmp3g=;
        b=GtA6tp3wLwbANwsA1RX81Hl8Q53qX86YG7oW8OZyohz+Od9rZ5SS36X5h32g+s3d4G
         uKFgc1MC6pUptpw7AV4c1//T83bKEiIrM3cqohZKuFfPco8ZQwZJHpMjoPa7Xxd9aVrA
         +csPfF1ul/15N6BtVkRyu95NOWKdRm3g9LNPD2YFg0LQBnOgYTBkIjpdW08CAVwjN+Ph
         ThPa6MYW+gS6VUNTQPW5B50MJyGXlZThFXiRPaXNEzwQq/4CjZnrtx5Fw85BpU5M82CW
         kfKd7e6kG9Fm/YoakhYbNS2vin4wyRl4T6g+oBEA40imso4pwhK6OUzMCfk+r5FKrIlu
         8u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182825; x=1795787625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dt/B9SfL0/WeDc9OgwBpfZ7ZRxcHO8ccyD3tvyMmp3g=;
        b=0HPHczlC03swi/FxVuhrTUq7SpM1lx2VrscPaGeXQN796Y856cr6CC4Y015yZguBPF
         Z0DUpiBe5AxJNkt1dHR5qmBFo4YngcRpmFTroijvPdVHhaoVLvsLdgq2r8iYaNXdbVNR
         b1vjjrqP/VthbJJpH8U1U+Y8SMwo4ysaq6+GYh9fJ6i6hp8XV1kVDl4ZybRRnylULcyE
         wzMsF7TqpFJIbaMTT1qHIkwAdH1oN6FnptTVLzi2Mh7Vyx17NPtJAJ7szEiKESx+Ypd9
         h6h2qn0QgvVyB8DSYxgCvQQm6ySQzwoO3QbZRBxjflYQCuFA7064YYMWzdfV3JMiIJxB
         T9Kw==
X-Gm-Message-State: APuU4Z+7inblwj1V0ptMa7bTVNlo5eZ/KNwfOdB59qS5LU9kDV1x5nyz
	nP0NQK1B5BVOY59Ws1llS/wY3hN5+99hxBgWn61YuwUFzCIj6++Byzu351XDnoL2
X-Gm-Gg: AYBFou2+m/YTVHZ/3c1zsLPbaZ5NWPAltlM0CfU84OcVphOmuTm17RlK8tPd5x1JmIb
	tW8DhRxmqwgbfNZcf5hqPhAzgMjJi63PanvTJPdVourThApLQhyTBiiwjledjZVuEtJMHvhgslx
	c82yCd/8ZJNRqqF74P9/gQPToWWf+gv2+C9RBXEPf2/nOmAqFuyB4Hxs4TRcWLlnJhT8xrEpgim
	6iobvBl6q/w/DG01Jcs3/SNTLVQuc892bvFlOPW0aAf7Y3WCd6Z6qB+DZgvzlvOKN/ExnU/jiAE
	eSNZjjLXgVddAnkjlnbW9BPIdw8niGRI97088jt0f0iI5vSf3XcDENDcBPPddmS/tbSQiArj6WJ
	lPLbL8UqQD/yc7kT4eytDIeDzcAy3dR0fDc2ylwgkLNbwRz+398KrKfef9uq/DC6qCHbYqXP6to
	kocdBKt8SL+sxSnBCR/ZpX87kjZ+TX1njlhhbx437PxZmBcx+Q+Dj+aWgnZuZz77BvA1bvUGqr6
	4a8QeStVZMVDmPjl8dUS14OWPNFcWXSMWPdD9o/NTpJDruSxu1ElEwpucjoHLEFqZdru0LUyfAM
	hX1OJ1bd9tnyrRaR7bgIQZ63PIuMfOlt
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr69214955e9.32.1795182824774;
        Fri, 20 Nov 2026 05:53:44 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f6b6a6sm101009695e9.5.2026.11.20.05.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:53:44 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH 01/10] recipetool: create_npm: Give the fallback licenses as a string
Date: Fri, 20 Nov 2026 14:53:32 +0100
Message-ID: <20261120135342.2628228-2-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120135342.2628228-1-stondo@gmail.com>
References: <20261120135342.2628228-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250794
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Since 727ea2769c ("license: Remove tidy_licenses()"),
handle_license_vars() reads LICENSE from the extra values as a license
string. The npm handler still gives a set, so recipetool create stops
with "AttributeError: 'set' object has no attribute 'strip'" for each
npm package that has dependencies.

Join the sorted fallback licenses with " AND ". Also remove a line that
sorted a copy of the set and did not use the result.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 scripts/lib/recipetool/create_npm.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 10eca3c63e..5edf647176 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -283,10 +283,9 @@ class NpmRecipeHandler(RecipeHandler):
         (licfiles, packages, fallback_licenses) = self._handle_licenses(srctree, shrinkwrap_file, dev)
         licvalues = match_licenses(licfiles, srctree, d)
         split_pkg_licenses(licvalues, packages, lines_after, fallback_licenses)
-        fallback_licenses_flat = set(license for sublist in fallback_licenses.values() for license in sublist)
-        fallback_licesens_flat = sorted(fallback_licenses_flat).sort()
+        fallback_licenses_flat = sorted(set(license for sublist in fallback_licenses.values() for license in sublist))
         extravalues["LIC_FILES_CHKSUM"] = generate_common_licenses_chksums(fallback_licenses_flat, d)
-        extravalues["LICENSE"] = fallback_licenses_flat
+        extravalues["LICENSE"] = " AND ".join(fallback_licenses_flat)
 
         classes.append("npm")
         handled.append("buildsystem")
-- 
2.56.1

