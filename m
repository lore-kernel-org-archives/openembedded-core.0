Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id B5ADA7FDB1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:18 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id bd4so4646890plb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pPY31qSR6r6PrioBX4Nlcy8j62eWZMbSoMjOCDh4wlA=;
	b=KjvVH+/8g5GbgiyekQ9veFK75y6nhqwfiI3xtk8yWqrCS+ssJeJ/oz0u8GOAYDwddZ
	4Gek1qProC12O0SlbDGSYTA//X80ElaVdXIV5ibbpGWQ6Ro7qHxmkQnMjf6gUjXrFQnS
	e3PozakB3Hb/jy4iaH2E+l+LKScWK5y2SCzuvdtYh/sH8z4jneB9idQnn2kkKyUYfNVY
	liK9FdL+PznaPoblZS6Pf3usAz74hUkBeDM0sqFzJ/2yaXAYjoMlaenHkj1Nhpkmwman
	0m/LD2J8WHw+IkHgQKoFWGYGVZn8Mc0RE0I4R6znGFAbZ0T8DQsoyftn9DffPrjJ66P6
	LJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pPY31qSR6r6PrioBX4Nlcy8j62eWZMbSoMjOCDh4wlA=;
	b=jBnjHkYnH4b5X5aQM6MB/T9LIHAB9IZ6Kv3yEov0Um/M0y4iqYuUuQiOyfH8ZEJrsM
	5vSyY00eu7kJ2emkXa1X7PCk2s6OVtbHCFupkbYjYP8rekle6c9wiDprPmYjvFmvNVmI
	Aforx9z8UjN/3XBAXHw+BvjSKa+xRIbvFATYyWqOVspRRRgZbVui8lEt82SprirDUxrM
	edWF7IYFio0qsbH2nq7nXARjZCCaKvCA5VmVB6sO5jFElCEFXm1Pdkc6AQDuevkgmxNt
	qE2RmOLm9H2eUI8JUv6tfuQYvXfOLMjf3P1qpqiYCmx6qNMfirCflvIU6g20JLF5tTbu
	K32A==
X-Gm-Message-State: APjAAAVI1oHt9QmK6aAoGGH5zVYYnUd5M3nmSRzHIdgKHsIPGUI8YT90
	ra+Jge85EQouv13kWjAZpSC1brxP0kw=
X-Google-Smtp-Source: APXvYqwrO/zNNolva8y7dsV9RfVONIbpJ2W7GoJBo97nu3U/ANcu+N/broqMMfmwwfs1gunamge1Qw==
X-Received: by 2002:a17:902:9897:: with SMTP id
	s23mr16813280plp.193.1576512019520; 
	Mon, 16 Dec 2019 08:00:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 07:59:58 -0800
Message-Id: <72f44bef3867295f73f8b91e17294b2876447c89.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 08/18] cve-check: failure to parse versions should be more visible
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:18 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f87bcc9..1c8b222 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -222,7 +222,7 @@ def check_cves(d, patched_cves):
                             to_append_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
                             to_append_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_start, version_start, cve))
                             to_append_start = False
                     else:
@@ -233,7 +233,7 @@ def check_cves(d, patched_cves):
                             to_append_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
                             to_append_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_end, version_end, cve))
                             to_append_end = False
                     else:
-- 
2.7.4


