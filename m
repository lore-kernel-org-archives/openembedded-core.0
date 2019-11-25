Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9547FBEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 12:05:13 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u18so15177223wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 04:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0C9qh5LUcue89ztsJsx6Ohq7Or51atESkI+ro7mde7U=;
	b=B9RUJVaGJknoK3CE44cLFHc+NCqhV2hZEHXWFwyvdB3hNvFFEzJJDFTRd4GJMSU6YV
	wmgV6fP3QC3I2ZvQnVbUBgzm79CckFopXEK8EfcyGEJ6/jGqM5+Odbvt69lb9zE9pTOR
	FJzhW+rOSC/4MQM83Gys2DZBW0zEu++nyi+6XkT/7qMUax+ZH35pmi5w1qqOvAaimItS
	3WQ8lu43e9PIfxqCltALfjy87bgnqoSppXbaUELM55wXjs8iG2GIdK6IPREAkeNoXnEP
	CvXL0c3QoUa4F2API4C3rXv4QVrXhWxEFfECCSwz3tApjfLQwRwilvdtLsdC5NxsDhDd
	LcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0C9qh5LUcue89ztsJsx6Ohq7Or51atESkI+ro7mde7U=;
	b=T5eYsT1Boa3ZyCUDsrcJesVmvHXfi3Abx396+1I5wLtrthraQoDQclNKJvXY+wBSc4
	0W8bzpwFHA924e2JwDkQ4x8phulQX1S7aUd6Suc7bvLFAEddRfUT4buIYonD+SclqPZ5
	Ng+FIe39evqLJGGNs2EqmkMbtDyaFPS9YkrZN0+KTltvu97KthvXmcQwjOlEiKIpnouY
	WSk3b/7XK1pf8hN8hTOZVBHDuhqXoxqrmcqZkZunU+wfVV4L7Nb71jKDv0g7HAtIp6eW
	X5UAjaP+rTZVJdyIZ+kC81+MoatD1jSH5cgEkhyscSaL/gFBEgfURfKwTbQpNweysYut
	WIjQ==
X-Gm-Message-State: APjAAAVcQ8v/HnfWUmOZEiChwpieDASkVS4leS8dUIyrursKgrpWA93R
	Qb94sniaFXaxG+tCiZnBbsO+YGcgwQU=
X-Google-Smtp-Source: APXvYqwLV/EFOHTZzu3azUvAQL8ExvLR59LIW+EoW5CkBr8UNrZNCMOZ6N4FLMYiP++JqDq0gQC7wQ==
X-Received: by 2002:a7b:c01a:: with SMTP id c26mr23925991wmb.160.1574683513915;
	Mon, 25 Nov 2019 04:05:13 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e16sm10227411wrj.80.2019.11.25.04.05.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 04:05:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 12:04:33 +0000
Message-Id: <20191125120435.5203-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191125120435.5203-1-ross.burton@intel.com>
References: <20191125120435.5203-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] packagegroup-core-self-hosted: remove intltool
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
X-List-Received-Date: Mon, 25 Nov 2019 12:05:13 -0000
Content-Transfer-Encoding: 8bit

Very little software needs intltool to build, and we don't need it on the host
to build Poky.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 0aab23e3e0d..7f40e56a19b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -75,7 +75,6 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     g++-symlinks \
     gcc \
     gcc-symlinks \
-    intltool \
     ldd \
     less \
     libstdc++ \
-- 
2.20.1


