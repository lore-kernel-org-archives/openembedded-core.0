Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A6E5A7C705
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 11:59:12 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f65so2933684wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 03:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HQ7A0cXg+BAZB4vhGzKwuaegWRL6e41bFPeyJA2CWSg=;
	b=WhQo82LecbpwWqGG0vtr8+Fen9jIQDg0XZuz4LhYU5xhzP/2jKTq5xYp2HYXBkefWI
	gVsL7D8fAUYKd/BL/We1sBfVejKmIsnTsNLJJSnq2BkBm+uIFqOd89dUKnaZbMQGRaZM
	CBc4hoafs7vdIupyWWAIeltmxF9jit9uBOhS0o7wzIaOS0HvbwGO+R7SCzjsT82QUzcU
	jq1vDflwNTLbDgBuG8JtV2aUrIgxa7tvUCtYvRe6GPRyq6S/DD0GqNvQBOftDStMHOp9
	8ak67LEIAGez7VZ+TFhQe9CiYE2OVkSNNn5lXnZCcoZNvyNzZkYw4IWghvVPHpXrnXXZ
	01xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HQ7A0cXg+BAZB4vhGzKwuaegWRL6e41bFPeyJA2CWSg=;
	b=awhSKyWHY1cOzMHpU83qdg+x7CMqt3LTuae6qVF4+Myvak9/KN2d1qfFXwECJ6RBK1
	eKTCBUY5l1qAFqoE4MG90D/d7Z/G9SvBjCAt93xegW7ndJPQH3s6sKl3Y+AP/SsOYbji
	YJHSAUyAuBpuuhXfb0QUw+V9tfYKRA28U3d6U+EX/u+2wbu0nexHGL0s2tSSG/wosS93
	Xy4314cCZraOoN7GZSEpGQvh4IaHb+7u8A/gqufD7tKZ99LJHib5tCyL1THKBOyCxg2z
	ul5umj3uydCb0IocVMm6E3uuz78929iminybwYE/ChnQCNXyGZDmAuiOqayvfk4OtPM9
	n6rg==
X-Gm-Message-State: APjAAAWkZYAlyDmH14DR9FwxypjPkc3Y2Xn5G4Xo5+8KO1zaAUh2KL6J
	i9r1F8j95fvo2ga5+7yZTDIFZT24yg8=
X-Google-Smtp-Source: APXvYqwJvRcfmZze2UsQn1wfJBCtGE8eBLov4Y82WwTZYfOP2goPXJOWBXW91sNxhrrt9kI0CWGPmw==
X-Received: by 2002:a1c:9dcc:: with SMTP id g195mr11603533wme.9.1551700753097; 
	Mon, 04 Mar 2019 03:59:13 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i12sm8288921wrq.21.2019.03.04.03.59.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 03:59:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 11:58:35 +0000
Message-Id: <20190304115835.28288-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Mon, 04 Mar 2019 11:59:13 -0000

This isn't a git snapshot recipe but a release that is fetched over it.  For
clarity, put the PV in the filename.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.10.0.bb} | 1 -
 1 file changed, 1 deletion(-)
 rename meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.10.0.bb} (98%)

diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_0.10.0.bb
similarity index 98%
rename from meta/recipes-devtools/libcomps/libcomps_git.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.10.0.bb
index ff6820851fe..1c4f3bde65e 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.10.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Add-crc32.c-to-sources-list.patch \
            "
 
-PV = "0.1.10"
 SRCREV = "86a82fcd155c27092340d15a34f5c75c4da88243"
 
 S = "${WORKDIR}/git"
-- 
2.11.0


